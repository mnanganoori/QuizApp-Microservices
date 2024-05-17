package com.quizproject.quizapp.service;

import com.quizproject.quizapp.dao.QuestionDAO;
import com.quizproject.quizapp.dao.QuizDAO;
import com.quizproject.quizapp.entity.Question;
import com.quizproject.quizapp.entity.QuestionWrapper;
import com.quizproject.quizapp.entity.Quiz;
import com.quizproject.quizapp.entity.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class QuizService {

    @Autowired
    QuizDAO quizDao;

    @Autowired
    QuestionDAO questionDAO;

    public ResponseEntity<String> createQuiz(String category, int numQ, String title){

        List<Question> questions = questionDAO.findRandomQuestionsByCategory(category, numQ);
        Quiz quiz = new Quiz();
        quiz.setTitle(title);
        quiz.setQuestions(questions);
        quizDao.save(quiz);
        return new ResponseEntity<>("Success",HttpStatus.CREATED);

    }

    public ResponseEntity<List<QuestionWrapper>> getQuestionsFromDB(Integer id) {
       Optional<Quiz> quiz =  quizDao.findById(id);
       List<Question> questionsFromDB = quiz.get().getQuestions();
       List<QuestionWrapper> questionToUser = new ArrayList<>();
       for(Question q: questionsFromDB){
           QuestionWrapper qw = new QuestionWrapper(q.getId(), q.getQuestion_title(), q.getOption1(),
                   q.getOption2(), q.getOption3(), q.getOption4());
           questionToUser.add(qw);
       }
       return new ResponseEntity<>(questionToUser, HttpStatus.OK);
    }


    public ResponseEntity<Integer> calculateResult(Integer id, List<Response> responses) {
        Optional<Quiz> quiz = quizDao.findById(id);
        List<Question> questions = quiz.get().getQuestions();
        int right = 0;
        int i=0;
        for(Response response: responses){
            if(response.getResponse().equals(questions.get(i).getRight_answer()))
                right++;
            i++;
        }
        return new ResponseEntity<>(right, HttpStatus.OK);
    }
}
