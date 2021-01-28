DROP database if exists MosProj;

CREATE database MosProj;
use MosProj;

CREATE table workers(
workerID varchar(8),
fName varchar(32),
mInit char(32),
lName varchar(32),
street varchar(32),
street2 varchar(32),
city varchar(32),
zip varchar(5),
phone varchar(12),
tempInterview varchar(32),
startDateAvail varchar(32),
rating integer,
constraint pk_workerID primary key (workerID));

CREATE table interview(
intDate date not null,
outcome char(32),
constraint pk_interview primary key(intDate, outcome));

CREATE table client(
clientID varchar(8),
fName varchar(32),
mInit char(32),
lName varchar(32),
street varchar(32),
streetCont varchar(32),
city varchar(32),
zip varchar(5),
cPhone varchar(12),
conactPerson varchar(32),
constraint pk_client primary key (clientID));

CREATE table job(
jID varchar(8),
title varchar(32),
level varchar(10),
dailyPR varchar(6),
desired_SD date,
desired_ED date,
desired_edu varchar(32),
reqSkills varchar(32),
reqEDU varchar(32),
daysNeeded integer,
conactPerson varchar(32),
actual_SD date,
actual_ED date,
terminationReason varchar(32),
constraint pk_job primary key (jID));

CREATE table evaluation(
jobID varchar(8),
evalDate date,
raterName varchar(32),
rating integer,
comment varchar(32),
constraint pk_eval primary key (jobID),
foreign key (jobID) references job(jID));

CREATE table paycheck(
checkNO integer,
daysWorked integer,
grossPay varchar(12),
taxesWH	varchar(10),
netPay varchar(12),
YTD_gross varchar(12),
YTD_taxes varchar(12),
YTD_net varchar(12),
constraint pk_paycheck primary key (checkNO, daysWorked));

CREATE table charge(
jobID varchar(8),
chargeDate date,
daysW integer,
amount varchar(12),
constraint pk_charge primary key (jobID, chargeDate, daysW),
foreign key (jobID) references evaluation(jobID));

CREATE table bill(
billNO integer not null,
billingDate date,
billAmount varchar(10),
constraint pk_bill primary key (billNO));

CREATE table payroll(
billNO integer not null,
payDate date,
payAmount varchar(12),
constraint pk_payroll primary key (billNO),
foreign key (billNO) references bill(billNO));

INSERT INTO client values ('0224B75C', 'Sasha',		'Uma',		'Leon','	Ap #997-9848 Purus Road', 		'Ap #309-5442 Mauris St.', 'Regina',	10515, '813-189-8143', 'Cheryl Pugh');
INSERT INTO client values ('5E49FAFF',	'Madeline',	'Fallon',	'Cherry',  '839-2141 Massa. Road',			'P.O. Box 549, 1031 Tortor Road','Ellikom',	11980, '222-864-2598','Yasir W. Klein');
INSERT INTO client values ('13F0B354',	'Kai',		'Sacha',	'Pate',		'P.O. Box 572, 4718 Blandit. Avenue',	'990-1053 Etiam St.',	'Geertruidenberg',	15951,	'574-362-6289',	'Hasad L. House');				
INSERT INTO client values ('512BBFBA',	'Charles',	'Alec',		'Murray',	'P.O. Box 200, 2430 Nec, St.',	'P.O. Box 384, 8475 Auctor Rd.',	'Mataró',	17768,	'538-744-9373',	'Lillian Haynes');					
INSERT INTO client values ('98E66AF0',	'Todd',		'Clementine','Lowery',	'P.O. Box 493, 4554 Id, Rd.',	'1832 At, St.',	'Roxburgh',	25646,	'909-706-7082',	'Sawyer F. Keith');				
INSERT INTO client values ('2B84ED7F',	'Cheryl',	'Elmo',		'Golden',	'P.O. Box 814, 8010 Ante Ave',	'645-9912 Mattis Road',	'Monte Patria',	27080,	'625-639-3938',	'Chiquita Jimenez');					
INSERT INTO client values ('A7C9A313',	'Lucas',	'Wesley',	'Houston',	'5365 Natoque Street',			'127-4199 Cras Road',	'Grand Rapids',	27953,	'427-264-4336',	'Uriah Hill');					
INSERT INTO client values ('CE8DF959',	'Robin',	'Kessie',	'Gilliam',	'Ap #468-7085 Curabitur St.',	'3473 Erat St.',	'Sennariolo',	31096,	'919-688-4923',	'Nash S. Richardson');					
INSERT INTO client values ('8981F371',	'Aladdin',	'Cullen',	'Sargent',	'1500 Lectus. St.',				'P.O. Box 692, 6034 Mattis Rd.',	'Palayankottai',	31374,	'927-484-7185',	'Barrett Turner');					
INSERT INTO client values ('D0260322',	'Castor',	'Lynn',		'Moreno',	'P.O. Box 185, 3908 Pharetra St.','P.O. Box 737, 4611 Nulla. St.',	'Wolfurt',	31504,	'822-890-2967',	'Orlando J. Franklin');

