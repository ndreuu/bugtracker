component displayname="Bug controller" accessors="true" {
    property bugService;

    public any function init ( fw ) {
        variables.fw = fw;
        return this;
    }
    
    public void function default ( rc ) {
    }
    
    public void function list ( rc ) {
    }

    public void function listOrdBug_ID ( rc ) {
        session.bugList = bugService.getAllBugsOrdBug_ID();
        variables.fw.redirect(action='bug.list');
    }

    public void function listOrdLoginCreated ( rc ) {
        session.bugList = bugService.getAllBugsOrdLoginCreated();
        variables.fw.redirect(action='bug.list');
    }
    
    public void function listOrdLoginAppointed ( rc ) {
        session.bugList = bugService.getAllBugsOrdLoginAppointed();
        variables.fw.redirect(action='bug.list');
    }

    public void function listOrdBrief ( rc ) {
        session.bugList = bugService.getAllOrdBrief();
        variables.fw.redirect(action='bug.list');
    }
    
    public void function listOrdDateCreated ( rc ) {
        session.bugList = bugService.getAllOrdDateCreated();
        variables.fw.redirect(action='bug.list');
    
    }
    
    public void function listOrdDescription ( rc ) {
        session.bugList = bugService.getAllOrdDescription();
        variables.fw.redirect(action='bug.list');
    }

    public void function listOrdCriticality ( rc ) {
        session.bugList = bugService.getAllOrdCriticality();
        variables.fw.redirect(action='bug.list');
    }
    
    public void function listOrdStatus ( rc ) {
        session.bugList = bugService.getAllOrdStatus();
        variables.fw.redirect(action='bug.list');
    }

    public void function listOrdUrgency ( rc ) {
        session.bugList = bugService.getAllOrdUrgency();
        variables.fw.redirect(action='bug.list');
    }

    
    public void function new ( rc ) {
        WriteOutput("<script>
            console.log('#session.userId#');
            </script>"
            )       
        if (structKeyExists(rc, "my_form_submit")) {
            bugService.new(
                rc.briefInput,
                rc.descriptionInput,
                session.userId,
                rc.user_appointed_input,
                rc.status_input,
                rc.urgency_input,
                rc.criticality_input
            )
            
            variables.fw.redirect(action='bug.listOrdBug_ID');
        }
    }

    public void function edit ( rc, cur_bug_id ) {
        session.cur_bug = bugService.getBugById(cur_bug_id) 
        rc.bugOlds = bugService.getOldVersions(cur_bug_id);
    }

    public void function saveEdit ( rc ) {
        if (structKeyExists(rc, "my_form_submit_edit")) {
            if (rc.comment != '') {
                bugService.edit(
                            session.userId,
                            session.cur_bug.Bug_ID, 
                            rc.briefInput, 
                            rc.descriptionInput, 
                            rc.user_appointed_input,
                            rc.status_input, 
                            rc.urgency_input, 
                            rc.criticality_input, 
                            rc.comment
                        )
                variables.fw.redirect(action='bug.edit', queryString={ cur_bug_id=session.cur_bug.Bug_ID });
            }
            variables.fw.redirect(action='bug.edit', queryString={ cur_bug_id=session.cur_bug.Bug_ID });
        }
    }

}