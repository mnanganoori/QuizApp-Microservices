--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2024-05-08 08:29:13

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
-- TOC entry 215 (class 1259 OID 16509)
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    category character varying(255),
    difficulty_level character varying(255),
    option1 character varying(255),
    option2 character varying(255),
    option3 character varying(255),
    option4 character varying(255),
    question_title character varying(300),
    right_answer character varying(255)
);


ALTER TABLE public.question OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16508)
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO postgres;

--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 214
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- TOC entry 216 (class 1259 OID 16517)
-- Name: question_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_seq OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16519)
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
-- TOC entry 217 (class 1259 OID 16518)
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
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 217
-- Name: question_tbl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_tbl_id_seq OWNED BY public.question_tbl.id;


--
-- TOC entry 220 (class 1259 OID 16528)
-- Name: quiz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz (
    id integer NOT NULL,
    title character varying(255)
);


ALTER TABLE public.quiz OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16527)
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
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 219
-- Name: quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_id_seq OWNED BY public.quiz.id;


--
-- TOC entry 221 (class 1259 OID 16534)
-- Name: quiz_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_questions (
    quiz_id integer NOT NULL,
    questions_id integer NOT NULL
);


ALTER TABLE public.quiz_questions OWNER TO postgres;

--
-- TOC entry 3188 (class 2604 OID 16512)
-- Name: question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16522)
-- Name: question_tbl id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_tbl ALTER COLUMN id SET DEFAULT nextval('public.question_tbl_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16531)
-- Name: quiz id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz ALTER COLUMN id SET DEFAULT nextval('public.quiz_id_seq'::regclass);


--
-- TOC entry 3192 (class 2606 OID 16516)
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 16526)
-- Name: question_tbl question_tbl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_tbl
    ADD CONSTRAINT question_tbl_pkey PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 16533)
-- Name: quiz quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 16542)
-- Name: quiz_questions fkcgp9e1c6ww3t383aui4w8feae; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT fkcgp9e1c6ww3t383aui4w8feae FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);


--
-- TOC entry 3198 (class 2606 OID 16537)
-- Name: quiz_questions fkplkogpyb4yves2a2kwib4wkb6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT fkplkogpyb4yves2a2kwib4wkb6 FOREIGN KEY (questions_id) REFERENCES public.question_tbl(id);


-- Completed on 2024-05-08 08:29:14

--
-- PostgreSQL database dump complete
--

