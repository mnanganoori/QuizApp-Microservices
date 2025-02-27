package com.quizproject.questionservice.controller;


import com.quizproject.questionservice.entity.Question;
import com.quizproject.questionservice.entity.QuestionWrapper;
import com.quizproject.questionservice.entity.Response;
import com.quizproject.questionservice.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("question")
public class QuestionController {

    @Autowired
    QuestionService questionService;
    @GetMapping("allQuestions")
    public ResponseEntity<List<Question>> getAllQuestions(){
        return questionService.getAllQuestions();
    }

    @GetMapping("category/{categoryName}")
    public ResponseEntity<List<Question>> getQuestionsByCategory(@PathVariable("categoryName") String category){
        return questionService.getQuestionsByCategory(category);
    }

    @PostMapping("add")
    public ResponseEntity<String> addQuestion(@RequestBody Question question){
        return  questionService.addQuestion(question);

    }

    @PutMapping("update")
    public ResponseEntity<String> updateQuestion(@RequestBody Question question){
        return  questionService.updateQuestion(question);

    }

    @DeleteMapping("delete")
    public ResponseEntity<String> deleteQuestion(@RequestBody Question question){
       return questionService.deleteQuestion(question);

    }

    //create or generate quiz
    @GetMapping("generate")
    public ResponseEntity<List<Integer>> getQuestionsForQuiz(@RequestParam String categoryName,
                                                             Integer numOfQuestions){
            return questionService.getQuestionsForQuiz(categoryName, numOfQuestions);
    }
    //get/give questions based on ID

    @PostMapping("getQuestions")
    public ResponseEntity<List<QuestionWrapper>> getQuestionsById(@RequestBody List<Integer> questionIds){
        return questionService.getQuestionsById(questionIds);
    }
    //get score

    @PostMapping("getscore")
    public ResponseEntity<Integer> getScore(@RequestBody List<Response> responses){
        return questionService.getScore(responses);
    }
}
