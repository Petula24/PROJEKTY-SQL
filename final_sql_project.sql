
#Poèet provedených testù:                  
CREATE OR REPLACE TABLE provedene_testy AS
SELECT tests_performed, country, `date`   
FROM covid19_tests AS ct;      


# Binární promìnná pro víkend/všední­ den (1_0): 
CREATE OR REPLACE TABLE binarni_promenna AS         
SELECT date,                                            
	country,                                            
	confirmed,                                          
	CASE WHEN weekday(`date`) in (5, 6) THEN 1          
	ELSE 0 END AS weekend,                              
	# roèní období daného dne:                
	CASE WHEN month(`date`) BETWEEN 1 AND 3 THEN 0      
		WHEN month(`date`) BETWEEN 4 AND 6 THEN 1       
		WHEN month(`date`) BETWEEN 7 AND 9 THEN 2       
		WHEN month(`date`) BETWEEN 10 AND 12 THEN 3     
	END AS season                                       
FROM covid19_basic_differences AS base


# Hustota zalidnìní:
CREATE OR REPLACE TABLE hustota_zalidneni AS
SELECT country, population         
FROM lookup_table AS lt      
WHERE province IS NULL; 


#HDP, GINI koeficient, dìtská úmrtnost:
CREATE OR REPLACE TABLE z_economies AS
SELECT DISTINCT                                           
 	e.country,                                       
 	e.GDP/e.population AS HDP,                     
 	e.mortaliy_under5 AS detska_umrtnost,            
 	e.gini AS Gini                              
FROM economies AS e                                  
WHERE `year` = 2020
  

# Medián vìku obyvatel 2018:
CREATE OR REPLACE TABLE median AS
SELECT country,                                           
	round(median_age_2018,2) AS median_vek           
FROM countries AS c
)  


#Podil náboženství:
CREATE OR REPLACE TABLE v_podil_nabozenstvi AS                                                                              
WITH krestanstvi AS (                                                                                           
	SELECT country, population                                                                                  
	FROM religions AS re                                                                                         
	WHERE religion = 'Christianity' AND `year` = 2020                                                           
	ORDER BY country                                                                                            
),                                                                                                              
islam AS (                                                                                                      
	SELECT country, population                                                                                  
	FROM religions AS re                                                                                        
	WHERE religion = 'Islam' AND `year` = 2020                                                                  
	ORDER BY country                                                                                            
),                                                                                                              
hinduismus AS (                                                                                                 
	SELECT country, population                                                                                  
	FROM religions AS re                                                                                         
	WHERE religion = 'Hinduism' AND `year` = 2020                                                               
	ORDER BY country                                                                                            
),                                                                                                              
budhismus AS (                                                                                                  
	SELECT country, population                                                                                  
	FROM religions AS re                                                                                            
	WHERE religion = 'Buddhism' AND `year` = 2020                                                               
	ORDER BY country                                                                                            
),                                                                                                              
judaismus AS (                                                                                                  
	SELECT country, population                                                                                  
	FROM religions AS re                                                                                            
	WHERE religion = 'Judaism' AND `year` = 2020                                                                
	ORDER BY country                                                                                            
),                                                                                                              
lidova_nab AS (                                                                                                 
	SELECT country, population                                                                                  
	FROM religions AS re                                                                                            
	WHERE religion = 'Folk Religions' AND `year` = 2020                                                         
	ORDER BY country                                                                                            
),                                                                                                              
ostatni AS (                                                                                                    
	SELECT country, population                                                                                  
	FROM religions AS re                                                                                            
	WHERE religion = 'Other Religions' AND `year` = 2020                                                        
	ORDER BY country                                                                                            
),                                                                                                              
nepridr_nab AS (                                                                                                
	SELECT country, population                                                                                  
	FROM religions AS re                                                                                             
	WHERE religion = 'Unaffiliated Religions' AND `year` = 2020                                                 
	ORDER BY country                                                                                            
)                                                                                                               
SELECT                                                                                                          
	rel_2020.country,                                                                                           
	round((k.population / total_population_2020) * 100, 2) AS krestan_proc,                                     
	round((i.population / total_population_2020) * 100, 2) AS islam_proc,                                       
	round((h.population / total_population_2020) * 100, 2) AS hinduism_proc,                                    
	round((b.population / total_population_2020) * 100, 2) AS buddhism_proc,                                    
	round((j.population / total_population_2020) * 100, 2) AS judaism_proc,                                     
	round((l.population / total_population_2020) * 100, 2) AS lidova_nab_proc,                                 
	round((o.population / total_population_2020) * 100, 2) AS ostatni_proc,                                     
	round((n.population / total_population_2020) * 100, 2) AS nepridr_nab_proc                                  
