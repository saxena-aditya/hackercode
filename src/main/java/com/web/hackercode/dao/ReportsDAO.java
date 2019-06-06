package com.web.hackercode.dao;

import java.util.List;

import com.web.hackercode.structures.FinishedTest;
import com.web.hackercode.structures.Question;

public interface ReportsDAO {
	FinishedTest getFinishedTestData(String testId, String userId);
	List<Question> getReportCompatibleQuestions(List<Question> testQuestions, String ansData);
	int incrementCounter();
}
