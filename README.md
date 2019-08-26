# HackerCode docs 

### Moving the application to the server
The application presently runs on apache-tomcat hosted on a GCE Compute Engine. A Jenkins installation has been already set up for CI/CD purposes. 

Jenkins (http://34.67.112.194/jenkins-install) is set up to automatically fetch and build all the code and deploy it on tomcat. Two separate freestyle jobs have been configured to fetch and build the code. 

Additional improvements may include adding a new piece to the pipeline for restarting the server whenever a build is successful.

The setup at present listens to each commit and gets initiated automatically. Whenever you commit your code to the `dev` branch of the repo, your code will be built and deployed hence the CD. 

### The Code

#### (*)Controllers.java 
The application is based on an MVC architecture so it has a lot of controller files. One controller for one feature.

`AuthController.java`

Controls login and logout features. 

`HomeController.java`

Controls basic homepage links like - opening resources page and apply-for-internship API for saving internship letter.

`InternshipController.java`

Controls Internship activities like - showing internship letters in the admin dashboard, marking internship letters (to determine if the letter is attended or not)

`UserController.java`

Controls user features like saving profile user photo and recovering password.

`ArticleController.java`

All the CRUD operations relating to articles are handled in this file. 
Admin side features like approving, disapproving and viewing articles before approving are also served by this file.
 
`CourseController.java`

All the operations regarding courses are handled here. Note that some routes start with '/api'. This denotes that this function/method is used to just return/save data from/to DB and no views are being rendered.
The admin side functionality like adding courses, deleting courses, modifying courses are also present in this file.

`MailController.java`

This class is used for sending various mails, right now password-reset and article-process mails are being handled here. Schedule this class for auto mailers. 

`ReportControllers.java`

All the functionality regarding test reporting is coded here. This class requires a Users object to perform its actions. Extend this class if you need to implement any new reporting features.
 
`TestController.java`

This class is for all the Test/Exam operations. Be it a user side functionality or an admin feature you'll find all the Test/Exam CRUD operations here. 
Example operations include - Creating a Test, Deleting a Test, Modifying a Test, Adding new Questions to a pre-existing test, Deleting Questions from a pre-existing test etc. 


#### The DAO and DAOImpl 
All the controller classes are supported by DAO classes. For example, for ArticleController.java there is ArticleDAO.java, for TestController.java there is TestDAO.java. 
DAO class files have all the prototyping for the methods that are used to perform various operations.
DAO classes *only* hold the prototypes for the methods whereas DAOImpl classes contain their definitions. So if you need to change anything, chances are you'll have to look for a DAOImpl class file. Lookup is fairly logical tho, like DAO class files, DAOImpl class files also have names according to there Controller counterparts eg. ArticleController.java will have ArticleDAOImpl.java and so on