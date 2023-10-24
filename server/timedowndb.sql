--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Homebrew)
-- Dumped by pg_dump version 14.9 (Homebrew)

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
-- Name: activitylog; Type: TABLE; Schema: public; Owner: tpl1122_17
--

CREATE TABLE public.activitylog (
    id integer NOT NULL,
    creationdate date,
    userid integer,
    taskid integer,
    timeblockid integer,
    actiontype integer
);


ALTER TABLE public.activitylog OWNER TO tpl1122_17;

--
-- Name: activitylog_id_seq; Type: SEQUENCE; Schema: public; Owner: tpl1122_17
--

ALTER TABLE public.activitylog ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.activitylog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: tpl1122_17
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    userid integer,
    duedate date,
    title character varying(255),
    description character varying(5000),
    tags character varying(500),
    timeest bigint
);


ALTER TABLE public.tasks OWNER TO tpl1122_17;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: tpl1122_17
--

ALTER TABLE public.tasks ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: timeblocks; Type: TABLE; Schema: public; Owner: tpl1122_17
--

CREATE TABLE public.timeblocks (
    id integer NOT NULL,
    taskid integer,
    userid integer,
    start date,
    "end" date,
    isblackout boolean,
    isrecurring boolean,
    incalendar boolean
);


ALTER TABLE public.timeblocks OWNER TO tpl1122_17;

--
-- Name: timeblocks_id_seq; Type: SEQUENCE; Schema: public; Owner: tpl1122_17
--

ALTER TABLE public.timeblocks ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.timeblocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: tpl1122_17
--

CREATE TABLE public.users (
    id integer NOT NULL,
    lastname character varying(255),
    firstname character varying(255),
    email character varying(255) NOT NULL,
    sub character varying(255),
    settings character varying(2000),
    creationdate date DEFAULT now()
);


ALTER TABLE public.users OWNER TO tpl1122_17;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: tpl1122_17
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: activitylog; Type: TABLE DATA; Schema: public; Owner: tpl1122_17
--

COPY public.activitylog (id, creationdate, userid, taskid, timeblockid, actiontype) FROM stdin;
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: tpl1122_17
--

COPY public.tasks (id, userid, duedate, title, description, tags, timeest) FROM stdin;
\.


--
-- Data for Name: timeblocks; Type: TABLE DATA; Schema: public; Owner: tpl1122_17
--

COPY public.timeblocks (id, taskid, userid, start, "end", isblackout, isrecurring, incalendar) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tpl1122_17
--

COPY public.users (id, lastname, firstname, email, sub, settings, creationdate) FROM stdin;
\.


--
-- Name: activitylog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tpl1122_17
--

SELECT pg_catalog.setval('public.activitylog_id_seq', 1, false);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tpl1122_17
--

SELECT pg_catalog.setval('public.tasks_id_seq', 1, false);


--
-- Name: timeblocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tpl1122_17
--

SELECT pg_catalog.setval('public.timeblocks_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tpl1122_17
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: activitylog activitylog_pkey; Type: CONSTRAINT; Schema: public; Owner: tpl1122_17
--

ALTER TABLE ONLY public.activitylog
    ADD CONSTRAINT activitylog_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: tpl1122_17
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: timeblocks timeblocks_pkey; Type: CONSTRAINT; Schema: public; Owner: tpl1122_17
--

ALTER TABLE ONLY public.timeblocks
    ADD CONSTRAINT timeblocks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tpl1122_17
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: activitylog activitylog_taskid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tpl1122_17
--

ALTER TABLE ONLY public.activitylog
    ADD CONSTRAINT activitylog_taskid_fkey FOREIGN KEY (taskid) REFERENCES public.tasks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: activitylog activitylog_timeblockid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tpl1122_17
--

ALTER TABLE ONLY public.activitylog
    ADD CONSTRAINT activitylog_timeblockid_fkey FOREIGN KEY (timeblockid) REFERENCES public.timeblocks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: activitylog activitylog_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tpl1122_17
--

ALTER TABLE ONLY public.activitylog
    ADD CONSTRAINT activitylog_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tasks tasks_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tpl1122_17
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: timeblocks timeblocks_taskid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tpl1122_17
--

ALTER TABLE ONLY public.timeblocks
    ADD CONSTRAINT timeblocks_taskid_fkey FOREIGN KEY (taskid) REFERENCES public.tasks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: timeblocks timeblocks_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tpl1122_17
--

ALTER TABLE ONLY public.timeblocks
    ADD CONSTRAINT timeblocks_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

