SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS `kudeaketa_7`;
CREATE DATABASE `kudeaketa_7` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `kudeaketa_7`;

-- =============================================================================
-- 1. TAULAK ETA DATUAK
-- =============================================================================

-- 1. ESTRUKTURA ETA DATUAK: ROL
CREATE TABLE `rol` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `izena` VARCHAR(50) NOT NULL UNIQUE COMMENT 'ADMIN, IKASLE, IRAKASLE, INBENTARIO, CHATBOT',
  `deskribapena` VARCHAR(255)
) ENGINE=InnoDB;

INSERT INTO `rol` (`id`, `izena`, `deskribapena`) VALUES
(1, 'ADMIN', 'Administrador del sistema con acceso total'),
(2, 'IKASLE', 'Alumnado con permisos de lectura y consulta de parking'),
(3, 'IRAKASLE', 'Profesorado con permisos sobre su parking e información'),
(4, 'INBENTARIO', 'Gestor de inventario con permisos CRUD en equipos'),
(5, 'CHATBOT', 'Asistente virtual web con permisos exclusivos de consulta y lectura');

-- 2. ESTRUKTURA ETA DATUAK: USUARIOS
CREATE TABLE `usuarios` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `izena` VARCHAR(50) NOT NULL,
  `abizena` VARCHAR(50) NOT NULL,
  `emaila` VARCHAR(100) NOT NULL UNIQUE,
  `pasahitza` VARCHAR(255) NOT NULL,
  `rol_id` INT,
  CONSTRAINT `fk_usuario_rol` 
    FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) 
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO `usuarios` (`id`, `izena`, `abizena`, `emaila`, `pasahitza`, `rol_id`) VALUES
(1, 'Aitor', 'Iturbe', 'aitor.admin@tartanga.eu', '1234', 1),
(2, 'Miren', 'Goikoetxea', 'miren.ikasle@tartanga.eu', '1234', 2),
(3, 'Unai', 'Etxebarria', 'unai.ikasle@tartanga.eu', '1234', 2),
(4, 'Jon', 'Urrutia', 'jon.irakasle@tartanga.eu', '1234', 3),
(5, 'Ane', 'Zubizarreta', 'ane.irakasle@tartanga.eu', '1234', 3),
(6, 'Koldo', 'Garcia', 'koldo.inbentario@elorrieta.eu', '1234', 4),
(7, 'Amaia', 'Larrañaga', 'amaia.irakasle@elorrieta.eu', '1234', 3),
(8, 'Iker', 'Bilbao', 'iker.ikasle@elorrieta.eu', '1234', 2),
(9, 'Nerea', 'Agirre', 'nerea.admin@txurdinaga.eu', '1234', 1),
(10, 'Gorka', 'Mendoza', 'gorka.irakasle@txurdinaga.eu', '1234', 3),
(11, 'Bot', 'Assistant', 'chatbot.service@web.eu', '1234', 5);

-- 3. ESTRUKTURA ETA DATUAK: INBENTARIO
CREATE TABLE `inbentario` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `izena` VARCHAR(100) NOT NULL,
  `kopurua` INT NOT NULL DEFAULT 1,
  `egoera` ENUM('ONDO', 'ERABILI_EZINIK', 'MANTENIMENDUAN', 'GALDUTAKO') DEFAULT 'ONDO'
) ENGINE=InnoDB;

