package com.quizproject.quizservice.feign;

import com.quizproject.quizservice.entity.QuestionWrapper;
import com.quizproject.quizservice.entity.Response;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient("QUESTION-SERVICE")
public interface QuizInterface {

    @GetMapping("question/generate")
    public ResponseEntity<List<Integer>> getQuestionsForQuiz(@RequestParam String categoryName,
                                                            @RequestParam Integer numOfQuestions);
    //get/give questions based on ID

    @PostMapping("question/getQuestions")
    public ResponseEntity<List<QuestionWrapper>> getQuestionsById(@RequestBody List<Integer> questionIds);
    //get score

    @PostMapping("question/getscore")
    public ResponseEntity<Integer> getScore(@RequestBody List<Response> responses);

}
