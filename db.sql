use bugtracker
create table [ User ]
(
    User_ID INTEGER  NOT NULL,
    Login CHAR(255)  NOT NULL UNIQUE,
    Firstname CHAR(255) NOT NULL,
    Lastname CHAR(255) NOT NULL,
    Password CHAR(255) NOT NULL,
    CONSTRAINT User_PK PRIMARY KEY (User_ID )
)

create table Bug
(
    Bug_ID INTEGER  NOT NULL,
    DateCreated DATETIME NOT NULL DEFAULT(GETDATE()),
    Brief CHAR(255)  NOT NULL,
    Description CHAR(255)  NOT NULL,
    User_Created_ID INTEGER NOT NULL,
    User_Appointed_ID INTEGER,
    Status_ID INTEGER NOT NULL,
    Urgency_ID INTEGER NOT NULL,
    Criticality_ID INTEGER NOT NULL,
    CONSTRAINT Bug_PK PRIMARY KEY (Bug_ID)
)

create table OldVersion
(
    OldVersion_ID INTEGER  NOT NULL,
    Bug_ID INTEGER  NOT NULL,
    DateCreated DATETIME NOT NULL,
    DateChanged DATETIME NOT NULL DEFAULT(GETDATE()),
    Brief CHAR(255)  NOT NULL,
    Description CHAR(255)  NOT NULL,
    Comment CHAR(255)  NOT NULL,
    User_Created_ID INTEGER NOT NULL,
    User_Changed_ID INTEGER NOT NULL,
    User_Appointed_ID INTEGER,
    Status_ID INTEGER NOT NULL,
    Urgency_ID INTEGER NOT NULL,
    Criticality_ID INTEGER NOT NULL,
    CONSTRAINT OldVersion_PK PRIMARY KEY (OldVersion_ID)
)

create table Status
(
    Status_ID  INTEGER  NOT NULL,
    Status CHAR(255)  NOT NULL
    CONSTRAINT Status_PK PRIMARY KEY (Status_ID)
)

create table Urgency
(
    Urgency_ID  INTEGER  NOT NULL,
    Urgency CHAR(255)  NOT NULL
    CONSTRAINT Urgency_PK PRIMARY KEY (Urgency_ID)
)

create table Criticality
(
    Criticality_ID  INTEGER  NOT NULL,
    Criticality CHAR(255)  NOT NULL
    CONSTRAINT Criticality_PK PRIMARY KEY (Criticality_ID)
)

ALTER TABLE Bug ADD CONSTRAINT FK_User_Created
	FOREIGN KEY (User_Created_ID)
	REFERENCES  [ User ](User_ID)
	ON DELETE NO ACTION
;

ALTER TABLE Bug ADD CONSTRAINT FK_User_Appointed
	FOREIGN KEY (User_Appointed_ID)
	REFERENCES  [ User ](User_ID)
	ON DELETE NO ACTION
;

ALTER TABLE Bug ADD CONSTRAINT FK_Status
	FOREIGN KEY (Status_ID)
	REFERENCES  Status(Status_ID)
	ON DELETE NO ACTION
;

ALTER TABLE Bug ADD CONSTRAINT FK_Urgency
	FOREIGN KEY (Urgency_ID)
	REFERENCES  Urgency(Urgency_ID)
	ON DELETE NO ACTION
;

ALTER TABLE Bug ADD CONSTRAINT FK_Criticality
	FOREIGN KEY (Criticality_ID)
	REFERENCES  Criticality(Criticality_ID)
	ON DELETE NO ACTION
;

ALTER TABLE OldVersion ADD CONSTRAINT FK_Bug
	FOREIGN KEY (Bug_ID)
	REFERENCES  Bug(Bug_ID)
	ON DELETE NO ACTION
;

GO
CREATE PROCEDURE AddNewBug
@brief as varchar(255),
@description as varchar(255),
@user_created_login as INTEGER,
@user_appointed_login as INTEGER = null,
@status as INTEGER,
@urgency as INTEGER,
@criticality as INTEGER
AS
BEGIN
    DECLARE @new_id as integer;
    SELECT @new_id=MAX(Bug_ID) FROM Bug;
    if @new_id is not null
        begin
            INSERT INTO Bug (Bug_ID, Brief, Description, User_Created_ID, User_Appointed_ID, Status_ID, Urgency_ID, Criticality_ID)
		        VALUES (@new_id + 1, @brief, @description, @user_created_login, @user_appointed_login, @status, @urgency, @criticality);
        end
	else
        INSERT INTO Bug (Bug_ID, Brief, Description, User_Created_ID, User_Appointed_ID, Status_ID, Urgency_ID, Criticality_ID)
            VALUES (0, @brief, @description, @user_created_login, @user_appointed_login, @status, @urgency, @criticality);
END
GO

