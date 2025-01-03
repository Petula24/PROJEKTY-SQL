CREATE TABLE Users(
  user_id	INT PRIMARY key,
  name 		VARCHAR(100),
  email		VARCHAR(100),
  registration_date DATE
  );
  
  CREATE TABLE Matches (
    match_id	int PRIMARY KEY,
    sport		VARCHAR(50),
    team_a		VARCHAR(100),
    team_b		VARCHAR(100),
    match_date	DATETIME,
    result		VARCHAR(20)
    );
    
    CREATE TABLE Bets (
      bet_id	INT PRIMARY KEY,
      user_id	INT,
      match_id 	INT,
      amount	DECIMAL(10,2),
      bet_type	VARCHAR(50),
      status	VARCHAR(20) CHECK (status IN ('won', 'lost', 'unprocessed')),
      odds		DECIMAL(10,2)
      FOREIGN KEY (user_id) REFERENCES Users(user_id),
      FOREIGN KEY (match_id) REFERENCES Matches(match_id)
      );
      
      CREATE TABLE Transactions (
        transaction_id	INT PRIMARY KEY,
        transaction_type VARCHAR(20),
        user_id			INT,
        amount			DECIMAL(10,2),
        transaction_date	DATETIME,
        FOREIGN KEY (Bets) REFERENCES Bets(amount),
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        );
    
    INSERT INTO Users (user_id, name, email, registration_date)
    VALUES
    (1, 'Jack Addams', 'jack.addams@gmail.com', '2017-08-22'),
    (2, 'John Snow', 'john.snow@yahoo.com', '2018-10-01'),
    (3, 'Walter White', 'walter.white@gmail.com', '2020-01-20'),
    (4, 'Kuldeep Rana', 'k.rana@one.com', '2017- 02-20'),
    (5, 'Selena Wind', 'wind.sel@gmail.com', '2019-12-12'),
    (6, 'Alexander Whit', 'alex.whit@yahoo.com', '2018-10-03'),
    (7, 'Sheldon Malik', 's.malik@gmail.com', '2017-06-20'),
    (8, 'Ross Antone', 'ross.antone@gmail.com', '2020-11-25'),
    (9, 'Kate Stone', 'k.stone@yahoo.com', '2019-04-18'),
    (10, 'Walter Much', 'walter.much@yahoo.com', '2020-11-05'),
    (11, 'Martin Addam', 'addam.martin@one.com', '2018-12-01'),
    (12, 'Taylor Krem', 'tkrem@yahoo.com', '2020-05-01'),
    (13, 'Cordon Blacke', 'c.blacke@gmail.com', '2021-10-26'),
    (14, 'Adam Jess', 'adam.jess@gmail.com', '2017-11-13'),
    (15, 'Jessica Ali', 'ali.jessica@gmail.com', '2020-12-20');
    
    INSERT INTO Matches(match_id, sport, team_a, team_b, match_date, result)
    VALUES
    (1, 'Football', 'Atalanta Bergamo', 'Sturm Graz', '2024-12-01 17:00', '1:1'),
    (2, 'Tenis', 'Petrov Alexander', 'Schachter Noah', '2024-11-03 16:30', '2:0'),
    (3, 'Football', 'Plzen', 'Slavia Praha', '2024-09-23 18:00', '3:0'),
    (4, 'Hockey', 'New Jersey Devils', 'Los Angeles Kings', '2024-11-03 15:00', '3:2'),
    (5, 'Tenis', 'Lepchenko Varvara', 'Blinkova Anna', '2024-10-23 20:00', '0:2'),
    (6, 'Hockey', 'Philadelphia Flyers', 'Detroit Red Wings', '2024-08-11 17:30', '5:3');
    
    INSERT INTO Transactions(transaction_id, transation_type, user_id, amount, transaction_date)
    VALUES
    (1, 5, 'deposit', 500.00, '2024-11-03 16:00'),
    (2, 3, 'deposit', 100.00, '2024-11-03 15:30'),
    (3, 1, 'deposit', 1000.00, '2024-10-02 10:00'),
    (4, 10, 'deposit', 50.00, '2024-08-11 15:00'),
    (5, 5, 'deposit', 250.00, '2024-08-10 12:13'),
    (6, 15, 'deposit', 2000.00, '2024-12-01 15:46'),
    (7, 4, 'deposit', 200.00, '2024-10-23 17:50'),
    (8, 6, 'deposit', 800.00, '2024-11-01 20:00'),
    (9, 2, 'deposit', 700.00, '2024-09-23 09:15'),
    (10, 7, 'deposit', 800.00, '2024-09-22 17:45'),
    (11, 4, 'deposit', 300.00, '2024-12-01 14:20'),
    (12, 8, 'deposit', 1000.00, '2024-11-02 12:15'),
    (13, 11, 'deposit', 700.00, '2024-09-23 16:10'),
    (14, 9, 'deposit', 1500.00, '2024-08-10 22:12'),
    (15, 12, 'deposit', 50.00, '2024-10-23 19:00'),
    (16, 10, 'deposit', 1000.00, '2024-12-01 10:00'),
    (17, 15, 'deposit', 1500.00, '2024-08-11 12:30'),
    (18, 3, 'deposit', 100.00, '2024-10-23 09:11'),
    (19, 15, 'deposit', 1000.00, '2024-10-23 12:15');
    
    INSERT INTO Bets(bet_id, user_id, match_id,amount, bet_type, status, odds)
    VALUES
    (1, 1, 5, 1000, 'win', 'lost', 2.30),
    (2, 2, 3, 700, 'win', 'won', 1.50),
    (3, 3, 5, 100, 'lose', 'won', 2.30),
    (4, 3, 2, 100, 'win', 'won', 3.20),
    (5, 4, 5, 200, 'lose', 'won', 2.30),
    (6, 4, 1, 300, 'draw', 'won', 4.00),
    (7, 5, 2, 500, 'lose', 'lost', 1.90),
    (8, 5, 6, 250, 'win', 'won', 2.15),
    (9, 6, 4, 800, 'lose', 'lost', 1.50),
    (10, 7, 3, 800, 'win', 'won', 3.20),
    (11, 8, 2, 1000, 'lose', 'lost', 1.90),
    (12, 9, 6, 1500, 'draw', 'lost', 4.50),
    (13, 10, 6, 50, 'win', 'won', 2.15),
    (14, 10, 1, 1000, 'lose', 'lost', 2.15),
    (15, 11, 3, 700,'win', 'won', 1.50),
    (16, 12, 5, 50, 'win', 'lost', 2.30),
    (14, 15, 1, 2000, 'win', 'lost', 2.30),
    (15, 15, 6, 1500, 'draw', 'lost', 4.50),
    (16, 15, 5, 1000 'lose', 'lost', 2.00);
    
    
   
    -- The company's total profit on bets:
    
   SELECT 
    	SUM(CASE WHEN b.status = 'lost' THEN b.amount 
            ELSE 0 end) - 
        SUM(CASE WHEN b.status = 'won' THEN b.amount * b.odds
            ELSE 0 END) AS total_profit
   FROM bets b;
   
                     
 -- Top 5 users by number of wins:
 
 SELECT u.name, 
 	COUNT(b.bet_id) AS total_wins, 
    SUM(b.amount * b.odds) as total_winnings
 FROM Bets b
 JOIN Users u 
 ON b.user_id = u.user_id
 WHERE B.status = 'won'
 GROUP BY u.name
 ORDER BY total_winnings DESC
 LIMIT 5;
 
 
 -- The most common type of bet:
 
 SELECT bet_type, COUNT(*) AS COUNT
 FROM Bets
 GROUP BY bet_type
 ORDER BY count DESC
 LIMIT 1;
 
 
 -- Find the bettor with the largest bet. Show name, amount deposited, bet status:
 
 SELECT u.name, MAX(t.amount) max_amount, status 
 FROM Users u
 JOIN Transactions t
 on u.user_id = t.user_id
 JOIN Bets b
 ON u.user_id = b.user_id
 GROUP BY u.name
 ORDER BY max_amount DESC
 LIMIT 1;