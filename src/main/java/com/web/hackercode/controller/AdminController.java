package com.web.hackercode.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.hackercode.dao.CategoryDAO;
import com.web.hackercode.structures.Question;
import com.web.hackercode.structures.User;
import com.web.hackercode.utility.Utility;

@Controller

public class AdminController {
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
	Utility utils = new Utility();

	@RequestMapping(value = "/admin/categories", method = RequestMethod.GET)
	public ModelAndView showEditCategory() {
		CategoryDAO catdao = ctx.getBean(CategoryDAO.class);

		return new ModelAndView("test-admin-dashboard-add-categories").addObject("nav", catdao.getNavJSON());
	}
	
	
	@RequestMapping(value = "/admin/bulk-upload/users", method = RequestMethod.POST)
	@ResponseBody
	public String bulkUploadUser(@RequestParam("file") MultipartFile file) throws IOException {
		System.out.print(file.getOriginalFilename());
		
		Workbook workbook = null;
		try {
			workbook = WorkbookFactory.create(file.getInputStream());
			System.out.println(workbook.getNumberOfSheets());
			
			for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
	            Sheet sheet = workbook.getSheetAt(i);
	            DataFormatter dm = new DataFormatter();
	            Iterator < Row > rowIterator = sheet.rowIterator();
	            while (rowIterator.hasNext()) {
	                Row row = rowIterator.next();
	                if (row.getRowNum() == 0) continue;
	                else {
	                    User user = new User();
	                    user.setEmail(dm.formatCellValue(row.getCell(6)));
	                    user.setUsername(dm.formatCellValue(row.getCell(1)));
	                    user.setFirstName(dm.formatCellValue(row.getCell(2)));
	                    user.setLastName(dm.formatCellValue(row.getCell(3)));
	                    user.setPassword(utils.getMd5(dm.formatCellValue(row.getCell(4))));
	                    user.setInstitute(dm.formatCellValue(row.getCell(5)));
	                    user.setPassword(dm.formatCellValue(row.getCell(4)));
	                    user.setPhone(dm.formatCellValue(row.getCell(4)));
	                    
	                    if (dm.formatCellValue(row.getCell(7)).toString().equalsIgnoreCase("1")) {
	                    	user.setAdmin(true);
	                    	user.setDrafter(false);
	                    }
	                    else if (dm.formatCellValue(row.getCell(7)).toString().equalsIgnoreCase("2")) {
	                    	user.setDrafter(true);
	                    	user.setAdmin(false);
	                    }
	                    
	                    System.out.println(user.toString());
	                    
	                }
	            }
	        }

	        workbook.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
