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
            <table id="users" 
                   class="table table-bordered 
                table-striped table-hover table-condensed table-dt">
                <thead>
                    <th>
                        Login
                    </th>
                    <th>
                        Firstname
                    </th>
                    <th>
                        Lastname
                    </th>
                </thead>
                <tbody>
                    <cfloop query="rc.users">
                        <tr>
                            <td class="text-left">
                                #rc.users.Login#
                            </td>
                            <td class="text-left">
                                #rc.users.Firstname#
                            </td>
                            <td class="text-left">
                                #rc.users.Lastname#
                            </td>
                        </tr>
                    </cfloop>
                </tbody>
            </table>
        </div>
    </div>
</cfoutput>