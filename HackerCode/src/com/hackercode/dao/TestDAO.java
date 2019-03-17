package com.hackercode.dao;

import com.hackercode.structures.Question;

public interface TestDAO {
	public boolean saveQuestions(int testId, Question q);
	public String getTestData(int testIdentifier);
	public int makeAnswerSheet(String data);
}