INSERT INTO workers values ('B1EA672A',	'Wanda',	'Whilemina',	'Parks',	'Ap #315-7542 A, Ave',	'6189 Venenatis Street',	'Sanluri',	51216,	'462-317-5004', '2018-11-14 06:30:16',	'2018-12-02 02:08:13',	7);			
INSERT INTO workers values ('37F4F59D',	'Travis',	'Demetria',	'Brennan',	'P.O. Box 955, 2796 Mi Av.',	'308-9587 Justo Rd.',	'Villafranca dAsti',	58338,	'234-375-9841',	'2018-10-30 19:35:48',	'2018-11-25 08:53:32',	5);			
INSERT INTO workers values('58BCD7C3',	'Gretchen',	'Yuli',	'Stafford',	'2446 Magnis St.',	'3962 Urna Avenue',	'Jefferson City',	58578,	'633-193-6320',	'2018-12-10 05:32:39',	'2018-11-25 01:55:45',	6);			
INSERT INTO workers values ('B6979BBE',	'Blaine',	'Nola',	'Dejesus',	'846-977 Nullam Street',	'P.O. Box 876, 9883 Sem Road',	'Vandoies/Vintl',	59806,	'692-177-7081',	'2018-11-02 03:00:56',	'2018-10-27 03:57:17',	8);			
INSERT INTO workers values ('87E8D390',	'Evangeline',	'Desirae',	'Preston',	'6188 Egestas Avenue',	'Ap #330-2396 Eleifend St.',	'Molino dei Torti',	59861,	'832-138-9632',	'2018-12-18 21:22:40',	'2018-11-18 17:52:31',	3);			
INSERT INTO workers values ('03DD7FB6',	'Honorato',	'Keelie',	'Kennedy',	'Ap #169-3442 Tincidunt. Rd.',	'136-2910 Quis Street',	'Cairns',	59939,	'447-168-4834',	'2018-10-27 04:39:53',	'2018-12-10 13:14:25',	5);			
INSERT INTO workers values ('F3E19D5E',	'Clarke',	'Bryar',	'Beach',	'4163 Malesuada Av.',	'Ap #337-7361 Neque St.',	'Tournefeuille',	67266,	'220-273-1698',	'2018-11-15 00:10:58',	'2018-11-17 10:47:56',	2);			
INSERT INTO workers values ('F3D4D51E',	'Erich',	'Alec',	'Francis',	'9401 Fringilla, St.',	'P.O. Box 867, 7629 Et Ave',	'Canela',	70011,	'658-831-2656',	'2018-11-07 09:01:37',	'2018-11-24 12:36:45',	2);			
INSERT INTO workers values ('E4117DE9',	'Tucker',	'Colin',	'Gay',	'P.O. Box 530, 8821 Leo, Road',	'P.O. Box 326, 7312 Semper Road',	'Malbaie',	70116,	'606-295-4748',	'2018-11-01 12:49:32',	'2018-11-07 12:52:15',	9);			
INSERT INTO workers values ('A492113E',	'Leandra',	'Orli',	'Olsen',	'528-1019 Vitae St.',	'6044 Interdum Av.',	'Roux',	70408,	'654-903-2246',	'2018-12-29 23:05:41',	'2018-12-08 08:29:48',	6);			

