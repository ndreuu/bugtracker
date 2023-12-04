component extends="framework.one" {

    function setupApplication() { }

    function setupEnvironment( env ) { }

    function setupSession() {
        session.userId = 0
        session.userName = '-';
        session.userPassword = '-';
        session.bugList = ''
        
        session.criticality.accident = 0
        session.criticality.critical = 1
        session.criticality.noncritical = 2
        session.criticality.fixrequest = 3
        session.status.new = 0
        session.status.opened = 1
        session.status.fixed = 2
        session.status.closed = 3
        session.urgency.veryurgent = 0
        session.urgency.urgently = 1
        session.urgency.noturgent = 2
        session.urgency.noturgentatall = 3


        try {
            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Criticality(Criticality_ID, Criticality)
            VALUES (0, 'accident')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Criticality(Criticality_ID, Criticality)
            VALUES (1, 'critical')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Criticality(Criticality_ID, Criticality)
            VALUES (2, 'noncritical')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Criticality(Criticality_ID, Criticality)
            VALUES (3, 'fix request')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Status(Status_ID, Status)
            VALUES (0, 'new')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Status(Status_ID, Status)
            VALUES (1, 'opened')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Status(Status_ID, Status)
            VALUES (2, 'fixed')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Status(Status_ID, Status)
            VALUES (3, 'closed')
            ");
            queryService.execute();


            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Urgency(Urgency_ID, Urgency)
            VALUES (0, 'very urgent')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Urgency(Urgency_ID, Urgency)
            VALUES (1, 'urgently')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Urgency(Urgency_ID, Urgency)
            VALUES (2, 'not urgent')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO Urgency(Urgency_ID, Urgency)
            VALUES (3, 'not urgent at all')
            ");
            queryService.execute();

            queryService = new query();
            queryService.setDatasource("bugtracker");
            queryService.setSQL("
            INSERT INTO [ User ] (User_ID, Login, Firstname, Lastname, Password)
            VALUES (0, 'Unknown', 'Unknown', 'Unknown', 'Unknown')
            ");
            queryService.execute();

        

        } catch (any e)
        {  
            // db was initilized latter 
        }
    }

    function setupRequest() {
        // use setupRequest to do initialization per request
        request.context.startTime = getTickCount();
    }

    function setupResponse( rc ) { }

    function setupSubsystem( module ) { }

    function setupView( rc ) { 
        
     }

    function before( struct rc ) {
    
    }
}
