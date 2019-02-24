const express = require('express');
const app = express();
const cors = require('cors')
const bodyParser = require('body-parser')
app.use(cors({
    'allowedHeaders': ['sessionId', 'Content-Type'],
    'exposedHeaders': ['sessionId'],
    'origin': '*',
    'methods': 'GET,HEAD,PUT,PATCH,POST,DELETE',
    'preflightContinue': false
  }));
/* createTestData() exported from another js file createTestData() */
const { createTestData , updateServerTime} = require('./createTestData')


console.log()

var testData="";
app.use(bodyParser.json())
 testData = createTestData('test.json');
if (testData === 0) {
    console.log("FILE NOT FOUND")
}

app.get('/', (req, res) => {
    console.log("REQUESTED DATA");
    console.log(testData);
    res.send(testData);
})


app.post('/updateTime',(req,res)=>{
    testData.test_duration = req.body.time;
    console.log(req.body);
    updateServerTime(req.body.test)
    res.send('success')
})




app.listen(3000, () => {
    console.log("SERVER STARTED AT PORT 3000");
})