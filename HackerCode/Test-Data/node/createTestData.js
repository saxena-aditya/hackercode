const fs = require('fs');


const createTestData = (file) => {
    try {
        let rawData = fs.readFileSync(file);
        let data = JSON.parse(rawData);

        //console.log(data);

        const test = { ...data };

        //console.log(test);
        //console.log(test.question_set);


        /* result will hold the keys of the object now we can acces each object */
        let result = Object.keys((test.question_set));
        console.log(result);

        result.map((key) => {
            console.log();
            test.question_set[key].questions.map((question) => {
                question.answer = null;
            })
        })

        result.map((key) => {
            console.log();
            test.question_set[key].questions.map((question) => {
                //console.log(question);
            })
        })

        return test;
    }
    catch (err) {
        return 0;
    }

}


module.exports = { createTestData }




