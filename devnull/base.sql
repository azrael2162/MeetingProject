#------------------------------------------------------------
#        Script MySQL.
#-----------------------------------------------------------
DROP DATABASE IF EXISTS meetingproject;
CREATE DATABASE meetingproject;
USE meetingproject;

#------------------------------------------------------------
# Table: group_privileges
#------------------------------------------------------------

DROP TABLE IF EXISTS group_privileges;
CREATE TABLE group_privileges(
        id_group   Int  Auto_increment  NOT NULL ,
        group_type Varchar (10)
	,CONSTRAINT group_privileges_PK PRIMARY KEY (id_group)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: project
#------------------------------------------------------------
DROP TABLE IF EXISTS project;
CREATE TABLE project(
        id_project         Int  Auto_increment  NOT NULL ,
        project_name       Varchar (20) ,
        project_content    Text ,
        project_attachment Varchar (20) ,
        project_image      Varchar (20)
	,CONSTRAINT project_PK PRIMARY KEY (id_project)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: comment
#------------------------------------------------------------
DROP TABLE IF EXISTS comment;
CREATE TABLE comment(
        id_comment      Int  Auto_increment  NOT NULL ,
        comment_date    Date ,
        comment_content Varchar (100)
	,CONSTRAINT comment_PK PRIMARY KEY (id_comment)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: email
#------------------------------------------------------------

DROP TABLE IF EXISTS email;
CREATE TABLE email(
        id_email      Int  Auto_increment  NOT NULL ,
        email_object  Varchar (50) ,
        email_content Text
	,CONSTRAINT email_PK PRIMARY KEY (id_email)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

DROP TABLE IF EXISTS user;
CREATE TABLE user(
        id_user             Int  Auto_increment  NOT NULL ,
        user_name           Varchar (10) ,
        user_lastname       Varchar (30) ,
        user_adress_zip     Int ,
        user_address_street Varchar (50) ,
        user_country        Varchar (20) ,
        user_region         Varchar (25) ,
        user_pseudo         Varchar (25) ,
        user_password       Varchar ,
        user_image          Varchar ,
        user_email          Varchar (30) ,
        id_project          Int NOT NULL ,
        id_group            Int NOT NULL ,
        id_email            Int NOT NULL ,
        id_comment          Int NOT NULL
	,CONSTRAINT user_PK PRIMARY KEY (id_user)

	,CONSTRAINT user_project_FK FOREIGN KEY (id_project) REFERENCES project(id_project)
	,CONSTRAINT user_group_privileges0_FK FOREIGN KEY (id_group) REFERENCES group_privileges(id_group)
	,CONSTRAINT user_email1_FK FOREIGN KEY (id_email) REFERENCES email(id_email)
	,CONSTRAINT user_comment2_FK FOREIGN KEY (id_comment) REFERENCES comment(id_comment)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: friend
#------------------------------------------------------------
DROP TABLE IF EXISTS friend;
CREATE TABLE friend(
        id_user        Int NOT NULL ,
        id_user_friend Int NOT NULL ,
        id_number      Int NOT NULL
	,CONSTRAINT friend_PK PRIMARY KEY (id_user,id_user_friend)

	,CONSTRAINT friend_user_FK FOREIGN KEY (id_user) REFERENCES user(id_user)
	,CONSTRAINT friend_user0_FK FOREIGN KEY (id_user_friend) REFERENCES user(id_user)
)ENGINE=InnoDB;
