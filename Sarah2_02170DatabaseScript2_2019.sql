#Create Database OverwatchLeague;
Use OverwatchLeague;
DROP TABLE IF EXISTS Plays;
DROP TABLE IF EXISTS Takes;
DROP TABLE IF EXISTS Match_of_Teams;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Date_Week;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Map;
Drop View IF EXISTS AGE;


Create Table Team (
team_name VARCHAR(50) primary key,
city VARCHAR(50), 
sponsor VARCHAR(50),
colour VARCHAR(30),
country VARCHAR(50));

Create Table Player (
ID Varchar(50) Primary key ,
team_name VARCHAR(50) nOT nULL,
full_name Varchar(50),
country VARCHAR(50),
player_number INT,
player_role Enum("Support","DPS","Tank"),
ranking INT,
date_of_birth date,
foreign key (team_name) references Team(team_name) on delete cascade);

Create Table Map (
map_name Varchar(50) Primary key,
map_type varchar(50),
location varchar(50) );

Create Table Date_Week (
	date_of_play date Primary key,
    week_of_play int);

Create Table Match_Of_Teams (
ID INT Primary key Auto_Increment,
date_of_play date,
mvp_ID varchar(50),
foreign key (mvp_ID) references Player(ID) on delete set null,
foreign key (date_of_play) references Date_Week(date_of_play) on delete set null);

Create Table Plays(
match_ID INT NOT NULL,
team_name Varchar(50),
result Enum("Win","Lose"),
primary key (team_name, match_ID),
foreign key (team_name) references Team(team_name) on delete cascade,
foreign key (match_ID) references Match_Of_Teams(ID) on delete cascade);

Create Table Takes(
match_ID Int Not Null,
map_name Varchar(50),
primary key (match_ID, map_name),
foreign key (match_ID) references match_of_teams(ID) on delete cascade,
foreign key (map_name) references  map(map_name) on delete cascade);

CREATE VIEW Age AS
SELECT ID, TIMESTAMPDIFF(YEAR, date_of_birth,  CURDATE()) as Age
FROM Player;

Insert into Team Values("Boston Uprising", "Boston", "Gillette", "Blue", "USA");
Insert into Team Values("Dallas Fuel", "Dallas","Jack in the Box","Black", "USA");
Insert into Team Values("Houston Outlaws", "Houston", "T-Mobile", "Green", "USA");
Insert into Team Values("London Spitfire", "London", "Logitech G", "Blue", "United Kingdom");
Insert into Team Values("New York Excelsior", "New York", "T-Mobile", "Black", "USA");
Insert into Team Values("Philadelphia Fusion", "Philadelphia", "ARRIS", "Yellow", "USA");
Insert into Team Values("Seoul Dynasty", "Seoul", "SIDIZ", "Black", "South Korea");
Insert into Team Values("Shanghai Dragons", "Shanghai", NULL, "Red", "China");
Insert into Team Values("San Francisco Shock", "San Francisco", NULL, "Gray", "USA");


Insert into Player Values("tobi", "Seoul Dynasty", "Jinmo Yang", "South Korea", 4,"Support",4373,19940226);
Insert into Player Values("ryujehong", "Seoul Dynasty", "Jehong Ryu", "South Korea",14,"Support",4647, 19910905);
Insert into Player Values("bunny", "Seoul Dynasty", "Junhyeok Chae", "South Korea",8,"DPS", NULL, 19980515);
Insert into Player Values("zunba", "Seoul Dynasty", "Joonhyeok Kim", "South Korea",5,"Tank",4591,19971029);
Insert into Player Values("miro", "Seoul Dynasty", "Jinhyuk Gong", "South Korea",3,"Tank",4645,19960226);
Insert into Player Values("fleta", "Seoul Dynasty", "Byungsun Kim", "South Korea",1,"DPS",NULL, 19990902);

