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
    <div id="home" class="page-header">
        <div class="container">
            <table id="bugList" 
                   class="table table-bordered 
                table-striped table-hover table-condensed table-dt"    style=" width: 100%; "
                >
                <thead>
                        <th>
                            <cfform id="myForm" name="myForm" action="#buildUrl('bug.listOrdBug_ID')#" method="post"> 
                                <input type="submit" id="my_form_submit" name="my_form_submit" value="ID"><br> 
                            </cfform>
                        </th>
                    <th>
                        <cfform id="myForm" name="myForm" action="#buildUrl('bug.listOrdDateCreated')#" method="post"> 
                            <input type="submit" id="my_form_submit" name="my_form_submit" value="Date Created"><br> 
                        </cfform>
                    </th>
                    <th>
                        <cfform id="myForm" name="myForm" action="#buildUrl('bug.listOrdBrief')#" method="post"> 
                            <input type="submit" id="my_form_submit" name="my_form_submit" value="Brief"><br> 
                        </cfform>
                    </th>
                    <th>
                        <cfform id="myForm" name="myForm" action="#buildUrl('bug.listOrdDescription')#" method="post"> 
                            <input type="submit" id="my_form_submit" name="my_form_submit" value="Description"><br> 
                        </cfform>
                    </th>
                    <th>
                        <cfform id="myForm" name="myForm" action="#buildUrl('bug.listOrdLoginCreated')#" method="post"> 
                            <input type="submit" id="my_form_submit" name="my_form_submit" value="Created by"><br> 
                        </cfform>
                    </th>
                    <th>
                        <cfform id="myForm" name="myForm" action="#buildUrl('bug.listOrdLoginAppointed')#" method="post"> 
                            <input type="submit" id="my_form_submit" name="my_form_submit" value="Apointed to"><br> 
                        </cfform>
                    </th>
                    <th>
                        <cfform id="myForm" name="myForm" action="#buildUrl('bug.listOrdCriticality')#" method="post"> 
                            <input type="submit" id="my_form_submit" name="my_form_submit" value="Criticality"><br> 
                        </cfform>
                    </th>
                    <th>
                        <cfform id="myForm" name="myForm" action="#buildUrl('bug.listOrdStatus')#" method="post"> 
                            <input type="submit" id="my_form_submit" name="my_form_submit" value="Status"><br> 
                        </cfform>
                    </th>
                    <th>
                        <cfform id="myForm" name="myForm" action="#buildUrl('bug.listOrdUrgency')#" method="post"> 
                            <input type="submit" id="my_form_submit" name="my_form_submit" value="Urgency"><br> 
                        </cfform>
                    </th>
                </thead>

                <cfif NOT IsQuery(session.bugList) OR session.bugList.recordCount EQ 0>
                    <cfoutput>The bug list is empty.</cfoutput>
                <cfelse>
                    <tbody>
                        <cfloop query="session.bugList" >
                            <tr>
                                <tbody>
                                    <cfloop query="session.bugList" >
                                        <tr>
                                            <td class="text-left" name=cur_bug_id value=#session.bugList.Bug_ID# >
                                                #session.bugList.Bug_ID#
                                            </td>
                                            <td class="text-left">
                                                #session.bugList.DateCreated#
                                            </td>
                                            <td class="text-left">
                                                #session.bugList.Brief#
                                            </td>
                                            <td class="text-left">
                                                #session.bugList.Description#
                                            </td>
                                            <td class="text-left">
                                                #session.bugList.LoginCreated#
                                            </td>
                                            <td class="text-left">
                                                #session.bugList.LoginAppointed#
                                            </td>
                                            <td class="text-left">
                                                #session.bugList.Criticality#
                                            </td>
                                            <td class="text-left">
                                                #session.bugList.Status#
                                            </td>
                                            <td class="text-left">
                                                #session.bugList.Urgency#
                                            <td class="text-left">
                                                <a href="#BuildURL( action='bug.edit', queryString = { cur_bug_id = session.bugList.Bug_ID }  )#">
                                                    show/edit  
                                                </a>
                                            </td>
                                        </tr>
                                    </cfloop>
                                </tbody>
                            </tr>
                        </cfloop>
                    </tbody>
                </cfif>
                
                

            </table>
        </div>
    </div>
</cfoutput>