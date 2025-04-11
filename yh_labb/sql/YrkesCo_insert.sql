
-- (1) Stad


INSERT INTO stad (stad) VALUES ('Göteborg'), ('Stockholm');
 
-- (2) Adress

INSERT INTO adress (stad_id, gatuadress, postnummer) VALUES
(1,'Gatan 1','41101'), -- Skola GBG
(2,'Vägen 2','11122'), -- Skola Sthlm
(1,'Drottninggatan 5','41103'), --KonsultBolag 
(2,'Kungsgatan 12','11127'), -- konsultbolag 
(1, 'Kungsportsavenyen 1', '41136'), -- Student GBG
(1, 'Vasagatan 10', '41124'),
(1, 'Linnégatan 38', '41308'),
(1, 'Östra Hamngatan 26', '41109'),
(1, 'Chalmersgatan 4', '41135'),
(1, 'Södra Vägen 25', '41254'),
(1, 'A Odhners Gata 5', '42130'),
(1, 'Norra Hamngatan 12', '41114'),
(1, 'Stampgatan 15', '41664'),
(1, 'Andra Långgatan 20', '41327'),
(1, 'Karl Johansgatan 50', '41455'),
(1, 'Majorna Allé 3', '41451'),
(1, 'Friggagatan 18', '41101'),
(1, 'Redbergsplatsen 3', '41665'),
(1, 'Kortedala Torg 2', '41510'),
(2, 'Drottninggatan 45', '11121'), -- Student STHLM
(2, 'Sveavägen 23', '11134'),
(2, 'Kungsgatan 15', '11143'),
(2, 'Götgatan 78', '11830'),
(2, 'Hornsgatan 96', '11821'),
(2, 'Odengatan 65', '11322'),
(2, 'Karlavägen 76', '11459'),
(2, 'Sankt Eriksgatan 44', '11234'),
(2, 'Vasagatan 10', '11120'),
(2, 'Folkungagatan 90', '11622'),
(2, 'Birger Jarlsgatan 18', '11434'),
(2, 'Torsgatan 26', '11321'),
(2, 'Lidingövägen 1', '11433'),
(2, 'Valhallavägen 148', '11524'),
(2, 'Östermalmsgatan 87', '11459'),
(1, 'Erik Dahlbergsgatan 14', '41126'), --personal GBG
(1, 'Masthuggstorget 3', '41327'),
(1, 'Haga Nygata 12', '41301'),
(1, 'Falkgatan 7', '41667'),
(1, 'Sankt Sigfridsgatan 85', '41266'),
(2, 'Sibyllegatan 28', '11442'), --Personal STHLM 
(2, 'Regeringsgatan 88', '11139'),
(2, 'Tulegatan 15', '11353'),
(2, 'Bondegatan 48', '11633'),
(2, 'Nybrogatan 38', '11439');
 
-- (3) Skola

INSERT INTO skola (adress_id, skolnamn) VALUES
(1,'YrkesCo Göteborg'),
(2,'YrkesCo Stockholm');
 
-- (4) Program

INSERT INTO program (program_id, programnamn) VALUES
('.NET', 'Systemutvecklare .NET'),
('JAVA', 'Systemutvecklare Java'),
('DE', 'Data engineer'),
('APP', 'iOS/Android Developer'),
('IoT', 'Systemutvecklare Inbyggda system'),
('UX', 'UX-designer'),
('DevOps', 'DevOps Engineer');
 
-- (5) Skolprogram

INSERT INTO skolprogram (skol_id, program_id) VALUES
(1, '.NET'), (1, 'JAVA'), (1, 'DE'), (1, 'APP'), (1, 'IoT'), -- GBG
(2, 'JAVA'), (2, 'DE'), (2, 'IoT'), (2, 'UX'), (2, 'DevOps'); -- STHLM
 
-- (6) Kurs

