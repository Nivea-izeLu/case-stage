create database IF NOT EXISTS EMPRESA_FICTICIA;

use EMPRESA_FICTICIA;


CREATE TABLE AREA (
    id_area INT AUTO_INCREMENT PRIMARY KEY,  
    nome_area VARCHAR(50) NOT NULL  
    );

    -- adicionar nova area
DELIMITER //
    CREATE PROCEDURE addArea(
        IN p_nome_area VARCHAR(50)
    )
    BEGIN
        INSERT INTO AREA(nome_area)
        VALUES (p_nome_area)
    END //
DELIMITER ;

    -- atualizar dados de area
DELIMITER //
    CREATE PROCEDURE updateArea(
        IN p_id_area INT,
        IN p_nome_area VARCHAR(50)
    )
    BEGIN
        UPDATE AREA
        SET nome_area = p_nome_area
        WHERE id_area = p_id_area
    END//
DELIMITER;

    -- Consultar dados de area
DELIMITER //
    CREATE PROCEDURE consultArea (
        IN p_nome_area VARCHAR(50)
    )
    BEGIN
        SELECT * 
        FROM AREA
        WHERE nome_area LIKE CONCAT('%', p_nome_area, '%');
    END //
DELIMITER ;

    -- deletar area
DELIMITER //
    CREATE PROCEDURE deleteArea(
        IN idArea INT
    )
    BEGIN 
        DELETE FROM AREA WHERE id_area = idArea
    END//
DELIMITER ;



CREATE TABLE PROCESSO (
    id_processo INT AUTO_INCREMENT PRIMARY KEY,  
    nome_processo VARCHAR(50),  
    id_area INT,  
    FOREIGN KEY (id_area) REFERENCES AREA(id_area)  
);

    -- add novo processo
DELIMITER //
    CREATE PROCEDURE addProcesso(
        IN p_nome_processo VARCHAR(50)
    )
    BEGIN 
        INSERT INTO PROCESSO(nome_processo)
        VALUES (p_nome_processo)
    END//
DELIMITER ;

    -- atualizar processo
DELIMITER //
    CREATE PROCEDURE updateProcesso(
        IN p_id_processo INT,
        IN p_nome_processo VARCHAR(50)
    )
    BEGIN 
        UPDATE PROCESSO
        SET nome_processo = p_nome_processo
        WHERE id_processo = p_id_processo
    END//
DELIMITER ;

    -- Consultar processo 
DELIMITER //
    CREATE PROCEDURE consultProcesso (
        IN p_nome_processo VARCHAR(50)
    )
    BEGIN
        SELECT * 
        FROM PROCESSO
        WHERE nome_processo LIKE CONCAT('%', p_nome_processo, '%');
    END //
DELIMITER ;

    -- deletar processo
DELIMITER //
    CREATE PROCEDURE deleteProcesso(
        IN idProcesso INT
    )
    BEGIN
        DELETE FROM PROCESSO WHERE id_processo= idProcesso
    END//
DELIMITER ;



CREATE TABLE DETALHE (
    id_detalhe INT AUTO_INCREMENT PRIMARY KEY,  -
    ferramentas VARCHAR(50),  
    documentacao BLOB,  -- Documentação associada (pode ser um arquivo binário)
    responsaveis VARCHAR(250),  -
    observacao VARCHAR(250), 
    id_processo INT,  
    FOREIGN KEY (id_processo) REFERENCES PROCESSO(id_processo)  
);

    -- add novo detalhe
DELIMITER //
    CREATE PROCEDURE addDetalhe(
        IN p_ferramentas VARCHAR(100),
        IN p_documentacao BLOB,
        IN p_responsaveis VARCHAR(250),
        IN p_observacao VARCHAR(250),
    )
    BEGIN 
        INSERT INTO DETALHE(ferramentas, documentacao, responsaveis, observacao)
        VALUES (p_ferramentas, p_documentacao, p_responsaveis, p_observacao)
    END//
DELIMITER ;

    -- update detalhe
DELIMITER //
    CREATE PROCEDURE updateDetalhe(
        IN p_id_detalhe INT,
        IN p_ferramentas VARCHAR(100),
        IN p_documentacao BLOB,
        IN p_responsaveis VARCHAR(250),
        IN p_observacao VARCHAR(250)
    )
    BEGIN
        UPDATE DETALHE
        SET ferramentas = p_ferramentas, documentacao = p_documentacao, responsaveis = p_responsaveis, observacao = p_observacao
        WHERE id_detalhe = p_id_detalhe 
    END//
DELIMITER ;

    -- Consultar detalhe
