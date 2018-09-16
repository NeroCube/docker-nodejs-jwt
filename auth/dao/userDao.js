var env = require('./configs/env.js');		
var pool = new pg.Pool(env.dbConfigs);

module.exports = {
    findByUserName: function(name, cb) {
      pool.connect(function(err, client, done) {
        if(err){
            console.log("not able to get connection "+ err);
            res.status(400).send(err);
        } 
        client.query('SELECT * from users WHERE username = $1', [name],function(err,result) {
           //call `done()` to release the client back to the pool
            done(); 
            if(err){
                console.log(err);
                res.status(400).send(err);
            }
            res.status(200).send(result.rows);
        });
     });
    },
    findByUserId: function(userid, cb) {
      pool.connect(function(err, client, done) {
        if(err){
            console.log("not able to get connection "+ err);
            res.status(400).send(err);
        } 
        client.query('SELECT * from users WHERE userid = $1', [userid],function(err,result) {
           //call `done()` to release the client back to the pool
            done(); 
            if(err){
                console.log(err);
                res.status(400).send(err);
            }
            res.status(200).send(result.rows);
        });
     });
    }
 }