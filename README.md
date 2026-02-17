# 🧠 Compiler Lexer Implementation using JFlex

## 📌 Overview

This project implements the lexical analysis phase of a compiler as part of a Compiler Design course.

The lexer is built using **JFlex** and is responsible for recognizing and categorizing input tokens such as:

- Identifiers
- Keywords
- Operators
- Separators
- Numeric literals (multiple types)

The program reads an input file and prints tokens in the specified formatted output.

---

## 🛠 Technologies Used

- Java
- JFlex (Lexical Analyzer Generator)

---

## 📂 Project Structure

```
compiler-lexer-jflex/
├──docs/
│ └── report.pdf
├── src/
│ ├── Parser.flex # JFlex specification file
│ ├── Parser.java # Generated lexer (from JFlex)
│ └── test.txt # Sample input file
└── README.md
```
---


## ⚙️ How It Works

### 1️⃣ Token Recognition

The `Parser.flex` file defines regular expressions for:

- Keywords
- Operators
- Separators
- Identifiers
- Numeric constants

Each matched token is printed in a formatted structure defined in the project requirements.

---

## ▶️ How to Run

### Step 1: Generate Java file using JFlex

Run JFlex on the specification file: `jflex Parser.flex`

This generates: `Parser.java`


---

### Step 2: Compile the generated file

`javac Parser.java`

This creates: `Parser.class`


---

### Step 3: Execute with input file

Place `test.txt` in the same directory and run: `java Parser test.txt`


The output tokens will be printed to the console.

---

## 📌 Features

- Pattern-based token recognition
- Structured token output
- Modular lexical rule definitions
- Clean separation between specification and generated code

---

## 🎯 Academic Context

This project demonstrates:

- Practical implementation of lexical analysis
- Usage of lexical analyzer generators
- Regular expression–based tokenization
- Foundations of compiler front-end design

---

## 📄 Notes

- `Parser.java` is generated automatically from `Parser.flex`
- The `.class` file is not included in the repository
- IDE configuration files are excluded via `.gitignore`

---

## 🔒 License

This project is provided for educational purposes. You may reuse or modify the code with proper attribution.

---

