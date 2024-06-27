--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

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
-- Name: articles; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    excerpt text NOT NULL,
    body text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.articles OWNER TO dschool;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: dschool
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO dschool;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dschool
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    start_at date NOT NULL,
    exam_date date,
    timetable json NOT NULL,
    hours_start_at time(0) without time zone NOT NULL,
    hours_finish_at time(0) without time zone NOT NULL,
    status smallint NOT NULL,
    category smallint NOT NULL,
    price smallint NOT NULL,
    price_for_students smallint NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.groups OWNER TO dschool;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: dschool
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO dschool;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dschool
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO dschool;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: dschool
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO dschool;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dschool
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id integer,
    client_id integer NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_access_tokens OWNER TO dschool;

--
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id integer NOT NULL,
    client_id integer NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_auth_codes OWNER TO dschool;

--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.oauth_clients (
    id integer NOT NULL,
    user_id integer,
    name character varying(255) NOT NULL,
    secret character varying(100) NOT NULL,
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_clients OWNER TO dschool;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: dschool
--

CREATE SEQUENCE public.oauth_clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_clients_id_seq OWNER TO dschool;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dschool
--

ALTER SEQUENCE public.oauth_clients_id_seq OWNED BY public.oauth_clients.id;


--
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.oauth_personal_access_clients (
    id integer NOT NULL,
    client_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_personal_access_clients OWNER TO dschool;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: dschool
--

CREATE SEQUENCE public.oauth_personal_access_clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_personal_access_clients_id_seq OWNER TO dschool;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dschool
--

ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNED BY public.oauth_personal_access_clients.id;


--
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO dschool;

--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.password_resets (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO dschool;

--
-- Name: password_resets_id_seq; Type: SEQUENCE; Schema: public; Owner: dschool
--

CREATE SEQUENCE public.password_resets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.password_resets_id_seq OWNER TO dschool;

--
-- Name: password_resets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dschool
--

ALTER SEQUENCE public.password_resets_id_seq OWNED BY public.password_resets.id;


--
-- Name: personal_trainings; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.personal_trainings (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    status smallint NOT NULL,
    category smallint NOT NULL,
    price smallint NOT NULL,
    price_for_students smallint NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.personal_trainings OWNER TO dschool;

--
-- Name: personal_trainings_id_seq; Type: SEQUENCE; Schema: public; Owner: dschool
--

CREATE SEQUENCE public.personal_trainings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_trainings_id_seq OWNER TO dschool;

--
-- Name: personal_trainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dschool
--

ALTER SEQUENCE public.personal_trainings_id_seq OWNED BY public.personal_trainings.id;


--
-- Name: presentations; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.presentations (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "order" smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.presentations OWNER TO dschool;

--
-- Name: presentations_id_seq; Type: SEQUENCE; Schema: public; Owner: dschool
--

CREATE SEQUENCE public.presentations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presentations_id_seq OWNER TO dschool;

--
-- Name: presentations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dschool
--

ALTER SEQUENCE public.presentations_id_seq OWNED BY public.presentations.id;


--
-- Name: slides; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.slides (
    id integer NOT NULL,
    presentation_id integer NOT NULL,
    "order" smallint NOT NULL,
    image_src character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.slides OWNER TO dschool;

--
-- Name: slides_id_seq; Type: SEQUENCE; Schema: public; Owner: dschool
--

CREATE SEQUENCE public.slides_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slides_id_seq OWNER TO dschool;

--
-- Name: slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dschool
--

ALTER SEQUENCE public.slides_id_seq OWNED BY public.slides.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: dschool
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255),
    phone character varying(255) NOT NULL,
    mail_exists boolean,
    email character varying(255),
    email_verified_at timestamp(0) without time zone,
    password character varying(255),
    active boolean DEFAULT false NOT NULL,
    activation_token character varying(255),
    avatar character varying(255) DEFAULT 'avatar.png'::character varying NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    group_id integer NOT NULL,
    group_type integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.users OWNER TO dschool;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dschool
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO dschool;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dschool
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: oauth_clients id; Type: DEFAULT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.oauth_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_clients_id_seq'::regclass);


--
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_personal_access_clients_id_seq'::regclass);


--
-- Name: password_resets id; Type: DEFAULT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.password_resets ALTER COLUMN id SET DEFAULT nextval('public.password_resets_id_seq'::regclass);


--
-- Name: personal_trainings id; Type: DEFAULT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.personal_trainings ALTER COLUMN id SET DEFAULT nextval('public.personal_trainings_id_seq'::regclass);


--
-- Name: presentations id; Type: DEFAULT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.presentations ALTER COLUMN id SET DEFAULT nextval('public.presentations_id_seq'::regclass);


--
-- Name: slides id; Type: DEFAULT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.slides ALTER COLUMN id SET DEFAULT nextval('public.slides_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.articles (id, title, excerpt, body, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.groups (id, name, description, start_at, exam_date, timetable, hours_start_at, hours_finish_at, status, category, price, price_for_students, is_active, created_at, updated_at, deleted_at) FROM stdin;
5	058	группа выходного дня	2019-03-24	\N	["Воскресенье"]	10:30:00	14:20:00	3	1	25000	23000	t	2019-02-11 12:58:16	2019-03-29 10:57:42	\N
4	В 057	Вечернее обучение	2019-03-18	\N	["Понедельник","Среда"]	18:30:00	21:00:00	3	1	25000	23000	t	2019-02-08 11:59:26	2019-03-29 10:58:06	\N
8	В 060	группа выходного обучения	2019-06-01	\N	["Суббота"]	10:30:00	14:15:00	3	1	25000	23000	t	2019-03-29 11:03:49	2019-05-27 06:21:48	\N
7	В 061	вечернее обучени	2019-08-20	\N	["Вторник","Четверг"]	18:30:00	21:00:00	3	1	25000	23000	t	2019-03-29 11:01:56	2019-05-27 06:22:53	\N
1	B 054	Вечернее обучение	2019-02-07	\N	["Вторник","Четверг"]	18:30:00	21:00:00	3	1	25000	23000	t	2018-12-03 23:21:37	2019-02-12 06:46:22	\N
6	test	test	2019-02-06	\N	["Вторник"]	11:11:00	11:11:00	3	1	25000	23000	t	2019-02-17 05:59:16	2019-02-17 05:59:23	2019-02-17 05:59:23
2	B 053	Группа выходного дня	2019-03-17	\N	["Суббота"]	10:30:00	14:10:00	3	1	25000	23000	t	2018-12-03 23:21:37	2019-03-12 11:45:14	\N
11	0062	вечернее обучение	2019-08-26	\N	["Понедельник", "Среда"]	18:30:00	21:00:00	1	2	25000	23000	t	2019-06-25 12:19:53	2019-06-25 12:19:53	\N
12	0063	вечернее обучение	2019-08-27	\N	["Вторник", "Четверг"]	18:30:00	21:00:00	1	2	25000	23000	t	2019-06-25 12:19:53	2019-06-25 12:19:53	\N
13	0064	вечернее обучение	2019-08-30	\N	["Пятница"]	17:00:00	21:00:00	1	2	25000	23000	t	2019-06-25 12:19:53	2019-06-25 12:19:53	\N
14	0065	обучение по выходным	2019-08-24	\N	["Суббота"]	10:30:00	14:15:00	1	2	25000	23000	t	2019-06-25 12:19:53	2019-06-25 12:19:53	\N
15	0066	обучение по выходным	2019-08-25	\N	["Воскресенье"]	10:30:00	14:15:00	1	2	25000	23000	t	2019-06-25 12:19:54	2019-06-25 12:19:54	\N
3	0006	Переподготовка с В на С	2019-08-30	\N	["Суббота"]	18:30:00	21:00:00	1	2	21000	19000	t	2018-12-03 23:21:37	2019-05-22 10:00:02	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2016_06_01_000001_create_oauth_auth_codes_table	1
4	2016_06_01_000002_create_oauth_access_tokens_table	1
5	2016_06_01_000003_create_oauth_refresh_tokens_table	1
6	2016_06_01_000004_create_oauth_clients_table	1
7	2016_06_01_000005_create_oauth_personal_access_clients_table	1
8	2018_09_17_133719_create_groups_table	1
9	2018_09_17_141047_create_articles_table	1
10	2018_09_17_141057_create_presentations_table	1
11	2018_09_17_141058_create_slides_table	1
12	2018_09_17_150231_add_group_reference_to_users_table	1
13	2019_02_16_081400_create_personal_training_table	2
14	2019_02_16_083914_add_group_type_to_users_table	2
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
d55f606931bf31f333d74c2f07a2ed9c437b75bb78df199fbbbfcbbb38b6cbb74175f938bdf5e083	1	8	Personal Access Token	[]	f	2019-06-14 19:42:45	2019-06-14 19:42:45	2020-06-14 19:42:45
30fb67f23171677b1f0ee58e27f5f2a75bb75d5ad7b230d93af4cf70a61e3c90f0799f06237414e3	1	8	Personal Access Token	[]	t	2019-05-22 07:49:24	2019-05-22 07:49:24	2020-05-22 07:49:24
43323390313a3ea571557ec5e6aa2f034c57079fb68e1966e6f20ac8bee668b0bd5fe4498b1309d0	1	8	Personal Access Token	[]	f	2019-05-22 08:04:46	2019-05-22 08:04:46	2020-05-22 08:04:46
6ff9122f98992456def2d1da10d3b7d4baf35f15e8ae00a81cc34fabd6e0c8c6f8f41d27aa4bb736	1	8	Personal Access Token	[]	f	2019-05-22 11:41:30	2019-05-22 11:41:30	2020-05-22 11:41:30
3b4ba918326ec4b1d0a2281276fd4a5d0ca1f4da463fd55e098776d9511bdfe3f03802fb1fea9df1	1	8	Personal Access Token	[]	f	2019-05-22 12:08:31	2019-05-22 12:08:31	2020-05-22 12:08:31
3b32b3621234836a4b979965a92b38aa78befff4316100031658fecd6a842c885e8166859737476d	1	8	Personal Access Token	[]	f	2019-05-22 19:02:27	2019-05-22 19:02:27	2020-05-22 19:02:27
4f29f6c5e645ef1565beb334903c833bbec2072931634fe2977ebdcb51ed0f474c963d59a5ca0003	1	8	Personal Access Token	[]	f	2019-06-17 08:41:21	2019-06-17 08:41:21	2020-06-17 08:41:21
c6318c5b2381d4e23a0336e59adb7a8550ed091dc1340e40f70ddd2eefac773b3fa047be506ab8c7	1	8	Personal Access Token	[]	t	2019-05-24 18:48:29	2019-05-24 18:48:29	2020-05-24 18:48:29
45127eda9cb07f47831bd5d0cc1d1cbf8e9c8a8ec22121f522014d3380fad0786b6336a919888f9a	1	8	Personal Access Token	[]	t	2019-05-22 08:10:17	2019-05-22 08:10:17	2020-05-22 08:10:17
107fe5619d34151ef9a49e1a8c90e9db5d97d16b6865a7af2ffc6591b58cb7e0819c0250d3178c02	1	8	Personal Access Token	[]	f	2019-05-27 06:26:31	2019-05-27 06:26:31	2020-05-27 06:26:31
970d14a9827c803dc34bc9cbf4dab2cf54304eab3e040571ab6fbac2d2e2fc4b295869ab23a7fdf6	1	8	Personal Access Token	[]	f	2019-05-28 17:30:31	2019-05-28 17:30:31	2020-05-28 17:30:31
2491b684a56653994d85153822da4430831af19169a2a9fda4be46f1dbe94634f846d10bb54b5559	1	8	Personal Access Token	[]	t	2019-05-28 22:06:10	2019-05-28 22:06:10	2020-05-28 22:06:10
0061e82c96b8b4e5b46180e539c67e3c4b0d975efb0c114a6b56d248a6187b8b1ab578e38e08b153	1	8	Personal Access Token	[]	f	2019-05-30 06:39:02	2019-05-30 06:39:02	2020-05-30 06:39:02
ce4487c660f70f42d255b3fd358161ca0a3cb394fe9427aca58029aa22351c53351558dfbdc51537	1	8	Personal Access Token	[]	f	2019-05-30 06:46:05	2019-05-30 06:46:05	2020-05-30 06:46:05
0c137c834c7244beb6bba2157be9f4c4f4cba8a991f396c38940e8aafc3ed7712bd0cf418cef371a	1	8	Personal Access Token	[]	f	2019-05-30 14:42:33	2019-05-30 14:42:33	2020-05-30 14:42:33
4a62030c93103f0a26c78b21b480c409c174de58e96e2ae8745d08e659570e9ab4a029f7b02b9624	1	8	Personal Access Token	[]	f	2019-06-18 06:28:47	2019-06-18 06:28:47	2020-06-18 06:28:47
6f56e25aeaeb2c655c78534ddda046aa113478f1f5391ad3279a1d8aea71a7158a65822c61bc9b0a	1	8	Personal Access Token	[]	t	2019-06-02 07:16:42	2019-06-02 07:16:42	2020-06-02 07:16:42
807066f8be8371907117c693df6948d3c91efbf0f0d006901c030f7afa0dd4f2a4f92520f7b146f1	1	8	Personal Access Token	[]	t	2019-06-03 16:12:52	2019-06-03 16:12:52	2020-06-03 16:12:52
e8d1b68fa3b9211c99e188e016c0e85c92efc2304bbbf2b8cafc788530085a5b7438824074778f48	1	8	Personal Access Token	[]	f	2019-06-19 03:26:31	2019-06-19 03:26:31	2020-06-19 03:26:31
34dec8f756541a2be4352859b0b44900a28caa5fc96e5be76f30693fd9de248f608c628e2354df1a	1	8	Personal Access Token	[]	t	2019-06-13 19:06:56	2019-06-13 19:06:56	2020-06-13 19:06:56
1ce0771be6668f4f70b21a71fa962365da00b609e5a58371c686b4ff1ae6fbceceaae8be7353337d	1	8	Personal Access Token	[]	t	2019-06-13 19:07:32	2019-06-13 19:07:32	2020-06-13 19:07:32
8d86d2d89a27e4954e01556634c3e46e6851389b1be7a27ec13b737657df34b127263906839ba3b1	1	8	Personal Access Token	[]	f	2019-06-19 03:59:06	2019-06-19 03:59:06	2020-06-19 03:59:06
32f30e5b5d76e4245d67814871bf81f3916f0d4726cdfc32bd2fd1919284b922b663663c4639560c	1	8	Personal Access Token	[]	f	2019-06-19 06:28:59	2019-06-19 06:28:59	2020-06-19 06:28:59
8d0a1ce39b3d7e012867142263a1c82282a022aacac78ccf712bb1c6500ede9f028e9ae736dc387b	1	8	Personal Access Token	[]	t	2019-07-02 08:15:08	2019-07-02 08:15:08	2020-07-02 08:15:08
d60ea25bfff5007fd0f5f3d1ed0b0994e8cd39c6670eff6cbb453afa713d50ca372c908eef09f6cb	1	8	Personal Access Token	[]	t	2019-06-19 17:38:36	2019-06-19 17:38:36	2020-06-19 17:38:36
cbb2bcb0ed665ec378129869f8294d07e3dcf56817b373e33c2fcf43075107945dd6c41856ef7461	1	8	Personal Access Token	[]	f	2019-06-20 06:49:38	2019-06-20 06:49:38	2020-06-20 06:49:38
0a1905f43829355e98ca4f93fca7011f607f3df75ea387a6d9072e6c1ccdb51599b0509e579fbedc	1	8	Personal Access Token	[]	f	2019-06-25 14:18:42	2019-06-25 14:18:42	2020-06-25 14:18:42
5886e2f54ca7eb42a5dbf486708175131f4b1156bce6dc98b5194351b43ed3269499a3b9c4d0e2bb	1	8	Personal Access Token	[]	t	2019-05-22 11:42:23	2019-05-22 11:42:23	2020-05-22 11:42:23
d38561817a3f564a7f43be2c4236fa3ccc26ec9dd61eea30ec8e9ddadb2d9ac4e8f3db6eb8337a44	1	8	Personal Access Token	[]	f	2019-07-02 06:37:48	2019-07-02 06:37:48	2020-07-02 06:37:48
64e337c54bfc117d86bec1072e6a404bbe9c773b832e82934e52af441b0d94c6798af1fc87e60898	1	8	Personal Access Token	[]	t	2019-07-02 08:12:17	2019-07-02 08:12:17	2020-07-02 08:12:17
d64c5aa6e19ef93c434f0dc51dfcae5bfc9a86deedc81908e5610bdeb111ecdf9d9439871097bb09	1	8	Personal Access Token	[]	t	2019-07-19 14:56:14	2019-07-19 14:56:14	2020-07-19 14:56:14
4f51e90bfd5feaabf87330a00b3235a31c19324cb4f09e7db215f96bbe09e540ee1eb9ce041a77e8	1	10	Personal Access Token	[]	t	2024-01-24 16:05:49	2024-01-24 16:05:49	2025-01-24 16:05:49
18c838ab4beab905d2bac17727a00c33051fa11f6b7cb0234d7456122a7d2a2c5fc5d951c3ec00e0	1	10	Personal Access Token	[]	t	2023-11-04 17:33:02	2023-11-04 17:33:02	2024-11-04 17:33:02
76183f87316727aee940bd506b6d5adf3269a1d113eae6744b42231a52b5d863cb28f8bf8eab380e	1	10	Personal Access Token	[]	t	2023-11-04 17:33:26	2023-11-04 17:33:26	2024-11-04 17:33:26
463a43b2660bdeb150e42233ca1d755d649bc82bb44f194e701ab0e35f695a73891ddca0c3a7d02c	1	10	Personal Access Token	[]	t	2024-01-24 16:04:19	2024-01-24 16:04:19	2025-01-24 16:04:19
7552b7e548830dfcf4b03e47f62daa6fe094d496857b55942e7ffce77d401213c9647c8f8f4c75f8	1	10	Personal Access Token	[]	f	2024-01-24 16:34:43	2024-01-24 16:34:43	2025-01-24 16:34:43
b07ac5121060fb8694e08698ab4ebdac11676dd2f863b76b56b218419fec8c458960c222762a15a5	1	10	Personal Access Token	[]	t	2024-01-24 16:35:29	2024-01-24 16:35:29	2025-01-24 16:35:29
496d6e70df9063730797fe77fdc36f65a6bcce2c469e3741d9aca6f5c0c60b0b9529152b63f67b1c	1	10	Personal Access Token	[]	f	2024-01-24 16:41:30	2024-01-24 16:41:30	2025-01-24 16:41:30
\.


--
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.oauth_clients (id, user_id, name, secret, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
8	\N	Автошкола БГТУ "ВОЕНМЕХ" Personal Access Client	V15ZvzFJ3s4SXCzvgnNAsUI5qV347V1BjoVA6ivo	http://localhost	t	f	f	2019-05-22 07:45:57	2019-05-22 07:45:57
9	\N	Автошкола БГТУ "ВОЕНМЕХ" Password Grant Client	wngkjJSKZIWg89UtEFgkdwKsd4NNvIkopVj7VqDP	http://localhost	f	t	f	2019-05-22 07:45:57	2019-05-22 07:45:57
10	\N	Laravel Personal Access Client	0xC3KmmwhJC6WSY8aQo1yprtJATu3OTLXaIXhb4P	http://localhost	t	f	f	2023-11-04 17:32:51	2023-11-04 17:32:51
11	\N	Laravel Password Grant Client	w6Yi92pUmnNuWpE2Dl41tjiU3DS711WFgORoIlWe	http://localhost	f	t	f	2023-11-04 17:32:51	2023-11-04 17:32:51
\.


--
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	1	2019-01-11 23:30:49	2019-01-11 23:30:49
2	3	2019-05-22 07:15:36	2019-05-22 07:15:36
3	5	2019-05-22 07:15:50	2019-05-22 07:15:50
4	8	2019-05-22 07:45:57	2019-05-22 07:45:57
5	10	2023-11-04 17:32:51	2023-11-04 17:32:51
\.


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.password_resets (id, email, token, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: personal_trainings; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.personal_trainings (id, name, description, status, category, price, price_for_students, is_active, created_at, updated_at, deleted_at) FROM stdin;
1	test	test	1	1	1000	800	t	2019-02-17 05:58:44	2019-02-17 05:58:44	\N
\.


--
-- Data for Name: presentations; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.presentations (id, title, description, "order", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: slides; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.slides (id, presentation_id, "order", image_src, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dschool
--

COPY public.users (id, name, surname, phone, mail_exists, email, email_verified_at, password, active, activation_token, avatar, remember_token, created_at, updated_at, deleted_at, group_id, group_type) FROM stdin;
149	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-07-08 15:09:44	2019-07-08 15:10:10	\N	11	1
4	Иван	Иванов	123456789	\N	\N	\N	\N	f	Y9b509rzLssmlh9zPLf4xSj35jUhGp0sjzBAQenBCMJamL0iJqnTWPv5kbok	avatar.png	\N	2019-01-13 08:07:23	2019-01-13 08:07:23	\N	1	1
5	Иван	Иванов	123456789	\N	\N	\N	\N	f	SmqhE6lGt9dRktxl8KhlspgLadFyIOEdxnO1JFNmtbmkLZN8hVg8s3PYZxXX	avatar.png	\N	2019-01-14 07:31:58	2019-01-14 07:31:58	\N	1	1
27	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-01-18 18:20:07	2019-01-18 21:37:28	\N	2	1
6	Иван	Иванов	123456789	\N	\N	\N	\N	f	moKwEvWtqLYskUJg8QEEcyrNk78cfwYz1afUm7Bry9CAV1IX2RhTfEp0w61u	avatar.png	\N	2019-01-14 15:53:02	2019-01-14 15:53:02	\N	1	1
7	Иван	Иванов	123456789	\N	\N	\N	\N	f	wWkkix27JEqzRMmFT3GTDJKmXvTcBD2dHsK3W4EnRLVBRsGhwm2ciPyG4oEW	avatar.png	\N	2019-01-15 12:33:13	2019-01-15 12:33:13	\N	1	1
140	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-20 13:21:44	2019-05-20 13:24:43	\N	8	1
143	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-29 17:24:07	2019-06-07 08:37:11	\N	8	1
147	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-06-30 23:37:09	2019-06-30 23:39:03	\N	11	1
150	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-07-14 13:18:50	2019-07-14 13:19:23	\N	15	1
75	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-16 17:15:53	2019-02-16 17:16:18	\N	5	1
80	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-26 04:52:27	2019-02-26 04:59:58	\N	4	1
144	Иван	Иванов	123456789	\N	\N	\N	\N	f	snP3dlQd65gTOYAnToOkwgnlaCZwPeOB559eud98u7Nc0ixEatWMWOgFez3U	avatar.png	\N	2019-06-03 13:19:09	2019-06-03 13:19:09	\N	8	1
8	Иван	Иванов	123456789	\N	\N	\N	\N	f	KywOWTdymca4O9NvAvh8tLEzCGIsJyW33Y1SeIFPEfEZf918cSEhTIFJgNDP	avatar.png	\N	2019-01-15 17:06:14	2019-01-16 07:00:53	\N	1	1
29	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-01-20 09:03:10	2019-01-20 09:41:55	\N	1	1
20	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-01-18 09:47:34	2019-01-20 16:58:36	\N	2	1
43	Иван	Иванов	123456789	\N	\N	\N	\N	f	JHwyaMogjJeftlmgl1GHgTvZA1boMNBb6ZxSogrH4myc72joSTgBFgTr2Af5	avatar.png	\N	2019-01-24 09:06:03	2019-01-24 09:06:03	\N	1	1
30	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-01-20 18:35:31	2019-01-20 18:36:48	\N	2	1
31	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-01-20 18:36:23	2019-01-20 18:39:30	\N	2	1
25	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-01-18 12:25:47	2019-01-18 12:26:10	\N	2	1
26	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-01-18 15:39:42	2019-01-18 17:25:37	\N	2	1
42	Иван	Иванов	123456789	\N	\N	\N	\N	f	gwpiwCtrFsjGbmVzzHrUKQs8hTzjHfb52C8MngTQO0hk54MD1PvF5gJR8NLR	avatar.png	\N	2019-01-24 05:58:38	2019-01-24 08:58:57	\N	2	1
45	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-01-24 11:23:54	2019-01-24 11:25:32	\N	1	1
44	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-01-24 10:39:24	2019-01-24 15:44:06	\N	1	1
46	Иван	Иванов	123456789	\N	\N	\N	\N	f	3wnaLejHYsjpSrdNU99WYBgzYjTPjB6auVvd0wdxeq3vTHAUSKNsx9W4Gp82	avatar.png	\N	2019-01-24 17:27:50	2019-01-25 09:45:08	\N	1	1
47	Иван	Иванов	123456789	\N	\N	\N	\N	f	iJLg4d0nN5aDpeGdwpeMW6GBFyH7UZXX41YKozLayNtybDqJNd8WVJNhLdFz	avatar.png	\N	2019-01-29 10:44:47	2019-01-29 13:04:34	\N	2	1
49	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-01 15:10:53	2019-02-01 16:37:10	\N	2	1
50	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-02 06:32:57	2019-02-02 08:34:59	\N	2	1
51	Иван	Иванов	123456789	\N	\N	\N	\N	f	jo31DZW0w8naoFsTwyiQwLpBDoxcmrgbtvbRABNYMA8mu2y6U9JWlM7azwoj	avatar.png	\N	2019-02-02 10:15:45	2019-02-02 10:15:45	\N	2	1
52	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-04 07:14:28	2019-02-04 07:14:43	\N	2	1
53	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-04 13:12:00	2019-02-04 13:12:24	\N	2	1
54	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-05 05:34:36	2019-02-05 05:37:04	\N	1	1
55	Иван	Иванов	123456789	\N	\N	\N	\N	f	1g5Y7Dn4zaiM4E7YjJQbVWHG8xh37MFMjLffg0wIJzC7D8QIdnObq5kS7mnF	avatar.png	\N	2019-02-05 08:06:20	2019-02-05 08:06:20	\N	2	1
1	Иван	Иванов	123456789	\N	\N	\N	$2y$10$aMXGq2q5Pr5WZLkoHFVi.elVJiB3Z9yZb3.P1lOsNVHMhmkp7n/OS	f	\N	avatar.png	\N	\N	2023-11-04 17:33:26	\N	1	1
57	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-06 14:11:18	2019-02-06 14:22:26	\N	1	1
58	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-06 14:19:38	2019-02-06 14:24:10	\N	1	1
48	Иван	Иванов	123456789	\N	\N	\N	\N	f	94fvGHAbS1xSo3pb9SyRO91vKSTvJiAuY5hP7UjKJ80JH6MhUJa6kLExZcXR	avatar.png	\N	2019-02-01 07:28:02	2019-02-07 10:24:29	\N	2	1
60	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-07 10:32:20	2019-02-07 10:32:47	\N	2	1
59	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-07 09:09:33	2019-02-07 15:32:03	\N	1	1
61	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-07 19:02:23	2019-02-08 02:33:25	\N	1	1
63	Иван	Иванов	123456789	\N	\N	\N	\N	f	ZlQdfhiqXMIiUrFSbUF4aAvcmIscA4Kq6cYC5yp1Dmqcwwt6MkcGa0gb4lEi	avatar.png	\N	2019-02-08 11:43:15	2019-02-08 11:43:15	\N	1	1
62	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-08 09:00:10	2019-02-08 17:10:23	\N	2	1
64	Иван	Иванов	123456789	\N	\N	\N	\N	f	QYAIjWho4XazMOS0vhUWTI67QwX9bCvydwsYvRXwZNoERXzrKJgUr8K4pTvM	avatar.png	\N	2019-02-08 21:35:21	2019-02-08 21:35:21	\N	1	1
67	Иван	Иванов	123456789	\N	\N	\N	\N	f	HfZNLNvknR9NrT8hLwFuCapMhSwxnbCFNHPlkV1macQd2RIJmAPPtDSCkJmD	avatar.png	\N	2019-02-11 14:40:03	2019-02-11 14:40:03	\N	1	1
68	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-12 22:33:12	2019-02-13 08:58:12	\N	4	1
69	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-13 10:51:06	2019-02-13 10:53:35	\N	4	1
70	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-13 11:46:33	2019-02-13 11:53:19	\N	5	1
72	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-13 19:45:16	2019-02-14 10:13:26	\N	4	1
74	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-16 14:13:04	2019-02-16 14:16:14	\N	4	1
73	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-14 07:28:28	2019-03-01 07:08:51	\N	5	1
79	Иван	Иванов	123456789	\N	\N	\N	\N	f	cV8kntUv1zA8sJUk0hiqo00AwMMUOBhBZzWMTgYk4phAfSHwtVu22WkzeQ3j	avatar.png	\N	2019-02-25 17:30:35	2019-02-25 17:30:35	\N	4	1
81	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-26 07:00:33	2019-02-26 07:01:03	\N	5	1
82	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-26 07:45:12	2019-02-26 07:45:33	\N	4	1
83	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-26 13:23:47	2019-02-26 13:33:18	\N	5	1
84	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-26 14:37:52	2019-02-26 14:38:19	\N	5	1
85	Иван	Иванов	123456789	\N	\N	\N	\N	f	vNFrHg5W5QBpDSP98Xbg27mdswdZBcsvLKDme6LLkyg33yFbzn02nQ6a0bT2	avatar.png	\N	2019-02-26 15:47:01	2019-02-26 15:47:01	\N	4	1
86	Иван	Иванов	123456789	\N	\N	\N	\N	f	FIfWyvvJUT7x8lITk6cv2NalKMdMNBTCy2WEnUQBEZ7HFAyrYCbP9bzochtl	avatar.png	\N	2019-02-27 07:40:28	2019-02-27 07:40:28	\N	4	1
87	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-27 19:58:19	2019-02-27 19:59:58	\N	5	1
56	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-05 18:30:49	2019-02-05 20:51:27	\N	1	1
102	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-05 12:25:07	2019-03-05 12:32:15	\N	4	1
88	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-02-28 19:56:11	2019-03-02 21:26:00	\N	5	1
137	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-14 16:35:18	2019-05-14 19:39:18	\N	8	1
141	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-21 16:27:37	2019-05-25 07:58:03	\N	8	1
97	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-03 15:18:47	2019-03-03 15:18:58	\N	5	1
98	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-04 07:31:00	2019-03-04 10:21:24	\N	5	1
100	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-04 19:49:56	2019-03-04 19:50:27	\N	5	1
99	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-04 12:10:21	2019-03-05 05:02:02	\N	4	1
104	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-06 21:10:51	2019-03-07 10:18:49	\N	4	1
105	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-10 12:44:17	2019-03-10 12:44:36	\N	4	1
106	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-10 15:26:34	2019-03-10 15:38:01	\N	5	1
109	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-11 11:41:06	2019-03-11 12:03:51	\N	4	1
108	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-11 11:06:00	2019-03-11 13:33:27	\N	4	1
110	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-11 19:11:32	2019-03-11 19:12:31	\N	5	1
112	Иван	Иванов	123456789	\N	\N	\N	\N	f	AsOvhznbZKVXDrtmJP55SM5unYfXInBAVIclGEtY2mxJbf0CYeh6E1n9KiEE	avatar.png	\N	2019-03-13 18:41:02	2019-03-13 18:41:02	\N	5	1
111	Иван	Иванов	123456789	\N	\N	\N	\N	f	5XAhwieW8hqmImlhWVmogNTGBqVM7uPteNZahk2wA1KMypCjA8DiXZtDJGWv	avatar.png	\N	2019-03-11 21:21:28	2019-03-14 06:15:30	2019-03-14 06:15:30	4	1
113	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-15 06:51:32	2019-03-15 06:55:47	\N	4	1
114	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-19 07:48:55	2019-03-19 07:51:13	\N	5	1
115	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-19 07:50:52	2019-03-19 07:52:28	\N	5	1
120	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-21 15:02:15	2019-03-21 15:03:07	\N	4	1
121	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-27 05:17:52	2019-03-27 05:18:50	\N	5	1
122	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-30 11:45:52	2019-03-30 11:46:21	\N	8	1
116	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-19 18:13:55	2019-04-04 15:09:40	\N	4	1
124	Иван	Иванов	123456789	\N	\N	\N	\N	f	xx5tfetp8WYXm9c15hKCFhvu14rlXu6R0Zi1QXv1URpNxjxDz890Vt6Xph6k	avatar.png	\N	2019-04-08 12:32:04	2019-04-08 12:32:04	\N	8	1
125	Иван	Иванов	123456789	\N	\N	\N	\N	f	vZ8vNZbjmpwnF9GG7PfLZbxIGHeNilgtBHVLukNfDwRdZbBCbup8Mo3Ib2E1	avatar.png	\N	2019-04-09 13:22:08	2019-04-09 13:22:08	\N	8	1
101	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-05 08:47:02	2019-06-14 08:56:53	\N	4	1
126	Иван	Иванов	123456789	\N	\N	\N	\N	f	Ub1cRjwFXrof3ja2LTDns6sxf8elUkRO1OumAyddsoPzXFSb0TOFXlHSeTmq	avatar.png	\N	2019-04-09 13:23:00	2019-04-09 13:23:00	\N	8	1
127	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-04-09 14:51:55	2019-04-09 15:00:57	\N	8	1
129	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-04-13 09:00:09	2019-04-13 09:06:15	\N	8	1
128	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-04-13 08:59:52	2019-04-13 09:06:47	\N	8	1
145	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-06-20 14:47:48	2019-06-20 19:30:48	\N	8	1
148	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-07-01 14:27:17	2019-07-01 14:27:42	\N	12	1
119	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-03-20 05:09:39	2019-07-01 16:16:53	\N	5	1
151	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-07-16 13:58:13	2019-07-16 13:58:55	\N	14	1
139	Иван	Иванов	123456789	\N	\N	\N	\N	f	EHmcHfRLdEWcFFLaw1YVZEVNZBeVk5znN94EveGNgHkgpeoHD84664RxIA62	avatar.png	\N	2019-05-20 09:26:31	2019-05-20 09:26:31	\N	8	1
142	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-28 07:46:18	2019-05-28 07:48:54	\N	8	1
146	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-06-30 17:00:10	2019-06-30 17:00:33	\N	13	1
28	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-01-18 18:56:59	2019-01-18 18:57:24	\N	2	1
130	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-04-17 14:38:16	2019-04-17 14:38:45	\N	8	1
131	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-04-21 09:59:43	2019-04-21 10:00:03	\N	8	1
123	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-04-07 05:23:16	2019-04-23 11:13:00	\N	8	1
133	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-01 14:33:50	2019-05-01 14:35:57	\N	7	1
132	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-01 14:30:47	2019-05-01 15:51:38	\N	7	1
135	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-08 08:29:25	2019-05-08 08:29:46	\N	7	1
134	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-01 16:08:35	2019-05-08 12:53:56	\N	8	1
136	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-14 09:55:30	2019-05-14 09:55:55	\N	7	1
138	Иван	Иванов	123456789	\N	\N	\N	\N	t		avatar.png	\N	2019-05-16 12:08:51	2019-05-16 12:09:03	\N	8	1
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dschool
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, false);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dschool
--

SELECT pg_catalog.setval('public.groups_id_seq', 15, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dschool
--

SELECT pg_catalog.setval('public.migrations_id_seq', 14, true);


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dschool
--

SELECT pg_catalog.setval('public.oauth_clients_id_seq', 11, true);


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dschool
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 5, true);


--
-- Name: password_resets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dschool
--

SELECT pg_catalog.setval('public.password_resets_id_seq', 1, false);


--
-- Name: personal_trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dschool
--

SELECT pg_catalog.setval('public.personal_trainings_id_seq', 1, true);


--
-- Name: presentations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dschool
--

SELECT pg_catalog.setval('public.presentations_id_seq', 1, false);


--
-- Name: slides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dschool
--

SELECT pg_catalog.setval('public.slides_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dschool
--

SELECT pg_catalog.setval('public.users_id_seq', 151, true);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: password_resets password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (id);


--
-- Name: personal_trainings personal_trainings_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.personal_trainings
    ADD CONSTRAINT personal_trainings_pkey PRIMARY KEY (id);


--
-- Name: presentations presentations_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.presentations
    ADD CONSTRAINT presentations_pkey PRIMARY KEY (id);


--
-- Name: slides slides_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.slides
    ADD CONSTRAINT slides_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: dschool
--

CREATE INDEX oauth_access_tokens_user_id_index ON public.oauth_access_tokens USING btree (user_id);


--
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: dschool
--

CREATE INDEX oauth_clients_user_id_index ON public.oauth_clients USING btree (user_id);


--
-- Name: oauth_personal_access_clients_client_id_index; Type: INDEX; Schema: public; Owner: dschool
--

CREATE INDEX oauth_personal_access_clients_client_id_index ON public.oauth_personal_access_clients USING btree (client_id);


--
-- Name: oauth_refresh_tokens_access_token_id_index; Type: INDEX; Schema: public; Owner: dschool
--

CREATE INDEX oauth_refresh_tokens_access_token_id_index ON public.oauth_refresh_tokens USING btree (access_token_id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: dschool
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: slides slides_presentation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.slides
    ADD CONSTRAINT slides_presentation_id_foreign FOREIGN KEY (presentation_id) REFERENCES public.presentations(id);


--
-- Name: users users_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dschool
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_group_id_foreign FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- PostgreSQL database dump complete
--

