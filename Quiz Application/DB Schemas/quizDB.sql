--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2024-05-08 08:30:38

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
-- TOC entry 215 (class 1259 OID 24721)
-- Name: question_tbl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_tbl (
    id integer NOT NULL,
    category character varying(255),
    difficulty_level character varying(255),
    option1 character varying(255),
    option2 character varying(255),
    option3 character varying(255),
    option4 character varying(255),
    question_title character varying(255),
    right_answer character varying(255)
);


ALTER TABLE public.question_tbl OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24720)
-- Name: question_tbl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_tbl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_tbl_id_seq OWNER TO postgres;

--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 214
-- Name: question_tbl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_tbl_id_seq OWNED BY public.question_tbl.id;


--
-- TOC entry 217 (class 1259 OID 24730)
-- Name: quiz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz (
    id integer NOT NULL,
    title character varying(255)
);


ALTER TABLE public.quiz OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24729)
-- Name: quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quiz_id_seq OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 216
-- Name: quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_id_seq OWNED BY public.quiz.id;


--
-- TOC entry 218 (class 1259 OID 24736)
-- Name: quiz_question_ids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_question_ids (
    quiz_id integer NOT NULL,
    question_ids integer
);


ALTER TABLE public.quiz_question_ids OWNER TO postgres;

--
-- TOC entry 3182 (class 2604 OID 24724)
-- Name: question_tbl id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_tbl ALTER COLUMN id SET DEFAULT nextval('public.question_tbl_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 24733)
-- Name: quiz id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz ALTER COLUMN id SET DEFAULT nextval('public.quiz_id_seq'::regclass);


--
-- TOC entry 3185 (class 2606 OID 24728)
-- Name: question_tbl question_tbl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_tbl
    ADD CONSTRAINT question_tbl_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 24735)
-- Name: quiz quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 24739)
-- Name: quiz_question_ids fks0d7k0yq779g15wmctr0tlnbi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_question_ids
    ADD CONSTRAINT fks0d7k0yq779g15wmctr0tlnbi FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);


-- Completed on 2024-05-08 08:30:38

--
-- PostgreSQL database dump complete
--