Insert into Player Values("kellex", "Boston Uprising", "Kristian Keller", "Denmark", 9,"Support",Null,19990209);
Insert into Player Values("aimgod", "Boston Uprising", "Minseok Kwon", "South Korea", 31,"Support",Null,19990331);
Insert into Player Values("mistakes", "Boston Uprising", "Stanislav Danilov", "Russia", 2,"DPS",4666,19970326);
Insert into Player Values("striker", "Boston Uprising", "Namjoo Kwon", "South Korea", 7,"DPS",Null,19901204);
Insert into Player Values("gamsu", "Boston Uprising", "Youngjin Noh", "South Korea", 1,"Tank",Null,19940226);
Insert into Player Values("kalios", "Boston Uprising", "Wooyeol Shin", "South Korea", 18,"Tank",4373,19981109);
Insert into Player Values("dreamkazper", "Boston Uprising", "Jonathan Sanchez", "USA", 28,"DPS",4373,19981109);


Insert into Player Values("harryhook", "Dallas Fuel", "Jonathan Tejedor Rua", "Spain", 9,"Support",4659,19910810);
Insert into Player Values("custa", "Dallas Fuel", "Scott Kennedy", "Australia", 10,"Support",4707,19931122);
Insert into Player Values("akm", "Dallas Fuel", "Dylan Bignet", "France", 10,"DPS",Null,19951211);
Insert into Player Values("taimou", "Dallas Fuel", "Timo Kettunen", "Finland", 13,"DPS",4598,19930830);
Insert into Player Values("XQC", "Dallas Fuel", "Félix Lengyel", "Canada", 12,"Tank",Null,19951112);
Insert into Player Values("mickie", "Dallas Fuel", "Pongphop Rattanasangchod", "Thailand", 7,"Tank",4468,19931028);
Insert into Player Values("seagull", "Dallas Fuel", "Brandon Larned", "USA", 7,"DPS",4468,19920728);


Insert into Player Values("linkzr", "Houston Outlaws", "Jiri Masalin", "Finland", 49,"DPS",4595,19940409);
Insert into Player Values("jake", "Houston Outlaws", "Jacob Lyon", "USA", 76,"DPS",4540 ,19960728);
Insert into Player Values("muma", "Houston Outlaws", "Austin Wilmot", "USA", 17,"Tank",null,19980817);
Insert into Player Values("coolmatt", "Houston Outlaws", "Matt Iorio", "USA", 69,"Tank",null,19890729);
Insert into Player Values("bani", "Houston Outlaws", "Christopher Benell", "Canada", 3,"Support",null,19930928);
Insert into Player Values("rawkus", "Houston Outlaws", "Shane Flaherty", "USA", 1,"Support",4676,19940616);

Insert into Player Values("rascal", "London Spitfire", "Dongjun Kim", "South Korea", 27,"DPS",4343,19980723);
Insert into Player Values("profit", "London Spitfire", "Junyoung Park", "South Korea", 13,"DPS",4619,19991119);
Insert into Player Values("fissure", "London Spitfire", "Chanhyung Baek", "South Korea", 1,"Tank",null,19990226);
Insert into Player Values("fury", "London Spitfire", "Junho Kim", "South Korea", 19,"Tank",null,19991125);
Insert into Player Values("bdosin", "London Spitfire", "Seungtae Choi", "South Korea", 22,"Support",null,19960818);
Insert into Player Values("closer", "London Spitfire", "Wonsik Jung", "South Korea", 4,"Support",null,19980516);
Insert into Player Values("Gesture", "London Spitfire", "Jae-hee Hong", "South Korea", 7,"Tank",null,19980112);

Insert into Player Values("saebyeolbe", "New York Excelsior", "Jongryeol Park", "South Korea", 9,"DPS",null,19951223);
Insert into Player Values("libero", "New York Excelsior", "Haeseong Kim", "South Korea", 10,"DPS",null,19990712);
Insert into Player Values("mano", "New York Excelsior", "Donggyu Kim", "South Korea", 7,"Tank",null,19960412);
Insert into Player Values("meko", "New York Excelsior", "Taehong Kim", "South Korea", 11,"Tank",null,19970725);
Insert into Player Values("jjonak", "New York Excelsior", "Seonghyun Bang", "South Korea", 44,"Support",4724,19991220);
Insert into Player Values("anamo", "New York Excelsior", "Taesung Jung", "South Korea", 97,"Support",null,19970902);

