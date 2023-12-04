component displayname="Bug service" accessors="true" {
    public any function init (  ) {
    }
    
    public query function getAllusers () {
        return queryExecute( 
           "SELECT * FROM [ User ] be
            ORDER BY be.Login ASC"
        );
    }

    public query function getAllBugs () {
        return queryExecute( 
           "SELECT * FROM view_Bug be
            ORDER BY be.DateCreated ASC"
        );
    }

    public query function getAllBugsOrdBug_ID () {
        return queryExecute( 
           "SELECT * FROM view_Bug be
            ORDER BY be.Bug_ID ASC"
        );
    }

    public query function getAllBugsOrdLoginCreated () {
        return queryExecute( 
           "SELECT * FROM view_Bug be
            ORDER BY be.LoginCreated ASC"
        );
    }

    public query function getAllBugsOrdLoginAppointed () {
        return queryExecute( 
           "SELECT * FROM view_Bug be
            ORDER BY be.LoginAppointed ASC"
        );
    }

    public query function getAllOrdBrief () {
        return queryExecute( 
           "SELECT * FROM view_Bug be
            ORDER BY be.Brief ASC"
        );
    }

    public query function getAllOrdDateCreated () {
        return queryExecute( 
           "SELECT * FROM view_Bug be
            ORDER BY be.DateCreated ASC"
        );
    }

    public query function getAllOrdDescription () {
        return queryExecute( 
           "SELECT * FROM view_Bug be
            ORDER BY be.Description ASC"
        );
    }

    public query function getAllOrdCriticality () {
        return queryExecute( 
           "SELECT * FROM view_Bug be
            ORDER BY be.Criticality_ID ASC"
        );
    }

    public query function getAllOrdStatus () {
        return queryExecute( 
           "SELECT * FROM view_Bug be
            ORDER BY be.Status_ID ASC"
        );
    }

    public query function getAllOrdUrgency () {
        return queryExecute( 
           "SELECT * FROM view_Bug be
            ORDER BY be.Urgency_ID ASC"
        );
    }

    public query function getOldVersions (id) {
        return queryExecute( 
           "SELECT * FROM view_OldVersion be
            WHERE be.Bug_ID = :id
            ORDER BY be.DateChanged ASC",
            {id = id}
        );
    }

    public query function getBugById (id) {
        return queryExecute( 
           "SELECT * FROM Bug be 
            WHERE be.Bug_ID = :id",
            {id = id}
        );
    }

    public void function new (
        brief, description, user_created, 
        user_appointed, status, urgency, criticality) {
        spService = new storedProc();
        spService.setDatasource("bugtracker");
        spService.setProcedure("AddNewBug");
        spService.addParam(dbvarname="@brief", value=brief, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@description", value=description, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@user_created_login", value=user_created, cfsqltype="CF_SQL_INTEGER");
        spService.addParam(dbvarname="@user_appointed_login", value=user_appointed, cfsqltype="CF_SQL_INTEGER");
        spService.addParam(dbvarname="@status", value=status, cfsqltype="CF_SQL_INTEGER");
        spService.addParam(dbvarname="@urgency", value=urgency, cfsqltype="CF_SQL_INTEGER");
        spService.addParam(dbvarname="@criticality", value=criticality, cfsqltype="CF_SQL_INTEGER");
        spService.execute()
    }

    public void function edit (
        user_changed_id, bug_id, brief, description, user_appointed_id,
        status_id, urgency_id, criticality_id, comment) {
        spService = new storedProc();
        spService.setDatasource("bugtracker");
        spService.setProcedure("UpdateBug");
        spService.addParam(dbvarname="@bug_id", value=bug_id, cfsqltype="CF_SQL_INTEGER");
        spService.addParam(dbvarname="@brief", value=brief, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@description", value=description, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@user_appointed_id", value=user_appointed_id, cfsqltype="CF_SQL_INTEGER");
        spService.addParam(dbvarname="@status_id", value=status_id, cfsqltype="CF_SQL_INTEGER");
        spService.addParam(dbvarname="@urgency_id", value=urgency_id, cfsqltype="CF_SQL_INTEGER");
        spService.addParam(dbvarname="@criticality_id", value=criticality_id, cfsqltype="CF_SQL_INTEGER");
        spService.addParam(dbvarname="@comment", value=comment, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@user_changed_id", value=user_changed_id, cfsqltype="CF_SQL_INTEGER");
        spService.execute()
    }

    // public query function oldVersions (bug_id) {
    //     spService = new storedProc();
    //     spService.setDatasource("bugtracker");
    //     spService.setProcedure("UpdateBug");
    //     spService.addParam(dbvarname="@bug_id", value=bug_id, cfsqltype="CF_SQL_INTEGER");
    //     spService.addParam(dbvarname="@brief", value=brief, cfsqltype="CF_SQL_VARCHAR");
    //     spService.addParam(dbvarname="@description", value=description, cfsqltype="CF_SQL_VARCHAR");
    //     spService.addParam(dbvarname="@user_appointed_id", value=user_appointed_id, cfsqltype="CF_SQL_INTEGER");
    //     spService.addParam(dbvarname="@status_id", value=status_id, cfsqltype="CF_SQL_INTEGER");
    //     spService.addParam(dbvarname="@urgency_id", value=urgency_id, cfsqltype="CF_SQL_INTEGER");
    //     spService.addParam(dbvarname="@criticality_id", value=criticality_id, cfsqltype="CF_SQL_INTEGER");
    //     spService.addParam(dbvarname="@comment", value=comment, cfsqltype="CF_SQL_VARCHAR");
    //     spService.addParam(dbvarname="@user_changed_id", value=user_changed_id, cfsqltype="CF_SQL_INTEGER");
    //     spService.execute()
    // }

    

}