INSERT INTO `inbentario` (`id`, `izena`, `kopurua`, `egoera`) VALUES
(1, 'Plaka Nagusia (Xafla) - Intel - Desktop Board 01', 1, 'ONDO'),
(2, 'Txartel Grafikoa (Grafika) - NVIDIA - GeForce GT 218', 1, 'ONDO'),
(3, 'Disko Gogorra 1 - Western Digital - WD Blue SATA (WD5000AAKX)', 1, 'ONDO'),
(4, 'Disko Gogorra 2 - Seagate - Barracuda 7200.12 (ST3500418AS)', 1, 'ONDO'),
(5, 'RAM Memoria - Generikoa / Hainbat - DDR3 SDRAM', 1, 'ONDO'),
(6, 'Energi-iturria - PC CASE - PC CASE 600 (PC ATX 2.2 P4)', 1, 'ONDO'),
(7, 'Kaxa / Txasisa - Antec - NSK4482B', 1, 'ONDO'),
(8, 'Unitate Optikoa / DVD Irakurgailua - LG - DVD 24x (Irakurgailu eta grabagailua)', 1, 'ONDO'),
(9, 'Prozesadorea - Intel - Intel Core I3 540', 1, 'ONDO'),
(10, 'Disipadorea CPU - Intel - E97379-001 (Stock Cooler)', 1, 'ONDO'),
(11, 'Prozesadorea - Intel - Core i7-3770 3.4 GHz', 1, 'ONDO'),
(12, 'Disipadorea CPU - CYRMZAY - Stock LGA1155', 1, 'ONDO'),
(13, 'Plaka Nagusia (Xafla) - ASUS - P8H61-MX USB3', 1, 'ONDO'),
(14, 'Txartel Grafikoa (Grafika) - AMD - Radeon HD 3650 - 512 MB DDR2', 1, 'ONDO'),
(15, 'Disko Gogorra 1 - Western Digital - WD Blue 500GB SATA', 1, 'ONDO'),
(16, 'RAM Memoria 1 - Kingston - KVR16N11/8 - 8 GB DDR3 - 1600', 1, 'ONDO'),
(17, 'RAM Memoria 2 - Kingston - KVR1333D3N9/4 - 4 GB DDR3 - 1333', 1, 'ONDO'),
(18, 'Energi-iturria - FSP Group - FSP300-60EP(2) - 300W', 1, 'ONDO'),
(19, 'Kaxa / Txasisa - APITECG - ATX', 1, 'ONDO'),
(20, 'Unitate Optikoa / DVD Irakurgailua - LG - GH24NSB0 (DVD + RW, Super multi)', 1, 'ONDO'),
(21, 'RAM memoria - Kingston - DDR3', 1, 'ONDO'),
(22, 'Txartel grafikoa - XpertVision - DDR2 (HD2400PRO)', 1, 'ONDO'),
(23, 'Prozesadorea - Intel - Intel core i5-2400', 1, 'ONDO'),
(24, 'Plaka nagusia - Intel - btbl134009cc', 1, 'ONDO'),
(25, 'Disko gogorra - Seagate - Barracuda 7200.12', 1, 'ONDO'),
(26, 'Alimentazio iturria - Hiditec - PSX 500W', 1, 'ONDO'),
(27, 'Kutxa - LG - X-Lan', 1, 'ONDO'),
(28, 'Disipadorea - Intel - E30307-001', 1, 'ONDO'),
(29, 'DVD irakurgailua - LG - GH22NS70', 1, 'ONDO'),
(30, 'Plaka - Asus - B85M-G', 1, 'ONDO'),
(31, 'Kutxa - NOX - /', 1, 'ONDO'),
(32, 'Txartel grafikoa - Asus - C872MP1', 1, 'ONDO'),
(33, 'Disipadorea - Intel - E97378-001', 1, 'ONDO'),
(34, 'RAM - Kingstom - KVR13N9S8/2', 1, 'ONDO'),
(35, 'RAM - Kingstom - KVR16N11S8/4', 1, 'ONDO'),
(36, 'Alimentazio iturria - Huntkey - HK350-12PP', 1, 'ONDO'),
(37, 'Disko gogorra - WD - WD5000AAKX', 1, 'ONDO'),
(38, 'Irakurgailua - Super WriteMaster - M-DISC', 1, 'ONDO'),
(39, 'Energia-Iturria - Anima - APSI500', 1, 'ONDO'),
(40, 'Energia-Iturria - ASUS - A-30F', 1, 'ERABILI_EZINIK'),
(41, 'Energia-Iturria - Hiditec - Seo 500W', 1, 'ERABILI_EZINIK'),
(42, 'Prozesadorea (CPU) - Intel - Core i7-3770', 5, 'ERABILI_EZINIK'),
(43, 'Plaka Nagusia - Gigabyte - GA-945P-S3', 2, 'ERABILI_EZINIK'),
(44, 'Disko Gogorra (IDE/ATA) - Seagate - Barracuda ATA IV (ST340016A)', 1, 'ERABILI_EZINIK'),
(45, 'Disko Gogorra (SATA) - Hitachi - Deskstar (HDS725050KLA360)', 1, 'ERABILI_EZINIK'),
(46, 'Txartel grafikoa - Acer - AT Radeon HD 3650', 1, 'ERABILI_EZINIK'),
(47, 'Txartel Grafikoa (GPU) - ASUS - GeForce EN210 Silent', 2, 'ERABILI_EZINIK'),
(48, 'Txartel Grafikoa - ASUS - EN210 SILENT/DI/1GD3/V2(LP)', 1, 'ERABILI_EZINIK'),
(49, 'Txartel Grafikoa - Palit - GeForce GT 210', 1, 'MANTENIMENDUAN'),
(50, 'Disipadorea - AVC - Standard Fan', 1, 'MANTENIMENDUAN'),
(51, 'Disipadorea - AVC / Lenovo - (FRU) 03T9513.', 1, 'MANTENIMENDUAN'),
(52, 'Haizagailua - Generikoa / OEM - Barneko PC Hizlaria', 1, 'MANTENIMENDUAN'),
(53, 'Grabagailu/Irakurgailu Optikoa - Lite-On - DH-16AFSH', 1, 'MANTENIMENDUAN'),
(54, 'RAM 1 - Corsair - V8512MB400C·', 1, 'MANTENIMENDUAN'),
(55, 'RAM 2 - Elixir - M2U51264DS8HAOG', 1, 'MANTENIMENDUAN'),
(56, 'RAM 3 - Trascend - 113416-1988', 1, 'MANTENIMENDUAN'),
(57, 'RAM 4 - Infineon - HYS64D32300GU-5-C', 1, 'MANTENIMENDUAN'),
(58, 'RAM 5 - Samsung - M368L6423DTL', 1, 'GALDUTAKO'),
(59, 'RAM 6 - E-Bridge - 256DDR PC266', 1, 'GALDUTAKO'),
(60, 'RAM 8 - Corsair - ValueSelect (VS512MB400C3)', 1, 'GALDUTAKO');

