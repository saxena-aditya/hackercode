package com.hackercode.daoimpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.hackercode.constants.SQLQueries;
import com.hackercode.dao.TestDAO;
import com.hackercode.mappers.TestMapper;
import com.hackercode.mappers.UserMapper;
import com.hackercode.structures.Admin;
import com.hackercode.structures.Question;
import com.hackercode.structures.Test;
import com.hackercode.structures.User;
import com.hackercode.structures.TestData;
import com.hackercode.structures.TestInfoFromClient;
import com.hackercode.structures.TestUser;
import com.google.gson.*;

@Component
public class TestDAOImpl implements TestDAO {
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
 public static String getMd5(String input) {
  try {

   // Static getInstance method is called with hashing MD5 
   MessageDigest md = MessageDigest.getInstance("MD5");

   // digest() method is called to calculate message digest 
   //  of an input digest() return array of byte 
   byte[] messageDigest = md.digest(input.getBytes());

   // Convert byte array into signum representation 
   BigInteger no = new BigInteger(1, messageDigest);

   // Convert message digest into hex value 
   String hashtext = no.toString(16);
   while (hashtext.length() < 32) {
    hashtext = "0" + hashtext;
   }
   return hashtext;
  }

  // For specifying wrong message digest algorithms 
  catch (NoSuchAlgorithmException e) {
   throw new RuntimeException(e);
  }
 }


 @Override
 public boolean isUser(String username, String password, HttpServletRequest request) {
  //if (!(boolean) request.getSession().getAttribute("isLoggedIn")) {
  jdbcTemplate.setDataSource(getDataSource());
  String IS_USER = "SELECT COUNT(*) FROM hc_user WHERE BINARY u_username = ? AND BINARY u_password = ?";
  System.out.println(IS_USER);
  System.out.println(username + "  " + getMd5(password));

  try {
   Number count = jdbcTemplate.queryForObject(IS_USER, Integer.class, username, getMd5(password));
   System.out.println("data: " + count.intValue());
   if (count.intValue() != 1) return false;
   else {
    request.getSession().setAttribute("isLoggedIn", true);
    return true;
   }

  } catch (Exception e) {
   System.out.println(e.getMessage());
  }
  System.out.println("done!");
  //}
  //else {
  // login with saved user.
  //}
  return false;
 }



 @Override
 public User getUser(String username, HttpServletRequest request) {
  jdbcTemplate.setDataSource(getDataSource());
  String GET_USER = "SELECT * FROM hc_user_details WHERE BINARY ud_username = ?";
  try {
   User user = (User) jdbcTemplate.queryForObject(
    GET_USER, new Object[] {
     username
    },
    new UserMapper());
   request.getSession().setAttribute("user", user);
   return user;
  } catch (Exception e) {
   System.out.println(e.getMessage());
  }

  return null;
 }

 @Override
 public int getUserWithEmail(String email, HttpServletRequest request) {
  jdbcTemplate.setDataSource(getDataSource());
  String GET_USER = "SELECT * FROM hc_user_details WHERE BINARY ud_email = ?";
  try {
   User user = (User) jdbcTemplate.queryForObject(
    GET_USER, new Object[] {
     email
    },
    new UserMapper());
   request.getSession().setAttribute("user", user);
   System.out.println("FOUND USER "+user);
   return 1;
  } catch (Exception e) {
   System.out.println("ERRRRRRRRRR"+e.getMessage());
   return 0;
  }
 }



