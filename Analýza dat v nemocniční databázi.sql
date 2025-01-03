CREATE TABLE Pacienti(
  Id_pacienta		INT PRIMARY KEY,
  Krestni_jmeno		VARCHAR(20),
  Prijmeni			VARCHAR(20),
  Datum_narozeni	DATE,
  Pohlavi			VARCHAR(1) CHECK (Pohlavi IN ('M', 'Ž'))
  );
  
  CREATE TABLE Lekari(
    Id_lekare		INT PRIMARY KEY,
    Krestni_jmeno	VARCHAR(20),
    Prijmeni		VARCHAR(20),
    Specializace	VARCHAR(20)
    );
    
    CREATE TABLE Oddeleni(
      Id_oddeleni		INT PRIMARY KEY,
      Nazev_oddeleni	VARCHAR(20)
      );
      
      CREATE TABLE Hospitalizace(
        Id_hospitalizace	INT PRIMARY KEY,
        Id_pacienta			INT,
        Id_lekare			INT,
        Id_oddeleni			INT,
        Datum_prijeti		DATE,
        Datum_propusteni	DATE,
        FOREIGN KEY (Id_pacienta) REFERENCES Pacienti(Id_pacienta),
        FOREIGN KEY (Id_lekare) REFERENCES Lekari(Id_lekare),
        FOREIGN KEY (Id_oddeleni) REFERENCES Oddeleni(Id_oddeleni)
        );
        
        CREATE TABLE Diagnoza(
          Id_diagnoza		INT PRIMARY KEY,
          Id_hospitalizace	INT,
          Kod_diagnozy		VARCHAR(10),
          Popis_diagnozy	VARCHAR(100),
          FOREIGN KEY (Id_hospitalizace) REFERENCES Hospitalizace(Id_hospitalizace)
          );
          
          
       INSERT INTO pacienti(id_pacienta, krestni_jmeno, prijmeni, datum_narozeni, pohlavi)
       VALUES
       (1, 'Aneta', 'Nová', '1986-11-04', 'Ž'),
       (2, 'Karel', 'Fiala', '1968-04-028', 'M'),
       (3, 'Petr','Bílý','1976-10-06', 'M'),
       (4, 'Antonín', 'Salaš', '1953-01-16', 'M'),
       (5, 'Kateřina',	'Houšková',	'2005-05-20', 'Ž'),
       (6, 'Anna',	'Luková', '2002-02-18',	'Ž'),
       (7, 'Barbora' ,'Malá', '1957-09-02',	'Ž'),
       (8, 'Filip',	'Huml', '1993-10-30', 'M'),
	   (9, 'Nela', 'Cepová', '1972-08-14', 'Ž'),
	   (10, 'Petra', 'Ostrá', '2009-12-27',	'Ž'),
	   (11,	'Karolína', 'Stará', '1985-03-16', 'Ž'),
	   (12,	'Břetislav', 'Motl', '1978-11-24', 'M'),
	   (13,	'Josef', 'Kaiser', '2001-07-08', 'M'),
	   (14,	'Petr',	'Stoch', '1969-11-18', 'M'),
	   (15,	'Sofie', 'Malá', '1990-01-06', 'Ž'),
	   (16,	'Věra',	'Kolečková', '1977-09-17', 'Ž'),
	   (17,	'Jiří', 'Vějíř', '2009-10-22', 'M'),
	   (18,	'Kateřina',	'Broková', '1987-03-28', 'Ž'),
	   (19,	'Kryštof', 'Hejhal', '1992-12-10', 'M'),
	   (20,	'Karel', 'Stejskal', '1979-09-25', 'M'),
 	   (21,	'Josef', 'Askak', '1964-01-17', 'M'),
	   (22,	'Alice', 'Fanto', '1959-03-12', 'Ž'),
	   (23,	'Anna',	'Stejskalová', '2002-08-26', 'Ž'),
	   (24,	'Miroslav',	'Frak',	'2000-05-01', 'M'),
	   (25,	'Petr',	'Žlutý', '1970-12-12', 'M'), 
       (26,	'Lukáš', 'Marval', '1998-12-07', 'M'),
       (27, 'Michael', 'Storch', '1990-03-22', 'M'),
       (28,	'Andrea', 'Vaxová',	'1974-07-04', 'Ž'),
       (29,	'Lucie', 'Třtinová', '2003-08-23', 'Ž'),
       (30,	'Martin', 'Bass', '2001-12-06', 'M'),
       (31,	'Alexander', 'Fox', '2002-10-16', 'M'),
       (32,	'Kateřina',	'Mladá', '1969-11-22', 'Ž'),
       (33,	'Marie', 'Velizská', '1961-03-06', 'Ž'),
       (34,	'Adam', 'Havlíček', '1997-02-08', 'M'),
       (35,	'Josef', 'Petříček', '1984-05-19', 'M'),
       (36,	'Lucie', 'Ptáčková', '1976-04-09', 'Ž'),
       (37,	'Eva', 'Mašková', '1990-11-30', 'Ž'),
       (38,	'Martina', 'Morová', '1977-10-24', 'Ž'),
       (39,	'Jaroslav', 'Adamec', '1963-06-03', 'M'),
       (40,	'Josef', 'Pavel', '1979-01-09', 'M'),
       (41,	'Martin', 'Příšerka', '2001-09-29', 'M'),
       (42,	'Petra', 'Landová', '1962-07-04', 'Ž'),
       (43,	'Adriana', 'Krásná', '1980-08-19', 'Ž'),
       (44,	'Nela', 'Haplová', '1977-07-17', 'Ž'),
       (45,	'Sofie', 'Neumanová', '1994-02-14', 'Ž'),
       (46,	'Anna', 'Formanová', '1959-04-08', 'Ž'),
       (47,	'Kristýna', 'Justychová', '2002-08-13', 'Ž'),
       (48,	'Adam', 'Pech', '1999-11-27', 'M'),
       (49,	'Marie', 'Podskalská', '1984-03-16', 'Ž'),
       (50,	'Lukáš', 'Pekar', '2003-12-18', 'M'),
       (51,	'Eva', 'Boučková', '2001-09-01', 'Ž'),
       (52,	'Karel', 'Stach', '1973-06-19', 'M'),
       (53,	'Pavel', 'Krul', '1986-05-19', 'M'),
       (54,	'Jan', 'Dorf', '1998-12-25', 'M'),
       (55,	'Kristýna', 'Palová', '1972-03-22', 'Ž'),
       (56,	'Anna', 'Černá', '1967-08-09', 'Ž'),
       (57,	'Jiří', 'Klouzek', '1954-06-08', 'M'),
       (58,	'Marie', 'Fousková', '1998-08-07', 'Ž'),
       (59,	'Kateřina', 'Tkadlecová', '2000-04-16', 'Ž'),
       (60,	'Sofie', 'Gumová', '1995-08-19', 'Ž'),
       (61,	'Gabriela', 'Pokova', '1980-05-15', 'Ž'),
       (62,	'Jan', 'Zajíc', '1957-10-02', 'M'),
       (63,	'Dana', 'Teplá', '1975-03-18', 'Ž'),
       (64,	'Zdeněk', 'Tol' ,'1968-07-24', 'M');
       
       INSERT INTO lekari(id_lekare, krestni_jmeno, prijmeni, specializace)
       VALUES
       (100, 'Karel', 'Albrecht', 'Kardiologie'),
	   (101, 'Filip', 'Kauf', 'Neurologie'),
	   (102, 'Martin', 'Nový', 'Rehabilitace'),
	   (103, 'Ivan', 'Botl', 'Kardiologie'),
	   (104, 'Monika', 'Červená' ,'Chirurgie'),
	   (105, 'Andrea', 'Gustová', 'Ortopedie'),
	   (106, 'Petr', 'Šimek', 'Neurologie'),
	   (107, 'Josef', 'Kovář', 'Gastroenterologie'),
	   (108, 'Martina', 'Adamcová', 'Chirurgie'),
	   (109, 'Alois', 'Němec', 'Ortopedie'),
	   (110, 'Filip', 'Kostka', 'Chirurgie'),
	   (111, 'Adam', 'Kroft', 'Gastroenterologie'),
	   (112, 'Julie', 'Šimáčková', 'Kardiologie'),
	   (113, 'Filip', 'Aubrecht', 'Chirurgie'),
	   (114, 'Miroslava', 'Veselá', 'Ortopedie'),
	   (115, 'Petr', 'Lopata', 'Neurologie'),
       (116, 'Alexander', 'Broš', 'Rehabilitace'),
       (117, 'Věra', 'Kadlecová', 'Rehabilitace'),
	   (118, 'Josef', 'Vorák', 'Kardiologie'),
	   (119, 'Šimon', 'Stuk', 'Ortopedie'),
	   (120, 'Anna',	'Žulova', 'Gastroenterologie');
       
       INSERT into oddeleni(id_oddeleni, nazev_oddeleni)
       VALUES
       (1, 'Kardiologie'),
       (2, 'Neurologie'),
       (3, 'Rehabilitace'),
       (4, 'Chirurgie'),
       (5, 'Ortopedie'),
       (6, 'Gastroenterologie');
       
       INSERT INTO hospitalizace(id_hospitalizace, id_pacienta, id_lekare, id_oddeleni, datum_prijeti, datum_propusteni)
       VALUES
       (1,	1,	107, 6,	'2024-08-05', '2024-08-07'),
       (2,	2,	112, 1,	'2024-07-03', '2024-07-10'),
       (3,	3,	110, 4,	'2024-10-22', '2024-10-23'),
	   (4,	4,	105, 5,	'2024-10-16', '2024-10-20'),
	   (5,	5,	118, 1,	'2024-04-11', '2024-04-19'),
	   (6,	6,	101, 2,	'2024-09-25', '2024-09-28'),
	   (7,	7,	120, 6,	'2024-02-25', '2024-02-26'),
	   (8,	8,	117, 3,	'2024-11-10', '2024-11-20'),
	   (9,	9,	119, 5,	'2024-03-27', '2024-03-30'),
	   (10,	10,	106, 2,	'2024-10-15', '2024-10-16'),
	   (11,	11,	108, 4,	'2024-10-24', '2024-10-25'),
	   (12,	12,	109, 5,	'2024-01-03', '2024-01-06'),
	   (13,	13,	100, 1,	'2024-06-15', '2024-06-20'),
	   (14,	14,	103, 1,	'2024-01-20', '2024-01-25'),
	   (15,	15,	107, 6,	'2024-08-03', '2024-08-04'),
	   (16,	16,	104, 4,	'2024-11-11', '2024-11-12'),
	   (17,	17,	114, 5,	'2024-03-05', '2024-03-06'),
	   (18,	18,	115, 2,	'2024-05-15', '2024-05-20'),
	   (19,	19,	116, 3,	'2024-05-16', '2024-05-25'),
	   (20,	20,	105, 5,	'2024-10-16', '2024-10-17'),
	   (21,	21,	104, 4,	'2024-03-20', '2024-03-21'),
	   (22,	22,	115, 2,	'2024-10-25', '2024-11-01'),
	   (23,	23,	118, 1,	'2024-11-07', '2024-11-15'),
	   (24,	24,	111, 6,	'2024-12-01', '2024-12-02'),
	   (25,	25,	114, 5,	'2024-09-05', '2024-09-06'),
	   (26,	26,	101, 2,	'2024-07-10', '2024-07-12'),
	   (27,	27,	102, 3,	'2024-02-28', '2024-03-10'),
	   (28, 28,	102, 3,	'2024-06-20', '2024-06-27'),
	   (29,	29,	108, 4,	'2024-03-08', '2024-03-20'),
	   (30,	30,	114, 5,	'2024-10-20', '2024-10-23'),
	   (31,	31,	100, 1,	'2024-11-18', '2024-11-25'),
	   (32,	32,	101, 2,	'2024-08-24', '2024-09-05'),
	   (33,	33,	107, 6,	'2024-06-13', '2024-06-14'),
	   (34,	34,	105, 5,	'2024-09-10', '2024-09-11'),
	   (35,	35,	109, 5,	'2024-01-20', '2024-01-25'),
	   (36,	36,	112, 1,	'2024-05-01', '2024-05-10'),
	   (37,	6,	117, 3,	'2024-04-16', '2024-04-25'),
	   (38,	37,	108, 4,	'2024-09-18', '2024-09-30'),
	   (39,	38,	119, 5,	'2024-08-27', '2024-08-29'),
	   (40,	39,	115, 2,	'2024-03-14', '2024-03-20'),
	   (41,	40,	112, 1,	'2024-11-22', '2024-11-23'),
	   (42,	41,	111, 6,	'2024-02-13', '2024-02-17'),
	   (43,	42,	108, 4,	'2024-06-24', '2024-06-25'),
	   (44,	43,	116, 3,	'2024-08-30', '2024-09-15'),
	   (45,	44,	115, 2,	'2024-11-14', '2024-11-18'),
	   (46,	45,	109, 5,	'2024-07-01', '2024-07-10'),
	   (47,	46,	102, 3,	'2024-10-29', '2024-11-06'),
	   (48,	47,	112, 1,	'2024-02-05', '2024-02-10'),
	   (49,	29,	104, 4,	'2024-05-26', '2024-05-30'),
	   (50,	48,	107, 6,	'2024-04-12', '2024-04-15'),
	   (51,	49,	102, 3,	'2024-09-15', '2024-09-28'),
	   (52,	3,	117, 3,	'2024-07-18', '2024-07-25'),
	   (53,	50,	108, 4,	'2024-01-15', '2024-01-29'),
	   (54,	51,	109, 5,	'2024-03-20', '2024-03-21'),
	   (55,	52,	106, 2,	'2024-08-27', '2024-08-29'),
	   (56,	53,	102, 3,	'2024-02-20', '2024-02-28'),
	   (57,	54, 110, 4,	'2024-10-04', '2024-10-05'),
	   (58,	55,	119, 5,	'2024-11-25', '2024-11-28'),
	   (59,	56,	114, 5,	'2024-12-03', NULL),
	   (60,	57,	101, 2,	'2024-02-22', '2024-02-26'),
	   (61,	35,	102, 3,	'2024-09-30', '2024-10-15'),
	   (62,	58,	100, 1,	'2024-07-17', '2024-07-20'),
	   (63,	59,	120, 6,	'2024-02-23', '2024-02-29'),
	   (64,	60,	101, 2,	'2024-05-10', '2024-05-13'),
	   (65,	61,	108, 4,	'2024-12-05', NULL),
	   (66,	62,	119, 5,	'2024-09-01', '2024-09-02'),
	   (67,	29,	113, 3,	'2024-07-23', '2024-07-30'),
	   (68,	63,	117, 3,	'2024-11-25', '2024-12-05'),
	   (69,	64,	105, 5,	'2024-09-15', '2024-09-16'),
	   (70,	60,	102, 3,	'2024-08-06', '2024-08-15');
       
       INSERT INTO diagnoza(id_diagnoza, id_hospitalizace, kod_diagnozy, popis_diagnozy)
       VALUES
       (1,	2,	'I21',	'Závažné postižení srdečního svalu v důsledku nedostatečněho prokrvení'),			
	   (2,	5,	'I50',	'Neschopnost srdce čerpat dostatečné množství krve'),			
	   (3,	13,	'I10',	'Vysoký krevní tlak bez další specifikace'),			
	   (4,	14,	'I10',	'Vysoký krevní tlak bez další specifikace'),
	   (5,	23,	'I21',	'Závažné postižení srdečního svalu v důsledku nedostatečněho prokrvení'),			
	   (6,	31,	'I21',	'Závažné postižení srdečního svalu v důsledku nedostatečněho prokrvení'),		
	   (7,	36,	'I21',	'Závažné postižení srdečního svalu v důsledku nedostatečněho prokrvení'),			
	   (8,	41,	'I10',	'Vysoký krevní tlak bez další specifikace'),			
	   (9,	48,	'I21',	'Závažné postižení srdečního svalu v důsledku nedostatečněho prokrvení'),			
	   (10,	62,	'I10',	'Vysoký krevní tlak bez další specifikace'),			
	   (11,	6,	'G43',	'Silná opakující se bolest hlavy doprovázená nevolností'),			
	   (12,	10,	'G43',	'Silná opakující se bolest hlavy doprovázená nevolností'),			
	   (13,	18,	'I63',	'Ucpání cév vedoucích k mozku způsobující náhlý neurologický deficit'),			
	   (14,	26,	'G43',	'Silná opakující se bolest hlavy doprovázená nevolností'),			
	   (15,	32,	'G35',	'Chronické autoimunitní onemocnění postihující centrální nervový systém'),			
	   (16,	40,	'G35',	'Chronické autoimunitní onemocnění postihující centrální nervový systém'),			
	   (17,	45,	'G43',	'Silná opakující se bolest hlavy doprovázená nevolností'),			
	   (18,	55,	'G43',	'Silná opakující se bolest hlavy doprovázená nevolností'),			
	   (19,	60,	'G35',	'Chronické autoimunitní onemocnění postihující centrální nervový systém'),			
	   (20,	64,	'G43',	'Silná opakující se bolest hlavy doprovázená nevolností'),			
	   (21,	8,	'Z51.8',	'Rehabilitace po operaci ke zlepšení pohyblivosti'),			
	   (22,	19,	'Z51.8',	'Rehabilitace po operaci ke zlepšení pohyblivosti'),			
	   (23,	27,	'Z50.9',	'Intenzivní rehabilitace zaměřená na obnovení motorických funkcí'),			
	   (24,	28,	'Z51.8',	'Rehabilitace po operaci ke zlepšení pohyblivosti'),			
	   (25,	37,	'Z51.8',	'Rehabilitace po operaci ke zlepšení pohyblivosti'),			
	   (26,	44,	'Z50.9',	'Intenzivní rehabilitace zaměřená na obnovení motorických funkcí'),			
	   (27,	47,	'Z51.8',	'Rehabilitace po operaci ke zlepšení pohyblivosti'),			
	   (28,	51,	'Z50.9',	'Intenzivní rehabilitace zaměřená na obnovení motorických funkcí'),			
	   (29,	52,	'Z51.8',	'Rehabilitace po operaci ke zlepšení pohyblivosti'),			
	   (30,	56,	'M54',	'Chronické nebo akutní bolesti v bederní oblasti zad'),			
	   (31,	61,	'Z50.9',	'Intenzivní rehabilitace zaměřená na obnovení motorických funkcí'),			
	   (32,	67,	'Z51.8',	'Rehabilitace po operaci ke zlepšení pohyblivosti'),			
	   (33,	68,	'Z50.9',	'Intenzivní rehabilitace zaměřená na obnovení motorických funkcí'),			
	   (34,	70,	'M54',	'Chronické nebo akutní bolesti v bederní oblasti zad'),			
	   (35,	3,	'K40',	'Chirurgická léčba břišní nebo tříselné kýly'),			
	   (36,	11,	'K40',	'Chirurgická léčba břišní nebo tříselné kýly'),			
	   (37,	16,	'K40',	'Chirurgická léčba břišní nebo tříselné kýly'),			
	   (38,	21,	'K40',	'Chirurgická léčba břišní nebo tříselné kýly'),
	   (39,	29,	'K80',	'Tvorba kamenů ve žlučníku vyžadující laparoskopickou operaci'),			
	   (40,	38,	'K80',	'Tvorba kamenů ve žlučníku vyžadující laparoskopickou operaci'),			
	   (41,	43,	'K40',	'Chirurgická léčba břišní nebo tříselné kýly'),			
	   (42,	49,	'K40',	'Chirurgická léčba břišní nebo tříselné kýly'),			
	   (43,	53,	'K80',	'Tvorba kamenů ve žlučníku vyžadující laparoskopickou operaci'),			
	   (44,	57,	'K35',	'Zánět slepého střeva, často vyžadující chirurgická odstranění'),			
	   (45,	65,	'K80',	'Tvorba kamenů ve žlučníku vyžadující laparoskopickou operaci'),			
	   (46,	4,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (47,	9,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (48,	12,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (49,	17,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (50,	20,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (51,	25,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (52,	30,	'M17',	'Degenerativní onemocnění kolenního kloubu s nutností operace'),			
	   (53,	34,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (54,	35,	'S72',	'Závažné poranění vyžadující chirurgický zákrok s následnou rehabilitací'),			
	   (55,	39,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (56,	46,	'S72',	'Závažné poranění vyžadující chirurgický zákrok s následnou rehabilitací'),			
	   (57,	54,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (58,	58,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (59,	59,	'M17',	'Degenerativní onemocnění kolenního kloubu s nutností operace'),			
	   (60,	66,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (61,	69,	'M75',	'Syndrom bolesti ramenního kloubu často spojený s přetížením'),			
	   (62,	1,	'K29',	'Zánět sliznice žaludku způsobující bolesti a nevolnost'),		
	   (63,	7,	'K29',	'Zánět sliznice žaludku způsobující bolesti a nevolnost'),			
	   (64,	15,	'K29',	'Zánět sliznice žaludku způsobující bolesti a nevolnost'),			
	   (65,	24,	'K29',	'Zánět sliznice žaludku způsobující bolesti a nevolnost'),		
	   (66,	33,	'K29',	'Zánět sliznice žaludku způsobující bolesti a nevolnost'),			
	   (67,	42,	'K25',	'Poškození sliznice žaludku nebo perforací'),			
	   (68,	50,	'K86',	'Dlouhodobý zánět slinivky břišní s opakovanými obtížemi'),			
	   (69,	63,	'K29',	'Zánět sliznice žaludku způsobující bolesti a nevolnost'),			
	   (70,	22,	'G35',	'Chronické autoimunitní onemocnění postihující centrální nervový systém');
       


-- 	Seznam všech pacientů starších 60 let

SELECT krestni_jmeno, prijmeni, datum_narozeni
FROM pacienti
WHERE datum_narozeni < '1964-12-20';


-- Počet hospitalizací za posledních 12 měsíců

SELECT COUNT(id_hospitalizace) As pocet hospitalizaci
FROM hospitalizace
WHERE datum_prijeti BETWEEN '2023-12-20' AND '2024-12-20';


-- 	Seznam všech lékařů a počet pacientů, které ošetřovali

SELECT h.id_lekare, l.krestni_jmeno, l.prijmeni, COUNT(*) pocet_pacientu
FROM hospitalizace h
JOIN lekari l
ON h.id_lekare = l.id_lekare
GROUP BY h.id_lekare, l.krestni_jmeno, l.prijmeni
ORDER BY pocet_pacientu DESC ;


-- Kolik dní průměrně trvá hospitalizace na jednotlivých odděleních

SELECT ROUND(AVG(h.datum_propusteni - h.datum_prijeti),2) As prumer_dni, o.nazev_oddeleni
FROM hospitalizace h
JOIN oddeleni o
on h.id_oddeleni = o.id_oddeleni
GROUP BY nazev_oddeleni
ORDER BY prumer_dni;


-- Které diagnózy jsou nejčastější na oddělení kardiologie?

SELECT d.kod_diagnozy, o.nazev_oddeleni, COUNT(*) AS nejcastejsi_diagnozy
FROM diagnoza d
JOIN hospitalizace h
ON d.id_hospitalizace = h.id_hospitalizace
JOIN oddeleni o 
ON H.id_oddeleni = O.id_oddeleni
WHERE o.nazev_oddeleni = 'Kardiologie'
GROUP BY d.kod_diagnozy, o.nazev_oddeleni
ORDER BY nejcastejsi_diagnozy DESC;


-- Jaké je procento pacientů, kteří mají více než jednu hospitalizaci za poslední rok?

SELECT ROUND(AVG(id_pacienta))
FROM hospitalizace
WHERE id_pacienta in (SELECT COUNT(*) as pocet
                     FROM hospitalizace
                     GROUP by id_pacienta
                     HAVING COUNT(*) > 1);
                     
                     
-- Vytvoř dotaz, který ukáže nejvytíženějšího lékaře (podle počtu hospitalizací)

SELECT l.krestni_jmeno, l.prijmeni, COUNT(*) AS pocet_hospitalizaci
FROM lekari l
JOIN hospitalizace h
on l.id_lekare = h.id_lekare
GROUP BY l.krestni_jmeno, l.prijmeni
ORDER BY pocet_hospitalizaci DESC
LIMIT 1;


-- Vytvoř report, který ukazuje počet hospitalizací podle měsíců za poslední dva roky

SELECT DISTINCT EXTRACT(MONTH FROM datum_prijeti) AS mesice, COUNT(id_oddeleni) AS pocet
FROM hospitalizace
WHERE datum_prijeti BETWEEN '2022-12-20' AND '2024-12-20'
GROUP BY mesice
ORDER BY mesice, pocet DESC;


-- Najdi pacienty, kteří byli hospitalizováni na více než jednom oddělení během jedné hospitalizace.

SELECT id_pacienta,
		id_hospitalizace,
        COUNT(id_oddeleni) AS pocet_oddeleni
FROM hospitalizace
GROUP BY id_pacienta, id_hospitalizace
Having 
	count(DISTINCT id_oddeleni) > 1;
       
    




        
  