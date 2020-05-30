--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--




--
-- Roles
--

-- CREATE ROLE "user";
-- ALTER ROLE "user" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5c41badb1d5bb89c8db4fa5f66a4611ea';






--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-2.pgdg90+1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-2.pgdg90+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO "user";

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: user
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: user
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-2.pgdg90+1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-2.pgdg90+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO "user";

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-2.pgdg90+1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-2.pgdg90+1)

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
-- Name: realworld; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE realworld WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE realworld OWNER TO "user";

\connect realworld

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

SET default_with_oids = false;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    author_id integer NOT NULL,
    slug character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    body character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.articles OWNER TO "user";

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    session_one character varying(255) NOT NULL,
    session_two character varying(255) NOT NULL
);


ALTER TABLE public.sessions OWNER TO "user";

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO "user";

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(355) NOT NULL,
    created_on timestamp without time zone,
    last_login timestamp without time zone,
    image character varying DEFAULT 'https://static.productionready.io/images/smiley-cyrus.jpg'::character varying NOT NULL,
    bio character varying(280)
);


ALTER TABLE public.users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.sessions (id, user_id, session_one, session_two) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, username, password, email, created_on, last_login, image) FROM stdin;
1	user1	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user1@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
2	user2	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user2@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
3	user3	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user3@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
4	user4	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user4@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
5	user5	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user5@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
6	user6	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user6@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
7	user7	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user7@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
8	user8	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user8@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
9	user9	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user9@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
10	user10	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user10@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
11	user11	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user11@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
12	user12	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user12@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
13	user13	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user13@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
14	user14	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user14@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
15	user15	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user15@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
16	user16	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user16@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
17	user17	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user17@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
18	user18	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user18@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
19	user19	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user19@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
20	user20	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user20@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
21	user21	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user21@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
22	user22	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user22@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
23	user23	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user23@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
24	user24	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user24@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
25	user25	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user25@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
26	user26	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user26@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
27	user27	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user27@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
28	user28	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user28@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
29	user29	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user29@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
30	user30	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user30@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
31	user31	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user31@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
32	user32	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user32@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
33	user33	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user33@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
34	user34	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user34@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
35	user35	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user35@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
36	user36	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user36@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
37	user37	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user37@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
38	user38	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user38@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
39	user39	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user39@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
40	user40	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user40@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
41	user41	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user41@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
42	user42	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user42@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
43	user43	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user43@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
44	user44	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user44@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
45	user45	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user45@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
46	user46	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user46@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
47	user47	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user47@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
48	user48	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user48@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
49	user49	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user49@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
50	user50	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user50@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
51	user51	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user51@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
52	user52	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user52@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
53	user53	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user53@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
54	user54	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user54@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
55	user55	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user55@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
56	user56	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user56@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
57	user57	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user57@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
58	user58	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user58@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
59	user59	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user59@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
60	user60	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user60@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
61	user61	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user61@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
62	user62	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user62@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
63	user63	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user63@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
64	user64	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user64@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
65	user65	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user65@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
66	user66	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user66@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
67	user67	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user67@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
68	user68	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user68@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
69	user69	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user69@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
70	user70	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user70@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
71	user71	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user71@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
72	user72	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user72@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
73	user73	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user73@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
74	user74	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user74@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
75	user75	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user75@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
76	user76	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user76@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
77	user77	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user77@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
78	user78	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user78@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
79	user79	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user79@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
80	user80	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user80@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
81	user81	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user81@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
82	user82	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user82@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
83	user83	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user83@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
84	user84	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user84@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
85	user85	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user85@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
86	user86	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user86@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
87	user87	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user87@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
88	user88	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user88@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
89	user89	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user89@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
90	user90	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user90@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
91	user91	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user91@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
92	user92	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user92@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
93	user93	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user93@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
94	user94	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user94@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
95	user95	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user95@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
96	user96	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user96@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
97	user97	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user97@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
98	user98	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user98@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
99	user99	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user99@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
100	user100	$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW	user100@hotmail.com	2020-05-14 20:03:56.025651	\N	https://static.productionready.io/images/smiley-cyrus.jpg
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-2.pgdg90+1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-2.pgdg90+1)

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

