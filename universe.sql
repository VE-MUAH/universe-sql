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

ALTER TABLE IF EXISTS ONLY public.star DROP CONSTRAINT IF EXISTS star_galaxy_id_fkey;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS planet_star_id_fkey;
ALTER TABLE IF EXISTS ONLY public.moon DROP CONSTRAINT IF EXISTS moon_planet_id_fkey;
ALTER TABLE IF EXISTS ONLY public.star DROP CONSTRAINT IF EXISTS star_pkey;
ALTER TABLE IF EXISTS ONLY public.star DROP CONSTRAINT IF EXISTS star_name_unique;
ALTER TABLE IF EXISTS ONLY public.star DROP CONSTRAINT IF EXISTS star_name_key;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS planet_pkey;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS planet_name_unique;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS planet_name_key;
ALTER TABLE IF EXISTS ONLY public.moon DROP CONSTRAINT IF EXISTS moon_pkey;
ALTER TABLE IF EXISTS ONLY public.moon DROP CONSTRAINT IF EXISTS moon_name_unique;
ALTER TABLE IF EXISTS ONLY public.moon DROP CONSTRAINT IF EXISTS moon_name_key;
ALTER TABLE IF EXISTS ONLY public.galaxy DROP CONSTRAINT IF EXISTS galaxy_pkey;
ALTER TABLE IF EXISTS ONLY public.galaxy DROP CONSTRAINT IF EXISTS galaxy_name_unique;
ALTER TABLE IF EXISTS ONLY public.galaxy DROP CONSTRAINT IF EXISTS galaxy_name_key;
ALTER TABLE IF EXISTS ONLY public.constellation DROP CONSTRAINT IF EXISTS constellation_pkey;
ALTER TABLE IF EXISTS ONLY public.constellation DROP CONSTRAINT IF EXISTS constellation_name_unique;
ALTER TABLE IF EXISTS public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.constellation ALTER COLUMN constellation_id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.star_star_id_seq;
DROP TABLE IF EXISTS public.star;
DROP SEQUENCE IF EXISTS public.planet_planet_id_seq;
DROP TABLE IF EXISTS public.planet;
DROP SEQUENCE IF EXISTS public.moon_moon_id_seq;
DROP TABLE IF EXISTS public.moon;
DROP SEQUENCE IF EXISTS public.galaxy_galaxy_id_seq;
DROP TABLE IF EXISTS public.galaxy;
DROP SEQUENCE IF EXISTS public.constellation_constellation_id_seq;
DROP TABLE IF EXISTS public.constellation;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_million_years integer,
    description text,
    galaxy_type character varying(30),
    distance_light_years numeric
);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    moon_type character varying(30),
    diameter_km numeric
);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth numeric(10,2),
    is_spherical boolean,
    star_id integer,
    planet_type character varying(30),
    orbital_period_days numeric
);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    temperature_kelvin integer,
    has_life boolean,
    galaxy_id integer,
    mass_solar numeric,
    luminosity numeric
);


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.constellation (constellation_id, name, description) FROM stdin;
1	Orion	A prominent winter constellation.
2	Ursa Major	A northern constellation containing the Big Dipper.
3	Scorpius	A bright southern constellation found near the center of the Milky Way.
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.galaxy (galaxy_id, name, age_million_years, description, galaxy_type, distance_light_years) FROM stdin;
1	Milky Way	13600	Our home galaxy	\N	\N
2	Andromeda	10000	Nearest spiral galaxy	\N	\N
3	Triangulum	12000	Small spiral galaxy	\N	\N
4	Sombrero Galaxy	13000	Bright central bulge galaxy	\N	\N
5	Whirlpool Galaxy	9000	Interacting spiral galaxy	\N	\N
6	Black Eye Galaxy	11000	Dark dust lane galaxy	\N	\N
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moon (moon_id, name, planet_id, moon_type, diameter_km) FROM stdin;
1	Moon	1	\N	\N
2	Phobos	2	\N	\N
3	Deimos	2	\N	\N
4	Io	4	\N	\N
5	Europa	4	\N	\N
6	Ganymede	4	\N	\N
7	Callisto	4	\N	\N
8	Titan	5	\N	\N
9	Rhea	5	\N	\N
10	Iapetus	5	\N	\N
11	Enceladus	6	\N	\N
12	Mimas	6	\N	\N
13	Triton	7	\N	\N
14	Nereid	7	\N	\N
15	Charon	8	\N	\N
16	Hydra	8	\N	\N
17	Nix	9	\N	\N
18	Kerberos	9	\N	\N
19	Styx	9	\N	\N
20	Dysnomia	10	\N	\N
21	Phobos II	2	\N	\N
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.planet (planet_id, name, distance_from_earth, is_spherical, star_id, planet_type, orbital_period_days) FROM stdin;
1	Earth	0.00	t	1	\N	\N
2	Mars	225.00	t	1	\N	\N
3	Proxima b	4.24	t	3	\N	\N
4	Venus	41.00	t	1	\N	\N
5	Mercury	77.00	t	1	\N	\N
6	Jupiter	628.00	t	2	\N	\N
7	Saturn	1275.00	t	2	\N	\N
8	Uranus	2720.00	t	2	\N	\N
9	Neptune	4350.00	t	3	\N	\N
10	Kepler-22b	600.00	t	3	\N	\N
11	Gliese 581g	20.00	t	4	\N	\N
12	HD 209458 b	150.00	t	5	\N	\N
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.star (star_id, name, temperature_kelvin, has_life, galaxy_id, mass_solar, luminosity) FROM stdin;
1	Sun	5778	f	1	\N	\N
2	Alpha Centauri A	5790	f	1	\N	\N
3	Proxima Centauri	3042	f	2	\N	\N
4	Betelgeuse	3500	f	4	\N	\N
5	Rigel	11000	f	4	\N	\N
6	Sirius	9940	f	5	\N	\N
\.


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_unique UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