 @Override
 public boolean saveFile(int testId, MultipartFile file) throws IOException {

  String LOCATION = "";
  System.out.println(file.getName());
  InputStream in = file.getInputStream();
  File currdir = new File("D:/HackerCode/HackerCode/file-data/");
  String path = currdir.getAbsolutePath();
  LOCATION = path.substring(0, path.length()) + "\\" + file.getOriginalFilename();
  FileOutputStream f = new FileOutputStream(LOCATION);
  int ch = 0;
  // add try,catch and finally bolcks to copy the file
  while ((ch = in .read()) != -1) {
   f.write(ch);
  }

  System.out.println(LOCATION);
  f.flush();
  f.close();

  Workbook workbook = WorkbookFactory.create(new File(LOCATION));
  for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
   Sheet sheet = workbook.getSheetAt(i);
   DataFormatter dm = new DataFormatter();
   Iterator < Row > rowIterator = sheet.rowIterator();
   while (rowIterator.hasNext()) {
    Row row = rowIterator.next();
    if (row.getRowNum() == 0) continue;
    else {
     Question q = new Question();
     q.setQuestionSet(dm.formatCellValue(row.getCell(0)));
     q.setQuestionTag(dm.formatCellValue(row.getCell(1)));
     q.setQuestionType(dm.formatCellValue(row.getCell(2)));
     q.setQuestionContent(dm.formatCellValue(row.getCell(3)));
     q.setQuestionMaxMarks(Integer.parseInt(dm.formatCellValue(row.getCell(4))));
     q.setQuestionNegMarks(Integer.parseInt(dm.formatCellValue(row.getCell(5))));
     q.setQuestionOptions(dm.formatCellValue(row.getCell(6)));
     q.setQuestionAns(dm.formatCellValue(row.getCell(7)));
     saveQuestions(testId, q);
    }
   }
  }

  workbook.close();

