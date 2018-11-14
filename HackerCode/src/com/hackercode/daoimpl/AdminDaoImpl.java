package com.hackercode.daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.hackercode.dao.AdminDao;
import com.hackercode.structures.Admin;
import com.hackercode.structures.UserDetail;
import com.hackercode.constants.SQLQueries;

@Component
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate = new JdbcTemplate();;
	
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


	@Override
	public UserDetail getUserDetail(String email) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Admin> getAllAdmins() {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		System.out.println(SQLQueries.GET_ALL_ADMINS);

		List<Admin> admins = jdbcTemplate.query(SQLQueries.GET_ALL_ADMINS, new ResultSetExtractor<List<Admin>>(){
			@Override
			public List<Admin> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<Admin> list = new ArrayList<Admin>();
				while (rs.next()) {
					Admin admin = new Admin();
					admin.setU_id(rs.getInt(1));
					admin.setUsername(rs.getString(2));
					admin.setPassword(rs.getString(3));
					admin.setAdminType(rs.getString(4));
					list.add(admin);
				}	
				return list;
			}
		});
		return admins;
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
