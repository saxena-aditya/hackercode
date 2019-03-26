package com.hackercode.structures;

public class Question {
	private int questionId;
	/**
	 * @return the questionId
	 */
	public int getQuestionId() {
		return questionId;
	}
	/**
	 * @param questionId the questionId to set
	 */
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	private int testId;
	private String questionSet;
	private String questionTag;
	private String questionType;
	private String questionContent;
	private int questionMaxMarks;
	private int questionNegMarks;
	private String questionOptions;
	private String questionAns;
	private String questionScope;
	/**
	 * @return the testId
	 */
	public int getTestId() {
		return testId;
	}
	/**
	 * @param testId the testId to set
	 */
	public void setTestId(int testId) {
		this.testId = testId;
	}
	/**
	 * @return the questionSet
	 */
	public String getQuestionSet() {
		return questionSet;
	}
	/**
	 * @param questionSet the questionSet to set
	 */
	public void setQuestionSet(String questionSet) {
		this.questionSet = questionSet;
	}
	/**
	 * @return the questionTag
	 */
	public String getQuestionTag() {
		return questionTag;
	}
	/**
	 * @param questionTag the questionTag to set
	 */
	public void setQuestionTag(String questionTag) {
		this.questionTag = questionTag;
	}
	/**
	 * @return the questionType
	 */
	public String getQuestionType() {
		return questionType;
	}
	/**
	 * @param questionType the questionType to set
	 */
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	/**
	 * @return the questionContent
	 */
	public String getQuestionContent() {
		return questionContent;
	}
	/**
	 * @param questionContent the questionContent to set
	 */
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	/**
	 * @return the questionMaxMarks
	 */
	public int getQuestionMaxMarks() {
		return questionMaxMarks;
	}
	/**
	 * @param questionMaxMarks the questionMaxMarks to set
	 */
	public void setQuestionMaxMarks(int questionMaxMarks) {
		this.questionMaxMarks = questionMaxMarks;
	}
	/**
	 * @return the questionNegMarks
	 */
	public int getQuestionNegMarks() {
		return questionNegMarks;
	}
	/**
	 * @param questionNegMarks the questionNegMarks to set
	 */
	public void setQuestionNegMarks(int questionNegMarks) {
		this.questionNegMarks = questionNegMarks;
	}
	/**
	 * @return the questionOptions
	 */
	public String getQuestionOptions() {
		return questionOptions;
	}
	/**
	 * @param questionOptions the questionOptions to set
	 */
	public void setQuestionOptions(String questionOptions) {
		this.questionOptions = questionOptions;
	}
	/**
	 * @return the questionAns
	 */
	public String getQuestionAns() {
		return questionAns;
	}
	/**
	 * @param questionAns the questionAns to set
	 */
	public void setQuestionAns(String questionAns) {
		this.questionAns = questionAns;
	}
	/**
	 * @return the questionScope
	 */
	public String getQuestionScope() {
		return questionScope;
	}
	/**
	 * @param questionScope the questionScope to set
	 */
	public void setQuestionScope(String questionScope) {
		this.questionScope = questionScope;
	}
	
	public String toString() {
		return 	testId + " " +questionId + " "+questionSet + " " +questionTag+" "+ questionType + " " + questionContent + " "+questionMaxMarks+" "+questionNegMarks
		 +" "+questionOptions
		+" "+ questionAns
		+ questionScope;
	}
	
}
