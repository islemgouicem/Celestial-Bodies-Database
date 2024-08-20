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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter numeric,
    distance_from_star numeric,
    has_ring boolean,
    galaxy_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    has_life boolean DEFAULT true
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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    planet_id integer,
    is_spherical boolean DEFAULT true
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
    name character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    star_id integer,
    is_spherical boolean DEFAULT true,
    planet_types character varying(50)
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
    name character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    galaxy_id integer,
    has_life boolean DEFAULT true
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 2.77, false, 1);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 512, 2.77, false, 1);
INSERT INTO public.asteroid VALUES (3, 'Juno', 233, 2.66, false, 1);
INSERT INTO public.asteroid VALUES (4, 'Vesta', 525, 2.36, true, 1);
INSERT INTO public.asteroid VALUES (5, 'Hygiea', 430, 3.14, false, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, containing the Solar System.', 0, 13000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way.', 2537000, 10000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Smallest member of the Local Group of galaxies.', 3000000, 9000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A well-known spiral galaxy located in the constellation Canes Venatici.', 23000000, 7000, false);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'A giant elliptical galaxy in the Virgo constellation.', 53000000, 12000, false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way, irregular in shape.', 163000, 10000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths only natural satellite.', 4500, 1, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger of Mars two moons.', 200, 2, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outermost moon of Mars.', 200, 2, true);
INSERT INTO public.moon VALUES (4, 'Europa', 'An icy moon of Jupiter with a potential subsurface ocean.', 4600, 4, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'The largest moon in the Solar System, orbiting Jupiter.', 4600, 4, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 'A large moon of Jupiter with a heavily cratered surface.', 4600, 4, true);
INSERT INTO public.moon VALUES (7, 'Titan', 'The largest moon of Saturn, with a thick atmosphere.', 4600, 5, true);
INSERT INTO public.moon VALUES (8, 'Rhea', 'A moon of Saturn with a thin atmosphere.', 4600, 5, true);
INSERT INTO public.moon VALUES (9, 'Iapetus', 'A moon of Saturn known for its two-tone coloration.', 4600, 5, true);
INSERT INTO public.moon VALUES (10, 'Triton', 'The largest moon of Neptune, with geysers.', 4600, 6, true);
INSERT INTO public.moon VALUES (11, 'Charon', 'The largest moon of Pluto, almost half its size.', 4600, 9, true);
INSERT INTO public.moon VALUES (12, 'Nix', 'A small moon of Pluto discovered in 2005.', 4600, 9, true);
INSERT INTO public.moon VALUES (13, 'Hydra', 'Another small moon of Pluto, discovered in 2005.', 4600, 9, true);
INSERT INTO public.moon VALUES (14, 'Enceladus', 'A moon of Saturn known for its icy plumes.', 4600, 5, true);
INSERT INTO public.moon VALUES (15, 'Mimas', 'A moon of Saturn known for its large impact crater.', 4600, 5, true);
INSERT INTO public.moon VALUES (16, 'Dione', 'A moon of Saturn with a mix of ice and rock.', 4600, 5, true);
INSERT INTO public.moon VALUES (17, 'Io', 'A volcanic moon of Jupiter, known for its active volcanism.', 4600, 4, true);
INSERT INTO public.moon VALUES (18, 'Thebe', 'A small, irregular moon of Jupiter.', 4600, 4, true);
INSERT INTO public.moon VALUES (19, 'Metis', 'The innermost moon of Jupiter, discovered in 1979.', 4600, 4, true);
INSERT INTO public.moon VALUES (20, 'Hyperion', 'A moon of Saturn known for its irregular shape and low density.', 4600, 5, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun.', 0, 4600, 1, true, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 'The red planet, fourth from the Sun.', 78000000, 4500, 1, true, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Venus', 'The second planet from the Sun.', 41400000, 4600, 1, true, 'Terrestrial');
INSERT INTO public.planet VALUES (4, 'Jupiter', 'The largest planet in our Solar System.', 778500000, 4600, 1, true, 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Saturn', 'Known for its prominent ring system.', 1433000000, 4600, 1, true, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Uranus', 'An ice giant with a unique tilt.', 2877000000, 4600, 1, true, 'Ice Giant');
INSERT INTO public.planet VALUES (7, 'Neptune', 'The furthest planet from the Sun.', 4495000000, 4600, 1, true, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Mercury', 'The closest planet to the Sun.', 91600000, 4600, 1, true, 'Terrestrial');
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet in the Kuiper Belt.', 5913000000, 4600, 1, true, 'Dwarf');
INSERT INTO public.planet VALUES (10, 'Eris', 'A large dwarf planet in the scattered disc.', 9600000000, 4600, 1, true, 'Dwarf');
INSERT INTO public.planet VALUES (11, 'Haumea', 'An elongated dwarf planet in the Kuiper Belt.', 6250000000, 4600, 1, true, 'Dwarf');
INSERT INTO public.planet VALUES (12, 'Ceres', 'The largest object in the asteroid belt.', 258000000, 4600, 1, true, 'Dwarf');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System.', 0, 4600, 1, true);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky.', 83000, 230, 1, false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'The closest star system to the Solar System.', 42000, 500, 1, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant star.', 64000, 100, 1, false);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'The closest known star to the Sun.', 42000, 4, 1, true);
INSERT INTO public.star VALUES (6, 'Rigel', 'A blue supergiant star.', 86000, 8, 1, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

