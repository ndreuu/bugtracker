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
    <table border="1">
        <tr>
          <td>
            <cfform id="myForm" name="myForm" action="#buildUrl('bug.saveEdit')# " method="post"> 
                Brief:<input type="Text" id="usr_nm" name="briefInput" value=#session.cur_bug.Brief# ><br> 
                Description:<input type="Text" id="usr_nm" name="descriptionInput" value=#session.cur_bug.Description# ><br> 
                Appoint to:
                    <cfselect name="user_appointed_input" selected=#session.cur_bug.User_Appointed_ID# query="getLogins" value="User_ID" display="Login" required="Yes" multiple="No" size="1">
                    </cfselect>
                    <br>
                Status:
                    <cfselect name="status_input" selected=#session.cur_bug.Status_ID# query="getStatuses" value="Status_ID" display="Status" required="Yes" multiple="No" size="1">
                    </cfselect>
                    <br>
                Urgency:
                    <cfselect name="urgency_input" selected=#session.cur_bug.Urgency_ID# query="getUrgency" value="Urgency_ID" display="Urgency" required="Yes" multiple="No" size="1">
                    </cfselect>
                    <br>
                Criticality:
                    <cfselect name="criticality_input" selected=#session.cur_bug.Criticality_ID# query="getCriticality" value="Criticality_ID" display="Criticality" required="Yes" multiple="No" size="1">
                    </cfselect>
                    <br>
                Comment:<input type="Text" id="usr_nm" name="comment" value="" ><br>
                <input type="submit" id="my_form_submit" name="my_form_submit_edit" value="Submit"><br> 
            </cfform>         
          </td>
          <td>
            <div id="home" class="page-header">
                <div class="container">
                    <table id="bugOlds" 
                           class="table table-bordered 
                        table-striped table-hover table-condensed table-dt"    style=" width: 100%; "
                        >
                        <thead>
                            <th>
                                Changed by 
                            </th>
                            <th>
                                Comment 
                            </th>
                            <th>
                                Date Created
                            </th>
                            <th>
                                Date of Changed
                            </th>
                            <th>
                                Brief
                            </th>
                            <th>
                                Description
                            </th>
                            <th>
                                Created by
                            </th>
                            <th>
                                Apointed to
                            </th>
                            <th>
                                Criticality
                            </th>
                            <th>
                                Status
                            </th>
                            <th>
                                Urgency
                            </th>
                            <th>
                                
                            </th>
                        </thead>
                        <tbody>
                            <cfloop query="rc.bugOlds" >
                                <tr>
                                    <td class="text" name=cur_bug_id value=#rc.bugOlds.Bug_ID# >
                                        #rc.bugOlds.Login#
                                    </td>
                                    <td class="text" name=cur_bug_id value=#rc.bugOlds.Bug_ID# >
                                        #rc.bugOlds.Comment#
                                    </td>
                                    <td class="text-left">
                                        #rc.bugOlds.DateCreated#
                                    </td>
                                    <td class="text-left">
                                        #rc.bugOlds.DateChanged #
                                    </td>
                                    <td class="text-left">
                                        #rc.bugOlds.Brief#
                                    </td>
                                    <td class="text-left">
                                        #rc.bugOlds.Description#
                                    </td>
                                    <td class="text-left">
                                        #rc.bugOlds.LoginCreated#
                                    </td>
                                    <td class="text-left">
                                        #rc.bugOlds.LoginAppointed#
                                    </td>
                                    <td class="text-left">
                                        #rc.bugOlds.Criticality#
                                    </td>
                                    <td class="text-left">
                                        #rc.bugOlds.Status#
                                    </td>
                                    <td class="text-left">
                                        #rc.bugOlds.Urgency#
                                    </td>
                                    </td>
                                </tr>
                            </cfloop>
                        </tbody>
                    </table>
                </div>
            </div>
          </td>
        </tr>
      </table>
</cfoutput> 