INSERT INTO kurs (kurskod ,kursnamn, points, beskrivning) VALUES
('OOP1', 'Objektorienterad programmering', 30, 'Lär dig OOP i C# och Java.'),
('WFE1','Webbutveckling Frontend', 30, 'HTML, CSS, JavaScript och ramverk.'),
('SQL1','SQL', 30, 'Skapa och hantera databaser.'),
('PYT1','Python', 30, 'Data Science och Machine Learning.'),
('PIT1','Projektledning IT', 30, 'Agil och klassisk projektledning.'),
('AWS1','Molntjänster AWS', 30, 'Bygg lösningar i AWS.'),
('CYB1','Cybersäkerhet', 30, 'Grunder i IT-säkerhet.'),
('UXD1','UX Design', 30, 'Designa användarvänliga gränssnitt.'),
('DEO1','DevOps och CI/CD', 30, 'Pipeline- och automationsteknik.');


-- (7) Kursprogram

INSERT INTO kursprogram (kurskod, program_id) VALUES
('OOP1', '.NET'), ('SQL1', '.NET'), ('AWS1', 'JAVA'),
('OOP1', 'JAVA'), ('SQL1', 'JAVA'), ('AWS1', '.NET'),
('OOP1', 'DE'), ('PYT1', 'DE'), ('CYB1', '.NET'),
('OOP1', 'APP'), ('PYT1', 'DevOps'), ('CYB1', 'JAVA'),
('OOP1', 'IoT'), ('PIT1', '.NET'), ('CYB1', 'DevOps'),
('OOP1', 'DevOps'), ('PIT1', 'JAVA'), ('UXD1', 'APP'),
('WFE1', 'APP'), ('PIT1', 'DE'), ('UXD1', 'UX'),
('WFE1', 'UX'), ('PIT1', 'UX'), ('DEO1', 'DE'),
('SQL1', 'DE'), ('AWS1', 'DE'), ('DEO1', 'DevOps'),
('SQL1', 'DevOps'), ('AWS1', 'DevOps'), ('DEO1', 'JAVA');
 
-- (8) Yrkesroller

INSERT INTO yrkesroll (titel) VALUES ('Utbildningsledare'), ('Utbildare'), ('Konsult');
 
-- (9) Personuppgifter

INSERT INTO personuppgift (adress_id, personnummer) VALUES
(5,  '200001011234'), (6,  '200002031238'), (7,  '200003051245'), (8,  '200004071212'), (9,  '200005091299'), --GBG
(10, '200006111234'), (11, '200007131211'), (12, '200008151290'), (13, '200009171287'), (14, '200010191222'),
(15, '200011211265'), (16, '200012231267'), (17, '200001251278'), (18, '200002271289'), (19, '200003291234'),
(20, '200004301276'), (21, '200005021233'), (22, '200006041266'), (23, '200007061278'), (24, '200008081299'), --STHLM
(25, '200009101212'), (26, '200010121211'), (27, '200011141234'), (28, '200012161243'), (29, '200001181277'),
(30, '200002201244'), (31, '200003221287'), (32, '200004241299'), (33, '200005261212'), (34, '200006281211'),
(35, '198001011111'), (36, '198102031123'), (40, '198203051234'), (41, '198304071278'), (42, '198405091211'), --Personal
(37, '198506111299'), (38, '198607131234'), (43, '198708151267'), (39, '198809171299'), (44, '198910191278');
 
-- (10) Studenter

