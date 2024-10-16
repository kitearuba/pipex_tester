
---

# 🧪 **Pipex Tester - Test Your Pipex Implementation** 🧪

![Pipex Tester](https://img.shields.io/badge/Pipex%20Tester-Project-blue?style=flat-square) ![C Programming](https://img.shields.io/badge/Language-C-green?style=flat-square) ![Shell Script](https://img.shields.io/badge/Script-Bash-yellow?style=flat-square) ![42 Network](https://img.shields.io/badge/42Network-Pipex%20Tester-lightblue?style=flat-square)

Welcome to the **Pipex Tester**! 🎉 This project is designed to **automate testing** for your **Pipex** implementation. It ensures your pipex program behaves correctly by running predefined test cases and comparing outputs with the expected results.

---

## 📑 **Table of Contents**Here's a colorful and visually appealing README for your **Pipex Tester** based on the style you provided for the **pipex** README:

---

# 🧪 **Pipex Tester - Test Your Pipex Implementation** 🧪

![Pipex Tester](https://img.shields.io/badge/Pipex%20Tester-Project-blue?style=flat-square) ![C Programming](https://img.shields.io/badge/Language-C-green?style=flat-square) ![Shell Script](https://img.shields.io/badge/Script-Bash-yellow?style=flat-square) ![42 Network](https://img.shields.io/badge/42Network-Pipex%20Tester-lightblue?style=flat-square)

Welcome to the **Pipex Tester**! 🎉 This project is designed to **automate testing** for your **Pipex** implementation. It ensures your pipex program behaves correctly by running predefined test cases and comparing outputs with the expected results.

---

## 📑 **Table of Contents**

1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Test Cases](#test-cases)
   - [Basic Tests](#basic-tests)
   - [Edge Case Tests](#edge-case-tests)
6. [Contributing](#contributing)
7. [Acknowledgements](#acknowledgements)
8. [Author](#author)

---

## 📖 **Introduction**

**Pipex Tester** is a shell script that runs several test cases to verify the correct behavior of your **pipex** program. Each test will check the **input**, **commands**, and **output** redirection to see if your implementation mimics the behavior of shell pipes (`|`) accurately.

This tester is a **lightweight, simple** tool to ensure your **pipex** passes all essential tests, including handling of standard commands, edge cases, and error handling.

---

## 📂 **Project Structure**

```bash
.
├── test_pipex.sh         # The shell script that runs the tests
├── input.txt             # Sample input file for testing
├── Makefile              # Makefile for your pipex project
├── output.txt            # Output file generated by the tests
└── README.md             # This README file
```

---

## 🛠️ **Installation**

To install and use the **Pipex Tester**, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone git@github.com:kitearuba/pipex-tester.git
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd pipex-tester
   ```

3. **Make Your `pipex` Executable**:
   Ensure that your **pipex** program is compiled and ready to be tested:
   ```bash
   make
   ```

---

## 💡 **Usage**

Once your **pipex** is compiled and the **tester** is in place, simply run the `test_pipex.sh` script:

```bash
./test_pipex.sh
```

The script will automatically execute multiple test cases and display whether each test passed or failed. It also generates output files and uses `diff` to compare them with expected results.

---

## 🔍 **Test Cases**

The **Pipex Tester** runs a variety of tests to ensure the correctness of your **pipex** implementation.

### ✅ **Basic Tests**
- **Test 1**: Executes `cat` followed by `wc -l`.
- **Test 2**: Executes `grep hello` followed by `wc -w`.
- **Test 3**: Handles empty input file with `cat` and `wc -c`.

### ❗ **Edge Case Tests**
- **Test 4**: Attempts to execute with a **non-existent file**, expecting an error.
- **Test 5**: Attempts to execute with an **invalid command**, expecting failure.
- **Test 6**: Handles multiple spaces and tabs in the input file.
- **Test 7**: Handles a **non-readable file** with permission denied.
- **Test 8**: Executes with a single word in the input file.

---

## 🔨 **How It Works**

1. **Automated Testing**: The script runs your **pipex** implementation and compares its output with the expected behavior.
2. **Clear Output**: Test results are shown in **color** (green for pass, red for fail), and any differences between actual and expected results are displayed.
3. **Edge Case Handling**: The script handles various edge cases, ensuring that your **pipex** properly handles invalid input, missing files, and permission errors.

---

## 🤝 **Contributing**

Contributions are welcome! If you'd like to improve this tester or add more test cases:

1. **Fork the Repository**.
2. **Create a Branch** (`git checkout -b feature/new-test-case`).
3. **Commit Your Changes** (`git commit -m 'Add new test case'`).
4. **Push to Your Branch** (`git push origin feature/new-test-case`).
5. **Open a Pull Request**.

---

## 🙌 **Acknowledgements**

Special thanks to the **42 Network** and the open-source community for the inspiration and tools provided to create this tester.

---

## 👨‍💻 **Author**

- **chrrodri**  
  [GitHub Profile](https://github.com/kitearuba)

---

## 🎉 **Final Thoughts**

With **Pipex Tester**, you can easily ensure your **pipex** implementation works as expected and handles edge cases properly. This script saves you time and helps you focus on perfecting your solution!

Happy testing! 🎉

---

### 🎨 **Enhancements for Visual Appeal**:

- Used **emojis** to make the sections more fun and easy to navigate.
- Applied **bold** and **code blocks** to highlight key sections and commands.
- Integrated **badges** to represent the technologies and the status of the project.

---

I hope this **README** will make your **Pipex Tester** more appealing and clear for users on GitHub! Let me know if you need further customization!

1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Test Cases](#test-cases)
   - [Basic Tests](#basic-tests)
   - [Edge Case Tests](#edge-case-tests)
6. [Contributing](#contributing)
7. [Acknowledgements](#acknowledgements)
8. [Author](#author)

---

## 📖 **Introduction**

**Pipex Tester** is a shell script that runs several test cases to verify the correct behavior of your **pipex** program. Each test will check the **input**, **commands**, and **output** redirection to see if your implementation mimics the behavior of shell pipes (`|`) accurately.

This tester is a **lightweight, simple** tool to ensure your **pipex** passes all essential tests, including handling of standard commands, edge cases, and error handling.

---

## 📂 **Project Structure**

```bash
.
├── test_pipex.sh         # The shell script that runs the tests
├── input.txt             # Sample input file for testing
├── Makefile              # Makefile for your pipex project
├── output.txt            # Output file generated by the tests
└── README.md             # This README file
```

---

## 🛠️ **Installation**

To install and use the **Pipex Tester**, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone git@github.com:kitearuba/pipex-tester.git
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd pipex-tester
   ```

3. **Make Your `pipex` Executable**:
   Ensure that your **pipex** program is compiled and ready to be tested:
   ```bash
   make
   ```

---

## 💡 **Usage**

Once your **pipex** is compiled and the **tester** is in place, simply run the `test_pipex.sh` script:

```bash
./test_pipex.sh
```

The script will automatically execute multiple test cases and display whether each test passed or failed. It also generates output files and uses `diff` to compare them with expected results.

---

## 🔍 **Test Cases**

The **Pipex Tester** runs a variety of tests to ensure the correctness of your **pipex** implementation.

### ✅ **Basic Tests**
- **Test 1**: Executes `cat` followed by `wc -l`.
- **Test 2**: Executes `grep hello` followed by `wc -w`.
- **Test 3**: Handles empty input file with `cat` and `wc -c`.

### ❗ **Edge Case Tests**
- **Test 4**: Attempts to execute with a **non-existent file**, expecting an error.
- **Test 5**: Attempts to execute with an **invalid command**, expecting failure.
- **Test 6**: Handles multiple spaces and tabs in the input file.
- **Test 7**: Handles a **non-readable file** with permission denied.
- **Test 8**: Executes with a single word in the input file.

---

## 🔨 **How It Works**

1. **Automated Testing**: The script runs your **pipex** implementation and compares its output with the expected behavior.
2. **Clear Output**: Test results are shown in **color** (green for pass, red for fail), and any differences between actual and expected results are displayed.
3. **Edge Case Handling**: The script handles various edge cases, ensuring that your **pipex** properly handles invalid input, missing files, and permission errors.

---

## 🤝 **Contributing**

Contributions are welcome! If you'd like to improve this tester or add more test cases:

1. **Fork the Repository**.
2. **Create a Branch** (`git checkout -b feature/new-test-case`).
3. **Commit Your Changes** (`git commit -m 'Add new test case'`).
4. **Push to Your Branch** (`git push origin feature/new-test-case`).
5. **Open a Pull Request**.

---

## 🙌 **Acknowledgements**

Special thanks to the **42 Network** and the open-source community for the inspiration and tools provided to create this tester.

---

## 👨‍💻 **Author**

- **chrrodri**  
  [GitHub Profile](https://github.com/kitearuba)

---

## 🎉 **Final Thoughts**

With **Pipex Tester**, you can easily ensure your **pipex** implementation works as expected and handles edge cases properly. This script saves you time and helps you focus on perfecting your solution!

Happy testing! 🎉

---
