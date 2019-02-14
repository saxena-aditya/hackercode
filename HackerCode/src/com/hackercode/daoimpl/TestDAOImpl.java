package com.hackercode.daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import com.hackercode.constants.SQLQueries;
import com.hackercode.dao.TestDAO;
import com.hackercode.mappers.TestMapper;
import com.hackercode.structures.Admin;
import com.hackercode.structures.Question;
import com.hackercode.structures.Test;
import com.google.gson.*;

@Component
public class TestDAOImpl implements TestDAO{
	@Autowired
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate = new JdbcTemplate();
	
	public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	}
	public DataSource getDataSource() {
		return dataSource;
	}
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public boolean saveQuestions(int testId, Question q) {
		jdbcTemplate.setDataSource(getDataSource());
		
		String sql = "INSERT INTO hc_questions (q_test_id, q_set_id, q_tag, q_type," + 
		"q_content,q_max_marks, q_negative_marks, q_options, q_ans, q_scope ) VALUES (?,?,?,?,?,?,?,?,?,?)";
		try {
			jdbcTemplate.update(sql, new Object[] {testId, q.getQuestionSet(), q.getQuestionTag(), q.getQuestionType(),
				q.getQuestionContent(), q.getQuestionMaxMarks(), q.getQuestionNegMarks(), q.getQuestionOptions(),
				q.getQuestionAns(), "PUBLIC"});
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
		return true;
	}
	@Override
	public String getTestData(int testIdentifier) {
		jdbcTemplate.setDataSource(getDataSource());

		String sqlQuestions = "SELECT * FROM hc_questions WHERE q_test_id = ?";
		String sqlTest = "SELECT * FROM hc_tests WHERE t_id = ?";
		
		try {
			@SuppressWarnings("unchecked")
			Test test = (Test) jdbcTemplate.queryForObject(sqlTest, new Object[]{testIdentifier}, new TestMapper());
			List<Question> questions = jdbcTemplate.query(sqlQuestions, new Object[]{testIdentifier}, new ResultSetExtractor<List<Question>>(){
				@Override
				public List<Question> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Question> list = new ArrayList<Question>();
					while (rs.next()) {
						Question q = new Question();
						q.setQuestionId(rs.getInt(1));
						q.setTestId(rs.getInt(2));
						q.setQuestionSet(rs.getString(3));
						q.setQuestionTag(rs.getString(4));
						q.setQuestionType(rs.getString(5));
						q.setQuestionContent(rs.getString(6));
						q.setQuestionMaxMarks(rs.getInt(7));
						q.setQuestionNegMarks(rs.getInt(8));
						q.setQuestionOptions(rs.getString(9));
						q.setQuestionAns(rs.getString(10));
						list.add(q);
					}	
					return list;
				}
			});
			
			 System.out.println(test.getTestName());
				if (questions.size() != 0) {
					// questions found 
					JsonObject t = new JsonObject();
					t.addProperty("test_id", test.getTestID());
					t.addProperty("test_name",test.getTestName());
					t.addProperty("test_duration", test.getTestTotalTime());
					t.addProperty("start_time", test.getTestStartTime().toString());
					t.addProperty("end_time", test.getTestEndTime().toString());
					t.addProperty("test_admin", test.getTestAdmin());
					t.addProperty("is_time_strict", test.getTestIsTimeStrict());
					t.addProperty("is_ans_shuffle", test.getTestIsAnsShuffle());
					
					ArrayList<String> sets = new ArrayList<String>();
					
					// getting all the different sets;
					for(Question quest: questions){
						if (!sets.contains(quest.getQuestionSet())) {
							System.out.println("Adding: " + quest.getQuestionSet());
							sets.add(quest.getQuestionSet());
						}
					}
					System.out.println();
					//JsonObject s = null;
					JsonObject xx = new JsonObject();
					JsonObject ds = new JsonObject();
					for(int i = 0; i<sets.size(); i++) {
						//t = new JsonObject();
						JsonArray sx = null;
						sx = new JsonArray();
						 
						for(Question q: questions) {
							if (q.getQuestionSet().equalsIgnoreCase(sets.get(i))){
								JsonObject ss = new JsonObject();
								
								ss.addProperty("id", q.getQuestionId());
								ss.addProperty("tag", q.getQuestionTag());
								ss.addProperty("max_marks",q.getQuestionMaxMarks());
								ss.addProperty("neg_marks", q.getQuestionNegMarks());
								ss.addProperty("question", q.getQuestionContent());
								String[] array = q.getQuestionOptions().split(",");
								JsonArray xz = new JsonArray();
								
								for(int i1=0; i1<array.length; i1++)
									xz.add(array[i1]);

								ss.add("options", xz);
								JsonArray j = new JsonArray();
								j.add(q.getQuestionAns());
								ss.add("answer", j);
								//sx is array of questions specific to sets 
								sx.add(ss);
							}
						}	
						t.addProperty("total_sets", sets.size());
						JsonObject setQuestions = 	new JsonObject();
						setQuestions.add("questions", sx);
						xx.add(sets.get(i).toLowerCase(),setQuestions);
					}
					t.add("question_set",xx);
					return t.toString();
				}
				else  {
					// send no questions found error 
				}
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

}
