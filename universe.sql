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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types integer NOT NULL,
    description text,
    has_life boolean,
    galaxy_age numeric(5,2)
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
    moon_is_spherical boolean NOT NULL,
    description text,
    distance_from_planet integer,
    moon_age numeric(5,2),
    planet_id integer DEFAULT 1 NOT NULL
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
-- Name: other_objects; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_objects (
    other_objects_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.other_objects OWNER TO freecodecamp;

--
-- Name: other_objects_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_objects_objects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_objects_objects_id_seq OWNER TO freecodecamp;

--
-- Name: other_objects_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_objects_objects_id_seq OWNED BY public.other_objects.other_objects_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
    distance_from_earth integer,
    planet_age numeric(5,2),
    star_id integer DEFAULT 1 NOT NULL
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
    star_types integer NOT NULL,
    description text,
    has_life boolean,
    star_age numeric(5,2),
    galaxy_id integer DEFAULT 1 NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other_objects other_objects_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_objects ALTER COLUMN other_objects_id SET DEFAULT nextval('public.other_objects_objects_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 'A barred spiral galaxy that contains our Solar System', true, 13.60);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 'The nearest spiral galaxy to the Milky Way and expected to collide with it in about 4.5 billion years', false, 10.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 'A member of the Local Group, smaller than the Milky Way and Andromeda', false, 12.00);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 1, 'Notable for its bright nucleus and large central bulge, giving it a hat-like appearance', false, 13.00);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 2, 'A giant elliptical galaxy with a supermassive black hole at its center', false, 14.00);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 3, 'A satellite galaxy of the Milky Way with an irregular shape', false, 13.70);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 'Earth''s natural satellite', 384400, 4.50, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 'Mars''s innermost moon', 9377, 1.08, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 'Mars''s outermost moon', 23460, 1.26, 1);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, 'Jupiter''s largest moon', 1070400, 4.50, 1);
INSERT INTO public.moon VALUES (5, 'Europa', true, 'Jupiter''s icy moon', 671034, 4.50, 1);
INSERT INTO public.moon VALUES (6, 'Io', true, 'Jupiter''s volcanic moon', 421700, 4.50, 1);
INSERT INTO public.moon VALUES (7, 'Titan', true, 'Saturn''s largest moon', 1221870, 4.50, 1);
INSERT INTO public.moon VALUES (8, 'Enceladus', true, 'Saturn''s icy moon', 238020, 4.50, 1);
INSERT INTO public.moon VALUES (9, 'Triton', true, 'Neptune''s largest moon', 354759, 4.50, 1);
INSERT INTO public.moon VALUES (10, 'Charon', true, 'Pluto''s largest moon', 19591, 4.50, 1);
INSERT INTO public.moon VALUES (11, 'Callisto', true, 'Jupiter''s heavily cratered moon', 1882700, 4.50, 1);
INSERT INTO public.moon VALUES (12, 'Phoebe', true, 'Saturn''s irregular moon', 12947690, 4.50, 1);
INSERT INTO public.moon VALUES (13, 'Miranda', true, 'Uranus''s small icy moon', 129780, 1.41, 1);
INSERT INTO public.moon VALUES (14, 'Rhea', true, 'Saturn''s second-largest moon', 527040, 1.33, 1);
INSERT INTO public.moon VALUES (15, 'Dione', true, 'Saturn''s third-largest moon', 377400, 1.48, 1);
INSERT INTO public.moon VALUES (16, 'Iapetus', true, 'Saturn''s two-toned moon', 3561300, 3.56, 1);
INSERT INTO public.moon VALUES (17, 'Mimas', true, 'Saturn''s cratered moon', 185520, 1.92, 1);
INSERT INTO public.moon VALUES (18, 'Hyperion', true, 'Saturn''s irregular moon', 1481000, 4.57, 1);
INSERT INTO public.moon VALUES (19, 'Tethys', true, 'Saturn''s mid-sized moon', 294660, 1.95, 1);
INSERT INTO public.moon VALUES (20, 'Oberon', true, 'Uranus''s second-largest moon', 583520, 3.95, 1);


--
-- Data for Name: other_objects; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_objects VALUES (1, 'Ceres', 4);
INSERT INTO public.other_objects VALUES (2, 'Vesta', 2);
INSERT INTO public.other_objects VALUES (3, 'Eros', 1);
INSERT INTO public.other_objects VALUES (4, 'Thanos', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'The third planet from the Sun and the only astronomical object known to harbor life.', 0, 4.54, 1);
INSERT INTO public.planet VALUES (2, 'Mars', true, 'The fourth planet from the Sun, known as the Red Planet due to its reddish appearance.', 54, 4.60, 1);
INSERT INTO public.planet VALUES (3, 'Venus', true, 'The second planet from the Sun, named after the Roman goddess of love and beauty.', 108, 4.50, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', true, 'The largest planet in the Solar System, known for its Great Red Spot.', 778, 4.57, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', true, 'The sixth planet from the Sun, famous for its prominent ring system.', 1427, 4.53, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', true, 'The eighth and farthest known planet from the Sun in the Solar System.', 4495, 4.54, 1);
INSERT INTO public.planet VALUES (7, 'Kepler-452b', true, 'An exoplanet orbiting within the habitable zone of the star Kepler-452.', 1402, 6.00, 1);
INSERT INTO public.planet VALUES (8, 'Proxima b', true, 'An exoplanet orbiting the star Proxima Centauri, the closest known exoplanet to the Solar System.', 4, 5.00, 1);
INSERT INTO public.planet VALUES (9, 'Gliese 581g', true, 'A hypothetical exoplanet orbiting the star Gliese 581, within the habitable zone.', 20, 7.50, 1);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', true, 'One of seven Earth-sized exoplanets orbiting the ultra-cool dwarf star TRAPPIST-1.', 39, 8.00, 1);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', true, 'An exoplanet also known as Osiris, notable for being the first discovered to transit its star.', 153, 5.60, 1);
INSERT INTO public.planet VALUES (12, '55 Cancri e', true, 'A super-Earth exoplanet that orbits the Sun-like star 55 Cancri A.', 41, 7.80, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 'The brightest star in the night sky', false, 0.24, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 2, 'A red supergiant star nearing the end of its life', false, 8.00, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'The closest known star to the Sun', true, 4.85, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 'A blue supergiant and one of the brightest stars in Orion', false, 8.00, 1);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'The brightest star in the Lyra constellation', false, 0.45, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 1, 'The closest star system to the Solar System', true, 5.00, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: other_objects_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_objects_objects_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_objects other_objects_age_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_objects
    ADD CONSTRAINT other_objects_age_key UNIQUE (age);


--
-- Name: other_objects other_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_objects
    ADD CONSTRAINT other_objects_pkey PRIMARY KEY (other_objects_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


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