FROM                                                                                                            
	(                                                                                                           
	SELECT re.country, re.year, sum(r.population) AS total_population_2020                                        
	FROM religions AS re                                                                                         
	WHERE r.year = 2020                                                                                         
	GROUP BY re.country                                                                                          
) rel_2020                                                                                                      
LEFT JOIN krestanstvi AS k                                                                                         
	ON k.country = rel_2020.country                                                                             
LEFT JOIN islam AS i                                                                                               
	ON i.country = rel_2020.country                                                                             
LEFT JOIN hinduismus AS h                                                                                          
	ON h.country = rel_2020.country                                                                             
LEFT JOIN budhismus AS b                                                                                           
	ON b.country = rel_2020.country                                                                             
LEFT JOIN judaismus AS j                                                                                           
	ON j.country = rel_2020.country                                                                             
LEFT JOIN lidova_nab AS l                                                                                          
	ON l.country = rel_2020.country                                                                             
LEFT JOIN ostatni AS o                                                                                             
	ON o.country = rel_2020.country                                                                             
LEFT JOIN nepridr_nab AS n                                                                                         
	ON n.country = rel_2020.country;   


# Rozdil mezi oèekávanou dobou dožití v r. 1965 a v roce 2015:
CREATE OR REPLACE TABLE rozdil_doziti AS                                                                                             
SELECT                                                            
	country, `year`,                                              
	life_expectancy AS le_2015                                    
FROM life_expectancy AS le                                        
WHERE `year` = 2015                                               
)                                                                     
SELECT                                                                
	base.country,                                                     
	le.life_expectancy - rozdil.le_1965 AS rozdil         
FROM rozdil                                                           
JOIN life_expectancy AS le                                            
	ON rozdil.country = le.country                                        
WHERE le.`year` = 1965;


#Prùmìrná denní teplota:
CREATE OR REPLACE TABLE prum_den_tepl AS
SELECT                                                                           
		`date`                                                   
		city,                                                                    
		avg(regexp_substr((temp,'[0-9]+')) AS prumer             
FROM weather AS w                                                               
WHERE time BETWEEN '06:00' AND '19:00' AND city IS NOT NULL          
GROUP BY date, city  
)


# Nulové srážky:
CREATE OR REPLACE TABLE nulove_srazky AS
SELECT date, city,                                               
		sum(poc_hodin) AS pocet                                  
FROM (                                                           
	SELECT `date`, city, `time`, rain ,                          
		CASE WHEN rain = '0.0 mm' THEN 0                         
			ELSE 3 END AS poc_hodin                              
	FROM weather AS w                                               
	WHERE city IS NOT NULL                                       
)  trn                                                           
GROUP BY `date`, city 
)


# Maximální síla vìtru:
CREATE OR REPLACE TABLE AS
SELECT                                                                   
	date,                                               
	city,                                                                
	max(gust) AS sila_vetru                                              
FROM weather AS w                                                           
WHERE time BETWEEN '00:00' AND '21:00' AND city IS NOT NULL              
GROUP BY date(`date`), city;

