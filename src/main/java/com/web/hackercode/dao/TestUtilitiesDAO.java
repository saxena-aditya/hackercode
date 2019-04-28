package com.web.hackercode.dao;

import java.util.List;

import com.web.hackercode.structures.ProgramSpecificTests;
import com.web.hackercode.structures.TestUser;
import com.web.hackercode.structures.User;

public interface TestUtilitiesDAO {
	public List<TestUser> getAllFinishedTest(User u);
	public List<ProgramSpecificTests> getAllTest(User u);


}