Insert into Player Values("carpe", "Philadelphia Fusion", "Jaehyeok Lee", "South Korea", 18,"DPS",4697,19981014);
Insert into Player Values("eqo", "Philadelphia Fusion", "Josue Corona", "Israel", 15,"DPS",null,19990510);
Insert into Player Values("hotba", "Philadelphia Fusion", "Hongjun Choi", "South Korea",7,"Tank",null,19991130);
Insert into Player Values("sado", "Philadelphia Fusion", "Sumin Kim", "South Korea",9,"Tank",null,19990115);
Insert into Player Values("dayfly", "Philadelphia Fusion", "Jeonghwan Park", "South Korea", 10,"Support",null,19990115);
Insert into Player Values("boombox", "Philadelphia Fusion", "Isaac Charles", "United Kingdom", 42,"Support",null,19970417);
Insert into Player Values("ShadowBurn", "Philadelphia Fusion", "George Gushcha", "Russia", 18,"DPS",4690,19970424);


Insert into Player Values("diya", "Shanghai Dragons", "Weida Lu", "China", 0,"DPS",null,19990730);
Insert into Player Values("ado", "Shanghai Dragons", "Gihyeon Chon", "South Korea", 99,"DPS",null,19990316);
Insert into Player Values("xushu", "Shanghai Dragons", "Junjie Liu", "China",66,"Tank",null,19950101);
Insert into Player Values("roshan", "Shanghai Dragons", "Wenhao Jing", "China", 26,"Tank",null,19970511);
Insert into Player Values("fiveking", "Shanghai Dragons", "Zhaoyu Chen", "China", 9,"Support",null,19971208);
Insert into Player Values("altering", "Shanghai Dragons", "Yage Cheng", "China", 13,"Support",null,19940322);

Insert into Player Values
	("Danteh", "San Francisco Shock", "Dante Cruz", "USA", "6", "DPS", "79", 19900324);    

Insert into Date_Week Values
	(20180110, 1),
    (20180111, 1),
    (20180112, 1),
    (20180113, 1),
    (20180117, 2),
    (20180118, 2),
    (20180119, 2),
    (20180120, 2),
    (20180124, 3),
    (20180125, 3),
    (20180126, 3),
    (20180127, 3),
    (20180131, 4),
    (20180201, 4),
    (20180202, 4),
    (20180203, 4),
    (20180207, 5),
    (20180208, 5),
    (20180209, 5),
    (20180210, 5);
    

Insert into Match_of_teams(date_of_play, mvp_ID) Values
	(20180110, "Fleta"),
    (20180111, "Carpe"),
    (20180111, "jjonak"),
    (20180112, "Danteh"),
    (20180113, "Gesture"),
    (20180113, "Jjonak"),
    (20180117, "Carpe"),
    (20180117, "Muma"),
    (20180118, "Jake"),
    (20180119, "Miro"),
    (20180119, "Profit"),
    (20180120, "Danteh"),
    (20180124, "Bdosin"),
    (20180124, "ryujehong"),
    (20180125, "Gamsu"),
    (20180125, "Carpe"),
    (20180126, "Saebyeolbe"),
    (20180126, "Carpe"),
    (20180126, "Mickie"),
    (20180127, "DreamKazper"),
    (20180131, "Muma"),
    (20180201, "ShaDowBurn"),
    (20180201, "Libero"),
    (20180201, "Gesture"),
    (20180202, "zunba"),
    (20180203, "Profit"),
    (20180203, "MekO"),
    (20180207, "Seagull"),
    (20180208, "Striker"),
    (20180208, "coolmatt"),
    (20180209, "Fleta"),
    (20180210, "JJoNak"),
    (20180210, "LiNkzr");
        
