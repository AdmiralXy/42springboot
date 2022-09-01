INSERT INTO images (data)
VALUES (FILE_READ('./src/main/resources/sql/data/DATA_1')),
       (FILE_READ('./src/main/resources/sql/data/DATA_2')),
       (FILE_READ('./src/main/resources/sql/data/DATA_3')),
       (FILE_READ('./src/main/resources/sql/data/DATA_4')),
       (FILE_READ('./src/main/resources/sql/data/DATA_5')),
       (FILE_READ('./src/main/resources/sql/data/DATA_6')),
       (FILE_READ('./src/main/resources/sql/data/DATA_7')),
       (FILE_READ('./src/main/resources/sql/data/DATA_8')),
       (FILE_READ('./src/main/resources/sql/data/DATA_9')),
       (FILE_READ('./src/main/resources/sql/data/DATA_10')),
       (FILE_READ('./src/main/resources/sql/data/DATA_11')),
       (FILE_READ('./src/main/resources/sql/data/DATA_12'));

INSERT INTO films (title, release_year, age_restrictions, image_id, description)
VALUES ('Inception', 2010, '12+', 1, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.'),
       ('Interstellar', 2014, '16+', 2, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity`s survival.'),
       ('The Matrix', 1999, '16+', 3, 'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.'),
       ('Schindler`s List', 1993, '16+', 4, 'The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as slaves in his factory during World War II.'),
       ('Catch Me If You Can', 2002, '12+', 5, 'A true story about Frank Abagnale Jr. who, before his 19th birthday, successfully conned millions of dollars worth of checks as a Pan Am pilot, doctor, and legal prosecutor. An FBI agent makes it his mission to put him behind bars. But Frank not only eludes capture, he revels in the pursuit.'),
       ('Shutter Island', 2009, '18+', 6, 'World War II soldier-turned-U.S. Marshal Teddy Daniels investigates the disappearance of a patient from a hospital for the criminally insane, but his efforts are compromised by troubling visions and a mysterious doctor.'),
       ('Django Unchained', 2012, '18+', 7, 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.'),
       ('Dallas Buyers Club', 2013, '18+', 8, 'Loosely based on the true-life tale of Ron Woodroof, a drug-taking, women-loving, homophobic man who in 1986 was diagnosed with HIV/AIDS and given thirty days to live.'),
       ('The Man from Earth', 2007, '18+', 9, 'An impromptu goodbye party for Professor John Oldman becomes a mysterious interrogation after the retiring scholar reveals to his colleagues he never ages and has walked the earth for 14,000 years.'),
       ('Blade Runner 2049', 2017, '18+', 10, 'Thirty years after the events of the first film, a new blade runner, LAPD Officer K, unearths a long-buried secret that has the potential to plunge what`s left of society into chaos. K`s discovery leads him on a quest to find Rick Deckard, a former LAPD blade runner who has been missing for 30 years.'),
       ('Inglourious Basterds', 2009, '16+', 11, 'In Nazi-occupied France during World War II, a group of Jewish-American soldiers known as The Basterds are chosen specifically to spread fear throughout the Third Reich by scalping and brutally killing Nazis. The Basterds, lead by Lt. Aldo Raine soon cross paths with a French-Jewish teenage girl who runs a movie theater in Paris which is targeted by the soldiers.'),
       ('The Big Short', 2015, '18+', 12, 'In 2006-2007 a group of investors bet against the US mortgage market. In their research, they discover how flawed and corrupt the market is.');

INSERT INTO halls (serial, seats)
VALUES (1, 50),
       (2, 10),
       (3, 25),
       (4, 65),
       (5, 70);

INSERT INTO sessions (hall_id, film_id, start_at, cost)
VALUES (2, 5, '2022-10-01 10:25:00', 3.5),
       (1, 4, '2022-10-02 16:10:00', 4),
       (4, 7, '2022-10-03 22:00:00', 5),
       (2, 8, '2022-10-06 00:25:00', 8),
       (2, 1, '2022-10-07 11:40:00', 2.5),
       (1, 10, '2022-10-13 13:15:00', 12.25),
       (1, 4, '2022-10-14 18:50:00', 4),
       (3, 12, '2022-10-23 22:30:00', 10),
       (4, 2, '2022-10-25 09:30:00', 7);