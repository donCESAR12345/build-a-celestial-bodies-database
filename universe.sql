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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500),
    distance_from_earth_in_kpc integer,
    mass_in_solar_masses numeric,
    type text,
    galaxy_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    description character varying(500),
    size_in_kpc integer,
    number_of_stars_in_billions numeric,
    type text,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500),
    size integer,
    mass numeric,
    type text,
    planet_id integer NOT NULL,
    has_life boolean NOT NULL
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
    name character varying(100) NOT NULL,
    description character varying(500),
    radius_in_earth_radius integer,
    mass_in_earth_masses numeric,
    type text,
    star_id integer NOT NULL,
    has_life boolean NOT NULL
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
    name character varying(100) NOT NULL,
    description character varying(500),
    size_in_solar_radius integer,
    mass_in_solar_masses numeric,
    type text,
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


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

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 'The object is a bright and very compact astronomical radio source. The name Sagittarius A* follows from historical reasons. In 1954 John D. Kraus, Hsien-Ching Ko, and Sean Matt listed the radio sources they identified with the Ohio State University radio telescope at 250MHz', 8178, 4154000, 'Supermassive Black Hole', 1);
INSERT INTO public.black_hole VALUES (2, 'MOA-2011-BLG-191', 'Isolated black hole detected by microlensing', 2, 7.1, 'Isolated black hole', 1);
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-3', 'Binary star system with orbit t=4.8h', 4, 12.7, 'Binary star system', 1);
INSERT INTO public.black_hole VALUES (4, 'Messier 31', 'Supermassive black hole residing at the center of the Andromeda Galaxy', 765, 230000000, 'Supermassive black hole', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is the galaxy that includes our Solar System, with the name describing the appearence of the galaxy from Earth: a hazy band of light seen in the night sky formed from stars that cannot be
 individually distinguished by the naked eye.', 27, 250, 'Spiral Galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The Andromeda Galaxy also known as Messier 31, M31, or NGC 224 and originally the Andromeda Nebula, is a barred spiral galaxy with diameter of about 46.56 kiloparsecs (152,000 light-years) approximately 2.5 million light-years (765 kiloparsecs) from Earth and the nearest large galaxy to the Milky Way.', 47, 1000, 'Spiral Galaxy', false);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Overdensity', 'The Canis Major Dwarf Galaxy is classified as an irregular galaxy and is now thought to be the closest neighboring galaxy to the location of the Earth in the Milky Way, being located about 25,000 light-years (7.7 kiloparsecs) away from the Solar System and 42,000 ly (13 kpc) from the Galactic Center.', NULL, 1, 'Irregular Galaxy', false);