Insert into Plays Values
	(1, "Dallas Fuel", "Lose"),
    (1, "Seoul Dynasty", "Win"),
    (2, "Philadelphia Fusion", "Win"),
    (2, "Houston Outlaws", "Lose"),
    (3, "Boston Uprising", "Lose"),
    (3, "New York Excelsior", "Win"),
    (4, "San Francisco Shock", "Win"),
    (4, "Shanghai Dragons", "Lose"),
	(5, "London Spitfire", "Win"),
    (5, "Philadelphia Fusion", "Lose"),
    (6, "New York Excelsior", "Win"),
    (6, "Houston Outlaws", "Lose"),
    (7, "San Francisco Shock", "Lose"),
    (7, "Philadelphia Fusion", "Win"),
    (8, "Houston Outlaws", "Win"),
    (8, "Shanghai Dragons", "Lose"),
    (9, "Dallas Fuel", "Lose"),
    (9, "Houston Outlaws", "Win"),
    (10, "Seoul Dynasty", "Win"),
    (10, "Boston Uprising", "Lose"),
    (11, "London Spitfire", "Win"),
    (11, "Dallas Fuel", "Lose"),
    (12, "Boston Uprising", "Lose"),
    (12, "San Francisco Shock", "Win"),
    (13, "London Spitfire", "Win"),
    (13, "San Francisco Shock", "Lose"),
    (14, "Shanghai Dragons", "Lose"),
    (14, "Seoul Dynasty", "Win"),
    (15, "London Spitfire", "Lose"),
    (15, "Boston Uprising", "Win"),
    (16, "New York Excelsior", "Lose"),
    (16, "Philadelphia Fusion", "Win"),
    (17, "Seoul Dynasty", "Lose"),
    (17, "New York Excelsior", "Win"),
    (18, "Shanghai Dragons", "Lose"),
    (18, "Philadelphia Fusion", "Win"),
    (19, "San Francisco Shock", "Lose"),
    (19, "Dallas Fuel", "Win"),
    (20, "Boston Uprising", "Win"),
    (20, "Dallas Fuel", "Lose"),
    
    (21, "Houston Outlaws", "Win"),
    (21, "San Francisco Shock", "Lose"),
    (22, "Philadelphia Fusion", "Win"),
    (22, "Dallas Fuel", "Lose"),
    (23, "New York Excelsior", "Win"),
    (23, "Shanghai Dragons", "Lose"),
    (24, "London Spitfire", "Win"),
    (24, "Seoul Dynasty", "Lose"),
    (25, "Seoul Dynasty", "Win"),
    (25, "Houston Outlaws", "Lose"),
    (26, "London Spitfire", "Win"),
    (26, "Shanghai Dragons", "Lose"),
    (27, "New York Excelsior", "Win"),
    (27, "Dallas Fuel", "Lose"),
    
    (28, "Dallas Fuel", "Win"),
    (28, "Shanghai Dragons", "Lose"),
    (29, "Boston Uprising", "Win"),
    (29, "Philadelphia Fusion", "Lose"),
    (30, "Houston Outlaws", "Win"),
    (30, "London Spitfire", "Lose"),
    (31, "Seoul Dynasty", "Win"),
    (31, "San Francisco Shock", "Lose"),
    (32, "New York Excelsior", "Win"),
    (32, "London Spitfire", "Lose"),
    (33, "Houston Outlaws", "Win"),
    (33, "Boston Uprising", "Lose");
    
Insert into Map Values
	("King's Row", "Hybrid", "United Kingdom"),
    ("Hanamura", "Assault", "Japan"),
    ("Temple of Anubis", "Assault", "Egypt"),
    ("Watchpoint: Gibraltar", "Escort", "Base"),
    ("Numbani", "Hybrid", "Numbani"),
    ("Volskaya Industries", "Assault", "Russia"),
    ("Dorado", "Escort", "Mexico"),
    ("Hollywood", "Hybrid", "USA"),
    ("Lijiang Tower", "Control", "China"),
    ("Nepal", "Control", "Nepal"),
    ("Ilios", "Control", "Greece"),
    ("Route 66", "Escort", "USA"),
    ("Eichenwalde", "Hybrid", "Germany"),
    ("Oasis", "Control", "Egypt"),
    ("Horizon Lunar Colony", "Assault", "The Moon"),
    ("Junkertown", "Escort", "Australia"),
    ("Blizzard World", "Hybrid", "USA");

