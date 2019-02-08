const express = require('express');
const app = express();


/* createTestData() exported from another js file createTestData() */
const { createTestData } = require('./createTestData')


console.log()
var testData = createTestData('test.json');
if (testData === 0) {
    console.log("FILE NOT FOUND")
}

app.get('/', (req, res) => {
    console.log("REQUESTED DATA");
    //console.log(testData);
    res.send(testData);
})





app.listen(3000, () => {
    console.log("SERVER STARTED AT PORT 3000");
})