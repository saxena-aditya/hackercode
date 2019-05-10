package com.web.hackercode.daoImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CompleteMultipartUploadRequest;
import com.amazonaws.services.s3.model.InitiateMultipartUploadRequest;
import com.amazonaws.services.s3.model.InitiateMultipartUploadResult;
import com.amazonaws.services.s3.model.PartETag;
import com.amazonaws.services.s3.model.UploadPartRequest;
import com.amazonaws.services.s3.model.UploadPartResult;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.web.hackercode.dao.CourseDAO;
import com.web.hackercode.mappers.CourseMapper;
import com.web.hackercode.structures.Course;
import com.web.hackercode.structures.EntityChapter;
import com.web.hackercode.structures.EntityCourse;
import com.web.hackercode.structures.EntityLesson;
import com.web.hackercode.structures.TestUser;
import com.web.hackercode.structures.User;

@Component
public class CourseDAOImpl implements CourseDAO {
    private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

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
    
    public static String randomAlphaNumeric(int count) {
	    StringBuilder builder = new StringBuilder();
	    
	    while (count-- != 0) {
		    int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
		    builder.append(ALPHA_NUMERIC_STRING.charAt(character));
	    }
	    
	    return builder.toString();
    }
    
    private File convert(MultipartFile file) throws IOException {
        File convFile = new File("A:\\" + file.getOriginalFilename());
        System.out.println(file.getOriginalFilename());
        convFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;
    }
    
	private String uploadVideo(MultipartFile file) throws IOException {
		AWSCredentials credentials = new BasicAWSCredentials(
				  "AKIAICQ3HIZ2H2HEFXCQ", 
				  "CU6DnLGq5S4VpzI4w8bXuuB40zrnXljAhdTw1eGp"
		);
		 long contentLength = file.getSize();
	     long partSize = 5 * 1024 * 1024; // Set part size to 5 MB. 
	     String bucketName = "hcvideo212";
	     String keyName = randomAlphaNumeric(10) + file.getOriginalFilename();
	     String domain = "https://do4k6lnx3y4m9.cloudfront.net/";
		try {
			AmazonS3 s3client = AmazonS3ClientBuilder
					  .standard()
					  .withCredentials(new AWSStaticCredentialsProvider(credentials))
					  .withRegion(Regions.AP_SOUTH_1)
					  .build();
       
			// Create a list of ETag objects. You retrieve ETags for each object part uploaded,
			// then, after each individual part has been uploaded, pass the list of ETags to 
			// the request to complete the upload.
			List<PartETag> partETags = new ArrayList<PartETag>();
			// Initiate the multipart upload.
            InitiateMultipartUploadRequest initRequest = new InitiateMultipartUploadRequest(bucketName, keyName);
            InitiateMultipartUploadResult initResponse = s3client.initiateMultipartUpload(initRequest);
			long filePosition = 0;
			File fileType = convert(file);
            for (int i = 1; filePosition < contentLength; i++) {
                // Because the last part could be less than 5 MB, adjust the part size as needed.
                partSize = Math.min(partSize, (contentLength - filePosition));

                // Create the request to upload a part.
                UploadPartRequest uploadRequest = new UploadPartRequest()
                        .withBucketName(bucketName)
                        .withKey(keyName)
                        .withUploadId(initResponse.getUploadId())
                        .withPartNumber(i)
                        .withFileOffset(filePosition)
                        .withFile(fileType)
                        .withPartSize(partSize);

                // Upload the part and add the response's ETag to our list.
                UploadPartResult uploadResult = s3client.uploadPart(uploadRequest);
                partETags.add(uploadResult.getPartETag());

                filePosition += partSize;
            }
            
            CompleteMultipartUploadRequest compRequest = new CompleteMultipartUploadRequest(bucketName, keyName,
                    initResponse.getUploadId(), partETags);
            s3client.completeMultipartUpload(compRequest);
            // delete temp file 
            fileType.delete();
            return domain + keyName;

		}
		catch(AmazonServiceException e) {
            // The call was transmitted successfully, but Amazon S3 couldn't process 
            // it, so it returned an error response.
            e.printStackTrace();
        }
        catch(SdkClientException e) {
            // Amazon S3 couldn't be contacted for a response, or the client
            // couldn't parse the response from Amazon S3.
            e.printStackTrace();
        }
		
		return null;
		
	}
	public String isCoursePresent(String name) {
		jdbcTemplate.setDataSource(getDataSource());
		String IS_COURSE_PRESENT = "SELECT count(*) FROM hc_courses WHERE c_name = ?";
		String GET_COURSE_CODE = "SELECT c_code FROM hc_courses WHERE c_name = ?";
	    System.out.println("getting course code..." + name);
		int count = jdbcTemplate.queryForObject(IS_COURSE_PRESENT, new Object[] { name }, Integer.class);
	    System.out.println("got course count..." + name + " - -" + count);

		if (count == 1) {
			String code = jdbcTemplate.queryForObject(GET_COURSE_CODE, new Object[] { name }, String.class);
			return code;
		}
		
		System.out.println("returning null from isCoursePresent...");
		return null;
	}
	
