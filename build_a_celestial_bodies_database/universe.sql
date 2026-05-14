--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    observation_arc_in_years integer,
    avg_diameter_in_km numeric(10,4),
    description text,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
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
    galaxy_type character varying(50),
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    description text
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
    has_life boolean NOT NULL,
    avg_distance_planet_in_mi_km integer NOT NULL,
    size_in_earth_radius numeric(10,4),
    description text,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL
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
    planet_type character varying(50),
    has_life boolean NOT NULL,
    size_in_earth_radius numeric(10,4),
    distance_from_star_in_au numeric(6,2),
    description text,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
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
    star_type character varying(50),
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_ly numeric(10,2),
    description text,
    galaxy_id integer NOT NULL
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', false, 200, 939.4000, 'Largest object in the asteroid belt', 1, 2);
INSERT INTO public.asteroid VALUES (2, 'Vesta', false, 200, 525.4000, 'Second most massive asteroid with differentiated interior', 1, 2);
INSERT INTO public.asteroid VALUES (3, 'Eros', false, 125, 16.8400, 'Near Earth asteroid with elongated shape', 1, 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', true, 13600, 'Home galaxy of the Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', false, 10000, 'Nearest large spiral galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'spiral', false, 12000, 'Small spiral galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'irregular', false, 11000, 'Satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'irregular', false, 13000, 'Dwarf galaxy near the Milky Way');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'spiral', false, 400, 'Interacting spiral galaxy also known as Messier 51');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 384400, 0.2724, 'Earths only natural satellite', 1, 3, 2);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 6000, 0.0017, 'Small irregular moon orbiting close to Mars', 1, 4, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 23460, 0.0010, 'Smaller and more distant Martian moon', 1, 4, 2);
INSERT INTO public.moon VALUES (4, 'Io', false, 421700, 0.2860, 'Most volcanically active body in the Solar System', 1, 5, 2);
INSERT INTO public.moon VALUES (5, 'Europa', false, 671100, 0.2450, 'Icy moon with possible subsurface ocean', 1, 5, 2);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 1070400, 0.4135, 'Largest moon in the Solar System', 1, 5, 2);
INSERT INTO public.moon VALUES (7, 'Callisto', false, 1882700, 0.3780, 'Heavily cratered icy moon of Jupiter', 1, 5, 2);
INSERT INTO public.moon VALUES (8, 'Titan', false, 1221870, 0.4040, 'Moon with dense atmosphere and methane lakes', 1, 6, 2);
INSERT INTO public.moon VALUES (9, 'Enceladus', false, 238000, 0.0395, 'Icy moon with water plumes', 1, 6, 2);
INSERT INTO public.moon VALUES (10, 'Rhea', false, 527000, 0.1190, 'Second largest moon of Saturn', 1, 6, 2);
INSERT INTO public.moon VALUES (11, 'Iapetus', false, 3561300, 0.1150, 'Two toned moon with distant orbit', 1, 6, 2);
INSERT INTO public.moon VALUES (12, 'Titania', false, 436300, 0.1235, 'Largest moon of Uranus', 1, 7, 2);
INSERT INTO public.moon VALUES (13, 'Oberon', false, 583500, 0.1190, 'Outer large moon of Uranus', 1, 7, 2);
INSERT INTO public.moon VALUES (14, 'Miranda', false, 129900, 0.0360, 'Uranian moon with extreme geology', 1, 7, 2);
INSERT INTO public.moon VALUES (15, 'Triton', false, 354800, 0.2122, 'Large retrograde moon of Neptune', 1, 8, 2);
INSERT INTO public.moon VALUES (16, 'Nereid', false, 5513400, 0.0270, 'Neptunian moon with eccentric orbit', 1, 8, 2);
INSERT INTO public.moon VALUES (17, 'Charon', false, 19596, 0.1210, 'Large moon forming a binary system with Pluto', 1, 9, 2);
INSERT INTO public.moon VALUES (18, 'Nix', false, 48694, 0.0190, 'Small irregular moon of Pluto', 1, 9, 2);
INSERT INTO public.moon VALUES (19, 'Hydra', false, 64738, 0.0200, 'Outer small moon of Pluto', 1, 9, 2);
INSERT INTO public.moon VALUES (20, 'Dysnomia', false, 37350, 0.0270, 'Only known moon of Eris', 1, 10, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial', false, 0.3829, 0.39, 'Smallest and closest planet to the Sun', 1, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial', false, 0.9499, 0.72, 'Hot planet with a thick toxic atmosphere', 1, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial', true, 1.0000, 1.00, 'Only known planet with life', 1, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial', false, 0.5320, 1.52, 'Cold desert planet with iron oxide surface', 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas giant', false, 11.2090, 5.20, 'Largest planet with a strong magnetic field', 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gas giant', false, 9.4490, 9.58, 'Famous for its prominent ring system', 1, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'ice giant', false, 4.0070, 19.22, 'Ice giant that rotates on its side', 1, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 'ice giant', false, 3.8830, 30.11, 'Farthest major planet with strong winds', 1, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 'dwarf planet', false, 0.1860, 39.48, 'Icy dwarf planet in the Kuiper belt', 1, 2);
INSERT INTO public.planet VALUES (10, 'Eris', 'dwarf planet', false, 0.1820, 67.78, 'Massive dwarf planet beyond Pluto', 1, 2);
INSERT INTO public.planet VALUES (11, 'Haumea', 'dwarf planet', false, 0.1630, 43.34, 'Fast rotating elongated dwarf planet', 1, 2);
INSERT INTO public.planet VALUES (12, 'Makemake', 'dwarf planet', false, 0.1430, 45.79, 'Bright dwarf planet beyond Neptune', 1, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'main sequence', false, 242, 8.60, 'Brightest star in the night sky', 1);
INSERT INTO public.star VALUES (2, 'Sun', 'main sequence', false, 4600, 0.00, 'Star at the center of the Solar System', 1);
INSERT INTO public.star VALUES (3, 'Cygnus OB2#12', 'blue hypergiant', false, 3, 5000.00, 'Extremely luminous blue hypergiant star', 1);
INSERT INTO public.star VALUES (4, 'ρ Cassiopeiae', 'yellow hypergiant', false, 6, 3400.00, 'Rare yellow hypergiant in Cassiopeia', 1);
INSERT INTO public.star VALUES (5, 'AH Scorpii', 'red supergiant', false, 10, 7400.00, 'Large red supergiant in Scorpius', 1);
INSERT INTO public.star VALUES (6, 'VX Sagittarii', 'red supergiant', false, 10, 5100.00, 'Pulsating red supergiant star', 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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
-- Name: asteroid asteroid_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_description_key UNIQUE (description);


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
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


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
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


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
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


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
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

