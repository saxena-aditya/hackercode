# HackerCode

## Working links
* `http://localhost:8080/HackerCode/`
* `http://localhost:8080/HackerCode/home`
* `http://localhost:8080/HackerCode/admin`
* `http://localhost:8080/HackerCode/get-test-date/{testID || 1}`
* `http://localhost:8080/HackerCode/file-upload`

## Updates 
* Inport new database tables from hackercode.sql file. (database name: `hackercode`)
* added new test data API, available on /get-test-data/{testId} channel.
* bulk question upload functionality present at /file-uplaod. File Format present in the directory `HackerCode/file-data`

##### Note: to get questions for testID: 1, request to url `http://localhost:8080/HackerCode/get-test-date/1` 

### In case of jsp errors:
Download and add the following jars
* _servlet-api.jar_
* _jsp-api-2.1.jar_
* _apache POI jars_

