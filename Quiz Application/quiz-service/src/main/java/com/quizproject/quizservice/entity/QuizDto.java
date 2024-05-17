package com.quizproject.quizservice.entity;

import lombok.Data;

@Data
public class QuizDto {
    String categoryName;
    Integer numOfQuestions;
    String title;
}