INSERT INTO student (pu_id, skol_id, namn, efternamn, epost, telefon) VALUES
(1, 1, 'Anna', 'Andersson', 'anna.andersson@example.com', '0701234567'),
(2, 1, 'Björn', 'Berg', 'bjorn.berg@example.com', '0701234568'),
(3, 1, 'Carla', 'Carlsson', 'carla.carlsson@example.com', '0701234569'),
(4, 1, 'David', 'Dahl', 'david.dahl@example.com', '0701234570'),
(5, 1, 'Elin', 'Ek', 'elin.ek@example.com', '0701234571'),
(6, 1, 'Filip', 'Fransson', 'filip.fransson@example.com', '0701234572'),
(7, 1, 'Greta', 'Gran', 'greta.gran@example.com', '0701234573'),
(8, 1, 'Henrik', 'Hult', 'henrik.hult@example.com', '0701234574'),
(9, 1, 'Ida', 'Ivarsson', 'ida.ivarsson@example.com', '0701234575'),
(10, 1, 'Johan', 'Johansson', 'johan.johansson@example.com', '0701234576'),
(11, 1, 'Karin', 'Karlsson', 'karin.karlsson@example.com', '0701234577'),
(12, 1, 'Lars', 'Lind', 'lars.lind@example.com', '0701234578'),
(13, 1, 'Maria', 'Månsson', 'maria.mansson@example.com', '0701234579'),
(14, 1, 'Niklas', 'Nordin', 'niklas.nordin@example.com', '0701234580'),
(15, 1, 'Olivia', 'Ohlsson', 'olivia.ohlsson@example.com', '0701234581'),
(16, 2, 'Patrik', 'Persson', 'patrik.persson@example.com', '0701234582'),
(17, 2, 'Quinn', 'Quick', 'quinn.quick@example.com', '0701234583'),
(18, 2, 'Rikard', 'Ryd', 'rikard.ryd@example.com', '0701234584'),
(19, 2, 'Sara', 'Sand', 'sara.sand@example.com', '0701234585'),
(20, 2, 'Tobias', 'Torn', 'tobias.torn@example.com', '0701234586'),
(21, 2, 'Ulrika', 'Ulfsdotter', 'ulrika.ulfsdotter@example.com', '0701234587'),
(22, 2, 'Viktor', 'Vik', 'viktor.vik@example.com', '0701234588'),
(23, 2, 'Wilma', 'Wall', 'wilma.wall@example.com', '0701234589'),
(24, 2, 'Xander', 'Xen', 'xander.xen@example.com', '0701234590'),
(25, 2, 'Ylva', 'Yng', 'ylva.yng@example.com', '0701234591'),
(26, 2, 'Zandra', 'Zed', 'zandra.zed@example.com', '0701234592'),
(27, 2, 'Åke', 'Ångström', 'ake.angstrom@example.com', '0701234593'),
(28, 2, 'Älva', 'Ädel', 'alva.adel@example.com', '0701234594'),
(29, 2, 'Örjan', 'Öst', 'orjan.ost@example.com', '0701234595'),
(30, 2, 'Östen', 'Öberg', 'osten.oberg@example.com', '0701234596');

-- (11) Personal

INSERT INTO personal (personal_id, yrkes_id, namn, efternamn, epost, telefon) VALUES
(1, 1, 'Eva', 'Ekström', 'eva.ekstrom@example.com', '0702345671'), -- Utbildningsledare Gbg
(2, 1, 'Fredrik', 'Frid', 'fredrik.frid@example.com', '0702345672'), -- Utbildningsledare GBG
(3, 1, 'Anna', 'Andersson', 'anna.andersson@example.com', '0702345671'), -- Utbildningsledare Sthlm
(4, 1, 'Johan', 'Johansson', 'johan.johansson@example.com', '0702345672'), -- Utbildningsledare Sthlm
(5, 1, 'Elvin', 'Kandell', 'elvin.kandell@example.com', '0705551122'), -- Utbildningsledare Friståede kurs Sthlm
(6, 1, 'Hampus', 'Lubran', 'hampus.lubran@example.com', '0721345233'), -- Utbildningsledare Fristående kurs Gbg
(7, 2, 'Gustav', 'Gull', 'gustav.gull@example.com', '0702345673'), -- Utbildare
(8, 2, 'Hanna', 'Hav', 'hanna.hav@example.com', '0702345674'),
(9, 2, 'Isak', 'Isberg', 'isak.isberg@example.com', '0702345675'),
(10, 2, 'Josefin', 'Jord', 'josefin.jord@example.com', '0702345676'),
(11, 3, 'Karl', 'Kust', 'karl.kust@example.com', '0702345677'), -- Konsult
(12, 3, 'Linda', 'Lund', 'linda.lund@example.com', '0702345678'),
(13, 3, 'Magnus', 'Myra', 'magnus.myra@example.com', '0702345679'),
(14, 3, 'Nina', 'Norr', 'nina.norr@example.com', '0702345680');
 
