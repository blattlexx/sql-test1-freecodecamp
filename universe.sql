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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    num_planets integer
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
    name character varying(30),
    age_in_millions_of_years double precision,
    distance_from_earth double precision,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(30),
    age_in_millions_of_years double precision,
    distance_from_earth double precision,
    star_id integer NOT NULL,
    has_water boolean,
    has_atmosphere boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    galaxy_id integer,
    type_star character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: supercluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supercluster (
    supercluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_galaxies numeric(4,1)
);


ALTER TABLE public.supercluster OWNER TO freecodecamp;

--
-- Name: supercluster_super_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.supercluster_super_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supercluster_super_id_seq OWNER TO freecodecamp;

--
-- Name: supercluster_super_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.supercluster_super_id_seq OWNED BY public.supercluster.supercluster_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: supercluster supercluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster ALTER COLUMN supercluster_id SET DEFAULT nextval('public.supercluster_super_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 13600, 'A barrel spiral galaxy', 1, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 10000, 'A spiral galaxy near the Milky Way galaxy', 2, NULL);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 10000, 'A spiral galaxy in the local group', 3, NULL);
INSERT INTO public.galaxy VALUES ('Messier 87', 13000, 'A giant elliptical galaxy', 4, NULL);
INSERT INTO public.galaxy VALUES ('LMC', 13000, 'A satellite galaxy of the Milkey Way', 5, NULL);
INSERT INTO public.galaxy VALUES ('SMC', 12000, 'A satellite galaxy of the Milkey Way', 6, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon C1-1', 5000, 7000000, 5, 4);
INSERT INTO public.moon VALUES ('Moon C1-2', 5500, 7000000, 6, 4);
INSERT INTO public.moon VALUES ('Moon C1-3', 6000, 7000000, 7, 4);
INSERT INTO public.moon VALUES ('Moon C2-1', 6500, 7000000, 8, 5);
INSERT INTO public.moon VALUES ('Moon C2_2', 7000, 7000000, 9, 5);
INSERT INTO public.moon VALUES ('Moon T1-1', 5500, 8000000, 10, 7);
INSERT INTO public.moon VALUES ('Moon T1-2', 6000, 8000000, 11, 7);
INSERT INTO public.moon VALUES ('Moon T2-1', 6500, 8000000, 12, 8);
INSERT INTO public.moon VALUES ('Moon T2-2', 7000, 8000000, 13, 8);
INSERT INTO public.moon VALUES ('Moon T3-1', 7500, 8000000, 14, 9);
INSERT INTO public.moon VALUES ('Luna', 4500, 0.0026, 1, 1);
INSERT INTO public.moon VALUES ('Fobos', 4400, 0.00011, 2, 2);
INSERT INTO public.moon VALUES ('Deimos', 4400, 0.00027, 3, 2);
INSERT INTO public.moon VALUES ('io', 4500, 0.0042, 4, 3);
INSERT INTO public.moon VALUES ('Europa', 4500, 0.0043, 15, 3);
INSERT INTO public.moon VALUES ('Ganimedes', 4500, 0.0069, 16, 3);
INSERT INTO public.moon VALUES ('Calisto', 4500, 0.0104, 17, 3);
INSERT INTO public.moon VALUES ('Titan', 4500, 0.0081, 18, 10);
INSERT INTO public.moon VALUES ('Rea', 4500, 0.0075, 19, 10);
INSERT INTO public.moon VALUES ('Dione', 4500, 0.0062, 20, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'C1', 5000, 14000000, 2, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'C2', 6000, 14000000, 3, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'C3', 4000, 14000000, 4, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'T1', 5000, 15000000, 5, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'T2', 4500, 15000000, 6, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'T3', 6500, 15000000, 7, NULL, NULL);
INSERT INTO public.planet VALUES (1, 'Tierra', 4540, 0, 1, true, true);
INSERT INTO public.planet VALUES (2, 'Marte', 4603, 2, 1, true, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4603, 5, 1, true, true);
INSERT INTO public.planet VALUES (10, 'Saturno', 4503, 9.5, 1, true, true);
INSERT INTO public.planet VALUES (11, 'Neptuno', 4503, 30.1, 1, true, true);
INSERT INTO public.planet VALUES (12, 'C4', 7000, 14000000, 8, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 6000, 1, NULL);
INSERT INTO public.star VALUES (2, 'Star 1', 7000, 2, NULL);
INSERT INTO public.star VALUES (3, 'Star 2', 6200, 2, NULL);
INSERT INTO public.star VALUES (4, 'Star 3', 5500, 2, NULL);
INSERT INTO public.star VALUES (5, 'Star A', 7000, 3, NULL);
INSERT INTO public.star VALUES (6, 'Star B', 6200, 3, NULL);
INSERT INTO public.star VALUES (7, 'Star C', 8000, 3, NULL);
INSERT INTO public.star VALUES (8, 'Star 4', 8500, 2, NULL);


--
-- Data for Name: supercluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supercluster VALUES (1, 'Virgo', NULL);
INSERT INTO public.supercluster VALUES (2, 'Coma', NULL);
INSERT INTO public.supercluster VALUES (3, 'Laniakea', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: supercluster_super_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supercluster_super_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_pkey1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey1 PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: supercluster supercluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster
    ADD CONSTRAINT supercluster_pkey PRIMARY KEY (supercluster_id);


--
-- Name: supercluster supercluster_supercluster_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster
    ADD CONSTRAINT supercluster_supercluster_id_key UNIQUE (supercluster_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

