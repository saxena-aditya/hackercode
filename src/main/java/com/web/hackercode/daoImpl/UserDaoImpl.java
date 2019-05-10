package com.web.hackercode.daoImpl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.web.hackercode.dao.UserDAO;
import com.web.hackercode.mappers.StudentMapper;
import com.web.hackercode.structures.Student;
import com.web.hackercode.structures.User;

@Component
public class UserDaoImpl implements UserDAO {

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
	    
	public boolean savePicture(User user, String imagePath) {
        jdbcTemplate.setDataSource(getDataSource());
		String UPDATE_PROFILE_PIC = "UPDATE hc_user_details SET ud_img_path = ? WHERE ud_username = ?";
		
		try {
			System.out.println(user.getEmail());
			System.out.println(imagePath);
			jdbcTemplate.update(UPDATE_PROFILE_PIC, new Object[] {imagePath, user.getEmail()});
			System.out.println("returning after query");
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	public String uploadFile(HttpServletRequest req, MultipartFile file) {
		if (!file.isEmpty()) {
			String LOCATION = null;
	        InputStream in;
	        FileOutputStream f = null;
			try {
				in = file.getInputStream();
				File currdir = new File("A:\\HackerCode\\src\\main\\webapp\\resources\\ff-ideas\\img");
		        String path = currdir.getAbsolutePath();
		        LOCATION = path.substring(0, path.length()) + "\\" + file.getOriginalFilename();
		        f = new FileOutputStream(LOCATION);
		        int ch = 0;
		        // add try,catch and finally block to copy the file
		        while ((ch = in .read()) != -1) {
		            f.write(ch);
		        }

		        System.out.println(LOCATION);
		        return "img/" + file.getOriginalFilename();
		        
			} catch (IOException e) {
				e.printStackTrace();
			}
			finally {
				try {
					f.flush();
			        f.close();

				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        
			}
	        

		} else {
			System.out.println("You failed to upload " 
					+ " because the file was empty.");
		}
		return "";
	}
	
}