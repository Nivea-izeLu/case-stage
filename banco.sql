create database IF NOT EXISTS EMPRESA FICTICIA;

use EMPRESA FICTICIA;


CREATE TABLE AREA (
    id_area INT AUTO_INCREMENT PRIMARY KEY,  
    nome_area VARCHAR(100) NOT NULL  
    );


CREATE TABLE PROCESSO (
    id_processo INT AUTO_INCREMENT PRIMARY KEY,  
    nome_processo VARCHAR(50),  
    id_area INT,  
    FOREIGN KEY (id_area) REFERENCES AREA(id_area)  
);


CREATE TABLE DETALHE (
    id_detalhe INT AUTO_INCREMENT PRIMARY KEY,  -
    ferramentas VARCHAR(50),  
    documentacao BLOB,  -- Documentação associada (pode ser um arquivo binário)
    responsaveis VARCHAR(250),  -
    observacao VARCHAR(250), 
    id_processo INT,  
    FOREIGN KEY (id_processo) REFERENCES PROCESSO(id_processo)  
);
CREATE TABLE SUBPROCESSO (
    id_sub INT AUTO_INCREMENT PRIMARY KEY,  
    nome_sub VARCHAR(50),  
    status_sub VARCHAR(20),  
    id_processo INT,  
    FOREIGN KEY (id_processo) REFERENCES PROCESSO(id_processo)  
);


CREATE TABLE SUB_SUBPROCESSO (
    id_sub_sub INT AUTO_INCREMENT PRIMARY KEY,  
    nome_sub_sub VARCHAR(50),  
    status_sub_sub VARCHAR(20),  
    id_sub INT,  
    FOREIGN KEY (id_sub) REFERENCES SUBPROCESSO(id_sub)
);  