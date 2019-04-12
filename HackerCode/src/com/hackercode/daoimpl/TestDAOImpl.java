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
import java.util.concurrent.TimeUnit;

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
import com.hackercode.structures.Program;
import com.hackercode.structures.ProgramSpecificTests;
import com.hackercode.structures.Question;
import com.hackercode.structures.Register;
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
    public int getUserWithEmail(String email, String username, HttpServletRequest request) {
        jdbcTemplate.setDataSource(getDataSource());
        String GET_USER = "SELECT COUNT(*) FROM hc_user_details WHERE BINARY ud_email = ? OR BINARY ud_username = ?";
        Number count = 0;
        try {
            count = jdbcTemplate.queryForObject(GET_USER, Integer.class, email, username);
            return new Integer(count.intValue());
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }



    @Override
    public boolean saveFile(int testId, MultipartFile file) throws IOException {

        String LOCATION = "";
        System.out.println(file.getName());
        InputStream in = file.getInputStream();
        File currdir = new File("A:\\hackercode\\HackerCode\\file-data");
        String path = currdir.getAbsolutePath();
        LOCATION = path.substring(0, path.length()) + "\\" + file.getOriginalFilename();
        FileOutputStream f = new FileOutputStream(LOCATION);
        int ch = 0;
        // add try,catch and finally blocks to copy the file
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
                    if (dm.formatCellValue(row.getCell(4)).toString().length() > 0)
                    	q.setQuestionMaxMarks(Integer.parseInt(dm.formatCellValue(row.getCell(4))));
                    if (dm.formatCellValue(row.getCell(5)).toString().length() > 0)
                    	q.setQuestionNegMarks(Integer.parseInt(dm.formatCellValue(row.getCell(5))));
                    q.setQuestionOptions(dm.formatCellValue(row.getCell(6)));
                    q.setQuestionAns(dm.formatCellValue(row.getCell(7)));
                    saveQuestions(testId, q);
                }
            }
        }

        workbook.close();
        System.out.println("About to return True");
        return true;
    }
    @Override
    public boolean saveTest(Test test) throws IOException {
        String startTime, endTime;
        Timestamp start, end;
        jdbcTemplate.setDataSource(getDataSource());
        
        //System.out.println(test.toString());

        String sql = "INSERT INTO hc_tests (t_name, t_associated_program, t_user_id, t_test_code,t_test_password," +
            "t_start_time, t_end_time, t_total_time,t_is_time_strict, t_is_ans_shuffle) VALUES(?,?,?,?,?,?,?,?,?,?)";
       
            startTime = test.getStartTime();
            endTime = test.getEndTime();
            
            // converting hour and minutes into milliseconds because the test works on millisecond data
            int hours = test.getTotalTimeHours(), minutes = test.getTotalTimeMinutes(); 
            long milliseconds = TimeUnit.SECONDS.toMillis(TimeUnit.HOURS.toSeconds(hours) + TimeUnit.MINUTES.toSeconds(minutes));

            if (StringUtils.countMatches(startTime, ":") == 1) startTime += ":00";
            if (StringUtils.countMatches(endTime, ":") == 1) endTime += ":00";
            //System.out.println(test.toString());
            start = Timestamp.valueOf(startTime.replace("T", " "));
            end = Timestamp.valueOf(endTime.replace("T", " "));
            // saving test data.
            jdbcTemplate.update(sql, new Object[] {
                test.getName(),test.getCourseCode(), test.getAdmin(), test.getCode(), test.getPassword(),
                    start, end, milliseconds, test.getIsTimeStrict(), test.getIsAnsShuffle()
            });
            String GET_TEST_CODE = "SELECT t_id FROM hc_tests WHERE t_test_code = ?";
            Number testId = jdbcTemplate.queryForObject(GET_TEST_CODE, Integer.class, test.getCode());
            System.out.println("About to return false 10XXD1.1");

            if (saveFile(testId.intValue(), test.getFile())) return true;
           
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
            return false;
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
    public JsonObject makeAnswerSheet(String data, HttpServletRequest req) {
        jdbcTemplate.setDataSource(getDataSource());
        JsonObject res = new JsonObject(); // result object 		
        int result = 0;

        //getting the json data from the client
        System.out.println("DJHASKDJHASKDJHAJDSHAKJDHSKAJSHDKJASHDKJADSHKASDHKJASHDKJAS");
        Gson gson = new GsonBuilder().create();
        JsonObject job = gson.fromJson(data, JsonObject.class);
        System.out.println("job" + job);
        JsonObject ovl = job.getAsJsonObject("test-data");
        System.out.println(ovl);
        Set < Map.Entry < String, JsonElement >> entries = ovl.entrySet(); //will return members of your object
        ArrayList < TestData > testStore = new ArrayList<TestData>();
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
        List < Question > questions = getQuestionsForTest(testIdentifier);
        
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
        try {
        	//adding marks to the table
        	String Update = "UPDATE hc_temp_test SET marks = ?, isFinished = 1 WHERE tt_user_id = ? AND tt_test_id = ?";
        	User user = (User) req.getSession().getAttribute("user");
        	jdbcTemplate.update(Update, new Object[] { 
        							result,
        			                user.getU_id(),
        			                testData.getId()
        			            });

        }catch(Exception e) {
        	e.printStackTrace();
        }
        res.addProperty("test_id", testData.getId());
        res.addProperty("error", 0);

        return res;
    }
    @Override
    public List<Question> getQuestionsForTest(String testIdentifier) {
    	jdbcTemplate.setDataSource(getDataSource());
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
    	return questions;
	}
	//getting all test
    @Override
    public List<ProgramSpecificTests> getAllTest(User user) {
        jdbcTemplate.setDataSource(getDataSource());
        
        List < ProgramSpecificTests > tests = null;
        // email is user-name.
        String username = user.getEmail();
        String GET_PROGRAM_SPECIFIC_TESTS = "select * from hc_tests JOIN hc_user_program JOIN hc_programs where hc_tests.t_associated_program = hc_user_program.up_code and hc_programs.p_code = hc_tests.t_associated_program and hc_user_program.up_username = ?";
        
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
    public User saveUser(Register ruser) {
        jdbcTemplate.setDataSource(getDataSource());
        ruser.setPassword(getMd5(ruser.getPassword()));
        String SAVE_USER = "INSERT INTO hc_user_details (ud_username, ud_firstname, ud_lastname, ud_email, ud_role) VALUES (?,?,?,?,0)";
        String SAVE_USER_LOGIN_CREDENTIALS = "INSERT INTO hc_user (u_username, u_password) VALUES (?,?)";
        String ADD_USER_WITH_PROGRAM = "INSERT INTO hc_user_program (up_username, up_code) VALUES (?,?)";
        try {
            jdbcTemplate.update(SAVE_USER, new Object[] {
                ruser.getUsername(),
                ruser.getfName(),
                ruser.getlName(),
                ruser.getEmail()
            });
            jdbcTemplate.update(SAVE_USER_LOGIN_CREDENTIALS, new Object[] {
                ruser.getUsername(),
                ruser.getPassword()
            });
            for(String s : ruser.getPrograms()) {
            	 jdbcTemplate.update(ADD_USER_WITH_PROGRAM, new Object[] {
                         ruser.getEmail(),
                         s
                     });
            }
           
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    @Override
    public List<Program> getAllPrograms() {
        jdbcTemplate.setDataSource(getDataSource());
        String GET_PROGRAMS = "SELECT * FROM  hc_programs";
        try {
            List<Program> programs = jdbcTemplate.query(GET_PROGRAMS, new ResultSetExtractor < List < Program >> () {
                public List < Program > extractData(ResultSet rs) throws SQLException, DataAccessException {
                    List < Program > list = new ArrayList < Program > ();
                    while (rs.next()) {
                    	Program program = new Program();
                    	program.setProgramCode(rs.getString("p_code"));
                    	program.setProgramName(rs.getString("p_name"));
                    	list.add(program);
                    }
                    return list;
                }
            });
            return programs;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // return all tests that were created by the Admin
	@Override
	public List<ProgramSpecificTests> getAllTestsByAdmin(User u) {
		jdbcTemplate.setDataSource(getDataSource());
		//String username = u.getEmail();
		String username = "admin";
		List< ProgramSpecificTests > tests = null;
		String GET_TESTS_BY_ADMIN = "SELECT * FROM hc_tests WHERE t_user_id = ?";
		
		tests = jdbcTemplate.query(GET_TESTS_BY_ADMIN, new Object[] {username}, new ResultSetExtractor < List < ProgramSpecificTests >> () {
	            public List < ProgramSpecificTests > extractData(ResultSet rs) throws SQLException, DataAccessException {
	                List < ProgramSpecificTests > list = new ArrayList < ProgramSpecificTests > ();
	                while (rs.next()) {
	                	ProgramSpecificTests t = new ProgramSpecificTests();
	                    t.setTestId(rs.getString("t_id"));
	                    t.setName(rs.getString("t_name"));
	                    t.setCode(rs.getString("t_test_code"));
	                    t.setCourseCode(rs.getString("t_associated_program"));
	                   // t.setCourseName(rs.getString("p_name"));
	                    t.setStartTime(rs.getString("t_start_time"));
	                    t.setEndTime(rs.getString("t_end_time"));
	                    t.setTotalTime(rs.getInt("t_total_time"));
	                    t.setIsTimeStrict(rs.getString("t_is_time_strict"));
	                    
	                    list.add(t);
	                }
	                return list;
	            }
	        });
		// TODO Auto-generated method stub
		return tests;
	}

}