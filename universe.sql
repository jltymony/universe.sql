/*Create the database*/

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

\connect universe

/*Create the tables galaxy, star, planet, moon, constellation */

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name VARCHAR NOT NULL,
    galaxy_type VARCHAR,
    distance_in_ly_from_earth numeric,
    description text,
    age_in_millions_of_years integer,
    is_visible_with_naked_eye boolean,
    constellation text,
	name VARCHAR
);


CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name VARCHAR,
    diameter_in_miles numeric,
    is_visible_with_naked_eye boolean,
    distance_from_planet_in_miles integer,
	planet_id INT,
	name VARCHAR
);


CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_name VARCHAR,
    diameter_in_miles numeric,
    moons_in_orbit integer,
    is_visible_with_naked_eye boolean,
    planet_type text,
	star_id INT,
	name VARCHAR
);

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name VARCHAR,
    galaxy_id integer,
    color text,
    type text,
    age_in_millions_of_years integer,
    is_visible_with_naked_eye boolean,
    constellation text,
    diameter_in_miles integer,
    distance_in_ly_from_earth numeric,
	name VARCHAR
);

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.constellation (
	constellation_id SERIAL,	
	constellation_name VARCHAR,	
	galaxy_id INT,	
	is_visible_with_naked_eye BOOLEAN, 
	notable_star_id INT,	
	name VARCHAR
);





ALTER TABLE galaxy ALTER COLUMN galaxy_name VARCHAR NOT NULL;


ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);



SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);

/*Adding Primary Keys*/
ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);
	
ALTER TABLE ONLY public.constellation
	ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);
	


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);

ALTER TABLE ONLY public.star
	ADD CONSTRAINT star_name_key UNIQUE (name);
	
ALTER TABLE ONLY public.galaxy
	ADD CONSTRAINT galaxy_name_key UNIQUE (name);
	
ALTER TABLE ONLY public.constellation
	ADD CONSTRAINT constellation_name_key UNIQUE (name);
	

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
	
ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_is_visible_with_naked_eye_fkey FOREIGN KEY (is_visible_with_naked_eye) REFERENCES public.star(is_visible_with_naked_eye);

/* Add Data to the database */


/*Adding constellation data */
INSERT INTO constellation(
	constellation_id, 
	constellation_name, 
	galaxy_id, 
	is_visible_with_naked_eye, 
	notable_star_id,
	name) 
VALUES(1, 'Orion', 1, TRUE, 3, 'Betelgeuse'),(2, 'Big Dipper', 1, TRUE, 2, 'Eta Ursae Majoris'),(3, 'Cassiopeia', 1, TRUE, 11, 'Archird'),(4, 'Canis Major', 1, TRUE, 1, 'Dog Star'),(5, 'Aries', 1, TRUE, 12, 'Alpha Arietis'),(6, 'Triangulum', 6, TRUE, 13, 'Mothallah');



/*Adding STAR data */

INSERT INTO star (
	star_id,
	star_name,
	galaxy_id,
	color,
	type,
	age_in_millions_of_years,
	is_visible_with_naked_eye,
	constellation,
	diameter_in_miles, 
	distance_in_ly_from_earth,
	name)
VALUES
	(1, 'Sirius A', 1, 'Blue-White', 'Main-sequence', 300, TRUE, 'Canis Major', 1500000, 8.6, 'Dog Star'),
	(2,	'Alkaid', 4, 'Blue-White', 'Main-Sequence',	10,	TRUE,	'Ursa Major',	36000000,	101, 'Eta Ursae Majoris'),
	(3,	'Betelgeuse', 1, 'Red',	'Super Giant', 10, TRUE, 'Orion', 850000000, 642.5, 'Betelgeuse'),
	(4,	'Polaris A', 1,	'Yellow', 'Super Giant', 67, TRUE, 'Ursa Minor', 28000000, 433, 'North Star'),
	(5, 'Alpha Centauri', 1, 'Yellow', 'Dwarf', 4850, TRUE, 'Centaurs', 1200000, 4.37, 'Alpha Centauri A'),
	(6, 'HD 9446', 6, 'Yellow', 'Main-Sequence', 4600, FALSE, 'Triangulum', 1400000, 172, 'HD9446'),
	(7, 'HD 13189', 6, 'Orange', 'Giant', 6000, FALSE, 'Triangulum', 3500000, 602, 'HD13189'),
	(8, 'Antares', 1, 'Red', 'Super Giant', 15, TRUE, 'Scorpius', 680000000, 550, 'Antares'),
	(9, 'Star A', 3, 'Blue', 'Main-Sequence', 50, FALSE, 'Centaurs', 1200000, 111, 'Unamed'),
	(10, 'Alpheratz', 2, 'Blue-White', 'Sub Giant', 200, TRUE, 'Andromedae', 4200000, 97, 'Alpha Andromedae'),
	(11, 'Achird', 1, 'Yellow-Orange', 'K-type Giant', 1500, TRUE, 'Cassiopeia', 50000000, 19.4, 'Archird'),
	(12, 'Hamal', 1, 'Orange', 'Evovled Giant', 3400, TRUE, 'Aries', 439000, 65.8, 'Alpha Arietis'),
	(13, 'Beta Trianguli', 6, 'White', 'Giant', 730, TRUE, 'Triangulum', NULL, 127, 'Mothallah'),
	(14, 'Sun', 1, 'Yellow', 'dwarf', 4600, TRUE, 'NULL', 864000, 0.000016, 'Sol')
RETURNING *;
	

/*Adding Galaxy data */

INSERT INTO galaxy (
	galaxy_id,
	galaxy_name,
	galaxy_type,
	distance_in_ly_from_earth,
	description,
	age_in_millions_of_years,
	is_visible_with_naked_eye,
	constellation,
	name)
