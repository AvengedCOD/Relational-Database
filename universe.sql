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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_light_years numeric,
    type_of_galaxy character varying(35),
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
    name character varying(30) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    description text
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
    star_id integer,
    has_life boolean,
    number_of_moons integer,
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
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    distance_from_earth_in_light_years numeric(20,2),
    number_of_planets integer,
    description text
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A', 1, 'This supermassive black hole is the first ever imaged in human history!');
INSERT INTO public.black_hole VALUES (2, 'LMC Central Black Hole', 4, 'Discovered via hypervelocity stars flung by its gravity, this hidden giant (~600,000 solar masses) is the closest known supermassive black hole outside the Milky Way.');
INSERT INTO public.black_hole VALUES (3, 'NGC 6744’s Stealth Black Hole', 6, 'This black hole powers a low-luminosity active galactic nucleus (AGN), emitting bright radio waves but barely any visible light. It’s a cosmic ''ninja,'' stealthily influencing its galaxy while avoiding detection 16.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 52850, 'Barred Spiral Galaxy', 'Home to planet Earth.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 76000, 'Barred Spiral Galaxy', 'Milky Way''s closest neighbor.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 30000, 'Spiral Galaxy', 'Third largest member of the Local Group(galaxies near the Milky Way).');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 7000, 'Dwarf Irregular Galaxy', 'Scientist believe this once could have been a Barred Dwarf Spiral Galaxy.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 3500, 'Dwarf Irregular Galaxy', 'Visible to the naked eye in the Southern Hemisphere.');
INSERT INTO public.galaxy VALUES (6, 'NGC 6744', 87900, 'Intermediate Spiral Galaxy', 'A ''cosmic twin'' of the Milky Way, meaning it has a simliar size and structure.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 13, true, 'The only moon humans have walked on');
INSERT INTO public.moon VALUES (2, 'Io', 14, true, 'Most volcanically active body.');
INSERT INTO public.moon VALUES (3, 'Europa', 14, true, 'Subsurface ocean might host life.');
INSERT INTO public.moon VALUES (4, 'Ganymede', 14, true, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (5, 'Callisto', 14, true, 'Most heavily cratered moon.');
INSERT INTO public.moon VALUES (6, 'Titan', 15, true, 'Only moon with a thick atmosphere.');
INSERT INTO public.moon VALUES (7, 'Enceladus', 15, true, 'Ice geysers here feed Saturn''s rings.');
INSERT INTO public.moon VALUES (8, 'Mimas', 15, true, 'The ''Death Star'' moon. It has a giant crater.');
INSERT INTO public.moon VALUES (9, 'Rhea', 15, true, 'Saturn''s second largest moon.');
INSERT INTO public.moon VALUES (10, 'Dione', 15, true, 'Ancient icy surface with cliffs.');
INSERT INTO public.moon VALUES (11, 'Tethys', 15, true, 'A giant canyon spans the surface covering three quarters of the planet.');
INSERT INTO public.moon VALUES (12, 'Iapetus', 15, true, 'A two-toned moon, one side dark, the other light.');
INSERT INTO public.moon VALUES (13, 'Hyperion', 15, false, 'A sponge-like surface with an odd rotation.');
INSERT INTO public.moon VALUES (14, 'Phoebe', 15, false, 'A captured asteriod with a retrograde orbit.');
INSERT INTO public.moon VALUES (15, 'Phobos', 18, false, 'Doomed to crash into mars in 30 million years.');
INSERT INTO public.moon VALUES (17, 'Triton', 16, true, 'Orbits backward and has naturally occuring nitrogen geysers.');
INSERT INTO public.moon VALUES (18, 'Charon', 17, true, 'Forms a binary system with Pluto.');
INSERT INTO public.moon VALUES (16, 'Titania', 19, true, 'Largest moon of Uranus.');
INSERT INTO public.moon VALUES (19, 'Deimos', 18, false, 'Smallest moon in our Solar System.');
INSERT INTO public.moon VALUES (20, 'Oberon', 19, true, 'One of the darkest large moon''s of Uranus.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima b', 1, true, NULL, 'Tidally locked planet.');
INSERT INTO public.planet VALUES (2, 'Proxima c', 1, false, NULL, 'Orbits every 5.2 years.');
INSERT INTO public.planet VALUES (3, 'Proxima d', 1, false, NULL, 'Quarter of Earth''s mass.');
INSERT INTO public.planet VALUES (4, 'HD 10180 b', 6, false, NULL, 'Orbits faster than a Formula 1 lap!');
INSERT INTO public.planet VALUES (5, 'HD 10180 c', 6, false, NULL, 'Hotter than Neptune!');
INSERT INTO public.planet VALUES (6, 'HD 10180 d', 6, false, NULL, 'Circles its star in less than 3 weeks!');
INSERT INTO public.planet VALUES (7, 'HD 10180 e', 6, false, NULL, '25x Earth’s weight.');
INSERT INTO public.planet VALUES (8, 'HD 10180 f', 6, false, NULL, 'Very short years.');
INSERT INTO public.planet VALUES (9, 'HD 10180 g', 6, false, NULL, 'Neptune''s Twin, but in a habitable zone.');
INSERT INTO public.planet VALUES (10, 'HD 10180 h', 6, false, NULL, '68% of Saturn''s mass.');
INSERT INTO public.planet VALUES (11, 'HD 10180 i', 6, false, NULL, 'May not exist.');
INSERT INTO public.planet VALUES (12, 'HD 10180 j', 6, false, NULL, 'Astronomers debate its existence.');
INSERT INTO public.planet VALUES (13, 'Earth', 7, true, 1, 'Our little blue marble we call home.');
INSERT INTO public.planet VALUES (14, 'Jupiter', 7, false, 95, 'Largest planet in our Solar System.');
INSERT INTO public.planet VALUES (15, 'Saturn', 7, false, 146, 'Has beautiful rings of ice & rock.');
INSERT INTO public.planet VALUES (16, 'Neptune', 7, false, 16, 'Supersonic winds travel the surface.');
INSERT INTO public.planet VALUES (17, 'Pluto', 7, false, 5, 'Not really a planet anymore.');
INSERT INTO public.planet VALUES (18, 'Mars', 7, false, 2, 'The red planet.');
INSERT INTO public.planet VALUES (19, 'Uranus', 7, false, 28, 'Orbits on its side.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 1, 4.25, 3, 'This star is only 50 percent larger than Jupiter.');
INSERT INTO public.star VALUES (2, 'J004244.3+411617', 2, 2500000.00, 0, 'This is one of the brightest individual stars identified in Andromeda, a luminous blue variable star.');
INSERT INTO public.star VALUES (3, 'NGC 604-WR1', 3, 2730000.00, 0, 'This is a Wolf-Rayet star. These are known for being highly evolved stars that have shed their outer layers, revealing thier core. They have strong solar winds and high energy emissions.');
INSERT INTO public.star VALUES (4, 'S Doradus', 4, 160000.00, 0, 'One of the brightest stars in the LMC, S Doradus is a luminous blue variable and one of the most luminous stars known.');
INSERT INTO public.star VALUES (5, 'HD 5980', 5, 200000.00, 0, 'The SMC is too distant for current planet-finding technologies.');
INSERT INTO public.star VALUES (6, 'HD 10180', 1, 127.00, 9, 'HD 10180 holds a special place in astronomy as potentially having more planets than any other known exoplanetary system until very recently.');
INSERT INTO public.star VALUES (7, 'Sol', 1, 0.00, 8, 'Our lovely Sun.');


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

