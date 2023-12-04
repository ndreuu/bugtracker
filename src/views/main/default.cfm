    <cfoutput>

    <head>
        <style>
        {
            box-sizing: border-box;
        }
        /* Set additional styling options for the columns*/
        .column {
        float: left;
        width: 50%;
        }
    
        .row:after {
        content: "";
        display: table;
        clear: both;
        }
        </style>
     </head>
     <body>
        <div class="row">
            <div class="column" >
                <cfform id="myForm" name="myForm" action='#buildUrl('user.authenticate')#' method="post"> 
                    Login:<input type="Text" id="usr_nm" name="loginlogin"><br>
                    Password:<input type="Password" id="pswd" name="passwordlogin"><br>
                    <input type="submit" id="my_form_submit" name="my_form_submit" value="Submit"><br>
                </cfform> 
            </div>
            <div class="column">
                    <cfform id="myForm1" name="myForm" action="#buildUrl('user.registrate')#" method="post"> 
                    Login:<input type="Text" id="usr_nm1" name="loginreg"><br>
                    Firstname:<input type="Text" id="usr_nm12" name="fstnamereg"><br>
                    Lastname:<input type="Text" id="usr_nm13" name="lstnamereg"><br>
                    Password:<input type="Password" id="usr_nm14" name="passwordreg"><br>
                    <input type="submit" id="my_form_submit1" name="my_form_submit" value="Submit"><br>
                </cfform> 
            </div>
        </div>
     </body>
</cfoutput>
      
