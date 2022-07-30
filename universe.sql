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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass) NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type_id integer,
    no_of_stars integer,
    constellation text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass) NOT NULL,
    is_spherical boolean,
    is_disk boolean,
    is_spiral boolean,
    name character varying(60) NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: lanet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.lanet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lanet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon__id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon__id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer DEFAULT nextval('public.moon_moon__id_seq'::regclass) NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer,
    temperature_in_kelvins numeric,
    discovered_date date
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer DEFAULT nextval('public.lanet_planet_id_seq'::regclass) NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer,
    escape_velocity integer,
    orbit_period integer,
    num_satellites integer,
    description text
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer DEFAULT nextval('public.star_star_id_seq'::regclass) NOT NULL,
    galaxy_id integer,
    mass integer,
    escape_velocity integer,
    id integer NOT NULL,
    name character varying(60)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.id;


--
-- Name: star id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky_way', 1, 100, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'CAnis Major Dwarf', 4, 1, 'Canis Major');
INSERT INTO public.galaxy VALUES (3, 'Cartwheel Galaxy', 3, NULL, 'Sculptor');
INSERT INTO public.galaxy VALUES (4, 'NGC 2787', 3, NULL, 'Ursa Minor');
INSERT INTO public.galaxy VALUES (5, 'NGC 4608', 3, NULL, 'Virgo');
INSERT INTO public.galaxy VALUES (6, 'Messier 108', 1, NULL, 'Ursa Minor');
INSERT INTO public.galaxy VALUES (7, 'Messier 95', 1, NULL, 'Leo');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, false, true, true, 'Barred Spiral Galaxy');
INSERT INTO public.galaxy_type VALUES (2, true, false, false, 'Dwarf Speroidal Galaxy');
INSERT INTO public.galaxy_type VALUES (3, false, true, false, 'Lenticular Galaxy');
INSERT INTO public.galaxy_type VALUES (4, false, false, false, 'Irregular Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymede', 1, 110, '1610-01-07');
INSERT INTO public.moon VALUES (2, 'Titan', 2, 93, '1610-01-07');
INSERT INTO public.moon VALUES (3, 'Callisto', 1, 134, '1610-01-07');
INSERT INTO public.moon VALUES (4, 'IO', 1, 110, '1610-01-08');
INSERT INTO public.moon VALUES (5, 'Moon', 3, 250, NULL);
INSERT INTO public.moon VALUES (6, 'Europa', 1, 102, '1610-01-08');
INSERT INTO public.moon VALUES (7, 'Triton', 4, 38, '1610-01-07');
INSERT INTO public.moon VALUES (8, 'Titania', 4, 134, '1610-01-07');
INSERT INTO public.moon VALUES (9, 'Rhea', 2, 53, '1610-01-08');
INSERT INTO public.moon VALUES (10, 'Oberon', 5, 74, '1787-01-11');
INSERT INTO public.moon VALUES (11, 'Iapteus', 2, 110, '1671-10-25');
INSERT INTO public.moon VALUES (12, 'Umbriel', 5, NULL, '1851-10-24');
INSERT INTO public.moon VALUES (13, 'Ariel', 5, NULL, '1851-10-24');
INSERT INTO public.moon VALUES (14, 'Dione', 2, NULL, '1851-10-24');
INSERT INTO public.moon VALUES (15, 'Tethys', 2, 86, '1684-03-21');
INSERT INTO public.moon VALUES (16, 'Enceladus', 2, 75, '1789-08-28');
INSERT INTO public.moon VALUES (17, 'Miranda', 5, 60, '1984-02-16');
INSERT INTO public.moon VALUES (18, 'Proteus', 4, 51, '1989-06-16');
INSERT INTO public.moon VALUES (19, 'Mimas', 2, 64, '1789-09-17');
INSERT INTO public.moon VALUES (20, 'Hyperion', 2, 93, '1848-09-16');
INSERT INTO public.moon VALUES (21, 'Phoebe', 2, 73, '1899-03-17');
INSERT INTO public.moon VALUES (22, 'Janus', 2, 76, '1966-12-15');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 1, 59, 4332, 80, NULL);
INSERT INTO public.planet VALUES (2, 'Saturn', 1, 35, 10759, 83, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 11, 365, 1, 'Human Planet');
INSERT INTO public.planet VALUES (4, 'Neptune', 1, 23, 60195, 14, NULL);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 21, 30688, 27, NULL);
INSERT INTO public.planet VALUES (6, 'Venus', 1, 10, 224, 0, NULL);
INSERT INTO public.planet VALUES (7, 'Mars', 1, 5, 779, 2, NULL);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 4, 87, 0, NULL);
INSERT INTO public.planet VALUES (9, 'Jupiter', 7, 4, 87, 0, NULL);
INSERT INTO public.planet VALUES (10, 'HIP 11915', 8, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Gj 687 b', 9, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Gj 687 c', 9, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, NULL, 617, 1, NULL);
INSERT INTO public.star VALUES (2, 1, NULL, NULL, 2, NULL);
INSERT INTO public.star VALUES (3, 1, NULL, NULL, 3, NULL);
INSERT INTO public.star VALUES (4, 1, NULL, NULL, 4, NULL);
INSERT INTO public.star VALUES (5, 1, NULL, NULL, 5, NULL);
INSERT INTO public.star VALUES (6, 1, NULL, NULL, 6, NULL);
INSERT INTO public.star VALUES (7, 1, NULL, NULL, 7, NULL);
INSERT INTO public.star VALUES (8, 1, NULL, NULL, 8, NULL);
INSERT INTO public.star VALUES (9, 1, NULL, NULL, 9, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: lanet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.lanet_planet_id_seq', 1, false);


--
-- Name: moon_moon__id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon__id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constraint UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type__pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type__pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy_type galaxy_typeconstraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_typeconstraint UNIQUE (galaxy_type_id);


--
-- Name: moon moon_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_constraint UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_constraint UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planetpkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planetpkey UNIQUE (planet_id);


--
-- Name: star star_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constraint UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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

