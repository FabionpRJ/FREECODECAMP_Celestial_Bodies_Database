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
-- Name: civilization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilization (
    name character varying(30) NOT NULL,
    civilization_id integer NOT NULL,
    tech_level integer NOT NULL
);


ALTER TABLE public.civilization OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.civilization_civilization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civilization_civilization_id_seq OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.civilization_civilization_id_seq OWNED BY public.civilization.civilization_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    radius_of_galaxy_in_ua integer,
    distance_mua integer
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
    moon_size_in_ua numeric(4,2),
    planet_id integer,
    name character varying(30) NOT NULL,
    has_life boolean,
    moon_id integer NOT NULL
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
    star_id integer,
    name character varying(30) NOT NULL,
    planet_size_ua numeric(5,2),
    planet_description text,
    civilization character varying(30),
    has_life boolean,
    planet_id integer NOT NULL
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
    galaxy_id integer,
    star_size_in_ua numeric(10,3),
    has_planets boolean,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL
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
-- Name: civilization civilization_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization ALTER COLUMN civilization_id SET DEFAULT nextval('public.civilization_civilization_id_seq'::regclass);


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
-- Data for Name: civilization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilization VALUES ('Alpha Centaurians', 1, 3);
INSERT INTO public.civilization VALUES ('Zeta Reticulans', 2, 5);
INSERT INTO public.civilization VALUES ('Beta Draconians', 3, 7);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Whispering Nebula', 300, 250, 500);
INSERT INTO public.galaxy VALUES (2, 'Ethereal Cluster', 500, 180, 700);
INSERT INTO public.galaxy VALUES (3, 'Stellar Serenity', 700, 300, 400);
INSERT INTO public.galaxy VALUES (4, 'Celestial Symphony', 600, 270, 450);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 850, 3000, 1200);
INSERT INTO public.galaxy VALUES (6, 'Via Lactea', 1000, 1000, 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (30.00, 1, 'Whispering Moon 1', false, 1);
INSERT INTO public.moon VALUES (25.00, 1, 'Whispering Moon 2', false, 2);
INSERT INTO public.moon VALUES (20.00, 3, 'Ethereal Moon 1', false, 3);
INSERT INTO public.moon VALUES (18.00, 4, 'Ethereal Moon 2', false, 4);
INSERT INTO public.moon VALUES (35.00, 5, 'Ethereal Moon 3', true, 5);
INSERT INTO public.moon VALUES (15.00, 6, 'Serenity Moon 1', false, 6);
INSERT INTO public.moon VALUES (22.00, 8, 'Symphony Moon 1', false, 7);
INSERT INTO public.moon VALUES (28.00, 9, 'Symphony Moon 2', true, 8);
INSERT INTO public.moon VALUES (40.00, 10, 'Andromeda Moon 1', false, 9);
INSERT INTO public.moon VALUES (45.00, 11, 'Andromeda Moon 2', true, 10);
INSERT INTO public.moon VALUES (28.00, 1, 'Whispering Moon 3', false, 13);
INSERT INTO public.moon VALUES (22.00, 2, 'Whispering Moon 4', true, 14);
INSERT INTO public.moon VALUES (18.00, 3, 'Ethereal Moon 4', false, 15);
INSERT INTO public.moon VALUES (30.00, 5, 'Ethereal Moon 5', true, 16);
INSERT INTO public.moon VALUES (12.00, 6, 'Serenity Moon 2', false, 17);
INSERT INTO public.moon VALUES (25.00, 8, 'Symphony Moon 3', false, 18);
INSERT INTO public.moon VALUES (30.00, 9, 'Symphony Moon 4', true, 19);
INSERT INTO public.moon VALUES (35.00, 10, 'Andromeda Moon 3', false, 20);
INSERT INTO public.moon VALUES (40.00, 11, 'Andromeda Moon 4', true, 21);
INSERT INTO public.moon VALUES (50.00, 12, 'Via Lactea Moon 4', false, 24);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Whispering Planet 1', 100.00, 'A rocky planet with a thin atmosphere.', NULL, false, 1);
INSERT INTO public.planet VALUES (1, 'Whispering Planet 2', 150.00, 'A gas giant with multiple colorful rings.', NULL, false, 2);
INSERT INTO public.planet VALUES (3, 'Ethereal Planet 1', 80.00, 'A frozen world covered in ice and snow.', NULL, false, 3);
INSERT INTO public.planet VALUES (4, 'Ethereal Planet 2', 120.00, 'A desert planet with vast sand dunes and a scorching sun.', NULL, false, 4);
INSERT INTO public.planet VALUES (5, 'Ethereal Planet 3', 200.00, 'A lush green world with dense forests and abundant wildlife.', NULL, true, 5);
INSERT INTO public.planet VALUES (6, 'Serenity Planet 1', 70.00, 'A small rocky planet with a toxic atmosphere.', NULL, false, 6);
INSERT INTO public.planet VALUES (8, 'Symphony Planet 1', 90.00, 'A volcanic world with active lava flows and constant seismic activity.', NULL, false, 7);
INSERT INTO public.planet VALUES (9, 'Symphony Planet 2', 130.00, 'A water world with vast oceans and scattered islands.', NULL, true, 8);
INSERT INTO public.planet VALUES (10, 'Andromeda Planet 1', 180.00, 'A rocky planet with a dense atmosphere and towering mountains.', NULL, false, 9);
INSERT INTO public.planet VALUES (11, 'Andromeda Planet 2', 220.00, 'A jungle planet teeming with exotic flora and fauna.', NULL, true, 10);
INSERT INTO public.planet VALUES (12, 'Via Lactea Planet 1', 250.00, 'A planet covered in vast oceans with scattered archipelagos.', NULL, true, 11);
INSERT INTO public.planet VALUES (13, 'Via Lactea Planet 2', 300.00, 'A barren world with a thin atmosphere and extreme temperatures.', NULL, false, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 150.232, true, 'Luminous Whisperer', 1);
INSERT INTO public.star VALUES (1, 180.789, true, 'Nebulas Heart', 2);
INSERT INTO public.star VALUES (1, 200.000, true, 'Whispering Star 1', 3);
INSERT INTO public.star VALUES (1, 180.000, false, 'Whispering Star 2', 4);
INSERT INTO public.star VALUES (2, 300.000, false, 'Ethereal Star 1', 5);
INSERT INTO public.star VALUES (2, 250.000, true, 'Ethereal Star 2', 6);
INSERT INTO public.star VALUES (2, 220.000, false, 'Ethereal Star 3', 7);
INSERT INTO public.star VALUES (3, 400.000, true, 'Serenity Star 1', 8);
INSERT INTO public.star VALUES (3, 350.000, false, 'Serenity Star 2', 9);
INSERT INTO public.star VALUES (4, 350.000, false, 'Symphony Star 1', 10);
INSERT INTO public.star VALUES (4, 320.000, true, 'Symphony Star 2', 11);
INSERT INTO public.star VALUES (5, 500.000, true, 'Andromeda Star 1', 12);
INSERT INTO public.star VALUES (5, 450.000, false, 'Andromeda Star 2', 13);
INSERT INTO public.star VALUES (6, 700.000, false, 'Via Lactea Star 1', 14);
INSERT INTO public.star VALUES (6, 650.000, true, 'Via Lactea Star 2', 15);


--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.civilization_civilization_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: civilization civilization_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_name_key UNIQUE (name);


--
-- Name: civilization civilization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_pkey PRIMARY KEY (civilization_id);


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
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


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

