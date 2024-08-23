// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Exam {
    struct Question {
        string questionText;
        string correctAnswer;
    }

    Question[] public questions;
    mapping(address => uint) public scores;
    address public teacher;

    constructor() {
        teacher = msg.sender;
    }

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only the teacher can perform this action.");
        _;
    }

    function addQuestion(string memory questionText, string memory correctAnswer) public onlyTeacher {
        questions.push(Question(questionText, correctAnswer));
    }

    function submitAnswers(string[] memory answers) public {
        require(answers.length == questions.length, "All questions must be answered.");

        uint score = 0;
        for (uint i = 0; i < answers.length; i++) {
            if (keccak256(abi.encodePacked(answers[i])) == keccak256(abi.encodePacked(questions[i].correctAnswer))) {
                score++;
            }
        }
        scores[msg.sender] = score;
    }

    function getScore() public view returns (uint) {
        return scores[msg.sender];
    }
    function getAllQuestions() public view returns (string[] memory) {
        string[] memory questionTexts = new string[](questions.length);

        for (uint i = 0; i < questions.length; i++) {
            questionTexts[i] = questions[i].questionText;
        }

        return questionTexts;
    }
}
