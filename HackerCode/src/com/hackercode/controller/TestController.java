package com.hackercode.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import org.apache.poi.ss.usermodel.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.hackercode.dao.AdminDao;
import com.hackercode.dao.TestDAO;
import com.hackercode.structures.Question;

import org.springframework.stereotype.Controller;
@Configuration
@Controller
public class TestController extends AbstractController{
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");

	@RequestMapping(value = "/file-upload", method = RequestMethod.GET) 
	public ModelAndView serverFileUpload(HttpServletRequest req, HttpServletResponse res) {	
		return new ModelAndView("test-admin-panel").addObject("fileUploadURL", "/file-process");
	}
	@RequestMapping(value = "/file-process", method = RequestMethod.POST)
	public ModelAndView fileProcess(ModelAndView model,MultipartFile file) throws IOException {
		String LOCATION = null;
		TestDAO testDAO = ctx.getBean(TestDAO.class);

		InputStream in = file.getInputStream();
		File currdir = new File("D:/HackerCode/HackerCode/file-data/");
		String path = currdir.getAbsolutePath();
		LOCATION = path.substring(0, path.length())+"\\" +file.getOriginalFilename();
		FileOutputStream f = new FileOutputStream(LOCATION);
		int ch = 0;
		// add try,catch and finally bolcks to copy the file
		while((ch = in.read()) != -1) {
			f.write(ch);
		}

		System.out.println(LOCATION);
		f.flush();
		f.close();
		
		Workbook workbook = WorkbookFactory.create(new File(LOCATION));
		for(int i = 0; i<workbook.getNumberOfSheets(); i++) {
			Sheet sheet = workbook.getSheetAt(i);
			DataFormatter dm = new DataFormatter();
			Iterator<Row> rowIterator = sheet.rowIterator();
			while(rowIterator.hasNext()) {
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
	
	@RequestMapping(value = "/get-test-data/{testID}", method = RequestMethod.GET)
	public ModelAndView testData(@PathVariable String testID) {
		TestDAO testDAO = ctx.getBean(TestDAO.class);
		
		int testIdentifier = 0;
		try {
			testIdentifier = Integer.parseInt(testID);
		} catch(Exception e) {
			System.out.println("Could not convert String to Integer");
			// terminate code and show error msg.
			return null;
		}
		
		String testData = testDAO.getTestData(testIdentifier);
		
		return new ModelAndView("test-data").addObject("data", testData);
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