-- (12) Fastanställda

INSERT INTO fast_arbete (pu_id, personal_id) VALUES
(31, 1), (32, 2), (33, 3), (34, 4), (35, 5), (36, 6), --UL
(37, 7), (38, 8), (39, 9), (40, 10); --Ubildare
 
-- (13) Konsultbolag

INSERT INTO konsultbolag (org_nummer, adress_id, bolagsnamn, f_skatt) VALUES
('556677-8899', 3, 'TechKonsult AB', true),
('556688-9900', 4, 'IT-Resurs AB', true);
 
-- (14) Konsult

INSERT INTO konsult (org_nummer, personal_id, timpris) VALUES
('556677-8899', 11, 950),
('556677-8899', 12, 900),
('556688-9900', 13, 1000),
('556688-9900', 14, 1100);
 
-- (15) Skolpersonal

INSERT INTO skolpersonal (personal_id, skol_id) VALUES
(1, 1), (2, 1), (6, 1), (7, 1),(9, 1), (11, 1), (13,1), -- GBG 
(3, 2), (4, 2),(5, 2),(8, 2), (10, 2), (12, 2), (14,2); --STHLM
 
-- (16) Företag

INSERT INTO firma (org_nummer, namn, representant, epost, telefon) VALUES
('559001-2345', 'CyberSec AB', 'Ola Olofsson', 'ola@cybersec.se', '0709988771'),
('559001-2346', 'WebDev AB', 'Pia Persson', 'pia@webdev.se', '0709988772'),
('559001-2347', 'DataCloud AB', 'Kalle Karlsson', 'kalle@datacloud.se', '0709988773'),
('559001-2348', 'Innovate AB', 'Mia Månsson', 'mia@innovate.se', '0709988774'),
('559001-2349', 'SecureIT AB', 'Nils Nilsson', 'nils@secureit.se', '0709988775');
 
-- (17) Beviljade omgångar

INSERT INTO beviljad (program_id, anno) VALUES
('.NET', '24'), ('.NET', '25'), ('.NET', '26'),
('JAVA', '24'), ('JAVA', '25'), ('JAVA', '26'),
('DE', '24'), ('DE', '25'), ('DE', '26'),
('APP', '24'), ('APP', '25'), ('APP', '26'),
('IoT', '24'), ('IoT', '25'), ('IoT', '26'),
('UX', '24'), ('UX', '25'), ('UX', '26'),
('DevOps', '24'), ('DevOps', '25'), ('DevOps', '26');
 
-- (18) Ledningsgrupp

INSERT INTO ledningsgrupp (program_id, skol_id) VALUES
('.NET', 1),
('JAVA', 1),('JAVA', 2),
('DE', 1),('DE', 2),
('APP', 1),
('IoT', 1),('IoT', 2),
('UX', 2),
('DevOps', 2);
 
-- (19) Ledningsföretag

INSERT INTO ledningsfirma (ledningsgrupp_id, org_nummer) VALUES
(1, '559001-2345'),
(2, '559001-2346'),
(3, '559001-2347'),
(4, '559001-2348'),
(5, '559001-2349'),
(6, '559001-2345'),
(7, '559001-2346'),
(8, '559001-2347'),
(9, '559001-2348'),
(10, '559001-2349');
 
-- (20) Ledningstudent

