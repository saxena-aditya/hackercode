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
            question.status = "normal";
            })
        })

        return test;
    }
    catch (err) {
        return 0;
    }

}

const updateServerTime = (test)=>{
    try{
        let rawData = fs.readFileSync('test.json');
        let data = test;
        console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>DATA",data);
        fs.writeFileSync('test.json',JSON.stringify(data))
    }
   catch(err){
       console.log("ERROR",err)
   }

}

const updateTest=(test)=>{
    try{
        let rawData = fs.readFileSync('test.json');
        let data =test;
        console.log()
        console.log("DATA---->>>>>>>>>>",data);
        console.log()
        if(time<0)
        time = 180000
        console.log(">>>>>>>>UPODATED DATA>>>>>>>>>>>",data)
        fs.writeFileSync('test.json',JSON.stringify(data))
    }
   catch(err){
       console.log("ERROR",err)
   }
}




module.exports = { createTestData  , updateServerTime,updateTest}