VALUES	
	(1, 'Milky Way', 'spiral', 0, 'Milky Way is our home galaxy containing our solar system.', 13600, TRUE, 'Sagittarius', 'Galactic Plane'),
	(2, 'Andromeda Galaxy', 'spiral', 2.5, 'Gets its name from the area of the sky in which it appears, the constellation of Andromeda', 10000, TRUE, 'Andromeda', 'Messier 31'),
	(3, 'Backward Galaxy', 'spiral', 111, 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation', 11000, FALSE, 'Centaurus', 'Backward'),
	(4, 'Bodes Galaxy', 'spiral', 12, 'Named for Johann Elert Bode who discovered this galaxy in 1774.', 12000, TRUE, 'Ursa Major', 'Messier 81'),
	(5, 'Cosmos Redshift 7', 'Lyman-alpha emitter', 12900, 'CR-7 is one of the oldest and brightest of the galaxies.', 13800, FALSE, 'Sextans', 'CR7'),
	(6, 'Triangulum Galaxy', 'spiral', 2.73, 'Named after its location within the Triangulum constellation.', 2000, TRUE, 'Triangulum', 'Messier 33')
RETURNING *;

/*Adding Planet data */

INSERT INTO planet (
	planet_id, 	
	planet_name, 	
	diameter_in_miles, 	
	moons_in_orbit, 	
	is_visible_with_naked_eye, 	
	planet_type,
	star_id,
	name)
VALUES
	(1, 'Mercury', 3032, 0, TRUE, 'Terrestrial', 14, 'Origin:  Roman god who was a messenger'),
	(2, 'Venus', 7521, 0, TRUE, 'Terrestrial', 14, 'Origin:  Roman goddess of love and beauty'),
	(3, 'Earth', 7917, 1, TRUE, 'Terrestrial', 14, 'Origin:  Only planet to support life'),
	(4, 'Mars', 4212, 2, TRUE, 'Terrestrial', 14, 'Origin: Roman god of war'),
	(5, 'Jupiter', 86881, 79, TRUE, 'Gas Giant', 14, 'Origin: king of the Roman gods'),
	(6, 'Saturn', 72367, 83, TRUE, 'Gas Giant', 14, 'Origin: Roman god of agriculture'),
	(7, 'Uranus', 31518, 27, TRUE, 'Ice Giant', 14, 'Origin:Greek god of the sky'),
	(8, 'Neptune', 30599, 14, TRUE, 'Ice Giant', 14, 'Origin: Roman god of the seas'),
	(9, 'Pluto', 1473, 5, FALSE, 'Dwarf', 14, 'Origin: Associated with abundance'),
	(10, 'Eris', 1445, 1, FALSE, 'Dwarf', 14, 'Origin: Inuit goddess of the sea'),
	(11, 'Haumea', 1218, 2, FALSE, 'Dwarf', 14, 'Origin:  Hawaiian goddess of fertility'),
	(12, 'Makemake', 870, 0, FALSE, 'Dwarf', 14, 'Origin Easter Island creation god of the egg')
RETURNING *;

/*Adding Moon data */
INSERT INTO moon (
	moon_id,
    moon_name,
    diameter_in_miles,
    is_visible_with_naked_eye,
    distance_from_planet_in_miles,
	planet_id,
	name)
VALUES	
	(1, 'Moon', 2159, TRUE, 238900, 3, 'The Moon'),
	(2,	'Phobos', 13.8, FALSE, 3700, 4, 'Origin:  Greek god of fear'),
	(3,	'Deimos', 7.8, FALSE, 14580, 4, 'Origin:  Greek god of terror'),
	(4,	'Io', 2263, FALSE, 261000, 5, 'Origin: Greek priestess of Hera'),
	(5,	'Europa', 1940, FALSE, 41700, 5, 'Origin: Greek Phoenician princess'),
	(6,	'Ganymede', 3273, FALSE, 665000, 5, 'Origin: Trojan prince cup bearer'),
	(7,	'Callisto', 2995,	FALSE,	1170000,	5, 'Origin: nymph companion of Artemis'),
	(8,	'Titan', 3200, FALSE, 759000, 6, 'Origin: Greek Titans'),
	(9,	'Enceladus', 313, FALSE, 148000, 6, 'Origin:  Greek Giant'),
	(10, 'Mimas', 246, FALSE, 115000, 6, 'Origin: Greek Giant slain by Hephaestus'),
	(11, 'lapetus', 914, FALSE, 2213000, 6, 'Origin: Greek Titan'),
	(12, 'Rhea', 698, FALSE, 23400, 6, 'Origin: Greek Titaness'),
	(13, 'Tethys', 662, FALSE, 183000, 6, 'Origin Greek Titaness associated with fresh water'),
	(14, 'Miranda', 293, FALSE, 80000, 7, 'Origin: Character 1 in Shakespear'),
	(15, 'Ariel', 719, FALSE, 118000, 7, 'Origin: Character 2 in Shakespear'),
	(16, 'Umbriel', 727, FALSE, 166000, 7, 'Origin:  Character from Alexander Pope'),
	(17, 'Titania', 980, FALSE, 271000, 7, 'Origin: Character 3 in Shakespear'),
	(18, 'Oberon', 946, FALSE, 363000, 7, 'Origin: Character 4 in Shakespear'),
	(19, 'Triton', 1680, FALSE, 220000, 8, 'Origin: Greek sea god'),
	(20, 'Charon', 753, FALSE, 12200, 9, 'Origin: Greek ferryman for the river styx.')
RETURNING *;

	
	
	