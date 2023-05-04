--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    last_seen integer,
    average_orbit_in_yr numeric
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_coment_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_coment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_coment_id_seq OWNER TO freecodecamp;

--
-- Name: comet_coment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_coment_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth_in_million_light_yrs numeric(10,4),
    galaxy_type text
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
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    known_to_host_life boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    description text,
    known_to_host_life boolean,
    distance_to_its_star_in_au numeric(10,2),
    star_id integer
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
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    solar_luminosity numeric(10,4),
    galaxy_id integer,
    planets_orbiting integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_coment_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Short-period comet. Dimensions: 15km x 8km. Probably the most famous comet.', 1986, 76);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Long-period comet. It is a large comet with a nucleus measuring approximately 60km in diameter.', 1997, 2534);
INSERT INTO public.comet VALUES (3, 'Borrelly', 'Short-period comet. Its nucleus is approximately 8km long.', 2022, 6.9);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'It is the galaxy that contains our Solar System.', NULL, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way.', 0.1970, 'irregular');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'A dwarf galaxy near the Milky Way.', 0.2100, 'irregular');
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'It is the nearest major galaxy to the Milky Way.', 2.5000, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 'It is a starburst galaxy.', 12.0000, 'irregular');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'An interacting spiral galaxy with a Seyfert.', 31.0000, 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon makes Earth a more livable planet by moderating the wobble on its axis.', false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'It is the larger of the two moons of Mars and orbits it three times a day.', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'It is the smaller ot the two moons of Mars. It orbits Mars every 30 hours.', false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'It is the most volcanically active world in the solar system, with hundreds of volcanoes.', false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'It is thought to have an iron core, a rocky mantle and an ocean of salty water.', false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'It is the largest moon in our solar system and the only moon with its own magnetic field.', false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'It is the most heavily cratered object in our solar system.', false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'It is the largest moon of Saturn. It has an earthlike cycle of liquids.', false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'It is an icy ocean moon.', false, 6);
INSERT INTO public.moon VALUES (10, 'Atlas', 'It is an inner moon of Saturn.', false, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'It is a small moon of Saturn.', false, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'It has been suggested that Iapetus is three quarters ice and one quarter rock.', false, 6);
INSERT INTO public.moon VALUES (13, 'Ariel', 'It is thought to consist of water ice and silicate rock.', false, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 'It is composed of roughly half ice and half rock.', false, 7);
INSERT INTO public.moon VALUES (15, 'Titania', 'It is the largest moon of Uranus.', false, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'It is the darkest of the larger moons of Uranus.', false, 7);
INSERT INTO public.moon VALUES (17, 'Miranda', 'The orbit of Miranda is slighly inclined.', false, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'It is the largest of the 13 moons of Neptune.', false, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 'It is so far from Neptune that it requires 360 Earth days to make one orbit.', false, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 'It has an odd boxlike shape.', false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'It is the closest planet to the Sun and the smallest.', false, 0.39, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'It is the hottest planet in the solar system.', false, 0.72, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet.', true, 1.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'It is a cold, desert like planet.', false, 1.52, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'A giant gas and the largest planet in the solar system.', false, 5.20, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the Sun, famous for its large and distinct ring system.', false, 9.54, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'It is a bit an oddball, its equador is nearly at right angle to its orbit.', false, 19.22, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'It is the eighth planet from the Sun and the coldest.', false, 30.06, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'It is a super Earth exoplanets.', false, 0.05, 2);
INSERT INTO public.planet VALUES (10, 'Proxima d', 'It is one of the lightest exoplanets ever found.', false, 0.03, 2);
INSERT INTO public.planet VALUES (11, 'Gliese 15 Ab', 'An exoplanet orbiting the red dwarf Groombridge 34 star.', false, 0.07, 7);
INSERT INTO public.planet VALUES (12, 'Gliese 15 Ac', 'An exoplanet orbiting the red dwarf Groombridge 34 star.', false, 5.40, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Sirius', 'A binary blue white star. The brightest in the night sky.', 25.4000, 1, NULL);
INSERT INTO public.star VALUES (5, 'Apheratz', 'A binary hot blue star. It is the brightest star in Andromeda.', 240.0000, 4, NULL);
INSERT INTO public.star VALUES (6, 'Mirach', 'It is a cold, bright red giant star.', 1995.0000, 4, NULL);
INSERT INTO public.star VALUES (4, 'Canopus', 'It is a bright white giant star.', 10700.0000, 1, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 'A yellow dwarf star.', 1.0000, 1, 8);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'It is a low mass red dwarf. The Sun nearest star.', 0.0017, 1, 2);
INSERT INTO public.star VALUES (7, 'Groombridge 34', 'A binary dim, red dwarf star system.', 0.0225, 4, 2);


--
-- Name: comet_coment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_coment_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

