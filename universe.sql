--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    constellation_name character varying,
    galaxy_id integer,
    is_visible_with_naked_eye boolean NOT NULL,
    notable_star_id integer,
    name character varying
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying,
    galaxy_type character varying,
    distance_in_ly_from_earth numeric,
    description text NOT NULL,
    age_in_millions_of_years integer,
    is_visible_with_naked_eye boolean,
    constellation text,
    name character varying
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon_name character varying NOT NULL,
    diameter_in_miles numeric,
    is_visible_with_naked_eye boolean,
    distance_from_planet_in_miles integer,
    planet_id integer,
    name character varying
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_name character varying,
    diameter_in_miles numeric,
    moons_in_orbit integer,
    is_visible_with_naked_eye boolean,
    planet_type text NOT NULL,
    star_id integer,
    name character varying
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name character varying,
    galaxy_id integer,
    color text NOT NULL,
    type text,
    age_in_millions_of_years integer,
    is_visible_with_naked_eye boolean,
    constellation text,
    diameter_in_miles integer,
    distance_in_miles integer,
    distance_in_ly_from_earth numeric,
    name character varying
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 1, true, 3, 'Betelgeuse');
INSERT INTO public.constellation VALUES (2, 'Big Dipper', 1, true, 2, 'Eta Ursae Majoris');
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 1, true, 11, 'Archird');
INSERT INTO public.constellation VALUES (4, 'Canis Major', 1, true, 1, 'Dog Star');
INSERT INTO public.constellation VALUES (5, 'Aries', 1, true, 12, 'Alpha Arietis');
INSERT INTO public.constellation VALUES (6, 'Triangulum', 6, true, 13, 'Mothallah');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 0, 'Milky Way is our home galaxy containing our solar system.', 13600, true, 'Sagittarius', 'Galactic Plane');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'spiral', 2.5, 'Gets its name from the area of the sky in which it appears, the constellation of Andromeda', 10000, true, 'Andromeda', 'Messier 31');
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'spiral', 111, 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation', 11000, false, 'Centaurus', 'Backward');
INSERT INTO public.galaxy VALUES (4, 'Bodes Galaxy', 'spiral', 12, 'Named for Johann Elert Bode who discovered this galaxy in 1774.', 12000, true, 'Ursa Major', 'Messier 81');
INSERT INTO public.galaxy VALUES (5, 'Cosmos Redshift 7', 'Lyman-alpha emitter', 12900, 'CR-7 is one of the oldest and brightest of the galaxies.', 13800, false, 'Sextans', 'CR7');
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'spiral', 2.73, 'Named after its location within the Triangulum constellation.', 2000, true, 'Triangulum', 'Messier 33');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 2159, true, 238900, 3, 'The Moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 13.8, false, 3700, 4, 'Origin:  Greek god of fear');
INSERT INTO public.moon VALUES (3, 'Deimos', 7.8, false, 14580, 4, 'Origin:  Greek god of terror');
INSERT INTO public.moon VALUES (4, 'Io', 2263, false, 261000, 5, 'Origin: Greek priestess of Hera');
INSERT INTO public.moon VALUES (5, 'Europa', 1940, false, 41700, 5, 'Origin: Greek Phoenician princess');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3273, false, 665000, 5, 'Origin: Trojan prince cup bearer');
INSERT INTO public.moon VALUES (7, 'Callisto', 2995, false, 1170000, 5, 'Origin: nymph companion of Artemis');
INSERT INTO public.moon VALUES (8, 'Titan', 3200, false, 759000, 6, 'Origin: Greek Titans');
INSERT INTO public.moon VALUES (9, 'Enceladus', 313, false, 148000, 6, 'Origin:  Greek Giant');
INSERT INTO public.moon VALUES (10, 'Mimas', 246, false, 115000, 6, 'Origin: Greek Giant slain by Hephaestus');
INSERT INTO public.moon VALUES (11, 'lapetus', 914, false, 2213000, 6, 'Origin: Greek Titan');
INSERT INTO public.moon VALUES (12, 'Rhea', 698, false, 23400, 6, 'Origin: Greek Titaness');
INSERT INTO public.moon VALUES (13, 'Tethys', 662, false, 183000, 6, 'Origin Greek Titaness associated with fresh water');
INSERT INTO public.moon VALUES (14, 'Miranda', 293, false, 80000, 7, 'Origin: Character 1 in Shakespear');
INSERT INTO public.moon VALUES (15, 'Ariel', 719, false, 118000, 7, 'Origin: Character 2 in Shakespear');
INSERT INTO public.moon VALUES (16, 'Umbriel', 727, false, 166000, 7, 'Origin:  Character from Alexander Pope');
INSERT INTO public.moon VALUES (17, 'Titania', 980, false, 271000, 7, 'Origin: Character 3 in Shakespear');
INSERT INTO public.moon VALUES (18, 'Oberon', 946, false, 363000, 7, 'Origin: Character 4 in Shakespear');
INSERT INTO public.moon VALUES (19, 'Triton', 1680, false, 220000, 8, 'Origin: Greek sea god');
INSERT INTO public.moon VALUES (20, 'Charon', 753, false, 12200, 9, 'Origin: Greek ferryman for the river styx.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3032, 0, true, 'Terrestrial', 14, 'Origin:  Roman god who was a messenger');
INSERT INTO public.planet VALUES (2, 'Venus', 7521, 0, true, 'Terrestrial', 14, 'Origin:  Roman goddess of love and beauty');
INSERT INTO public.planet VALUES (3, 'Earth', 7917, 1, true, 'Terrestrial', 14, 'Origin:  Only planet to support life');
INSERT INTO public.planet VALUES (4, 'Mars', 4212, 2, true, 'Terrestrial', 14, 'Origin: Roman god of war');
INSERT INTO public.planet VALUES (5, 'Jupiter', 86881, 79, true, 'Gas Giant', 14, 'Origin: king of the Roman gods');
INSERT INTO public.planet VALUES (6, 'Saturn', 72367, 83, true, 'Gas Giant', 14, 'Origin: Roman god of agriculture');
INSERT INTO public.planet VALUES (7, 'Uranus', 31518, 27, true, 'Ice Giant', 14, 'Origin:Greek god of the sky');
INSERT INTO public.planet VALUES (8, 'Neptune', 30599, 14, true, 'Ice Giant', 14, 'Origin: Roman god of the seas');
INSERT INTO public.planet VALUES (9, 'Pluto', 1473, 5, false, 'Dwarf', 14, 'Origin: Associated with abundance');
INSERT INTO public.planet VALUES (10, 'Eris', 1445, 1, false, 'Dwarf', 14, 'Origin: Inuit goddess of the sea');
INSERT INTO public.planet VALUES (11, 'Haumea', 1218, 2, false, 'Dwarf', 14, 'Origin:  Hawaiian goddess of fertility');
INSERT INTO public.planet VALUES (12, 'Makemake', 870, 0, false, 'Dwarf', 14, 'Origin Easter Island creation god of the egg');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius A', 1, 'Blue-White', 'Main-sequence', 300, true, 'Canis Major', 1500000, NULL, 8.6, 'Dog Star');
INSERT INTO public.star VALUES (2, 'Alkaid', 4, 'Blue-White', 'Main-Sequence', 10, true, 'Ursa Major', 36000000, NULL, 101, 'Eta Ursae Majoris');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red', 'Super Giant', 10, true, 'Orion', 850000000, NULL, 642.5, 'Betelgeuse');
INSERT INTO public.star VALUES (4, 'Polaris A', 1, 'Yellow', 'Super Giant', 67, true, 'Ursa Minor', 28000000, NULL, 433, 'North Star');
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 1, 'Yellow', 'Dwarf', 4850, true, 'Centaurs', 1200000, NULL, 4.37, 'Alpha Centauri A');
INSERT INTO public.star VALUES (6, 'HD 9446', 6, 'Yellow', 'Main-Sequence', 4600, false, 'Triangulum', 1400000, NULL, 172, 'HD9446');
INSERT INTO public.star VALUES (7, 'HD 13189', 6, 'Orange', 'Giant', 6000, false, 'Triangulum', 3500000, NULL, 602, 'HD13189');
INSERT INTO public.star VALUES (8, 'Antares', 1, 'Red', 'Super Giant', 15, true, 'Scorpius', 680000000, NULL, 550, 'Antares');
INSERT INTO public.star VALUES (9, 'Star A', 3, 'Blue', 'Main-Sequence', 50, false, 'Centaurs', 1200000, NULL, 111, 'Unamed');
INSERT INTO public.star VALUES (10, 'Alpheratz', 2, 'Blue-White', 'Sub Giant', 200, true, 'Andromedae', 4200000, NULL, 97, 'Alpha Andromedae');
INSERT INTO public.star VALUES (11, 'Achird', 1, 'Yellow-Orange', 'K-type Giant', 1500, true, 'Cassiopeia', 50000000, NULL, 19.4, 'Archird');
INSERT INTO public.star VALUES (12, 'Hamal', 1, 'Orange', 'Evovled Giant', 3400, true, 'Aries', 439000, NULL, 65.8, 'Alpha Arietis');
INSERT INTO public.star VALUES (13, 'Beta Trianguli', 6, 'White', 'Giant', 730, true, 'Triangulum', NULL, NULL, 127, 'Mothallah');
INSERT INTO public.star VALUES (14, 'Sun', 1, 'Yellow', 'dwarf', 4600, true, 'NULL', 864000, NULL, 0.000016, 'Sol');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

