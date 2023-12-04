<cfoutput>
    <div id="home" class="page-header">
        <ol class="breadcrumb">
            <li>
                <a href="#BuildURL( action='bug.new' )#">
                    New bug
                </a>
            </li>
            <li>
                <a href="#BuildURL( action='bug.list' )#">
                    Bug list
                </a>
            </li>
            <li>
                <a href="#BuildURL( action='user.edit' )#">
                    Edit user
                </a>
            </li>
            <li>
                <a href="#BuildURL( action='user.list' )#">
                    User list
                </a>
            </li>
            <li>
                <a href="#BuildURL( action='user.logout' )#">
                    Log out
                </a>
            </li>
        </ol>
    </div>
</cfoutput>    
<cfoutput>
    <form id="myForm" name="myForm" action="#buildUrl('user.saveChanges')#" method="post"> 
        User Name:<input type="Text" value=#session.user.Login# id="usr_nm" name="usernameEdit"><br>  
        First name:<input type="Text" value=#session.user.Firstname# id="fst_nm" name="fstnameEdit"><br>  
        Last name:<input type="Text" value=#session.user.Lastname# id="lst_nm" name="lstnameEdit"><br>  
        Password:<input type="Password" value=#session.user.Password# id="pswd" name="pswdEdit"><br>  
        <input type="submit" id="my_form_submit" name="my_form_submit" value="Submit"><br>  
    </form>
</cfoutput>