GO
CREATE PROCEDURE AddOldVersion
@bug_id as INTEGER,
@comment as CHAR(255),
@user_changed_id  as INTEGER
AS
BEGIN
    DECLARE @new_id as integer;
    SELECT @new_id=MAX(OldVersion_ID) FROM OldVersion;
    if @new_id is not null
        begin
            INSERT INTO OldVersion (User_Changed_ID, OldVersion_ID, Comment, Bug_ID, DateCreated, Brief, Description, User_Created_ID, User_Appointed_ID, Status_ID, Urgency_ID, Criticality_ID)
                SELECT @user_changed_id, @new_id + 1, @comment, Bug_ID, DateCreated, Brief, Description, User_Created_ID, User_Appointed_ID, Status_ID, Urgency_ID, Criticality_ID
                FROM (SELECT * FROM Bug WHERE Bug.Bug_ID = @bug_id) as [B*] ;
        end
    else
        INSERT INTO OldVersion (User_Changed_ID, OldVersion_ID, Comment, Bug_ID, DateCreated, Brief, Description, User_Created_ID, User_Appointed_ID, Status_ID, Urgency_ID, Criticality_ID)
            SELECT @user_changed_id, 0, @comment, Bug_ID, DateCreated, Brief, Description, User_Created_ID, User_Appointed_ID, Status_ID, Urgency_ID, Criticality_ID
            FROM (SELECT * FROM Bug WHERE Bug.Bug_ID = @bug_id) as [B*] ;
END
GO

GO
CREATE PROCEDURE UpdateBug
@bug_id as INTEGER,
@brief as CHAR(255),
@description as CHAR(255),
@user_appointed_id as INTEGER,
@status_id as INTEGER,
@urgency_id as INTEGER,
@criticality_id as INTEGER,
@comment     as CHAR(255),
@user_changed_id  as INTEGER
AS
BEGIN
    EXEC AddOldVersion
        @bug_id = @bug_id,
        @comment = @comment,
        @user_changed_id = @user_changed_id
    UPDATE Bug
        SET  Brief = @brief, Description = @description, User_Appointed_ID = @user_appointed_id, Status_ID = @status_id, Urgency_ID = @urgency_id, Criticality_ID = @criticality_id
        WHERE Bug_ID = @bug_id
END
GO

GO
CREATE PROCEDURE AddUser
@login as CHAR(255),
@firstname as CHAR(255),
@lastname as CHAR(255),
@password as CHAR(255)
AS
BEGIN
    DECLARE @new_id as integer;
    SELECT @new_id=MAX(User_ID) FROM [ User ];
    if @new_id is not null
        begin
            INSERT INTO [ User ] (User_ID, Login, Firstname, Lastname, Password)
		        VALUES (@new_id + 1, @login, @firstname, @lastname, @password);
        end
	else
        INSERT INTO [ User ] (User_ID, Login, Firstname, Lastname, Password)
            VALUES (0, @login, @firstname, @lastname, @password);
END
GO

GO
CREATE PROCEDURE UpdateUser
@user_id as INTEGER,
@login as CHAR(255),
@firstname as CHAR(255),
@lastname as CHAR(255),
@password as CHAR(255)
AS
BEGIN
    UPDATE [ User ]
        SET  Login = @login, Firstname = @firstname, Lastname = @lastname, Password = @password
        WHERE User_ID = @user_id
END
GO

go
create view view_Bug as
select Bug.Bug_ID, Uc.Login as LoginCreated, "[U 2]".Login as LoginAppointed, Bug.Brief, Bug.DateCreated,
       Bug.Description, C.Criticality, C.Criticality_ID,  S.Status, S.Status_ID, U.Urgency, U.Urgency_ID from Bug
    JOIN dbo.Criticality C on C.Criticality_ID = Bug.Criticality_ID
    JOIN dbo.Status S on S.Status_ID = Bug.Status_ID
    JOIN dbo.Urgency U on U.Urgency_ID = Bug.Urgency_ID
    LEFT JOIN dbo.[ User ] "[U 2]" on "[U 2]".User_ID = Bug.User_Appointed_ID
    JOIN dbo.[ User ] Uc on Uc.User_ID = Bug.User_Created_ID
go


go
create view view_OldVersion as
    SELECT OldVersion.OldVersion_ID, Uchanged.Login, OldVersion.Bug_ID, OldVersion.DateCreated, OldVersion.DateChanged,
           OldVersion.Brief, OldVersion.Description, OldVersion.Comment, Uc.Login as LoginCreated, Ua.Login as LoginAppointed,
           C.Criticality, C.Criticality_ID, S.Status, S.Status_ID, U.Urgency, U.Urgency_ID FROM OldVersion
    JOIN [ User ] Uc ON Uc.User_ID = OldVersion.User_Created_ID
    LEFT JOIN [ User ] Ua ON Ua.User_ID = OldVersion.User_Appointed_ID
    LEFT JOIN [ User ] Uchanged ON Uchanged.User_ID = OldVersion.User_Changed_ID
    JOIN Status S ON S.Status_ID = OldVersion.Status_ID
    JOIN Urgency U ON U.Urgency_ID = OldVersion.Urgency_ID
    JOIN Criticality C ON C.Criticality_ID = OldVersion.Criticality_ID
go


