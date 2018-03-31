
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Rental</title>
  <meta charset="UTF-8">
  <style type="text/css">
    ul{ list-style-type: none;width: 100%;}
    .col{float: left;width: 30%; margin-left: 2%;margin-top: 20px;margin-bottom: 20px;}
    .row{margin-right: 10px;
    }
    .s2{width: 125px;margin-top: 5px;margin-bottom: 5px;}
    #signup{clear: left;}
    #reviewR_submit{margin-left:570px;margin-top: 10px;}
    h2{background-color: lightblue;font-size: 2em; }
    h3{font-size: 1.2em;width: 100%;}
    #reid{margin-left: 20px;}
    #minp{margin-top: 5px;margin-bottom: 15px;}
    #sign_up_submit{margin-left: 525px;}
    #req_submit{margin-top: 15px;margin-left: 575px;}
    .navwords{color: grey;font-weight: 3em;font-size: 1.2em;}
    .words{color:blue;font-weight: 3em;}
  </style>
</head>
<body>
  <header>
    <h1 style="background-color: lightblue;font-size: 2em;margin-top: 5px;margin-bottom: 5px; font">Welcome to Rental!</h1>
  </header>
  <nav>
    <ul>
      <li class="col"><a href="#signup" class="navwords">Sign up</a></li>
      <li class="col"><a href="#check_info" class="navwords">Check Customer info</a></li>
      <li class="col"><a href="#update_info" class="navwords">Update Customer info</a></li>
      <li class="col"><a href="#delete_info" class="navwords">Delete Customer </a></li>
      <li class="col"><a href="#requirement" class="navwords">Requirement</a></li>
    </ul>
  </nav>
  <div style="width=100%;">
    <!--SIGN UP-->
    <section id="signup">
      <h2>Sign up</h2>
      <div style="background-color:lightyellow;">
        <form id='signup-form' action="" method="post">
          <span class="row">First Name: </span>
          <input style="width: 150px;" class="s2" type="text" name="firstname">
          <span class="row" style="margin-left: 62px;">Last Name</span>
          <input class="s2" style="width: 158px;" type="text" name="lastname">
          <br>
          <span class="row" >Occupation: </span>
          <input class="s2" style="width: 145px;" type="text" name="cus_o">
          <span class="row" style="margin-left: 60px;">Phone Number: (902)- </span>
          <input class="s2" type="text" name="cus_ph">
          <br>
          <span class="row">Email address: </span>
          <input class="s2" style="width: 128px;" type="text" name="cus_e">
          </br>
          <input id="sign_up_submit" type="submit" value="Submit" name="submit">
          <button type="Reset" onclick="myFc()" value="Reset">Reset</button>
        </form>
      </div>

      <?php
        if(isset($_POST["submit"]))
        {

          $firstname=$_POST['firstname'];
          $lastname=$_POST['lastname'];
          $cus_o=$_POST['cus_o'];
          $cus_ph=$_POST['cus_ph'];
          $cus_e=$_POST['cus_e'];

          echo "<br>"."Firstname: ". $firstname."<br>";
          echo "Lastname: ". $lastname."<br>";
          echo "Occupation: ". $cus_o."<br>";
          echo "Phone Number: ". $cus_ph."<br>";
          echo "Email address: ". $cus_e."<br>";

          $servername = "db.cs.dal.ca";
          $username = "jiali";
          $password = "B00782346";
          $dbname = "jiali";

          // Create connection
          $conn = new mysqli($servername, $username, $password, $dbname);

          // Check connection
          if ($conn->connect_error) {
              die("Connection failed: " . $conn->connect_error);
          } 

          //SQL Query
          $sql = "INSERT INTO Customer (Customer_ID,Customer_FName, Customer_LName, Customer_Occupation,Customer_Phone_Number,Customer_Email)
          VALUES (null,'$firstname','$lastname','$cus_o','$cus_ph','$cus_e')";

          $result = $conn->query($sql);

          if ($result === TRUE) {
              echo "New record created successfully";
          } else {
              echo "Filed to create new Account.";
              //echo "Error: " . $sql . "<br>" . $conn->error;
              //echo "Error: " . $sql . "<br>" . $conn->error;
          }

          $q="select max(Customer_ID) from Customer";
          $r = $conn->query($q);

              while($rw=mysqli_fetch_assoc($r))
              {
                $cus_id=$rw['max(Customer_ID)'];
              }
              echo "<br><br>"."Customer ID: ". $cus_id."<br>";;

          $conn->close();

          }
          else{
            echo "Please input data";
          }
      ?>
    </section>

    <!--CUSTOMER-->
    <section>
      <?php

        $cusid=$_REQUEST['cus_id'];


        $servername="db.cs.dal.ca";
        $username="jiali";
        $password="B00782346";
        $dbname="jiali";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
        // Check connection
        if ($conn->connect_error) {
          die("Connection failed: " . $conn->connect_error);
        } 


        $q="select * from Customer where Customer_ID='$cusid' ";
          $r = $conn->query($q);

            while($rw=mysqli_fetch_assoc($r))
            {
              
              $cus_id=$rw['Customer_ID'];
              $cus_fn=$rw['Customer_FName'];
              $cus_ln=$rw['Customer_LName'];
              $cus_o=$rw['Customer_Occupation'];
              $cus_ph=$rw['Customer_Phone_Number'];
              $cus_e=$rw['Customer_Email'];                
          
            }             
      ?>
      <h2 id="check_info">Check Customer information</h2>
      <div>
        <div style="background-color: lightyellow;">
          <form id='check-form' action="" method="post">
            <span class="row">Customer ID: </span>
            <input style="width: 150px;" class="s2" type="text" name="cus_id">
            <button id="check_cus_submit">submit</button>
            <button type="Reset" onclick="myFc()" value="Reset">Reset</button>
            <br>
            <?php echo "<br>"."Customer ID: ". $cus_id."<br>";
                  echo "<br>"."First Name: ". $cus_fn."<br>";
                  echo "<br>"."Last Name: ". $cus_ln."<br>";
                  echo "<br>"."Occupation: ". $cus_o."<br>";
                  echo "<br>"."Phone Number: ". $cus_ph."<br>";
                  echo "<br>"."Email address: ". $cus_e."<br>";

            ?>
          </form>
      </div>
          <br>                      
          <h2 id="update_info">Update customer's info</h2>            
          <?php

            $id=$_REQUEST['id'];

            $servername="db.cs.dal.ca";
            $username="jiali";
            $password="B00782346";
            $dbname="jiali";

            // Create connection
            $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
            if ($conn->connect_error) {
              die("Connection failed: " . $conn->connect_error);
            } 

          ?>
          <form style="background-color: lightyellow;"  method='post'>
            <br>Customer ID<br>
            <input type="text" name="id" /><br>
            First name:<br>
            <input type="text" name="firstname" /><br>
            Last name: <br>
            <input type="text" name="lastname" /><br>
            Occupation:<br>
            <input type="text" name="o" /><br>
            Phone Number: <br>
            <input type="text" name="ph" />
            <br>Email: <br>
            <input type="text" name="e" />
            <br>
            <br>
            <input type="submit" value="Update" name="submit">
          </form>
          <?php
            if(isset($_POST["submit"]))
            {

              $firstname=$_POST['firstname'];

              $lastname=$_POST['lastname'];
              $Occup=$_POST['o'];
              $phone=$_POST['ph'];
              $email=$_POST['e'];

              $sql = "UPDATE Customer SET Customer_FName='$firstname', Customer_LName='$lastname',Customer_Occupation='$Occup',Customer_Phone_Number='$phone',Customer_Email='$email' WHERE Customer_ID=$id";

              $result = $conn->query($sql);

              if ($result === TRUE) {

                  echo "Record updated successfully";
              } else {
                  echo "Error updating record: " . $conn->error;
              }

              $conn->close();
                $result = $conn->query($sql); 
            }

          ?>
          <!--Delete Customer-->
          <h2 id="delete_info" >Delete Customer</h2>
          <form style="background-color: lightyellow;">
            <span class="row">Customer ID: </span>
            <input style="width: 150px;" class="s2" type="text" name="cusdelete_id">
            <input id="delete_submit" type="submit" value="Delete" name="Delete">
          </form>
          <?php
            
              $cus_id=$_REQUEST['cusdelete_id'];


              //include("project_connection.php");



              // sql to delete a record
              $sql = "DELETE FROM Customer WHERE Customer_ID=$cus_id";

              $result = $conn->query($sql);

              if ($result === TRUE) {
                echo "Record deleted successfully";
              } else {
                echo "Filed to delected account.";
                //echo "Error: " . $sql . "<br>" . $conn->error;
                //echo "Error deleting record: " . $conn->error;
              }

              $conn->close();
            
          ?>
        </div>        
      </div>
    </section>    

    <!--REQUIREMENT-->

    
    <section id="requirement" style="background-color:lightyellow;">
      <h2 style="width: 100%;">Requirement</h2>
      <?php
          $reg=$_REQUEST['region'];
          $btype=$_REQUEST['buildingtype'];
          $roomt=$_REQUEST['roomtype'];
          $maxp=$_REQUEST['maxprice'];
          $minp=$_REQUEST['minprice'];
          $id=$_REQUEST['id'];
          $bn=$_REQUEST['bus_need'];
          $pet=$_REQUEST['petneed'];
          $fneed=$_REQUEST['facilityneed'];
          



          $servername="db.cs.dal.ca";
          $username="jiali";
          $password="B00782346";
          $dbname="jiali";

          // Create connection
          $conn = new mysqli($servername, $username, $password, $dbname);

          // Check connection
          if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
          } 

          $sql = "INSERT INTO Customer_Requirement (Customer_Requirement_ID, Region_Code,RoomType_Code,MIN_Price,MAX_Price,Building_Type_code,`Bus available`,`Pet requirement`,`Facility_ID`,Customer_ID)
          VALUES (null, '$reg', '$roomt','$minp','$maxp','$btype','$bn','$pet','$fneed','$id')";

          $result = $conn->query($sql);

          if ($result === TRUE) {
              echo "New requirement created successfully";
          } else {
              echo "Filed to create new Requirement.";
              //echo "Error: " . $sql . "<br>" . $conn->error;
              //echo "Error: " . $sql . "<br>" . $conn->error;
          }    
      ?>
      <p style="color: blue;">Where and which type of buildingdo you want to live</p>
      <form id="requirement" action="" method="post"> 
          <p>If you want to save your requirement, please type your Customer ID</p>
          <input type="text" name="id" /><br>
          <h3 class="requireHead">Region: </h3>
          <input type="radio" name="region" value="100" checked><span>1.Halifax</span>
          <input type="radio" name="region" value="101"><span>2.Bedford</span>
          <input type="radio" name="region" value="102"><span>3.Darthmouth</span>
          <h3 class="requireHead">Building Type</h3>
          <input type="radio" name="buildingtype" value="1" checked><span>1.House</span>
          <input type="radio" name="buildingtype" value="2"><span>2.Apartment</span>
          <input type="radio" name="buildingtype" value="3"><span>3.Condo</span>
          <br>
          <p style="color: blue;">Your ideal room type and price range:</p>
          <h3 class="requireHead">Room Type</h3>
          <input type="radio" name="roomtype" value="1" checked><span>1.One Bedroom</span>
          <input type="radio" name="roomtype" value="2"><span>2.Two Bedroom</span>
          <input type="radio" name="roomtype" value="3"><span>3.Three Bedroom</span>
          <input type="radio" name="roomtype" value="4"><span>4.Four Bedroom</span>
          <h3 class="requireHead">Price range: </h3>
          <div>
            <span>Max price:  </span>
            <input type="radio" name="maxprice" value="1000"><span>1000</span>
            <input type="radio" name="maxprice" value="1500"><span>1500</span>
            <input type="radio" name="maxprice" value="2000"><span>2000</span>
            <input type="radio" name="maxprice" value="2500" checked><span>2500</span>
          </div>
          <div id="minp">
            <span>Min price:  </span>
            <input type="radio" name="minprice" value="0" checked><span>0</span>
            <input type="radio" name="minprice" value="500"><span>500</span>
            <input type="radio" name="minprice" value="1000"><span>1000</span>
            <input type="radio" name="minprice" value="1500"><span>1500</span>
            <input type="radio" name="minprice" value="2000"><span>2000</span>
          </div>
          <p style="color: blue;">Other requirement:</p>
          
          <h3 class="requireHead">Bus accessible</h3>
          <input type="radio" name="bus_need" value="1"><span>Yes</span>
          <input type="radio" name="bus_need" value="0" checked><span>No</span>
          <h3 class="requireHead">Allow pet</h3>
            <input type="radio" name="petneed" value="1"><span>Yes</span>
          <input type="radio" name="petneed" value="0" checked><span>No</span>
          <h3 class="requireHead">Facility needs</h3>
          <input type="radio" name="facilityneed" value="1" checked><span>Kitchen</span>
          <input type="radio" name="facilityneed" value="2"><span>Balcony</span>
          <input type="radio" name="facilityneed" value="3"><span>Microwave</span>
          <input type="radio" name="facilityneed" value="4"><span>Swimming pool</span>
          <input type="radio" name="facilityneed" value="5"><span>Gym</span>
          </br>
          <button type="submit" value="submit">submit and search</button>
          <button type="reset" onclick="myFc()" value="Reset">Reset</button>
          <h2>Search result</h2>
          <?php
                $q="select * from table1 natural join table2 where Region_Code ='$reg' and Building_Type_code ='$btype' and Price between '$minp' and '$maxp' and Bus_condition='$bn' and `Pet restriction`='$pet' and Facility_ID='$fneed' ";
              $r = $conn->query($q);
                if(mysqli_num_rows($r)>0){
                  while($rw=mysqli_fetch_assoc($r))
                  {
                    
                    $regname=$rw['Region_Name'];
                    $bname=$rw['Building_Name'];
                    $roomtname=$rw['RoomType_Name'];
                    $fltypename=$rw['FloorTypeName'];
                    $p=$rw['Price'];
                    $t=$rw['Toilet_Num'];
                    $s=$rw['SquareSize'];
                    $falicityname=$rw['Facility_Name'];
                                      
                  }

                  echo "Region name: ". $regname."<br>";
                  echo "Building name: ". $bname."<br>";
                  echo "Room type name: ". $roomtname."<br>";
                  echo "Floor type: ". $fltypename."<br>";
                  echo "Price: ". $p."<br>";
                  echo "Number of toliet: ". $t."<br>";
                  echo "Square size: ". $s."<br>";
                  echo "Have facility: ". $falicityname."<br>";
                }else{
                  echo "0 result";
                }

                  
          ?>  
      </form>
    </section>
  </div>

  <footer>
    <nav>
    <ul>
      <li class="col"><a href="#signup" class="navwords">Sign up</a></li>
      <li class="col"><a href="#check_info" class="navwords">Check Customer info</a></li>
      <li class="col"><a href="#update_info" class="navwords">Update Customer info</a></li>
      <li class="col"><a href="#delete_info" class="navwords">Delete Customer </a></li>
      <li class="col"><a href="#requirement" class="navwords">Requirement</a></li>
    </ul>
  </nav>
  </footer>
</body>
<script>

  function myFc() {

  document.getElementById("signup-form").reset();
  document.getElementById("check-form").reset();
  document.getElementById("revisecus-form").reset();
  document.getElementById("requirement").reset();
  document.getElementById("cus_requirement").reset();

}
</html>