component displayname="User controller" accessors="true" {
    property userService; 

    public any function init ( fw ) {
        variables.fw = fw;
        return this;
    }

    public void function default ( rc ) {
    }
    
    public void function logout ( rc ) {
        session.userId = 0
        variables.fw.redirect("main");
    }

    public void function list ( rc ) {
        rc.users = userService.getAllUsers();
    }

    public void function edit ( rc ) {
        session.user = userService.getUserById(session.userId)
    }

    public void function saveChanges ( rc ) {
        try {
            userService.update(
                session.userId,
                rc.usernameEdit,
                rc.fstnameEdit,
                rc.lstnameEdit,
                rc.pswdEdit
            )
        } catch (any e) {
            variables.fw.redirect("main.errloginexist");
                // WriteOutput("<script>
                //     console.log('AAAA');
                //     </script>"
                //     )       
        }
        variables.fw.redirect("user.edit");
        
        
    }

    function registrate(rc) {
        if (rc.loginreg != '' && 
            rc.passwordreg != '' && 
            rc.fstnamereg != '' && 
            rc.lstnamereg != '' ) {
            try {
                userService.register(
                    rc.loginreg,
                    rc.passwordreg,
                    rc.fstnamereg,
                    rc.lstnamereg);
                r = userService.getIdByLogin(rc.lstnamereg);
                session.userId = r.User_ID;
                variables.fw.redirect("main.menu");
            } catch (any e) {
                //login exist
            }
        }
        variables.fw.redirect("main");
    }
    
    function authenticate(rc) {
        if (rc.loginlogin != '' && rc.passwordlogin != '') {
            r = userService.getUserByLoginPass(rc.loginlogin, rc.passwordlogin);
            if (r.recordcount != 0) {
                r = userService.getIdByLogin(rc.loginlogin);
                session.userId = r.User_ID;
                variables.fw.redirect("main.menu");
            }
        }
        variables.fw.redirect("main");
    }



}
