package com.hackercode.controller;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.poi.ss.usermodel.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.*;
import com.hackercode.dao.TestDAO;
import com.hackercode.structures.Program;
import com.hackercode.structures.ProgramSpecificTests;
import com.hackercode.structures.Question;
import com.hackercode.structures.Register;
import com.hackercode.structures.Test;
import com.hackercode.structures.TestUser;
import com.hackercode.structures.User;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
@Configuration
@Controller
public class TestController extends AbstractController {
    ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");

    @RequestMapping(value = "/file-upload", method = RequestMethod.GET)
    public ModelAndView serverFileUpload(HttpServletRequest req, HttpServletResponse res) {
        return new ModelAndView("test-admin-panel").addObject("fileUploadURL", "/file-process");
    }

    @RequestMapping(value = "/save-test", method = RequestMethod.POST)
    @ResponseBody
    public int saveTest(@ModelAttribute("test") Test test, BindingResult result) {
        TestDAO testDAO = ctx.getBean(TestDAO.class);
      
        System.out.println(result.getModel().toString());
        if (result.hasErrors()) return 0;
        try {
            boolean testSaved = testDAO.saveTest(test);
            if (testSaved) {
                return 1;
            } else {
                return 0;
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return 0;
    }
    @RequestMapping(value = "/file-process", method = RequestMethod.POST)
    public ModelAndView fileProcess(ModelAndView model, MultipartFile file) throws IOException {
        TestDAO testDAO = ctx.getBean(TestDAO.class);

        String LOCATION = null;
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
                    testDAO.saveQuestions(1, q);
                }
            }
        }
        workbook.close();