-- 4. ESTRUKTURA ETA DATUAK: PARKING
CREATE TABLE `parking` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `plaza_numero` INT NOT NULL,
  `rol_mota_id` INT DEFAULT NULL COMMENT 'Plaza mota (IKASLE=2, IRAKASLE=3, BISITARI=NULL)',
  `egoera` ENUM('LIBRE', 'OKUPATUA', 'ERRESERBATUA', 'INHABILITATUA') NOT NULL DEFAULT 'LIBRE',
  `erabiltzaile_id` INT DEFAULT NULL,
  `bisitari_izena` VARCHAR(100) DEFAULT NULL,
  `bisitari_emaila` VARCHAR(100) DEFAULT NULL,
  `matrikula` VARCHAR(15) NOT NULL,
  `erreserba_data` DATETIME DEFAULT NULL,
  `sarrera_data` DATETIME NOT NULL,
  `irteera_data` DATETIME NOT NULL,
  CONSTRAINT `fk_parking_usuario` 
    FOREIGN KEY (`erabiltzaile_id`) REFERENCES `usuarios` (`id`) 
    ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_parking_rol` 
    FOREIGN KEY (`rol_mota_id`) REFERENCES `rol` (`id`) 
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO `parking` (`id`, `plaza_numero`, `rol_mota_id`, `egoera`, `erabiltzaile_id`, `bisitari_izena`, `bisitari_emaila`, `matrikula`, `erreserba_data`, `sarrera_data`, `irteera_data`) VALUES
(1, 101, 2, 'ERRESERBATUA', 2, NULL, NULL, '1234ABC', '2026-10-02 08:00:00', '2026-10-02 08:05:00', '2026-10-02 14:00:00'),
(2, 102, 2, 'LIBRE', 3, NULL, NULL, '5555BBB', NULL, '2026-10-02 08:10:00', '2026-10-02 13:30:00'),
(3, 201, 3, 'OKUPATUA', 4, NULL, NULL, '9999XYZ', '2026-10-02 07:30:00', '2026-10-02 07:45:00', '2026-10-02 15:00:00'),
(4, 202, 3, 'OKUPATUA', 5, NULL, NULL, '8888LMN', '2026-10-02 07:30:00', '2026-10-02 07:50:00', '2026-10-02 14:30:00'),
(5, 301, NULL, 'OKUPATUA', NULL, 'Marta Lopetegi', 'marta.visitante@gmail.com', '1111BBB', NULL, '2026-10-02 09:00:00', '2026-10-02 11:30:00'),
(6, 103, 2, 'OKUPATUA', 8, NULL, NULL, '5678DEF', NULL, '2026-10-02 08:15:00', '2026-10-02 13:45:00'),
(7, 203, 3, 'ERRESERBATUA', 7, NULL, NULL, '3333GHI', '2026-10-02 08:30:00', '2026-10-02 08:35:00', '2026-10-02 18:00:00'),
(8, 302, NULL, 'LIBRE', NULL, 'Carlos Ruiz', NULL, '2222CCC', '2026-10-02 09:30:00', '2026-10-02 10:00:00', '2026-10-02 12:00:00'),
(9, 204, 3, 'OKUPATUA', 10, NULL, NULL, '4444JKL', '2026-10-02 07:45:00', '2026-10-02 08:00:00', '2026-10-02 15:30:00'),
(10, 303, NULL, 'INHABILITATUA', NULL, 'Lucia Sanz', 'lucia.sanz@proveedor.es', '7777KKK', NULL, '2026-10-02 08:00:00', '2026-10-02 09:00:00');

SET FOREIGN_KEY_CHECKS = 1;

-- =============================================================================
-- 2. BISTAK
-- =============================================================================

CREATE OR REPLACE VIEW `v_bisitari_parking` AS
SELECT id, plaza_numero, bisitari_izena, matrikula, bisitari_emaila, sarrera_data, irteera_data 
FROM parking 
WHERE rol_mota_id IS NULL;

CREATE OR REPLACE VIEW `v_ikasle_bere_parking` AS
SELECT p.id, p.plaza_numero, p.egoera, p.matrikula, p.sarrera_data, p.irteera_data
FROM parking p
JOIN usuarios u ON p.erabiltzaile_id = u.id
WHERE p.rol_mota_id = 2 
  AND u.emaila = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);

CREATE OR REPLACE VIEW `v_irakasle_bere_parking` AS
SELECT p.id, p.plaza_numero, p.egoera, p.matrikula, p.sarrera_data, p.irteera_data
FROM parking p
JOIN usuarios u ON p.erabiltzaile_id = u.id
WHERE p.rol_mota_id = 3 
  AND u.emaila = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);

CREATE OR REPLACE VIEW `v_inbentario_kudeaketa` AS
SELECT id, izena AS artikulua, kopurua, egoera
FROM inbentario;

CREATE OR REPLACE VIEW `v_admin_parking_eta_inbentario` AS
SELECT 
  'PARKING' AS jatorria,
  p.id AS id_elementoa,
  CONCAT('Plaza: ', p.plaza_numero, ' (Mota: ', IFNULL(r.izena, 'BISITARI'), ')') AS izena_edo_deskribapena,
  p.egoera AS egoera
FROM parking p
LEFT JOIN rol r ON p.rol_mota_id = r.id

UNION ALL

SELECT 
  'INBENTARIO' AS jatorria,
  id AS id_elementoa,
  CONCAT('Materiala: ', izena, ' (Kopurua: ', kopurua, ')') AS izena_edo_deskribapena,
  egoera AS egoera
FROM inbentario;

-- =============================================================================
-- 3. FUNTZIOAK
-- =============================================================================
DELIMITER //

CREATE FUNCTION `fn_plaza_libreak`(p_rol_id INT) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_libreak INT DEFAULT 0;
    SELECT COUNT(*) INTO v_libreak
    FROM parking
    WHERE (rol_mota_id = p_rol_id OR (p_rol_id IS NULL AND rol_mota_id IS NULL)) 
      AND egoera = 'LIBRE';
    RETURN v_libreak;
END //

CREATE FUNCTION `fn_minutu_osotara_parking`(p_erabiltzaile_id INT) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_minutuak INT DEFAULT 0;
    SELECT IFNULL(SUM(TIMESTAMPDIFF(MINUTE, sarrera_data, irteera_data)), 0) INTO v_minutuak
    FROM parking
    WHERE erabiltzaile_id = p_erabiltzaile_id;
    RETURN v_minutuak;
END //

CREATE FUNCTION `fn_porzentajea_hondatuta`() 
RETURNS DECIMAL(5,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_guztira INT DEFAULT 0;
    DECLARE v_hondatuta INT DEFAULT 0;
    
    SELECT IFNULL(SUM(kopurua), 0) INTO v_guztira FROM inbentario;
    IF v_guztira = 0 THEN 
        RETURN 0.00;
    END IF;
    
    SELECT IFNULL(SUM(kopurua), 0) INTO v_hondatuta 
    FROM inbentario 
    WHERE egoera IN ('ERABILI_EZINIK', 'GALDUTAKO');
    
    RETURN (v_hondatuta / v_guztira) * 100;
END //

DELIMITER ;

-- =============================================================================
-- 4. PROZEDURAK ETA KURTSOREAK
-- =============================================================================
DELIMITER //

CREATE PROCEDURE `sp_erreserba_egin`(
    IN p_erabiltzaile_id INT,
    IN p_plaza_num INT,
    IN p_matrikula VARCHAR(15),
    IN p_sarrera DATETIME,
    IN p_irteera DATETIME
)
BEGIN
    DECLARE v_rol_id INT;

    SELECT rol_id INTO v_rol_id 
    FROM usuarios 
    WHERE id = p_erabiltzaile_id;

    IF v_rol_id = 2 OR v_rol_id = 3 THEN
        INSERT INTO parking (
            plaza_numero, 
            rol_mota_id, 
            egoera, 
            erabiltzaile_id, 
            matrikula, 
            erreserba_data, 
            sarrera_data, 
            irteera_data
        )
        VALUES (
            p_plaza_num, 
            v_rol_id, 
            'ERRESERBATUA', 
            p_erabiltzaile_id, 
            p_matrikula, 
            NOW(), 
            p_sarrera, 
            p_irteera
        );
        
        SELECT 'Erreserba ondo egin da' AS Mensaje;
    ELSE
        SELECT 'Errorea: Erabiltzaileak ez dauka baimendutako rola' AS Mensaje;
    END IF;
END //


CREATE PROCEDURE `sp_garbitu_erreserba_okupatuak`()
BEGIN
    DECLARE v_done INT DEFAULT FALSE;
    DECLARE v_parking_id INT;
    DECLARE cur_erreserbak CURSOR FOR 
        SELECT id 
        FROM parking 
        WHERE egoera = 'ERRESERBATUA' 
          AND irteera_data < NOW();
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;

    OPEN cur_erreserbak;

    read_loop: LOOP
        FETCH cur_erreserbak INTO v_parking_id;
        
        IF v_done THEN
            LEAVE read_loop;
        END IF;

        UPDATE parking 
        SET egoera = 'LIBRE', 
            erabiltzaile_id = NULL 
        WHERE id = v_parking_id;
    END LOOP;

    CLOSE cur_erreserbak;

    SELECT 'Iraungitako erreserba guztiak garbitu dira' AS Mensaje;
END //


CREATE PROCEDURE `sp_inbentario_txostena_eguneratu`()
BEGIN
    UPDATE inbentario 
    SET egoera = 'GALDUTAKO' 
    WHERE kopurua = 0;

    SELECT 'Inbentarioa eguneratu da' AS Mensaje;
END //

DELIMITER ;

-- =============================================================================
-- 5. TRIGGERRAK
-- =============================================================================
DELIMITER //

CREATE TRIGGER `trg_balidatu_parking_usuario`
BEFORE INSERT ON `parking`
FOR EACH ROW
BEGIN
    IF (NEW.rol_mota_id IN (2, 3)) AND NEW.erabiltzaile_id IS NULL THEN
        SET NEW.egoera = 'LIBRE';
    END IF;
END //


CREATE TRIGGER `trg_balidatu_data_koherentzia`
BEFORE INSERT ON `parking`
FOR EACH ROW
BEGIN
    IF NEW.sarrera_data >= NEW.irteera_data THEN
        SET NEW.irteera_data = DATE_ADD(NEW.sarrera_data, INTERVAL 1 HOUR);
    END IF;
END //

DELIMITER ;

-- =============================================================================
-- 6. ERABILTZAILEAK, ROLAK ETA PRIBILEGIOAK
-- =============================================================================

DROP ROLE IF EXISTS 'rol_admin', 'rol_irakasle', 'rol_ikasle', 'rol_bisitari', 'rol_inbentario', 'rol_chatbot';
CREATE ROLE 'rol_admin', 'rol_irakasle', 'rol_ikasle', 'rol_bisitari', 'rol_inbentario', 'rol_chatbot';

-- Admin baimenak
GRANT ALL PRIVILEGES ON kudeaketa_7.* TO 'rol_admin';

-- Irakasle baimenak
GRANT SELECT ON kudeaketa_7.v_irakasle_bere_parking TO 'rol_irakasle';
GRANT SELECT ON kudeaketa_7.v_inbentario_kudeaketa TO 'rol_irakasle';
GRANT EXECUTE ON PROCEDURE kudeaketa_7.sp_erreserba_egin TO 'rol_irakasle';

-- Ikasle baimenak
GRANT SELECT ON kudeaketa_7.v_ikasle_bere_parking TO 'rol_ikasle';
GRANT EXECUTE ON PROCEDURE kudeaketa_7.sp_erreserba_egin TO 'rol_ikasle';

-- Inbentario baimenak
GRANT SELECT, INSERT, UPDATE ON kudeaketa_7.inbentario TO 'rol_inbentario';
GRANT SELECT ON kudeaketa_7.v_inbentario_kudeaketa TO 'rol_inbentario';

-- Bisitari baimenak
GRANT SELECT ON kudeaketa_7.v_bisitari_parking TO 'rol_bisitari';

-- CHATBOT baimena: inbentario taulan SELECT eta INSERT
GRANT SELECT, INSERT ON kudeaketa_7.inbentario TO 'rol_chatbot';

-- Erabiltzaileak sortu
DROP USER IF EXISTS 'usr_admin'@'localhost', 'usr_irakasle'@'localhost', 'usr_ikasle'@'localhost', 'usr_bisitari'@'localhost', 'usr_inbentario'@'localhost', 'usr_chatbot'@'localhost';

CREATE USER 'usr_admin'@'localhost' IDENTIFIED BY 'AdminPass123!' WITH MAX_QUERIES_PER_HOUR 1000;
CREATE USER 'usr_irakasle'@'localhost' IDENTIFIED BY 'IrakaslePass123!' WITH MAX_QUERIES_PER_HOUR 300;
CREATE USER 'usr_ikasle'@'localhost' IDENTIFIED BY 'IrakaslePass123!' WITH MAX_QUERIES_PER_HOUR 100;
CREATE USER 'usr_inbentario'@'localhost' IDENTIFIED BY 'InbentarioPass123!' WITH MAX_QUERIES_PER_HOUR 200;
CREATE USER 'usr_bisitari'@'localhost' IDENTIFIED BY 'BisitariPass123!' WITH MAX_QUERIES_PER_HOUR 20;
CREATE USER 'usr_chatbot'@'localhost' IDENTIFIED BY 'ChatbotPass123!' WITH MAX_QUERIES_PER_HOUR 5000;

-- Rolak esleitu
GRANT 'rol_admin' TO 'usr_admin'@'localhost';
GRANT 'rol_irakasle' TO 'usr_irakasle'@'localhost';
GRANT 'rol_ikasle' TO 'usr_ikasle'@'localhost';
GRANT 'rol_inbentario' TO 'usr_inbentario'@'localhost';
GRANT 'rol_bisitari' TO 'usr_bisitari'@'localhost';
GRANT 'rol_chatbot' TO 'usr_chatbot'@'localhost';

SET DEFAULT ROLE ALL TO 
  'usr_admin'@'localhost',
  'usr_irakasle'@'localhost',
  'usr_ikasle'@'localhost',
  'usr_inbentario'@'localhost',
  'usr_bisitari'@'localhost',
  'usr_chatbot'@'localhost';

FLUSH PRIVILEGES;