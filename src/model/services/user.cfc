component displayname="User service" accessors="true" {
    public any function init (  ) {
    }
    
    public query function getAllusers () {
        return queryExecute( 
           "SELECT * FROM [ User ] be
            WHERE be.User_ID <> 0
            ORDER BY be.Login ASC"
        );
    }
    
    public query function getNumberOfUsers () {
        return queryExecute( 
           "SELECT COUNT(*) FROM [ User ]"
        ); 
    }

    public query function getUserById (id) {
        return queryExecute( 
           "SELECT * FROM [ User ] be 
            WHERE be.User_ID = :id",
            { id = id }
        );
    }
    
    public query function getUserByLoginPass (login, password) {
        return queryExecute( 
           "SELECT Login, Password FROM [ User ] be 
            WHERE be.Login = :login 
            AND be.Password = :password" ,
            { login = login, password = password }
        );
    }


    public query function getIdByLogin (x) {
        
        return queryExecute( 
           "SELECT User_ID FROM [ User ] be 
            WHERE be.Login = :x",
            { x = {value=x, cfsqltype="cf_sql_varchar"} }
        );
    }

    public void function update (
        user_id,
        login,
        firstname,
        lastname,
        password) {
        spService = new storedProc();
        spService.setDatasource("bugtracker");
        spService.setProcedure("UpdateUser");
        spService.addParam(dbvarname="@user_id", value=user_id, cfsqltype="CF_SQL_INTEGER");
        spService.addParam(dbvarname="@login", value=login, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@firstname", value=firstname, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@lastname", value=lastname, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@password", value=password, cfsqltype="CF_SQL_VARCHAR");
        spService.execute()
    }

    public void function register (
        login,
        firstname,
        lastname,
        password) {
        spService = new storedProc();
        spService.setDatasource("bugtracker");
        spService.setProcedure("AddUser");
        spService.addParam(dbvarname="@login", value=login, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@firstname", value=firstname, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@lastname", value=lastname, cfsqltype="CF_SQL_VARCHAR");
        spService.addParam(dbvarname="@password", value=password, cfsqltype="CF_SQL_VARCHAR");
        spService.execute()
    }

}