DELIMITER //
    CREATE PROCEDURE consultDetalhe (
        IN p_nome_detalhe VARCHAR(50)
        IN p_ferramentas VARCHAR(100),
        IN p_documentacao BLOB,
        IN p_responsaveis VARCHAR(250),
        IN p_observacao VARCHAR(250)
    )
    BEGIN
        SELECT * 
        FROM DETALHE
        WHERE nome_detalhe LIKE CONCAT('%', p_nome_detalhe, '%');
    END //
DELIMITER ;

    -- deletar detalhe
DELIMITER //
    CREATE PROCEDURE deleteDetalhe(
        IN idDetalhe INT
    )
    BEGIN
        DELETE FROM DETALHE WHERE id_detalhe = idDetalhe
    END
DELIMITER;



CREATE TABLE SUBPROCESSO (
    id_sub INT AUTO_INCREMENT PRIMARY KEY,  
    nome_sub VARCHAR(50),  
    status_sub VARCHAR(20),  
    id_processo INT,  
    FOREIGN KEY (id_processo) REFERENCES PROCESSO(id_processo)  
);
    -- add novo subprocesso
DELIMITER //
    CREATE PROCEDURE addSubprocesso(
        IN p_nome_sub VARCHAR(50),
        IN p_status_sub VARCHAR(20)
    )
    BEGIN 
        INSERT INTO SUBPROCESSO(nome_sub, status_sub)
        VALUES (p_nome_sub, p_status_sub)
    ENd//
DELIMITER;

    -- atualizar subprocesso
DELIMITER //
    CREATE PROCEDURE updateSubprocesso(
        IN p_id_sub INT,
        IN p_nome_sub VARCHAR(50),
        IN p_status_sub VARCHAR(20)
    )
    BEGIN 
        UPDATE SUBPROCESSO
        SET nome_sub = p_nome_sub, status_sub = p_status_sub
        WHERE id_sub = p_id_sub
    END//
DELIMITER;

DELIMITER //
    CREATE PROCEDURE consultSubprocesso (
        IN p_nome_sub VARCHAR(50)
    )
    BEGIN
        SELECT * 
        FROM SUBPROCESSO
        WHERE nome_sub LIKE CONCAT('%', p_nome_sub, '%');
    END //
DELIMITER ;

    -- deletar subprocesso
DELIMITER //
    CREATE PROCEDURE deleteSubprocesso(
        IN idSubprocesso INT
    )
    BEGIN
        DELETE FROM SUBPROCESSO WHERE id_sub = idSubprocesso
    END//
DELIMITER;



CREATE TABLE SUB_SUBPROCESSO (
    id_sub_sub INT AUTO_INCREMENT PRIMARY KEY,  
    nome_sub_sub VARCHAR(50),  
    status_sub_sub VARCHAR(20),  
    id_sub INT,  
    -- add id-processo para identificar de qual processo é o subprocesso referente? (analisar problema no json)
    FOREIGN KEY (id_sub) REFERENCES SUBPROCESSO(id_sub)
);  
    -- adiciona novo sub-subprocesso
DELIMITER //
    CREATE PROCEDURE addSubSub(
        IN p_nome_sub_sub VARCHAR(50)
        IN p_status_sub_sub VARCHAR(20)
    )
    BEGIN
        INSERT INTO SUB_SUBPROCESSO(nome_sub_sub, status_sub_sub)
        VALUES (p_nome_sub_sub, p_status_sub_sub)
    END//
DELIMITER ;

    -- atualiza sub-subprocesso
DELIMITER //
    CREATE PROCEDURE updateSubSub(
        IN p_id_sub_sub INT
        IN p_nome_sub_sub VARCHAR(50),
        IN p_status_sub_sub VARCHAR(20)
    )
    BEGIN 
        UPDATE SUB_SUBPROCESSO
        SET nome_sub_sub = p_nome_sub_sub, status_sub_sub = p_status_sub_sub
        WHERE id_sub_sub = p_id_sub_sub
    END//
DELIMITER ;

DELIMITER //
    CREATE PROCEDURE consultSubsub (
        IN p_nome_sub_sub VARCHAR(50)
    )
    BEGIN
        SELECT * 
        FROM SUB_SUBPROCESSO
        WHERE nome_sub_sub LIKE CONCAT('%', p_nome_sub_sub, '%');
    END //
DELIMITER ;

    -- remove sub-subprocesso
DELIMITER //
    CREATE PROCEDURE deleteSubSub(
        IN idSubSub INT
    )
    BEGIN
        DELETE FROM SUB_SUBPROCESSO WHERE id_sub_sub = idSubSub
    END//
DELIMITER;