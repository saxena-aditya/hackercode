package com.hackercode.daoimpl;

import java.sql.Types;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.hackercode.dao.AdminDao;
import com.hackercode.mappers.AdminMapper;
import com.hackercode.sql.AdminSql;
import com.hackercode.structures.User;
import com.hackercode.structures.UserDetail;

@Component
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	
	public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	}


	@Override
	public UserDetail getUserDetail(String email) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*public Admin getAdminPass(String email) {
		// TODO Auto-generated method stub
		jdbcTemplate = new JdbcTemplate(dataSource);
		Object [] params = new Object [] {email};
		int [] types = new int [] {Types.VARCHAR} ;
		
		Admin admin=null;
		
		try
		{
			admin = (Admin)jdbcTemplate.queryForObject(AdminSql.GET_ADMIN, params, types, new AdminMapper());
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return admin;
	}*/

}