  return true;
 }
 @Override
 public boolean saveTest(Test test) throws IOException {
  String startTime, endTime;
  Timestamp start, end;
  jdbcTemplate.setDataSource(getDataSource());

  String sql = "INSERT INTO hc_tests (t_name, t_user_id, t_test_code,t_test_password," +
   "t_start_time, t_end_time, t_total_time,t_is_time_strict, t_is_ans_shuffle) VALUES(?,?,?,?,?,?,?,?,?)";
  try {
   startTime = test.getStartTime();
   endTime = test.getEndTime();

   if (StringUtils.countMatches(startTime, ":") == 1) startTime += ":00";
   if (StringUtils.countMatches(endTime, ":") == 1) endTime += ":00";
   System.out.println(test.toString());
   start = Timestamp.valueOf(startTime.replace("T", " "));
   end = Timestamp.valueOf(endTime.replace("T", " "));
   // saving test data.
   jdbcTemplate.update(sql, new Object[] {
    test.getName(), test.getAdmin(), test.getCode(), test.getPassword(),
     start, end, test.getTotalTime(), test.getIsTimeStrict(), test.getIsAnsShuffle()
   });
   String GET_TEST_CODE = "SELECT t_id FROM hc_tests WHERE t_test_code = ?";
   Number testId = jdbcTemplate.queryForObject(GET_TEST_CODE, Integer.class, test.getCode());

   if (saveFile(testId.intValue(), test.getFile())) return true;
   else return false;
  } catch (Exception e) {
   System.out.println(e.getMessage());
  }

  return false;
 }
 @Override
 public boolean saveQuestions(int testId, Question q) {
  jdbcTemplate.setDataSource(getDataSource());

  String sql = "INSERT INTO hc_questions (q_test_id, q_set_id, q_tag, q_type," +
   "q_content,q_max_marks, q_negative_marks, q_options, q_ans, q_scope ) VALUES (?,?,?,?,?,?,?,?,?,?)";
  try {
   jdbcTemplate.update(sql, new Object[] {
    testId,
    q.getQuestionSet(),
    q.getQuestionTag(),
    q.getQuestionType(),
    q.getQuestionContent(),
    q.getQuestionMaxMarks(),
    q.getQuestionNegMarks(),
    q.getQuestionOptions(),
    q.getQuestionAns(),
    "PUBLIC"
   });
  } catch (Exception e) {
   System.out.println(e.getMessage());
  }
  return true;
 }

 @Override
 public String getTestData(int testIdentifier, String test_id, String user_id) {
  jdbcTemplate.setDataSource(getDataSource());

  String sqlQuestions = "SELECT * FROM hc_questions WHERE q_test_id = ?";
  String sqlTest = "SELECT * FROM hc_tests WHERE t_id = ?";
  Gson gson = new GsonBuilder().create();

  //for checking if there is any data for test already present
  List < TestUser > users_test = jdbcTemplate.query("SELECT * from hc_temp_test WHERE tt_user_id = ? AND tt_test_id = ? ", new Object[] {
    user_id,
    test_id
   },
   new ResultSetExtractor < List < TestUser >> () {
    public List < TestUser > extractData(ResultSet rs) throws SQLException, DataAccessException {
     List < TestUser > list = new ArrayList < TestUser > ();
     while (rs.next()) {
      TestUser u = new TestUser();
      u.setUserId(rs.getString("tt_user_id"));
      u.setTestId(rs.getString("tt_test_id"));
      u.setData(rs.getString("tt_ans_object"));
      u.setTimeLeft(rs.getString("tt_time_remaining"));
      list.add(u);
     }
     return list;
    }
   });

  System.out.println("LENTH OF ARRAY KLIST IN USERS" + users_test.size());

  //for creating the response json object for test
  try {
   @SuppressWarnings("unchecked")
   Test test = (Test) jdbcTemplate.queryForObject(sqlTest, new Object[] {
    testIdentifier
   }, new TestMapper());
   List < Question > questions = jdbcTemplate.query(sqlQuestions, new Object[] {
    testIdentifier
   }, new ResultSetExtractor < List < Question >> () {
    @Override
    public List < Question > extractData(ResultSet rs) throws SQLException, DataAccessException {
     List < Question > list = new ArrayList < Question > ();
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

   System.out.println(test.getName());
   if (questions.size() != 0) {
    // questions found 
    JsonObject t = new JsonObject();
    t.addProperty("test_id", test.getTestId());
    t.addProperty("test_name", test.getName());
    t.addProperty("test_duration", test.getTotalTime());
    t.addProperty("start_time", test.getStartTime().toString());
    t.addProperty("end_time", test.getEndTime().toString());
    t.addProperty("test_admin", test.getAdmin());
    t.addProperty("is_time_strict", test.getIsTimeStrict());
    t.addProperty("is_ans_shuffle", test.getIsAnsShuffle());

    ArrayList < String > sets = new ArrayList < String > ();

    // getting all the different sets;
    for (Question quest: questions) {
     if (!sets.contains(quest.getQuestionSet())) {
      System.out.println("Adding: " + quest.getQuestionSet());
      sets.add(quest.getQuestionSet());
     }
    }
    System.out.println();
    //JsonObject s = null;
    JsonObject xx = new JsonObject();
    JsonObject ds = new JsonObject();
    for (int i = 0; i < sets.size(); i++) {
     //t = new JsonObject();
     JsonArray sx = null;
     sx = new JsonArray();

     for (Question q: questions) {
      if (q.getQuestionSet().equalsIgnoreCase(sets.get(i))) {
       JsonObject ss = new JsonObject();

       ss.addProperty("id", q.getQuestionId());
       ss.addProperty("tag", q.getQuestionTag());
       ss.addProperty("max_marks", q.getQuestionMaxMarks());
       ss.addProperty("neg_marks", q.getQuestionNegMarks());
       ss.addProperty("question", q.getQuestionContent());
       ss.addProperty("status", "normal");

       String[] array = q.getQuestionOptions().split(",");
       JsonArray xz = new JsonArray();

       for (int i1 = 0; i1 < array.length; i1++)
        xz.add(array[i1]);

       ss.add("options", xz);
       JsonArray j = new JsonArray();
       j.add(q.getQuestionAns());
       //ss.add("answer", j);
       //sx is array of questions specific to sets 
       sx.add(ss);
      }
     }
     t.addProperty("total_sets", sets.size());
     JsonObject setQuestions = new JsonObject();
     setQuestions.add("questions", sx);
     xx.add(sets.get(i).toLowerCase(), setQuestions);
    }
    t.add("question_set", xx);
    //if previous data was present
    if (users_test.size() > 0) {
     for (TestUser user: users_test) {
      String s = gson.toJson(user);
      JsonObject p = new JsonObject();
      p.addProperty("timeLeft", user.getTimeLeft());
      p.add("data", (new JsonParser()).parse(user.getData()).getAsJsonObject());
      t.add("previous_data", p);

     }
    }
    return t.toString();
   } else {
    // send no questions found error 
   }

  } catch (Exception e) {
   System.out.println(e.getMessage());
  }
  return null;
 }

 @Override
 public String getStoredTestData(String data) {
  System.out.println("GET STORED TEST DATA INVOKED");
  jdbcTemplate.setDataSource(getDataSource());
  String jsonData = "";
  Gson gson = new GsonBuilder().create();
  JsonObject job = gson.fromJson(data, JsonObject.class);
  JsonObject ovl = job.getAsJsonObject("user");

  TestUser user = new TestUser();
  System.out.println(ovl.toString());
  user.setTestId(ovl.get("testId").getAsString());
  user.setUserId(ovl.get("userId").getAsString());
  user.setTimeLeft(ovl.get("timeLeft").getAsString());
  user.setData(ovl.get("data").getAsString());


  System.out.println("USER DATA FROM SERVER" + user);
  String user_id = user.getUserId();
  String test_id = user.getTestId();
  List < TestUser > users_test = jdbcTemplate.query("SELECT * from hc_temp_test WHERE tt_user_id = ? AND tt_test_id = ? ", new Object[] {
    user_id,
    test_id
   },
   new ResultSetExtractor < List < TestUser >> () {
    public List < TestUser > extractData(ResultSet rs) throws SQLException, DataAccessException {
     List < TestUser > list = new ArrayList < TestUser > ();
     while (rs.next()) {
      TestUser u = new TestUser();
      u.setUserId(rs.getString("tt_user_id"));
      u.setTestId(rs.getString("tt_test_id"));
      u.setData(rs.getString("tt_ans_object"));
      u.setTimeLeft(rs.getString("tt_time_remaining"));
      list.add(u);
     }
     return list;
    }
   });

  System.out.println("LENTH OF ARRAY KLIST IN USERS" + users_test.size());
  //first time
  if (users_test.size() == 0) {
   String sql = "INSERT INTO hc_temp_test(tt_user_id, tt_test_id, tt_time_remaining ,tt_ans_object) VALUES (?,?,?,?)";
   try {
    jdbcTemplate.update(sql, new Object[] {
     user.getUserId().toString(), user.getTestId().toString(), user.getTimeLeft().toString(), user.getData().toString(),
    });
   } catch (Exception e) {
    System.out.println(e.getMessage());
   }
  } else {
   for (TestUser u: users_test) {
    System.out.println("DATA BEFORE ADDING TO DB" + user.getData().length());
    System.out.println("FIRST TIMER USER IS AVAILABLE");
    String sql = "UPDATE hc_temp_test SET tt_ans_object = ? , tt_time_remaining = ? WHERE tt_user_id = ? AND tt_test_id = ?";
    try {
     jdbcTemplate.update(sql, new Object[] {
      user.getData().toString(), user.getTimeLeft().toString(), user.getUserId().toString(), user.getTestId().toString()
     });
    } catch (Exception e) {
     System.out.println(e.getMessage());
    }
    System.out.println("DATA AFter ADDING TO DB" + user.getData());
   }
  }
  return " ";
 }




 @Override
 public JsonObject makeAnswerSheet(String data) {
  jdbcTemplate.setDataSource(getDataSource());
  JsonObject res = new JsonObject(); // result object 		
  int result = 0;

  //getting the json data from the client
  Gson gson = new GsonBuilder().create();
  JsonObject job = gson.fromJson(data, JsonObject.class);
  System.out.println("job" + job);
  JsonObject ovl = job.getAsJsonObject("test-data");
  System.out.println(ovl);
  Set < Map.Entry < String, JsonElement >> entries = ovl.entrySet(); //will return members of your object
  ArrayList < TestData > testStore = new ArrayList();
  for (Map.Entry < String, JsonElement > entry: entries) {
   System.out.println("KEY >>>>" + entry.getKey());
   JsonObject temp = ovl.getAsJsonObject(entry.getKey());
   TestData tmp = gson.fromJson(temp, TestData.class);
   testStore.add(tmp);
  }
  //test-info
  JsonObject testInfo = job.getAsJsonObject("test-info");
  TestInfoFromClient testData = gson.fromJson(testInfo, TestInfoFromClient.class);
  String testIdentifier = testData.getId();
  List < Question > questions = jdbcTemplate.query("SELECT * FROM hc_questions WHERE q_test_id = ?", new Object[] {
   testIdentifier
  }, new ResultSetExtractor < List < Question >> () {
   public List < Question > extractData(ResultSet rs) throws SQLException, DataAccessException {
    List < Question > list = new ArrayList < Question > ();
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
  for (Question q: questions) {
   for (Map.Entry < String, JsonElement > entry: entries) {
    JsonObject temp = ovl.getAsJsonObject(entry.getKey());
    String k = entry.getKey().toString();
    if (k.equals(Integer.toString(q.getQuestionId()))) {
     TestData tmp = gson.fromJson(temp, TestData.class);

     if (tmp.getAnswer() != null) {
      if (tmp.getStatus().equals("skipped")) {
       break; //not attempted
      }
      if (tmp.getAnswer().equals(q.getQuestionAns())) {
       result = result + q.getQuestionMaxMarks();
      } else {
       System.out.println("WRONG ASNSER");
       result = result + -q.getQuestionNegMarks();
      }
     }
     break; //found the question no need to look ahead
    }
   }
  }
  res.addProperty("marks", result);
  res.addProperty("test_id", testData.getId());
  res.addProperty("error", 0);

  return res;
 }
 //getting all test
 @Override
 public List < Test > getAllTest(User u) {
  jdbcTemplate.setDataSource(getDataSource());

  List < Test > tests = null;
  tests = jdbcTemplate.query("SELECT * FROM hc_tests", new ResultSetExtractor < List < Test >> () {
   public List < Test > extractData(ResultSet rs) throws SQLException, DataAccessException {
    List < Test > list = new ArrayList < Test > ();
    while (rs.next()) {
     Test t = new Test();
     t.setTestId(rs.getString(1));
     t.setName(rs.getString(2));
     t.setTotalTime(rs.getInt(8));
     t.setEndTime(rs.getString(7));
     list.add(t);
    }
    return list;
   }
  });

  return tests;

 }

 //getting all finished tests
 @Override
 public List < TestUser > getAllFinishedTest(User u) {
  jdbcTemplate.setDataSource(getDataSource());

  List < TestUser > finishedTest = null;

  finishedTest = jdbcTemplate.query("SELECT * FROM hc_temp_test WHERE isFinished = 1 AND tt_user_id = " + u.getU_id(), new ResultSetExtractor < List < TestUser >> () {
   public List < TestUser > extractData(ResultSet rs) throws SQLException, DataAccessException {
    List < TestUser > list = new ArrayList < TestUser > ();
    while (rs.next()) {
     TestUser t = new TestUser();
     t.setTestId(rs.getString(3));
     t.setUserId(rs.getString(2));
     //t.setTimeLeft(rs.getString(4));
     t.setMarks(Integer.parseInt(rs.getString(6)));
     list.add(t);
    }
    return list;
   }
  });

  return finishedTest;
 }

 // utility function for getting test object.
 @Override
 public Test getTest(int testId) {
  jdbcTemplate.setDataSource(getDataSource());

  String GET_TEST_DETAILS = "SELECT * FROM hc_tests WHERE t_id = ?";
  Test test = (Test) jdbcTemplate.queryForObject(GET_TEST_DETAILS, new Object[] {
   testId
  }, new TestMapper());
  if (test == null)
   return null;

  return test;
 }

 // utility funtion for get user details.
 @Override
 public User getUser(String username) {
  jdbcTemplate.setDataSource(getDataSource());
  String GET_USER = "SELECT * FROM hc_user_details WHERE ud_username = ?";
  User user = (User) jdbcTemplate.queryForObject(GET_USER, new Object[] {
   username
  }, new UserMapper());
  if (user == null)
   return null;

  return null;
 }

 @Override
 public User saveUser(String username, String fname, String lname, String email, String password) {
	 jdbcTemplate.setDataSource(getDataSource());
	 password = getMd5(password);
	 String SAVE_USER = "INSERT INTO hc_user_details (ud_username, ud_firstname, ud_lastname, ud_email, ud_role) VALUES (?,?,?,?,0)";
	 String SAVE_USER_2 = "INSERT INTO hc_user (u_username, u_password, u_role) VALUES (?,?,0)";
	 try {
		    jdbcTemplate.update(SAVE_USER, new Object[] {
		    username, fname, lname, email 
		    });
		    jdbcTemplate.update(SAVE_USER_2, new Object[] {
				    username, password 
				    });
		    
		   } catch (Exception e) {
		    System.out.println(e.getMessage());
		   }
	 
	 return null;
 }

}