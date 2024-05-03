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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: games_opponent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_opponent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_opponent_id_seq OWNER TO freecodecamp;

--
-- Name: games_opponent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_opponent_id_seq OWNED BY public.games.opponent_id;


--
-- Name: games_stg; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games_stg (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner character varying NOT NULL,
    opponent character varying NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games_stg OWNER TO freecodecamp;

--
-- Name: games_stg_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_stg_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_stg_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_stg_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_stg_game_id_seq OWNED BY public.games_stg.game_id;


--
-- Name: games_winner_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_winner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_winner_id_seq OWNER TO freecodecamp;

--
-- Name: games_winner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_winner_id_seq OWNED BY public.games.winner_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: games winner_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN winner_id SET DEFAULT nextval('public.games_winner_id_seq'::regclass);


--
-- Name: games opponent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN opponent_id SET DEFAULT nextval('public.games_opponent_id_seq'::regclass);


--
-- Name: games_stg game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_stg ALTER COLUMN game_id SET DEFAULT nextval('public.games_stg_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (897, 2018, 'Final', 65, 62, 4, 2);
INSERT INTO public.games VALUES (898, 2018, 'Third Place', 57, 64, 2, 0);
INSERT INTO public.games VALUES (899, 2018, 'Semi-Final', 62, 64, 2, 1);
INSERT INTO public.games VALUES (900, 2018, 'Semi-Final', 65, 57, 1, 0);
INSERT INTO public.games VALUES (901, 2018, 'Quarter-Final', 62, 73, 3, 2);
INSERT INTO public.games VALUES (902, 2018, 'Quarter-Final', 64, 75, 2, 0);
INSERT INTO public.games VALUES (903, 2018, 'Quarter-Final', 57, 58, 2, 1);
INSERT INTO public.games VALUES (904, 2018, 'Quarter-Final', 65, 78, 2, 0);
INSERT INTO public.games VALUES (905, 2018, 'Eighth-Final', 64, 60, 2, 1);
INSERT INTO public.games VALUES (906, 2018, 'Eighth-Final', 75, 76, 1, 0);
INSERT INTO public.games VALUES (907, 2018, 'Eighth-Final', 57, 68, 3, 2);
INSERT INTO public.games VALUES (908, 2018, 'Eighth-Final', 58, 69, 2, 0);
INSERT INTO public.games VALUES (909, 2018, 'Eighth-Final', 62, 63, 2, 1);
INSERT INTO public.games VALUES (910, 2018, 'Eighth-Final', 73, 74, 2, 1);
INSERT INTO public.games VALUES (911, 2018, 'Eighth-Final', 78, 72, 2, 1);
INSERT INTO public.games VALUES (912, 2018, 'Eighth-Final', 65, 56, 4, 3);
INSERT INTO public.games VALUES (913, 2014, 'Final', 66, 56, 1, 0);
INSERT INTO public.games VALUES (914, 2014, 'Third Place', 70, 58, 3, 0);
INSERT INTO public.games VALUES (915, 2014, 'Semi-Final', 56, 70, 1, 0);
INSERT INTO public.games VALUES (916, 2014, 'Semi-Final', 66, 58, 7, 1);
INSERT INTO public.games VALUES (917, 2014, 'Quarter-Final', 70, 61, 1, 0);
INSERT INTO public.games VALUES (918, 2014, 'Quarter-Final', 56, 57, 1, 0);
INSERT INTO public.games VALUES (919, 2014, 'Quarter-Final', 58, 60, 2, 1);
INSERT INTO public.games VALUES (920, 2014, 'Quarter-Final', 66, 65, 1, 0);
INSERT INTO public.games VALUES (921, 2014, 'Eighth-Final', 58, 59, 2, 1);
INSERT INTO public.games VALUES (922, 2014, 'Eighth-Final', 60, 78, 2, 0);
INSERT INTO public.games VALUES (923, 2014, 'Eighth-Final', 65, 71, 2, 0);
INSERT INTO public.games VALUES (924, 2014, 'Eighth-Final', 66, 55, 2, 1);
INSERT INTO public.games VALUES (925, 2014, 'Eighth-Final', 70, 69, 2, 1);
INSERT INTO public.games VALUES (926, 2014, 'Eighth-Final', 61, 67, 2, 1);
INSERT INTO public.games VALUES (927, 2014, 'Eighth-Final', 56, 76, 1, 0);
INSERT INTO public.games VALUES (928, 2014, 'Eighth-Final', 57, 77, 2, 1);


--
-- Data for Name: games_stg; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games_stg VALUES (1, 2018, 'Final', 'France', 'Croatia', 4, 2);
INSERT INTO public.games_stg VALUES (2, 2018, 'Third Place', 'Belgium', 'England', 2, 0);
INSERT INTO public.games_stg VALUES (3, 2018, 'Semi-Final', 'Croatia', 'England', 2, 1);
INSERT INTO public.games_stg VALUES (4, 2018, 'Semi-Final', 'France', 'Belgium', 1, 0);
INSERT INTO public.games_stg VALUES (5, 2018, 'Quarter-Final', 'Croatia', 'Russia', 3, 2);
INSERT INTO public.games_stg VALUES (6, 2018, 'Quarter-Final', 'England', 'Sweden', 2, 0);
INSERT INTO public.games_stg VALUES (7, 2018, 'Quarter-Final', 'Belgium', 'Brazil', 2, 1);
INSERT INTO public.games_stg VALUES (8, 2018, 'Quarter-Final', 'France', 'Uruguay', 2, 0);
INSERT INTO public.games_stg VALUES (9, 2018, 'Eighth-Final', 'England', 'Colombia', 2, 1);
INSERT INTO public.games_stg VALUES (10, 2018, 'Eighth-Final', 'Sweden', 'Switzerland', 1, 0);
INSERT INTO public.games_stg VALUES (11, 2018, 'Eighth-Final', 'Belgium', 'Japan', 3, 2);
INSERT INTO public.games_stg VALUES (12, 2018, 'Eighth-Final', 'Brazil', 'Mexico', 2, 0);
INSERT INTO public.games_stg VALUES (13, 2018, 'Eighth-Final', 'Croatia', 'Denmark', 2, 1);
INSERT INTO public.games_stg VALUES (14, 2018, 'Eighth-Final', 'Russia', 'Spain', 2, 1);
INSERT INTO public.games_stg VALUES (15, 2018, 'Eighth-Final', 'Uruguay', 'Portugal', 2, 1);
INSERT INTO public.games_stg VALUES (16, 2018, 'Eighth-Final', 'France', 'Argentina', 4, 3);
INSERT INTO public.games_stg VALUES (17, 2014, 'Final', 'Germany', 'Argentina', 1, 0);
INSERT INTO public.games_stg VALUES (18, 2014, 'Third Place', 'Netherlands', 'Brazil', 3, 0);
INSERT INTO public.games_stg VALUES (19, 2014, 'Semi-Final', 'Argentina', 'Netherlands', 1, 0);
INSERT INTO public.games_stg VALUES (20, 2014, 'Semi-Final', 'Germany', 'Brazil', 7, 1);
INSERT INTO public.games_stg VALUES (21, 2014, 'Quarter-Final', 'Netherlands', 'Costa Rica', 1, 0);
INSERT INTO public.games_stg VALUES (22, 2014, 'Quarter-Final', 'Argentina', 'Belgium', 1, 0);
INSERT INTO public.games_stg VALUES (23, 2014, 'Quarter-Final', 'Brazil', 'Colombia', 2, 1);
INSERT INTO public.games_stg VALUES (24, 2014, 'Quarter-Final', 'Germany', 'France', 1, 0);
INSERT INTO public.games_stg VALUES (25, 2014, 'Eighth-Final', 'Brazil', 'Chile', 2, 1);
INSERT INTO public.games_stg VALUES (26, 2014, 'Eighth-Final', 'Colombia', 'Uruguay', 2, 0);
INSERT INTO public.games_stg VALUES (27, 2014, 'Eighth-Final', 'France', 'Nigeria', 2, 0);
INSERT INTO public.games_stg VALUES (28, 2014, 'Eighth-Final', 'Germany', 'Algeria', 2, 1);
INSERT INTO public.games_stg VALUES (29, 2014, 'Eighth-Final', 'Netherlands', 'Mexico', 2, 1);
INSERT INTO public.games_stg VALUES (30, 2014, 'Eighth-Final', 'Costa Rica', 'Greece', 2, 1);
INSERT INTO public.games_stg VALUES (31, 2014, 'Eighth-Final', 'Argentina', 'Switzerland', 1, 0);
INSERT INTO public.games_stg VALUES (32, 2014, 'Eighth-Final', 'Belgium', 'United States', 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (55, 'Algeria');
INSERT INTO public.teams VALUES (56, 'Argentina');
INSERT INTO public.teams VALUES (57, 'Belgium');
INSERT INTO public.teams VALUES (58, 'Brazil');
INSERT INTO public.teams VALUES (59, 'Chile');
INSERT INTO public.teams VALUES (60, 'Colombia');
INSERT INTO public.teams VALUES (61, 'Costa Rica');
INSERT INTO public.teams VALUES (62, 'Croatia');
INSERT INTO public.teams VALUES (63, 'Denmark');
INSERT INTO public.teams VALUES (64, 'England');
INSERT INTO public.teams VALUES (65, 'France');
INSERT INTO public.teams VALUES (66, 'Germany');
INSERT INTO public.teams VALUES (67, 'Greece');
INSERT INTO public.teams VALUES (68, 'Japan');
INSERT INTO public.teams VALUES (69, 'Mexico');
INSERT INTO public.teams VALUES (70, 'Netherlands');
INSERT INTO public.teams VALUES (71, 'Nigeria');
INSERT INTO public.teams VALUES (72, 'Portugal');
INSERT INTO public.teams VALUES (73, 'Russia');
INSERT INTO public.teams VALUES (74, 'Spain');
INSERT INTO public.teams VALUES (75, 'Sweden');
INSERT INTO public.teams VALUES (76, 'Switzerland');
INSERT INTO public.teams VALUES (77, 'United States');
INSERT INTO public.teams VALUES (78, 'Uruguay');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 928, true);


--
-- Name: games_opponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_opponent_id_seq', 1, false);


--
-- Name: games_stg_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_stg_game_id_seq', 32, true);


--
-- Name: games_winner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_winner_id_seq', 1, false);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 414, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: games_stg games_stg_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_stg
    ADD CONSTRAINT games_stg_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