Insert into takes Values
	(1, "Junkertown"),
    (1, "Horizon Lunar Colony"),
    (1, "Ilios"),
    (1, "Numbani"),
    (2, "Junkertown"),
    (2, "Horizon Lunar Colony"),
    (2, "Ilios"),
    (2, "Numbani"),
    (3, "Junkertown"),
    (3, "Horizon Lunar Colony"),
    (3, "Ilios"),
    (3, "Numbani"),
    (4, "Junkertown"),
    (4, "Horizon Lunar Colony"),
    (4, "Ilios"),
    (4, "Numbani"),
    (5, "Junkertown"),
    (5, "Horizon Lunar Colony"),
    (5, "Ilios"),
    (5, "Numbani"),
    (6, "Junkertown"),
    (6, "Horizon Lunar Colony"),
    (6, "Ilios"),
    (6, "Numbani"),
    (7, "Junkertown"),
    (7, "Horizon Lunar Colony"),
    (7, "Ilios"),
    (7, "Eichenwalde"),
    (8, "Junkertown"),
    (8, "Horizon Lunar Colony"),
    (8, "Ilios"),
    (8, "Eichenwalde"),
    (9, "Junkertown"),
    (9, "Horizon Lunar Colony"),
    (9, "Ilios"),
    (9, "Eichenwalde"),
    (10, "Junkertown"),
    (10, "Horizon Lunar Colony"),
    (10, "Ilios"),
    (10, "Eichenwalde"),
    (11, "Junkertown"),
    (11, "Horizon Lunar Colony"),
    (11, "Ilios"),
    (11, "Eichenwalde"),
    (12, "Junkertown"),
    (12, "Horizon Lunar Colony"),
    (12, "Ilios"),
    (12, "Eichenwalde"),
	(13, "Junkertown"),
    (13, "Horizon Lunar Colony"),
    (13, "Ilios"),
    (13, "Eichenwalde"),
    (14, "Junkertown"),
    (14, "Horizon Lunar Colony"),
    (14, "Ilios"),
    (14, "Eichenwalde"),
    (15, "Junkertown"),
    (15, "Horizon Lunar Colony"),
    (15, "Ilios"),
    (15, "Eichenwalde"),
    (16, "Junkertown"),
    (16, "Horizon Lunar Colony"),
    (16, "Ilios"),
    (16, "Eichenwalde"),
    (17, "Junkertown"),
    (17, "Horizon Lunar Colony"),
    (17, "Ilios"),
    (17, "Eichenwalde"),
    (18, "Junkertown"),
    (18, "Horizon Lunar Colony"),
    (18, "Ilios"),
    (18, "Eichenwalde"),
	(19, "Junkertown"),
    (19, "Horizon Lunar Colony"),
    (19, "Ilios"),
    (19, "Eichenwalde"),
    (20, "Junkertown"),
    (20, "Horizon Lunar Colony"),
    (20, "Ilios"),
    (20, "Eichenwalde"),
    (21, "Dorado"),
    (21, "Horizon Lunar Colony"),
    (21, "Ilios"),
    (21, "Numbani"),
    (22, "Dorado"),
    (22, "Horizon Lunar Colony"),
    (22, "Ilios"),
    (22, "Numbani"),
    (23, "Dorado"),
    (23, "Horizon Lunar Colony"),
    (23, "Ilios"),
    (23, "Numbani"),
    (24, "Dorado"),
    (24, "Horizon Lunar Colony"),
    (24, "Ilios"),
    (24, "Numbani"),
    (25, "Dorado"),
    (25, "Horizon Lunar Colony"),
    (25, "Ilios"),
    (25, "Numbani"),
    (26, "Dorado"),
    (26, "Horizon Lunar Colony"),
    (26, "Ilios"),
    (26, "Numbani"),
    (27, "Dorado"),
    (27, "Horizon Lunar Colony"),
    (27, "Ilios"),
    (27, "Numbani"),
	(28, "Eichenwalde"),
    (28, "Horizon Lunar Colony"),
    (28, "Ilios"),
    (28, "Numbani"),
    (29, "Eichenwalde"),
    (29, "Horizon Lunar Colony"),
    (29, "Ilios"),
    (29, "Numbani"),
    (30, "Eichenwalde"),
    (30, "Horizon Lunar Colony"),
    (30, "Ilios"),
    (30, "Numbani"),
    (31, "Eichenwalde"),
    (31, "Horizon Lunar Colony"),
    (31, "Ilios"),
    (31, "Numbani"),
    (32, "Eichenwalde"),
    (32, "Horizon Lunar Colony"),
    (32, "Ilios"),
    (32, "Numbani"),
    (33, "Eichenwalde"),
    (33, "Horizon Lunar Colony"),
    (33, "Ilios"),
    (33, "Numbani");
    