# Hodnoty tabulky:
CREATE OR REPLACE TABLE t_mesta (           
	mesta text(255),                        
	mesta_as text(255)                      
);                                          
INSERT INTO t_mesta (mesta, mesta_as)                                             
	VALUES ('Amsterdam', 'Amsterdam'),                                            
	('Athens', 'Athenai'),                                                        
	('Belgrade', 'Belgrade'),                                                     
	('Berlin', 'Berlin'),                                                         
	('Bern', 'Bern'),                                                             
	('Bratislava', 'Bratislava'),                                                 
	('Brussels', 'Bruxelles [Brussel]'),                                          
	('Bucharest', 'Bucuresti'),                                                   
	('Budapest', 'Budapest'),                                                     
	('Chisinau', 'Chisinau'),                                                     
	('Copenhagen', 'Copenhagen'),                                                 
	('Dublin', 'Dublin'),                                                         
	('Helsinki', 'Helsinki [Helsingfors]'),                                       
	('Kiev', 'Kyiv'),                                                             
	('Lisbon', 'Lisboa'),                                                         
	('Ljubljana', 'Ljubljana'),                                                   
	('London', 'London'),                                                         
	('Luxembourg', 'Luxembourg [Luxemburg/L'),                                    
	('Madrid', 'Madrid'),                                                         
	('Minsk', 'Minsk'),                                                           
	('Moscow', 'Moscow'),                                                         
	('Oslo', 'Oslo'),                                                             
	('Paris', 'Paris'),                                                           
	('Prague', 'Praha'),                                                          
	('Riga', 'Riga'),                                                             
	('Rome', 'Roma'),                                                             
	('Skopje', 'Skopje'),                                                         
	('Sofia', 'Sofia'),                                                           
	('Stockholm', 'Stockholm'),                                                   
	('Tallinn', 'Tallinn'),                                                       
	('Tirana', 'Tirana'),                                                         
	('Vienna', 'Wien'),                                                           
	('Vilnius', 'Vilnius'),                                                       
	('Warsaw', 'Warszawa');                                                       
                                                                                  
ALTER TABLE t_mesta CONVERT TO CHARACTER set utf8mb4 COLLATE 'utf8mb4_general_ci';

                                                                                 
# Tabulka zeme:                                                                   
CREATE OR REPLACE TABLE t_zeme(                                                  
	zeme text(255),                                                              
	zeme_as text(255)                                                            
);                                                                               
INSERT INTO t_zeme(zeme, zeme_as)                                                
	VALUES ('Albania', 'Albania'),                                               
	('Austria', 'Austria'),                                                      
	('Belarus', 'Belarus'),                                                      
	('Belgium', 'Belgium'),                                                      
	('Bulgaria', 'Bulgaria'),                                                    
	('Czech republic', 'Czechia'),                                               
	('Denmark', 'Denmark'),                                                      
	('Estonia', 'Estonia'),                                                      
	('Finland', 'Finland'),                                                      
	('France', 'France'),                                                        
	('Germany', 'Germany'),                                                      
	('Greece', 'Greece'),                                                        
	('Hungary', 'Hungary'),                                                      
	('Ireland', 'Ireland'),                                                      
	('Italy', 'Italy'),                                                          
	('Latvia', 'Latvia'),                                                        
	('Lithuania', 'Lithuania'),                                                  
	('Luxembourg', 'Luxembourg'),                                                
	('Moldova', 'Moldova'),                                                      
	('Netherlands', 'Netherlands'),                                              
	('North Macedonia', 'North Macedonia'),                                      
	('Norway', 'Norway'),                                                        
	('Poland', 'Poland'),                                                        
	('Portugal', 'Portugal'),                                                    
	('Romania', 'Romania'),                                                      
	('Russian Federation', 'Russia'),                                            
	('Serbia', 'Serbia'),                                                        
	('Slovakia', 'Slovakia'),                                                    
	('Slovenia', 'Slovenia'),                                                    
	('Spain', 'Spain'),                                                          
	('Sweden', 'Sweden'),                                                        
	('Switzerland', 'Switzerland'),                                              
	('Ukraine', 'Ukraine'),                                                      
    ('United Kingdom', 'United Kingdom');                                        
