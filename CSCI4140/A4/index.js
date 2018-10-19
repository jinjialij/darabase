exports.listSysTables = function(ibmdb,connString) {
    return function(req, res) {

	   	   
       ibmdb.open(connString, function(err, conn) {
			if (err ) {
			 res.send("error occurred " + err.message);
			}
			else {
				conn.query("SELECT * from DASH6769.HOUSE where STATE='ALASKA' AND REP_PARTY='REPUBLICAN' ORDER BY YEAR,MONTH,DAY ASC", function(err, tables, moreResultSets) {
							
							
				if ( !err ) { 
					res.render('tablelist', {
						"tablelist" : tables,
						"tableName" : "Rows from the  DASH6769.HOUSE table query1",
						"message": "Congratulations. Your connection to dashDB is successful."
						
					 });

					
				} else {
				   res.send("error occurred " + err.message);
				}

				/*
					Close the connection to the database
					param 1: The callback function to execute on completion of close function.
				*/
				conn.close(function(){
					console.log("Connection Closed");
					});
				});
			}
		} );
	   
	}
	}
	exports.listSysTables2 = function(ibmdb,connString) {
    return function(req, res) {

	   	   
       ibmdb.open(connString, function(err, conn) {
			if (err ) {
			 res.send("error occurred " + err.message);
			}
			else {
				conn.query("select distinct Question from DASH6769.HOUSE order by question asc", function(err, tables, moreResultSets) {
							
							
				if ( !err ) { 
					res.render('tablelist', {
						"tablelist" : tables,
						"tableName" : "Rows from the  DASH6769.HOUSE table query2",
						"message": "Congratulations. Your connection to dashDB is successful."
						
					 });

					
				} else {
				   res.send("error occurred " + err.message);
				}

				/*
					Close the connection to the database
					param 1: The callback function to execute on completion of close function.
				*/
				conn.close(function(){
					console.log("Connection Closed");
					});
				});
			}
		} );
	   
	}
	}

		exports.listSysTables3 = function(ibmdb,connString) {
    return function(req, res) {

	   	   
       ibmdb.open(connString, function(err, conn) {
			if (err ) {
			 res.send("error occurred " + err.message);
			}
			else {
				conn.query("select REP_NAME, count(REP_NAME) as TimesVotingForNay  from DASH6769.HOUSE where STATE='CALIFOR' and VOTE='NAY' GROUP BY REP_NAME", function(err, tables, moreResultSets) {
							
							
				if ( !err ) { 
					res.render('tablelist', {
						"tablelist" : tables,
						"tableName" : "Rows from the  DASH6769.HOUSE table query3",
						"message": "Congratulations. Your connection to dashDB is successful."
						
					 });

					
				} else {
				   res.send("error occurred " + err.message);
				}

				/*
					Close the connection to the database
					param 1: The callback function to execute on completion of close function.
				*/
				conn.close(function(){
					console.log("Connection Closed");
					});
				});
			}
		} );
	   
	}
	}

			exports.listSysTables4 = function(ibmdb,connString) {
    return function(req, res) {

	   	   
       ibmdb.open(connString, function(err, conn) {
			if (err ) {
			 res.send("error occurred " + err.message);
			}
			else {//query4
				conn.query("select REP_NAME, COUNT(REP_NAME) as numberOfVotes  FROM DASH6769.HOUSE group by REP_NAME ORDER BY COUNT(REP_NAME) asc limit 5", function(err, tables, moreResultSets) {						
							
				if ( !err ) { 
					res.render('tablelist', {
						"tablelist" : tables,
						"tableName" : "Rows from the  DASH6769.HOUSE table query4",
						"message": "Congratulations. Your connection to dashDB is successful."
						
					 });

					
				} else {
				   res.send("error occurred " + err.message);
				}

				/*
					Close the connection to the database
					param 1: The callback function to execute on completion of close function.
				*/
				conn.close(function(){
					console.log("Connection Closed");
					});
				});
			}
		} );
	   
	}
	}

	exports.listSysTables5 = function(ibmdb,connString) {
    return function(req, res) {

	   	   
       ibmdb.open(connString, function(err, conn) {
			if (err ) {
			 res.send("error occurred " + err.message);
			}
			else {//query5
				conn.query("select CONGR_DISTRICT, count(REP_NAME) as numberOfRepresentatives from DASH6769.HOUSE group by CONGR_DISTRICT order by count(REP_NAME)", function(err, tables, moreResultSets) {
							
							
				if ( !err ) { 
					res.render('tablelist', {
						"tablelist" : tables,
						"tableName" : "Rows from the  DASH6769.HOUSE table query5",
						"message": "Congratulations. Your connection to dashDB is successful."
						
					 });

					
				} else {
				   res.send("error occurred " + err.message);
				}

				/*
					Close the connection to the database
					param 1: The callback function to execute on completion of close function.
				*/
				conn.close(function(){
					console.log("Connection Closed");
					});
				});
			}
		} );
	   
	}
	}

	exports.listSysTables6 = function(ibmdb,connString) {
    return function(req, res) {

	   	   
       ibmdb.open(connString, function(err, conn) {
			if (err ) {
			 res.send("error occurred " + err.message);
			}
			else {//query6
				conn.query("select VOTE,count(VOTE) as frequencyOfVote from DASH6769.HOUSE GROUP BY VOTE", function(err, tables, moreResultSets) {
							
				if ( !err ) { 
					res.render('tablelist', {
						"tablelist" : tables,
						"tableName" : "Rows from the  DASH6769.HOUSE table query6",
						"message": "Congratulations. Your connection to dashDB is successful."
						
					 });

					
				} else {
				   res.send("error occurred " + err.message);
				}

				/*
					Close the connection to the database
					param 1: The callback function to execute on completion of close function.
				*/
				conn.close(function(){
					console.log("Connection Closed");
					});
				});
			}
		} );
	   
	}
	}

	exports.listSysTables7 = function(ibmdb,connString) {
    return function(req, res) {

	   	   
       ibmdb.open(connString, function(err, conn) {
			if (err ) {
			 res.send("error occurred " + err.message);
			}
			else {//query7
				conn.query("SELECT state ,count(state) as totalNumberOfVotes from DASH6769.HOUSE group by state", function(err, tables, moreResultSets) {
							
							
				if ( !err ) { 
					res.render('tablelist', {
						"tablelist" : tables,
						"tableName" : "Rows from the  DASH6769.HOUSE table query7",
						"message": "Congratulations. Your connection to dashDB is successful."
						
					 });

					
				} else {
				   res.send("error occurred " + err.message);
				}

				/*
					Close the connection to the database
					param 1: The callback function to execute on completion of close function.
				*/
				conn.close(function(){
					console.log("Connection Closed");
					});
				});
			}
		} );
	   
	}
	}