INSERT INTO public.galaxy VALUES (4, 'Ursa Minor Dwarf', 'The Ursa Minor Dwarf is a dwarf spheroidal galaxy, discovered by A.G. Wilson of the Lowell Observatory, in the United States, during the Palomar Sky Survey in 1955. It appears in the Ursa Minor constellation, and is a satellite galaxy of the Milky Way. The galaxy consists mainly of older stars and seems to house little to no ongoing star formation. Its centre is around 225,000 light years distant from Earth.', NULL, NULL, 'Dwarf Spheroidal Galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'The galaxy is the smallest spiral galaxy in the Local Group (although the smaller Large and Small Magellanic Clouds may have been spirals before their encounters with the Milky Way), and is believed to be a satellite of the Andromeda Galaxy or on its rebound into the latter due to their interactions, velocities, and proximity to one another in the night sky. It also has an H II nucleus.', 19, 40, 'Spiral Galaxy', false);
INSERT INTO public.galaxy VALUES (6, 'NGC 7319', 'NGC 7319 is a highly distorted barred spiral galaxy that is a member of the compact Stephan Quintet group located in the constellation Pegasus, some 311 megalight-years distant from the Milky Way. The arms of the galaxy, dust and gas have been highly disturbed as a result of the interaction with the other members of the Quintet.', NULL, NULL, 'Barred Spiral Galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon is the only natural satellite of the Earth. Its diameter is about one-quarter the diameter of the Earth (comparable to the width of Australia). The Moon is the fifth largest satellite in the Solar System. It is larger than any of the known dwarf planets and is the largest (and most massive) satellite relative to its parent planet.', 1737, 0.0123, 'Natural satellite', 2, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos (/ˈfoʊbɒs/; systematic designation: Mars I) is the innermost and larger of the two natural satellites of Mars, the other being Deimos. The two moons were discovered in 1877 by American astronomer Asaph Hall. Phobos is named after the Greek deity Phobos, a son of Ares (Mars) and twin brother of Deimos.', 11, 1.784, 'Natural satellite', 3, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos /ˈdaɪməs/ (systematic designation: Mars II) is the smaller and outermost of the two natural satellites of Mars, the other being Phobos. Of similar composition to C and D-type asteroids, Deimos has a mean radius of 6.2 km (3.9 mi) and takes 30.3 hours to orbit Mars.', 6, 0.2471, 'Natural satellite', 3, false);
INSERT INTO public.moon VALUES (4, 'Io', 'Io (/ˈaɪ.oʊ/), or Jupiter I, is the innermost and third-largest of the four Galilean moons of the planet Jupiter. Slightly larger than the moon of the Earth, Io is the fourth-largest moon in the Solar System, has the highest density of any moon, the strongest surface gravity of any moon, and the lowest amount of water (by atomic ratio) of any known astronomical object in the Solar System', 1821, 0.015, 'Natural satellite', 5, false);
INSERT INTO public.moon VALUES (6, 'Europa', NULL, NULL, NULL, NULL, 5, false);
INSERT INTO public.moon VALUES (7, 'Ganymede', NULL, NULL, NULL, NULL, 5, false);
INSERT INTO public.moon VALUES (8, 'Callisto', NULL, NULL, NULL, NULL, 5, false);
INSERT INTO public.moon VALUES (9, 'Ananke', NULL, NULL, NULL, NULL, 5, false);
INSERT INTO public.moon VALUES (10, 'Titan', NULL, NULL, NULL, NULL, 6, false);
INSERT INTO public.moon VALUES (11, 'Rhea', NULL, NULL, NULL, NULL, 6, false);
INSERT INTO public.moon VALUES (12, 'Enceladus', NULL, NULL, NULL, NULL, 6, false);
INSERT INTO public.moon VALUES (13, 'Nereid', NULL, NULL, NULL, NULL, 9, false);
INSERT INTO public.moon VALUES (14, 'Proteus', NULL, NULL, NULL, NULL, 9, false);
INSERT INTO public.moon VALUES (15, 'Larissa', NULL, NULL, NULL, NULL, 9, false);
INSERT INTO public.moon VALUES (16, 'Naiad', NULL, NULL, NULL, NULL, 9, false);
INSERT INTO public.moon VALUES (17, 'Thalassa', NULL, NULL, NULL, NULL, 9, false);
INSERT INTO public.moon VALUES (18, 'Triton', NULL, NULL, NULL, NULL, 9, false);
INSERT INTO public.moon VALUES (19, 'Miranda', NULL, NULL, NULL, NULL, 7, false);
INSERT INTO public.moon VALUES (20, 'Ariel', NULL, NULL, NULL, NULL, 7, false);
INSERT INTO public.moon VALUES (21, 'Umbriel', NULL, NULL, NULL, NULL, 7, false);
INSERT INTO public.moon VALUES (22, 'Titania', NULL, NULL, NULL, NULL, 7, false);
INSERT INTO public.moon VALUES (23, 'Oberon', NULL, NULL, NULL, NULL, 7, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the planets of the Sun. It is named after the Roman god Mercurius (Mercury), god of commerce, messenger of the gods, and mediator between gods and mortals, corresponding to the Greek god Hermes (Ἑρμῆς).', 1, 0.055, 'Terrestrial planet', 7, false);
INSERT INTO public.planet VALUES (2, 'Earth', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. While large volumes of water can be found throughout the Solar System, only Earth sustains liquid surface water. About 71% of Earth surface is made up of the ocean, dwarfing Earth polar ice, lakes, and rivers.', 1, 1, 'Terrestrial planet', 7, true);
INSERT INTO public.planet VALUES (3, 'Mars', 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In the English language, Mars is named for the Roman god of war.', 1, 0.107, 'Terrestrial planet', 7, false);
INSERT INTO public.planet VALUES (4, 'Ceres', 'The small size of Ceres means that even at its brightest it is too dim to be seen by the naked eye, except under extremely dark skies. Its apparent magnitude ranges from 6.7 to 9.3, peaking at opposition (when it is closest to Earth) once every 15- to 16-month synodic period.', 1, 0.00016, 'Dwarf planet', 7, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, but slightly less than one-thousandth the mass of the Sun.', 11, 317.8, 'Gas giant', 7, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine and a half times that of Earth. It has only one-eighth the average density of Earth; however, with its larger volume, Saturn is over 95 times more massive.', 8, 95.159, 'Gas giant', 7, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus is the seventh planet from the Sun. Its name is a reference to the Greek god of the sky, Uranus (Caelus), who, according to Greek mythology, was the great-grandfather of Ares (Mars), grandfather of Zeus (Jupiter) and father of Cronus (Saturn). It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System.', 4, 14.536, 'Ice giant', 7, false);
INSERT INTO public.planet VALUES (8, 'Venus', 'Venus is the second planet from the Sun. It is sometimes called Earth "sister" or "twin" planet as it is almost as large and has a similar composition. As an interior planet to Earth, Venus (like Mercury) appears in the sky of the Earth  never far from the Sun, either as morning star or evening star.', 1, 0.815, 'Terrestrial planet', 7, false);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Neptune is the eighth planet from the Sun and the farthest known solar planet. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus.', 4, 17.47, 'Ice giant', 7, false);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri D', 'Proxima Centauri d (also called Proxima d) is a candidate exoplanet orbiting the red dwarf star Proxima Centauri, the closest star to the Sun and part of the Alpha Centauri triple star system. Together with two other planets in the Proxima Centauri system, it is the closest known exoplanet to the Solar System, located approximately 4.2 light-years (1.3 parsecs; 40 trillion kilometres; 25 trillion miles) away in the constellation of Centaurus.', 1, 0.26, 'Exoplanet', 6, false);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri B', 'Proxima Centauri b (or Proxima b), sometimes referred to as Alpha Centauri Cb, is an exoplanet orbiting in the habitable zone of the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of the triple star system Alpha Centauri.', 1, 1.07, 'Exoplanet', 6, false);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri C', 'Proxima Centauri c (also called Proxima c or Alpha Centauri Cc) is a controversial exoplanet candidate claimed to be orbiting the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of a triple star system.', NULL, 7, 'Exoplanet', 6, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Andromedae', 'Although it appears to the naked eye as a single star, with overall apparent visual magnitude +2.06, it is actually a binary system composed of two stars in close orbit. The chemical composition of the brighter of the two stars is unusual as it is a mercury-manganese star whose atmosphere contains abnormally high levels of mercury, manganese, and other elements, including gallium and xenon. It is the brightest mercury-manganese star known.', 3, 3.8, 'Binary system', 2);
INSERT INTO public.star VALUES (2, 'V428 Andromedae', 'HD 3346, also known as V428 Andromedae, is a binary star system in the northern constellation of Andromeda. It is a dim star but visible to the naked eye under suitable viewing conditions, having an apparent visual magnitude of 5.14. The distance to HD 3346 can be determined from its annual parallax shift of 4.95 mas.', 48, NULL, 'Binary system', 2);
INSERT INTO public.star VALUES (3, '44 Andromedae', '44 Andromedae is a single, yellow-white hued star in the northern constellation of Andromeda. 44 Andromedae is the Flamsteed designation. It has an apparent visual magnitude of approximately 5.67, which indicates it is a dim star that is just visible to the naked eye on a dark night.', 4, 1.64, 'Single system', 2);
INSERT INTO public.star VALUES (4, 'V439 Andromedae', 'HD 166 or V439 Andromedae (ADS 69 A) is a 6th magnitude star in the constellation Andromeda, approximately 45 light years away from Earth. It is a variable star of the BY Draconis type, varying between magnitudes 6.13 and 6.18 with a 6.23 days periodicity.', 1, 0.889, 'Single system', 2);
INSERT INTO public.star VALUES (5, 'Beta Trianguli', 'Beta Trianguli (Beta Tri, β Trianguli, β Tri) is the Bayer designation for a binary star system in the constellation Triangulum, located about 127 light years from Earth. Although the apparent magnitude is only 3.0, it is the brightest star in the constellation Triangulum.', NULL, 3.5, 'Subgiant Star', 5);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Proxima Centauri is a small, low-mass star located 4.2465 light-years (1.3020 pc) away from the Sun in the southern constellation of Centaurus. Its Latin name means the nearest [star] of Centaurus. It was discovered in 1915 by Robert Innes and is the nearest-known star to the Sun.', 1, 0.1221, 'Red Dwarf', 1);
INSERT INTO public.star VALUES (7, 'Sun', 'The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma, heated to incandescence by nuclear fusion reactions in its core. The Sun radiates this energy mainly as light, ultraviolet, and infrared radiation, and is the most important source of energy for life on Earth.', 1, 1, 'G-type main sequence star', 1);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 4, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