	public String saveCourse(Course course) {
		jdbcTemplate.setDataSource(getDataSource());
		String SAVE_COURSE = "INSERT INTO hc_courses (c_name, c_code, c_desc, c_price, c_total_days) VALUES (?,?,?,?,?)";
		String GET_COURSE_CODE = "SELECT c_code FROM hc_courses WHERE c_name = ?";

		try {
			System.out.println("Saving course...: " + course.getName());
			jdbcTemplate.update(SAVE_COURSE, course.getName(), randomAlphaNumeric(6), course.getDesc(),
					course.getPrice(), course.getTotalDays());
			System.out.println("getting course code...: ");
			String code = jdbcTemplate.queryForObject(GET_COURSE_CODE, new Object[] { course.getName() }, String.class);
			return code;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("returning NULL from savecourse...");
		return null;
	}
	
	public String isChapterPresent(String name, String courseCode) {
		jdbcTemplate.setDataSource(getDataSource());
		String IS_COURSE_PRESENT = "SELECT count(*) FROM hc_chapters WHERE ch_name = ? AND ch_c_code = ?";
		String GET_COURSE_CODE = "SELECT ch_code FROM hc_chapters WHERE ch_name = ?";
	    
		int count = jdbcTemplate.queryForObject(IS_COURSE_PRESENT, new Object[] { name, courseCode }, Integer.class);
		
		if (count == 1) {
			String code = jdbcTemplate.queryForObject(GET_COURSE_CODE, new Object[] { name }, String.class);
			return code;
		}
		
		return null;
	}
	public boolean saveChapterAndLessons(Course course, String courseCode) {
		jdbcTemplate.setDataSource(getDataSource());
		String SAVE_CHAPTER = "INSERT INTO hc_chapters (ch_c_code, ch_name, ch_code) VALUES (?,?,?)";
		String SAVE_LESSION = "INSERT INTO hc_lessons (l_code, l_ch_code, l_c_code, l_name, l_resource) VALUES (?,?,?,?,?)";
		
		String chCode = isChapterPresent(course.getChapter(), courseCode);
		if (chCode != null) {
			// just save lesson
			try {
				for (int i=0; i< course.getFiles().size(); i++) {
					String location = uploadVideo(course.getFiles().get(i));
					jdbcTemplate.update(SAVE_LESSION,  randomAlphaNumeric(7), 
							chCode, courseCode, course.getLesson(), location);
					return true;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			// save chapter and lesson;
			chCode = randomAlphaNumeric(7);
			jdbcTemplate.update(SAVE_CHAPTER, courseCode, course.getChapter(), chCode);
			for (int i=0; i< course.getFiles().size(); i++) {
				String location = null;
				try {
					location = uploadVideo(course.getFiles().get(i));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				jdbcTemplate.update(SAVE_LESSION,  randomAlphaNumeric(7), 
						chCode, courseCode, course.getLesson(), location);
			}
			
			return true;
		}
		
		return false;
	}
	
	private List<EntityLesson> getEntityLesson(String chCode){
		
		jdbcTemplate.setDataSource(getDataSource());

		String GET_CHAPTER = "SELECT * FROM hc_lessons WHERE l_ch_code = ?";
		List < EntityLesson > lessons = jdbcTemplate.query(GET_CHAPTER, new Object[] {chCode},
	            new ResultSetExtractor < List < EntityLesson >> () {
	                public List < EntityLesson > extractData(ResultSet rs) throws SQLException, DataAccessException {
	                    List < EntityLesson > list = new ArrayList < EntityLesson > ();
	                    while (rs.next()) {
	                    	EntityLesson el = new EntityLesson();
	                    	el.setName(rs.getString("l_name"));
	                    	el.setCode(rs.getString("l_code"));
	                    	el.setResourse(rs.getString("l_resource"));
	                        list.add(el);
	                    }
	                    return list;
	                }
	            });
		
		return lessons;
	}
	
	public  List<EntityCourse> getEntityCourses(HttpServletRequest req) {
		
		jdbcTemplate.setDataSource(getDataSource());
		String GET_COURSES = "SELECT * FROM hc_courses";

		if (req != null) {
			if (req.getSession() != null) {
				if (req.getSession().getAttribute("user") != null) {
					User user = (User) req.getSession().getAttribute("user");
					GET_COURSES = "SELECT * FROM hc_courses AS c WHERE NOT EXISTS ( SELECT * "
							+ "FROM hc_user_program as pg WHERE pg.up_code = c.c_code and pg.up_username = ? )";
					try {
						List < EntityCourse > courses = jdbcTemplate.query(
								GET_COURSES, 
								new Object[] {user.getUsername()},
					            new ResultSetExtractor < List < EntityCourse >> () {
					                public List < EntityCourse > extractData(ResultSet rs) throws SQLException, DataAccessException {
					                    List < EntityCourse > list = new ArrayList < EntityCourse > ();
					                    while (rs.next()) {
					                        EntityCourse ec = new EntityCourse();
					                        ec.setName(rs.getString("c_name"));
					                        ec.setCode(rs.getString("c_code"));
					                        ec.setPrice(rs.getInt("c_price"));
					                        ec.setDesc(rs.getString("c_desc"));
					                        ec.setDays(rs.getInt("c_total_days"));
					                        
					                        list.add(ec);
					                    }
					                    return list;
					                }
					            });
							
							return courses;
					}
					catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		List < EntityCourse > courses = jdbcTemplate.query(GET_COURSES,
            new ResultSetExtractor < List < EntityCourse >> () {
                public List < EntityCourse > extractData(ResultSet rs) throws SQLException, DataAccessException {
                    List < EntityCourse > list = new ArrayList < EntityCourse > ();
                    while (rs.next()) {
                        EntityCourse ec = new EntityCourse();
                        ec.setName(rs.getString("c_name"));
                        ec.setCode(rs.getString("c_code"));
                        ec.setPrice(rs.getInt("c_price"));
                        ec.setDesc(rs.getString("c_desc"));
                        ec.setDays(rs.getInt("c_total_days"));
                        
                        list.add(ec);
                    }
                    return list;
                }
            });
		
		return courses;
	}
	
	private List<EntityChapter> getEntityChapters(String cCode) {
		
		String GET_CHAPTER = "SELECT * FROM hc_chapters WHERE ch_c_code = ?";
		List < EntityChapter > chapters = jdbcTemplate.query(GET_CHAPTER, new Object[] {cCode},
	            new ResultSetExtractor < List < EntityChapter >> () {
	                public List < EntityChapter > extractData(ResultSet rs) throws SQLException, DataAccessException {
	                    List < EntityChapter > list = new ArrayList < EntityChapter > ();
	                    while (rs.next()) {
	                        EntityChapter ec = new EntityChapter();
	                        ec.setName(rs.getString("ch_name"));
	                        ec.setCode(rs.getString("ch_code"));
	                        ec.setCourseCode(rs.getString("ch_c_code"));
	                        
	                        list.add(ec);
	                    }
	                    return list;
	                }
	            });
		
		return chapters;
	}
	public String getCourseJson(String courseCode) {
		
		Course ecourse = getCourse(courseCode);
		JsonArray root = new JsonArray();

			JsonObject coursesJ = new JsonObject();
			JsonArray jc = new JsonArray(); // chapter arrayobj

			List<EntityChapter> chapters = getEntityChapters(ecourse.getCode());

			for(int j=0; j<chapters.size(); j++) {
				EntityChapter echapter = chapters.get(j);
				List<EntityLesson> lessons = getEntityLesson(echapter.getCode());
				JsonArray jLessons = new JsonArray();

				for(int k=0; k<lessons.size(); k++) {
					JsonObject jj = new JsonObject();
					jj.addProperty("name", lessons.get(k).getName());
					jj.addProperty("code", lessons.get(k).getCode());
					jj.addProperty("resourse", lessons.get(k).getResourse());
					jLessons.add(jj);
				}
				JsonObject jcc = new JsonObject();

				jcc.addProperty("name", echapter.getName());
				jcc.addProperty("code", echapter.getCode());
				jcc.add("lessons", jLessons);
				jc.add(jcc);
			}
			coursesJ.addProperty("name", ecourse.getName());
			coursesJ.addProperty("code", ecourse.getCode());
			coursesJ.addProperty("creator", ecourse.getCreator());
			coursesJ.addProperty("total_days", ecourse.getTotalDays());
			coursesJ.addProperty("price", ecourse.getPrice());
			coursesJ.addProperty("desc", ecourse.getDesc());
			coursesJ.add("chapters", jc);
			root.add(coursesJ);

		return root.toString();
	}
	
	public Course getCourse(String courseCode) {
		jdbcTemplate.setDataSource(getDataSource());
		String GET_COURSE = "SELECT * FROM hc_courses WHERE c_code = ?";
		try {
			Course course = jdbcTemplate.queryForObject(GET_COURSE, new CourseMapper(), courseCode);
			return course;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	public String paymentInit(User user, String courseCode) {
		jdbcTemplate.setDataSource(getDataSource());
		String PAYMENT_INIT = "INSERT INTO hc_transactions (t_username,course_code, order_id) VALUES (?,?,?)";
		try {
			String orderId = "ORDER_" + randomAlphaNumeric(10);
			jdbcTemplate.update(PAYMENT_INIT, user.getUsername(), courseCode, orderId);
			return orderId;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean completePayment(TreeMap<String, String> param) {
		jdbcTemplate.setDataSource(getDataSource());
		String orderId = param.get("ORDERID");
		String COMPLETE_PAYMENT = "UPDATE hc_transactions SET bank_name = ?, "
				+ "bank_txn_id =?, currency = ?, gateway_name = ?, mid = ?, payment_mode = ?, "
				+ "resp_code = ?, resp_msg = ?, status = ?, txn_amount = ?, txn_date = ?, "
				+ "txn_id = ? WHERE order_id = ?";
		
		try {
			jdbcTemplate.update(COMPLETE_PAYMENT, param.get("BANKNAME"), param.get("BANKTXNID"),
					param.get("CURRENCY"), param.get("GATEWAYNAME"), param.get("MID"),
					param.get("PAYMENTMODE"), param.get("RESPCODE"), param.get("RESPMSG"),
					param.get("STATUS"), param.get("TXNAMOUNT"), param.get("TXNDATE"), 
					param.get("TXNID"), orderId);
			System.out.println(orderId);
			return true;	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean addCourseToUser(HttpServletRequest req, String courseCode) {
		jdbcTemplate.setDataSource(getDataSource());
		
		User user = (User) req.getSession().getAttribute("user");
		String ADD_COURSE_TO_USER = "INSERT INTO hc_user_program (up_username, up_code, is_paid) VALUES (?,?,?)";
		
		try {
			jdbcTemplate.update(ADD_COURSE_TO_USER, user.getUsername(), courseCode, 1);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Course> getUserCourses(String username) {
		jdbcTemplate.setDataSource(getDataSource());
		String GET_USER_COURSES = "SELECT * FROM hc_user_program pg JOIN hc_courses c WHERE pg.up_code = c.c_code AND pg.up_username = ? ";
		List<Course> courses = null;
		try {
			courses = jdbcTemplate.query(GET_USER_COURSES, new Object[] {username},
		            new ResultSetExtractor < List < Course >> () {
                public List < Course > extractData(ResultSet rs) throws SQLException, DataAccessException {
                    List < Course > list = new ArrayList < Course > ();
                    while (rs.next()) {
                        Course ec = new Course();
                        ec.setCode(rs.getString("c_code"));
                        ec.setName(rs.getString("c_name"));
                        ec.setDesc(rs.getString("c_desc"));
                        ec.setPrice(rs.getInt("c_price"));
                        ec.setTotalDays(rs.getInt("c_total_days"));
                        
                        list.add(ec);
                    }
                    return list;
                }
            });
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return courses;
	}
	public String getCourses() {

		List<EntityCourse> courses = getEntityCourses(null);
		JsonArray root = new JsonArray();

		for(int i=0; i<courses.size(); i++) {
			JsonObject coursesJ = new JsonObject();
			JsonArray jc = new JsonArray(); // chapter arrayo

			EntityCourse ecourse = courses.get(i);
			List<EntityChapter> chapters = getEntityChapters(ecourse.getCode());

			for(int j=0; j<chapters.size(); j++) {
				EntityChapter echapter = chapters.get(j);
				List<EntityLesson> lessons = getEntityLesson(echapter.getCode());
				JsonArray jLessons = new JsonArray();

				for(int k=0; k<lessons.size(); k++) {
					JsonObject jj = new JsonObject();
					jj.addProperty("name", lessons.get(k).getName());
					jj.addProperty("code", lessons.get(k).getCode());
					jj.addProperty("resourse", lessons.get(k).getResourse());
					jLessons.add(jj);
				}
				JsonObject jcc = new JsonObject();

				jcc.addProperty("name", echapter.getName());
				jcc.addProperty("code", echapter.getCode());
				jcc.add("lessons", jLessons);
				jc.add(jcc);
			}
			coursesJ.addProperty("name", ecourse.getName());
			coursesJ.addProperty("code", ecourse.getCode());
			coursesJ.addProperty("creator", ecourse.getCreator());
			coursesJ.addProperty("total_days", ecourse.getDays());
			coursesJ.addProperty("price", ecourse.getPrice());
			coursesJ.addProperty("desc", ecourse.getDesc());
			coursesJ.add("chapters", jc);
			root.add(coursesJ);
			
		}

		return root.toString();

	}
	
}
