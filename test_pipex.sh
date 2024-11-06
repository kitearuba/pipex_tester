#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
MAGENTA='\033[1;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Variables for tracking test results
total_tests=0
passed_tests=0
failed_tests=0
valgrind_total_tests=0
valgrind_passed_tests=0
valgrind_failed_tests=0

# Colorful Header with "chrrodri"
echo -e "${MAGENTA}"
echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                                                                       ║"

# "CHRRODRI" in one line, centered, and in one color (cyan)
echo -e "${CYAN}"  # Cyan for the entire text
cat << "EOF"
      ██████  ██   ██ ██████  ██████   ██████   ██████   ██████  ██
     ██    ██ ██   ██ ██   █  ██   █  ██    ██  ██   ██  ██   █  ██
     ██       ███████ ██████  ██████  ██    ██  ██   ██  ██████  ██
     ██    ██ ██   ██ ██ ██   ██ ██   ██    ██  ██   ██  ██ ██   ██
      ██████  ██   ██ ██  ██  ██  ██   ██████   ██████   ██  ██  ██
EOF

# Bottom border in Magenta
echo -e "${MAGENTA}"
echo "║                                                                       ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"

# Reset color to default
echo -e "${NC}"

# Section divider function for tests
divider() {
    echo -e "${YELLOW}-------------------------------------------------------------${NC}"
}

# Function to execute a test case and compare output
run_test() {
    ((total_tests++))
    local test_name="$1"
    local pipex_cmd="$2"
    local shell_cmd="$3"
    local output_file="$4"
    local shell_output_file="$5"

    echo "Running ${test_name}..."
    eval "${pipex_cmd}"
    eval "${shell_cmd}"

    if diff "${output_file}" "${shell_output_file}" > /dev/null; then
        echo -e "${GREEN}${test_name} passed.${NC}"
        ((passed_tests++))
    else
        echo -e "${RED}${test_name} failed.${NC}"
        diff "${output_file}" "${shell_output_file}"
        ((failed_tests++))
    fi
    divider
}

# Function for expected failure tests
expected_fail_test() {
    ((total_tests++))
    local test_name="$1"
    local pipex_cmd="$2"

    echo "Running ${test_name}..."
    if eval "${pipex_cmd}" 2>/dev/null; then
        echo -e "${RED}${test_name} failed (expected failure).${NC}"
        ((failed_tests++))
    else
        echo -e "${GREEN}${test_name} passed (correct failure).${NC}"
        ((passed_tests++))
    fi
    divider
}

# Separate function for Test 5 to handle invalid command case as a unique pass/fail
test_invalid_command() {
    ((total_tests++))
    local test_name="Test 5: invalid command and wc"
    local pipex_cmd='./pipex input.txt "invalid cmd" "wc" output5.txt'

    echo "Running ${test_name}..."
    if eval "${pipex_cmd}" 2>/dev/null; then
        echo -e "${GREEN}${test_name} passed (expected failure with non valid cmd).${NC}"
       ((passed_tests++))
    else
        echo -e "${RED}${test_name} failed (Non valid cmd should not be valid).${NC}"
        ((failed_tests++))
    fi
    divider
}

# Function to execute a Valgrind test case
run_valgrind_test() {
    ((valgrind_total_tests++))
    local test_name="$1"
    local valgrind_cmd="$2"

    echo "Running ${test_name} with Valgrind..."
    if eval "${valgrind_cmd}" 2>&1 | grep -q "ERROR SUMMARY: 0 errors"; then
        echo -e "${GREEN}${test_name} passed (no memory leaks).${NC}"
        ((valgrind_passed_tests++))
    else
        echo -e "${RED}${test_name} failed (memory leaks detected).${NC}"
        ((valgrind_failed_tests++))
    fi
    divider
}

divider

# Ensure input files exist for tests
echo "hello world" > input.txt
echo "hello      world    pipex" > input6.txt
echo "singleword" > input8.txt
touch empty.txt  # Create empty.txt to fix Test 3

# Test cases
run_test "Test 1: cat and wc -l" \
    './pipex input.txt "cat" "wc -l" output1.txt' \
    '< input.txt cat | wc -l > shell_output1.txt' \
    "output1.txt" "shell_output1.txt"

run_test "Test 2: grep hello and wc -w" \
    './pipex input.txt "grep hello" "wc -w" output2.txt' \
    '< input.txt grep hello | wc -w > shell_output2.txt' \
    "output2.txt" "shell_output2.txt"

run_test "Test 3: empty.txt with cat and wc -c" \
    './pipex empty.txt "cat" "wc -c" output3.txt' \
    '< empty.txt cat | wc -c > shell_output3.txt' \
    "output3.txt" "shell_output3.txt"

expected_fail_test "Test 4: nonexistent.txt with cat and wc" \
    './pipex nonexistent.txt "cat" "wc" output4.txt'

# Run Test 5 using the dedicated function for invalid command handling
test_invalid_command

run_test "Test 6: multiple spaces and tabs between words" \
    './pipex input6.txt "grep hello" "wc -w" output6.txt' \
    '< input6.txt grep hello | wc -w > shell_output6.txt' \
    "output6.txt" "shell_output6.txt"

expected_fail_test "Test 7: cat with non-readable file (permission denied)" \
    './pipex restricted.txt "cat" "wc -c" output7.txt'

run_test "Test 8: single word in input file" \
    './pipex input8.txt "cat" "wc -w" output8.txt' \
    '< input8.txt cat | wc -w > shell_output8.txt' \
    "output8.txt" "shell_output8.txt"

# Additional Valgrind Tests
run_valgrind_test "Valgrind Test 1: Basic cat and wc -l" \
    'valgrind --leak-check=full ./pipex input.txt "cat" "wc -l" output_valgrind1.txt'

run_valgrind_test "Valgrind Test 2: nonexistent input file" \
    'valgrind --leak-check=full ./pipex nonexistent.txt "cat" "wc -l" output_valgrind2.txt'

run_valgrind_test "Valgrind Test 3: invalid command" \
    'valgrind --leak-check=full ./pipex input.txt "invalidcmd" "wc" output_valgrind3.txt'

run_valgrind_test "Valgrind Test 4: empty input file" \
    'valgrind --leak-check=full ./pipex empty.txt "cat" "wc -c" output_valgrind4.txt'

divider

# Summary of results
echo -e "${CYAN}===================="
echo -e "  TEST RESULTS"
echo -e "====================${NC}"
echo -e "${GREEN}Passed tests: ${passed_tests}/${total_tests}${NC}"
echo -e "${RED}Failed tests: ${failed_tests}/${total_tests}${NC}"
echo -e "${CYAN}====================${NC}"

# Summary of Valgrind results
echo -e "${CYAN}===================="
echo -e " VALGRIND RESULTS"
echo -e "====================${NC}"
echo -e "${GREEN}Valgrind Passed tests: ${valgrind_passed_tests}/${valgrind_total_tests}${NC}"
echo -e "${RED}Valgrind Failed tests: ${valgrind_failed_tests}/${valgrind_total_tests}${NC}"
echo -e "${CYAN}====================${NC}"

# Clean up
rm -f output*.txt shell_output*.txt input6.txt input8.txt restricted.txt empty.txt
