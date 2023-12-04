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
<!--- TO DO: RM THIS SHIT --->
<cfquery name="getLogins" datasource="bugtracker">
    SELECT * FROM [ User ] be 
    ORDER BY be.Login ASC
</cfquery>
<cfquery name="getStatuses" datasource="bugtracker">
    SELECT * FROM Status be 
    ORDER BY be.Status_ID ASC
</cfquery>
<cfquery name="getUrgency" datasource="bugtracker">
    SELECT * FROM Urgency be 
    ORDER BY be.Urgency_ID ASC
</cfquery>
<cfquery name="getCriticality" datasource="bugtracker">
    SELECT * FROM Criticality be 
    ORDER BY be.Criticality_ID ASC
</cfquery>
<cfoutput> 
    <cfform id="myForm" name="myForm" action="#buildUrl('bug.new')#" method="post"> 
        Brief:<input type="Text" id="usr_nm" name="briefInput"><br> 
        Description:<input type="Text" id="usr_nm" name="descriptionInput" style="font-size: 11pt; height: 40px; width:280px; "><br> 
        Appoint to:
            <cfselect name="user_appointed_input" query="getLogins" selected=#0# value="User_ID" display="Login" required="Yes" multiple="No" size="1">
            </cfselect>
            <br>
        Status:
            <cfselect name="status_input" query="getStatuses" value="Status_ID" display="Status" required="Yes" multiple="No" size="1">
            </cfselect>
            <br>
        Urgency:
            <cfselect name="urgency_input" query="getUrgency" value="Urgency_ID" display="Urgency" required="Yes" multiple="No" size="1">
            </cfselect>
            <br>
        Criticality:
            <cfselect name="criticality_input" query="getCriticality" value="Criticality_ID" display="Criticality" required="Yes" multiple="No" size="1">
            </cfselect>
            <br>
        <input type="submit" id="my_form_submit" name="my_form_submit" value="Submit"><br> 
    </cfform> 
</cfoutput> 