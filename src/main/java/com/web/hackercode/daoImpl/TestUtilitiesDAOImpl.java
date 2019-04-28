package com.web.hackercode.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import com.web.hackercode.dao.TestUtilitiesDAO;
import com.web.hackercode.structures.ProgramSpecificTests;
import com.web.hackercode.structures.TestUser;
import com.web.hackercode.structures.User;

@Component
public class TestUtilitiesDAOImpl implements TestUtilitiesDAO {
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
	//getting all finished tests
    
    public List < TestUser > getAllFinishedTest(User u) {
    	    
        jdbcTemplate.setDataSource(getDataSource());
        List < TestUser > finishedTest = null;
        System.out.print("USER ID " + u.getU_id());
        finishedTest = jdbcTemplate.query("SELECT * FROM hc_temp_test JOIN hc_tests WHERE hc_temp_test.tt_test_id = hc_tests.t_id  AND isFinished = 1 AND tt_user_id = " + u.getU_id(), 
        		new ResultSetExtractor < List < TestUser >> () {
        	public List < TestUser > extractData(ResultSet rs) throws SQLException, DataAccessException {
                List < TestUser > list = new ArrayList < TestUser > ();
                while (rs.next()) {
                    TestUser t = new TestUser();
                    t.setTestId(rs.getString("tt_test_id"));
                    t.setUserId(rs.getString("tt_user_id"));
                    //t.setTimeLeft(rs.getString(4));
                    t.setMarks(Integer.parseInt(rs.getString("marks")));
                    t.setMaxMarks(Integer.parseInt(rs.getString("tt_maxMarks")));
                    t.setTestName(rs.getString("t_name"));
                    list.add(t);
                }
                return list;
            }
        });
        System.out.println(finishedTest.toString());
        return finishedTest;
    }
    
//getting all test
    
    public List<ProgramSpecificTests> getAllTest(User user) {
        jdbcTemplate.setDataSource(getDataSource());
        
        List < ProgramSpecificTests > tests = null;
        // email is user-name.
        String username = user.getEmail();
        String GET_PROGRAM_SPECIFIC_TESTS = "select * from hc_tests JOIN hc_user_program JOIN hc_programs LEFT JOIN hc_temp_test ON hc_tests.t_id = hc_temp_test.tt_test_id where hc_tests.t_associated_program = hc_user_program.up_code and hc_programs.p_code = hc_tests.t_associated_program and hc_user_program.up_username = ? AND t_is_active = 1";
        
        tests = jdbcTemplate.query(GET_PROGRAM_SPECIFIC_TESTS, new Object[] {username}, new ResultSetExtractor < List < ProgramSpecificTests >> () {
            public List < ProgramSpecificTests > extractData(ResultSet rs) throws SQLException, DataAccessException {
                List < ProgramSpecificTests > list = new ArrayList < ProgramSpecificTests > ();
                while (rs.next()) {
                	ProgramSpecificTests t = new ProgramSpecificTests();
                    t.setTestId(rs.getString("t_id"));
                    t.setName(rs.getString("t_name"));
                    t.setCourseCode(rs.getString("t_associated_program"));
                    t.setCourseName(rs.getString("p_name"));
                    t.setStartTime(rs.getString("t_start_time"));
                    t.setEndTime(rs.getString("t_end_time"));
                    t.setTotalTime(rs.getInt("t_total_time"));
                    t.setIsTimeStrict(rs.getString("t_is_time_strict"));
                    
                    list.add(t);
                }
                return list;
            }
        });

        return tests;

    }
    
    // get all tests that can be resumed.
    public List<ProgramSpecificTests> getResumableTests(User user) {
    	  jdbcTemplate.setDataSource(getDataSource());
          
          List < ProgramSpecificTests > tests = null;
          // email is user-name.
          String username = user.getEmail();
          String GET_PROGRAM_SPECIFIC_TESTS = "select * from hc_temp_test JOIN hc_tests JOIN hc_user_program JOIN hc_programs where hc_tests.t_id = hc_temp_test.tt_test_id AND hc_tests.t_associated_program = hc_user_program.up_code and hc_programs.p_code = hc_tests.t_associated_program and hc_user_program.up_username = ? AND hc_temp_test.isFinished = 0 and hc_tests.t_is_active = 1";
          
          tests = jdbcTemplate.query(GET_PROGRAM_SPECIFIC_TESTS, new Object[] {username}, new ResultSetExtractor < List < ProgramSpecificTests >> () {
              public List < ProgramSpecificTests > extractData(ResultSet rs) throws SQLException, DataAccessException {
                  List < ProgramSpecificTests > list = new ArrayList < ProgramSpecificTests > ();
                  while (rs.next()) {
                  	ProgramSpecificTests t = new ProgramSpecificTests();
                      t.setTestId(rs.getString("t_id"));
                      t.setName(rs.getString("t_name"));
                      t.setCourseCode(rs.getString("t_associated_program"));
                      t.setCourseName(rs.getString("p_name"));
                      t.setStartTime(rs.getString("t_start_time"));
                      t.setEndTime(rs.getString("t_end_time"));
                      t.setTotalTime(rs.getInt("tt_time_remaining"));
                      t.setIsTimeStrict(rs.getString("t_is_time_strict"));
                      
                      list.add(t);
                  }
                  return list;
              }
          });

          return tests;

    }
}
