#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Theme
#------------------------------------------------------------

CREATE TABLE Theme(
        id_theme Int  Auto_increment  NOT NULL ,
        nomTheme Char (25) NOT NULL
	,CONSTRAINT Theme_PK PRIMARY KEY (id_theme)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Entreprise
#------------------------------------------------------------

CREATE TABLE Entreprise(
        id_entreprise Int  Auto_increment  NOT NULL ,
        nomEntreprise Char (25) NOT NULL
	,CONSTRAINT Entreprise_PK PRIMARY KEY (id_entreprise)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Adherent
#------------------------------------------------------------

CREATE TABLE Adherent(
        nomAdherent        Char (30) NOT NULL ,
        prenomAdherent     Char (30) NOT NULL ,
        mail/loginAdherent Varchar (50) NOT NULL ,
        scoreAdherent      Int NOT NULL ,
        id_entreprise      Int NOT NULL
	,CONSTRAINT Adherent_PK PRIMARY KEY (nomAdherent)

	,CONSTRAINT Adherent_Entreprise_FK FOREIGN KEY (id_entreprise) REFERENCES Entreprise(id_entreprise)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Score
#------------------------------------------------------------

CREATE TABLE Score(
        id_score    Int  Auto_increment  NOT NULL ,
        score       Int NOT NULL ,
        nomAdherent Char (30) NOT NULL
	,CONSTRAINT Score_PK PRIMARY KEY (id_score)

	,CONSTRAINT Score_Adherent_FK FOREIGN KEY (nomAdherent) REFERENCES Adherent(nomAdherent)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Source
#------------------------------------------------------------

CREATE TABLE Source(
        id_source  Int  Auto_increment  NOT NULL ,
        nomSource  Varchar (25) NOT NULL ,
        dateSource Date NOT NULL
	,CONSTRAINT Source_PK PRIMARY KEY (id_source)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Article
#------------------------------------------------------------

CREATE TABLE Article(
        id_article     Int  Auto_increment  NOT NULL ,
        titreArticle   Char (100) NOT NULL ,
        chapeauArticle Char (100) NOT NULL ,
        introArticle   Char (100) NOT NULL ,
        lienArticle    Char (5) NOT NULL ,
        dateArticle    Date NOT NULL ,
        id_theme       Int NOT NULL ,
        id_source      Int NOT NULL
	,CONSTRAINT Article_PK PRIMARY KEY (id_article)

	,CONSTRAINT Article_Theme_FK FOREIGN KEY (id_theme) REFERENCES Theme(id_theme)
	,CONSTRAINT Article_Source0_FK FOREIGN KEY (id_source) REFERENCES Source(id_source)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Question
#------------------------------------------------------------

CREATE TABLE Question(
        id_questions        Int  Auto_increment  NOT NULL ,
        enoncerQuestion     Varchar (50) NOT NULL ,
        reponseQuestion     Bool NOT NULL ,
        propositionQuestion Varchar (50) NOT NULL ,
        id_theme            Int NOT NULL
	,CONSTRAINT Question_PK PRIMARY KEY (id_questions)

	,CONSTRAINT Question_Theme_FK FOREIGN KEY (id_theme) REFERENCES Theme(id_theme)
)ENGINE=InnoDB;

