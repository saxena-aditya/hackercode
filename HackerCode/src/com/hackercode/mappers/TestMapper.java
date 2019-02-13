package com.hackercode.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.hackercode.structures.Test;

public class TestMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		Test test = new Test();
		test.setTestID(rs.getInt("t_id"));
		test.setTestName(rs.getString("t_name"));
		test.setTestAdmin(rs.getString("t_user_id"));
		test.setTestCode(rs.getString("t_test_code"));
		test.setTestStartTime(rs.getTimestamp("t_start_time"));
		test.setTestEndTime(rs.getTimestamp("t_end_time"));
		test.setTestTotalTime(rs.getInt("t_total_time"));
		test.setTestIsTimeStrict(rs.getString("t_is_time_strict"));
		test.setTestIsAnsShuffle(rs.getString("t_is_ans_shuffle"));
	
		return test;
	}

}