        //model.addObject("val", "got the file!");
        return model;
    }

    @RequestMapping(value = "/get-test-data/{testID}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String testData(@PathVariable String testID, @RequestBody String json) {
        TestDAO testDAO = ctx.getBean(TestDAO.class);
        //creating a json object for easiness will have test_id and user_id
        Gson gson = new GsonBuilder().create();
        JsonObject jsonData = gson.fromJson(json, JsonObject.class);
        String test_id = jsonData.get("test_id").getAsString();
        String user_id = jsonData.get("user_id").getAsString();

        //making a testidentifier
        int testIdentifier = 0;
        try {
            testIdentifier = Integer.parseInt(testID);
        } catch (Exception e) {
            System.out.println("Could not convert String to Integer");
            // terminate code and show error msg.
            return null;
        }
        
        String testData = testDAO.getTestData(testIdentifier, test_id, user_id);
        return testData;
        //return new ModelAndView("test-data").addObject("data", testData);
    }
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public ModelAndView showSignup(HttpServletRequest req) {
        TestDAO testDAO = ctx.getBean(TestDAO.class);
        List < Program > programs = testDAO.getAllPrograms();
       
        return new ModelAndView("signup").addObject("programs", programs);
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public ModelAndView signup(@ModelAttribute("register") Register user, HttpServletRequest req) {
        //for sign up
    	System.out.println("REGISTER CLASS>> "+user);
    	if(user.getCourse().indexOf(',') >=0 ) {
    		//ie multiple courses selected
    		String strArray[] = user.getCourse().split(",");
    		user.setPrograms(strArray);
    		System.out.println("REGISTER CLASS AFTER THE MULTIPLE>> "+user);
    	} else{
    		String strArray[] = user.getCourse().split(" ");
    		user.setPrograms(strArray);
    		System.out.println("REGISTER CLASS AFTER THE SINGLE>> "+user);
    	};
  
        req.getSession().setAttribute("isLoggedIn", false);
        TestDAO testDao = ctx.getBean(TestDAO.class);

        //check if there is user with same name password 
        int i = testDao.getUserWithEmail(user.getEmail(), user.getUsername(), req);
        if (i > 0) {
            List < Program > programs = testDao.getAllPrograms();
            return new ModelAndView("signup").addObject("error", "User Already exists !").addObject("programs", programs);
        }

        //add user to db
        testDao.saveUser(user);

        return new ModelAndView("admin");
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@ModelAttribute("username") String username,
        @ModelAttribute("password") String password,
        HttpServletRequest req) {
        req.getSession().setAttribute("isLoggedIn", false);
        TestDAO testDao = ctx.getBean(TestDAO.class);
        RedirectView view;
        if (testDao.isUser(username, password, req)) {
            User user = testDao.getUser(username, req);
            req.getSession().setAttribute("user", user);
            if (user.isAdmin()) {
                // get details for admin and pass the details to
                // the model.
                view = new RedirectView("dashboard", true);
            } else {
                view = new RedirectView("profile", true);
            }
            req.getSession().setAttribute("isLoggedIn", true);
            // redirect user to appropriate screen.
            view.setExposeModelAttributes(false);
            return new ModelAndView(view);

        }
        return new ModelAndView("test-admin-login");
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView showAdminDashBoard() {

        return new ModelAndView("test-admin-dashboard");
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView showStudentDashBoard(HttpServletRequest req) {
        TestDAO testDao = ctx.getBean(TestDAO.class);
        
        System.out.println("isLoggedIn: " + req.getSession().getAttribute("isLoggedIn").toString());
        
        if (req.getSession().getAttribute("isLoggedIn").toString().equalsIgnoreCase("false")) {
            RedirectView view = new RedirectView("admin-login", true);
            return new ModelAndView(view);
        }

        User u = (User) req.getSession().getAttribute("user");

        List<ProgramSpecificTests> tests = testDao.getAllTest(u);
        List < TestUser > finishedTest = testDao.getAllFinishedTest(u);
        return new ModelAndView("admin-dashboard").addObject("tests", tests)
            .addObject("finishedTest", finishedTest);

    }

    @RequestMapping(value = "/admin-login", method = RequestMethod.GET)
    public ModelAndView showAdminLogin(HttpServletRequest req) {
        req.getSession().setAttribute("isLoggedIn", false);

        return new ModelAndView("test-admin-login");
    }
    @RequestMapping(value = "/admin-dashboard", method = RequestMethod.GET)
    public ModelAndView showAdminPanel() {
        return new ModelAndView("test-admin-dashboard");
    }
    @RequestMapping(value = "/add-test", method = RequestMethod.GET)
    public ModelAndView showAddTestPanel(HttpServletRequest req) {
        User user = (User) req.getSession().getAttribute("user");
        TestDAO testDao = ctx.getBean(TestDAO.class); 
        return new ModelAndView("test-admin-upload-test")
            .addObject("testId", RandomStringUtils.randomAlphanumeric(17).toUpperCase())
            .addObject("userId", user.getEmail())
            .addObject("programs", testDao.getAllPrograms());
    }

    @RequestMapping(value = "/get-result", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public JsonObject setTestResult(@RequestBody String json,HttpServletRequest req) {
        TestDAO testDAO = ctx.getBean(TestDAO.class);

        JsonObject result = testDAO.makeAnswerSheet(json,req);
        //now we can show this to him
        System.out.println("RESULT ON MODEL AND VIEW" + result);
        return result;
    }

    @RequestMapping(value = "/give-test/{testId}", method = RequestMethod.GET)
    public ModelAndView giveTest(@PathVariable String testId, HttpServletRequest req) {

        User u = (User) req.getSession().getAttribute("user");
        return new ModelAndView("give-test").addObject("testName", new String("TAKE TEST PART"))
            .addObject("test_id", testId)
            .addObject("user_id", u.getU_id());
    }

    @RequestMapping(value = "/update-test-data", method = RequestMethod.POST)
    public void updateOrInsertTestData(@RequestBody String json) {
        TestDAO testDAO = ctx.getBean(TestDAO.class);
        testDAO.getStoredTestData(json);
    }
    
    @RequestMapping(value = "/tests", method = RequestMethod.GET)
    public ModelAndView showTests(HttpServletRequest req) {
    	TestDAO testDao = ctx.getBean(TestDAO.class);
    	//User user = (User) req.getSession().getAttribute("user");
    	User user = new User();
    	List < ProgramSpecificTests > tests = testDao.getAllTestsByAdmin(user);
    	
    	return new ModelAndView("test-admin-dashboard-tests").addObject("tests", tests);
    }
    
    @RequestMapping(value = "/get-questions-for-test/{testId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public String getQuestions(@PathVariable String testId, HttpServletRequest req) {
    	TestDAO testDao = ctx.getBean(TestDAO.class);
    	List < Question > questions = null;
    	String jsonStr = null;
    	if (testId.length() > 0) {
    		 questions = testDao.getQuestionsForTest(testId);
    		 Gson gson = new Gson();
    		 jsonStr = gson.toJson(questions);
    	}
    	return jsonStr;
    }
    
    

    @Override
    public ModelAndView handleRequest(HttpServletRequest request,
        HttpServletResponse response) throws Exception {
        return null;
    }
    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
        return null;
    }
}