# 7 SQL Data Queries #

select distinct team_name from plays;

select match_ID, team_name as Winner from plays where result = 'win' order by match_ID;   
select match_ID, team_name as Loser from plays where result = 'lose' order by match_ID;  

select age, AVG(ranking) as average_ranking, MAX(ranking) as maximum_ranking, 
MIN(ranking) as minimum_ranking from Player natural join Age group by age;

select * from Player natural join Team natural join Age;

# 8 SQL Table Modifictions #
UPDATE team SET colour = 'Azure'
WHERE team_name = 'London Spitfire';

UPDATE team SET sponsor = 'Razer'
WHERE team_name = 'Shanghai Dragons';

DELETE FROM player
WHERE ID = 'XQC';

# 9 SQL Programming # 
# 9.1 Functions #
DROP FUNCTION count_winning;
DELIMITER //
CREATE FUNCTION count_winning(vTeam_name varchar(50)) RETURNS INT
Begin
	DECLARE vWinningCount INT;
    SELECT COUNT(*) INTO vWinningCount FROM team NATURAL JOIN plays
    WHERE (team_name = vTeam_name) and (result = 'Win');
    RETURN vWinningCount;
END;//
DELIMITER ;

# 9.2 Procedures #
DELIMITER //
CREATE PROCEDURE GetNationality
(IN vPlayername VARCHAR(50), OUT vNationality VARCHAR(50))
BEGIN
 SELECT Country INTO vNationality FROM Player
    WHERE ID = vPlayername;
end; //
DELIMITER ;

CALL GetNationality('tobi', @Nationality);
select 'tobi' AS Player_name, @Nationality as Nationality;

# 9.3 Transactions #   
DELIMITER //
CREATE PROCEDURE player_trade (
IN vPlayer1 varchar(50), vPlayer2 varchar(50), OUT vStatus VARCHAR(45))
BEGIN
DECLARE OldTeam1, NewTeam1, OldTeam2, NewTeam2 varchar(50);
START TRANSACTION;
SET SQL_SAFE_UPDATES = 0;
SET OldTeam1 = (SELECT team_name FROM player WHERE id = vPlayer1);
SET OldTeam2 = (SELECT team_name FROM player WHERE id = vPlayer2);
Set NewTeam1 = OldTeam2;
Set NewTeam2 = OldTeam1;
UPDATE Player SET team_name = NewTeam1 WHERE ID = vPlayer1;
UPDATE Player SET team_name = NewTeam2 WHERE ID = vPlayer2;
IF NewTeam1=OldTeam2 and NewTeam2=OldTeam1
THEN SET vStatus = 'Transaction Trade committed!'; COMMIT;
ELSE SET vStatus = 'Transaction Trade rollback'; ROLLBACK;
END IF;
END; //
DELIMITER ;

# 9.4 Triggers #
DELIMITER //
CREATE TRIGGER Plays_before_Insert
Before INSERT ON Plays FOR EACH ROW
BEGIN
declare number_of_teams int;
Set number_of_teams = (select count(*) from plays where match_id = new.match_id);
IF number_of_teams > 1 then 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Only two teams can play a match.';
End IF;
END; //
DELIMITER ;

# 9.5 Events #
DELIMITER //
SHOW VARIABLES LIKE 'event_scheduler';

SET GLOBAL event_scheduler = 1;

CREATE EVENT changeranking
    ON SCHEDULE    
      EVERY 1 MONTH
      DO 
      UPDATE player SET player_ranking = NULL ;
DELIMITER ; 
    
	
    
    
    



