# SmartContractBasedExamSystem
Here's a `README.md` file for the provided Solidity smart contract that handles a Smart Contract-based Exam system:

---

# Smart Contract-based Exam System

This project implements a basic exam system using a Solidity smart contract. It allows a teacher to add questions and correct answers to an exam, and students can submit their answers to get automatically graded. Students can also view all the stored questions at once.

## Features

- **Teacher Functions:**
  - Add questions to the exam with correct answers.
  - Manage questions stored on the blockchain.

- **Student Functions:**
  - Submit answers for grading.
  - View their scores.
  - Retrieve all the exam questions at once.

## Contract Overview

### Structs

- **`Question`:** Represents a question in the exam. It contains:
  - `questionText`: The text of the question.
  - `correctAnswer`: The correct answer for the question.

### Mappings

- **`scores`:** Stores the scores of students, mapped by their address.

### Variables

- **`questions`:** An array of `Question` structs to store all the exam questions.
- **`teacher`:** The address of the teacher who deployed the contract.

### Functions

- **`addQuestion(string memory questionText, string memory correctAnswer) public onlyTeacher`:**
  - Adds a new question with the corresponding correct answer.
  - Can only be called by the teacher.

- **`submitAnswers(string[] memory answers) public`:**
  - Submits the student's answers for grading.
  - Compares the student's answers to the correct answers stored on the blockchain and calculates their score.

- **`getScore() public view returns (uint)`:**
  - Returns the score of the student calling the function.

- **`getAllQuestions() public view returns (string[] memory)`:**
  - Returns an array containing all the question texts in the exam.

## Prerequisites

- **Solidity:** The smart contract is written in Solidity (version `0.8.0` or above).
- **Ethereum Wallet:** To interact with the deployed contract, you'll need an Ethereum wallet like [MetaMask](https://metamask.io/).
- **Ethereum Testnet:** Deploy the contract on an Ethereum-compatible testnet like Rinkeby, Goerli, or Arbitrum testnet.

## Deployment and Usage Instructions

### 1. Deploy the Contract

1. **Open Remix IDE:**
   - Visit [Remix IDE](https://remix.ethereum.org/).
   - Create a new file named `Exam.sol` and paste the provided Solidity code.

2. **Compile the Contract:**
   - Navigate to the "Solidity Compiler" tab.
   - Choose compiler version `0.8.0` or higher.
   - Click "Compile Exam.sol".

3. **Deploy the Contract:**
   - Go to the "Deploy & Run Transactions" tab.
   - Select the `Exam` contract from the dropdown.
   - Ensure that the environment is set to "Injected Web3" to connect to MetaMask.
   - Click "Deploy" and confirm the transaction in MetaMask.

### 2. Add Questions (Teacher)

1. **Access the Deployed Contract:**
   - Once deployed, locate the contract's interface under the "Deployed Contracts" section.

2. **Add a Question:**
   - Use the `addQuestion` function to add a new question.
   - Input the question text and correct answer, then click "transact".

   Example:
   - `questionText`: "What is the time complexity of binary search?"
   - `correctAnswer`: "O(log n)"

### 3. Submit Answers (Students)

1. **Submit Answers:**
   - Students can submit their answers using the `submitAnswers` function.
   - Provide an array of answers corresponding to the questions, then click "transact".

   Example:
   - If there are 3 questions, submit the answers as: `["O(log n)", "Linked List", "3.5"]`.

2. **View Score:**
   - Students can view their score by calling the `getScore` function.

### 4. View All Questions

1. **Get All Questions:**
   - Students can view all the stored questions by calling the `getAllQuestions` function.
   - This returns an array of all the question texts.

## Example Usage

- The teacher deploys the contract and adds several questions.
- Students interact with the contract to view the questions, submit their answers, and view their scores.

## Security Considerations

- **Teacher Privileges:** Only the teacher (contract deployer) can add questions.
- **Answer Submission:** Students can only submit their answers once, and all questions must be answered.

## Conclusion

This Solidity smart contract provides a basic framework for an exam system on the blockchain. It is a simple yet effective way to demonstrate how decentralized exams can be implemented using smart contracts.

---

This `README.md` file provides a comprehensive guide on how to deploy, use, and understand the `Exam.sol` contract.
