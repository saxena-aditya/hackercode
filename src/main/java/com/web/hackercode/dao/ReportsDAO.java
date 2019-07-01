package com.web.hackercode.dao;

import java.util.List;

import com.web.hackercode.structures.FinishedTest;
import com.web.hackercode.structures.Question;

public interface ReportsDAO {
	public FinishedTest getFinishedTestData(String testId, String userId);

	public List<Question> getReportCompatibleQuestions(List<Question> testQuestions, String ansData);

	public int incrementCounter();
}
