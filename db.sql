--
-- PostgreSQL database dump
-- pg_dump postgres  -U postgres -f db.sql

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: roletype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.roletype AS ENUM (
    'admin',
    'member',
    'guest'
);


ALTER TYPE public.roletype OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    useridseq integer NOT NULL,
    userid character varying(12) NOT NULL,
    username character varying(50) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    createdby character varying(12) DEFAULT 'SYSTEM'::character varying NOT NULL,
    updateat timestamp without time zone DEFAULT now() NOT NULL,
    updateby character varying(12) DEFAULT 'SYSTEM'::character varying NOT NULL,
    password character varying(60) NOT NULL,
    roles public.roletype DEFAULT 'guest'::public.roletype NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_useridseq_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_useridseq_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_useridseq_seq OWNER TO postgres;

--
-- Name: users_useridseq_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_useridseq_seq OWNED BY public.users.useridseq;


--
-- Name: users useridseq; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN useridseq SET DEFAULT nextval('public.users_useridseq_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (useridseq, userid, username, active, createdat, createdby, updateat, updateby, password, roles) FROM stdin;
\.


--
-- Name: users_useridseq_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_useridseq_seq', 1, false);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (useridseq);


--
-- PostgreSQL database dump complete
--