INSERT INTO ledningstudent (ledningsgrupp_id, student_id) VALUES
(1,6),(1,11), -- .NET GBG
(2,2),(2,7), --JAVA GBG
(3,16),(3,26), --JAVA STHLM 
(4,5),(4,10), -- DE GBG
(5,23),(5,28), -- DE STHLM
(6,4),(6,9), -- APP GBG
(7,3),(7,8), --IoT GBG
(8,17),(8,27), --IoT STHLM 
(9,19),(9,24), -- UX STHLM
(10,20),(10,25); -- DevOps STHLM
 
-- (21) Ledningspersonal

INSERT INTO ledningspersonal (ledningsgrupp_id, personal_id) VALUES
(1,1), -- .NET GBG
(2,2), -- JAVA GBG
(3,3), -- JAVA STHLM
(4,1), -- DE GBG
(5,4), -- DE STHLM
(6,2), -- APP GBG
(7,1), -- IoT GBG
(8,3), -- IoT STHLM
(9,4), -- UX STHLM
(10,4); --DevOps STHLM
 
-- (22) Protokoll

INSERT INTO protokoll (ledningsgrupp_id, protokoll, datum) VALUES
(1, 'Protokoll från möte 1', '2025-01-15'),
(2, 'Protokoll från möte 2', '2025-01-20'),
(3, 'Protokoll från möte 3', '2025-02-10'),
(4, 'Protokoll från möte 4', '2025-02-20');
 
-- (23) Kurstillfälle (Personal ansvarar för vissa kurser)

INSERT INTO kurspersonal (kurskod,personal_id) VALUES
('OOP1',5),('AWS1',5),('CYB1',7),('WFE1',7),('PIT1',9),('SQL1',9),('DEO1',9),('PIT1',11),('PYT1',11),('UXD1',11),
('OOP1',6),('AWS1',6),('CYB1',8),('WFE1',8),('PIT1',10),('SQL1',10),('DEO1',10),('PIT1',12),('PYT1',12),('UXD1',12);

 
-- (24) Kursbetyg

INSERT INTO kursbetyg (student_id, kurskod, betyg) VALUES
(1, 'SQL1', 'VG'), (15, 'PYT1', 'G'), (26, 'DEO1', 'VG'),
(2, 'OOP1', 'G'), (16, 'PIT1', 'IG'), (28, 'SQL1', 'IG'),
(3, 'PYT1', 'IG'), (20, 'AWS1', 'G'), (18, 'CYB1', 'G'),
(4, 'UXD1', 'VG'), (25, 'OOP1', 'VG'), (30, 'AWS1', 'VG');
 
-- (25) Fristående kurser

INSERT INTO fri_kurs (skol_id, kurskod, personal_id) VALUES
(1, 'SQL1', 5),
(1, 'PYT1', 5),
(2, 'OOP1', 6),
(2, 'AWS1', 6);
 
-- (26) Fristående student

INSERT INTO fri_student (fk_id, student_id) VALUES
(1, 14), (2, 15), --GBG
(3, 29), (4, 30); --STHLM

-- (27) Klass

INSERT INTO klass (beviljad_id, personal_id, skol_id) VALUES
(1, 1, 1), --.NET
(4, 1, 1),(4, 3, 2), --JAVA
(7, 1, 1),(7, 3, 2), --DE
(10,2, 1), --APP
(13,2,1),(13,3,2), --IoT
(16,4,2), --UX
(19,4,2); --DevOps

-- (28) Antagen student 

INSERT INTO antagen_student (klass_id, student_id) VALUES
(1, 1),(1, 6),(1, 11), --.NET GBG
(2, 2),(2, 7), (2, 12), --JAVA GBG
(3,16), (3,21), (3,26), --JAVA STHLM
(4, 5), (4, 10), --DE GBG
(5,18), (5,23), (5,28), --DE STHLM
(6, 4),(6, 9), --APP GBG
(7, 3),(7, 8),(7, 13), --IoT GBG
(8,17), (8,22),(8,27), -- IoT STHLM
(9, 19),(9, 24), --UX STHLM
(10, 20),(10, 25); --DevOps STHLM 

-- KLART!