ALTER TABLE t_zeme CONVERT TO CHARACTER set utf8mb4 COLLATE 'utf8mb4_general_ci';


# 1. èást:
CREATE OR REPLACE TABLE t_cast_1         
SELECT DISTINCT                          
	pt.tests_performed,                  
	pt.country,                          
	pt.`date`,                           
	bp.rocni_obdobi,                     
	bp.weekend                           
FROM provedene_testy AS pt               
JOIN binarni_promenna AS bp              
	ON pt.country = bp.country           
	AND pt.`date` = bp.`date`; 


# 2. èást:
CREATE OR REPLACE TABLE t_cast_2 
SELECT 
	hz.population,
	ze.HDP,
	ze.detska_umrtnost, 
	ze.Gini,
	m.median_vek,
	pn.krestan_proc,
	pn.islam_proc,
	pn.hinduism_proc,
	pn.buddhism_proc,
	pn.judaism_proc,
	pn.lidova_nab_proc,
	pn.ostatni_proc,
	pn.nepridr_nab_proc,
	dz.rozdil 
FROM hustota_zalidneni AS hz 
JOIN z_economies AS ze 
	ON hz.country = ze.country 
JOIN median AS m 
	ON hz.country = m.country
JOIN podil_nabozenstvi AS pn 
	ON hz.country = m.country 
JOIN delka_zivota AS dz 
	ON hz.country = dz.country; 


# 3. èást:
CREATE OR REPLACE TABLE t_cast_3               
SELECT                                         
	pdt.prumer,                                
	pdt.city 
	ns.pocet,                                  
	msv.sila_vetru                             
FROM prum_den_tepl AS pdt                      
JOIN nulove_srazky AS ns                       
	ON pdt.`date` = ns.`date`                  
	AND pdt.city = ns.city                     
JOIN max_sila_vetru AS msv                     
	ON pdt.`date` = msv.`date`                 
	AND pdt.city = msv.city;                   	
	
    
# Spojení tabulek:
CREATE OR REPLACE TABLE spoje_tab         
SELECT                                    
	tc2.*,                                
	tc3.pocet,                            
	tc3.prumer,                           
	tc3.sila_vetru,                       
	tm.mesta_as,                          
	tz.zeme_as                            
FROM t_cast_2 AS tc2                      
JOIN t_zeme AS tz                         
	ON tc2.country = tz.zeme_as           
JOIN t_cast_3 AS tc3                      
	ON tc3.city = tc2.country             
JOIN t_mesta AS tm                        
	ON tm.mesta = tc3.city;


# Finální tabulka
CREATE OR REPLACE TABLE t_Zikmundova_final_sql_project
SELECT DISTINCT                                       
	tc1.country,                                      
	tc1.tests_performed,                              
	tc1.rocni_obdobi,                                 
	tc1.weekend,                                      
	tst.population,                                   
	tst.HDP,                                          
	tst.detska_umrtnost,                              
	tst.Gini,                                         
	tst.median_vek,                                   
	tst.krestan_proc,                                 
	tst.islam_proc,                                   
	tst.hinduism_proc,                                
	tst.buddhism_proc,                                
	tst.judaism_proc,                                 
	tst.lidova_nab_proc,                              
	tst.ostatni_proc,                                 
	tst.nepridr_nab_proc,                             
	tst.rozdil,                                       
	tst.pocet,                                        
	tst.prumer,                                       
	tst.sila_vetru,                                   
	tst.mesta_as,                                     
	tst.zeme_as                                       
FROM t_cast_1 AS tc1                                  
JOIN t_spoje_tab AS tst                               
	ON tc1.country = tst.zeme_as;                     