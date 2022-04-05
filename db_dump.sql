--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-05 08:54:25 UTC

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
-- TOC entry 232 (class 1259 OID 16576)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16575)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 231
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 234 (class 1259 OID 16585)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16584)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 233
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 230 (class 1259 OID 16569)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16568)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 229
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 236 (class 1259 OID 16592)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16601)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16600)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 237
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 235 (class 1259 OID 16591)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 235
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 240 (class 1259 OID 16608)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16607)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 239
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 242 (class 1259 OID 16667)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16666)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 241
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 228 (class 1259 OID 16560)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16559)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 227
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 226 (class 1259 OID 16551)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16550)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 225
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 243 (class 1259 OID 16696)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 16807)
-- Name: rooms_bed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_bed (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    width double precision NOT NULL,
    length double precision NOT NULL,
    height double precision NOT NULL,
    type character varying(5) NOT NULL
);


ALTER TABLE public.rooms_bed OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 16806)
-- Name: rooms_bed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_bed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_bed_id_seq OWNER TO postgres;

--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 268
-- Name: rooms_bed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_bed_id_seq OWNED BY public.rooms_bed.id;


--
-- TOC entry 271 (class 1259 OID 16816)
-- Name: rooms_bed_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_bed_rooms (
    id bigint NOT NULL,
    bed_id bigint NOT NULL,
    room_id bigint NOT NULL
);


ALTER TABLE public.rooms_bed_rooms OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 16815)
-- Name: rooms_bed_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_bed_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_bed_rooms_id_seq OWNER TO postgres;

--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 270
-- Name: rooms_bed_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_bed_rooms_id_seq OWNED BY public.rooms_bed_rooms.id;


--
-- TOC entry 265 (class 1259 OID 16791)
-- Name: rooms_chair; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_chair (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    width double precision NOT NULL,
    length double precision NOT NULL,
    height double precision NOT NULL,
    type character varying(5) NOT NULL
);


ALTER TABLE public.rooms_chair OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 16790)
-- Name: rooms_chair_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_chair_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_chair_id_seq OWNER TO postgres;

--
-- TOC entry 3823 (class 0 OID 0)
-- Dependencies: 264
-- Name: rooms_chair_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_chair_id_seq OWNED BY public.rooms_chair.id;


--
-- TOC entry 267 (class 1259 OID 16800)
-- Name: rooms_chair_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_chair_rooms (
    id bigint NOT NULL,
    chair_id bigint NOT NULL,
    room_id bigint NOT NULL
);


ALTER TABLE public.rooms_chair_rooms OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 16799)
-- Name: rooms_chair_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_chair_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_chair_rooms_id_seq OWNER TO postgres;

--
-- TOC entry 3824 (class 0 OID 0)
-- Dependencies: 266
-- Name: rooms_chair_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_chair_rooms_id_seq OWNED BY public.rooms_chair_rooms.id;


--
-- TOC entry 245 (class 1259 OID 16707)
-- Name: rooms_decoration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_decoration (
    id bigint NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.rooms_decoration OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16706)
-- Name: rooms_decoration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_decoration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_decoration_id_seq OWNER TO postgres;

--
-- TOC entry 3825 (class 0 OID 0)
-- Dependencies: 244
-- Name: rooms_decoration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_decoration_id_seq OWNED BY public.rooms_decoration.id;


--
-- TOC entry 263 (class 1259 OID 16784)
-- Name: rooms_decoration_souvenirs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_decoration_souvenirs (
    id bigint NOT NULL,
    decoration_id bigint NOT NULL,
    souvenir_id bigint NOT NULL
);


ALTER TABLE public.rooms_decoration_souvenirs OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 16783)
-- Name: rooms_decoration_souvenirs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_decoration_souvenirs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_decoration_souvenirs_id_seq OWNER TO postgres;

--
-- TOC entry 3826 (class 0 OID 0)
-- Dependencies: 262
-- Name: rooms_decoration_souvenirs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_decoration_souvenirs_id_seq OWNED BY public.rooms_decoration_souvenirs.id;


--
-- TOC entry 247 (class 1259 OID 16716)
-- Name: rooms_door; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_door (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    width double precision NOT NULL,
    length double precision NOT NULL,
    height double precision NOT NULL,
    type character varying(5) NOT NULL
);


ALTER TABLE public.rooms_door OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16715)
-- Name: rooms_door_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_door_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_door_id_seq OWNER TO postgres;

--
-- TOC entry 3827 (class 0 OID 0)
-- Dependencies: 246
-- Name: rooms_door_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_door_id_seq OWNED BY public.rooms_door.id;


--
-- TOC entry 249 (class 1259 OID 16725)
-- Name: rooms_room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_room (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    width double precision NOT NULL,
    length double precision NOT NULL,
    height double precision NOT NULL,
    type character varying(5) NOT NULL,
    decoration_id bigint,
    door_id bigint NOT NULL
);


ALTER TABLE public.rooms_room OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16724)
-- Name: rooms_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_room_id_seq OWNER TO postgres;

--
-- TOC entry 3828 (class 0 OID 0)
-- Dependencies: 248
-- Name: rooms_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_room_id_seq OWNED BY public.rooms_room.id;


--
-- TOC entry 251 (class 1259 OID 16734)
-- Name: rooms_souvenir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_souvenir (
    id bigint NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.rooms_souvenir OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16733)
-- Name: rooms_souvenir_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_souvenir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_souvenir_id_seq OWNER TO postgres;

--
-- TOC entry 3829 (class 0 OID 0)
-- Dependencies: 250
-- Name: rooms_souvenir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_souvenir_id_seq OWNED BY public.rooms_souvenir.id;


--
-- TOC entry 259 (class 1259 OID 16768)
-- Name: rooms_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_table (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    width double precision NOT NULL,
    length double precision NOT NULL,
    height double precision NOT NULL,
    type character varying(5) NOT NULL
);


ALTER TABLE public.rooms_table OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 16767)
-- Name: rooms_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_table_id_seq OWNER TO postgres;

--
-- TOC entry 3830 (class 0 OID 0)
-- Dependencies: 258
-- Name: rooms_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_table_id_seq OWNED BY public.rooms_table.id;


--
-- TOC entry 261 (class 1259 OID 16777)
-- Name: rooms_table_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_table_rooms (
    id bigint NOT NULL,
    table_id bigint NOT NULL,
    room_id bigint NOT NULL
);


ALTER TABLE public.rooms_table_rooms OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 16776)
-- Name: rooms_table_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_table_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_table_rooms_id_seq OWNER TO postgres;

--
-- TOC entry 3831 (class 0 OID 0)
-- Dependencies: 260
-- Name: rooms_table_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_table_rooms_id_seq OWNED BY public.rooms_table_rooms.id;


--
-- TOC entry 253 (class 1259 OID 16743)
-- Name: rooms_window; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_window (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    width double precision NOT NULL,
    length double precision NOT NULL,
    height double precision NOT NULL,
    type character varying(5) NOT NULL,
    room_id bigint NOT NULL
);


ALTER TABLE public.rooms_window OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16742)
-- Name: rooms_window_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_window_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_window_id_seq OWNER TO postgres;

--
-- TOC entry 3832 (class 0 OID 0)
-- Dependencies: 252
-- Name: rooms_window_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_window_id_seq OWNED BY public.rooms_window.id;


--
-- TOC entry 255 (class 1259 OID 16752)
-- Name: rooms_windowfittings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_windowfittings (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    width double precision NOT NULL,
    length double precision NOT NULL,
    height double precision NOT NULL,
    type character varying(5) NOT NULL
);


ALTER TABLE public.rooms_windowfittings OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 16751)
-- Name: rooms_windowfittings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_windowfittings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_windowfittings_id_seq OWNER TO postgres;

--
-- TOC entry 3833 (class 0 OID 0)
-- Dependencies: 254
-- Name: rooms_windowfittings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_windowfittings_id_seq OWNED BY public.rooms_windowfittings.id;


--
-- TOC entry 257 (class 1259 OID 16761)
-- Name: rooms_windowfittings_windows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_windowfittings_windows (
    id bigint NOT NULL,
    windowfittings_id bigint NOT NULL,
    window_id bigint NOT NULL
);


ALTER TABLE public.rooms_windowfittings_windows OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 16760)
-- Name: rooms_windowfittings_windows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_windowfittings_windows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_windowfittings_windows_id_seq OWNER TO postgres;

--
-- TOC entry 3834 (class 0 OID 0)
-- Dependencies: 256
-- Name: rooms_windowfittings_windows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_windowfittings_windows_id_seq OWNED BY public.rooms_windowfittings_windows.id;


--
-- TOC entry 3449 (class 2604 OID 16579)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3450 (class 2604 OID 16588)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3448 (class 2604 OID 16572)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3451 (class 2604 OID 16595)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3452 (class 2604 OID 16604)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3453 (class 2604 OID 16611)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3454 (class 2604 OID 16670)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3447 (class 2604 OID 16563)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3446 (class 2604 OID 16554)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 16810)
-- Name: rooms_bed id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_bed ALTER COLUMN id SET DEFAULT nextval('public.rooms_bed_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 16819)
-- Name: rooms_bed_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_bed_rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_bed_rooms_id_seq'::regclass);


--
-- TOC entry 3466 (class 2604 OID 16794)
-- Name: rooms_chair id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_chair ALTER COLUMN id SET DEFAULT nextval('public.rooms_chair_id_seq'::regclass);


--
-- TOC entry 3467 (class 2604 OID 16803)
-- Name: rooms_chair_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_chair_rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_chair_rooms_id_seq'::regclass);


--
-- TOC entry 3456 (class 2604 OID 16710)
-- Name: rooms_decoration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_decoration ALTER COLUMN id SET DEFAULT nextval('public.rooms_decoration_id_seq'::regclass);


--
-- TOC entry 3465 (class 2604 OID 16787)
-- Name: rooms_decoration_souvenirs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_decoration_souvenirs ALTER COLUMN id SET DEFAULT nextval('public.rooms_decoration_souvenirs_id_seq'::regclass);


--
-- TOC entry 3457 (class 2604 OID 16719)
-- Name: rooms_door id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_door ALTER COLUMN id SET DEFAULT nextval('public.rooms_door_id_seq'::regclass);


--
-- TOC entry 3458 (class 2604 OID 16728)
-- Name: rooms_room id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_room ALTER COLUMN id SET DEFAULT nextval('public.rooms_room_id_seq'::regclass);


--
-- TOC entry 3459 (class 2604 OID 16737)
-- Name: rooms_souvenir id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_souvenir ALTER COLUMN id SET DEFAULT nextval('public.rooms_souvenir_id_seq'::regclass);


--
-- TOC entry 3463 (class 2604 OID 16771)
-- Name: rooms_table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_table ALTER COLUMN id SET DEFAULT nextval('public.rooms_table_id_seq'::regclass);


--
-- TOC entry 3464 (class 2604 OID 16780)
-- Name: rooms_table_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_table_rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_table_rooms_id_seq'::regclass);


--
-- TOC entry 3460 (class 2604 OID 16746)
-- Name: rooms_window id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_window ALTER COLUMN id SET DEFAULT nextval('public.rooms_window_id_seq'::regclass);


--
-- TOC entry 3461 (class 2604 OID 16755)
-- Name: rooms_windowfittings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_windowfittings ALTER COLUMN id SET DEFAULT nextval('public.rooms_windowfittings_id_seq'::regclass);


--
-- TOC entry 3462 (class 2604 OID 16764)
-- Name: rooms_windowfittings_windows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_windowfittings_windows ALTER COLUMN id SET DEFAULT nextval('public.rooms_windowfittings_windows_id_seq'::regclass);


--
-- TOC entry 3765 (class 0 OID 16576)
-- Dependencies: 232
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3767 (class 0 OID 16585)
-- Dependencies: 234
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3763 (class 0 OID 16569)
-- Dependencies: 230
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add door	7	add_door
26	Can change door	7	change_door
27	Can delete door	7	delete_door
28	Can view door	7	view_door
29	Can add souvenir	8	add_souvenir
30	Can change souvenir	8	change_souvenir
31	Can delete souvenir	8	delete_souvenir
32	Can view souvenir	8	view_souvenir
33	Can add decoration	9	add_decoration
34	Can change decoration	9	change_decoration
35	Can delete decoration	9	delete_decoration
36	Can view decoration	9	view_decoration
37	Can add room	10	add_room
38	Can change room	10	change_room
39	Can delete room	10	delete_room
40	Can view room	10	view_room
41	Can add window	11	add_window
42	Can change window	11	change_window
43	Can delete window	11	delete_window
44	Can view window	11	view_window
45	Can add window fittings	12	add_windowfittings
46	Can change window fittings	12	change_windowfittings
47	Can delete window fittings	12	delete_windowfittings
48	Can view window fittings	12	view_windowfittings
49	Can add chair	13	add_chair
50	Can change chair	13	change_chair
51	Can delete chair	13	delete_chair
52	Can view chair	13	view_chair
53	Can add bed	14	add_bed
54	Can change bed	14	change_bed
55	Can delete bed	14	delete_bed
56	Can view bed	14	view_bed
57	Can add table	15	add_table
58	Can change table	15	change_table
59	Can delete table	15	delete_table
60	Can view table	15	view_table
61	Can add rooms related objects	16	add_roomsrelatedobjects
62	Can change rooms related objects	16	change_roomsrelatedobjects
63	Can delete rooms related objects	16	delete_roomsrelatedobjects
64	Can view rooms related objects	16	view_roomsrelatedobjects
\.


--
-- TOC entry 3769 (class 0 OID 16592)
-- Dependencies: 236
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- TOC entry 3771 (class 0 OID 16601)
-- Dependencies: 238
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3773 (class 0 OID 16608)
-- Dependencies: 240
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3775 (class 0 OID 16667)
-- Dependencies: 242
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3761 (class 0 OID 16560)
-- Dependencies: 228
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	rooms	door
8	rooms	souvenir
9	rooms	decoration
10	rooms	room
11	rooms	window
12	rooms	windowfittings
13	rooms	chair
14	rooms	bed
15	rooms	table
16	rooms	roomsrelatedobjects
\.


--
-- TOC entry 3759 (class 0 OID 16551)
-- Dependencies: 226
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-31 02:32:37.934464+00
2	auth	0001_initial	2022-03-31 02:32:38.072298+00
3	admin	0001_initial	2022-03-31 02:32:38.104699+00
4	admin	0002_logentry_remove_auto_add	2022-03-31 02:32:38.126055+00
5	admin	0003_logentry_add_action_flag_choices	2022-03-31 02:32:38.139365+00
6	contenttypes	0002_remove_content_type_name	2022-03-31 02:32:38.191317+00
7	auth	0002_alter_permission_name_max_length	2022-03-31 02:32:38.205467+00
8	auth	0003_alter_user_email_max_length	2022-03-31 02:32:38.224163+00
9	auth	0004_alter_user_username_opts	2022-03-31 02:32:38.242241+00
10	auth	0005_alter_user_last_login_null	2022-03-31 02:32:38.261999+00
11	auth	0006_require_contenttypes_0002	2022-03-31 02:32:38.272977+00
12	auth	0007_alter_validators_add_error_messages	2022-03-31 02:32:38.29124+00
13	auth	0008_alter_user_username_max_length	2022-03-31 02:32:38.314821+00
14	auth	0009_alter_user_last_name_max_length	2022-03-31 02:32:38.333445+00
15	auth	0010_alter_group_name_max_length	2022-03-31 02:32:38.349606+00
16	auth	0011_update_proxy_permissions	2022-03-31 02:32:38.371265+00
17	auth	0012_alter_user_first_name_max_length	2022-03-31 02:32:38.38832+00
18	sessions	0001_initial	2022-03-31 02:32:38.414707+00
19	rooms	0001_initial	2022-03-31 02:35:47.64111+00
20	rooms	0002_alter_room_decoration_alter_room_door_and_more	2022-03-31 08:14:35.51413+00
21	rooms	0003_alter_bed_rooms_alter_chair_rooms_and_more	2022-03-31 08:18:48.848744+00
22	rooms	0004_roomsrelatedobjects	2022-04-01 10:35:55.246853+00
\.


--
-- TOC entry 3776 (class 0 OID 16696)
-- Dependencies: 243
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 3802 (class 0 OID 16807)
-- Dependencies: 269
-- Data for Name: rooms_bed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_bed (id, name, width, length, height, type) FROM stdin;
811	gxSZErXfiGClRXQMdPuvwvIPWjtzul	1	1	1	BT1
812	YEGpEuZnhaSZIUflpWHUPkDWBnvthH	1	1	1	BT1
813	TfNespHSWYluGxiYwdIGDIazLtfvnX	1	1	1	BT2
814	iPyNmQHQGntuaVouRDztzYlPLkgUoF	1	1	1	BT2
815	zOxLPmmpYLwCqqRvgLKCsNiEHoffwq	1	1	1	BT1
816	pHFJgAPmqegulZVnIliEXlizWxuFqI	1	1	1	BT2
817	UGlUpcTrUGXNtaluCDkLTRIUqbJmYJ	1	1	1	BT3
818	RfgCAlXDCWYitLufdINxCuOsvmDVPc	1	1	1	BT2
819	ehLjsENXCVEBflJCyfSOUUOQmeWQqT	1	1	1	BT2
820	MwsaKCpdZdJRKKUoKhaKoHkbmrBiDg	1	1	1	BT2
821	VthoAqfnCHUUEvRFGCZPdisISQgZKx	1	1	1	BT2
822	qCiSiLyMpEoqWCNmeJtcANpbrvmMxz	1	1	1	BT2
823	vZvpQaIFHfHPxayEyWiPtFAMzjMExM	1	1	1	BT2
824	FJSMfTykHBhOrXCuFTzcHnaVWYNSns	1	1	1	BT2
825	eyRIhlERpNfbyGdkVkxLFYmcGlhadm	1	1	1	BT1
826	XJPhCjRTmiYOBCHRIEelDMVrttxNxu	1	1	1	BT2
827	UjHFRMOhhDFcKeYuUigzgAXEiiZNWm	1	1	1	BT3
828	apXOobzReHJXvntCTlLcvRnYpSOijg	1	1	1	BT3
829	KPUjxkfOBrNYZFNhAOCNMjFosduFnm	1	1	1	BT3
830	xlVgAWInGGUkXFAHrHxKVjzohHrXLu	1	1	1	BT1
831	SraMYjWzBUYfqQzulJQaKdehwkuHxB	1	1	1	BT2
832	YwWUgANKBdLpJTvuxxJLhMmoiFFDRs	1	1	1	BT1
833	DwWbJwOEYfYgkrbVPATgwuylPNZNBf	1	1	1	BT2
834	ZmiPxqfTMgHSFNDYbQhLKcnnCzJBgk	1	1	1	BT3
835	fpedxGjzZVZHpuFSyCbUKfdTPwRFGG	1	1	1	BT2
836	EOItosAkDeZLEBRxEpkmAXDABbyTrB	1	1	1	BT2
837	XjqnZHTaRwQiPvRDsmdQFNrJVhgPxG	1	1	1	BT2
838	iXjOrgqGrdvfCcigYAEKIafgjQQFKv	1	1	1	BT2
839	rqDVxDgzAKkRQSXrNssiztVqlUmsgL	1	1	1	BT2
840	fUdfGIyHvxqaKZuxKTGXoEhELISTTY	1	1	1	BT1
841	pqhLETocDHarLhqfHvLWSUJAhuOYxp	1	1	1	BT2
842	EjknEPdaeQfjDItueraizGavQKfZMJ	1	1	1	BT3
843	QNAgzxCmbOAXdWCiuZZzyuFwlWELYr	1	1	1	BT3
844	QIXJdtKVlYGFRPuTAHfLvYRIsPGYhZ	1	1	1	BT3
845	XoUKKFczmUvPlzQLRBdrINrptrAzFD	1	1	1	BT3
846	ObqMXXlTPKIRdDAarXHaenKdjGgCRl	1	1	1	BT2
847	hwDwUsUPlcwOTESpXakzGJOucmbnBq	1	1	1	BT2
848	yJYOIYAtKINdJKaDzMvndVTIkaFxSG	1	1	1	BT2
849	euaWiuzcoPplAuMrzEdBdGpWBqUkSe	1	1	1	BT2
850	uBJKHwQKzyJrRFbsvTwTyMSbrjkWgr	1	1	1	BT2
851	GAWTeByOGtRaGgJbcVBzjSyvKQJxdN	1	1	1	BT3
852	yWlMyCHvqlZBIWxbquByAJvCoTlZRN	1	1	1	BT2
853	LvwFiaMeIKOjogqZQdGNFStsWgHlCi	1	1	1	BT1
854	EmIrTWiSkTxRJZaqFtVKbfyHENSUqw	1	1	1	BT1
855	OFkXgrlRQQPCRmfSNGZrcZdacWrpXd	1	1	1	BT2
856	BjsFQbzeaEIRavgDLbexzcQJprhHFe	1	1	1	BT3
857	eYYrTKNHaHuZMxvwjJByTlxjwVChNr	1	1	1	BT3
858	noTosUosbCzwVTYqXVqCmfOIZNWjuW	1	1	1	BT1
859	qykXZxbhZOuRzzHUjKWvWOrUWYgAEZ	1	1	1	BT2
860	nRLiBuUGQMLTssQYazOMCKElhbrKmb	1	1	1	BT2
861	zbhXhLyqxeAUaRXepZNjrvijzoeYtk	1	1	1	BT3
862	NHPwBYRQqsHpdDLxolOGFaEqvrnfaC	1	1	1	BT2
863	zBLEaxJfDRwWDCgDiLkPSEDiYboHrh	1	1	1	BT2
864	HTPfmIlEltubJscDfwGlNjNpqGApaX	1	1	1	BT3
865	JJJoxJYwcOWajApnCFCvpEVLSDFdlL	1	1	1	BT3
866	BXourftyhqrPSZPDUpSfaTjKxEGdKj	1	1	1	BT2
867	lgJgCQcIEttomGwnjrdBQEGxfeYowU	1	1	1	BT1
868	KCuWnrUuRuNdNTeWszMgMFIqcwJBca	1	1	1	BT3
869	BHTrrHrYuYXekLmaLwLyoTRwDwMtyU	1	1	1	BT1
870	FROtHFuFZuClkbcCMtCzWwLFrKPHSk	1	1	1	BT1
871	zTdjaBUneMVHKQdVOWJIntUGLzVdoD	1	1	1	BT3
872	mfVgQNHtttINFcEIUBLFtpjZnesWQW	1	1	1	BT3
873	JmkfoOEtWkcxXAxGwHXTRNVJFDJxcn	1	1	1	BT2
874	txEyABPVAUlHuymRwZdqIJLBOjfhpi	1	1	1	BT1
875	EXiWdQKcrniOvmQcedXdfcMKIGdeXl	1	1	1	BT3
876	oPTWJjVOEGYMIQNLvWzGDZWoGLxanA	1	1	1	BT1
877	RqZMDWiZkpaBREfXMdUaKJFGLNQwsB	1	1	1	BT1
878	nTKlvNMIMUYSeKlnDbnCIXkRvAwkUG	1	1	1	BT1
879	LmHnMTaxCAEuCqwiqdYjvDxmWSCzdB	1	1	1	BT3
880	nVfzsYcjukbWsnJToHIcvqNBpleYCG	1	1	1	BT1
881	GApHwMzsoAHkNoVbBnApmyqhaJgyGr	1	1	1	BT1
882	vIYspWczEiTdykeGyUYpMIzSAPNMHW	1	1	1	BT2
883	VXtrPtIsExBLLocjlPSXAPwPaUWKbk	1	1	1	BT3
884	uYnqZiJwzmkGTiGDkOqchJiczQmXwl	1	1	1	BT2
885	vjdAsibxMVJmfTWrbukAXQndjwOCOI	1	1	1	BT3
886	aIHPFkaWMoKAjyQXWdzHAhiWyKEhMk	1	1	1	BT1
887	sZMZNKLLyvLaxAYHyCAzPHXEjVnTUl	1	1	1	BT1
888	bZJNPjmJeDIXAdelWakfOsylHSguSp	1	1	1	BT3
889	VlJgNNOhvzXLBSWdfZjSZBOmLssSmt	1	1	1	BT2
890	NONxKIDwoplWoyyPnpkGZnjDthlMAa	1	1	1	BT2
891	UJFFAvZhnGeluZqikUpMsYsURIGGLw	1	1	1	BT1
892	MTTIPTXUcPjEyEVwMskmrDynIAQuTo	1	1	1	BT1
893	pNUTHAjAgoqfvMhLHJegAzAfFtCHhz	1	1	1	BT3
894	GUuQJnxSmBdTfCmymfckVbGRyxojbe	1	1	1	BT2
895	dbOgayACJqNsIMHpDOUoRKNDzxIFHI	1	1	1	BT2
896	DyumKWHmqYjzwjKveyvGZLYItROPKM	1	1	1	BT1
897	GuyfRmZtFzGhwrPskBOEAeRagQhxZj	1	1	1	BT3
898	vEtoLcnGbDwCHYmVzMbWhdajFmGnzy	1	1	1	BT3
899	PFokLvaTaDxqcEKzpIFnqNglykibpL	1	1	1	BT2
900	XHJssLiPeaOcQWfxCBciKVwUcsGZLg	1	1	1	BT2
901	RTjaoQmhyApfmNcVBEoujjbMGAvlCh	1	1	1	BT3
902	oewLKYjnNnARDMmjHyoblhGBsSQVuh	1	1	1	BT2
903	WBVPouSwlmRuAMxUcNveVAPYOCryrq	1	1	1	BT1
904	sxzZxawKVBvNUHZYPsPQFegHStFivI	1	1	1	BT2
905	tpFxrhLtFBVtLkQkSeHeYFmsgJVYjE	1	1	1	BT1
906	chEXewchhUTxHQjrltppPuplQugexu	1	1	1	BT3
907	qakNNsVikqmtUejuFjDKhpDvvAJQad	1	1	1	BT2
908	jjaSXRCPSCHlVAmUkiJQyDxQPCdkxQ	1	1	1	BT3
909	EAUYZziZbApHoUckfyfSgZLNhAxlDu	1	1	1	BT3
910	cpGNdzavRMqNUFFmlszqLfVDGuYByb	1	1	1	BT3
911	LnGJOcgJwovxEWSJoAfCPWegjqBSKS	1	1	1	BT1
912	rvwQVujXlXxQGNjLDbszLZGnodtrzU	1	1	1	BT1
913	xrAAnMpTJgLLeiJdAfzgSFLQnbQAjQ	1	1	1	BT1
914	bLKOgpmhlIYjAFJahtIRqdbYjTkmsS	1	1	1	BT3
915	dQWBQbQbJcTjoyLkkipUzZjtEkTIZy	1	1	1	BT3
916	yzAyrskaBbEaibXelRLzWGyVtzBcPI	1	1	1	BT3
917	VNiJhJjaEdIOkXtSwZqPjKxKyFMuxl	1	1	1	BT3
918	wnYbRbTOmGqflNaBRktTCVZTftuBpf	1	1	1	BT2
919	mkbfBOkMEysEryaPaZHyKSSByXnSqM	1	1	1	BT2
920	TSWWIavSgNwmOWGHWoRvIpcAuNTxzc	1	1	1	BT2
921	eglHmjsImCKOPspqtRGODPFJEZvilO	1	1	1	BT3
922	OMGzUijiOrfuyHzfDpnVtbZTvLivOj	1	1	1	BT1
923	jDGnZRfqpCuUgTohXgVUrXzsNfOfML	1	1	1	BT2
924	sNtXlLzqYRQbsVdkkbfFRQgqVUOtwq	1	1	1	BT1
925	mLLOwKLSQLWAXwzKkwbDezLTROTmOH	1	1	1	BT3
926	HGjyaxljTvstfuvGBnoaEOuvjOuTzf	1	1	1	BT2
927	ToAZmTsXnRRPgzrjsZSSpfSYVkSbQl	1	1	1	BT3
928	LWxgnfecmVwWpQmPZIyANhbDCmGKDU	1	1	1	BT1
929	YgjDYJHahHJnViMlHppDiAYatdMQBB	1	1	1	BT2
930	PqCGmZOZlRHBMYXeQQOHfgzwKloitA	1	1	1	BT1
931	bESZeeMCLXuxoTsZqCcvonINoypPRL	1	1	1	BT1
932	LsCScwgJeERoHJQoGTXHVfydYDSVpV	1	1	1	BT1
933	bDBIabEqFzgdtrdOYQKWmIJgIHzHCG	1	1	1	BT1
934	IvFPJrHUgBxsNUhrZbLEaJlBeaHfDI	1	1	1	BT1
935	zWFvxgVEnxCiyauUXMAdUMXChKKUbk	1	1	1	BT3
936	ZHZyfnZNtYPIkSYwOPKbwEdCcZtIuY	1	1	1	BT1
937	SnECxGBJehXqVevHlUYXKbkoNOxDYY	1	1	1	BT3
938	XjjXtxbNbfpqikcSSTPcEZOncTtRJg	1	1	1	BT2
939	sTSsACNeTAFwmcJDoekIorKowyjMXh	1	1	1	BT2
940	nuopsdyUKsWFGMIateYUqSZEADYGQv	1	1	1	BT3
941	IwzKfeUfOZeSOylvWsgKyVrlKsFtvU	1	1	1	BT3
942	raGyylrgVEvBiidUpPLqIhfBugPIlb	1	1	1	BT2
943	ixAsflBzRbTKLUdFuhFBDPAtjDsYef	1	1	1	BT2
944	PymeihvCaWceAjTEquLvZTzYAyxaPm	1	1	1	BT3
945	NlnWbWkYPMdhSkfCjbCNyOJplUbhgF	1	1	1	BT1
946	VuqMXUUtbrrTbeWZYGMMBqgrEPWwfN	1	1	1	BT3
947	fjNMaKToYEJVtlyezpoScAylrlnxWH	1	1	1	BT3
948	UrpycjJsgmUpcsKhWAACBoAJIdGdPe	1	1	1	BT2
949	HYbkTFkRGZpqocxaIAicqPpYszaGuK	1	1	1	BT1
950	cfqVSHBEJazMYmrZcGvpdbSiuKSGZX	1	1	1	BT2
951	ouqQWrHSUKndhkhrtrfKGmyhPYtpdl	1	1	1	BT3
952	pWbYaZHDMxRHVmItOaShnzrTCzEBmy	1	1	1	BT2
953	vaRhPtihkvLaZwCKUiaZVXsvelaiDd	1	1	1	BT3
954	GkIliBWKmeswOacZVusTcEpasvmuHt	1	1	1	BT3
955	zNWnwyoBuSXkiiAIPlmfgUGEmmMFip	1	1	1	BT1
956	UseCuqLpTlQccWuzAVjjXSjRquNUUQ	1	1	1	BT3
957	ajbYZTmZobfrzGlyVFTmoKGuvnZwAm	1	1	1	BT1
958	lCkVnnTNwsGfEVRhesUvnDRoXKynUa	1	1	1	BT2
959	ARNDOOtumNwGOqDdnygcQFCSwdxsse	1	1	1	BT3
960	SCfAkpnURYClYquwUKHiFjeEMXLWdU	1	1	1	BT3
961	HbTKvUmKYvhGQqZmQmmAecFHdUMoGt	1	1	1	BT3
962	omIBfJhlDjKxbahiLvYPIzuRtIlQAz	1	1	1	BT2
963	JmYDWGPWzXePtwWlCsuWCVSpxMGjDn	1	1	1	BT2
964	pDmsTEFCsOztJunaGanzRLpiVJfMhj	1	1	1	BT3
965	LTKFwpMJHkrCbqSaNeqgkWTpgGMVbx	1	1	1	BT2
966	IzFjTnyxtWBQItNhvRSyasxjUEpDnV	1	1	1	BT3
967	vYLuVcqNHUtobIDDzAUUMBXXjnlaVH	1	1	1	BT1
968	zvVogVTxCVGvMrkAiHJBlDcTcnMfXu	1	1	1	BT2
969	pbnZZNfQdrYbzxXtzWkLWEJHNLQYAP	1	1	1	BT2
970	xxRmcjFLdXGPZQjZYwFFTrJTQXXVwd	1	1	1	BT2
971	VwRIcElkHlZyYwfROgfAgTDyYQDRYr	1	1	1	BT1
972	wyVNXnCQDFRTHeArgEAvCULHXdMgTj	1	1	1	BT2
973	iqKYbJjHrGAMgLbseKkQhamyKPzEOX	1	1	1	BT3
974	EhnsrjJIGHILkSnAjhrScUYXvLLzMU	1	1	1	BT1
975	IDRkftNsAXAjqpYMGmnPDwDmLVlexL	1	1	1	BT3
976	CmxpeTnfJBcHkulkpUNaLljxaBSwBK	1	1	1	BT1
977	boveHhFOcRsItHNYADhucPhnOZHizL	1	1	1	BT2
978	krrlormhaOmeOdTyaYnDvCBPRplvEf	1	1	1	BT2
979	TMYgvvqDDqokmPSXRPxdRMFWPHKDJU	1	1	1	BT2
980	VnAJhgVQDLhIEYuSRJvIDKiHNGMgwF	1	1	1	BT1
981	gWmqJzaIQcvCrQQypxIUmIoIpWvMCz	1	1	1	BT1
982	VLlwHaSVTtElWGNXjNSwQYIVWlbzDs	1	1	1	BT1
983	CofYbfIdCjzwHtkwGBQvJzbFEmWtFr	1	1	1	BT3
984	pxRGuTgaCDRUmoXUlJEjNhFELUaBrT	1	1	1	BT2
985	iuPxOXepjWvdrfzqzkovlhUIuXEtlq	1	1	1	BT1
986	ZWLUqZCPaOKorRpEvbVsXbRRJdismT	1	1	1	BT3
987	olapbchVXiEzcZGxoXVpbfvwsXRSlD	1	1	1	BT3
988	mZJCnUBgoExyVLXFYBDlsnVdLpkURc	1	1	1	BT3
989	yyvjENuyHYzruxApsgdoLQNooZAPJI	1	1	1	BT2
990	EGFmyeAGNdoGxxHcpjsPvGzbETaZKH	1	1	1	BT2
991	LPXbPjXdIsKgoLUfyYkuGaiYcwFfmI	1	1	1	BT1
992	nPgKkMIOWtlOQlzluMwWRByggVPDsg	1	1	1	BT1
993	COyGasuvOcJxbCCIqaRsoedGwYRXMn	1	1	1	BT2
994	EkcnZkUlXoFxSLTvRgkOvNVqZyAsyM	1	1	1	BT2
995	LnoZXgKlLraSabmupWyvZIxhZeoRDh	1	1	1	BT1
996	ECkpRhyPKWhnvtLawyCaKbLctMVsib	1	1	1	BT3
997	IFdeOLkxMMQNqcpEcPUfeRvpPSiMaV	1	1	1	BT1
998	UmZzhRKFxsOVygIPXuDkBgZthBrpfy	1	1	1	BT1
999	MMAraNWWoRsFsfmtnuxuoBbbwORBZR	1	1	1	BT1
1000	cFuVcEXaeVHaEoezTjxGckknCrnPcW	1	1	1	BT1
1001	ebBKYUSvYJwEmYFZYJbjiCXnxBHbVr	1	1	1	BT1
1002	LSEZSqrRuqNkDkXsBduJvCzmmiJBvx	1	1	1	BT1
1003	kRGYVxQeBqsBsMOZKuYoqwSyPZkiab	1	1	1	BT1
1004	qfLXqzNmxaTSfVNQOWRczLkBiujogx	1	1	1	BT3
1005	ByQaSeJWiyHszuGiLTRaFBjWeEpqyV	1	1	1	BT3
1006	nUjrzJzSQTIkuSwwgRzjNpvHLHqEXQ	1	1	1	BT1
1007	QTvVGvSKEEKhNoKhECKKpWViiIIuJE	1	1	1	BT2
1008	vCFZVwOJYqvMRunwnVXuUApzLpWBpu	1	1	1	BT2
1009	lnNLgeIVqVJJHhwBkDmxvqPjgotNdY	1	1	1	BT2
1010	mVwPICacJWSDnuTTcILpQvtQLwKZBK	1	1	1	BT3
1011	WAeDfqwZKUHQusWEANuLZoqEvsbHCT	1	1	1	BT3
1012	xFzmeuXkqPXbNaCHKUfvKJynvTIVdP	1	1	1	BT2
1013	nTgwxomTkAJafjRtxzJoezbqScpjYL	1	1	1	BT3
1014	ICXnyvrvaELMcTQKtnJkbKGXGWHWKA	1	1	1	BT3
1015	flcofXAVXjoGpxBSzlwDDonQYEysNC	1	1	1	BT3
1016	oZbAJEnmPyheisGIJwLIdcijKhDbfw	1	1	1	BT1
1017	oerjwiwrBPFWVnEhUuqPIqBhBzUBUl	1	1	1	BT2
1018	xwpXizKDBcgwOzjfBSqeuNqtrKHASX	1	1	1	BT3
1019	sDnrkobSiiYralMsefUOFCLTnZhbYo	1	1	1	BT1
1020	YOCHPftRsGvrOAMSFCXVmgaLgpFHRD	1	1	1	BT1
1021	VjdfyHzNMRyRvfXefAKObLlXeqyNNw	1	1	1	BT2
1022	VxKUqpxUVxdquqQWcquGnTFSjhmCyY	1	1	1	BT1
1023	GYNXVXRlSpLHutLYNQEIQbJlqNOsrd	1	1	1	BT2
1024	AiqeLOQpxftZrTcwtUWXKrqBdhRAgG	1	1	1	BT1
1025	dMZLnGSZfLCrMADGBjLemTWEQvOYqA	1	1	1	BT1
1026	GjgbbHVnJCjmqSEKlYQnGkBYUwIJrX	1	1	1	BT1
1027	NDMyxdMLEtSxVBESSmcghvvIhmaOPb	1	1	1	BT1
1028	DGrNheJNfGLjdlLBcAvgtzKYVYtLmz	1	1	1	BT2
1029	axXjybSwPVRAGYArZLmawTRhrNdlZE	1	1	1	BT2
1030	fpQgFBlhrcCeubmdplfJQpBhmLxfsv	1	1	1	BT1
1031	ACBkYOtEbDxNjkDhDjjwXbWrFaJpAt	1	1	1	BT2
1032	kMUspOiPzshvQclbArBtJMwTHcRUSd	1	1	1	BT3
1033	ChgiAZmqdxHxbrujwzwOLrvIxaDlCD	1	1	1	BT3
1034	FuxxKvVmVDGFXeCJHZdwLQCBCcVTkL	1	1	1	BT3
1035	OGkOknclYqIBcaMQegKhdTzREEXprk	1	1	1	BT2
1036	EKEePoAORFNQZlHAIBXaPgKMOWCvNc	1	1	1	BT1
1037	ZsCxQJmoAjVPdSdNTTuKxtXJEMhsJz	1	1	1	BT1
1038	NbufuUmKYcDuAUAtIpslMTErIONbJE	1	1	1	BT3
1039	CWiPPaqXzJSDhJKHJwnIImZJeRbUTh	1	1	1	BT2
1040	ElNhxcWAbXgdcLJzvaDquVBvaUGbAr	1	1	1	BT3
1041	AQUxpWgIQqPDGKrXEBAMQQHwOFMBjl	1	1	1	BT1
1042	GsiaMBOQkaHnmQoUKXqQREKzCbGEPD	1	1	1	BT3
1043	YXqjCTtawYbWcnqyRUwkJeyxrXhlEP	1	1	1	BT2
1044	VvfSTAmvbMJiZIFOdAhhhTxPMWdgGE	1	1	1	BT3
1045	ELqguFFlGpmFeXoiddhuwePTlpSJSl	1	1	1	BT1
1046	kgdQGQYdWZbOTFpXKQKARzWZupuSxL	1	1	1	BT3
1047	DXklzvMGLLKkcVDASAqAQiquriOcNN	1	1	1	BT3
1048	ZmyOEZNfybqNXYzyZiWBLyDvBqoGbP	1	1	1	BT3
1049	AAUzgnrlFnQQHhBRgikMpltwtpRUwT	1	1	1	BT1
1050	GcujrbhFhXLQwCFRFVTOIzdgMqavtN	1	1	1	BT3
1051	BbrvRgYsvIwpCICACTUasbAuuytCMD	1	1	1	BT2
1052	XloBsfUhBoCZqVNlUxErUsuokUTSCd	1	1	1	BT3
1053	YFhXVQsSLfGFVchaBoGJEmODuMdkaS	1	1	1	BT3
1054	ODHCNqRXmPQoZSxyCZEZPgYRORcOlk	1	1	1	BT1
1055	GpkUtbkvUxQNHvLXmjAfcOmXympbxJ	1	1	1	BT1
1056	CUoHXFfKnNnwJfJFUtHncVEfKQNRBQ	1	1	1	BT1
1057	EWMNsSKnDIgksyIEYyaXavAMfIbuLh	1	1	1	BT1
1058	AxLcyAtSDwmhuHycbwHdcthDxwpRvR	1	1	1	BT1
1059	RDGpeRxSUImLDHLhEXuKsTqGHSyQou	1	1	1	BT1
1060	amSykBCLmXAEnBvZebwVrNreWytRmy	1	1	1	BT1
1061	CjguKnNjckoxxRHbaXgTAbyPHoqLKt	1	1	1	BT1
1062	LGzYoPFFQNNKqJxqbnGJGWucJmpMDW	1	1	1	BT3
1063	sbPeSAcMXBJESwdMYWGXuRPtRKCceH	1	1	1	BT1
1064	pVokPRAJdxeRigzsoMycStZICinIfE	1	1	1	BT2
1065	GMIfKnpViflSDkzyjBvTnhnKegJwCA	1	1	1	BT3
1066	MdBysCaRlfiPlmRPJhBZXDypuzEyrw	1	1	1	BT2
1067	vfEHUiRKfnLMCmUFCrCzuakKZTURvG	1	1	1	BT3
1068	bMCEUoSuhdFsxgVfdnBkymjDptkQqh	1	1	1	BT3
1069	dgYmqCYFUzvMUgzbuHthzlYwjcHfta	1	1	1	BT2
1070	CZAWTsqltSxfampreBWdZbPBJEdFSg	1	1	1	BT2
1071	vCqplIuccKmSFsqPsTJSMFHNFlUCgC	1	1	1	BT1
1072	YNAhzyihfWaXwcDCFesShOXcKgUqPE	1	1	1	BT1
1073	oJXiwmjMVCeRiJwPXEOFpWLIDWRupL	1	1	1	BT2
1074	wwRNvcwAxKZfEUciJEkLxXIQgNoHkI	1	1	1	BT2
1075	luImbBLiXCtLWocMqGxaIavuqRcwnR	1	1	1	BT1
1076	SrPYVsvJtlqFTYJOqGiCyaVbwyHhHc	1	1	1	BT3
1077	vXDzGpRiXisbLkjXbYIREcGdVLCmFk	1	1	1	BT2
1078	eGSLZQlISuDTxFjpBHGosXdixbQSGL	1	1	1	BT3
1079	WMEXdaoRnFMklcDPpQxIpRCNFookmc	1	1	1	BT3
1080	fRDhwqSzoiWNtfZDIMkbehvkwGcSvN	1	1	1	BT2
1081	MQuSrgxAaCSPsauayGCNgJtnYdFrUh	1	1	1	BT1
1082	SqpbAHRZQWrOenDurgCoGFUoDSPOnG	1	1	1	BT1
1083	tTFXbWGdfQWMoGJiiJjHXRhZzlmqlo	1	1	1	BT1
1084	INqRNpgZjXcoLuKCjwmfrJyGvDzcwe	1	1	1	BT2
1085	wQMJCvrZaEEnsuAvlGnHYGuBUnjlMT	1	1	1	BT1
1086	AxXnctYShPLMaokaSelUJKumwuJGPo	1	1	1	BT2
1087	PYqZKjITUfphTQMGTWPrVOTqqnKfrp	1	1	1	BT1
1088	VBURaLBwhdfmpOJsIAmwBFeVhgfyUt	1	1	1	BT3
1089	qaOLoLOgZhzJUJaTBxtAXizQRQopDk	1	1	1	BT1
1090	qxDyUXJWerpuVZLKBfiLZzwvcWsOWS	1	1	1	BT2
1091	wuVCAiDURdyQrZRHfBlCmAFHgVeXCc	1	1	1	BT1
1092	QXczlDdPSncqqDmrUGpsUybklMyFlP	1	1	1	BT2
1093	dBbmoKwNXclMxHNnhouvyrpgdefWmK	1	1	1	BT1
1094	oHTrROYwmLSSVoWyFRQdofqiEgNqsF	1	1	1	BT2
1095	WavYMkXyeojuxIwGElWWhKDBasLvPt	1	1	1	BT2
1096	orQYFnJeKpbySUVBLgwJGrDuqAnfox	1	1	1	BT2
1097	UCazukLnnATMUhNiayNhEcedcmLPrC	1	1	1	BT3
1098	BOmzSIGbLkPDEEiicguxeozGgZhZOx	1	1	1	BT3
1099	ulSQGoScfVCdoLnkTUhVBYbkxpzaxT	1	1	1	BT1
1100	imjzXNmagIlSUxDEynEjOvIohdzWTE	1	1	1	BT2
1101	NHxijcWljvsIGgyscJgEaFYWCpdHVk	1	1	1	BT2
1102	DQrLFTGIZxpArGEsIFraWqACkapmDg	1	1	1	BT2
1103	nTOwXQTlHxyydUbtzeWWkAMnoYCrDI	1	1	1	BT3
1104	vWdfojcooNcIjknktOeJTnUApVYvcH	1	1	1	BT2
1105	ekAdkObnZlcEUyouUbpXSmGqUkyVvT	1	1	1	BT1
1106	wTRsXGARfVXgABqOpyIcIQZnhsnSKD	1	1	1	BT3
1107	FTJOGYpXZDOXPXntWNeAWyBjAsqZQu	1	1	1	BT2
1108	uBzqOJWtQwhJQlmgGcBKuvDBtmjKgp	1	1	1	BT1
1109	iKGdJWpvusfiXGTkzVaBMhiikzEAwg	1	1	1	BT1
1110	oaDpYSpQYScUNkvenOkkrUpSMVDWrk	1	1	1	BT1
1111	aewPOpJKuitnotveTuRBSJQurpTHTp	1	1	1	BT2
1112	mZeMgxcpNcTiVYPcUFLetPBaXWsLWl	1	1	1	BT2
1113	DEmdNKbIAfEDggQcHDVXYMGDbZQtMY	1	1	1	BT2
1114	jmCpcFPUkxwILBSIFenzwrhpowRRgk	1	1	1	BT3
1115	jawgfVtyvUSiGehJHJHUEJBSGezcMV	1	1	1	BT2
1116	EdXcmBknPBGHDALOQmJDcNffrQblhj	1	1	1	BT3
1117	spbDQjhcJCRqtpmFAqsLJzcfmsJSQp	1	1	1	BT1
1118	rDLJhzhZyZKkFbLwDQzRyroxGkTcJo	1	1	1	BT1
1119	ojJxOFUxDBipwOXoQrsmDfMYGECYfE	1	1	1	BT1
1120	uxrpENOxaxzhgujHTXgeqUVIfTRrZF	1	1	1	BT1
1121	GnRGjKmqFHxqshfHgfHLqdPSXRaOvj	1	1	1	BT2
1122	LBLYAKlXaZaluLYRHqltxMdkAzbgYc	1	1	1	BT1
1123	QJSNQfWrffCUnRBFYVQoTGHdZOkgfM	1	1	1	BT2
1124	sWHSPnHyGfrIicrnuvNhgwINjJkptX	1	1	1	BT2
1125	aqRPgUiomcajoqZTdtlVdiimvYuiMr	1	1	1	BT2
1126	pZiNUczuUFeMddBvJHLrsXNuMnvlLJ	1	1	1	BT1
1127	AkqEJZOjXdixgisocrjrYEESauliWL	1	1	1	BT1
1128	OGTHPezBiHbXjQsgSpklSrPYrfpYog	1	1	1	BT2
1129	YRAkOsLcUqsMCQEqsCmCpGJuRkhCTt	1	1	1	BT3
1130	QwUSEBZlltLOBhboUgakNjadKrrZmA	1	1	1	BT1
1131	sIVjZrCLcefZFbuvmkgeWSXHSPDIfm	1	1	1	BT3
1132	HkpoLihBhIVLiNoaTHzOXqLKpwzILq	1	1	1	BT1
1133	UrSpAtXSbPcvbcekFRjSqzkzGKsZDa	1	1	1	BT1
1134	tXwLbdLWysbHzAozSGbyonhREGSCMQ	1	1	1	BT1
1135	wNIVBQIJqYYMMWZNohoTkFxZVnhuBH	1	1	1	BT1
1136	SFDdnsCwjswAtKuhhamDnavUuxhvhQ	1	1	1	BT1
1137	IddElBGbmqHjtxqAKnCPmfTuMnIJDd	1	1	1	BT3
1138	gYulEMfjraGBUGKtMRtRuZNgyErRqu	1	1	1	BT1
1139	KLkYFgkqhSnsDiRAwPUQtDteYROFBK	1	1	1	BT3
1140	ZyZyFopFiXNZtiXgJbebJYHUNGhiWe	1	1	1	BT3
1141	ujoSZlWKYEyoKfHwdNpYQWFggvqdnw	1	1	1	BT3
1142	lksWrQsbWFfuEwtnGVbeXSiQRTfkpN	1	1	1	BT3
1143	eFfQlIsrTKDroDqnlPwIPIbTOPvYMx	1	1	1	BT1
1144	NdlHmuIyeyWWuPLGtQGpQFuyCltGJc	1	1	1	BT3
1145	CsUYqWcwVOxmiQGYfSrjKmyMYEvqgE	1	1	1	BT2
1146	YwIcepoPUWEGGbCCMpSsQcbvWLfZnW	1	1	1	BT2
1147	lnDHAddDYLqCfeLcAJUzwAzWvdEUmf	1	1	1	BT2
1148	NlgJAXLUIvaWKVtGIGLkcNUGaoYPdF	1	1	1	BT1
1149	YiqaiGZMwOTJRwiqimGLDqDXRHVKcF	1	1	1	BT1
1150	nvXWCOHYqpYgtqyczGEUuReIvmNuqs	1	1	1	BT2
1151	WCgFgVfmbayqmnNGarAMSXexSEOnHC	1	1	1	BT3
1152	gRxiRayPvLBXscAFDItRVTZICBSICT	1	1	1	BT3
1153	BiJDEhkTFxfZgroUZstybFFdSqYxmQ	1	1	1	BT1
1154	ZcnLNmoXwwjwWWIGSCmbwipXSyWdam	1	1	1	BT1
1155	NQXOzNgZlBuzfmkirKsXfADuraYuGo	1	1	1	BT3
1156	KExOhShMdWTclPFzwtzmOjPGgzTrPV	1	1	1	BT2
1157	DelrMDTzpJoXnBfkGkwtKZZDyDDBZr	1	1	1	BT1
1158	XTFIoAmJoWiITLlEIowIwXWLKCtTlN	1	1	1	BT1
1159	OmiCAOcTpKhDGbzbzcPzfgTaBwbnGX	1	1	1	BT1
1160	kASiuckdypeGuQSZfjnyrzPFpXfHMh	1	1	1	BT2
1161	uyuGplJRBPUZUDMvCwXXZYYPiwxtPQ	1	1	1	BT3
1162	wdpfWNblicdfLkqUzgNKSEyBGJxeyH	1	1	1	BT2
1163	gaEtBYlsGwWkPauFXMGLrKkVrGhaiB	1	1	1	BT1
1164	WIehGuucrGrWEfSgdHUzICklbxZGWQ	1	1	1	BT1
1165	guCTRgokgfPfRfsGlrxKcXYkAUIiYN	1	1	1	BT1
1166	uFdaILlqsQjwSzuHFwCsJgfxDjmdXx	1	1	1	BT1
1167	OLRTcLIIewqLKqWmMisVRUonqxCUaE	1	1	1	BT2
1168	pYhnFCnjisABcZrSQdGrWmkitcBKCG	1	1	1	BT1
1169	eoSXcliZBlQlBZlRXpvgzNfECkjyhr	1	1	1	BT1
1170	bDDSHOVIGEXpqGRliUziraGfpTIbdw	1	1	1	BT3
1171	IctGeeACunQypxnUBSvSCEJZeaAauR	1	1	1	BT3
1172	QlcUxtWOLZmnXPoGXTHLlQeePioJBz	1	1	1	BT1
1173	gUGbClUCItnXbNKLscfhxdFocjMghA	1	1	1	BT2
1174	uVQsYsJDRfCUNkTCxhxNnXHkjAGGKZ	1	1	1	BT3
1175	cwptVubaGBFeluKOHcpaYgtFbudSIE	1	1	1	BT2
1176	cUNeIgHtBbNgaVzcTTLtOvTadxcVvO	1	1	1	BT3
1177	xYggHBjyEiFCgfhsvySwMIcDHsJMrN	1	1	1	BT1
1178	xJEzQiHIolHfdKJSlkEvFXIlUluFTu	1	1	1	BT2
1179	LddErWDHGXBoiguuJPzUPEycDTkmFA	1	1	1	BT2
1180	uhUmsciGyFBcUCBbeZOgNkuabJlCIb	1	1	1	BT1
1181	czqjnJDZcxqPXYhYfGesNfSzFkYoaJ	1	1	1	BT2
1182	chBzIXaUKTqzaSsayJDuqzQjultaUC	1	1	1	BT1
1183	TKsYiuPjPqsAPIhFLiZpNMrrfbXPSj	1	1	1	BT3
1184	ikqZlNWAgqwHuhvRhANJSMTWeMEyZu	1	1	1	BT3
1185	VLpPTcfNNfWjgIZhHOTVpIgHrbeAPL	1	1	1	BT2
1186	aOxwMchKfnGwPQzOJeutshsRzQpMVU	1	1	1	BT2
1187	UYoBLwzhuvoIJfanPEzYMCGojJkvXr	1	1	1	BT3
1188	pBqJfKxMHFYiwXGbwgweOYCvKFpano	1	1	1	BT2
1189	airYgXhqWeMMTcgboFRGlTklZgmqzW	1	1	1	BT1
1190	aMNmWrYOJWeMLCmVZkVJDJySSjgOCY	1	1	1	BT2
1191	GKUpHKbQuDAcdEchvuOYFQgVINsEkX	1	1	1	BT1
1192	VBwRnltLJooLWFSzaoYHpkXYUaCoyP	1	1	1	BT3
1193	hqzviSCHEiSyYoaxroJUYzlkYnQZaf	1	1	1	BT1
1194	gjVFXGWocuGSCdtxQsozODRkeAbewu	1	1	1	BT1
1195	mkjIBsFdOgSJhFRSXiHstGNLxsMUPy	1	1	1	BT1
1196	tTscSVnwOfpZUCqMPdJlRxxtfwtiXD	1	1	1	BT3
1197	OUmDESMzmxtMAeDlSGxxRtYyDwFPnu	1	1	1	BT1
1198	fOKJSIvvqVkynzoLfIcZnfcJIrcPNF	1	1	1	BT1
1199	PabYuGiviiVyBRokdkDdjgHktRxkMF	1	1	1	BT1
1200	KyElpNkKllFAriWEPfcDKeCiZHrrXn	1	1	1	BT3
1201	VECVkpwdOUkZChGlgJvDSkRkkFxdwE	1	1	1	BT1
1202	vEGieruTZbxMxzRQCHIbGAhSxiewoi	1	1	1	BT2
1203	RaBgVJTjQyQnTfxYTUCBETIXnhZbpq	1	1	1	BT2
1204	LeFuUrsohYRbTbNLnyQvdrALJxPgKi	1	1	1	BT2
1205	bHxkiiEYtnitgnvTkCdwpBjfPPZuSL	1	1	1	BT2
1206	PCKUIQwWZRGfQuqnOhpGqxPfsuFEVV	1	1	1	BT3
1207	wyWachQcGDGFPpdxpUkljgFAWlKPpa	1	1	1	BT2
1208	gNqPjEvjLnzxjCjsOvpKBKbxTyPFib	1	1	1	BT2
1209	eDCillOIOkgCinWLSvSqGBWrNUJXpd	1	1	1	BT3
1210	XXCCAHUEhWOamUesPaGXVvzIncIenZ	1	1	1	BT1
1211	ZGZAjenGhFjETWAyyYQNrCihFJgRzM	1	1	1	BT2
1212	pMXwrURXJcIYBoSiPBaxWGjmGCImCw	1	1	1	BT1
1213	YaESuptnvPzhzYhaBlngUCNEjhiBkl	1	1	1	BT3
1214	dJiQQPpLOVoxsWpadehuHaIPcMDnBT	1	1	1	BT2
1215	pznLSguhDAVxbYMwULvhQDLBkxPzrM	1	1	1	BT1
1216	ewShMrhejBHoBeNyvaGWbOgFyMWRLE	1	1	1	BT3
1217	hmuGAevDxGdaqjowFPcqnLHsjeaGBu	1	1	1	BT2
1218	boQPTldLLpNJYkjKKNRToIpaTpFZSH	1	1	1	BT2
1219	EopHsKFACdYviLxkyGUMntnLHiCoCz	1	1	1	BT1
1220	irXSXiyxPWJLDuUVDYbkbzpMNzwsgp	1	1	1	BT1
1221	ofUVtGNVLxYBmTIEnwtZYYliRCKetF	1	1	1	BT2
1222	yZociGMalaJaPaDwHjNqpUlsZWbdau	1	1	1	BT1
1223	qADzCNLVIoLYxCthJHjqEIppAKxFzJ	1	1	1	BT1
1224	AoXbgMmGDRQKxGjjVKbUxpUsKuoQGA	1	1	1	BT2
1225	coeLohALshDuyMDWPoEdFHqVXJkNvT	1	1	1	BT3
1226	jeWNxGZuwfuCzTujJYpbFZIfDrWVzC	1	1	1	BT3
1227	VlkRCUPNBJlvrHewLgTGIQBNsXejhT	1	1	1	BT3
1228	JnmAVLnSQeHvEloOtrTwsFtKIIvwoU	1	1	1	BT2
1229	rYBoEVwKCmgZAKUUFmIjVwZMwBLxjD	1	1	1	BT1
1230	WfVTGNdQpcraClCSbSDyFOwvZgFxPy	1	1	1	BT2
1231	fddxItFDRsqDAVuUpRwIhcmrEsQznz	1	1	1	BT1
1232	pEcAkXmSHITrynkTlVsEzMEkDwrsBt	1	1	1	BT1
1233	oaZfYQqCAFNzWfojCXtSVaTnkHUekY	1	1	1	BT3
1234	uicXfcUsJizxbdVtpPzDSkrXAnDduy	1	1	1	BT1
1235	kgIQROXeEBGnOStTsowyHrjWKnErAg	1	1	1	BT2
1236	TXdYpAQUXaMPAUbgaAvMlAihEdEWBb	1	1	1	BT3
1237	YwwqAIGDMQmdtInXgEmORaNvTTcfuA	1	1	1	BT1
1238	bvJZverPVyxjpoEIJCHblKieakqweE	1	1	1	BT2
1239	niARYGWJQqdcCKNromGUWLNxXLdNvW	1	1	1	BT1
1240	qanRAyMRswnhhgWRewYtuxDIlllFpP	1	1	1	BT2
1241	sVnbUlSGewBQpHhYeJpNdhEyGRKEua	1	1	1	BT1
1242	obtHldwLLOFrwMjuRqDVunTViIriBt	1	1	1	BT2
1243	ZjQdTULWDDYziOGrWAjqaORpbUPZNo	1	1	1	BT3
1244	qChWnRbIpPIUQvduPwQWtsMKzOoozO	1	1	1	BT3
1245	uBGndeOYbFOEhrJsbBPiPRzSBAjEJe	1	1	1	BT3
1246	HMvTbolSsLZjwYwkskQKDiOmtIAkEi	1	1	1	BT3
1247	aefveXUJpHinNEyXhQdaqsOSCpQKFh	1	1	1	BT3
1248	lEGLVEIxOJDKHixUwFkcZmMMLYMkOv	1	1	1	BT3
1249	TtXXljBuTNMMgVgdIdrtyHvYolvpVK	1	1	1	BT1
1250	OzXnKfniDQMVJbXSxDsBJmjXNuNGkx	1	1	1	BT1
1251	vDyvSZOHNGDxsDYjDRUvxQgrKPJhci	1	1	1	BT2
1252	aEloGVvuIeojiOygRWlQWpATVxRzth	1	1	1	BT3
1253	WOzsNUYkNIbIgkwLgdfDVNwneKfBeQ	1	1	1	BT3
1254	gTHipMuywAcBObMLQmQJCFsPTiQpcd	1	1	1	BT1
1255	zsyfRUoTPUCqrSynOUgSVUzYYIkqVp	1	1	1	BT1
1256	rCaMeNmDvCTUJjAQBjePTonSQnghMw	1	1	1	BT1
1257	NlndBtGgKbjSPpXeslQDfoErOXQGUw	1	1	1	BT1
1258	FgOkxgizqsjdxtjCcfwvmebKyBaAmy	1	1	1	BT2
1259	nLkeaaxRxpdLxsEegKwTPvJkOilAkk	1	1	1	BT3
1260	jikWUUNruwlREsPCEyBmaTLTTAPORD	1	1	1	BT1
1261	mDqyjQevbdJfOEDlRpGtNOWZsyRAHS	1	1	1	BT1
1262	TylrQsfqyaMhTkdloYtzXJAQNcvFFa	1	1	1	BT3
1263	azZlmmrvjpJOVjgvTdYlSzMjYsLbxK	1	1	1	BT1
1264	vNuBaDyGVVGdLfSvyhdtTZygfDIlDU	1	1	1	BT2
1265	AxLGCnrVPhWYHovqjNGGxCseweHYtM	1	1	1	BT3
1266	cuthJQAQbeUTitqLxvmwOpZdiVqBch	1	1	1	BT1
1267	tfiplWdFmCXrGKsfmRsEkwcYxhSdhj	1	1	1	BT3
1268	IFAepuzZcfRAJzRzPaIhTrTAyVYLlm	1	1	1	BT2
1269	AChjlsowrGnDqfLWwTOovkUSWjxObv	1	1	1	BT1
1270	sHqwNICNpNpnnYOoHuTAQnxVBFTGgM	1	1	1	BT1
1271	wZhgKrAfkAbrAsbcvuVMubzpJwjdLP	1	1	1	BT3
1272	CaWyGmAvHeTgYluyAEInNYOEDRDSdv	1	1	1	BT3
1273	lEHmlvnipvhluUdQTEyTAgjpYFoavP	1	1	1	BT1
1274	IhJVLAzmbyOZWKtQfHrsLCEyKPOGbL	1	1	1	BT3
1275	OJQQsTxeQPdsFCrGQLSMBVyNjAmJaC	1	1	1	BT2
1276	vNfyWARgyqUhixNMofqrDrCZbIpOGF	1	1	1	BT3
1277	uubhGvNvZJObaaIiQSSTUJRErknrBN	1	1	1	BT2
1278	fmoPJxEeFwHvMfgHWfTejvwsATOAsC	1	1	1	BT3
1279	kiYVwSCnbMfWmKQEFMrBckWRcadugW	1	1	1	BT1
1280	wlkkhxKYPsgdKPQFHJkwARzzuvitmb	1	1	1	BT3
1281	daUUrVLZAPSmTLeaeyFJzocqxKXPNw	1	1	1	BT3
1282	nSTbcmrskZbXOiqnRBZveimjBLMxhW	1	1	1	BT3
1283	bygPHoPOrpHhhggOzkCSWfJNDNgodz	1	1	1	BT1
1284	DIdZOlpGGKNkMfUqhINIqoXcckIRVY	1	1	1	BT2
1285	rwsVQrqeYtzNKPQrBEbbYywHsoKTRp	1	1	1	BT1
1286	JePbzrMkZJyJkervXZZMEkSCJkTSjT	1	1	1	BT1
1287	CgzlWUBrEFmbDWaSMqaBREFtMaIoQT	1	1	1	BT3
1288	PVZccbYqMFMCZYgsYTPKttCAAqEQHn	1	1	1	BT1
1289	DoSHrSKGeVolUePhKvdiJaPnNKOpFz	1	1	1	BT2
1290	qdguaMaCJkPEOaJmDosbZHGFhnApww	1	1	1	BT2
1291	AGaUhUNSjSDPrCJkRKjpvyRoHdxoRJ	1	1	1	BT2
1292	rwgoGZoOptqVehtiTrxJpCbILwyVSy	1	1	1	BT3
1293	TfUucsTQpGUMoxbneCYWiCmNSANYON	1	1	1	BT3
1294	vBmtOmiequeLqvXwYhBLHsGpcvlcOQ	1	1	1	BT3
1295	dMmVKHOaaBhNVHrGKPkerXIJIumuVD	1	1	1	BT2
1296	vtXnoPSWuDYBuzqsYBZCZiULXnlhdd	1	1	1	BT3
1297	dMQLyXXEtEzkUrYMvhvqpSAjacWwkd	1	1	1	BT2
1298	kbwRHJIwyPJkapcvMnCZrMxLDJacBh	1	1	1	BT3
1299	SXxleboJpvZBmXhRXzItSOitYIjljF	1	1	1	BT1
1300	ckoHlYbTygsXWfjChuiRlQMEnKBBGT	1	1	1	BT3
1301	ItjZYmMOYcFUsDjLSKTdDFLIncCaMn	1	1	1	BT1
1302	JiSFRKbtfXllkhgazyguAdyPtkBhRo	1	1	1	BT1
1303	QmClQVnKKVMZfBpyErQVKsqmsNbFrm	1	1	1	BT3
1304	LWPOwDsAiGFsTzPlcrkWiWwpuDxEqF	1	1	1	BT3
1305	OUSfsMZZiZZmPXKoSuqscChVbdZDyl	1	1	1	BT1
1306	MGawTwhhqZAblBntUHiWYerkfyqlSi	1	1	1	BT3
1307	IYNvfrqnQlCgCFTnTojqbGMTeHTPiU	1	1	1	BT3
1308	DCBXrBOXBCBZEAHMsvIqAompFMdEvu	1	1	1	BT3
1309	HKJdjbDuAUKVvFQlmgyrmPhrYYhtjD	1	1	1	BT1
1310	lJHQMydTqUNnpMKBnvPTLhmAqIPiiF	1	1	1	BT1
\.


--
-- TOC entry 3804 (class 0 OID 16816)
-- Dependencies: 271
-- Data for Name: rooms_bed_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_bed_rooms (id, bed_id, room_id) FROM stdin;
2431	811	1021
2432	811	1268
2433	811	873
2434	812	1294
2435	812	1047
2436	812	1053
2437	813	999
2438	813	1304
2439	813	1177
2440	814	927
2441	814	1247
2442	814	961
2443	815	1121
2444	815	933
2445	815	967
2446	816	967
2447	816	966
2448	816	1144
2449	817	1061
2450	817	1134
2451	817	1195
2452	818	1217
2453	818	1290
2454	818	839
2455	819	1060
2456	819	903
2457	819	1179
2458	820	1008
2459	820	1048
2460	820	864
2461	821	1034
2462	821	943
2463	821	1058
2464	822	909
2465	822	978
2466	822	953
2467	823	1012
2468	823	875
2469	823	1181
2470	824	877
2471	824	990
2472	824	1308
2473	825	1040
2474	825	1251
2475	825	1034
2476	826	895
2477	826	1210
2478	826	988
2479	827	1066
2480	827	862
2481	827	1151
2482	828	1001
2483	828	957
2484	828	1217
2485	829	1242
2486	829	903
2487	829	1106
2488	830	996
2489	830	1126
2490	830	1075
2491	831	1191
2492	831	1058
2493	831	1059
2494	832	924
2495	832	950
2496	832	979
2497	833	1290
2498	833	853
2499	833	1031
2500	834	955
2501	834	1266
2502	834	1136
2503	835	1056
2504	835	1033
2505	835	1087
2506	836	864
2507	836	930
2508	836	1004
2509	837	925
2510	837	1055
2511	837	1147
2512	838	874
2513	838	1102
2514	838	857
2515	839	1287
2516	839	1114
2517	839	1306
2518	840	933
2519	840	1094
2520	840	1060
2521	841	1018
2522	841	852
2523	841	1229
2524	842	1214
2525	842	941
2526	842	1170
2527	843	1116
2528	843	1164
2529	843	1254
2530	844	1246
2531	844	1244
2532	844	1082
2533	845	1054
2534	845	1198
2535	845	1035
2536	846	967
2537	846	882
2538	846	1217
2539	847	1290
2540	847	1021
2541	847	1258
2542	848	1272
2543	848	1145
2544	848	1035
2545	849	1048
2546	849	1016
2547	849	921
2548	850	833
2549	850	1252
2550	850	873
2551	851	1025
2552	851	1143
2553	851	904
2554	852	1003
2555	852	1282
2556	852	1004
2557	853	1150
2558	853	1005
2559	853	939
2560	854	957
2561	854	917
2562	854	1227
2563	855	1124
2564	855	1139
2565	855	1222
2566	856	1281
2567	856	1197
2568	856	880
2569	857	1062
2570	857	1204
2571	857	1251
2572	858	968
2573	858	958
2574	858	894
2575	859	1056
2576	859	833
2577	859	867
2578	860	973
2579	860	930
2580	860	1251
2581	861	1201
2582	861	906
2583	861	838
2584	862	862
2585	862	1274
2586	862	1009
2587	863	1239
2588	863	939
2589	863	922
2590	864	874
2591	864	1095
2592	864	876
2593	865	1244
2594	865	981
2595	865	976
2596	866	1158
2597	866	1195
2598	866	998
2599	867	993
2600	867	848
2601	867	1263
2602	868	837
2603	868	1017
2604	868	1099
2605	869	1290
2606	869	1307
2607	869	1068
2608	870	1047
2609	870	1287
2610	870	1165
2611	871	1030
2612	871	1004
2613	871	1160
2614	872	862
2615	872	1276
2616	872	1294
2617	873	966
2618	873	827
2619	873	880
2620	874	1253
2621	874	902
2622	874	1229
2623	875	993
2624	875	1302
2625	875	1259
2626	876	1062
2627	876	1077
2628	876	1278
2629	877	979
2630	877	864
2631	877	1090
2632	878	1008
2633	878	994
2634	878	1278
2635	879	1087
2636	879	968
2637	879	1167
2638	880	852
2639	880	1090
2640	880	938
2641	881	1001
2642	881	1240
2643	881	1154
2644	882	1079
2645	882	1253
2646	882	912
2647	883	1011
2648	883	1310
2649	883	1253
2650	884	838
2651	884	862
2652	884	1235
2653	885	995
2654	885	1075
2655	885	1097
2656	886	1001
2657	886	1268
2658	886	977
2659	887	1012
2660	887	1220
2661	887	840
2662	888	828
2663	888	899
2664	888	1235
2665	889	1035
2666	889	1128
2667	889	931
2668	890	1210
2669	890	1107
2670	890	1271
2671	891	854
2672	891	870
2673	891	968
2674	892	1246
2675	892	967
2676	892	1231
2677	893	842
2678	893	1271
2679	893	1101
2680	894	1179
2681	894	1013
2682	894	911
2683	895	1206
2684	895	1147
2685	895	1267
2686	896	883
2687	896	1307
2688	896	887
2689	897	1267
2690	897	1147
2691	897	1146
2692	898	1210
2693	898	841
2694	898	1095
2695	899	1132
2696	899	1214
2697	899	1035
2698	900	936
2699	900	1015
2700	900	1054
2701	901	983
2702	901	1206
2703	901	940
2704	902	819
2705	902	991
2706	902	1258
2707	903	1195
2708	903	1072
2709	903	820
2710	904	1199
2711	904	988
2712	904	814
2713	905	1014
2714	905	1140
2715	905	990
2716	906	1081
2717	906	1305
2718	906	1022
2719	907	948
2720	907	1058
2721	907	1096
2722	908	1191
2723	908	1063
2724	908	1295
2725	909	872
2726	909	1052
2727	909	1145
2728	910	1223
2729	910	1012
2730	910	853
2731	911	1180
2732	911	953
2733	911	1282
2734	912	885
2735	912	1012
2736	912	835
2737	913	930
2738	913	1008
2739	913	1242
2740	914	858
2741	914	1062
2742	914	1306
2743	915	874
2744	915	1280
2745	915	1150
2746	916	1279
2747	916	1165
2748	916	1006
2749	917	1144
2750	917	1304
2751	917	862
2752	918	1199
2753	918	1070
2754	918	1058
2755	919	1015
2756	919	930
2757	919	1265
2758	920	1033
2759	920	1125
2760	920	932
2761	921	1116
2762	921	1141
2763	921	1283
2764	922	1070
2765	922	1171
2766	922	1022
2767	923	1027
2768	923	1296
2769	923	876
2770	924	1143
2771	924	1154
2772	924	849
2773	925	1124
2774	925	954
2775	925	1189
2776	926	852
2777	926	1283
2778	926	890
2779	927	991
2780	927	1133
2781	927	1132
2782	928	952
2783	928	1008
2784	928	926
2785	929	1304
2786	929	936
2787	929	1087
2788	930	850
2789	930	1075
2790	930	918
2791	931	1059
2792	931	1233
2793	931	899
2794	932	1051
2795	932	1115
2796	932	846
2797	933	1294
2798	933	982
2799	933	900
2800	934	1010
2801	934	828
2802	934	1000
2803	935	891
2804	935	922
2805	935	1097
2806	936	941
2807	936	985
2808	936	1020
2809	937	1031
2810	937	1242
2811	937	956
2812	938	1297
2813	938	1002
2814	938	1168
2815	939	1249
2816	939	939
2817	939	895
2818	940	1271
2819	940	1064
2820	940	1049
2821	941	945
2822	941	1068
2823	941	1292
2824	942	1079
2825	942	853
2826	942	999
2827	943	912
2828	943	1180
2829	943	895
2830	944	1270
2831	944	1056
2832	944	1030
2833	945	1128
2834	945	1200
2835	945	1202
2836	946	813
2837	946	1247
2838	946	951
2839	947	1136
2840	947	1141
2841	947	1227
2842	948	899
2843	948	980
2844	948	1051
2845	949	1275
2846	949	867
2847	949	862
2848	950	955
2849	950	1224
2850	950	1208
2851	951	1292
2852	951	1140
2853	951	881
2854	952	1018
2855	952	858
2856	952	1139
2857	953	1275
2858	953	1019
2859	953	1063
2860	954	1244
2861	954	824
2862	954	1222
2863	955	1061
2864	955	890
2865	955	876
2866	956	1038
2867	956	1295
2868	956	950
2869	957	1262
2870	957	840
2871	957	1083
2872	958	1084
2873	958	1278
2874	958	1209
2875	959	1306
2876	959	907
2877	959	1012
2878	960	872
2879	960	1091
2880	960	811
2881	961	884
2882	961	1143
2883	961	1132
2884	962	855
2885	962	837
2886	962	997
2887	963	994
2888	963	1270
2889	963	1186
2890	964	1070
2891	964	998
2892	964	1067
2893	965	941
2894	965	861
2895	965	1112
2896	966	1134
2897	966	935
2898	966	1062
2899	967	1091
2900	967	889
2901	967	1299
2902	968	1085
2903	968	914
2904	968	1016
2905	969	1233
2906	969	1076
2907	969	1184
2908	970	1268
2909	970	927
2910	970	1244
2911	971	1242
2912	971	1269
2913	971	1267
2914	972	978
2915	972	1041
2916	972	859
2917	973	1249
2918	973	1108
2919	973	989
2920	974	1223
2921	974	1045
2922	974	1287
2923	975	826
2924	975	893
2925	975	870
2926	976	1098
2927	976	1060
2928	976	852
2929	977	1187
2930	977	1108
2931	977	975
2932	978	1248
2933	978	903
2934	978	1063
2935	979	858
2936	979	820
2937	979	1135
2938	980	869
2939	980	1113
2940	980	1220
2941	981	912
2942	981	1149
2943	981	986
2944	982	1024
2945	982	1033
2946	982	1134
2947	983	1054
2948	983	1069
2949	983	1289
2950	984	1062
2951	984	1053
2952	984	1169
2953	985	1012
2954	985	1071
2955	985	1149
2956	986	813
2957	986	1031
2958	986	862
2959	987	993
2960	987	875
2961	987	917
2962	988	1204
2963	988	909
2964	988	901
2965	989	1029
2966	989	1182
2967	989	1236
2968	990	1053
2969	990	955
2970	990	1076
2971	991	1189
2972	991	1014
2973	991	1294
2974	992	1252
2975	992	1251
2976	992	830
2977	993	822
2978	993	1264
2979	993	995
2980	994	898
2981	994	1205
2982	994	1056
2983	995	1170
2984	995	1275
2985	995	913
2986	996	1167
2987	996	1235
2988	996	900
2989	997	945
2990	997	933
2991	997	857
2992	998	862
2993	998	817
2994	998	1179
2995	999	1161
2996	999	1084
2997	999	1176
2998	1000	849
2999	1000	1187
3000	1000	1131
3001	1001	816
3002	1001	988
3003	1001	1220
3004	1002	839
3005	1002	1019
3006	1002	1193
3007	1003	1032
3008	1003	976
3009	1003	889
3010	1004	1263
3011	1004	1188
3012	1004	986
3013	1005	1243
3014	1005	1085
3015	1005	1020
3016	1006	1276
3017	1006	876
3018	1006	1243
3019	1007	1179
3020	1007	938
3021	1007	1289
3022	1008	1168
3023	1008	939
3024	1008	1310
3025	1009	898
3026	1009	941
3027	1009	974
3028	1010	1200
3029	1010	1052
3030	1010	1247
3031	1011	1304
3032	1011	908
3033	1011	1159
3034	1012	942
3035	1012	835
3036	1012	1034
3037	1013	935
3038	1013	1207
3039	1013	1197
3040	1014	1047
3041	1014	1075
3042	1014	1150
3043	1015	941
3044	1015	1188
3045	1015	1066
3046	1016	925
3047	1016	1094
3048	1016	939
3049	1017	1235
3050	1017	1063
3051	1017	1075
3052	1018	1223
3053	1018	1167
3054	1018	996
3055	1019	1147
3056	1019	1269
3057	1019	891
3058	1020	1008
3059	1020	1280
3060	1020	882
3061	1021	1092
3062	1021	1024
3063	1021	990
3064	1022	1094
3065	1022	827
3066	1022	1136
3067	1023	1144
3068	1023	874
3069	1023	945
3070	1024	1123
3071	1024	1301
3072	1024	1153
3073	1025	816
3074	1025	986
3075	1025	819
3076	1026	936
3077	1026	1202
3078	1026	1083
3079	1027	1001
3080	1027	1121
3081	1027	836
3082	1028	1290
3083	1028	954
3084	1028	829
3085	1029	1080
3086	1029	920
3087	1029	1112
3088	1030	979
3089	1030	1243
3090	1030	1283
3091	1031	817
3092	1031	897
3093	1031	1212
3094	1032	1087
3095	1032	929
3096	1032	1075
3097	1033	1144
3098	1033	1280
3099	1033	1170
3100	1034	941
3101	1034	867
3102	1034	990
3103	1035	1266
3104	1035	1099
3105	1035	1165
3106	1036	900
3107	1036	1147
3108	1036	891
3109	1037	1249
3110	1037	1118
3111	1037	944
3112	1038	911
3113	1038	827
3114	1038	1094
3115	1039	847
3116	1039	890
3117	1039	1233
3118	1040	1237
3119	1040	1056
3120	1040	1051
3121	1041	1011
3122	1041	909
3123	1041	884
3124	1042	868
3125	1042	814
3126	1042	905
3127	1043	990
3128	1043	1021
3129	1043	944
3130	1044	927
3131	1044	1044
3132	1044	1164
3133	1045	1231
3134	1045	883
3135	1045	925
3136	1046	1044
3137	1046	1120
3138	1046	1129
3139	1047	1230
3140	1047	1177
3141	1047	1017
3142	1048	1094
3143	1048	1157
3144	1048	1145
3145	1049	1052
3146	1049	936
3147	1049	1155
3148	1050	1279
3149	1050	905
3150	1050	837
3151	1051	935
3152	1051	1030
3153	1051	1080
3154	1052	988
3155	1052	1188
3156	1052	893
3157	1053	909
3158	1053	1170
3159	1053	1227
3160	1054	922
3161	1054	1166
3162	1054	1153
3163	1055	1137
3164	1055	953
3165	1055	1259
3166	1056	1248
3167	1056	1292
3168	1056	940
3169	1057	1030
3170	1057	1134
3171	1057	1050
3172	1058	822
3173	1058	1218
3174	1058	953
3175	1059	831
3176	1059	1205
3177	1059	1021
3178	1060	1254
3179	1060	1261
3180	1060	1027
3181	1061	1130
3182	1061	962
3183	1061	916
3184	1062	927
3185	1062	1292
3186	1062	1304
3187	1063	1196
3188	1063	1275
3189	1063	1104
3190	1064	983
3191	1064	1204
3192	1064	1238
3193	1065	1089
3194	1065	811
3195	1065	968
3196	1066	926
3197	1066	1272
3198	1066	1216
3199	1067	1082
3200	1067	1183
3201	1067	1192
3202	1068	1023
3203	1068	1228
3204	1068	1032
3205	1069	1240
3206	1069	832
3207	1069	874
3208	1070	1186
3209	1070	834
3210	1070	934
3211	1071	1284
3212	1071	849
3213	1071	1136
3214	1072	1295
3215	1072	926
3216	1072	1144
3217	1073	903
3218	1073	883
3219	1073	910
3220	1074	1097
3221	1074	1144
3222	1074	1275
3223	1075	1092
3224	1075	1298
3225	1075	855
3226	1076	1254
3227	1076	1260
3228	1076	1028
3229	1077	1071
3230	1077	1037
3231	1077	1075
3232	1078	859
3233	1078	1000
3234	1078	836
3235	1079	950
3236	1079	872
3237	1079	1268
3238	1080	1242
3239	1080	975
3240	1080	1153
3241	1081	1045
3242	1081	1102
3243	1081	1059
3244	1082	1038
3245	1082	985
3246	1082	909
3247	1083	1040
3248	1083	976
3249	1083	863
3250	1084	1052
3251	1084	907
3252	1084	1076
3253	1085	1201
3254	1085	1030
3255	1085	883
3256	1086	1162
3257	1086	1239
3258	1086	962
3259	1087	1251
3260	1087	996
3261	1087	1253
3262	1088	1078
3263	1088	1174
3264	1088	1193
3265	1089	1195
3266	1089	1184
3267	1089	1256
3268	1090	994
3269	1090	1204
3270	1090	1261
3271	1091	951
3272	1091	830
3273	1091	896
3274	1092	856
3275	1092	1099
3276	1092	1077
3277	1093	1133
3278	1093	996
3279	1093	949
3280	1094	990
3281	1094	1138
3282	1094	1071
3283	1095	984
3284	1095	1088
3285	1095	925
3286	1096	1295
3287	1096	871
3288	1096	922
3289	1097	988
3290	1097	1095
3291	1097	1205
3292	1098	1063
3293	1098	939
3294	1098	1285
3295	1099	1272
3296	1099	1055
3297	1099	1009
3298	1100	1194
3299	1100	1038
3300	1100	1081
3301	1101	1082
3302	1101	811
3303	1101	854
3304	1102	1088
3305	1102	1079
3306	1102	908
3307	1103	1212
3308	1103	958
3309	1103	819
3310	1104	1157
3311	1104	1268
3312	1104	1122
3313	1105	826
3314	1105	1095
3315	1105	855
3316	1106	865
3317	1106	1260
3318	1106	856
3319	1107	1154
3320	1107	1206
3321	1107	1239
3322	1108	1231
3323	1108	1180
3324	1108	1102
3325	1109	910
3326	1109	1278
3327	1109	1129
3328	1110	1014
3329	1110	1158
3330	1110	833
3331	1111	1150
3332	1111	1114
3333	1111	1268
3334	1112	1192
3335	1112	1031
3336	1112	846
3337	1113	908
3338	1113	1166
3339	1113	1258
3340	1114	1267
3341	1114	968
3342	1114	921
3343	1115	1144
3344	1115	1011
3345	1115	898
3346	1116	1175
3347	1116	1140
3348	1116	880
3349	1117	1015
3350	1117	935
3351	1117	876
3352	1118	1270
3353	1118	1234
3354	1118	1190
3355	1119	1056
3356	1119	895
3357	1119	1153
3358	1120	873
3359	1120	865
3360	1120	1178
3361	1121	1150
3362	1121	1114
3363	1121	862
3364	1122	933
3365	1122	1187
3366	1122	1216
3367	1123	1125
3368	1123	1186
3369	1123	951
3370	1124	920
3371	1124	996
3372	1124	1114
3373	1125	1036
3374	1125	818
3375	1125	812
3376	1126	1183
3377	1126	916
3378	1126	1086
3379	1127	1013
3380	1127	1201
3381	1127	916
3382	1128	1085
3383	1128	1164
3384	1128	1151
3385	1129	1125
3386	1129	948
3387	1129	888
3388	1130	1151
3389	1130	882
3390	1130	1105
3391	1131	996
3392	1131	830
3393	1131	861
3394	1132	1155
3395	1132	1275
3396	1132	1144
3397	1133	1008
3398	1133	1283
3399	1133	931
3400	1134	1153
3401	1134	1111
3402	1134	940
3403	1135	1170
3404	1135	831
3405	1135	1075
3406	1136	894
3407	1136	1191
3408	1136	1116
3409	1137	986
3410	1137	1244
3411	1137	1085
3412	1138	817
3413	1138	1297
3414	1138	986
3415	1139	841
3416	1139	893
3417	1139	823
3418	1140	1071
3419	1140	1151
3420	1140	1173
3421	1141	914
3422	1141	823
3423	1141	1122
3424	1142	960
3425	1142	975
3426	1142	1182
3427	1143	1004
3428	1143	902
3429	1143	1038
3430	1144	1305
3431	1144	1157
3432	1144	986
3433	1145	861
3434	1145	1148
3435	1145	1267
3436	1146	1158
3437	1146	1132
3438	1146	836
3439	1147	953
3440	1147	1166
3441	1147	1069
3442	1148	1274
3443	1148	1122
3444	1148	816
3445	1149	822
3446	1149	1177
3447	1149	1150
3448	1150	1089
3449	1150	1013
3450	1150	1053
3451	1151	1218
3452	1151	981
3453	1151	940
3454	1152	901
3455	1152	1037
3456	1152	1086
3457	1153	1111
3458	1153	1057
3459	1153	982
3460	1154	822
3461	1154	1012
3462	1154	1202
3463	1155	1009
3464	1155	1214
3465	1155	977
3466	1156	1076
3467	1156	981
3468	1156	1245
3469	1157	1056
3470	1157	1277
3471	1157	1148
3472	1158	995
3473	1158	960
3474	1158	892
3475	1159	865
3476	1159	950
3477	1159	827
3478	1160	882
3479	1160	907
3480	1160	1053
3481	1161	1216
3482	1161	861
3483	1161	942
3484	1162	976
3485	1162	982
3486	1162	1028
3487	1163	1079
3488	1163	928
3489	1163	1241
3490	1164	986
3491	1164	947
3492	1164	956
3493	1165	1017
3494	1165	1158
3495	1165	863
3496	1166	1044
3497	1166	926
3498	1166	824
3499	1167	1056
3500	1167	1215
3501	1167	1279
3502	1168	1025
3503	1168	1015
3504	1168	1057
3505	1169	1112
3506	1169	950
3507	1169	1075
3508	1170	999
3509	1170	842
3510	1170	1236
3511	1171	1190
3512	1171	1180
3513	1171	1043
3514	1172	1206
3515	1172	1148
3516	1172	1294
3517	1173	969
3518	1173	1088
3519	1173	1041
3520	1174	1305
3521	1174	1087
3522	1174	1009
3523	1175	1190
3524	1175	1023
3525	1175	1051
3526	1176	1259
3527	1176	1112
3528	1176	1288
3529	1177	940
3530	1177	1152
3531	1177	979
3532	1178	1310
3533	1178	1057
3534	1178	1122
3535	1179	1300
3536	1179	1022
3537	1179	1185
3538	1180	845
3539	1180	1098
3540	1180	828
3541	1181	1260
3542	1181	1121
3543	1181	1150
3544	1182	970
3545	1182	912
3546	1182	968
3547	1183	1286
3548	1183	926
3549	1183	966
3550	1184	883
3551	1184	1114
3552	1184	1007
3553	1185	884
3554	1185	977
3555	1185	877
3556	1186	1068
3557	1186	1184
3558	1186	1034
3559	1187	1112
3560	1187	1020
3561	1187	1246
3562	1188	1152
3563	1188	985
3564	1188	1236
3565	1189	932
3566	1189	1254
3567	1189	1285
3568	1190	1267
3569	1190	901
3570	1190	1250
3571	1191	1255
3572	1191	1007
3573	1191	1070
3574	1192	1298
3575	1192	1154
3576	1192	1293
3577	1193	1020
3578	1193	1300
3579	1193	1052
3580	1194	1021
3581	1194	1216
3582	1194	1148
3583	1195	1284
3584	1195	1275
3585	1195	1068
3586	1196	824
3587	1196	1118
3588	1196	852
3589	1197	864
3590	1197	834
3591	1197	1241
3592	1198	964
3593	1198	1172
3594	1198	1305
3595	1199	1220
3596	1199	1132
3597	1199	877
3598	1200	1290
3599	1200	1195
3600	1200	1201
3601	1201	961
3602	1201	947
3603	1201	1118
3604	1202	1142
3605	1202	1108
3606	1202	1116
3607	1203	1307
3608	1203	1109
3609	1203	1025
3610	1204	945
3611	1204	1263
3612	1204	1254
3613	1205	870
3614	1205	1029
3615	1205	1072
3616	1206	1146
3617	1206	1246
3618	1206	1297
3619	1207	973
3620	1207	954
3621	1207	1102
3622	1208	904
3623	1208	1238
3624	1208	1221
3625	1209	1036
3626	1209	1308
3627	1209	881
3628	1210	1201
3629	1210	911
3630	1210	1086
3631	1211	837
3632	1211	902
3633	1211	1137
3634	1212	1085
3635	1212	1090
3636	1212	889
3637	1213	881
3638	1213	1085
3639	1213	1016
3640	1214	1005
3641	1214	846
3642	1214	1100
3643	1215	841
3644	1215	1087
3645	1215	1172
3646	1216	900
3647	1216	847
3648	1216	1187
3649	1217	1258
3650	1217	875
3651	1217	1244
3652	1218	853
3653	1218	953
3654	1218	1134
3655	1219	969
3656	1219	1145
3657	1219	1112
3658	1220	1243
3659	1220	961
3660	1220	1191
3661	1221	869
3662	1221	1035
3663	1221	1269
3664	1222	937
3665	1222	811
3666	1222	1187
3667	1223	1242
3668	1223	1063
3669	1223	934
3670	1224	1001
3671	1224	1118
3672	1224	1048
3673	1225	985
3674	1225	1269
3675	1225	1047
3676	1226	889
3677	1226	1266
3678	1226	1009
3679	1227	969
3680	1227	1307
3681	1227	1207
3682	1228	851
3683	1228	1234
3684	1228	1047
3685	1229	945
3686	1229	1161
3687	1229	1026
3688	1230	881
3689	1230	1263
3690	1230	1050
3691	1231	961
3692	1231	1148
3693	1231	1234
3694	1232	1054
3695	1232	1186
3696	1232	1156
3697	1233	1103
3698	1233	1128
3699	1233	1218
3700	1234	1034
3701	1234	1068
3702	1234	992
3703	1235	943
3704	1235	1050
3705	1235	1265
3706	1236	1231
3707	1236	1305
3708	1236	1165
3709	1237	915
3710	1237	876
3711	1237	1237
3712	1238	1272
3713	1238	1296
3714	1238	1225
3715	1239	876
3716	1239	1014
3717	1239	1030
3718	1240	1014
3719	1240	1009
3720	1240	1120
3721	1241	1236
3722	1241	992
3723	1241	884
3724	1242	938
3725	1242	1165
3726	1242	1298
3727	1243	875
3728	1243	1025
3729	1243	1216
3730	1244	845
3731	1244	949
3732	1244	988
3733	1245	1225
3734	1245	903
3735	1245	1159
3736	1246	968
3737	1246	990
3738	1246	1234
3739	1247	858
3740	1247	1076
3741	1247	987
3742	1248	1301
3743	1248	864
3744	1248	1058
3745	1249	1157
3746	1249	904
3747	1249	1162
3748	1250	1078
3749	1250	905
3750	1250	878
3751	1251	827
3752	1251	1187
3753	1251	1252
3754	1252	1066
3755	1252	1046
3756	1252	1105
3757	1253	1182
3758	1253	1262
3759	1253	1058
3760	1254	1267
3761	1254	1291
3762	1254	1168
3763	1255	1300
3764	1255	1088
3765	1255	818
3766	1256	956
3767	1256	1173
3768	1256	841
3769	1257	1165
3770	1257	908
3771	1257	954
3772	1258	1075
3773	1258	1031
3774	1258	1125
3775	1259	859
3776	1259	1210
3777	1259	1032
3778	1260	1127
3779	1260	936
3780	1260	1048
3781	1261	829
3782	1261	1254
3783	1261	1237
3784	1262	1211
3785	1262	836
3786	1262	1275
3787	1263	1015
3788	1263	860
3789	1263	1010
3790	1264	1247
3791	1264	1031
3792	1264	1107
3793	1265	925
3794	1265	1042
3795	1265	904
3796	1266	930
3797	1266	945
3798	1266	1256
3799	1267	1029
3800	1267	965
3801	1267	847
3802	1268	968
3803	1268	1141
3804	1268	876
3805	1269	1255
3806	1269	1203
3807	1269	1144
3808	1270	1145
3809	1270	940
3810	1270	1128
3811	1271	989
3812	1271	819
3813	1271	1295
3814	1272	848
3815	1272	915
3816	1272	1082
3817	1273	1269
3818	1273	1194
3819	1273	1002
3820	1274	1089
3821	1274	1221
3822	1274	1185
3823	1275	1234
3824	1275	1188
3825	1275	1102
3826	1276	1063
3827	1276	1232
3828	1276	993
3829	1277	1128
3830	1277	1075
3831	1277	839
3832	1278	989
3833	1278	858
3834	1278	876
3835	1279	1288
3836	1279	1175
3837	1279	918
3838	1280	1201
3839	1280	1048
3840	1280	1152
3841	1281	841
3842	1281	822
3843	1281	1140
3844	1282	1021
3845	1282	1172
3846	1282	1103
3847	1283	1099
3848	1283	1022
3849	1283	837
3850	1284	951
3851	1284	1281
3852	1284	1098
3853	1285	1245
3854	1285	1031
3855	1285	1273
3856	1286	1159
3857	1286	1281
3858	1286	1084
3859	1287	943
3860	1287	1172
3861	1287	1098
3862	1288	872
3863	1288	838
3864	1288	1300
3865	1289	1289
3866	1289	865
3867	1289	1008
3868	1290	1058
3869	1290	1034
3870	1290	1066
3871	1291	1068
3872	1291	1152
3873	1291	1278
3874	1292	1115
3875	1292	917
3876	1292	1244
3877	1293	984
3878	1293	1108
3879	1293	918
3880	1294	1307
3881	1294	971
3882	1294	1283
3883	1295	1047
3884	1295	1138
3885	1295	1272
3886	1296	1096
3887	1296	1153
3888	1296	965
3889	1297	1057
3890	1297	871
3891	1297	1194
3892	1298	1292
3893	1298	1231
3894	1298	1196
3895	1299	1021
3896	1299	1054
3897	1299	1284
3898	1300	916
3899	1300	932
3900	1300	1176
3901	1301	1006
3902	1301	894
3903	1301	1052
3904	1302	996
3905	1302	971
3906	1302	998
3907	1303	1285
3908	1303	866
3909	1303	822
3910	1304	894
3911	1304	1238
3912	1304	999
3913	1305	1230
3914	1305	1090
3915	1305	843
3916	1306	1098
3917	1306	1211
3918	1306	1101
3919	1307	999
3920	1307	997
3921	1307	1171
3922	1308	1178
3923	1308	1045
3924	1308	941
3925	1309	1261
3926	1309	940
3927	1309	936
3928	1310	917
3929	1310	947
3930	1310	1146
\.


--
-- TOC entry 3798 (class 0 OID 16791)
-- Dependencies: 265
-- Data for Name: rooms_chair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_chair (id, name, width, length, height, type) FROM stdin;
811	RCEvOMWoCTLGfwGSXEphrBGjEwXcVh	1	1	1	CHT1
812	oblPFEOKASTRUHzRxlgPFjuMWqdGik	1	1	1	CHT1
813	rVXqGmoalQEpkURlVTSPqTpcisrkWV	1	1	1	CHT1
814	NRlGOSNpbzxQHvlZVsSIxOdGKWSZGC	1	1	1	CHT2
815	PSRQxsnhoUKOYCTDZbeipgMzcVWxDk	1	1	1	CHT2
816	uajRehcojlrmpBldGTWfFwSpTiwqZA	1	1	1	CHT2
817	YnFHhlZhAQYfHZGKRheYuHTVirnnGp	1	1	1	CHT3
818	ZZAGUaPFBAEMRjsvTrvGgtkaMhLdWn	1	1	1	CHT2
819	cmLhdZvHpoKbbRjjlrZXwakCcDlYKW	1	1	1	CHT2
820	MJWhnkJHOgsfJpJGhHrVgAauvBzyid	1	1	1	CHT1
821	FOqfirHUeNZEMjKgmNhXmRyAYqboWj	1	1	1	CHT2
822	aTfcUDCwFjHjWYphPBVhWjheWrkhZX	1	1	1	CHT3
823	SuvEHkCsPbjblOhQcpmnjWzFMElsKa	1	1	1	CHT2
824	dmdCntRNXuAEecCXPjxfwHGybkYTgG	1	1	1	CHT3
825	XYZZBwHyNwQChzGEKNgpQkCbJHMqNl	1	1	1	CHT1
826	HwVzJZxLNNjsmBeHyIJYagOQoEFHIe	1	1	1	CHT1
827	nrhWGWcLWkovAaJTttVyRKrletWfsC	1	1	1	CHT3
828	EBFcYUWMeBNUcxLjSIaOzKTPxSjAwT	1	1	1	CHT3
829	ubFGGPXDItJZSMbIqfsddCVqilNRcU	1	1	1	CHT2
830	xhrRifJjuMPOTBxzZJVSwnCyEJnwiO	1	1	1	CHT3
831	AsGEsrIvxaRrqUmWoYvALQyFEgqmPj	1	1	1	CHT2
832	dwxdDjPQdZRnHetrrLAmpfGYoNTGzY	1	1	1	CHT3
833	dDsIaBilWXFeinLMLvKgmsFofQDsui	1	1	1	CHT1
834	KHZxZqjsqNKIodPlCCHZuVzGYfNgOL	1	1	1	CHT2
835	LlYXiwaOXVmfFGJSEclMXKHwbedDKj	1	1	1	CHT1
836	HsngmfAHnxfpLZUOdncrhYiUGgqBVi	1	1	1	CHT2
837	mrJNgAOADfoWxprufxiGHFpCHhrCLo	1	1	1	CHT3
838	vMQuAKXrRuNqynQuKRNZHordbByVrE	1	1	1	CHT3
839	DhSYqrZbUqHfuMfqTNjBiyjIHFRxkw	1	1	1	CHT3
840	sfAOhjmZGIAkrzgqYhvxTLAspwBgWY	1	1	1	CHT1
841	osWYfSKZrpaEzMmmFvcFsszZsVZLrq	1	1	1	CHT3
842	AbQQYThsNNYpFgZdVYtPNzKCxoPfbc	1	1	1	CHT3
843	KIDRLaLXAqrQycnDJIeTNYnPnQesCJ	1	1	1	CHT3
844	oFkgNcSbNQfyYRmSXsDWxZzraZWxQi	1	1	1	CHT3
845	QsAJEzknKHVjyhSqrXBfZaqpKTnBke	1	1	1	CHT2
846	KWGOLyrMUqbuMHNJWhqRjmyhercVdT	1	1	1	CHT3
847	liUUVAeowTqIkJkWjHLUQoMAHEgOqM	1	1	1	CHT3
848	yIuFcAlVdBbgkRlIgFPcVPcjbNsbsd	1	1	1	CHT3
849	TgYOOjHRKXyYnfWelRbCVZsxwWjRdS	1	1	1	CHT3
850	qTlGIShYPdUDOLKDUYZDyGXdZqfLtg	1	1	1	CHT1
851	MlnhWiUMwbScPgXKYBWjOOTKZsOwyH	1	1	1	CHT2
852	uXjGSPrnByzMzlvEyudqCZOvMipncN	1	1	1	CHT1
853	LzhMaGxamlUjdZbkDaCEVWhWldbZhy	1	1	1	CHT2
854	FVcCMWrGUwnHsTeHJWYgVrgRJprKAm	1	1	1	CHT3
855	oPOTBRCypZkneKAlZgkjcXZjWlSTiR	1	1	1	CHT1
856	DpEnMKxFuyPhDauTTsEXZMJTZELmFQ	1	1	1	CHT1
857	SiUyRNnvhdAkLWYHhxyiIxYrDJCSTs	1	1	1	CHT3
858	fgNkafJwbOInqRKGpLdsVcLgwHGKtI	1	1	1	CHT2
859	PrWAWETqjCKjJDwDqhHQEZduOqPOll	1	1	1	CHT2
860	mXblNBpEErbdpqhQvUkJqKtXRskAov	1	1	1	CHT1
861	oRhCDsjaYjJBLfYizNCewIFwUZyijh	1	1	1	CHT3
862	sJWOLzCLNQGTeyjQIGTXcSTEcGcfoj	1	1	1	CHT3
863	YqYyFYVCYNFqFzlQqgLPqcAINzkCiV	1	1	1	CHT3
864	OpduoldjmbaqphwvZaywORSPGRWWyZ	1	1	1	CHT2
865	MiTvtpyfxWBSBVNGFtAMNTBRlqmoen	1	1	1	CHT3
866	brSHJkShSBzkLFuvvwLXhueSIGvqlb	1	1	1	CHT3
867	AEApgjAjjRBnziPRhVTdbZEVvBVFvw	1	1	1	CHT3
868	uMHIiLpbhxDbeQPGejhFWQGhawBiyx	1	1	1	CHT1
869	fqIFLjKzkgYsWJirDPdfZrXIIjoXmB	1	1	1	CHT3
870	hGqcwYmYRCJsaxztIjFStqHkFydSnz	1	1	1	CHT2
871	ZrJkJEubFLWkyPBKAtnkGjlmrecxlP	1	1	1	CHT3
872	ujxmTNdXWcYvETatdHeJGNPXvGbxmT	1	1	1	CHT1
873	bliytozfGujFtDcZOUlMRBLcyutjjf	1	1	1	CHT2
874	lTYYpmPOBrAtaBFJaBWECMoDMTSYuJ	1	1	1	CHT3
875	DIRkOwpquNjUYEhJCgoqZhNSaLkpGB	1	1	1	CHT1
876	HWnzEgQQDrErvzsxVVTKZviTZkcBEW	1	1	1	CHT2
877	hpDmxiHVHsffkSOdTvzKatgTzYqHlc	1	1	1	CHT1
878	YHFQpQDjHKtotSChCGAxWDtpAGEoMR	1	1	1	CHT3
879	wJcTfUFFHzyDmIqjVOkCLvaHUknPqD	1	1	1	CHT2
880	HhIJDelOEGoBVxwUVQKoKhWzjYmgvL	1	1	1	CHT1
881	nPzgUZPcVHCvIrPAbRkdnsOeeHJFHa	1	1	1	CHT1
882	hYAvBGhjJSmmzScTeXgMYErzRjZVsi	1	1	1	CHT1
883	VeMazuZcviRvnfPbCykwHjGCIoDpCU	1	1	1	CHT1
884	XdSHlzCFFwwJqJobOtDRQTKuqsEVtg	1	1	1	CHT3
885	frHGvZhCSlHAwjbNAhGwtDDunwMLBK	1	1	1	CHT1
886	zNSwCSJhBnKvnUayieyzBBAuPnCSJg	1	1	1	CHT2
887	cHzXuLIrKRVJVBiiiXyoTYwDqpZuIl	1	1	1	CHT1
888	TrvtiyZPCJpbraceevQtsJujukRtPV	1	1	1	CHT2
889	wvyVGgbXmXiwPNzwyCuGdyVEKrhXai	1	1	1	CHT3
890	GgGbBNuTnMIMAwtMgaxFzNhgaGfdFT	1	1	1	CHT1
891	yyiybYuYoBdkfxWtkICUGeczQghcXL	1	1	1	CHT2
892	BFntwjMXsizCNUvqRCWuCVrTeXbEvb	1	1	1	CHT2
893	NlVjjNcTGxpnZRvjcfJGjCXmZjBDsY	1	1	1	CHT2
894	LjbslgGOuwGQHiZRtHxoZIZLQsciif	1	1	1	CHT2
895	UIzEemgNmgEWuqnWLGgXEfRDpTPkiu	1	1	1	CHT3
896	fnSfZtDMoYEuoVJtBGdFLbIYUnBMDn	1	1	1	CHT3
897	prymaKkkqpTKvvGMnaFjbRxnvQCfeO	1	1	1	CHT2
898	gqgETDhdINyRjbgMQPXRcGRfPWMDeq	1	1	1	CHT2
899	VODdRfpmKhbsBSIVMCXJNHzpqpuoFv	1	1	1	CHT3
900	dhvhTqRyjZOfOAfxuWJWkrhWhjpnCV	1	1	1	CHT3
901	kdAMMgkRcyAetlsBzRxunBLtbfaZaJ	1	1	1	CHT3
902	mkBLAlkPLLHUwAUMmqBRAtLmosyDcD	1	1	1	CHT2
903	pTWAQgzRCrYVivllllTpIUtPMfxGOa	1	1	1	CHT1
904	XqhSYSvOjqvKrcbGLKtEvEyRXYidtI	1	1	1	CHT2
905	RDEOEVhIMEuIEWoPEgqrDgbelfCShu	1	1	1	CHT3
906	kXxmRMlwQypNghkdazxBtKkLDOcDVY	1	1	1	CHT3
907	ielRUNkbWCsFmHbMDlNSjayoLRdPQh	1	1	1	CHT1
908	ZPSHSnMMeVzsdvGMykvlkrHVhqXbwy	1	1	1	CHT3
909	jAsZkBxdhPXGhxurVkuLBeTtYJrMgH	1	1	1	CHT3
910	ycePYRzJQPCgXwdCxLIjsiSiZlilUt	1	1	1	CHT1
911	cAzzTHArhGKfnzBldbNZCsfdNuVWWC	1	1	1	CHT1
912	eNuEGLQlZeGtoGbzjKAmfHjwXmBqSx	1	1	1	CHT2
913	iDdfCtzYtkwPkanaKXdkGfQdRwljAe	1	1	1	CHT3
914	DVmPFaoxXgNCOIWhELhWVCRAaSDvRx	1	1	1	CHT3
915	sSZuzVxhLNzuucTPjmjiSNHtAONBrT	1	1	1	CHT1
916	MpdEEMRhpCNYiksAYybEWPKOkicwOz	1	1	1	CHT2
917	iudVtskGstfEormQOvgjNwLlwNaSlr	1	1	1	CHT3
918	idJPOeVQsnyEiYELUTzhmbxYqfBUQF	1	1	1	CHT1
919	IdVEyDxbSMYbKOaHfUDviSuRjWyxDM	1	1	1	CHT2
920	tEStidvBkFprQDzjPHlNuFazsJoWcI	1	1	1	CHT2
921	rltvTHgfijkEGCgdZzOXzQJnyacYup	1	1	1	CHT3
922	TFmNgVPKNxBOvQapGNWRXkAMjEkDsq	1	1	1	CHT2
923	BrwuFknXMJIdtXtpvjCyKgiXrPSWPR	1	1	1	CHT2
924	EFtqsIwXUJZLkRNMXLDqEnewogOtvr	1	1	1	CHT3
925	EHZHsznEBicEMadqoPYyJOquMEorxX	1	1	1	CHT2
926	ZykGrwdUhQMXrxODwBhpzThCJSZhKW	1	1	1	CHT2
927	XAjozlwHROttcgCZVXAPPtxcoYdtHx	1	1	1	CHT1
928	KjZXwiwoCFLGqUHuSNobPMvejtLiyT	1	1	1	CHT3
929	ZAbiUZnHIYiUxzHBwIiihcoiTXKrog	1	1	1	CHT2
930	lOJxtMCAXnuRNoLIDMYwJsKLOvYzVY	1	1	1	CHT2
931	hGoUDEfowzknfcfLOmCdwIzfwdfSBQ	1	1	1	CHT3
932	zcShlrIHqikykGpgrDDmtWCbdTUiOW	1	1	1	CHT2
933	OSKnZCqrjaevWjUGBBdXVeJnjthyVM	1	1	1	CHT2
934	yHQUtmqmLMMcOCxEUJPtOAYYBsFeFM	1	1	1	CHT1
935	xLIuLMjBSNPRWqMtyVOURDGkhOhYrW	1	1	1	CHT3
936	COKDUbMrWeGLaZvDUZpARAPJrwjWhc	1	1	1	CHT1
937	tSaONaGReEePynBKzllAOYkJSNlRAQ	1	1	1	CHT1
938	WcCfGvxmbcUhzgSJMXcGnBAppUGKOK	1	1	1	CHT3
939	ZpPVxTIuZeGRdLejTWKiDjhjxjrpHj	1	1	1	CHT1
940	IUooVrcyOPdwNZiEIxmGYpcHaPzwGZ	1	1	1	CHT1
941	iIAmcoFBZgmOEfMsaLNanZgilbKINp	1	1	1	CHT2
942	ehfwKRdxbeGHJRqFBrzONeOmBUyRsG	1	1	1	CHT3
943	FvNABydypAWvtlNyXeNcWPHowgelCS	1	1	1	CHT2
944	vLwuucPObueWjCueuWsFsAltzxGQxs	1	1	1	CHT1
945	AbvQVDMEqAGHUlmzXUORhZXddIaVVz	1	1	1	CHT2
946	ThrlvSJTJNDPRFyNrKtbNTrGtfZEQW	1	1	1	CHT3
947	csYhzTSmwHuzgfnnXNsHBRyodkxCcp	1	1	1	CHT1
948	UiLKDarpQvbAvrjcfHNlRjEODxirJh	1	1	1	CHT2
949	PNFPgJQghOPQVqrXkXSjHysDNSzuZA	1	1	1	CHT2
950	ypKrctSqToLZGHbGNCvQpvKRyMutGS	1	1	1	CHT2
951	KlTZDkgwfoWKNrnMVzEhtaMXQMSCFn	1	1	1	CHT2
952	HxOnFAoNnbsrdThZtYiONZoYGHvdIL	1	1	1	CHT2
953	yCIChITkwnDCmuGUOJbbDVkVRZJGAK	1	1	1	CHT1
954	TWAJmEEVTsEjZlmGvRMTKuOTfYPdrC	1	1	1	CHT2
955	MpWIvcpjyybZCpmgLZpXDfUJuyHdUA	1	1	1	CHT2
956	qKrYsiSeBEkRZLPEAKAMxtyGTSFMFy	1	1	1	CHT3
957	rfegciqhJQZTsjMqrKCoEUwmSQVwXN	1	1	1	CHT3
958	NpblpcrAzZZFcSzqViecmfUDoLZOOX	1	1	1	CHT2
959	FzHokBRTeABPebxbXLFmQBtZlhbCcR	1	1	1	CHT3
960	FXNHoEIRaKEURChNeOLuGZMdfKiIHm	1	1	1	CHT2
961	WDEhbnhjyOoPmfvdqCNeuJgJcrRsbz	1	1	1	CHT2
962	YkvlZbNyHcmuMwmXYGOesyeKtulLvz	1	1	1	CHT2
963	QRSZqjGEKoCdTLARbtPAPNkxQrZjBF	1	1	1	CHT3
964	KsLPWxUdhcyQFsnysiwrHQxLphhrWG	1	1	1	CHT2
965	bqdXjWvRugMVsEDDraZlJBfJLtAzaY	1	1	1	CHT3
966	hiHxqHLLynWgwadgFpErpkCAAVFljN	1	1	1	CHT3
967	qMzhBHnwmnUgTNQEPtXjxTLPjUiyja	1	1	1	CHT2
968	qmgfrVBLuroGnOaKijbkLuNbFPeNFF	1	1	1	CHT3
969	ItMPpdlJEXgwbirejZjppZidLXQGlt	1	1	1	CHT2
970	wmZUvOSPkJhsJKjXsAIkpKoJEosNDs	1	1	1	CHT1
971	kCMDPFLzwvEyvZzRbtzJcUYpQhlsKp	1	1	1	CHT3
972	DjulPWOTnxMNWcMRKyiTyhWofNZqes	1	1	1	CHT2
973	aDPYuEZGlqovVBjebYxtyrwGTvNFeV	1	1	1	CHT3
974	ZMdZHIRHuxktKVqtGRbXpVKYdKzsGp	1	1	1	CHT1
975	ACrxIPuEOrgKaNQylalHuQQDrGuUlY	1	1	1	CHT2
976	PVsRQzJqhtJVzbszwQEBjwMUVsjpVA	1	1	1	CHT2
977	SjZZZpuRmYgiQNWbVJwNchqlwvqbbn	1	1	1	CHT1
978	XYDpggTGbpbbInxNKBEVdIjWXTSTvH	1	1	1	CHT1
979	abQXNuuuRHmJBfOHrICHMwKPnGkUnR	1	1	1	CHT3
980	OfKedYxdQHZQFDGYKYGZzrgQyEXukS	1	1	1	CHT3
981	dtmFzHyEASyFioOPtofnivxfYfyMyE	1	1	1	CHT2
982	JDkOOSZnhXUpSPdUUxWXSKgcpAagvd	1	1	1	CHT2
983	BWmxhMbKdJBvTDgYfsaZiOSAYyxkDT	1	1	1	CHT3
984	mldpXkKvmszHZSjUfPlTyMgorODnoF	1	1	1	CHT2
985	OungYBpLArJlkKfgOBsWjrYWxIwkpX	1	1	1	CHT2
986	FPKXwDerdzAWnKYIIyLVoxdITodxbt	1	1	1	CHT3
987	sRYYzzzfsIIvUiEDDsilHIwvfzFvjV	1	1	1	CHT1
988	cXKYqVaRpXIdfrMbCcuMGNnnoVRRRN	1	1	1	CHT1
989	mLLwrEFxsIclGeIgtmzQCcqhkwFNic	1	1	1	CHT3
990	kLbSfQIGpIGjXyrUFLbUbTYPSrrJMS	1	1	1	CHT1
991	WSsGoMQPJCTKXAxIQjwbwUYpVFEZgS	1	1	1	CHT2
992	OenjAtVeJqbPlzIOoAFLOPOuzRiCkv	1	1	1	CHT3
993	mvZbqbMjBIexbWpnjwDbnfWVcCQHbA	1	1	1	CHT2
994	KUgDyRVtmaDExSdUotgvNrWMUlFzxw	1	1	1	CHT2
995	dGRSAkZbpXOlmCvDgTjyuaLWJrYyJg	1	1	1	CHT2
996	BVizybUXVIjTVqhvZckrihFOYkLjRY	1	1	1	CHT3
997	wBVkDQXkpJOxuZSYuvndtNrmEVabMK	1	1	1	CHT3
998	eouNBuPZYuNZtcCzMCgLWmtxkOohCz	1	1	1	CHT2
999	KMcaoZNSArhNecorzsrqAyKoOHkCBS	1	1	1	CHT1
1000	KExCTknvuVmAhaGiteGhcvebXGIPaw	1	1	1	CHT2
1001	pDRasZIJDUpZcNOhCyAzwBiUAgUYFl	1	1	1	CHT3
1002	iqpJUPRupZSSTxcViZtOhwgXihDoss	1	1	1	CHT1
1003	FEMAaqFygBWRmzracvUtPuMwyCLCTU	1	1	1	CHT3
1004	fdyEZGgkhsYSnBXuzUWrhshBZpsEav	1	1	1	CHT1
1005	AKwUBWbtKSkmghWnrKBJlyKESenudc	1	1	1	CHT2
1006	WrTALvzkTTGViBTJWMmHpfCDJbINmx	1	1	1	CHT3
1007	NythOtBFhrQPYPGlAwrqoYLygdzyVD	1	1	1	CHT2
1008	aJsnvTnSoSTVILZoaIesgoFfvIxvPC	1	1	1	CHT1
1009	WTASaUHfsFxRMsYFGeTkDhLLDZEECj	1	1	1	CHT1
1010	RFhUWdhkxaLpKWvrEiKLbENkJYUYwu	1	1	1	CHT1
1011	NilHJdlYzVRajevMRfIzEGXfYSwlzs	1	1	1	CHT3
1012	UXElMcnVLXykGdPWppQsXilOnjzNYK	1	1	1	CHT3
1013	uNhUVNGEPqALqOHEjRXSqhLjQDGfJW	1	1	1	CHT3
1014	TLHaiVclDPwbZvwXCIxwGgozTqrIpI	1	1	1	CHT3
1015	uhVwCCLWyOZRZejIqyeqRxTbkuZOgq	1	1	1	CHT2
1016	CvQhDyAmAAKAgLuaEnhWUGpnblwdCG	1	1	1	CHT1
1017	TwDmhvtETGicblZaYaIcjBLrgWuGdP	1	1	1	CHT1
1018	PkIDaxjoWDpyJDgYAKXyNWggtaXHoy	1	1	1	CHT1
1019	okgXoMbQslnhiWeqComkjeQZFsmhvI	1	1	1	CHT1
1020	jnbHRmHxiDqDGvHCGnHGYJmNlFmyjr	1	1	1	CHT3
1021	UFmEbxHhJTqvBKUdPFxGStBEYDENsl	1	1	1	CHT2
1022	ooDvcmikljWlHQlgQPUswbLhMkFShe	1	1	1	CHT2
1023	OUplrSerVXBJUfnxfrRFuSQNQJWMrN	1	1	1	CHT2
1024	PatROFDSgPplwpTJIbtZdrntvxIERW	1	1	1	CHT2
1025	MLzmUtxGAEHxTzjmGsuiYJrIeJpaMo	1	1	1	CHT3
1026	PXzENVyAXpGkOKxTnFpsAOrgeuNfDl	1	1	1	CHT2
1027	RPyWnHOVgKjbaaaTFohSBjmBhTrXie	1	1	1	CHT3
1028	kMNMCYsdcJyyUnGOzPpexzIgcPkcMh	1	1	1	CHT2
1029	YmqwiIITdiDJOvRTeOtNoezAbIRAkD	1	1	1	CHT3
1030	DOaUspNqzWIvEQvANMJXglAVpPXhND	1	1	1	CHT3
1031	XpTOBpgDFuZtPwzHhHkAjQrmaGgSyS	1	1	1	CHT1
1032	fupMglvJVMRiYDKeWfaNYLWawHocvt	1	1	1	CHT2
1033	lAUAmMlvAODUqztjXWKoKCYULHHvmu	1	1	1	CHT3
1034	aUIEFHtRyYESwnRUCHyaYOhenKFAeg	1	1	1	CHT1
1035	EqXESAVkuhkysdLinvVxVZzgsKUDqR	1	1	1	CHT3
1036	XaeULIbdurWAglhaajOTrpOzWDFFSP	1	1	1	CHT3
1037	fEzGsXeGysBjpTSUghsJspclDGIvkk	1	1	1	CHT3
1038	epLmgyFeqHTUlvRFkYaKEtLqXmglho	1	1	1	CHT1
1039	HpxhKGqkGMABWjGTbIfMPGycYAYxLG	1	1	1	CHT2
1040	hBUPjdSvDZCmuJNObcVBHXfjHCkHpn	1	1	1	CHT2
1041	DWCKxMQQTiRwJOZaGUjMZyXHaJvYfr	1	1	1	CHT1
1042	EagfoAFIYNzbeZxgDCgTpwdiALAnAo	1	1	1	CHT3
1043	QCtqwuIpswBoRnUOnJmaJlLjpAYcCn	1	1	1	CHT1
1044	WwTrpVrFcrxSnQRjtUqqyueZLQFeXQ	1	1	1	CHT2
1045	limQFQClqbOBBUyZfTmGHQsppPyOeg	1	1	1	CHT1
1046	lKylBcYHTwXGMlHSNclcffofkSjEaE	1	1	1	CHT3
1047	CHTkfnavUBDofYpAtNslsdMgHnsgen	1	1	1	CHT1
1048	IKIaZvfQrCQqXEjUJwdNligBbTUgEC	1	1	1	CHT2
1049	SncLjersSOKNyrvRZuFqwLlGkdJrUQ	1	1	1	CHT3
1050	YGKzOtvjkHLeuoXqoFrxRMoUdoYytc	1	1	1	CHT3
1051	hQCllDLTrtsqKvnKZXrZjfgfOzmsCj	1	1	1	CHT1
1052	oJdMbfdnHdwKgXWAGroYDbHsMafujj	1	1	1	CHT3
1053	tZefWYJDURvsFjKYIBwGxhIBscYPce	1	1	1	CHT2
1054	TbKDXvPegMSrirTDeUQaRVdtuOCVNO	1	1	1	CHT1
1055	igAcvxSOndBOCuMDjwBXnvwfecTrRf	1	1	1	CHT1
1056	bBgCyoxepTXuOqeYSPjDeXfiavYjtu	1	1	1	CHT2
1057	bfeoyJSPjlFmKLmLxWhQijjGYloHWA	1	1	1	CHT1
1058	RhSAkjTdQUgxMLsdwkVRxgLMqduBFp	1	1	1	CHT2
1059	PDkvUHJdLTaZqeMpXBKQFqheQMUprt	1	1	1	CHT2
1060	SronNTdkVxUNPjafurXdEgDpYiXcCi	1	1	1	CHT2
1061	TLeCWbWsLpTVuokVJSZGttWOdTXDdo	1	1	1	CHT1
1062	vbKcIUxTwyKOMYLQoZXMCxjOnxPOEj	1	1	1	CHT1
1063	aKaCwGUlQDVdEqYnNjzzARHIWwbetH	1	1	1	CHT2
1064	wNcvEARVXlkcdctWoxrSaBgLPqYRBi	1	1	1	CHT2
1065	GUSHbsDleAcRGxysskESHUknCMrosF	1	1	1	CHT3
1066	dEYWnqQXBrEzwILtWrkqWlzmCckRgw	1	1	1	CHT2
1067	NMjXnvYLMtySnzjpAiBfssLeBmnTcP	1	1	1	CHT1
1068	vSDySRcthrGpIoxDcTgjtHAckzKxHL	1	1	1	CHT3
1069	mQzXjslQtQGmvvbhKEiJutpnHObAyr	1	1	1	CHT2
1070	YdmZPGHVFtnrAKMxLzHTQXjRpHcchZ	1	1	1	CHT1
1071	oVfwKbCIwHKjMjXIpkgxieSCTIsWUc	1	1	1	CHT2
1072	EyLPamDkGbdiiWLaMKfxTjCJEoRwiL	1	1	1	CHT1
1073	heNyEBaxhqwZFztsQrYexFQnIKvRoG	1	1	1	CHT3
1074	TArYlqBJtvjNbTyMwiNdUWBsnKLPrS	1	1	1	CHT1
1075	hqtfOaGMxknrjuSlimLaiPiDbUdimv	1	1	1	CHT3
1076	PelrzckfWOmOnjjsMEQCLvEAzyGOWO	1	1	1	CHT1
1077	InBCSGIBOQcpBHOPgghjbqggeWWRYm	1	1	1	CHT3
1078	dlkFVXTsApRwYWxINIKADeXHgabWuk	1	1	1	CHT2
1079	VJUdxbSkjgcFVjWZXLHwyKVucqxXOq	1	1	1	CHT3
1080	qTmHfgJggHiGjyxewlKddRJhbVKhXP	1	1	1	CHT3
1081	eRWdHDiNakuxlEhtAIvDxBVlWVALIn	1	1	1	CHT1
1082	MeTCsVynSeRkzmzeggWlgcaKpfHVxx	1	1	1	CHT3
1083	KysdsObADoFYIhkZIDKEPTdFzNkKpv	1	1	1	CHT2
1084	lRpANScULkTnQFlHyEPGNuuNevvaDG	1	1	1	CHT2
1085	MIatPNElHGPCzPAJeNGNQLTdXecktp	1	1	1	CHT2
1086	RIcpDfmeKBZIimBQFhLqJhojUYXKjl	1	1	1	CHT2
1087	FOsFYjSCVzSHnTzsJohqddOnlITmPG	1	1	1	CHT1
1088	tzslnLuhkORKCDTUwFklJRAsdbKmMk	1	1	1	CHT2
1089	jHYuVwDBCCzatfQMcXDCtcaoxuZgHb	1	1	1	CHT1
1090	bjjXStoeXFDDRrzoezEcTyStWiwnBS	1	1	1	CHT2
1091	uUkiqPUPOWorBWsItOVHlxlwhYnccs	1	1	1	CHT1
1092	nzsfYSQtwYfBZjQPfjJJlvmECFtcrN	1	1	1	CHT3
1093	bCgnkOXyYFjYSGwWGrOayaiHjnxZwi	1	1	1	CHT3
1094	cJKIprXQzJCipLgzdfZDHaEqPsaEQw	1	1	1	CHT3
1095	wVzesuXtSoNXvCiaEpcpXIKNulUAZL	1	1	1	CHT3
1096	LoPCigadwuqLucbmSJepVnQpuuQLYV	1	1	1	CHT3
1097	xdoygUgYRUhsNQhEcSveeyePjykodS	1	1	1	CHT1
1098	fpgAxMeCQToYESgmoicCCtoKTPYqEN	1	1	1	CHT3
1099	dfKcIWDATCBfQGpMKAutoDxlwCDMos	1	1	1	CHT1
1100	eSmkurETeqbkGjuuJkYEWhDjsYzNBL	1	1	1	CHT2
1101	QbehusXEqUPRGYMdFujPCcUuBnEXEZ	1	1	1	CHT1
1102	XskwyCdUSWmssxvkmdHPDAQvWwCGQw	1	1	1	CHT1
1103	qQnZdxeTfWagfjwHOfPBqyZeuGMxMi	1	1	1	CHT2
1104	YRpZVcjqceTLjdeYdVIXMXzLiYvKFr	1	1	1	CHT3
1105	BMAzPPBoSgaNGJWwepMVvzqoZlQqIo	1	1	1	CHT3
1106	ZikKtKMvZWTuWgVpOlNrsROQaLupcN	1	1	1	CHT2
1107	piPzrQZJqRPpTfTJrpIaGoETNJiUgt	1	1	1	CHT3
1108	bSBLlcqYeaIyKlLajTHvPnYhAoGHUe	1	1	1	CHT2
1109	IuPGTtCgNdOoZFQCSGLnzYjVDoPbLl	1	1	1	CHT3
1110	bJHHoKQcRZwnhncgFPNpuZhSFuWerd	1	1	1	CHT3
1111	gzPHYDCdQdxFAqltNjMVVwuLkVuDIo	1	1	1	CHT2
1112	uEVaNEwFDWjptPEJRESiRiBHFkVEYs	1	1	1	CHT3
1113	tqTiHviqqwKIazURWdTjacbvSwPbbk	1	1	1	CHT3
1114	cgsavGTWXtGCvavgVQtEZoYSBbCutG	1	1	1	CHT2
1115	maxnMomFSesOQfPIZTdWGhqNiqYvHV	1	1	1	CHT2
1116	aJQuZTtWgdcZonCFGHzOkFsxQZSkIj	1	1	1	CHT1
1117	AxubTCpqmKXSdjuMCUqhFKuEpvOoPe	1	1	1	CHT1
1118	wUifvhjbONaWfVeCODzYZBJuGiJckM	1	1	1	CHT1
1119	fUQamDwYnspVQNdFvQHDezYbFVbuzw	1	1	1	CHT3
1120	LcMhHyremmGMZmMZCEWeyBiETDUXGE	1	1	1	CHT1
1121	wChaTWfSRZlDlOqvwCvojPnTDyfncV	1	1	1	CHT3
1122	JeOpppPsyQbifnzwxFEftjuvIkfYbm	1	1	1	CHT1
1123	RaYhMRBwktoHfoXFYGayvxwFFCsFbY	1	1	1	CHT2
1124	yjcofbfAXVNTLisTPibwtxHwWFdrfD	1	1	1	CHT1
1125	OXCZjpJFLWGgNjFOCWLVGRSWiuFuAV	1	1	1	CHT1
1126	cCavhfhkqPwQcJZoCRTjvAMArfLDIF	1	1	1	CHT2
1127	vMjAsWMyKsqdiqRQOEzTeykHLLxCIe	1	1	1	CHT2
1128	adlkRxWLtjMwEZlkLZcWgXxORkmeoq	1	1	1	CHT1
1129	wOPTwAMEoXmcDMxIENjOXErNNtWfvA	1	1	1	CHT3
1130	fSsIhWTHwtXjIEWRkHEXMgBIxGglHA	1	1	1	CHT3
1131	dctKUyIFCrBQcpUsfOcgrXVqtXJNSi	1	1	1	CHT2
1132	cYTaCbAUtkZqOhcRwFZtLGvObOmjVp	1	1	1	CHT3
1133	pCqFWurNSNgEKhvQIjMcXMFGHOEDzm	1	1	1	CHT2
1134	ywPtFiwCrkRDkSuhmAyCagrvliknjR	1	1	1	CHT3
1135	wORzLqyeQEaQZDloavEUblAJkVeebG	1	1	1	CHT3
1136	ScAuyYdBeBDlwBoGiOlYZdtKuSosok	1	1	1	CHT2
1137	NmqjNCYCdvIlrssGyrKfLLauYJruRk	1	1	1	CHT3
1138	wDCqcWPzAGTqBzYkvPOBZLIvyCBzxv	1	1	1	CHT1
1139	LmWgGpPsFVSczaGfEDvXNWwuPxZhGR	1	1	1	CHT2
1140	hqRpoCYdpPsHZNxkzarEhHRYooZxOo	1	1	1	CHT3
1141	oPJJyVjCtvUxlmDEYLQZnVcUIppDhJ	1	1	1	CHT2
1142	ODbiVlxWQNFDAUTFfBMZZOWqGUVKLM	1	1	1	CHT3
1143	bUrcSMEYqetsSAUTRBcFWPiqOtPVhP	1	1	1	CHT1
1144	dSYDvzBhTmDFQFdUdjHTmSmhvhNRRA	1	1	1	CHT3
1145	KDdfEjEgUpWbnpQtNOKTcMhQQNilqm	1	1	1	CHT3
1146	yGZyjoXWCpZLKksHAgxjPCdepHiVcp	1	1	1	CHT3
1147	WKUbXerqjzAWoIOiQIrHYXsbLnabbE	1	1	1	CHT3
1148	luSVsuxpjIZcKKeoVHIxlFHRfubdAV	1	1	1	CHT3
1149	AVgQTTDZxfRDrVAaDmuQlYdOgZEJwM	1	1	1	CHT2
1150	igNDwsDmJYBgagXOXCHhqkqSRXhVnc	1	1	1	CHT2
1151	ogEETjAWVqMzQrYyYQpRNzEiOoTxGg	1	1	1	CHT3
1152	gWZJaAFZMNxabLNNMyFNpHGlDGfrNO	1	1	1	CHT2
1153	SrbPvmWDWlEAmOLoTBTspEhPVqxjXq	1	1	1	CHT1
1154	uxEYBXGfupcqiuonSFBYKokQMGxYqL	1	1	1	CHT3
1155	wkrWBCCCxjdFDtjqYjQlUMLejfEQHh	1	1	1	CHT3
1156	qbMrZQxZFBdYCUfUdJfAvoDHrnAYrz	1	1	1	CHT1
1157	RxFKyNrSuXUBYWguHVegvsmGzKOswx	1	1	1	CHT3
1158	hfTpOORoSeJqEyEiCOpUMyAqbFxVEd	1	1	1	CHT2
1159	MvnNlplCjQxRgsVgoqPLdyWqcfqWSG	1	1	1	CHT2
1160	yvdfaSwhjtRpRucLLqAkkEnLBiwjRX	1	1	1	CHT2
1161	qheUeuCOFHLNvKuVZwGWIrqXDrmEoo	1	1	1	CHT1
1162	JTUWGDnZvmLsrVOkLFwrhlcBtcXpFq	1	1	1	CHT3
1163	HINWOuVObSDcrRKDCygVTKqUgCtmjv	1	1	1	CHT1
1164	hUPyoegxNYGfMobRfiRzPnrLsRjEGR	1	1	1	CHT3
1165	rKLJbcMRCmlzbGonanjJULdpfocIOv	1	1	1	CHT2
1166	fGeeqpSwWFvBGIyxRckjCWlGewcYkK	1	1	1	CHT1
1167	SVozkDOZINQWltzIdShvRQxiafqEaI	1	1	1	CHT1
1168	ktaWfmGqlzWOmeBkrdMIlTQLwPMDvu	1	1	1	CHT1
1169	UrcawBkCqxYmLAmfjqgemOmsefhNMH	1	1	1	CHT1
1170	aCeGqswtoUClKkFsTBngmcFtTgCGjR	1	1	1	CHT3
1171	eeyqSsWaGEeXhaVdXKFgkuFrRWtJJl	1	1	1	CHT1
1172	BtAapzHTUedlGAoWZlPIsBxhgyaepa	1	1	1	CHT2
1173	kgcdiQMPXUJyswDkSUTnOroGzhdUjc	1	1	1	CHT2
1174	DMXMyciJfJjoMGjGsjoLHOwipGeaxm	1	1	1	CHT1
1175	SwlRTGSWELDLZPjLIOigAuAkgaTWxo	1	1	1	CHT3
1176	VSxnGflmJrghNoQbycImBIyGSDUfyR	1	1	1	CHT1
1177	ibwchDZimNkOWcMwrujDztytEXVWqy	1	1	1	CHT1
1178	VbxImhIjIPTRIOJAQuzBXgeuNCikFE	1	1	1	CHT2
1179	LFGoHtFnSxUhrQRFymEFRqmdlETUAT	1	1	1	CHT2
1180	qsfpHSifzDRiBahiQWhfmDWQsdlmhC	1	1	1	CHT2
1181	nlRwNAkHsWbAtHDgLROSZrDXbjVDtR	1	1	1	CHT3
1182	idWffeNCkzqPiuzthYknvIXwzcGKFr	1	1	1	CHT1
1183	UedkNGXLwJuRQlYcbPUaJDgqKrHjXJ	1	1	1	CHT2
1184	pEKFhguEKdbwySxqPgShSmRvcBlVYM	1	1	1	CHT3
1185	YafsIfFxQEHNPQcAMLDezXClzUmjRt	1	1	1	CHT3
1186	nTGstMtrMrrTYybgeHedWQkaQNNdTM	1	1	1	CHT3
1187	bFHVOVOLCYuYzyTuPCvOtBlNIVMCsr	1	1	1	CHT1
1188	ELusYaHQonhLevweIIavUgLeZEftbR	1	1	1	CHT3
1189	MzJsVitykqlnmpyNXVPvIMRLJdblaE	1	1	1	CHT3
1190	YDqpRzdaOxpdhAcDjofwTkumwzlJkm	1	1	1	CHT2
1191	WcZtCKTxPznblAoktGFIIstOZYZmDK	1	1	1	CHT2
1192	lgkWQigFudsxdlcCkYLzOuJeiRjMjg	1	1	1	CHT3
1193	lDOrAkkXFOFlwvCQcMNkqTJOzPhFDV	1	1	1	CHT1
1194	kswsyaSJKFEFALOreIFOynXytspgcp	1	1	1	CHT2
1195	MuZVEhJwmTMKombuuKoHWikxnpnhTs	1	1	1	CHT3
1196	YdmTEOcNroMVnUyrMNzyraoBosHuda	1	1	1	CHT3
1197	tJvehxNabZINTvdkeWphWZqEnRKJHi	1	1	1	CHT1
1198	KFxDPGURLtbbZLrgcWeBCqLEQEKqrE	1	1	1	CHT1
1199	SaUtGuEolqjyAUeCAJSyYnnjdZwOjg	1	1	1	CHT1
1200	JbXkgzNPZcyVTiDjmknScDIXXaKdTU	1	1	1	CHT1
1201	DXigCsmPYrEGkazLqDkIiSJSDYBGJW	1	1	1	CHT2
1202	yFmvcRhxzfkvTMrtpqerjbKajYOgzd	1	1	1	CHT2
1203	YEyHuJQjomiGTWfLMnSNrinSuiuQQE	1	1	1	CHT2
1204	gKMXTxwyeALUMNbhBOWfMvoQGcCabO	1	1	1	CHT3
1205	ANSfZrkzIHMIhFsZGIlaufvwxWktIW	1	1	1	CHT2
1206	XvfmDSHUTTYewduMCigJcuXnmkkOoN	1	1	1	CHT1
1207	LXTUwpodcypNufRtovnnOtxUHLneiW	1	1	1	CHT3
1208	WwYXhIppHuLctIliQsrRCyRoeyInRU	1	1	1	CHT2
1209	SDFbGqPqOHFsjAIDVIFZccFjRXvAap	1	1	1	CHT3
1210	byQskpjDNkUrqnrtmCrcVWdzmObQVQ	1	1	1	CHT1
1211	jraisGRGiZeWSrwmZBlMJbytNJWMgr	1	1	1	CHT2
1212	CFkuddlefIBYuQcJcqNOwMpeZayNIv	1	1	1	CHT3
1213	fcPKulwtvOcTyiFhQNOmbJKTrsGDNp	1	1	1	CHT1
1214	cXEMPObsmgAjoABeopXEfAUfDpMVxY	1	1	1	CHT2
1215	zcGYUNsaYJccHsqzVWkIuCkbuhzJBR	1	1	1	CHT1
1216	vPQwiiJfvmTMxNCEVJBYBrQylwrual	1	1	1	CHT3
1217	BfTftOojKvFnrfJiBkadBBQNbvnCSW	1	1	1	CHT1
1218	cCXnnwAGsRPpgSlJlyFhRVokLolwrN	1	1	1	CHT1
1219	XApAiwIZAUqAbePYNUGImzOkXbDRyG	1	1	1	CHT1
1220	fKdUHGcQHumNJViWvhgnmShYKxnqXr	1	1	1	CHT3
1221	dUbJcAERNTxFhFaohLXbkMccEPrOtd	1	1	1	CHT2
1222	NDNnzlumxGAhoaTMZXwDvVPJLTHmUc	1	1	1	CHT1
1223	pXrlnxzRjMoSKruTdPykduaFIIQPLz	1	1	1	CHT1
1224	wIHEzkFVhVIVZxrBkycbxMOKMbrjUj	1	1	1	CHT2
1225	THuMKLcDcgRgeEEWtqanzCTqAdZEXU	1	1	1	CHT3
1226	MmrzBmFSLBfczDRoSvDDsqOVQJWrlM	1	1	1	CHT2
1227	uirtfFTJHPYnGuqbBhDLxZADbqURtw	1	1	1	CHT1
1228	jRspHBTFiJTzwvrFQXibqQRAjAssiQ	1	1	1	CHT2
1229	gMWPYRALERulyQtvdcMbucHNpgliuL	1	1	1	CHT2
1230	VLWTylQclzjllDiYGWKgeZDeqZVenq	1	1	1	CHT1
1231	dCaVmlIHAlfCUSuioVGAdwgyjIKPJP	1	1	1	CHT1
1232	LQrqlAKoMcJXJGDUWMEQQkGUEVbJrV	1	1	1	CHT3
1233	ynGFMVylHjjVoZRjioSmpscatQKWzX	1	1	1	CHT1
1234	SeHDQgEZZhfHcvCamFcZleQaOQJcKQ	1	1	1	CHT1
1235	EUZzGFannUxGrQPngNGQUsRebgwbRT	1	1	1	CHT1
1236	OanMCueeZAYdJPvXvHDTwvCAvxAiCi	1	1	1	CHT3
1237	rgQPtWZBanDUzHXoziEPtswtpmVBwH	1	1	1	CHT1
1238	GefPYeCanOoKCTFASaKFBweLTajimE	1	1	1	CHT1
1239	BAjThtKSiKKuUExEuxSedChALcJdBp	1	1	1	CHT1
1240	jRjCLXQgETEiqbLIikQosFjbXFHqff	1	1	1	CHT3
1241	htYATtamQVtsZuzWABgYUsKzkSXops	1	1	1	CHT1
1242	FnwWsAzsazVCsyALpppqsvwjuxrnvw	1	1	1	CHT3
1243	MkSXhjRdjCVXjCdYrwBCFihEiOQvIh	1	1	1	CHT2
1244	JPmCfJGHncKQFgCAyDouJhrXkfWexd	1	1	1	CHT3
1245	UuIviUyOMOberoavFfdBGjDMcMquED	1	1	1	CHT3
1246	afVvtOWmxSsbarLfYLKalqQDwcnPkI	1	1	1	CHT2
1247	GybSKNHLFBofiIYMzyjFPOTkDHOxgf	1	1	1	CHT2
1248	LRViqQcVlDAjivjVZBQsqFfCVQYpBr	1	1	1	CHT3
1249	mveOlJVGMvhFjxiYfvgwKhXJIXrEQo	1	1	1	CHT2
1250	KqwtaMHHASzjLOFJteToZdFHYFBAsi	1	1	1	CHT1
1251	VwjfbxghkLyxAGbBxZqnUjmetropmR	1	1	1	CHT1
1252	WUpHrvndXBBBENmELxVZSrRuLhWcig	1	1	1	CHT1
1253	PHKmuWMBfyFzFNGZkDSqVEDcmaYxvA	1	1	1	CHT3
1254	McBdgjttiuaavUEwhEbmEyYSgYJLoc	1	1	1	CHT2
1255	HovlhczpDOqZSpDTMrpqWYFJePdolT	1	1	1	CHT1
1256	rPPzDrPcKVRletbBFBGwTDyyDBFlfd	1	1	1	CHT1
1257	mOZGLzsUXjJADyhFOcCMvobEoGqYgu	1	1	1	CHT1
1258	RJQOdPUesSVBBcKLoLRzhzrFCOkdDa	1	1	1	CHT2
1259	uiuzdplRKQQNUSStceQIczflSfWKee	1	1	1	CHT3
1260	HVmxcVABDBejWxdsOZWlTGnTjSUqCl	1	1	1	CHT1
1261	xOZNTzXmlWteoxXfeBvGWMauGphjVg	1	1	1	CHT3
1262	YedpJWIRqlDquznNEAuDoRsnYxSWiq	1	1	1	CHT1
1263	slukCZwCpybHdUDHJPDqRCgWyCkXRc	1	1	1	CHT1
1264	QhlvAZyonrBpiiiSOrkxjuqxWMAIwP	1	1	1	CHT2
1265	qItTcuynvjUzfPgpGEgBiequSWGcre	1	1	1	CHT2
1266	nPekvicegEThVSeAVchRYihJWugwTp	1	1	1	CHT3
1267	hPilgjJiBoLZmKdqTxFerNhjDBebpw	1	1	1	CHT3
1268	CquDvrrtvOcEprBZoAUUjhRDsZEoZg	1	1	1	CHT1
1269	dbflwDrTznaQhhnsuwQJxhnZlsFcki	1	1	1	CHT2
1270	SUhBnLmZXBYlvnpRcUgsIqqILSdqym	1	1	1	CHT2
1271	SNStVmMQrMbRnskTxxwKqmZqRImQGY	1	1	1	CHT3
1272	xZnBCTUErKMyHzfJEZsKWkRLoZZaAz	1	1	1	CHT1
1273	PBiboNCqYlPjfXQXtkhcJrOtpccwmd	1	1	1	CHT1
1274	yfkGhjKzPORYWCNsZlAFgrKVKujZDP	1	1	1	CHT3
1275	ssbNqlzASslmuiazsuDEijSgYJLMdg	1	1	1	CHT3
1276	zJavVrowkrQZLlQslTbhQyRIpDXIsd	1	1	1	CHT3
1277	neBuXQugONQWTBQAigksSAFPFgrbrZ	1	1	1	CHT1
1278	xJsjeWFXzAalQORZKWbwKqqexgynEB	1	1	1	CHT2
1279	hsARbyOnIKBwXsKoCZZMheDPDPpeAa	1	1	1	CHT2
1280	JIPoaIwvxtYakBYkOtcJbkkoEmAFVx	1	1	1	CHT1
1281	RuaTZeXIXORKRZmmMyZmRkbHvhStTw	1	1	1	CHT3
1282	udktNLgOwwfKqoZDaMrxLVcawBapUS	1	1	1	CHT3
1283	SsIoMcXvzRQVLtWGGjEhWCqVJmYOEm	1	1	1	CHT2
1284	DakzJyNUEhjphahyUKLAxsXNKfmdPK	1	1	1	CHT1
1285	ADgvCVTzwjGCvYkfymbsBDcFEGpvhJ	1	1	1	CHT2
1286	lyebajodgYZKeiJvyytHMhiTiKZdRj	1	1	1	CHT1
1287	CDosZgLLOZpdtgzUHCcpvOxGYGDYFk	1	1	1	CHT1
1288	DwLjcXRGzUPOcIJIWoZeHLQddGJqcq	1	1	1	CHT2
1289	MQwBqoQLBUPenbIvcnOweMYyKlGygi	1	1	1	CHT2
1290	ICEGnafRLekVOFTnTnWFDIKiDzZrBW	1	1	1	CHT2
1291	AmPVpMGwAnEZSsqrSJcygoxhvagafO	1	1	1	CHT3
1292	leJXTSQzZAeIGIoeoUngRAkPgukoFe	1	1	1	CHT3
1293	CVFvmEkSYiIZZCuvYFRLtoxQAZgzBQ	1	1	1	CHT2
1294	SjCzUrfCZneCRXonpMkHxStcYWavWD	1	1	1	CHT1
1295	jWRQBCtCXufIoSyERyUehMlkLklSxq	1	1	1	CHT2
1296	IeISOvJvcwdtSEsFjDZuQutuOpwORa	1	1	1	CHT1
1297	PagQLHKmDNhimVGMCRBtBysQqIMugM	1	1	1	CHT3
1298	KlurCwXQlMwhDkOyBGujEDxxQJnmzc	1	1	1	CHT2
1299	cLsEmKvcmvOIhITcHgkqFBOMNWUGXB	1	1	1	CHT3
1300	PQSXLUpcqpBiVzhlzOJoGvFdKGLaql	1	1	1	CHT2
1301	RLeIyferZebOZkDxvMESGUVVRrclkR	1	1	1	CHT2
1302	zMIcJYXMqhuisBlQezJXUYEHqYZQqh	1	1	1	CHT1
1303	SuKPslSwKfehzFarpynVOHcLLcinFs	1	1	1	CHT3
1304	mIWKCKukEMCUNqhVyrafoMHboLfcKM	1	1	1	CHT3
1305	VnIRLMLjEVlVirtFRQoAIGYPqazArn	1	1	1	CHT2
1306	nDgjfLKpVFtTEQmajvtcyyjpOpeMie	1	1	1	CHT2
1307	VHnhZGPKxIyqrFRvDuGDSsUecTDvCN	1	1	1	CHT3
1308	aLqFdgpfGIqUWfGflBdyxswVvxNvDA	1	1	1	CHT3
1309	jisnxiNtSSbqjpmdacHROlGnWhvzfo	1	1	1	CHT2
1310	ppDOsjXgokbiZaKbxhiEnvMdHZGmfH	1	1	1	CHT2
\.


--
-- TOC entry 3800 (class 0 OID 16800)
-- Dependencies: 267
-- Data for Name: rooms_chair_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_chair_rooms (id, chair_id, room_id) FROM stdin;
2431	811	1021
2432	811	1268
2433	811	873
2434	812	1294
2435	812	1047
2436	812	1053
2437	813	999
2438	813	1304
2439	813	1177
2440	814	927
2441	814	1247
2442	814	961
2443	815	1121
2444	815	933
2445	815	967
2446	816	967
2447	816	966
2448	816	1144
2449	817	1061
2450	817	1134
2451	817	1195
2452	818	1217
2453	818	1290
2454	818	839
2455	819	1060
2456	819	903
2457	819	1179
2458	820	1008
2459	820	1048
2460	820	864
2461	821	1034
2462	821	943
2463	821	1058
2464	822	909
2465	822	978
2466	822	953
2467	823	1012
2468	823	875
2469	823	1181
2470	824	877
2471	824	990
2472	824	1308
2473	825	1040
2474	825	1251
2475	825	1034
2476	826	895
2477	826	1210
2478	826	988
2479	827	1066
2480	827	862
2481	827	1151
2482	828	1001
2483	828	957
2484	828	1217
2485	829	1242
2486	829	903
2487	829	1106
2488	830	996
2489	830	1126
2490	830	1075
2491	831	1191
2492	831	1058
2493	831	1059
2494	832	924
2495	832	950
2496	832	979
2497	833	1290
2498	833	853
2499	833	1031
2500	834	955
2501	834	1266
2502	834	1136
2503	835	1056
2504	835	1033
2505	835	1087
2506	836	864
2507	836	930
2508	836	1004
2509	837	925
2510	837	1055
2511	837	1147
2512	838	874
2513	838	1102
2514	838	857
2515	839	1287
2516	839	1114
2517	839	1306
2518	840	933
2519	840	1094
2520	840	1060
2521	841	1018
2522	841	852
2523	841	1229
2524	842	1214
2525	842	941
2526	842	1170
2527	843	1116
2528	843	1164
2529	843	1254
2530	844	1246
2531	844	1244
2532	844	1082
2533	845	1054
2534	845	1198
2535	845	1035
2536	846	967
2537	846	882
2538	846	1217
2539	847	1290
2540	847	1021
2541	847	1258
2542	848	1272
2543	848	1145
2544	848	1035
2545	849	1048
2546	849	1016
2547	849	921
2548	850	833
2549	850	1252
2550	850	873
2551	851	1025
2552	851	1143
2553	851	904
2554	852	1003
2555	852	1282
2556	852	1004
2557	853	1150
2558	853	1005
2559	853	939
2560	854	957
2561	854	917
2562	854	1227
2563	855	1124
2564	855	1139
2565	855	1222
2566	856	1281
2567	856	1197
2568	856	880
2569	857	1062
2570	857	1204
2571	857	1251
2572	858	968
2573	858	958
2574	858	894
2575	859	1056
2576	859	833
2577	859	867
2578	860	973
2579	860	930
2580	860	1251
2581	861	1201
2582	861	906
2583	861	838
2584	862	862
2585	862	1274
2586	862	1009
2587	863	1239
2588	863	939
2589	863	922
2590	864	874
2591	864	1095
2592	864	876
2593	865	1244
2594	865	981
2595	865	976
2596	866	1158
2597	866	1195
2598	866	998
2599	867	993
2600	867	848
2601	867	1263
2602	868	837
2603	868	1017
2604	868	1099
2605	869	1290
2606	869	1307
2607	869	1068
2608	870	1047
2609	870	1287
2610	870	1165
2611	871	1030
2612	871	1004
2613	871	1160
2614	872	862
2615	872	1276
2616	872	1294
2617	873	966
2618	873	827
2619	873	880
2620	874	1253
2621	874	902
2622	874	1229
2623	875	993
2624	875	1302
2625	875	1259
2626	876	1062
2627	876	1077
2628	876	1278
2629	877	979
2630	877	864
2631	877	1090
2632	878	1008
2633	878	994
2634	878	1278
2635	879	1087
2636	879	968
2637	879	1167
2638	880	852
2639	880	1090
2640	880	938
2641	881	1001
2642	881	1240
2643	881	1154
2644	882	1079
2645	882	1253
2646	882	912
2647	883	1011
2648	883	1310
2649	883	1253
2650	884	838
2651	884	862
2652	884	1235
2653	885	995
2654	885	1075
2655	885	1097
2656	886	1001
2657	886	1268
2658	886	977
2659	887	1012
2660	887	1220
2661	887	840
2662	888	828
2663	888	899
2664	888	1235
2665	889	1035
2666	889	1128
2667	889	931
2668	890	1210
2669	890	1107
2670	890	1271
2671	891	854
2672	891	870
2673	891	968
2674	892	1246
2675	892	967
2676	892	1231
2677	893	842
2678	893	1271
2679	893	1101
2680	894	1179
2681	894	1013
2682	894	911
2683	895	1206
2684	895	1147
2685	895	1267
2686	896	883
2687	896	1307
2688	896	887
2689	897	1267
2690	897	1147
2691	897	1146
2692	898	1210
2693	898	841
2694	898	1095
2695	899	1132
2696	899	1214
2697	899	1035
2698	900	936
2699	900	1015
2700	900	1054
2701	901	983
2702	901	1206
2703	901	940
2704	902	819
2705	902	991
2706	902	1258
2707	903	1195
2708	903	1072
2709	903	820
2710	904	1199
2711	904	988
2712	904	814
2713	905	1014
2714	905	1140
2715	905	990
2716	906	1081
2717	906	1305
2718	906	1022
2719	907	948
2720	907	1058
2721	907	1096
2722	908	1191
2723	908	1063
2724	908	1295
2725	909	872
2726	909	1052
2727	909	1145
2728	910	1223
2729	910	1012
2730	910	853
2731	911	1180
2732	911	953
2733	911	1282
2734	912	885
2735	912	1012
2736	912	835
2737	913	930
2738	913	1008
2739	913	1242
2740	914	858
2741	914	1062
2742	914	1306
2743	915	874
2744	915	1280
2745	915	1150
2746	916	1279
2747	916	1165
2748	916	1006
2749	917	1144
2750	917	1304
2751	917	862
2752	918	1199
2753	918	1070
2754	918	1058
2755	919	1015
2756	919	930
2757	919	1265
2758	920	1033
2759	920	1125
2760	920	932
2761	921	1116
2762	921	1141
2763	921	1283
2764	922	1070
2765	922	1171
2766	922	1022
2767	923	1027
2768	923	1296
2769	923	876
2770	924	1143
2771	924	1154
2772	924	849
2773	925	1124
2774	925	954
2775	925	1189
2776	926	852
2777	926	1283
2778	926	890
2779	927	991
2780	927	1133
2781	927	1132
2782	928	952
2783	928	1008
2784	928	926
2785	929	1304
2786	929	936
2787	929	1087
2788	930	850
2789	930	1075
2790	930	918
2791	931	1059
2792	931	1233
2793	931	899
2794	932	1051
2795	932	1115
2796	932	846
2797	933	1294
2798	933	982
2799	933	900
2800	934	1010
2801	934	828
2802	934	1000
2803	935	891
2804	935	922
2805	935	1097
2806	936	941
2807	936	985
2808	936	1020
2809	937	1031
2810	937	1242
2811	937	956
2812	938	1297
2813	938	1002
2814	938	1168
2815	939	1249
2816	939	939
2817	939	895
2818	940	1271
2819	940	1064
2820	940	1049
2821	941	945
2822	941	1068
2823	941	1292
2824	942	1079
2825	942	853
2826	942	999
2827	943	912
2828	943	1180
2829	943	895
2830	944	1270
2831	944	1056
2832	944	1030
2833	945	1128
2834	945	1200
2835	945	1202
2836	946	813
2837	946	1247
2838	946	951
2839	947	1136
2840	947	1141
2841	947	1227
2842	948	899
2843	948	980
2844	948	1051
2845	949	1275
2846	949	867
2847	949	862
2848	950	955
2849	950	1224
2850	950	1208
2851	951	1292
2852	951	1140
2853	951	881
2854	952	1018
2855	952	858
2856	952	1139
2857	953	1275
2858	953	1019
2859	953	1063
2860	954	1244
2861	954	824
2862	954	1222
2863	955	1061
2864	955	890
2865	955	876
2866	956	1038
2867	956	1295
2868	956	950
2869	957	1262
2870	957	840
2871	957	1083
2872	958	1084
2873	958	1278
2874	958	1209
2875	959	1306
2876	959	907
2877	959	1012
2878	960	872
2879	960	1091
2880	960	811
2881	961	884
2882	961	1143
2883	961	1132
2884	962	855
2885	962	837
2886	962	997
2887	963	994
2888	963	1270
2889	963	1186
2890	964	1070
2891	964	998
2892	964	1067
2893	965	941
2894	965	861
2895	965	1112
2896	966	1134
2897	966	935
2898	966	1062
2899	967	1091
2900	967	889
2901	967	1299
2902	968	1085
2903	968	914
2904	968	1016
2905	969	1233
2906	969	1076
2907	969	1184
2908	970	1268
2909	970	927
2910	970	1244
2911	971	1242
2912	971	1269
2913	971	1267
2914	972	978
2915	972	1041
2916	972	859
2917	973	1249
2918	973	1108
2919	973	989
2920	974	1223
2921	974	1045
2922	974	1287
2923	975	826
2924	975	893
2925	975	870
2926	976	1098
2927	976	1060
2928	976	852
2929	977	1187
2930	977	1108
2931	977	975
2932	978	1248
2933	978	903
2934	978	1063
2935	979	858
2936	979	820
2937	979	1135
2938	980	869
2939	980	1113
2940	980	1220
2941	981	912
2942	981	1149
2943	981	986
2944	982	1024
2945	982	1033
2946	982	1134
2947	983	1054
2948	983	1069
2949	983	1289
2950	984	1062
2951	984	1053
2952	984	1169
2953	985	1012
2954	985	1071
2955	985	1149
2956	986	813
2957	986	1031
2958	986	862
2959	987	993
2960	987	875
2961	987	917
2962	988	1204
2963	988	909
2964	988	901
2965	989	1029
2966	989	1182
2967	989	1236
2968	990	1053
2969	990	955
2970	990	1076
2971	991	1189
2972	991	1014
2973	991	1294
2974	992	1252
2975	992	1251
2976	992	830
2977	993	822
2978	993	1264
2979	993	995
2980	994	898
2981	994	1205
2982	994	1056
2983	995	1170
2984	995	1275
2985	995	913
2986	996	1167
2987	996	1235
2988	996	900
2989	997	945
2990	997	933
2991	997	857
2992	998	862
2993	998	817
2994	998	1179
2995	999	1161
2996	999	1084
2997	999	1176
2998	1000	849
2999	1000	1187
3000	1000	1131
3001	1001	816
3002	1001	988
3003	1001	1220
3004	1002	839
3005	1002	1019
3006	1002	1193
3007	1003	1032
3008	1003	976
3009	1003	889
3010	1004	1263
3011	1004	1188
3012	1004	986
3013	1005	1243
3014	1005	1085
3015	1005	1020
3016	1006	1276
3017	1006	876
3018	1006	1243
3019	1007	1179
3020	1007	938
3021	1007	1289
3022	1008	1168
3023	1008	939
3024	1008	1310
3025	1009	898
3026	1009	941
3027	1009	974
3028	1010	1200
3029	1010	1052
3030	1010	1247
3031	1011	1304
3032	1011	908
3033	1011	1159
3034	1012	942
3035	1012	835
3036	1012	1034
3037	1013	935
3038	1013	1207
3039	1013	1197
3040	1014	1047
3041	1014	1075
3042	1014	1150
3043	1015	941
3044	1015	1188
3045	1015	1066
3046	1016	925
3047	1016	1094
3048	1016	939
3049	1017	1235
3050	1017	1063
3051	1017	1075
3052	1018	1223
3053	1018	1167
3054	1018	996
3055	1019	1147
3056	1019	1269
3057	1019	891
3058	1020	1008
3059	1020	1280
3060	1020	882
3061	1021	1092
3062	1021	1024
3063	1021	990
3064	1022	1094
3065	1022	827
3066	1022	1136
3067	1023	1144
3068	1023	874
3069	1023	945
3070	1024	1123
3071	1024	1301
3072	1024	1153
3073	1025	816
3074	1025	986
3075	1025	819
3076	1026	936
3077	1026	1202
3078	1026	1083
3079	1027	1001
3080	1027	1121
3081	1027	836
3082	1028	1290
3083	1028	954
3084	1028	829
3085	1029	1080
3086	1029	920
3087	1029	1112
3088	1030	979
3089	1030	1243
3090	1030	1283
3091	1031	817
3092	1031	897
3093	1031	1212
3094	1032	1087
3095	1032	929
3096	1032	1075
3097	1033	1144
3098	1033	1280
3099	1033	1170
3100	1034	941
3101	1034	867
3102	1034	990
3103	1035	1266
3104	1035	1099
3105	1035	1165
3106	1036	900
3107	1036	1147
3108	1036	891
3109	1037	1249
3110	1037	1118
3111	1037	944
3112	1038	911
3113	1038	827
3114	1038	1094
3115	1039	847
3116	1039	890
3117	1039	1233
3118	1040	1237
3119	1040	1056
3120	1040	1051
3121	1041	1011
3122	1041	909
3123	1041	884
3124	1042	868
3125	1042	814
3126	1042	905
3127	1043	990
3128	1043	1021
3129	1043	944
3130	1044	927
3131	1044	1044
3132	1044	1164
3133	1045	1231
3134	1045	883
3135	1045	925
3136	1046	1044
3137	1046	1120
3138	1046	1129
3139	1047	1230
3140	1047	1177
3141	1047	1017
3142	1048	1094
3143	1048	1157
3144	1048	1145
3145	1049	1052
3146	1049	936
3147	1049	1155
3148	1050	1279
3149	1050	905
3150	1050	837
3151	1051	935
3152	1051	1030
3153	1051	1080
3154	1052	988
3155	1052	1188
3156	1052	893
3157	1053	909
3158	1053	1170
3159	1053	1227
3160	1054	922
3161	1054	1166
3162	1054	1153
3163	1055	1137
3164	1055	953
3165	1055	1259
3166	1056	1248
3167	1056	1292
3168	1056	940
3169	1057	1030
3170	1057	1134
3171	1057	1050
3172	1058	822
3173	1058	1218
3174	1058	953
3175	1059	831
3176	1059	1205
3177	1059	1021
3178	1060	1254
3179	1060	1261
3180	1060	1027
3181	1061	1130
3182	1061	962
3183	1061	916
3184	1062	927
3185	1062	1292
3186	1062	1304
3187	1063	1196
3188	1063	1275
3189	1063	1104
3190	1064	983
3191	1064	1204
3192	1064	1238
3193	1065	1089
3194	1065	811
3195	1065	968
3196	1066	926
3197	1066	1272
3198	1066	1216
3199	1067	1082
3200	1067	1183
3201	1067	1192
3202	1068	1023
3203	1068	1228
3204	1068	1032
3205	1069	1240
3206	1069	832
3207	1069	874
3208	1070	1186
3209	1070	834
3210	1070	934
3211	1071	1284
3212	1071	849
3213	1071	1136
3214	1072	1295
3215	1072	926
3216	1072	1144
3217	1073	903
3218	1073	883
3219	1073	910
3220	1074	1097
3221	1074	1144
3222	1074	1275
3223	1075	1092
3224	1075	1298
3225	1075	855
3226	1076	1254
3227	1076	1260
3228	1076	1028
3229	1077	1071
3230	1077	1037
3231	1077	1075
3232	1078	859
3233	1078	1000
3234	1078	836
3235	1079	950
3236	1079	872
3237	1079	1268
3238	1080	1242
3239	1080	975
3240	1080	1153
3241	1081	1045
3242	1081	1102
3243	1081	1059
3244	1082	1038
3245	1082	985
3246	1082	909
3247	1083	1040
3248	1083	976
3249	1083	863
3250	1084	1052
3251	1084	907
3252	1084	1076
3253	1085	1201
3254	1085	1030
3255	1085	883
3256	1086	1162
3257	1086	1239
3258	1086	962
3259	1087	1251
3260	1087	996
3261	1087	1253
3262	1088	1078
3263	1088	1174
3264	1088	1193
3265	1089	1195
3266	1089	1184
3267	1089	1256
3268	1090	994
3269	1090	1204
3270	1090	1261
3271	1091	951
3272	1091	830
3273	1091	896
3274	1092	856
3275	1092	1099
3276	1092	1077
3277	1093	1133
3278	1093	996
3279	1093	949
3280	1094	990
3281	1094	1138
3282	1094	1071
3283	1095	984
3284	1095	1088
3285	1095	925
3286	1096	1295
3287	1096	871
3288	1096	922
3289	1097	988
3290	1097	1095
3291	1097	1205
3292	1098	1063
3293	1098	939
3294	1098	1285
3295	1099	1272
3296	1099	1055
3297	1099	1009
3298	1100	1194
3299	1100	1038
3300	1100	1081
3301	1101	1082
3302	1101	811
3303	1101	854
3304	1102	1088
3305	1102	1079
3306	1102	908
3307	1103	1212
3308	1103	958
3309	1103	819
3310	1104	1157
3311	1104	1268
3312	1104	1122
3313	1105	826
3314	1105	1095
3315	1105	855
3316	1106	865
3317	1106	1260
3318	1106	856
3319	1107	1154
3320	1107	1206
3321	1107	1239
3322	1108	1231
3323	1108	1180
3324	1108	1102
3325	1109	910
3326	1109	1278
3327	1109	1129
3328	1110	1014
3329	1110	1158
3330	1110	833
3331	1111	1150
3332	1111	1114
3333	1111	1268
3334	1112	1192
3335	1112	1031
3336	1112	846
3337	1113	908
3338	1113	1166
3339	1113	1258
3340	1114	1267
3341	1114	968
3342	1114	921
3343	1115	1144
3344	1115	1011
3345	1115	898
3346	1116	1175
3347	1116	1140
3348	1116	880
3349	1117	1015
3350	1117	935
3351	1117	876
3352	1118	1270
3353	1118	1234
3354	1118	1190
3355	1119	1056
3356	1119	895
3357	1119	1153
3358	1120	873
3359	1120	865
3360	1120	1178
3361	1121	1150
3362	1121	1114
3363	1121	862
3364	1122	933
3365	1122	1187
3366	1122	1216
3367	1123	1125
3368	1123	1186
3369	1123	951
3370	1124	920
3371	1124	996
3372	1124	1114
3373	1125	1036
3374	1125	818
3375	1125	812
3376	1126	1183
3377	1126	916
3378	1126	1086
3379	1127	1013
3380	1127	1201
3381	1127	916
3382	1128	1085
3383	1128	1164
3384	1128	1151
3385	1129	1125
3386	1129	948
3387	1129	888
3388	1130	1151
3389	1130	882
3390	1130	1105
3391	1131	996
3392	1131	830
3393	1131	861
3394	1132	1155
3395	1132	1275
3396	1132	1144
3397	1133	1008
3398	1133	1283
3399	1133	931
3400	1134	1153
3401	1134	1111
3402	1134	940
3403	1135	1170
3404	1135	831
3405	1135	1075
3406	1136	894
3407	1136	1191
3408	1136	1116
3409	1137	986
3410	1137	1244
3411	1137	1085
3412	1138	817
3413	1138	1297
3414	1138	986
3415	1139	841
3416	1139	893
3417	1139	823
3418	1140	1071
3419	1140	1151
3420	1140	1173
3421	1141	914
3422	1141	823
3423	1141	1122
3424	1142	960
3425	1142	975
3426	1142	1182
3427	1143	1004
3428	1143	902
3429	1143	1038
3430	1144	1305
3431	1144	1157
3432	1144	986
3433	1145	861
3434	1145	1148
3435	1145	1267
3436	1146	1158
3437	1146	1132
3438	1146	836
3439	1147	953
3440	1147	1166
3441	1147	1069
3442	1148	1274
3443	1148	1122
3444	1148	816
3445	1149	822
3446	1149	1177
3447	1149	1150
3448	1150	1089
3449	1150	1013
3450	1150	1053
3451	1151	1218
3452	1151	981
3453	1151	940
3454	1152	901
3455	1152	1037
3456	1152	1086
3457	1153	1111
3458	1153	1057
3459	1153	982
3460	1154	822
3461	1154	1012
3462	1154	1202
3463	1155	1009
3464	1155	1214
3465	1155	977
3466	1156	1076
3467	1156	981
3468	1156	1245
3469	1157	1056
3470	1157	1277
3471	1157	1148
3472	1158	995
3473	1158	960
3474	1158	892
3475	1159	865
3476	1159	950
3477	1159	827
3478	1160	882
3479	1160	907
3480	1160	1053
3481	1161	1216
3482	1161	861
3483	1161	942
3484	1162	976
3485	1162	982
3486	1162	1028
3487	1163	1079
3488	1163	928
3489	1163	1241
3490	1164	986
3491	1164	947
3492	1164	956
3493	1165	1017
3494	1165	1158
3495	1165	863
3496	1166	1044
3497	1166	926
3498	1166	824
3499	1167	1056
3500	1167	1215
3501	1167	1279
3502	1168	1025
3503	1168	1015
3504	1168	1057
3505	1169	1112
3506	1169	950
3507	1169	1075
3508	1170	999
3509	1170	842
3510	1170	1236
3511	1171	1190
3512	1171	1180
3513	1171	1043
3514	1172	1206
3515	1172	1148
3516	1172	1294
3517	1173	969
3518	1173	1088
3519	1173	1041
3520	1174	1305
3521	1174	1087
3522	1174	1009
3523	1175	1190
3524	1175	1023
3525	1175	1051
3526	1176	1259
3527	1176	1112
3528	1176	1288
3529	1177	940
3530	1177	1152
3531	1177	979
3532	1178	1310
3533	1178	1057
3534	1178	1122
3535	1179	1300
3536	1179	1022
3537	1179	1185
3538	1180	845
3539	1180	1098
3540	1180	828
3541	1181	1260
3542	1181	1121
3543	1181	1150
3544	1182	970
3545	1182	912
3546	1182	968
3547	1183	1286
3548	1183	926
3549	1183	966
3550	1184	883
3551	1184	1114
3552	1184	1007
3553	1185	884
3554	1185	977
3555	1185	877
3556	1186	1068
3557	1186	1184
3558	1186	1034
3559	1187	1112
3560	1187	1020
3561	1187	1246
3562	1188	1152
3563	1188	985
3564	1188	1236
3565	1189	932
3566	1189	1254
3567	1189	1285
3568	1190	1267
3569	1190	901
3570	1190	1250
3571	1191	1255
3572	1191	1007
3573	1191	1070
3574	1192	1298
3575	1192	1154
3576	1192	1293
3577	1193	1020
3578	1193	1300
3579	1193	1052
3580	1194	1021
3581	1194	1216
3582	1194	1148
3583	1195	1284
3584	1195	1275
3585	1195	1068
3586	1196	824
3587	1196	1118
3588	1196	852
3589	1197	864
3590	1197	834
3591	1197	1241
3592	1198	964
3593	1198	1172
3594	1198	1305
3595	1199	1220
3596	1199	1132
3597	1199	877
3598	1200	1290
3599	1200	1195
3600	1200	1201
3601	1201	961
3602	1201	947
3603	1201	1118
3604	1202	1142
3605	1202	1108
3606	1202	1116
3607	1203	1307
3608	1203	1109
3609	1203	1025
3610	1204	945
3611	1204	1263
3612	1204	1254
3613	1205	870
3614	1205	1029
3615	1205	1072
3616	1206	1146
3617	1206	1246
3618	1206	1297
3619	1207	973
3620	1207	954
3621	1207	1102
3622	1208	904
3623	1208	1238
3624	1208	1221
3625	1209	1036
3626	1209	1308
3627	1209	881
3628	1210	1201
3629	1210	911
3630	1210	1086
3631	1211	837
3632	1211	902
3633	1211	1137
3634	1212	1085
3635	1212	1090
3636	1212	889
3637	1213	881
3638	1213	1085
3639	1213	1016
3640	1214	1005
3641	1214	846
3642	1214	1100
3643	1215	841
3644	1215	1087
3645	1215	1172
3646	1216	900
3647	1216	847
3648	1216	1187
3649	1217	1258
3650	1217	875
3651	1217	1244
3652	1218	853
3653	1218	953
3654	1218	1134
3655	1219	969
3656	1219	1145
3657	1219	1112
3658	1220	1243
3659	1220	961
3660	1220	1191
3661	1221	869
3662	1221	1035
3663	1221	1269
3664	1222	937
3665	1222	811
3666	1222	1187
3667	1223	1242
3668	1223	1063
3669	1223	934
3670	1224	1001
3671	1224	1118
3672	1224	1048
3673	1225	985
3674	1225	1269
3675	1225	1047
3676	1226	889
3677	1226	1266
3678	1226	1009
3679	1227	969
3680	1227	1307
3681	1227	1207
3682	1228	851
3683	1228	1234
3684	1228	1047
3685	1229	945
3686	1229	1161
3687	1229	1026
3688	1230	881
3689	1230	1263
3690	1230	1050
3691	1231	961
3692	1231	1148
3693	1231	1234
3694	1232	1054
3695	1232	1186
3696	1232	1156
3697	1233	1103
3698	1233	1128
3699	1233	1218
3700	1234	1034
3701	1234	1068
3702	1234	992
3703	1235	943
3704	1235	1050
3705	1235	1265
3706	1236	1231
3707	1236	1305
3708	1236	1165
3709	1237	915
3710	1237	876
3711	1237	1237
3712	1238	1272
3713	1238	1296
3714	1238	1225
3715	1239	876
3716	1239	1014
3717	1239	1030
3718	1240	1014
3719	1240	1009
3720	1240	1120
3721	1241	1236
3722	1241	992
3723	1241	884
3724	1242	938
3725	1242	1165
3726	1242	1298
3727	1243	875
3728	1243	1025
3729	1243	1216
3730	1244	845
3731	1244	949
3732	1244	988
3733	1245	1225
3734	1245	903
3735	1245	1159
3736	1246	968
3737	1246	990
3738	1246	1234
3739	1247	858
3740	1247	1076
3741	1247	987
3742	1248	1301
3743	1248	864
3744	1248	1058
3745	1249	1157
3746	1249	904
3747	1249	1162
3748	1250	1078
3749	1250	905
3750	1250	878
3751	1251	827
3752	1251	1187
3753	1251	1252
3754	1252	1066
3755	1252	1046
3756	1252	1105
3757	1253	1182
3758	1253	1262
3759	1253	1058
3760	1254	1267
3761	1254	1291
3762	1254	1168
3763	1255	1300
3764	1255	1088
3765	1255	818
3766	1256	956
3767	1256	1173
3768	1256	841
3769	1257	1165
3770	1257	908
3771	1257	954
3772	1258	1075
3773	1258	1031
3774	1258	1125
3775	1259	859
3776	1259	1210
3777	1259	1032
3778	1260	1127
3779	1260	936
3780	1260	1048
3781	1261	829
3782	1261	1254
3783	1261	1237
3784	1262	1211
3785	1262	836
3786	1262	1275
3787	1263	1015
3788	1263	860
3789	1263	1010
3790	1264	1247
3791	1264	1031
3792	1264	1107
3793	1265	925
3794	1265	1042
3795	1265	904
3796	1266	930
3797	1266	945
3798	1266	1256
3799	1267	1029
3800	1267	965
3801	1267	847
3802	1268	968
3803	1268	1141
3804	1268	876
3805	1269	1255
3806	1269	1203
3807	1269	1144
3808	1270	1145
3809	1270	940
3810	1270	1128
3811	1271	989
3812	1271	819
3813	1271	1295
3814	1272	848
3815	1272	915
3816	1272	1082
3817	1273	1269
3818	1273	1194
3819	1273	1002
3820	1274	1089
3821	1274	1221
3822	1274	1185
3823	1275	1234
3824	1275	1188
3825	1275	1102
3826	1276	1063
3827	1276	1232
3828	1276	993
3829	1277	1128
3830	1277	1075
3831	1277	839
3832	1278	989
3833	1278	858
3834	1278	876
3835	1279	1288
3836	1279	1175
3837	1279	918
3838	1280	1201
3839	1280	1048
3840	1280	1152
3841	1281	841
3842	1281	822
3843	1281	1140
3844	1282	1021
3845	1282	1172
3846	1282	1103
3847	1283	1099
3848	1283	1022
3849	1283	837
3850	1284	951
3851	1284	1281
3852	1284	1098
3853	1285	1245
3854	1285	1031
3855	1285	1273
3856	1286	1159
3857	1286	1281
3858	1286	1084
3859	1287	943
3860	1287	1172
3861	1287	1098
3862	1288	872
3863	1288	838
3864	1288	1300
3865	1289	1289
3866	1289	865
3867	1289	1008
3868	1290	1058
3869	1290	1034
3870	1290	1066
3871	1291	1068
3872	1291	1152
3873	1291	1278
3874	1292	1115
3875	1292	917
3876	1292	1244
3877	1293	984
3878	1293	1108
3879	1293	918
3880	1294	1307
3881	1294	971
3882	1294	1283
3883	1295	1047
3884	1295	1138
3885	1295	1272
3886	1296	1096
3887	1296	1153
3888	1296	965
3889	1297	1057
3890	1297	871
3891	1297	1194
3892	1298	1292
3893	1298	1231
3894	1298	1196
3895	1299	1021
3896	1299	1054
3897	1299	1284
3898	1300	916
3899	1300	932
3900	1300	1176
3901	1301	1006
3902	1301	894
3903	1301	1052
3904	1302	996
3905	1302	971
3906	1302	998
3907	1303	1285
3908	1303	866
3909	1303	822
3910	1304	894
3911	1304	1238
3912	1304	999
3913	1305	1230
3914	1305	1090
3915	1305	843
3916	1306	1098
3917	1306	1211
3918	1306	1101
3919	1307	999
3920	1307	997
3921	1307	1171
3922	1308	1178
3923	1308	1045
3924	1308	941
3925	1309	1261
3926	1309	940
3927	1309	936
3928	1310	917
3929	1310	947
3930	1310	1146
\.


--
-- TOC entry 3778 (class 0 OID 16707)
-- Dependencies: 245
-- Data for Name: rooms_decoration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_decoration (id, name) FROM stdin;
1041	dsuQNDVGXsbXPuWrCPONnfbRkbsyxg
1042	NXuNKYIlHyhEjlRBElbdWjiFYfQnfn
1043	NQDfutKgurroMObuLndKigwgTXSnke
1044	jXcxEzRgesRxCEdzVpfnFxFXGGRIFK
1045	zBHkCqmTbcrkUSCHjLdHecopblmUEH
1046	hpwvdQtsgBPPLCmtHOhzZcHgbxuRKw
1047	PqyAfsaKlGAMFsRSAbEfBrcMnzVpDJ
1048	xepegTNWPIkYcGdqeLqPDULjvveohI
1049	jOZbUtntPjsaUXgspnKbtVqBwonnUg
1050	KTaGNrGDYTJkCwguglAfpmBmNbhUZD
1051	DjMbPFjorCWFnUWGKwmImvIfjJLTUP
1052	PPXtmvaZiWwYiLYChAIScxmLIztZBs
1053	CALXJLlpoCWnBNjyYZUVjDdSSTMDZu
1054	ZBsSgUMltuJKUuovMVxEkzKvSPsMJb
1055	WzQqgBPKCTwDzSYJwgebUskWYvmhQg
1056	AbhIqjZkQHshbDRtyYAYAwnyBEJyRO
1057	hPZzjNqXsgHpRLoyRYennieqKYvhXh
1058	ZASprvotzWODyBfEOmgCmgwtqezOiQ
1059	FaKdvOtgAiOQvKvoFcTzyqUSsIacmZ
1060	qRDZaaoyWInDLmsuGefVniYgJSMZMY
1061	tdbpeYYLPTruHDDrfxobpXuiVFiFfI
1062	HvhSzZCpDYNpnmLahvqeQGlJdCKOSj
1063	mGaAIJkQcKlLpZypeUSQCMfsXYjuQW
1064	MgQCnogwJlKdNnfjpTAyXYjGezMifr
1065	klHFTyPXPnriVKOHTmsXjToREELttF
1066	RtUBVOMkPjIQmOnwjuEWvPZUSanzhR
1067	OHzLruKigkIVfrrEPiLYDiPDyQgNPE
1068	oauUTVSqWDIbIQGDRIIEfUVGDvfRlb
1069	GMHUrRiREFjEzRiyPvEMefElonumBa
1070	UsaBpuCjrDeCxTIrJrSpQlNBPgpPNQ
1071	MnnPbYDWEKrnmoWxgbkXmaWoZEXGBc
1072	SYKfeuRBsvQvMaftqAsFavtSXzLUJS
1073	ZxfproVdqIYQIuXeeQiEsfcovCoNAp
1074	OfPzLNOKqtjZoJXiWbyGlxUVfAqdkE
1075	SuumPBOEuCTklQxfXBvvezpoyLcSEd
1076	ooOLyPGMBAwvJShfizWONdbbcawjsK
1077	FILAgLugnDcHStKPQEjKkIvYBWsxcs
1078	vhsaSXDUQrnarEVOZBksENCIfJrLxD
1079	ymRjTpICXIlaVNkXVSIngkqjMeiOGN
1080	FYlobMiiyilWPxfNwMbyDoGTjDuYLt
1081	qcHwUCZRtzCEnbniBisVkySnRiiNjr
1082	XtXnxeeKAyIJlKhzHXouZahPvGunSb
1083	SqBuKiOYlbWzvMWwfgCMctAcKScPJX
1084	qwVfCtLIvaykQttPnMRaaSogJezQmD
1085	EJidZkmHzkjQvCbTMGvfJqpDYoUvzF
1086	AKHOMZiZUIAqKCtFRCYQVqDGXpEgOS
1087	YnqKmBzCeyCgzAtiWhRBipqeGYxejp
1088	jukEKyZxOpFlmqIOzAoUbocfsJtNZT
1089	QlWwacmgaEcxYrIWYVEBcWuJcnZuIC
1090	GPDKFFBZFGgIeVxgIeKVDPlUTYKUuU
1091	PNfKsGYrUtZZzBgavkCIBcabDyHeBe
1092	vwHTjzzoLGswnsICdQwUzyWxFMgbCp
1093	xvrEvcbpitDCXnsywkHPYNZkOGXAIY
1094	paSHQWqMCdrTOYduXCqeAcmkUqbbzk
1095	wEUNjDagJfIoiIWliVyILnODjSZUUj
1096	wmLjHcYKLtLMbvBSsoGedpWfruymAy
1097	nXOvThcmrLsvUTXwFQnNoodNQdzqNY
1098	GxIkyvvoAfAnYbIaXKLLxgtxAAQMTg
1099	kvGKQeFKwBRvoJwbAgyWWjFhEqkajd
1100	ZpHPljnZaOsCOnYKzSLJdEnLzgXXol
1101	KKeEZERMjXtzOueHVXOGkvhYLOzRiB
1102	xZlWkUvGQEAOPbEILLAdioCgeRTryY
1103	ClehJckQrACIIKhBZeSMWztGTkwrKL
1104	dahYtMwGlyRYpDVeTbpRHepSHLSDce
1105	SWbVjbPaXvNjbTirVZXRahdcCjyHtM
1106	naBDqLUYyrleJWeWNuiYFxOulBbydu
1107	WibeZVJmWAGlFsalIOCKnaVklblIDH
1108	UJmbtdSmsSpDKAEditNQPaCgPyPOPl
1109	OruBLPZXdEFYLlsSYpVgZRDOPurbyF
1110	kknirekXfCohbqCDPPPQDRGZGryozH
1111	YKlacyzORcfNEZiNGnxYtdhnGxMvVF
1112	ypMTKcZBegyQfENcJrlUJwyQsIHGmy
1113	RtDmmAHDrNYOOzbhsdbplADMrsGQQo
1114	QyOACBAeYprkUQIMvGYpqUPlXGFNho
1115	TFbBYLEKEHdInKdHcFpBEcKlEmQQIy
1116	tvwlTTGDnurqwxBDptsZNSFnYwafyK
1117	UwFBfsgTKNHAhrMlXEyrHLUuyDlzXA
1118	WhvnHUbeYuuZnhaMnHMTSrkNEizhcm
1119	ArhzlJGfvYJEOGEXHefrvVtqkffkFv
1120	ZraBWTwgcuILsZYcNyawujntxRcgbH
1121	sLPIbRleuhDkacUmMBSnvyCyRiDBOT
1122	xVEKncyNdKQbcbubvULESOJAHBhbXf
1123	jYKJHhHqmZBVhsUKIdoWCbxLGYUKDB
1124	DANBAaxgcMWlTQiXYHatJMXrFxIxJN
1125	yjtlSrzvhoRkGHfdBhioJZKbZwhpeR
1126	JzgzBXpwvNzrCnRBKlwblCxJDQEqka
1127	voVFDtbpNQXlvtKoHPtFCkcQDtCNhX
1128	OmidFVpSJDhxQPcDkiwZrpniVzwOTE
1129	XyFNSKRTCkmOAIXysnMaXEqzfwYisg
1130	nKfrScAGAyCSIcEqEDreYavlWsfUYn
1131	dyuYbxEfNpoXiQsMDbFXJLriXaIugA
1132	cFkLmaXpiEAzZAEHncXQSVDxTnpAjd
1133	oMeGxpxKfWJMocAgqKoVigkXoJDDPA
1134	DvVdrctGMtYfNeEauUEyGItpebtTLV
1135	ukdKhceRHxmfAbGFvzCAUsmPIQoPwx
1136	IobRgseGerpbomAPLfUVcMYbzsMZVF
1137	JaHASYTYJTUHxlUQRjMPjaTRgOvIaw
1138	pkTaiKOTAYknbcbhBUZjIKCJCwOZiI
1139	ldspnMlreKXkfArEUdEhnKvjiLWdbE
1140	YrmNIYWFZfEDLvvFnyWdqVRvItXoqA
1141	dkPviVciGbWPqIlSOgZKyQNAduBwfH
1142	xeNicRCwqmmxSpWgXPyBxOQbWNbTzL
1143	KnCfKJlIttqMVMcmWIMXdYxByytsxC
1144	taGIimaDOBbEDjFcahPkKntQDvvkKK
1145	EqJMPVwrTQsKfGfflOxjhovECBdnxz
1146	hxHVwrNooUCjAdyDQtBAAwFuePcLAP
1147	reDWdPpEoXVxXObwjmdpxxHgmMGwxy
1148	BydpHUumtLNAgtIGWlfVjqyGzWbJlz
1149	yseinZXEXCHADwmYKLCsLOWMfJftuK
1150	QEOfonywqaAhBIFDcyOtdwLhepIGIc
1151	wEJISWnFCLVZsYzXVQRJQCgtBvcoVq
1152	NjgXqWWEysTomFMsGsDKpWxuukrbcb
1153	jDyrubfuigyDIpbarAXgQhhpOKVWzz
1154	bZDWccXjySygOeOrDAAyPuipoBFXRW
1155	LTbcjFBgLZqvjPjhnLSeyCtlnXhyJB
1156	VHFYgFXAPWidEEgXUsxILvNChnxQnx
1157	mZbbGQIskXDChJOgnqzXFQMvyUKWrA
1158	DmqaaLASikhCoxGTZHzrOfyvsINhBa
1159	tXNvGSlrcLjwAVJdgpzURBdEMFXPgv
1160	vPmyCyBbiFZAbbumNWIsQbyqRqpwfw
1161	OZKzTQGKQfHyaIFBOGIuzkyDVZdYlA
1162	IxTwQlXfQnvPMlWqmJYGGgmiUlYcSi
1163	mYCqVFtFoRiZlZPUPBwRYNeovLVGRV
1164	sbkwHIuBRKjzjJttCdcriuysnHxipF
1165	OOqDxqULFQtcXsHmPmYeKmxOZrvHnG
1166	StNfMypuZEMYexhJXnwoBwqLVrJbSD
1167	EoOlzFulCJjmLpOJPbeATIrOECGSBs
1168	IPkWuXyIcjgkFPqzviJOSmZzvwnwla
1169	VadHJhTEDNRctkgRBvkhPADxzgJoZE
1170	VgdnOynXbnivVTCVXPgZtjNbKECFno
1171	RmevVrooEeplnZgqKdYVGoKncNnphn
1172	kZCilQUEPVlYenrZXjkUPdFIwTcPgU
1173	wFcbDFsVSJaUfELHLmzqGekVKSJCvz
1174	QizEezDodlXXBqOLOBcnRhtClFGuzT
1175	ierVAezeEamgnPUzFRmrrTiUacTQAC
1176	TaoHuMUUPpEMtnVyzcApynlATNzSby
1177	BFcSzxOyppaPJqkFtbbSjCcfuJIDMJ
1178	MQqTfvxpCDVtQpidliQRxRFIEijHTN
1179	nGfIGxvbcRYDfQXBKenPjOkNXLnNIx
1180	dKRBGGtFMpdbeCoXABiXNBIDyEonpe
1181	gSzZAcuGSCPQPYNrkckQUtxDzNioLj
1182	TFjbgbUDALYXxGPIqGhWiAfVRBsfBj
1183	WOjENVvlMGObcYzSyEbaUCgPkLUzXs
1184	HBUCApiPsbnGhObcxvpvOylJySkoOH
1185	JAWeczFyzZWAyTWhvKZvkqZahXgzgi
1186	cqUnFhdbpJChctihhaNJZILtapHWxP
1187	GsgbHlQZlRVhvLfoQeNESXNzrBfLzH
1188	mruKThSNfucAOxJboiGNxuoJbqnzeR
1189	fCcNuPSVhhWzCzjksKnygjYfeKcYoR
1190	ffledzwPJZvhAzreHaCHkfIehkPJTI
1191	lhFcbmKgnvksjJPtBeayzmSrIAfQfp
1192	uAsUgdWvZyNDkBdadLyUoonIHBGgiQ
1193	jXRBBcakqruqWnCFOEwZJNlhDlxLeX
1194	WFATkmvdWrbLXQRTQIzAGrqZvMBLdP
1195	phMguQnLuxHGfiCkXGgdiKeDnHyIeR
1196	kCGwKagqYArDfPntrEnGOiPMNevkJu
1197	GkkOmXpIWHCLHQdHYzztSzpwEEoLNr
1198	KNjKKdnJhfumkMQYPbFwpXQEhKitQN
1199	YNxTXgIADXlEnVuuDCIyyhOnuCuIje
1200	qvpPLkNTOGGEyxbzYOivvrhdebRXyA
1201	OfKyCKUcgvFmpYuYQftKkkPphUSmbf
1202	LvyEoCHsYhRNxhRtHZrlZPOosYNuQN
1203	tqCWFjVmhcEgIhiLOLscIcdPVQTmlU
1204	UUAtrZeDvYaLHyxXWNeRXvNYCnebqg
1205	FDKYGobuPhecBPRyqlYwodCAtbeyZW
1206	SvrhrGQbgEUFzcGdgZOobiOQPifmfD
1207	lnvADJKabVdJTwXiOjZhUytJFAPWUZ
1208	bDorkpEiGaLFmZDDaPpvGtxPmtRFCX
1209	GgCarDoGLZTjxcvRsUQRIzgWKtqpFx
1210	UzUGdbEuEMPxAQHPboSPlRVikFXFzE
1211	sNNigTUfvWAVfXbBTNgiNpWUSDnKmD
1212	NrHSZbVJCOuFcCzFzTjnaduNlNwSFX
1213	WoLymOlzyaZDUccgRhExNJGjDJMrHL
1214	XVmkGVLelWSXCpgXaaVqWQSXcCMTeN
1215	epKVYRJFzZsLDUprWmwrHQbsSISbVX
1216	SWOMQFteNUzzLbWJLQFOBftPBpEAro
1217	pedVdfiBCoYOWgGJWclGiIxuUbkfDg
1218	KrrdATTqBdhEhlqbuoqKhJOmODfjhb
1219	wAfBVghTIXfdFpuWasVINjXzmIlxmm
1220	qcGZpqPEAUbyyMBWanTFcCmgnKQiii
1221	MEkuYqxDBqNPWLKvCtMfWHHDnxVNdl
1222	stoXIjBFnflcsCzKYWiewtIsepccuF
1223	GrXFAAUrLTPHDcLLyNHZzsEqTtQqIJ
1224	ZlvPaPdFxPZFvKExBWAXveXyYdzXTj
1225	GpxLePSmzJBkVwiMQmElDsgCPacCkT
1226	WENhNDEIvKMjusQfWLMNMkhkTZYiXM
1227	RZvKPniyLYWYzjxaxifkLDZVhZDTxh
1228	ZwEomSfjiCRVyRgHZlHbSfpvVimUjC
1229	QkVeIRnRvCIwvxClarESFSvHINvcjB
1230	pPkDUKzMjCMShqwQamZjjitQjxoBWv
1231	YgGDOIkyxOIesiIDDzZYXuvNJsfmtL
1232	guoMgGakIuzNFJfOiVBfSpCeyYWtUS
1233	FtxZvevStZXqHcknNtRDjRZhbizoBD
1234	trcNOPduprBFFKunUSHIAicRFosYZw
1235	dBCCgukfurCjgRTSrWTJkzMRdrkNqx
1236	VVgzkuYLDrItHsxUDFCeNcKejGvnwo
1237	CRjKNChScoOyPxFZcccLNXTTfPdqWP
1238	gsYRRJnBPinYWUYmogKEfgkEspDvkM
1239	HTIbtYHxSZsguDxEtuJTMZKMdKgtRn
1240	TfpNYzWMEhkeRyAzKfOfxrUKiBcZSc
1241	PrcTqfkBqBWCgqYUXEyVfUGPsDrHKB
1242	EyUioWHdNnYAhiCqttTtlImRPuUADV
1243	xKvCbRbTLeBUJPUJhvGGZhbmydJTTT
1244	cnYqeYenENICOThlhOsUvWpgpjrKFi
1245	ZIKtadmNDpZixeKJJEiZYOhrQBuNqG
1246	RumHZKqRvfDizdTXBUFvRpTnFPRnvY
1247	JsFXgsbFWpXMzpvtJrJwzZnLuMkdcn
1248	bdGkxdYlifzxqohqQxvqvCtuLAGnEP
1249	IKCsmtzBsGBaOjvXwQtqmdGFxkmFOi
1250	qyxoJYduNfDgyCQWEWoOnWePdrzUYR
1251	uIvzhcnPNZqFHOHdtThoFWToeQBaoD
1252	wxZRDbYzfUiNIdJayamMJsuqCvEABd
1253	kdTAPguqCHetpOZMkOgPfrtGpUuIny
1254	HDQOrNuNpfTigafJVExDJpdcJmszKI
1255	mMwcyCJDgNDoQZHAnSZRxPFdIixKTc
1256	IaqWTBlEkHUCbLKrRvjlaEPbtizAra
1257	FnKrPcZcUEfZmYGGcxBdHgqHswrbwF
1258	fjSAckujBqOstANbtJsGIvbarzxzUn
1259	HeJqAmRZhRHBizUdMIGgnZRtHgfNiG
1260	yvAYOSGLFawRfkFXNziVJfLjcPKFww
1261	WQJyrZXArTtFQKJszoQlOPYxnuIKgu
1262	cZzeQEIpNtcwVGZNfNwHLhEcKTTrMd
1263	tUfmkodUxsOAlsooBXVLEFJlStpWHr
1264	dTIsodHktiIddlkWLnefDIzNrZiKHr
1265	DkIphWcIXOvrAnDQldbhIOcdsktcGZ
1266	RNjbexvDajSqDOkrXyuDxayJwKtciv
1267	NixDEpVlKZYxHshFtwcbTQKwzqFctR
1268	tATDJgdNSFtDMXxqiimMWtJQwXxpYW
1269	bLrazwviphWZfXgQISsysfzQvHKXYY
1270	OBZKDZNbDMsoZWVufLsWuZNgZaulKk
1271	NYrgqBXsCQFnlwZgwGDhanPrZbzhwo
1272	PRgDtCCMXwHNCqXirYgykELUcLKEvW
1273	IdfYRuJGVtSpJioeCnTqGpGIdWsRLx
1274	eTwZccZpvLkgUMOFoTcUpiwQzLlDTr
1275	oxxvLxZgHVFZlGTnmWpYrHWbmDADSm
1276	mjXItggLBiAENQHDpZamZfVQPlxyba
1277	KrfTTbjtfiOMcqQhlCaKuhqUivlXXU
1278	OOMNCqTrtXXNRcJIHDJEWnAydsvcCR
1279	PYvcznqsxtWBPgaEWzxPmizbbmpLhl
1280	RPtquJOSwFhxIGxQPJYPXDYPZRvdnN
1281	NQTMKinvVpHZtdMTZDxetRaNxQhOLL
1282	EGTyeZEqsdvQalBSYFqIdTZFUVQiUj
1283	vWoYjgclMMJclwueDZZWxBxDhlHEuk
1284	jAnwmmkySCLpwelubDdRmTnIbbqcLk
1285	UjzoKsOODaUIMfTxMQLGzrBfLuzafc
1286	FpOxeBLplixlObAEaUCAonDradYQat
1287	DSwyHhXCudbIDTLGoNPXzNxQCWZpQl
1288	UNKTTcuDsqjPOJsWVXBHyszvwyVeCV
1289	jdlduCappBBCzdSuVBjeiTMrJKpJID
1290	vxaFtJGXfszGbJIDSsLHpFytSLPrlD
1291	gajLNPXpcjJUKFnrIQsxsjIKuogugd
1292	fwZzdGTwrdKFprFoDVkmYGoNzrqrmY
1293	EYOUPMJmbcqzVQYPePJBLlGFFCCRBZ
1294	tjoAXfpsKhYfXgzJWELHCkPqVsPZmg
1295	vonwOtKaofxelepbdlnRIcagLtrSOY
1296	SdCEEtwSFJcOQvFZKLwcIuwPHKgXPB
1297	HxhTTukYtHUNoLShDwOEvgsSRSJHoh
1298	NBZxaYkFKBTwqXcrSryVTOzmmQoHvv
1299	sXksQWMPTLsKNMHpdTrEGuXzStkmGc
1300	AKFVfIyvkpJeTtuFLuIIXkyDytMALz
1301	vghsqzWgCBgQqzKxEDStxzCaFaTFLa
1302	cLRySReaUBhdQhqbijGJEbzaZsEewU
1303	nXuVukpPIGxFtnyQheVtCknYIhfzmD
1304	fgbuZwUboMpolxngNhpUwlRIUfPUyD
1305	yvETQMwzgAWoYfASSxfRrhfOcCURdR
1306	ndSCEtcHCRNvPQOPsjganeBjNMYbUO
1307	dOVUfqVThbDqkZboRHFkrSMNTFGwYW
1308	ZFAIEYPbCDLxUbYZyvkkODxkPoZtwU
1309	ucKmpLQpyShqOWBCBUvvXZYTETfogV
1310	AENCUHWjLEAuTDrKIqpJLKqcmFPYOZ
811	jYFpGwPKqgsMFCeISHaeKXrXclvgCN
812	SqtaLWSaBZPAaviglySWJAGLOKkFVX
813	todNdSygbUVypCDCgaylwWLmeqyxCu
814	DaxYyuekmbCHeYfabrBinrWdjrjnqV
815	geYiaxJNGwAIKVKgRLRcyxWNhhhWah
816	FysViIBerjdnwZhfXJOQIbIIYPsqbm
817	svGLVxQXvlsxWhRYVKXohnAfEzhWjz
818	MxPHeaACBObghMUdjixMtLCZftPkDa
819	gNBkqpGHYLRTdOoJhDemAQLTWKCrpb
820	PIOVdnIGLAHrcZqUUcTljPUNHpVGmL
821	xjRIFOXaXPNTLFxCNMVKLlUavDQlqI
822	vKygDfFHdkjjVnjUoybnDLCjYRozJx
823	STWxGTSsvzbxerFoZcsdVxMQNPDpGA
824	anMyKCxxrdSCQLatGwMwPuALgwIKMQ
825	pMsLKklgEizXvdtmflJPZTiqmiDFAE
826	dmtLYrgACZvMafVdofpCnRyOkSZjHr
827	EcIZRjQaMjanMmKbpPLwzFYAtFCEAH
828	QdoYsTFHyuymWRUvOYPRfdzJZucPZZ
829	YYnNGzxwutsSoUJXUalIjhSgduxIGA
830	mHCEuFmLeXdhogyMKNhrqATPFhbSna
831	zfSRQDknhsPpSrQJSbUcQfMSRrOgAl
832	eRffnBoLxclfPrhdODJkVcKKuQMROC
833	xnvZJtPFsSQlomGreTcDkfqDsqOjTC
834	szzkNuyQwFrcehlRmFprypJWlscfBw
835	vSPoKFfCPnRsWHcKwUWMdPkKlxmlaH
836	rJcZBUdqOnMXoNrJQeAMDfjULClNSa
837	jdfunaBBKIiLnqWGfYYrMBhfUgOEzZ
838	YZOGHAkhYTUfzXLVEmQjozrpmXuRUr
839	gesMETDmQGDYzrOiqrXXMgaavPMXiL
840	uSFBdVMHaRPRyzzKfZDrZcSaIlUKxf
841	cPAGVFxFcdeBVIxMZpoiLAjVNQnoxz
842	lyFXYEidKZLWTLZadWXwDAqxCAQfEq
843	UPoDKagetECEYQXhxCUWsOCZIGOyqd
844	tObRBQlnvRjuVjgwcSzORdYlXecSNC
845	QkkHBkzEeMmOhQDUnTPaPEDsElUtfb
846	TfbAZwvmobKlHXluVozSnAeugXPmes
847	TqHecFfFpTJcbAtHiYCBNGXUmdrOIt
848	iGKADjDEHESJJzFoSBjPClTrqfWQsJ
849	NkqHKPoBqUBQwjXVycUVOJQuYOcJyi
850	mRBziQolgZIkWyGZTyYCxyFvdetQKq
851	tuQFVMYhmfpIpXYeeXBxusraIMVCNg
852	guXpZUWBdNmLXOLwcPqxIVNdSzcgrF
853	zbvMxcpspAoAJNDeMZtKAoqmCtUIWO
854	sVrBchKEiUDKWfwKcjKFKfcXajABUp
855	YThyeXcZSpVTWTvOkglQITdhEXliAX
856	QsTRyBnYtoOiIzWLCrHPRFzJpmUjGu
857	sTEXAyBwfdfPVrAjUQtBWdgidhyLMD
858	ZaWfJtaZylofRrgRydOphHsFfIjnuh
859	DJUYweSaHIxhiKBcVDHQBvvoqOwIvF
860	wAkcowjwtmHLAbKvxxZfLcLwovVZdX
861	GyMAfuIoWRJvhjfdsaZxYyOOyjwrJO
862	fPPTDbVInHywSjsnPQgfwrpkJRRzQu
863	rjvGFSedODBKAGvRsQsLHkCqnWwEik
864	TNULoKhrNrzQPWRnnnziGbFDERXwmx
865	ovgKuOVapHIwgBuLuwdhGqJDlwFdAy
866	PInYStIguFgJXwyxAOgCKFQqhhOSWF
867	fDpEcIFmzRdzJpcTZNcOVLTruQDIJC
868	SFlfhqcqptpoayJPDGUReZVZGCXsxx
869	VocsCfHDgmGwTeYUzfSRgHzcrSgpCj
870	ZObHVbtpKqmuUsGiHAeGPEtSLqpfmu
871	DwvdHlYPCWFbjBktgxRDsbmVySCKRS
872	QzZDBAOHUWgmmjUkXRzOJOAREmcgIs
873	PeLbLqiLnYzDaORZSCBqWtXzayGbra
874	JoCpVCLVXobPxWWxOwcgEZTQvgdtqD
875	IwKZqUJpXfmlQRYxyQztrOJEThUZys
876	SOnuoyofAPKNTsxsoNLemuWHPqjrfJ
877	aaSneRhEjKbKhCesNgtKdRbWyIUtWy
878	iAYUrzeoyzOffrvNsdzIvYyTTRYcfl
879	kQNXKBcwkFRsKhQaSmlrYJxLAcOBIq
880	betenxqZAtXzEXkOXwLNlLfJYbQmUQ
881	ycyeQxpfvfukhaTDcGkUEgBBRgfLpy
882	EHvnabWlqJvZkDidvAzfondQUuKEVV
883	XWXOTLoJyXrzkluvfoTPBakkyZAWhO
884	jbVDbTaTHwoeYaPDWTATGOycpBRRKi
885	BlyqXlfRBiXlKNZgbJpfpndtalgVlf
886	hPohdCgfBgkAErpzrhXZOlqaygeQYf
887	mqAehoHHnDzECWmxFtosotMHgaHCxs
888	XfbGaLGgZEOirPqOFeSDsMbCYewPXl
889	luIYhKRNnhKPyxmImyrhKZaskenoeE
890	cGBNGVIcYUvoHzZciKIoapkLzkKFxr
891	kPlqmLDczmtMgDjcqOMMjcbJBdoXjN
892	eHCqjbtkAJVYtoEYIskPFRzDUIubho
893	TvvtMIeGgYarVHdQJRytAurKPdfxHE
894	bIZAAkKBcmkhnnVPdwaUQmIFjURBMM
895	pnZffkaASXAdkmZDStvBuhYVorEWMw
896	ermgYmdgCiHGQSkCYfTDLzTSWhhTlH
897	aYoyYcZuhelFXclIwsyWAcPMNWspOz
898	eMfMxfKzERszgMySXfgAgzpJnIZcRm
899	VRadWPMzRRLJsFocMCAvuiRVZUnOjU
900	AXwHLPjOtYFSyBpRyulUKPWoeQQhgX
901	GWjeneBQGNNhQGqNGzvEMsQStEhIRm
902	TgVAqRmUfzbgtaFQYAWRoziTyaTKwW
903	SsdwJocUuVrGSTjVKanTgYlulcoTYw
904	wfgOPAZCXiBSZDzHdYEohWPHHOOsDb
905	EOIaIFJetbzrgZBoxzDuMVuVCWswSM
906	RlBkJmcnRldEgpRczIbUUbTJyFxVCt
907	TWVpozbJiInXsvZuUwsbdEmlXkWFEf
908	soSULHUaLXpsqEfRJsOLpTQfMUhSOK
909	OgoPvueXdHxXORJOycwZYomJhIogrD
910	ZhzeNimpIXzNZRsIVnCCimtdFxlIyC
911	fjgoRyUxHtvFJZVqnWVMLwykZYImBg
912	vmzoLyrUTtTFyyHdHHzBqikwKCfwJs
913	qnrEQLwAtTLqOSFNgcncnrazfGsUgl
914	CqDdLGpsplHRzEzhwzYIJCNxNIbjPQ
915	iXWiBLpBREZAIiYbhchdeSUgPCBmBi
916	dlxeoUKpfDAEcNFxgTDrKKcihUhxNu
917	CMazHzDpJkRiLHgNSRBMOtBFtJrUyh
918	OVnatQqQwpBRaWBkbrkgdsnTamKynA
919	RzHVYsohYlrFUmIMKAfDILBIWUlbrw
920	SScZaZXcTzyxvvrOmeKMpcEwzPMsic
921	SPBdOLuWmHoEUsJCtvMxqoElvYcDcN
922	LOtEEdjzMdENyeuVDdQrOfxbZCiPOA
923	ynihsriizjkxMroEYkDRaIdTHoCmPI
924	kzbyaeBXzkXLIKlwaUrkMpbOHEDmzU
925	xisyzRENliugjmkaZTgSbFFiyFwnRi
926	vXrFBtwrLcskZVlVEYHlFvCRsBgvEf
927	HQmzcxcuepAQsqWvUIxMydseouypJH
928	ihzAXwWkMQIZEWSIhEYYWrKhZhfyyx
929	bYRcLwCVpEhtkPvpwoBpmFoiSXzVTn
930	GideluZVDgZztBujFKODlVWuYCZAXb
931	oDGOuLeJtsywfAKxbCXNAdBmyLnbaH
932	qhMdAbRmtPBlahemsYvtecugfbKotO
933	TcIGdErhlONziJZkexguBckOaUBijR
934	PrMnoOLZLezbGZxKrtMIIUIuqCgjQi
935	lmbGugecQqEaniqToTxrcsTGTItLPw
936	pfvdRbLwrgXdxdlurOVmGUQxZXxSXN
937	KQtaHxgACypsqAvutoBZqEuzuxMKVj
938	mDXOTzJQgeDOgKioNzRqisOldTEOAP
939	LVXdgIwzTuPPlmjSsrlNSUhucOxotk
940	ZzTopUHETFMTPNERgVpAqrTlYPAMnt
941	uXiejwZrofPTJtZRMUpTUimiDVEBTB
942	lEKbSbHaPkhzBjpLiVrdnnMAIPWuqp
943	NCFZMuHcGajLDgCkGjmlkcbVdJOOEd
944	npAbAqmuNkWIyVghlmPazfVWsyaxiC
945	hxgcLcNXzIMtPQqgaFcnqEcDoNoDgl
946	buCvzWDzNXgdYenbpLRGclQavbievu
947	sOCNGAvEnZdrGjReKBuWuKtGQgLRjQ
948	uvqpjRGrMtbjomFuGzfTSaxXkCbyQc
949	dRUpZpBGvwcqSxESCbLKkDVIsiHbem
950	ACNvBnNHPmdHBwFCjjGDtupSnGsyrI
951	oyxzDjCmwoBXVCADrURxsTiQJpcGLC
952	aHyKbKabEPIHBROTPpOZKSFGzhOBDS
953	YgtXibKcjUIDuqUwDeLbSqmnZkSfbO
954	stGfaphIJmgXNwrSVCgWItKgSUadne
955	VrmEefhTRnmAssjOGIqsrsNqrFSdkd
956	RFjumPTxsHBOODRqekCbJqZoIQQXlu
957	CyhpiMCIFkLeqXItzDxcEyJlHccxMD
958	VuqSSFvQUyZdKESfKNBxhjfBQRJZOo
959	XXtbirseTPBDMkdQqdbaXKdnXwUGFm
960	ERpHjWrELZBHqGmGTmfQhkPCerRWBw
961	XmptlftRSrJqqHpVmKOOjUCUrarteX
962	ZMsEbrwwBEJvBQqNpVXwjTSehNRbnU
963	ROZtqkuuLTYjMRfSwJATZPdKPyOEbu
964	ttGRkaKwjfhItdNkoGgySYXokbQEZo
965	RNPDPFAEPBespijxlzeSTYTvDvWJFF
966	hCSFXmqJbTXheTszXOxTrmAjvKZYtE
967	goTDSAacInufsIUkefiukaIslmRviI
968	RXYwRXgfyGSOrBibApJkwUkCdSvaap
969	uhDVFxyUUUIQFJgPpUxZtSXECepBGU
970	ezxzhmgEqAoIIftCaiuBmYnTYiOlpB
971	BvPhcVlIjsIqbcAquJYOPQXQzivQsd
972	xPMJDPPpWoUNBFlVsfCxKqnlFcLSdv
973	FkInbTQJiHkTAoOPIruBGVRQfaZSUA
974	kzYcNrQNoVzBsGnRdFDdcUYhRLdtvC
975	hAYHBzywkQqyocQSxtYbIxphmaahyV
976	VmHLoSHAHMuZQgDVIWtVSpUOYFknIW
977	uqDpFzGqsBMToDQLbuJokikZPEHaKg
978	WjzYUjosMkGLNcfojqUUQEZcKpRtkX
979	wGpcuxMBGMoNNePSYLryVBCVoSCyXN
980	YrfyuYELOenjRjSMSlSqtfuGbSsgHh
981	bHSyKbMSDudVNYtsGXNjuEwTFMgYSs
982	HnNOmFRdRzPTeMRUjTJLQCzfoqOcVa
983	jPHxwIbVMJfzHIwUwbYnXKYfeyIRxF
984	AOqtiKjnPHqpbAuFXLARHOnahYXsDu
985	yaPJpjInErdfCMMhCIQpbeYWBDGCUI
986	fvRwlzNDLmRXdFnOdZBWODBZogGHWC
987	BiHHLXweWZYhTBUAkDGGYFUkvJCpxe
988	UxRmDKPmTPNXnxXQPMONzMdVSLRgxj
989	HLqsALlPFyrEykKlSjJLXQyUNUvwdw
990	pMXsZWuaRZtRkbfzhEZSgzRKWrDvRz
991	kMeBjohJQfpJgTgLpSLMufxHafvCjJ
992	KRuAYYAXoJaBQZBCRgiAMeOXbZytqw
993	MshLLmHNbNEvLQsvkqEaXxqqJLCxTW
994	EflJrRypdvQusOIEmlGfzpuWofJmuO
995	EjRXczyBYgBelevnsXStlkQOkcFZQi
996	ZeQfPmtlsdKOMGpAZccJPlHtIrkyPG
997	kATxrwIIrefdnzloKdzbHcduTtghaQ
998	IyMrohGwexgiMemhBVkhzycdlOCPDK
999	hresyQvOvGDuCeqWYjYTyiDzHPpLnx
1000	JdunFhOCWjfHxybOjJvCvnWunyWRwO
1001	BuUTfMDLbDONHyCaNUlLOFxpYzRzVs
1002	FWzhOcFqdAobHDKeyqEFHSDnQJXpcJ
1003	sNetKirunxfPuLRsVVGNeyTfmAFaul
1004	kSMxuaYXjDVQmGMmAOXsLqeroZCPBo
1005	ebcUAnqJMvJAQvSohhNMaZRawvKIPy
1006	MbPNrFQvdPhFYVnjYeByVZaIdTLADU
1007	mqnXtYFKdrOtkaYgHCihnjamvPQTti
1008	gnhEfhVexaejfjzBukMrAETToEuSbM
1009	HpOzbdiZyDCpjkRPDitDtlcYBlLYPU
1010	EveEalYQbZRHsHRWATsZJukpgilTaU
1011	vsKaiBSKZwMqjFAgZUgGwkXxIbokOx
1012	kdeGqLKMhSkplrwzAwFdzcTyuypLdB
1013	qkkKSEQdoPdOcJAdzbnNDJOjszutCM
1014	tavhbzxDjWPJWFhRnyIhvqGpmBVVrL
1015	OZBMJbdqwNJxfhpsLvVULgonWMsJwm
1016	CqdfRVdZtiYYsWDdhbzKmHLCTpXAzb
1017	CHubSQCmjLjHViZjeuHNWscvqJafMz
1018	UmabZnsZiyWvhBUYJurKEQPTyFwQtj
1019	FRGjnYsRXgTSUwoDxmUHBtUMAZYExN
1020	iOQpqXGBNIwyaFqLdJPDlvUvamivwm
1021	AoXKYXpCmXzbnuilbQyMtVdKetZDML
1022	TZMDTOTalFsbhgofdJPxRrGxYtlsaY
1023	TVcDlfUhhzeBEyBrHEiSDIHwPuSeWY
1024	IAnmHQraureAcfPjXwaRRjmxWndTDi
1025	lElnFvEdmTNjRbRJFxZlJRPOAbJVxy
1026	SbGcPuvXAqgiwgoBjUSegJMFzMqplX
1027	ycQPLiSKIVAXJwtvilyIEZjXlWbgOR
1028	nXwtXxrmbPYeaAfXRfKZHvdtlaGzav
1029	xfkbpbFxqhfBYOrrRVsbHzAoNcmApp
1030	ckAiJlYaIDhShQQeNWpfNzufktvVPZ
1031	fankapEZCkysonBGjgyMxjdTTkAnYK
1032	RryrmhcWMYVESlkttGFKSnzAaLBYBs
1033	izZqoSSmdPCpRPiRKNucInYwwMdWxl
1034	qzzJKQvLWYIIxHcnUuLupvGEipdYYL
1035	ptXkfwYoeKILGipzPrqkHJTMYFSrJY
1036	HtrDeppcWTsiwONXLlnuIjmoffweqp
1037	rsEZjZQTzJezqjhXODvpjfNHPUuhDY
1038	ShcuTvsXMXLRgvaunOynYhJHWyHpvH
1039	TFsiYDlHzDRNTXczCzpOHIVssFHJCN
1040	pEWKPOvwTofXxFHOKsZhIgbninxFcV
\.


--
-- TOC entry 3796 (class 0 OID 16784)
-- Dependencies: 263
-- Data for Name: rooms_decoration_souvenirs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_decoration_souvenirs (id, decoration_id, souvenir_id) FROM stdin;
5216	1044	672
5217	1044	725
5218	1044	710
5219	1044	698
5220	1044	716
5221	1045	720
5222	1045	694
5223	1045	760
5224	1045	749
5225	1045	671
5226	1046	753
5227	1046	659
5228	1046	724
5229	1046	749
5230	1046	766
5231	1047	704
5232	1047	791
5233	1047	761
5234	1047	715
5235	1047	764
5236	1048	723
5237	1048	726
5238	1048	793
5239	1048	686
5240	1048	767
5241	1049	676
5242	1049	758
5243	1049	696
5244	1049	797
5245	1049	766
5246	1050	737
5247	1050	772
5248	1050	789
5249	1050	667
5250	1050	735
5251	1051	773
5252	1051	664
5253	1051	780
5254	1051	717
5255	1051	734
5256	1052	656
5257	1052	689
5258	1052	692
5259	1052	664
5260	1052	670
5261	1053	787
5262	1053	772
5263	1053	693
5264	1053	794
5265	1053	687
5266	1054	784
5267	1054	786
5268	1054	742
5269	1054	716
5270	1054	798
5271	1055	705
5272	1055	739
5273	1055	725
5274	1055	696
5275	1055	670
5276	1056	789
5277	1056	763
5278	1056	652
5279	1056	798
5280	1056	671
5281	1057	704
5282	1057	705
5283	1057	663
5284	1057	664
5285	1057	781
5286	1058	657
5287	1058	695
5288	1058	714
5289	1058	747
5290	1058	686
5291	1059	675
5292	1059	725
5293	1059	694
5294	1059	663
5295	1059	684
5296	1060	675
5297	1060	756
5298	1060	726
5299	1060	762
5300	1060	794
5301	1061	689
5302	1061	723
5303	1061	792
5304	1061	777
5305	1061	671
5306	1062	656
5307	1062	770
5308	1062	773
5309	1062	714
5310	1062	781
5311	1063	771
5312	1063	743
5313	1063	665
5314	1063	747
5315	1063	717
5316	1064	769
5317	1064	652
5318	1064	739
5319	1064	716
5320	1064	765
5321	1065	707
5322	1065	710
5323	1065	742
5324	1065	694
5325	1065	761
5326	1066	708
5327	1066	679
5328	1066	793
5329	1066	652
5330	1066	655
5331	1067	704
5332	1067	677
5333	1067	789
5334	1067	733
5335	1067	670
5336	1068	673
5337	1068	722
5338	1068	743
5339	1068	776
5340	1068	799
5341	1069	754
5342	1069	726
5343	1069	776
5344	1069	761
5345	1069	683
5346	1070	658
5347	1070	710
5348	1070	653
5349	1070	685
5350	1070	734
5351	1071	708
5352	1071	695
5353	1071	712
5354	1071	727
5355	1071	670
5356	1072	674
5357	1072	661
5358	1072	713
5359	1072	702
5360	1072	687
5361	1073	673
5362	1073	705
5363	1073	658
5364	1073	678
5365	1073	701
5366	1074	753
5367	1074	674
5368	1074	696
5369	1074	697
5370	1074	778
5371	1075	689
5372	1075	759
5373	1075	666
5374	1075	747
5375	1075	686
5376	1076	688
5377	1076	725
5378	1076	777
5379	1076	763
5380	1076	669
5381	1077	769
5382	1077	742
5383	1077	680
5384	1077	697
5385	1077	687
5386	1078	675
5387	1078	787
5388	1078	723
5389	1078	701
5390	1078	686
5391	1079	785
5392	1079	722
5393	1079	755
5394	1079	775
5395	1079	695
5396	1080	739
5397	1080	723
5398	1080	661
5399	1080	697
5400	1080	779
5401	1081	800
5402	1081	671
5403	1081	694
5404	1081	779
5405	1081	799
5406	1082	692
5407	1082	661
5408	1082	694
5409	1082	726
5410	1082	745
5411	1083	792
5412	1083	743
5413	1083	680
5414	1083	697
5415	1083	687
5416	1084	784
5417	1084	706
5418	1084	747
5419	1084	732
5420	1084	683
5421	1085	736
5422	1085	753
5423	1085	675
5424	1085	678
5425	1085	795
5426	1086	738
5427	1086	777
5428	1086	682
5429	1086	797
5430	1086	702
5431	1087	784
5432	1087	753
5433	1087	709
5434	1087	668
5435	1087	750
5436	1088	673
5437	1088	662
5438	1088	712
5439	1088	652
5440	1088	734
5441	1089	656
5442	1089	786
5443	1089	680
5444	1089	714
5445	1089	796
5446	1090	688
5447	1090	789
5448	1090	662
5449	1090	764
5450	1090	765
5451	1091	657
5452	1091	721
5453	1091	710
5454	1091	698
5455	1091	683
5456	1092	722
5457	1092	786
5458	1092	676
5459	1092	711
5460	1092	783
5461	1093	706
5462	1093	786
5463	1093	741
5464	1093	795
5465	1093	796
5466	1094	800
5467	1094	752
5468	1094	740
5469	1094	683
5470	1094	669
5471	1095	723
5472	1095	743
5473	1095	761
5474	1095	778
5475	1095	759
5476	1096	740
5477	1096	697
5478	1096	763
5479	1096	731
5480	1096	735
5481	1097	690
5482	1097	676
5483	1097	698
5484	1097	763
5485	1097	719
5486	1098	688
5487	1098	676
5488	1098	733
5489	1098	681
5490	1098	749
5491	1099	658
5492	1099	730
5493	1099	682
5494	1099	778
5495	1099	735
5496	1100	659
5497	1100	701
5498	1100	792
5499	1100	653
5500	1100	767
5501	1101	691
5502	1101	724
5503	1101	762
5504	1101	742
5505	1101	698
5506	1102	784
5507	1102	675
5508	1102	787
5509	1102	679
5510	1102	713
5511	1103	705
5512	1103	785
5513	1103	755
5514	1103	713
5515	1103	796
5516	1104	788
5517	1104	711
5518	1104	729
5519	1104	668
5520	1104	718
5521	1105	768
5522	1105	712
5523	1105	777
5524	1105	669
5525	1105	696
5526	1106	658
5527	1106	659
5528	1106	741
5529	1106	774
5530	1106	711
5531	1107	676
5532	1107	756
5533	1107	678
5534	1107	730
5535	1107	719
5536	1108	658
5537	1108	739
5538	1108	693
5539	1108	728
5540	1108	697
5541	1109	656
5542	1109	772
5543	1109	712
5544	1109	798
5545	1109	728
5546	1110	754
5547	1110	792
5548	1110	761
5549	1110	747
5550	1110	734
5551	1111	677
5552	1111	743
5553	1111	778
5554	1111	759
5555	1111	780
5556	1112	760
5557	1112	799
5558	1112	728
5559	1112	698
5560	1112	655
5561	1113	673
5562	1113	676
5563	1113	662
5564	1113	667
5565	1113	749
5566	1114	785
5567	1114	753
5568	1114	662
5569	1114	775
5570	1114	764
5571	1115	708
5572	1115	730
5573	1115	794
5574	1115	701
5575	1115	670
5576	1116	771
5577	1116	660
5578	1116	794
5579	1116	748
5580	1116	685
5581	1117	736
5582	1117	661
5583	1117	679
5584	1117	653
5585	1117	671
5586	1118	769
5587	1118	774
5588	1118	790
5589	1118	776
5590	1118	663
5591	1119	722
5592	1119	708
5593	1119	677
5594	1119	715
5595	1119	716
5596	1120	672
5597	1120	742
5598	1120	762
5599	1120	684
5600	1120	671
5601	1121	668
5602	1121	706
5603	1121	741
5604	1121	727
5605	1121	716
5606	1122	800
5607	1122	693
5608	1122	778
5609	1122	749
5610	1122	782
5611	1123	736
5612	1123	756
5613	1123	695
5614	1123	714
5615	1123	763
5616	1124	653
5617	1124	761
5618	1124	747
5619	1124	717
5620	1124	702
5621	1125	676
5622	1125	661
5623	1125	781
5624	1125	734
5625	1125	719
5626	1126	706
5627	1126	790
5628	1126	651
5629	1126	748
5630	1126	671
5631	1127	723
5632	1127	728
5633	1127	777
5634	1127	747
5635	1127	684
5636	1128	752
5637	1128	756
5638	1128	680
5639	1128	666
5640	1128	664
5641	1129	656
5642	1129	737
5643	1129	787
5644	1129	777
5645	1129	717
5646	1130	737
5647	1130	769
5648	1130	788
5649	1130	764
5650	1130	703
5651	1131	758
5652	1131	760
5653	1131	777
5654	1131	652
5655	1131	717
5656	1132	691
5657	1132	659
5658	1132	774
5659	1132	763
5660	1132	797
5661	1133	692
5662	1133	789
5663	1133	744
5664	1133	653
5665	1133	767
5666	1134	675
5667	1134	745
5668	1134	747
5669	1134	796
5670	1134	669
5671	1135	719
5672	1135	716
5673	1135	701
5674	1135	718
5675	1135	782
5676	1136	689
5677	1136	793
5678	1136	665
5679	1136	699
5680	1136	733
5681	1137	721
5682	1137	679
5683	1137	781
5684	1137	749
5685	1137	799
5686	1138	688
5687	1138	707
5688	1138	664
5689	1138	697
5690	1138	715
5691	1139	769
5692	1139	730
5693	1139	794
5694	1139	781
5695	1139	718
5696	1140	739
5697	1140	755
5698	1140	732
5699	1140	779
5700	1140	780
5701	1141	688
5702	1141	680
5703	1141	794
5704	1141	715
5705	1141	652
5706	1142	677
5707	1142	709
5708	1142	682
5709	1142	763
5710	1142	783
5711	1143	771
5712	1143	790
5713	1143	763
5714	1143	702
5715	1143	687
5716	1144	752
5717	1144	753
5718	1144	721
5719	1144	795
5720	1144	749
5721	1145	736
5722	1145	738
5723	1145	663
5724	1145	746
5725	1145	732
5726	1146	769
5727	1146	785
5728	1146	771
5729	1146	724
5730	1146	710
5731	1147	736
5732	1147	677
5733	1147	710
5734	1147	678
5735	1147	654
5736	1148	704
5737	1148	668
5738	1148	674
5739	1148	757
5740	1148	764
5741	1149	725
5742	1149	710
5743	1149	743
5744	1149	651
5745	1149	749
5746	1150	744
5747	1150	733
5748	1150	762
5749	1150	715
5750	1150	781
5751	1151	705
5752	1151	786
5753	1151	676
5754	1151	778
5755	1151	764
5756	1152	688
5757	1152	676
5758	1152	715
5759	1152	750
5760	1152	747
5761	1153	768
5762	1153	764
5763	1153	758
5764	1153	729
5765	1153	652
5766	1154	705
5767	1154	744
5768	1154	793
5769	1154	731
5770	1154	798
5771	1155	754
5772	1155	691
5773	1155	791
5774	1155	730
5775	1155	798
5776	1156	656
5777	1156	774
5778	1156	711
5779	1156	663
5780	1156	796
5781	1157	705
5782	1157	719
5783	1157	665
5784	1157	745
5785	1157	687
5786	1158	720
5787	1158	709
5788	1158	730
5789	1158	749
5790	1158	686
5791	1159	688
5792	1159	785
5793	1159	757
5794	1159	791
5795	1159	699
5796	1160	673
5797	1160	721
5798	1160	696
5799	1160	747
5800	1160	764
5801	1161	659
5802	1161	758
5803	1161	797
5804	1161	798
5805	1161	735
5806	1162	768
5807	1162	721
5808	1162	658
5809	1162	723
5810	1162	740
5811	1163	722
5812	1163	659
5813	1163	680
5814	1163	779
5815	1163	763
5816	1164	772
5817	1164	662
5818	1164	697
5819	1164	797
5820	1164	733
5821	1165	723
5822	1165	724
5823	1165	709
5824	1165	792
5825	1165	716
5826	1166	769
5827	1166	773
5828	1166	679
5829	1166	777
5830	1166	731
5831	1167	675
5832	1167	740
5833	1167	755
5834	1167	745
5835	1167	682
5836	1168	768
5837	1168	740
5838	1168	724
5839	1168	777
5840	1168	795
5841	1169	753
5842	1169	739
5843	1169	764
5844	1169	763
5845	1169	748
5846	1170	769
5847	1170	674
5848	1170	754
5849	1170	708
5850	1170	767
5851	1171	769
5852	1171	764
5853	1171	757
5854	1171	777
5855	1171	796
5856	1172	737
5857	1172	676
5858	1172	727
5859	1172	715
5860	1172	764
5861	1173	768
5862	1173	672
5863	1173	754
5864	1173	764
5865	1173	734
5866	1174	721
5867	1174	757
5868	1174	711
5869	1174	759
5870	1174	731
5871	1175	678
5872	1175	774
5873	1175	744
5874	1175	730
5875	1175	743
5876	1176	658
5877	1176	740
5878	1176	773
5879	1176	796
5880	1176	780
5881	1177	672
5882	1177	755
5883	1177	670
5884	1177	747
5885	1177	731
5886	1178	768
5887	1178	742
5888	1178	664
5889	1178	762
5890	1178	717
5891	1179	672
5892	1179	693
5893	1179	761
5894	1179	713
5895	1179	797
5896	1180	772
5897	1180	678
5898	1180	679
5899	1180	744
5900	1180	745
5901	1181	721
5902	1181	691
5903	1181	777
5904	1181	669
5905	1181	799
5906	1182	755
5907	1182	699
5908	1182	667
5909	1182	781
5910	1182	767
5911	1183	672
5912	1183	685
5913	1183	652
5914	1183	749
5915	1183	750
5916	1184	756
5917	1184	713
5918	1184	668
5919	1184	686
5920	1184	798
5921	1185	688
5922	1185	722
5923	1185	772
5924	1185	747
5925	1185	701
5926	1186	689
5927	1186	675
5928	1186	724
5929	1186	682
5930	1186	795
5931	1187	784
5932	1187	700
5933	1187	755
5934	1187	695
5935	1187	716
5936	1188	656
5937	1188	756
5938	1188	773
5939	1188	746
5940	1188	731
5941	1189	720
5942	1189	738
5943	1189	706
5944	1189	697
5945	1189	718
5946	1190	673
5947	1190	657
5948	1190	742
5949	1190	791
5950	1190	666
5951	1191	656
5952	1191	753
5953	1191	785
5954	1191	725
5955	1191	685
5956	1192	674
5957	1192	666
5958	1192	682
5959	1192	797
5960	1192	750
5961	1193	739
5962	1193	707
5963	1193	726
5964	1193	793
5965	1193	779
5966	1194	657
5967	1194	721
5968	1194	675
5969	1194	662
5970	1194	735
5971	1195	738
5972	1195	778
5973	1195	731
5974	1195	700
5975	1195	717
5976	1196	796
5977	1196	683
5978	1196	748
5979	1196	717
5980	1196	763
5981	1197	724
5982	1197	698
5983	1197	793
5984	1197	762
5985	1197	670
5986	1198	672
5987	1198	726
5988	1198	734
5989	1198	654
5990	1198	703
5991	1199	656
5992	1199	769
5993	1199	788
5994	1199	716
5995	1199	703
5996	1200	768
5997	1200	771
5998	1200	693
5999	1200	743
6000	1200	714
6001	1201	688
6002	1201	757
6003	1201	694
6004	1201	745
6005	1201	717
6006	1202	689
6007	1202	754
6008	1202	771
6009	1202	746
6010	1202	653
6011	1203	656
6012	1203	759
6013	1203	651
6014	1203	781
6015	1203	718
6016	1204	697
6017	1204	661
6018	1204	774
6019	1204	713
6020	1204	748
6021	1205	691
6022	1205	662
6023	1205	791
6024	1205	793
6025	1205	698
6026	1206	688
6027	1206	657
6028	1206	783
6029	1206	730
6030	1206	751
6031	1207	689
6032	1207	788
6033	1207	694
6034	1207	665
6035	1207	734
6036	1208	704
6037	1208	771
6038	1208	744
6039	1208	683
6040	1208	763
6041	1209	737
6042	1209	770
6043	1209	796
6044	1209	668
6045	1209	783
6046	1210	691
6047	1210	773
6048	1210	664
6049	1210	683
6050	1210	702
6051	1211	792
6052	1211	684
6053	1211	664
6054	1211	750
6055	1211	767
6056	1212	675
6057	1212	772
6058	1212	741
6059	1212	780
6060	1212	652
6061	1213	689
6062	1213	756
6063	1213	710
6064	1213	742
6065	1213	668
6066	1214	668
6067	1214	678
6068	1214	683
6069	1214	764
6070	1214	751
6071	1215	739
6072	1215	676
6073	1215	755
6074	1215	666
6075	1215	731
6076	1216	674
6077	1216	658
6078	1216	676
6079	1216	677
6080	1216	692
6081	1217	752
6082	1217	766
6083	1217	781
6084	1217	782
6085	1217	798
6086	1218	726
6087	1218	728
6088	1218	763
6089	1218	667
6090	1218	719
6091	1219	723
6092	1219	660
6093	1219	665
6094	1219	667
6095	1219	716
6096	1220	706
6097	1220	659
6098	1220	729
6099	1220	731
6100	1220	700
6101	1221	691
6102	1221	692
6103	1221	677
6104	1221	765
6105	1221	686
6106	1222	704
6107	1222	706
6108	1222	690
6109	1222	653
6110	1222	687
6111	1223	736
6112	1223	753
6113	1223	674
6114	1223	740
6115	1223	781
6116	1224	679
6117	1224	713
6118	1224	714
6119	1224	651
6120	1224	685
6121	1225	737
6122	1225	775
6123	1225	698
6124	1225	730
6125	1225	670
6126	1226	786
6127	1226	710
6128	1226	760
6129	1226	778
6130	1226	701
6131	1227	705
6132	1227	745
6133	1227	757
6134	1227	681
6135	1227	716
6136	1228	800
6137	1228	769
6138	1228	724
6139	1228	795
6140	1228	764
6141	1229	776
6142	1229	738
6143	1229	786
6144	1229	712
6145	1229	654
6146	1230	775
6147	1230	664
6148	1230	682
6149	1230	731
6150	1230	791
6151	1231	722
6152	1231	663
6153	1231	760
6154	1231	713
6155	1231	667
6156	1232	738
6157	1232	732
6158	1232	724
6159	1232	716
6160	1232	703
6161	1233	737
6162	1233	772
6163	1233	677
6164	1233	756
6165	1233	750
6166	1234	752
6167	1234	760
6168	1234	682
6169	1234	667
6170	1234	686
6171	1235	753
6172	1235	738
6173	1235	693
6174	1235	775
6175	1235	669
6176	1236	678
6177	1236	791
6178	1236	730
6179	1236	779
6180	1236	765
6181	1237	720
6182	1237	721
6183	1237	771
6184	1237	729
6185	1237	796
6186	1238	752
6187	1238	787
6188	1238	755
6189	1238	660
6190	1238	777
6191	1239	663
6192	1239	761
6193	1239	732
6194	1239	669
6195	1239	671
6196	1240	722
6197	1240	709
6198	1240	651
6199	1240	716
6200	1240	670
6201	1241	720
6202	1241	752
6203	1241	770
6204	1241	725
6205	1241	763
6206	1242	711
6207	1242	712
6208	1242	714
6209	1242	748
6210	1242	655
6211	1243	769
6212	1243	753
6213	1243	678
6214	1243	684
6215	1243	767
6216	1244	676
6217	1244	711
6218	1244	730
6219	1244	682
6220	1244	735
6221	1245	752
6222	1245	754
6223	1245	712
6224	1245	761
6225	1245	780
6226	1246	707
6227	1246	790
6228	1246	776
6229	1246	713
6230	1246	733
6231	1247	722
6232	1247	651
6233	1247	667
6234	1247	749
6235	1247	747
6236	1248	690
6237	1248	707
6238	1248	651
6239	1248	668
6240	1248	797
6241	1249	688
6242	1249	709
6243	1249	775
6244	1249	765
6245	1249	798
6246	1250	690
6247	1250	793
6248	1250	794
6249	1250	731
6250	1250	670
6251	1251	772
6252	1251	777
6253	1251	730
6254	1251	716
6255	1251	717
6256	1252	784
6257	1252	721
6258	1252	772
6259	1252	709
6260	1252	730
6261	1253	675
6262	1253	708
6263	1253	677
6264	1253	652
6265	1253	703
6266	1254	705
6267	1254	786
6268	1254	696
6269	1254	729
6270	1254	654
6271	1255	800
6272	1255	755
6273	1255	794
6274	1255	685
6275	1255	798
6276	1256	656
6277	1256	673
6278	1256	657
6279	1256	651
6280	1256	732
6281	1257	658
6282	1257	724
6283	1257	709
6284	1257	788
6285	1257	730
6286	1258	703
6287	1258	729
6288	1258	778
6289	1258	667
6290	1258	655
6291	1259	706
6292	1259	788
6293	1259	679
6294	1259	780
6295	1259	751
6296	1260	675
6297	1260	723
6298	1260	764
6299	1260	748
6300	1260	750
6301	1261	738
6302	1261	662
6303	1261	695
6304	1261	664
6305	1261	746
6306	1262	738
6307	1262	770
6308	1262	725
6309	1262	732
6310	1262	702
6311	1263	740
6312	1263	709
6313	1263	788
6314	1263	791
6315	1263	776
6316	1264	721
6317	1264	695
6318	1264	745
6319	1264	762
6320	1264	797
6321	1265	705
6322	1265	772
6323	1265	679
6324	1265	729
6325	1265	779
6326	1266	700
6327	1266	663
6328	1266	652
6329	1266	701
6330	1266	686
6331	1267	707
6332	1267	723
6333	1267	715
6334	1267	667
6335	1267	798
6336	1268	768
6337	1268	755
6338	1268	725
6339	1268	793
6340	1268	731
6341	1269	770
6342	1269	757
6343	1269	695
6344	1269	797
6345	1269	719
6346	1270	706
6347	1270	786
6348	1270	760
6349	1270	700
6350	1270	749
6351	1271	800
6352	1271	771
6353	1271	708
6354	1271	757
6355	1271	760
6356	1272	757
6357	1272	681
6358	1272	667
6359	1272	685
6360	1272	719
6361	1273	760
6362	1273	692
6363	1273	664
6364	1273	765
6365	1273	750
6366	1274	659
6367	1274	724
6368	1274	726
6369	1274	696
6370	1274	700
6371	1275	722
6372	1275	746
6373	1275	796
6374	1275	701
6375	1275	686
6376	1276	784
6377	1276	758
6378	1276	663
6379	1276	762
6380	1276	719
6381	1277	659
6382	1277	723
6383	1277	677
6384	1277	761
6385	1277	735
6386	1278	735
6387	1278	694
6388	1278	653
6389	1278	750
6390	1278	751
6391	1279	752
6392	1279	769
6393	1279	692
6394	1279	777
6395	1279	701
6396	1280	725
6397	1280	662
6398	1280	682
6399	1280	731
6400	1280	748
6401	1281	766
6402	1281	742
6403	1281	774
6404	1281	713
6405	1281	695
6406	1282	731
6407	1282	714
6408	1282	795
6409	1282	749
6410	1282	782
6411	1283	709
6412	1283	744
6413	1283	713
6414	1283	686
6415	1283	799
6416	1284	773
6417	1284	731
6418	1284	792
6419	1284	699
6420	1284	718
6421	1285	676
6422	1285	742
6423	1285	792
6424	1285	732
6425	1285	664
6426	1286	779
6427	1286	755
6428	1286	663
6429	1286	683
6430	1286	781
6431	1287	689
6432	1287	651
6433	1287	669
6434	1287	731
6435	1287	751
6436	1288	736
6437	1288	773
6438	1288	681
6439	1288	683
6440	1288	700
6441	1289	753
6442	1289	773
6443	1289	730
6444	1289	746
6445	1289	684
6446	1290	741
6447	1290	710
6448	1290	757
6449	1290	651
6450	1290	763
6451	1291	720
6452	1291	725
6453	1291	761
6454	1291	777
6455	1291	796
6456	1292	742
6457	1292	731
6458	1292	700
6459	1292	701
6460	1292	735
6461	1293	736
6462	1293	688
6463	1293	739
6464	1293	661
6465	1293	759
6466	1294	738
6467	1294	771
6468	1294	676
6469	1294	787
6470	1294	654
6471	1295	704
6472	1295	672
6473	1295	787
6474	1295	692
6475	1295	679
6476	1296	675
6477	1296	788
6478	1296	713
6479	1296	730
6480	1296	668
6481	1297	657
6482	1297	691
6483	1297	712
6484	1297	717
6485	1297	719
6486	1298	721
6487	1298	732
6488	1298	796
6489	1298	728
6490	1298	764
6491	1299	786
6492	1299	659
6493	1299	729
6494	1299	665
6495	1299	682
6496	1300	752
6497	1300	690
6498	1300	665
6499	1300	749
6500	1300	687
6501	1301	689
6502	1301	658
6503	1301	724
6504	1301	761
6505	1301	749
6506	1302	660
6507	1302	774
6508	1302	727
6509	1302	760
6510	1302	761
6511	1303	768
6512	1303	784
6513	1303	717
6514	1303	781
6515	1303	703
6516	1304	673
6517	1304	705
6518	1304	735
6519	1304	653
6520	1304	719
6521	1305	736
6522	1305	657
6523	1305	693
6524	1305	726
6525	1305	777
6526	1306	711
6527	1306	779
6528	1306	791
6529	1306	731
6530	1306	751
6531	1307	723
6532	1307	694
6533	1307	681
6534	1307	794
6535	1307	735
6536	1308	704
6537	1308	737
6538	1308	726
6539	1308	761
6540	1308	698
6541	1309	721
6542	1309	771
6543	1309	664
6544	1309	665
6545	1309	655
6546	1310	673
6547	1310	725
6548	1310	727
6549	1310	654
6550	1310	798
4051	811	724
4052	811	789
4053	811	711
4054	811	762
4055	811	796
4056	812	737
4057	812	738
4058	812	712
4059	812	746
4060	812	733
4061	813	771
4062	813	773
4063	813	793
4064	813	666
4065	813	751
4066	814	737
4067	814	706
4068	814	742
4069	814	684
4070	814	799
4071	815	721
4072	815	770
4073	815	709
4074	815	747
4075	815	748
4076	816	673
4077	816	691
4078	816	789
4079	816	715
4080	816	750
4081	817	741
4082	817	743
4083	817	760
4084	817	797
4085	817	734
4086	818	707
4087	818	664
4088	818	746
4089	818	747
4090	818	685
4091	819	689
4092	819	660
4093	819	680
4094	819	731
4095	819	669
4096	820	784
4097	820	690
4098	820	740
4099	820	662
4100	820	790
4101	821	768
4102	821	752
4103	821	723
4104	821	651
4105	821	653
4106	822	723
4107	822	740
4108	822	667
4109	822	652
4110	822	751
4111	823	657
4112	823	691
4113	823	776
4114	823	665
4115	823	699
4116	824	657
4117	824	676
4118	824	680
4119	824	685
4120	824	671
4121	825	738
4122	825	775
4123	825	729
4124	825	780
4125	825	798
4126	826	721
4127	826	791
4128	826	745
4129	826	682
4130	826	651
4131	827	800
4132	827	784
4133	827	720
4134	827	713
4135	827	716
4136	828	708
4137	828	677
4138	828	660
4139	828	765
4140	828	718
4141	829	769
4142	829	729
4143	829	758
4144	829	793
4145	829	653
4146	830	740
4147	830	693
4148	830	726
4149	830	790
4150	830	664
4151	831	657
4152	831	729
4153	831	763
4154	831	780
4155	831	701
4156	832	653
4157	832	728
4158	832	681
4159	832	781
4160	832	687
4161	833	737
4162	833	677
4163	833	713
4164	833	699
4165	833	797
4166	834	668
4167	834	757
4168	834	791
4169	834	746
4170	834	748
4171	835	771
4172	835	773
4173	835	774
4174	835	696
4175	835	762
4176	836	673
4177	836	740
4178	836	776
4179	836	665
4180	836	751
4181	837	734
4182	837	694
4183	837	729
4184	837	669
4185	837	750
4186	838	778
4187	838	715
4188	838	748
4189	838	797
4190	838	718
4191	839	705
4192	839	711
4193	839	793
4194	839	731
4195	839	687
4196	840	788
4197	840	726
4198	840	680
4199	840	779
4200	840	728
4201	841	661
4202	841	693
4203	841	682
4204	841	765
4205	841	670
4206	842	774
4207	842	663
4208	842	666
4209	842	716
4210	842	669
4211	843	785
4212	843	787
4213	843	775
4214	843	668
4215	843	685
4216	844	724
4217	844	741
4218	844	757
4219	844	666
4220	844	783
4221	845	666
4222	845	792
4223	845	778
4224	845	779
4225	845	654
4226	846	768
4227	846	752
4228	846	786
4229	846	715
4230	846	780
4231	847	786
4232	847	772
4233	847	660
4234	847	651
4235	847	750
4236	848	688
4237	848	661
4238	848	710
4239	848	728
4240	848	668
4241	849	657
4242	849	770
4243	849	722
4244	849	792
4245	849	701
4246	850	784
4247	850	660
4248	850	682
4249	850	654
4250	850	767
4251	851	771
4252	851	707
4253	851	713
4254	851	780
4255	851	703
4256	852	672
4257	852	754
4258	852	660
4259	852	710
4260	852	667
4261	853	704
4262	853	689
4263	853	788
4264	853	743
4265	853	682
4266	854	789
4267	854	663
4268	854	760
4269	854	745
4270	854	797
4271	855	704
4272	855	745
4273	855	714
4274	855	747
4275	855	765
4276	856	687
4277	856	791
4278	856	778
4279	856	747
4280	856	751
4281	857	787
4282	857	677
4283	857	653
4284	857	717
4285	857	671
4286	858	673
4287	858	787
4288	858	793
4289	858	746
4290	858	796
4291	859	754
4292	859	739
4293	859	679
4294	859	682
4295	859	799
4296	860	722
4297	860	755
4298	860	700
4299	860	764
4300	860	735
4301	861	690
4302	861	755
4303	861	776
4304	861	665
4305	861	798
4306	862	656
4307	862	673
4308	862	676
4309	862	667
4310	862	668
4311	863	797
4312	863	757
4313	863	682
4314	863	779
4315	863	733
4316	864	722
4317	864	664
4318	864	778
4319	864	668
4320	864	766
4321	865	706
4322	865	771
4323	865	707
4324	865	779
4325	865	783
4326	866	660
4327	866	773
4328	866	725
4329	866	790
4330	866	767
4331	867	708
4332	867	773
4333	867	725
4334	867	667
4335	867	654
4336	868	738
4337	868	696
4338	868	665
4339	868	748
4340	868	751
4341	869	672
4342	869	787
4343	869	723
4344	869	724
4345	869	794
4346	870	692
4347	870	741
4348	870	662
4349	870	679
4350	870	680
4351	871	740
4352	871	677
4353	871	758
4354	871	712
4355	871	729
4356	872	695
4357	872	712
4358	872	794
4359	872	664
4360	872	750
4361	873	756
4362	873	773
4363	873	745
4364	873	700
4365	873	798
4366	874	657
4367	874	662
4368	874	696
4369	874	762
4370	874	685
4371	875	673
4372	875	726
4373	875	792
4374	875	700
4375	875	687
4376	876	742
4377	876	651
4378	876	732
4379	876	702
4380	876	734
4381	877	660
4382	877	661
4383	877	743
4384	877	681
4385	877	703
4386	878	652
4387	878	721
4388	878	683
4389	878	780
4390	878	717
4391	879	656
4392	879	722
4393	879	727
4394	879	680
4395	879	669
4396	880	705
4397	880	690
4398	880	772
4399	880	761
4400	880	685
4401	881	721
4402	881	792
4403	881	714
4404	881	664
4405	881	718
4406	882	706
4407	882	725
4408	882	793
4409	882	717
4410	882	782
4411	883	739
4412	883	660
4413	883	762
4414	883	666
4415	883	684
4416	884	720
4417	884	769
4418	884	658
4419	884	668
4420	884	684
4421	885	770
4422	885	723
4423	885	795
4424	885	749
4425	885	798
4426	886	656
4427	886	689
4428	886	757
4429	886	693
4430	886	683
4431	887	658
4432	887	786
4433	887	694
4434	887	793
4435	887	703
4436	888	737
4437	888	723
4438	888	740
4439	888	681
4440	888	782
4441	889	736
4442	889	789
4443	889	710
4444	889	728
4445	889	778
4446	890	737
4447	890	692
4448	890	698
4449	890	651
4450	890	750
4451	891	736
4452	891	789
4453	891	726
4454	891	727
4455	891	701
4456	892	768
4457	892	746
4458	892	779
4459	892	733
4460	892	718
4461	893	753
4462	893	698
4463	893	668
4464	893	653
4465	893	671
4466	894	739
4467	894	723
4468	894	665
4469	894	716
4470	894	735
4471	895	770
4472	895	738
4473	895	789
4474	895	695
4475	895	794
4476	896	724
4477	896	661
4478	896	664
4479	896	684
4480	896	703
4481	897	752
4482	897	742
4483	897	759
4484	897	714
4485	897	702
4486	898	784
4487	898	723
4488	898	724
4489	898	750
4490	898	767
4491	899	790
4492	899	712
4493	899	713
4494	899	794
4495	899	654
4496	900	769
4497	900	738
4498	900	660
4499	900	745
4500	900	733
4501	901	705
4502	901	776
4503	901	778
4504	901	700
4505	901	664
4506	902	725
4507	902	792
4508	902	681
4509	902	698
4510	902	782
4511	903	752
4512	903	690
4513	903	698
4514	903	714
4515	903	701
4516	904	709
4517	904	776
4518	904	729
4519	904	651
4520	904	671
4521	905	672
4522	905	754
4523	905	723
4524	905	789
4525	905	678
4526	906	800
4527	906	738
4528	906	691
4529	906	742
4530	906	685
4531	907	752
4532	907	705
4533	907	676
4534	907	763
4535	907	765
4536	908	752
4537	908	674
4538	908	665
4539	908	794
4540	908	668
4541	909	675
4542	909	676
4543	909	726
4544	909	698
4545	909	764
4546	910	660
4547	910	741
4548	910	758
4549	910	764
4550	910	671
4551	911	691
4552	911	660
4553	911	756
4554	911	795
4555	911	700
4556	912	721
4557	912	658
4558	912	710
4559	912	726
4560	912	667
4561	913	707
4562	913	791
4563	913	729
4564	913	717
4565	913	783
4566	914	795
4567	914	721
4568	914	740
4569	914	779
4570	914	670
4571	915	738
4572	915	722
4573	915	666
4574	915	778
4575	915	718
4576	916	722
4577	916	744
4578	916	683
4579	916	654
4580	916	671
4581	917	660
4582	917	666
4583	917	728
4584	917	778
4585	917	767
4586	918	786
4587	918	766
4588	918	697
4589	918	748
4590	918	782
4591	919	726
4592	919	775
4593	919	758
4594	919	780
4595	919	797
4596	920	739
4597	920	715
4598	920	700
4599	920	699
4600	920	750
4601	921	672
4602	921	757
4603	921	790
4604	921	743
4605	921	764
4606	922	676
4607	922	791
4608	922	714
4609	922	699
4610	922	654
4611	923	723
4612	923	794
4613	923	747
4614	923	748
4615	923	750
4616	924	767
4617	924	740
4618	924	660
4619	924	776
4620	924	655
4621	925	657
4622	925	740
4623	925	756
4624	925	666
4625	925	667
4626	926	772
4627	926	715
4628	926	733
4629	926	766
4630	926	747
4631	927	784
4632	927	657
4633	927	676
4634	927	792
4635	927	684
4636	928	753
4637	928	692
4638	928	712
4639	928	731
4640	928	783
4641	929	725
4642	929	727
4643	929	715
4644	929	716
4645	929	703
4646	930	723
4647	930	708
4648	930	764
4649	930	743
4650	930	652
4651	931	752
4652	931	660
4653	931	677
4654	931	775
4655	931	777
4656	932	706
4657	932	724
4658	932	662
4659	932	743
4660	932	694
4661	933	704
4662	933	739
4663	933	710
4664	933	680
4665	933	701
4666	934	787
4667	934	659
4668	934	714
4669	934	667
4670	934	669
4671	935	705
4672	935	679
4673	935	760
4674	935	745
4675	935	794
4676	936	704
4677	936	739
4678	936	772
4679	936	693
4680	936	663
4681	937	657
4682	937	663
4683	937	696
4684	937	716
4685	937	669
4686	938	720
4687	938	673
4688	938	743
4689	938	765
4690	938	686
4691	939	786
4692	939	787
4693	939	788
4694	939	793
4695	939	698
4696	940	672
4697	940	657
4698	940	795
4699	940	764
4700	940	797
4701	941	784
4702	941	725
4703	941	789
4704	941	766
4705	941	719
4706	942	738
4707	942	660
4708	942	777
4709	942	711
4710	942	745
4711	943	753
4712	943	786
4713	943	696
4714	943	730
4715	943	746
4716	944	720
4717	944	772
4718	944	660
4719	944	713
4720	944	762
4721	945	720
4722	945	789
4723	945	678
4724	945	779
4725	945	749
4726	946	704
4727	946	689
4728	946	761
4729	946	777
4730	946	782
4731	947	657
4732	947	787
4733	947	678
4734	947	680
4735	947	670
4736	948	736
4737	948	677
4738	948	747
4739	948	764
4740	948	701
4741	949	721
4742	949	739
4743	949	756
4744	949	726
4745	949	794
4746	950	786
4747	950	662
4748	950	698
4749	950	685
4750	950	799
4751	951	705
4752	951	661
4753	951	728
4754	951	730
4755	951	703
4756	952	674
4757	952	793
4758	952	796
4759	952	685
4760	952	702
4761	953	753
4762	953	754
4763	953	723
4764	953	725
4765	953	782
4766	954	738
4767	954	691
4768	954	741
4769	954	679
4770	954	779
4771	955	770
4772	955	773
4773	955	711
4774	955	794
4775	955	701
4776	956	659
4777	956	653
4778	956	759
4779	956	668
4780	956	685
4781	957	768
4782	957	796
4783	957	683
4784	957	748
4785	957	699
4786	958	722
4787	958	766
4788	958	715
4789	958	701
4790	958	782
4791	959	707
4792	959	772
4793	959	757
4794	959	694
4795	959	665
4796	960	720
4797	960	676
4798	960	793
4799	960	652
4800	960	767
4801	961	678
4802	961	666
4803	961	761
4804	961	778
4805	961	687
4806	962	727
4807	962	712
4808	962	714
4809	962	667
4810	962	717
4811	963	800
4812	963	785
4813	963	679
4814	963	795
4815	963	719
4816	964	800
4817	964	739
4818	964	791
4819	964	667
4820	964	668
4821	965	724
4822	965	726
4823	965	779
4824	965	766
4825	965	687
4826	966	753
4827	966	659
4828	966	775
4829	966	680
4830	966	745
4831	967	720
4832	967	752
4833	967	775
4834	967	716
4835	967	703
4836	968	770
4837	968	724
4838	968	680
4839	968	793
4840	968	654
4841	969	662
4842	969	711
4843	969	712
4844	969	666
4845	969	751
4846	970	688
4847	970	756
4848	970	796
4849	970	762
4850	970	716
4851	971	753
4852	971	676
4853	971	697
4854	971	699
4855	971	783
4856	972	785
4857	972	651
4858	972	732
4859	972	750
4860	972	783
4861	973	673
4862	973	690
4863	973	682
4864	973	731
4865	973	702
4866	974	755
4867	974	691
4868	974	711
4869	974	761
4870	974	795
4871	975	656
4872	975	663
4873	975	664
4874	975	701
4875	975	702
4876	976	696
4877	976	797
4878	976	715
4879	976	732
4880	976	701
4881	977	784
4882	977	658
4883	977	788
4884	977	797
4885	977	671
4886	978	708
4887	978	758
4888	978	662
4889	978	698
4890	978	719
4891	979	722
4892	979	707
4893	979	743
4894	979	732
4895	979	685
4896	980	668
4897	980	754
4898	980	787
4899	980	727
4900	980	652
4901	981	770
4902	981	658
4903	981	695
4904	981	764
4905	981	653
4906	982	784
4907	982	706
4908	982	740
4909	982	695
4910	982	697
4911	983	740
4912	983	790
4913	983	792
4914	983	745
4915	983	767
4916	984	728
4917	984	682
4918	984	778
4919	984	734
4920	984	655
4921	985	663
4922	985	777
4923	985	682
4924	985	730
4925	985	719
4926	986	657
4927	986	787
4928	986	692
4929	986	742
4930	986	716
4931	987	768
4932	987	729
4933	987	730
4934	987	795
4935	987	667
4936	988	753
4937	988	676
4938	988	695
4939	988	797
4940	988	750
4941	989	657
4942	989	772
4943	989	669
4944	989	734
4945	989	671
4946	990	656
4947	990	722
4948	990	789
4949	990	778
4950	990	735
4951	991	800
4952	991	688
4953	991	675
4954	991	742
4955	991	662
4956	992	694
4957	992	726
4958	992	790
4959	992	778
4960	992	799
4961	993	672
4962	993	736
4963	993	726
4964	993	666
4965	993	685
4966	994	753
4967	994	739
4968	994	710
4969	994	702
4970	994	783
4971	995	760
4972	995	691
4973	995	799
4974	995	744
4975	995	728
4976	996	736
4977	996	722
4978	996	762
4979	996	745
4980	996	714
4981	997	707
4982	997	678
4983	997	716
4984	997	798
4985	997	751
4986	998	784
4987	998	762
4988	998	796
4989	998	701
4990	998	782
4991	999	673
4992	999	709
4993	999	661
4994	999	717
4995	999	703
4996	1000	674
4997	1000	771
4998	1000	723
4999	1000	715
5000	1000	687
5001	1001	671
5002	1001	776
5003	1001	697
5004	1001	732
5005	1001	783
5006	1002	704
5007	1002	689
5008	1002	722
5009	1002	652
5010	1002	767
5011	1003	690
5012	1003	708
5013	1003	740
5014	1003	795
5015	1003	766
5016	1004	675
5017	1004	741
5018	1004	789
5019	1004	668
5020	1004	749
5021	1005	752
5022	1005	673
5023	1005	772
5024	1005	791
5025	1005	728
5026	1006	688
5027	1006	753
5028	1006	738
5029	1006	712
5030	1006	698
5031	1007	771
5032	1007	787
5033	1007	677
5034	1007	743
5035	1007	711
5036	1008	659
5037	1008	676
5038	1008	732
5039	1008	748
5040	1008	654
5041	1009	706
5042	1009	663
5043	1009	764
5044	1009	686
5045	1009	767
5046	1010	785
5047	1010	786
5048	1010	796
5049	1010	684
5050	1010	654
5051	1011	692
5052	1011	776
5053	1011	777
5054	1011	795
5055	1011	716
5056	1012	656
5057	1012	674
5058	1012	691
5059	1012	759
5060	1012	655
5061	1013	722
5062	1013	758
5063	1013	743
5064	1013	728
5065	1013	665
5066	1014	706
5067	1014	755
5068	1014	696
5069	1014	698
5070	1014	654
5071	1015	691
5072	1015	713
5073	1015	653
5074	1015	718
5075	1015	767
5076	1016	674
5077	1016	690
5078	1016	682
5079	1016	779
5080	1016	781
5081	1017	737
5082	1017	679
5083	1017	695
5084	1017	749
5085	1017	719
5086	1018	705
5087	1018	676
5088	1018	762
5089	1018	765
5090	1018	718
5091	1019	787
5092	1019	664
5093	1019	670
5094	1019	763
5095	1019	734
5096	1020	737
5097	1020	770
5098	1020	771
5099	1020	760
5100	1020	762
5101	1021	761
5102	1021	790
5103	1021	664
5104	1021	681
5105	1021	696
5106	1022	691
5107	1022	708
5108	1022	726
5109	1022	790
5110	1022	687
5111	1023	659
5112	1023	792
5113	1023	731
5114	1023	716
5115	1023	783
5116	1024	756
5117	1024	661
5118	1024	795
5119	1024	700
5120	1024	797
5121	1025	740
5122	1025	695
5123	1025	761
5124	1025	746
5125	1025	652
5126	1026	672
5127	1026	709
5128	1026	777
5129	1026	763
5130	1026	735
5131	1027	673
5132	1027	776
5133	1027	746
5134	1027	652
5135	1027	701
5136	1028	689
5137	1028	723
5138	1028	661
5139	1028	749
5140	1028	719
5141	1029	729
5142	1029	745
5143	1029	730
5144	1029	716
5145	1029	783
5146	1030	784
5147	1030	706
5148	1030	786
5149	1030	749
5150	1030	781
5151	1031	771
5152	1031	709
5153	1031	743
5154	1031	698
5155	1031	683
5156	1032	690
5157	1032	724
5158	1032	796
5159	1032	750
5160	1032	687
5161	1033	672
5162	1033	657
5163	1033	758
5164	1033	729
5165	1033	717
5166	1034	673
5167	1034	738
5168	1034	690
5169	1034	775
5170	1034	683
5171	1035	738
5172	1035	710
5173	1035	713
5174	1035	682
5175	1035	797
5176	1036	706
5177	1036	774
5178	1036	711
5179	1036	682
5180	1036	735
5181	1037	705
5182	1037	690
5183	1037	709
5184	1037	711
5185	1037	671
5186	1038	657
5187	1038	721
5188	1038	692
5189	1038	661
5190	1038	687
5191	1039	674
5192	1039	770
5193	1039	772
5194	1039	706
5195	1039	792
5196	1040	768
5197	1040	721
5198	1040	657
5199	1040	677
5200	1040	779
5201	1041	739
5202	1041	676
5203	1041	711
5204	1041	759
5205	1041	783
5206	1042	692
5207	1042	799
5208	1042	710
5209	1042	665
5210	1042	703
5211	1043	800
5212	1043	656
5213	1043	683
5214	1043	733
5215	1043	654
\.


--
-- TOC entry 3780 (class 0 OID 16716)
-- Dependencies: 247
-- Data for Name: rooms_door; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_door (id, name, width, length, height, type) FROM stdin;
211	vLwLypGkoZfZcIWiJqrAoPSIjmgvfu	1	1	1	DT2
212	TdBvVTRynaBlnYUfMYXpVnJbNATydY	1	1	1	DT4
213	ZhhCXQUrontaooaKiuuQxbhmjDJTMk	1	1	1	DT4
214	wqrsGwDroIZnQRWMVbvOJWqFfVCkBR	1	1	1	DT2
215	iJKUYckXQDASraCdNTqDLVxqAZFjBG	1	1	1	DT4
216	DRFmUwzPyIbWZVCeSAagcSPKZieMnV	1	1	1	DT3
217	xoVEiltwrEoWFHXJohTTOULqqpYBAg	1	1	1	DT1
218	AJSBfGTziaMtwEsEYhZIRurlCQlfEn	1	1	1	DT4
219	SRhzEggpgggcUzRDbRmWLVgwsTOYMk	1	1	1	DT4
220	rXoqmQyJiMGZsFwmbHmIAjrcudVOUl	1	1	1	DT1
221	ezdjqqBwitCbtfGxUiqaKfqZmxKlSM	1	1	1	DT2
222	PUPqdnnEVPQXtzbZzBeWRjanpIQHsT	1	1	1	DT3
223	eNQtFmZUrfSaiLSQjjabsojeafQiWh	1	1	1	DT4
224	vrswIwAyfEHxYpLFzgJuZAHpRaWtPS	1	1	1	DT1
225	YQYyORBiLmbpOYPPDgizCaDffBmjtV	1	1	1	DT2
226	EWKIYYiBFkuKBFuydbnsxnhBOVErGg	1	1	1	DT1
227	yMhTbZEWkyFXbDqRMSEmUDYlmsVUjK	1	1	1	DT3
228	EYqiZKMSBRrAkXnlMshDKfSJbxeJjJ	1	1	1	DT3
229	tmGyWREXqINSuxfxKqFqRRXqDQoKNg	1	1	1	DT4
230	OYOMAaBhMRquzvNzuxmmYWIUSlPFGa	1	1	1	DT4
231	MwtcmTomKQhYcQeEUTgPoPmnfaTXuh	1	1	1	DT2
232	IDrCYGbbrAciVslWpqbDdtrsaLdKuo	1	1	1	DT4
233	ydPTHnBkWoOBuPwqICeMiLfJrRzQWS	1	1	1	DT4
234	swZnmkTWLHIdYOaohCEETUMzSLOzvS	1	1	1	DT2
235	HVPXdIgrQcApyudvACfbClkpkTBKGs	1	1	1	DT4
236	xieqxtMCkvnOsaVfrcmqHpnEDpjIxZ	1	1	1	DT1
237	uQJxxsYvNkbzauMCnFqSFvcHmOazPK	1	1	1	DT2
238	TKJpNuVJpuQPiourKdEsdihAyLDrMP	1	1	1	DT3
239	aUznoIowtNgrFIHIXgTfpAvCpHRnuH	1	1	1	DT2
240	yZkxDpWGrIgTsbDdSYwpxiULwKiRat	1	1	1	DT4
241	zOCJuLtVZJWESNJrjLpWpsjBttrZDD	1	1	1	DT4
242	BBagWNhSLaghJyFwStLbfEoAoUgFeV	1	1	1	DT1
243	dsvwZJdpFBWKDsvAubSMxbQRuVkRwD	1	1	1	DT1
244	aqCavQfOwwtSLtynWtmegqxoGuMijp	1	1	1	DT1
245	qJsoaDmThwcfSBeAMCwkzNNyOOkjsb	1	1	1	DT3
246	NsRJdUbQFlIeVhgNLeOteWzUNlXpOi	1	1	1	DT3
247	yLRxPMXetQitQsFzWRpmstEZhMUZIs	1	1	1	DT1
248	qcrVbYufpaScJJVtOlcKLiQrhaQkeD	1	1	1	DT4
249	qcFkLwkWyOBibkAiBxEHkREszSmhjU	1	1	1	DT3
250	jTPgNhQnCXUXDZzaCuNKVlZlxrAmUP	1	1	1	DT4
251	UYjAPCsUoYdeDgqJAHztOQBVqaDICF	1	1	1	DT1
252	ZvuZIkvmhjIEHvhgEJzHjlHLLTYPHa	1	1	1	DT2
253	yTuwwbWyRfqmBqzEXzbtLzEVvcVBgS	1	1	1	DT3
254	eoEOsNqiAzKhWJhIebVDASpFEVSBBB	1	1	1	DT4
255	WbhHBCbqDrJZPfUlNkQfivGGhTMxTT	1	1	1	DT2
256	OSPWTsoKsTsRWTjARiHVpiAeNlVfXM	1	1	1	DT3
257	hObWkfyosxtAkqRBWfQANoEtfawWgh	1	1	1	DT3
258	pkuNsQwVoTshfjBLwXrDvJrFQzqSuL	1	1	1	DT2
259	dhKDtHncBZBgTDTwbcdMWYWlGnLjHb	1	1	1	DT4
260	gLnYlcKKNmBAkZnDQvjSYXRtxBdvSL	1	1	1	DT1
\.


--
-- TOC entry 3782 (class 0 OID 16725)
-- Dependencies: 249
-- Data for Name: rooms_room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_room (id, name, width, length, height, type, decoration_id, door_id) FROM stdin;
1041	ID_1041_ROOM_NAME	1	1	1	KTCH	1041	237
1042	AiyLFRQRZAjaSDgrCZQNTCAdseeCvV	1	1	1	LRM	1042	224
1043	LkbgGZxsZrOZzvKgMLZkNyccMhGMSA	1	1	1	KTCH	1043	224
1044	cCFMxxBJtElEHnlbhGgUKLfAObdPEi	1	1	1	LBB	1044	214
1045	tnLtaMHQETduSbTkIFPQviXOnwXxBM	1	1	1	BDR	1045	223
1046	nMEOKzyXgnwLlTXqgxkyhCvrvUMhsR	1	1	1	LBB	1046	247
1047	BzRcfDXqTJhHOaYvNCmZDJtrEVjnfJ	1	1	1	KTCH	1047	254
1048	aosFeKJhUAZhzsghYOchUEwxMEopek	1	1	1	LBB	1048	224
1049	NTPCHuCfcqpGohQwehoCvmZFkFXnIZ	1	1	1	BDR	1049	240
1050	wFKwMKxmexNezjemubtQLGIKsWmoHb	1	1	1	LBB	1050	225
1051	bTddwiJdgvcAkOhdXOjOJGYiLfKkgl	1	1	1	KTCH	1051	236
1052	VpuiJquJLcQUaGXQpqzCPFWBJHkATw	1	1	1	LBB	1052	231
1053	QggBsRQTXQyKkOckFttYvupSuEzsxB	1	1	1	KTCH	1053	237
1054	mAwqzJyqSmVyGsBwpOBfYVQBjhoqpb	1	1	1	LBB	1054	216
1055	cJahNswODVdRXXPleTqZLSPkuSpnLo	1	1	1	BDR	1055	248
1056	zCfVvJMEeUqtovlWjKCEBBEXgzspop	1	1	1	BDR	1056	247
1057	ayJLpKuNSrQbXUrgfHZMpyVwFNJqva	1	1	1	KTCH	1057	250
1058	MndSAYrielqfjtrpaYSEYuvhefusiB	1	1	1	LBB	1058	218
1059	SAVhLHlndGzKpRwKMlmwFZTHWMbSua	1	1	1	LRM	1059	215
1060	WGrEGIjSbUvrZyUOAfnmsLdtGXuILv	1	1	1	LRM	1060	253
1061	irEHfOPdBYOKUOBOyKqKGFAvmwbzJn	1	1	1	LRM	1061	250
1062	yiUwRexWYiSetVESFgaSynqlLlUnuP	1	1	1	BDR	1062	245
1063	tbXflJufSwwwaFWmEQLrEKcrjIWawc	1	1	1	LRM	1063	214
1064	XkMQjWSwayqqDlPmKdocBAHNVHSbMH	1	1	1	LRM	1064	244
1065	OJJHeoettzbcjxwGPyrGgJLUbPkyAD	1	1	1	BDR	1065	245
1066	tYbstJHwVHpEntHKkhzzqkqAhOHTMB	1	1	1	KTCH	1066	229
1067	XmgMfnSNCbfMOcCJcuPHaufwbuWdNs	1	1	1	KTCH	1067	237
1068	pZRNpEgCvpMCCtaZAkpVAmAnrdpaQw	1	1	1	LRM	1068	245
1069	ICmelNhvGADfmLwiYPoyKmZxetEdaM	1	1	1	LBB	1069	232
1070	zDLxigivqnqlJVdkZVJzrjOMbRlodu	1	1	1	BDR	1070	252
1071	fPuaFMiOUbbEXSPdyBeaicotyUHvqT	1	1	1	KTCH	1071	234
1072	nHiFZZOoBYXzQjaVYjbQPwIJSkyGJf	1	1	1	BDR	1072	222
1073	vvrBbsTmiElclHeMXhbAVxnKdVdMtg	1	1	1	KTCH	1073	255
1074	DwwxGwOleOqbnOdsHFWnTtTckTavPA	1	1	1	KTCH	1074	232
1075	bBrxxgGOnxbQGGMlqYbAbWsvTrOULe	1	1	1	KTCH	1075	242
1076	IwphnPqJXLTIbLOfiqfcNSmEKvwwUs	1	1	1	KTCH	1076	250
1077	SwsBHdMjtUBvYurnOmsClwMFMmescp	1	1	1	BDR	1077	257
1078	ONEBpRTNXkZVJgwgEaecphwUhggCau	1	1	1	LRM	1078	252
1079	VBPTHASZnXvTvxFIbYWFXQVhRoCuZU	1	1	1	KTCH	1079	232
1080	srWkVPVmlbOkKsetkUyjnsEmuKwSyA	1	1	1	BDR	1080	223
1081	HtIsgjUkdDtUaOhnLdrATIVQGDvnLa	1	1	1	KTCH	1081	225
1082	asREjxgWfQdpAicXPcOTZmDYDGLMke	1	1	1	LRM	1082	225
1083	WZosRwVWSXolFnplXToPhBVWfgZjpX	1	1	1	KTCH	1083	245
1084	lWxZqxNOYZjXOdRXJwbZgloaMdEbtv	1	1	1	LBB	1084	222
1085	aTGmJfnzRWbUFVdnoyaUoviGgyantb	1	1	1	LRM	1085	228
1086	RevrPgsJwKMoCfbEeSJbnIOSGeTgOH	1	1	1	KTCH	1086	216
1087	NcPUBcFLJfGJRmkdAJSRVmYFzdBHsD	1	1	1	LBB	1087	219
1088	daYjfWakcRHwPoAwukvYBLyRJnauWG	1	1	1	KTCH	1088	227
1089	VgGMewXnWnbreQgOzIRaBgLrQCYmaw	1	1	1	KTCH	1089	255
1090	QiGBJnsmMCryIcFaBwqntPowTBlSIr	1	1	1	KTCH	1090	244
1091	QSHTKnUplxEtXKraDhXBDXKwwFnqgD	1	1	1	LBB	1091	238
1092	yCrbRORFWqYhLkCZpfkKnnGstRrefd	1	1	1	BDR	1092	218
1093	XZMyMIjQRBnHjVutlpysqjVEITVNDv	1	1	1	LBB	1093	212
1094	LfpOFASnBoqoXIirWDUosCMioYnGsS	1	1	1	KTCH	1094	243
1095	nvxNGglyXBZxtRQLmZWFMepRdLFQLf	1	1	1	LRM	1095	248
1096	JxFUlvFrCCIuMpZiWHfyGoViFWwTQF	1	1	1	LBB	1096	220
1097	MnulsgbcjUkyVXFiigHfwfdijJqRku	1	1	1	LRM	1097	252
1098	LdKCXWrkuMuxpSbeHKzXsJJPBiGVND	1	1	1	KTCH	1098	216
1099	XueOhqTmDpDSxrBTCodvQvBcArdKUT	1	1	1	KTCH	1099	219
1100	tbqRXHJRBMyhYHhSurzLYBXKnxvplu	1	1	1	LRM	1100	257
1101	jXfPpnzqLCOgYZxHRhsgufgtLlungn	1	1	1	KTCH	1101	214
1102	AhoqGNexeztFJXenmtgWfouvOpZjcE	1	1	1	LRM	1102	259
1103	tibEjmFFFTNwQCSIlCNgldUOgVwQxv	1	1	1	LRM	1103	247
1104	rDoYtiaVVBrKQRhAbcgbhwhopIlinw	1	1	1	KTCH	1104	244
1105	WnZXwdXbRKLzGqZJsEMsoMLbNtULCU	1	1	1	LRM	1105	232
1106	XRDAAgMUgBZNIgbxnaCAiFTFtfrCPF	1	1	1	KTCH	1106	254
1107	XxxSMlRZifYxscLLnRaLcSioIojKyR	1	1	1	KTCH	1107	254
1108	ebpRaLNCelJYSEwEumdXZIrgRkILPA	1	1	1	KTCH	1108	216
1109	LVhElOBJpIHbACBfyGKHTKoPuifkxm	1	1	1	BDR	1109	223
1110	VdlxAVSLoIRZLVSFfHpLFCmUknSQpW	1	1	1	BDR	1110	242
1111	ZqvCSOVyOpLedlGdxxtKIqmyjVTFLf	1	1	1	LBB	1111	232
1112	xYYKarRNBtgcunkzEKEhkoIayubzVj	1	1	1	LRM	1112	256
1113	cBZsvCMGciIhEYMVtRndAlGoQYXSzl	1	1	1	LBB	1113	239
1114	LHdxCXSEOwZcIwFIeOAIdqroKwZFWQ	1	1	1	KTCH	1114	245
1115	JVaLFHAhUtLYgkuayNkALetXQbgYLA	1	1	1	LBB	1115	244
1116	eDOTGIltEtlDMrDOAktWKHvjdpZSJL	1	1	1	BDR	1116	216
1117	gQLbcPVeYWxMTHoDxeJJtRDYJHOCwT	1	1	1	LBB	1117	242
1118	DoeVEtHrSenJqVSWaTqIRUsVeRsWNf	1	1	1	LBB	1118	223
1119	VUgkVCZiUofAuslFSatlrhbxjuKsUk	1	1	1	LRM	1119	228
1120	gocPsbWXPpDymdSQGrdmQqHQBsEbcB	1	1	1	KTCH	1120	259
1121	pycbIoUOSrYmuQxNxuFCFzNoDVVDHV	1	1	1	KTCH	1121	233
1122	TZkNHkCplbTBpxMrVhGAQWgMkkXSFP	1	1	1	LRM	1122	234
1123	XkZQkhTMlAXEkXumOCsYValcGMfCeS	1	1	1	LBB	1123	222
1124	uEaWTxkhqcVixIBtHakNEYVhZncsRO	1	1	1	BDR	1124	224
1125	euSJVVJijiAdxoEaTjRdpFvzIyiPfm	1	1	1	KTCH	1125	211
1126	gVAqlGYAuiyJjTYFkpOLiNvOcWfKCh	1	1	1	BDR	1126	238
1127	ExfyYbzBnjjbqehMDLbOUwpmdEThBG	1	1	1	BDR	1127	216
1128	FniDVmBiRVdXIwCOuqzCcdeYgaKEqF	1	1	1	BDR	1128	225
1129	GlKrjELAydeCgnJXwzHlYmLGZZYnRj	1	1	1	KTCH	1129	250
1130	YaMnHVlVMdJwmiLRipBcSesKDvGsdw	1	1	1	BDR	1130	235
1131	gDKTAXUWLXQpjPrNLFlMZQfayertgc	1	1	1	LBB	1131	224
1132	WgbmSniqLwDmXUzKkQEPktdykfJueP	1	1	1	LBB	1132	211
1133	LAChVIdlcnNxWOyhQcTqiFlldRXZfS	1	1	1	BDR	1133	220
1134	eKLMOsHWRfjqLrrMtNFNRmwxvCMpGW	1	1	1	KTCH	1134	231
1135	ZLYPofFsJxXNdNYWaTGDsYTouZZLop	1	1	1	KTCH	1135	217
1136	XUrEwsqPWxnrETjoVMIyBgEniWPkdz	1	1	1	BDR	1136	246
1137	kFQGMeoSUvYKCIWplxqDJjDTiKRGkN	1	1	1	BDR	1137	222
1138	aGIBNNsVWrXjpUVpIQakKBDNCiFUxv	1	1	1	KTCH	1138	253
1139	QnsrGINWnzIrACqqxCvZKsbFDiRyfj	1	1	1	BDR	1139	228
1140	wzMyXPPxAAzVgxeKzNSmLNIzuaKPTt	1	1	1	BDR	1140	239
1141	TnhpUhEOnRmibVCahHqlaLFnIxbjXN	1	1	1	LRM	1141	230
1142	pTOUfkGYqBpXkEmkXnlxyjfMUEIAjY	1	1	1	KTCH	1142	239
1143	wzMOOecNsNKIseVKdiknePEAbuRBXn	1	1	1	LBB	1143	224
1144	tkMFxDJgXyvevGMNsDlZasXYIGziUE	1	1	1	BDR	1144	214
1145	HjsQYXPASqrsaoTBTOyeJAxCjReGTe	1	1	1	LRM	1145	224
1146	KtTwfVFGCszPcKUdCUwCUKveJrnLJv	1	1	1	LBB	1146	256
1147	VSBAUzihayyjhYqoSsSqzNnMTTYOSp	1	1	1	KTCH	1147	237
1148	XWrsVxSabXkwHIMgpxTNMeZIzKvaHh	1	1	1	LRM	1148	239
1149	jrdVcJMXokqTIUMJkFTzDghlLjRyEw	1	1	1	LBB	1149	253
1150	CwGxdRSFStJjDkXcNkaROXPQIqWfog	1	1	1	LBB	1150	254
1151	aCsSnyRlYCpEoCqGPRLfRWEJORcVUb	1	1	1	LBB	1151	217
1152	xzcSFMjHFCITUiSgpnOhfImCPdgnZT	1	1	1	LRM	1152	227
1153	sImLFpIfZJXXmpQzvYLtNKCtbhkWDH	1	1	1	KTCH	1153	238
1154	CEmRDgoOZhJCKHupQWbsduEGwmfFiT	1	1	1	BDR	1154	239
1155	TkpkOAyFZiXLgWeiKxIrQQDRmQENek	1	1	1	BDR	1155	222
1156	DjVlrUJbcBBnTIrUGAdikIYrFynHlg	1	1	1	BDR	1156	224
1157	qGyFvZelojEwuZrrMCNHYzChDUHVFy	1	1	1	LRM	1157	226
1158	SVnKAMDciDfzkCooXuZXFeFDnXxPUm	1	1	1	LBB	1158	239
1159	kDczoCEcNWsZvRqTgFjYVpAKuCvzXd	1	1	1	KTCH	1159	231
1160	mTnnseGXwRhICkhkVbePCUyziarntM	1	1	1	BDR	1160	236
1161	dhxHnWbxBPKjZwSGxlNKzNKKpuafQZ	1	1	1	BDR	1161	246
1162	MboQNMGVSzCDrWjJVMbParuhmZbogX	1	1	1	BDR	1162	249
1163	HVLGdATzlFrlJjproJGOOEwdvbQhkO	1	1	1	LRM	1163	240
1164	hfQVNNbmbfnFydAWcaoaPTJfCwhZQW	1	1	1	BDR	1164	246
1165	NuCtyOPnSAhorqEJKqkpTnFICkdtUd	1	1	1	LBB	1165	222
1166	fibrgMMGycNGFmelyDDwQJTxswOkxF	1	1	1	LRM	1166	253
1167	LOhfzytgSVesjhQZOpwzDRuVdwwxCu	1	1	1	KTCH	1167	245
1168	zwnXPYVwgljkVvOLUeLTYhUjIqhSKk	1	1	1	LBB	1168	256
1169	MHNVDHeBhzkWdKvNwrwHlqpCICMSCh	1	1	1	BDR	1169	219
1170	hoDPXJglnMXWSXiLeFdWksMhHPBQDq	1	1	1	LRM	1170	260
1171	qakGaJXVBGXlZuzImMCrNKPZhkPBeU	1	1	1	BDR	1171	235
1172	TyivXRMdLPQASOPeihLODvskuCVcyv	1	1	1	LBB	1172	228
1173	NCwxWSEeGCVfNZIZavtxmVeOHlqbUi	1	1	1	KTCH	1173	214
1174	SifpQXEKRAKyjOVpohzylCFzsFHrBi	1	1	1	BDR	1174	214
1175	dQomGpKwRfmQrPpRFQWwqxiPXLQWft	1	1	1	KTCH	1175	218
1176	IHVNUKlHVnuzjJoEfICrNkdLySEewe	1	1	1	BDR	1176	222
1177	ngYoECVEzzgSQoqxMiusgHkhBUpAAQ	1	1	1	LRM	1177	216
1178	WbRwRTVfBVxgucVWIAFVYdTqJxzFxy	1	1	1	KTCH	1178	236
1179	mMTkXYEbrTSPbVxQnnQGDQhufSeRga	1	1	1	LBB	1179	225
1180	cDyMAlUKinmpeCMKuKPsKIaeCUMtkb	1	1	1	KTCH	1180	252
1181	mtwRRGtPTWHedlXzqWAqJThOKmVdGs	1	1	1	BDR	1181	212
1182	EUpAZgUGoMpGonaclSaXxymwzqOwWY	1	1	1	LRM	1182	241
1183	GSdBonvzWQZbeNoSKNAmAQcJYUozDa	1	1	1	KTCH	1183	242
1184	jyBlQJlEWoaFznzieIKvuefllochaj	1	1	1	KTCH	1184	218
1185	SxAknFWAJXQJbszsItUPvbLCZCIkSu	1	1	1	LBB	1185	221
1186	clyiyYchAhCXziXPWSXDVwafjwDwTV	1	1	1	LBB	1186	219
1187	pAoIQlAtjUtYTOyvhCoEfilQAzYlpy	1	1	1	BDR	1187	224
1188	ejTBixXAMfllapPkuSkShrSSKrFkCw	1	1	1	KTCH	1188	253
1189	pQrMPBdOhChBCjSvKAeUPHxkjUMvkP	1	1	1	LRM	1189	258
1190	bKCBwUMMQIbIMQnAQlkuKycXsbXWMI	1	1	1	LBB	1190	236
1191	RTPapzLGkbVsbopyfSXKfjAcUlMMmB	1	1	1	BDR	1191	255
1192	AiTWLTuTdsJwzQlSSZDlAwJxgwydVT	1	1	1	KTCH	1192	237
1193	ZVQwPjjcCLdeQgvsXgQiBMfqbJLMQA	1	1	1	LRM	1193	255
1194	XOlQfybENRylNMXQnGmkzcaHxQUEFL	1	1	1	LRM	1194	251
1195	VPKUodxRAerwPWTaAsMWJoIvUMGfil	1	1	1	LRM	1195	218
1196	aQJnjaRDIUWqeZQiCqNPuhtSYeoedD	1	1	1	BDR	1196	239
1197	nlMHmfGFQfFcMvupSiXVPrMzkfHPjy	1	1	1	LBB	1197	258
1198	ZhHpylwHxXRWWDeOqIgxyLsQRjkOie	1	1	1	LRM	1198	251
1199	kPLjEkxipTlgXHZGOGGyQyQTnYhnBw	1	1	1	LRM	1199	225
1200	NFLMlOrHOyqfBSjBjrXzPNPCCDnprz	1	1	1	LRM	1200	216
1201	YgEuJqIFMxalAAJcmIuhjrHEfPWNto	1	1	1	LRM	1201	243
1202	dtPyxGplQwuyIskeASHCUFvhkQirGC	1	1	1	KTCH	1202	255
1203	qBPiaikhDsfjIMZyVeVmTgLzlDXAiH	1	1	1	BDR	1203	227
1204	slLZdaPinfpDgpYGURkzpuQycQeVqn	1	1	1	BDR	1204	222
1205	bwtJoVQjIUoeKXeFirQcrUNcWplYsm	1	1	1	LBB	1205	238
1206	mUVSWIXHSerbipoohKWDWyIUVwSZVg	1	1	1	BDR	1206	230
1207	dqqavzDBNjFwqNibyKMEndNomeaDbE	1	1	1	LBB	1207	229
1208	wWTHxpnLTDcBGPvukBpgofpPRWAggY	1	1	1	LBB	1208	219
1209	nlqGJXIFgVmOkkVeYdYLCGTLuyddIm	1	1	1	BDR	1209	256
1210	eByYtkznHvxwlEyqJCcnkyXjqHxMuv	1	1	1	LRM	1210	217
1211	gBzZwnjsFAwNKdvkawJTTwiuxZSvdX	1	1	1	LRM	1211	226
1212	NEeJcbMfbfynXTtuFEsKeZIGoRelVJ	1	1	1	BDR	1212	249
1213	ZdEbQJuqdWMgrJdbltbjSGNafQqDLD	1	1	1	KTCH	1213	219
1214	xtNlNlDraYJqUCIgtSNpKmsAMpcIgU	1	1	1	KTCH	1214	257
1215	thaIAksRlgpPcYVKtGgpckTpaOrMef	1	1	1	KTCH	1215	218
1216	zkQEreTJOnCSdeAfgeedzJJlVXNokT	1	1	1	LBB	1216	213
1217	yArzNWNhAxPoqkscPdxAupZWNMIZJr	1	1	1	BDR	1217	252
1218	MoFaGNAmkOBJeKfrjPWQKRvfXKIRay	1	1	1	LRM	1218	242
1219	XQCBiKPrZctpOksfioTDAtBCIeGqtk	1	1	1	BDR	1219	222
1220	oOnXMRwdhhQoiFvpdGfWTrfJLcbymq	1	1	1	BDR	1220	219
1221	LkdnKXIwjKZNROLNTLNquTEHdUrwrx	1	1	1	LBB	1221	249
1222	cBoVzWHKqTeWBFOvLYUTsyzlXCfMnk	1	1	1	BDR	1222	240
1223	IOBfWjDosDVdAZKMDLGnjRIwaagJra	1	1	1	BDR	1223	236
1224	IvnXWZWTTxgqvOzdNjiuKLCRddmaXk	1	1	1	LRM	1224	244
1225	pDHqjxgQZIWwaXnvvjjGolxUsHEMXz	1	1	1	KTCH	1225	230
1226	tyRRfplAZCycQHcLkDyYWEbSjgjVLK	1	1	1	BDR	1226	241
1227	JmLFQmHnvXfwbzSaSqeQKXdIaPQkke	1	1	1	LRM	1227	224
1228	MEnBFLUVSeTWHfEjOpiOYMtKvTgtYR	1	1	1	LBB	1228	253
1229	mUURjqmroxEraERwhTRVCBGxZbvvTq	1	1	1	LRM	1229	252
1230	HvnNHqufgHAarwNiKrmNUSLRZpYiGO	1	1	1	BDR	1230	222
1231	VbttsSOEUKxWweFuczhhlBRbbKfYDk	1	1	1	LRM	1231	233
1232	XPeUTtfbNDSkctyrgAjtITVkyecBBH	1	1	1	LBB	1232	242
1233	agFFQgnnDVuwMhZwHfbAHRFGrNKErB	1	1	1	KTCH	1233	248
1234	HldMNZHinGfUDxmpsMueylqOdPzoTK	1	1	1	LRM	1234	228
1235	ahpSmbhOHcTbynEwmOCloZmWFnbWjN	1	1	1	BDR	1235	239
1236	lsQetjWLojGBvBmXdaltmuBqlYjRCX	1	1	1	KTCH	1236	260
1237	SkDiJDIqviqRxhWFcWGyQNkHrBooNb	1	1	1	KTCH	1237	247
1238	wzixgyCwQdLgzQQNMdcgaOpqwjQVwr	1	1	1	KTCH	1238	224
1239	UkLMTFTCXpTuAcsECGCQlpBHSjyyUz	1	1	1	KTCH	1239	237
1240	FpeKhhnciSfAYdmxUVWyfznlYQBbCY	1	1	1	LRM	1240	242
1241	jdYmSDlVdGKLgOcTVziXQyEJpVeELS	1	1	1	LBB	1241	241
1242	ovaimGLDgAFtpSyOzROmzeegknPnRw	1	1	1	KTCH	1242	218
1243	UpZnieiZNCbFBdVzkIutzJfORAnkZD	1	1	1	LRM	1243	236
1244	VHuPnfqlHyxuERvcGSSUExWzrHFaDA	1	1	1	LRM	1244	250
1245	zGYAwuFxzUdThrjORkEwUvrWGZzjVe	1	1	1	LBB	1245	234
1246	nIefcHlYlTXoBkAHYSxLyAIUNuQxBJ	1	1	1	KTCH	1246	255
1247	aacqloJAxdUNbNHcnhrOKpmRQFxFDb	1	1	1	KTCH	1247	254
1248	BSKeHOwKyGHbCyYzjGElYweMsVCHUi	1	1	1	LRM	1248	241
1249	yiCLoIxlZGVWdZQvgELEbGuMOQpWlm	1	1	1	LBB	1249	237
1250	riGGVpqbiTGwvIEoLrAZHArKotUUSb	1	1	1	KTCH	1250	218
1251	MWPuftBZjFUvKRAESDdwoaneFIJAYG	1	1	1	KTCH	1251	227
1252	QGuYuIXlRpsQszeVfKIrnNpgEIAJjB	1	1	1	BDR	1252	257
1253	IvDtmeoLBLTTYzGQUpUJaeZOHPYCmq	1	1	1	LRM	1253	257
1254	nmYCCsECeiwpUUjMMEWWJMnKtTtRYA	1	1	1	KTCH	1254	227
1255	YdJFtBTIVPlGlJDFFgPFPOYqcTfZDn	1	1	1	LBB	1255	219
1256	nBaVSkXVqaxJyHnYMbArOOEzheySPu	1	1	1	BDR	1256	233
1257	InSkltbYPsxEkiwBrlhVoWWJFkvVxg	1	1	1	KTCH	1257	235
1258	nadbiHmTLmVcQDTznNIyIlIPCxxNAs	1	1	1	LRM	1258	258
1259	ARKMVIEQIcXdIwUXYRCAXdRzfRXFQW	1	1	1	LRM	1259	241
1260	hjGEeiZhshzInZWTynebvOxPecpbAF	1	1	1	BDR	1260	252
1261	rZcGDMlePXSWIzfukLRySuOxtRLNpT	1	1	1	BDR	1261	233
1262	rmReFWUQMcRPxYMCBxgTYrvyIDrdio	1	1	1	LBB	1262	253
1263	YskahDACUTbcrbusixZkhxVjcdVbNy	1	1	1	LBB	1263	223
1264	rovfhDqRAcIYZzJkfiJNjTmBztDJBA	1	1	1	LBB	1264	244
1265	EaySbebdoVmIKWqYscRfHKoBSlUGOU	1	1	1	LRM	1265	260
1266	kOTSYewdwQtKuRrzaywcKcuGGgIRLl	1	1	1	BDR	1266	245
1267	ptEGYuDsXsAeiFdBVKjaijMuyZFIDn	1	1	1	LRM	1267	220
1268	PtzgCQRPQkKguoXRvVNYZbWbWDrZIa	1	1	1	LBB	1268	256
1269	VVffXomNorzALIWoLvvliarONtTcFH	1	1	1	LBB	1269	255
1270	LbSAQxvsUQasbTVdxejVLfyUZIeySm	1	1	1	KTCH	1270	259
1271	vTsudaOUAYUjTrdJmyohUWzXytiOtI	1	1	1	BDR	1271	237
1272	zkJjvWRgJQxjkmTVzDFepXIADQdvWE	1	1	1	LBB	1272	237
1273	kyEbzMBDApQOdeRmBYZsjsFHgFTURE	1	1	1	BDR	1273	222
1274	AprOsBfOSOPKzODkqPtyCutGYCbntn	1	1	1	LBB	1274	243
1275	LSIBoWysVHVgRKkVTfHfzoElZRjpfw	1	1	1	BDR	1275	218
1276	gKyKDKIyGohlIwCRMjDfDpsrhKBAvn	1	1	1	BDR	1276	235
1277	lCcGkfkxBcbWUzWVBYQgFKxlbovExn	1	1	1	LRM	1277	247
1278	QbyuDNNoAfCVaLVXJchReLypyFMpuw	1	1	1	KTCH	1278	234
1279	wlBpNdAKtUFMTfSWvYOdbPkESlkYxI	1	1	1	LBB	1279	211
1280	QsYQkJRlUkZjWyrZtQCwMbzWnRqYIC	1	1	1	LRM	1280	249
1281	uTznkbuFVjzDMQWirszaDMOteCOrLv	1	1	1	LBB	1281	245
1282	ztAUKtioWgFEptjNwHNrCNovlCifbD	1	1	1	LRM	1282	236
1283	PNiNjGgVEeQxqInQVCnWBetxLMuFkD	1	1	1	LBB	1283	258
1284	anMZdOlPKlHYetkjWnFYsMcfZkjrWL	1	1	1	KTCH	1284	215
1285	sNTNixfjLSkjIBZudrEwtdxyYahIkI	1	1	1	LRM	1285	223
1286	YwnSYPAAnfTqfVtTPyqNnlZZgoihTj	1	1	1	BDR	1286	215
1287	frbVMxgKZOBxrJRixmxdNCWlcfSIRB	1	1	1	LBB	1287	224
1288	uHYONINmuOQbVqBmXAGzgxqVBslrKG	1	1	1	BDR	1288	235
1289	bvrGZxWfnzOoJvCuXPmXZVqYMYhbuO	1	1	1	LRM	1289	234
1290	BpFYiCAGIsfZqIglFwwLBfFSqxbnXu	1	1	1	LRM	1290	211
1291	rMQNEsVouePzFrRhHzMWuAyuqQrxlT	1	1	1	BDR	1291	234
1292	jzKzFvOABdAhJtsLpARyWgUaWlNQBp	1	1	1	LBB	1292	235
1293	DopBjNefjpHQlnKGpAAvunXcGvXOlm	1	1	1	LBB	1293	223
1294	ATOuSdTGSdcVxfrlTDrxzRlgTmFOgV	1	1	1	KTCH	1294	230
1295	gGsINQvCwYBdwwsxoeflytyJdKDppS	1	1	1	BDR	1295	215
1296	qTWhnkzZEsQedrJoaAIhVFYFBpbaOa	1	1	1	LRM	1296	215
1297	DQHfOGuJzqrQeBdBXhwwUXJiIsSakP	1	1	1	LRM	1297	214
1298	VYMrpeUnOSIZwwJQaypWxExRzrrODT	1	1	1	LRM	1298	259
1299	zUlHlguPsDMMvPVORwrHPGExUcdAnY	1	1	1	BDR	1299	226
1300	xaYUbGsKHnCzfYFiWsUxtnThiQZgLE	1	1	1	LBB	1300	212
1301	GeuWwJOQsIvxCZtzRlprhbdMdSZdkm	1	1	1	LRM	1301	236
1302	sviunrBExAblDRXmouZqhgcimdkEAp	1	1	1	KTCH	1302	225
1303	aJkfmCchtBzEfRsLEluOgviIajEHkG	1	1	1	BDR	1303	213
1304	zaoKuJEOcgUHbjvqRpwsyciQnfoKgg	1	1	1	LRM	1304	252
1305	nwvoitKygTZnWDlquqCpoRLQJYutjs	1	1	1	KTCH	1305	250
1306	NowBTsFciOBGOABdKYQvzBRZKBlWxT	1	1	1	LBB	1306	241
1307	wQRYLCVYrltJuPvrMhrIxUxxOWEeyo	1	1	1	KTCH	1307	218
1308	WtfPnGzDbtwfIxhLHWYkqvcJSmeSad	1	1	1	LBB	1308	236
1309	lVKRRXkOiIjKwgxxGezkUtZZTysEyO	1	1	1	LBB	1309	243
1310	AnXcvNCmDijysWbbeqWMaxwPNgRGgn	1	1	1	BDR	1310	241
811	pqozmwfshalgIPnLdmCkBsElxknLqR	1	1	1	BDR	811	255
812	FTyNtWRmzAGFqwvEqPzwHIkIwdAmsb	1	1	1	KTCH	812	230
813	ZjbUuBHJPJjvFwBKefmdTAarNxzFre	1	1	1	BDR	813	240
814	QNccqRJCIlrVNcLtLkZJJRWDDGFLKI	1	1	1	LRM	814	254
815	RGvsWPfauuPrTwMDeYMVbbntliGCAb	1	1	1	KTCH	815	247
816	hZpyPyhruMUNQkBmLMcuXKTtLicKCz	1	1	1	BDR	816	233
817	MbelkWWUqmwiNWRyZCbpAIHQyIkxSQ	1	1	1	KTCH	817	254
818	ojxxQFBmZPijuropnooZMEJWuAYMns	1	1	1	KTCH	818	260
819	ljOxCnOAtiiCRHVUbCmjrkluCvzNXq	1	1	1	LRM	819	236
820	MWENgvTBcOVEVptZKQMVmnPCpLuBtp	1	1	1	KTCH	820	213
821	NMjqTYMFliSImIEUNtYdXnnedPkFFs	1	1	1	LRM	821	232
822	xBSRZxbDGnqmxhbsWEIrqWVbmQrLxe	1	1	1	LRM	822	232
823	cndMWyqaJHNorZkISeIhCwSlsjRTbg	1	1	1	BDR	823	211
824	sftGpYCAgOFCJMkYHkelkEerkIcWXQ	1	1	1	LBB	824	230
825	zUjUrMdHlCpIaqsXxusOcCiAYbsIKY	1	1	1	LRM	825	232
826	lEkijhyFDNZbnISkNikfiYUFXfrIaf	1	1	1	LBB	826	225
827	CaEQNiShrgHSkZnADmBKRqsjkrUQVp	1	1	1	KTCH	827	222
828	KJqErlcZcAHrNNRZRzzmhNkKdlzaLB	1	1	1	LRM	828	226
829	lVqkipYacvZLQSSADsIbtumLGzYfkW	1	1	1	BDR	829	254
830	xhSdoSFRNhGfJGIkJfsHkgnkSXdfFC	1	1	1	LRM	830	250
831	UjTbMhkAxlAGuVudnjibRnKILOJYAJ	1	1	1	BDR	831	228
832	mrrmxTqDAiPmqzOcowYJbYftrzjpNP	1	1	1	LBB	832	253
833	UmmPKkwKezTzEfonRignTleJywqeEF	1	1	1	BDR	833	214
834	ADgjWPbxoDXZNThBChDndndcZMLDuF	1	1	1	LBB	834	255
835	XuTgLJwBYjIJPkmRrAMLVAJMGcSDfZ	1	1	1	LRM	835	238
836	cmYLHgapeGzPKiWYOqsvjQVVNjpJxM	1	1	1	LRM	836	222
837	UHHpGuoRJAMyKaJJiRUOyjnmMThLXu	1	1	1	KTCH	837	211
838	QkUztgROOMSnXPKsqYXfzzNNqAkGMH	1	1	1	LRM	838	252
839	orEnKOvzAXsSHVRJCjyCWxymmkYuaw	1	1	1	LBB	839	253
840	BlhOgcPsIQqUNxZnkaPkrpMHhzDLua	1	1	1	LBB	840	225
841	HGzQQNkTmRiWyyNEorqkDrYLdCyXSv	1	1	1	LBB	841	240
842	OdJAOAxINjlQyEEOYKtShziJTUZLgj	1	1	1	LRM	842	229
843	tfcIuQyECMABCcfRLXgGrHDgOpqRLv	1	1	1	LRM	843	226
844	AvIeUDuIaucZaRiTuzcNJdKvypduio	1	1	1	LBB	844	222
845	OQYabzAlYyTbndrYJoWtxqJzFispoC	1	1	1	BDR	845	252
846	tiFafkAeAwaDITmlnTcTSQPqnTvSkg	1	1	1	KTCH	846	258
847	SCEtMmHOQEkCYkKIEYQGjqnxDJGwyX	1	1	1	LBB	847	221
848	uZzPFbqZvAcGyItNyWhbrExeidvjXk	1	1	1	KTCH	848	219
849	bLOOVsXffRuTNxHJfqvPcTPGoUPlgK	1	1	1	LRM	849	247
850	MjbtZfxaMosHRwSYwEEllGfWnyKNGL	1	1	1	LRM	850	256
851	gMJGNGviEXRObDZfBmDyytgcqSwwfE	1	1	1	KTCH	851	227
852	PFoLbJFXMVvPnEAvUzJmnVJpMIcfcs	1	1	1	LBB	852	248
853	zayAXzcUPpnjiolcdguhCgqyIwUjdM	1	1	1	LBB	853	235
854	PIMzCLfnCvdVkyuKGnlBKwhZREwUIM	1	1	1	BDR	854	213
855	pHnpOxpaSLbYOratCJuBLHMeNUUbTB	1	1	1	KTCH	855	249
856	CPgQnSzPMvyVpoZCAQqjyuvNCNcBQV	1	1	1	KTCH	856	228
857	YJuMtCqbYrGxVjBZJlRziTaSajBQSs	1	1	1	KTCH	857	251
858	CBpdHfxhEJWoeLWhLHNtOAlXioeDZl	1	1	1	KTCH	858	225
859	rmWJCwcSWkHVpNGSSAgxuAUvOLRAqC	1	1	1	LRM	859	227
860	NRwqtJPsCJHHpOVVUHiEgGBlNJrrrH	1	1	1	LRM	860	218
861	pKPdIhjQxzBDEjuHQWgOCrfKvNkLQo	1	1	1	LRM	861	238
862	gZWoTcnujYwTmUydjNJonuDHGqcpFj	1	1	1	LBB	862	219
863	hjCNzHpdCMtwPuzeEIZLBFueLYnIld	1	1	1	LBB	863	211
864	SijvCjevCnHGgdhlnVZKxzQPunHXSp	1	1	1	LBB	864	258
865	klmCwLrhTyZXliAqPXofsfvqrjEwYi	1	1	1	LBB	865	249
866	EKKHPzGibfGNnwYoaMgQNTAWnIkkja	1	1	1	BDR	866	246
867	uJSOVvAoIwBveDWmCCIXJTjtHbQkBq	1	1	1	KTCH	867	250
868	qgASUwwESMWqvarxvcKsTYgqOwHZjU	1	1	1	LBB	868	219
869	OwHqjKRNihAIjcHHSnUyGLoqOHRZBx	1	1	1	BDR	869	225
870	mWGZktWYFPJqZWdMyqoXJwrhvAnAkO	1	1	1	LBB	870	233
871	XGxmvLtHpkZwGgqxjLnQQNmgkofrsA	1	1	1	KTCH	871	227
872	wzOYCefurCDBiTOIBiTallmHzoFyoA	1	1	1	LRM	872	232
873	tHbfZICTPUpcbKBiWgEMAHfzbbnQTb	1	1	1	LBB	873	235
874	gJmBhFcHHAynJkSdDNjVdUUFoZLizP	1	1	1	LBB	874	259
875	NVqokcQQzRNkgNhMcLtSdqbacCSCxx	1	1	1	KTCH	875	223
876	jJsTrcOXtTQBEHmzRVFpzKMdFiDpHl	1	1	1	BDR	876	238
877	fCyFuszoulWTeTnMvrbFlVRcPosVOk	1	1	1	BDR	877	234
878	NssDycMSRWofGPOKCLARytXlnlqMIZ	1	1	1	BDR	878	252
879	dYQvXLmlPeUaVrAmpzwuScjKyFouTT	1	1	1	KTCH	879	219
880	lwLHSDhHrRcJiyyIAApdCgiyzgQjnu	1	1	1	KTCH	880	214
881	hcJWEsWCiAJkKPAUwitefjtDNfNkFh	1	1	1	BDR	881	231
882	gudxUqrpRQTQtXJbWQYnzkOVxFNkYv	1	1	1	LBB	882	253
883	SmDvTRIXjzzluaOgHGYZmAHXZUtDGb	1	1	1	BDR	883	259
884	OkTDrSTGEqpmSnlPoNHEteNjteApfK	1	1	1	LRM	884	239
885	SkNAHxcuhsrhnytuaARKrUcbEzvOMP	1	1	1	KTCH	885	228
886	vvACCDzlqqgMvhuLAEZUECiUejgWfv	1	1	1	KTCH	886	225
887	KtjXSllpoXkSTpAqdCqhLriPWmfgxW	1	1	1	LBB	887	223
888	ZGrENIqhEaIiqSxKzXtctsPXggvodu	1	1	1	BDR	888	234
889	dJVCaljXDLgfKKAkVEwIsqxilOzodd	1	1	1	KTCH	889	232
890	plBkGhwtdCVPiwfVPSJOFIaTFDQSUd	1	1	1	BDR	890	246
891	OiIQIexmuhIjWJGxiGgjCYSixchDGa	1	1	1	KTCH	891	236
892	LsLJLNRUQTgFFYUjctQzivorZKhllP	1	1	1	LBB	892	256
893	YhrdaejqmmPxKRAyWRbTfFAMdnZBar	1	1	1	BDR	893	211
894	EtDVhZiCyeaKMhAxNkHltEXqcXSuva	1	1	1	LBB	894	252
895	lKpSuZHJzWigJPnjhgobuYBGFuEJZh	1	1	1	KTCH	895	234
896	heiTTOviezvvjnYjIrWsObgySBhRKN	1	1	1	KTCH	896	239
897	TyviOQYGzSCIYEYdPZdlzjYYDADgQa	1	1	1	KTCH	897	260
898	hpyaUsKAtaRNeZMWjNdMrnmIrxeFEs	1	1	1	LBB	898	259
899	etAtrNSURIvTtNSrgGJkYekAGFreHX	1	1	1	KTCH	899	260
900	dPtddSwrKfuyLHtWgcGvlSCNQwypgz	1	1	1	LRM	900	238
901	EbTtxZfbTJDMLBwlQmdXlhrhUkPGED	1	1	1	LBB	901	211
902	QurcsTiExBQKodCEoGUQPPBxchlrrk	1	1	1	LBB	902	245
903	IoTsREDXUiBzEDqeSFQzemaQDCDBJc	1	1	1	LRM	903	249
904	ZcNdIxzuBxWlBSMtFEtXxwOfiqcpuJ	1	1	1	LBB	904	222
905	mQoKReGTkZqrQAAZmhfuhSlhyIbBoy	1	1	1	KTCH	905	211
906	AYYNHfmyDgsLAophPlPfPurukPFYKf	1	1	1	KTCH	906	235
907	VQRWnkKPOPQOWkUaclgstZfoBuGJzi	1	1	1	LBB	907	250
908	FKiZLnrbCJRjpufVZfraiOjKqdapTH	1	1	1	KTCH	908	256
909	kVESHDfuUgeYrNsrezMRkvJkZGnPDg	1	1	1	KTCH	909	250
910	KxVPgoWyrMHeUDHjNnWRQxfrhKYAew	1	1	1	LBB	910	254
911	AighPhbozpzyVMWEjjYGSPcwsKdfHK	1	1	1	BDR	911	232
912	pNKurArQxTHrLvYjUuaWNaNInuOnjS	1	1	1	KTCH	912	232
913	tXtKgxCUoXjDcSmztBjWTohCMfVRIZ	1	1	1	BDR	913	219
914	vGDegljjNWXLljIsAjAiTUqSNRGTyb	1	1	1	KTCH	914	236
915	hpNrtHPWLQtqJzyLoWIVcVgWWAgNmm	1	1	1	KTCH	915	255
916	NZGghTEdbicflHhimlIWELKucmSdLC	1	1	1	LRM	916	248
917	VNMtxILdgeBxnDTNEeynLgdzzbkcND	1	1	1	KTCH	917	232
918	chqIdZUhCPGBhDRUPbnVMGvJgAYcbE	1	1	1	LRM	918	233
919	bXiwXGeToggAWdMTVIwFDlZWfsAEiF	1	1	1	BDR	919	259
920	bWJSZwNWPgIIwGJfvAqwjwlgzAeqlk	1	1	1	BDR	920	244
921	UADLeTQItFUEKVTEDpPPfbBVYfVMEA	1	1	1	KTCH	921	228
922	yDAEeetuIVnaHkFMeyAzhybeaktSLe	1	1	1	LBB	922	237
923	XiHVbReEkjZPzLlCshabIzQECOghTK	1	1	1	LBB	923	233
924	pilPckzpMAKOqApgQDAUjtCWzrXusi	1	1	1	LRM	924	212
925	DkuTecTUzlbWkOvcQUkZPoFJSVlzgW	1	1	1	LRM	925	243
926	NUpYejXcfVdtFWVSdrmnDVsEKRDHTd	1	1	1	KTCH	926	226
927	pgtKThvJCaQkHwsLKUvxYPwzVlSkJz	1	1	1	LRM	927	229
928	pyawYkzIQESVbKnLBkCgIvQYwNiEoT	1	1	1	KTCH	928	242
929	dhFqjPnVnxyFAJfJkDhFeKYuRnHbBZ	1	1	1	LBB	929	244
930	HXwvQCwXqISJjpGXGXhPJXbfNRoYZM	1	1	1	LRM	930	256
931	fxsWblCqXsOkAMMZsAubQPzLKDUhag	1	1	1	BDR	931	214
932	vkTyuSeFFEzqonInMdEkvoCcTtFSHc	1	1	1	LRM	932	217
933	JwtSdzskYesZlFuFDQmxAIHQPZNTMg	1	1	1	LBB	933	238
934	jSlzrXqJmqIqsoKxaLGjIUaRUENIdt	1	1	1	KTCH	934	211
935	YQWsdSNaHytbUfueRioeTFvozBPEkG	1	1	1	KTCH	935	238
936	CmNQsDvNhtfmFTFYMrpUasJZdhkqhe	1	1	1	BDR	936	256
937	vKXFRjjCacmPrBotPiUgDzJzjcgDQh	1	1	1	LRM	937	228
938	cUIHaUicegGsJdXctNjkuqnosnZIug	1	1	1	KTCH	938	249
939	OuRLvtTcNCgzZpqDjJvaiBCSDJkhcz	1	1	1	KTCH	939	241
940	dLPdaBDZLXIdDhqYJteHLQWheDjljw	1	1	1	BDR	940	226
941	tNlKSXHemwfLFuCeTXsmsjdjlLRnxL	1	1	1	BDR	941	251
942	FMvqgbtvEMAltngfdIXqWeyBOzcrYT	1	1	1	LBB	942	260
943	kWfCAWDzlsaPrPhZDpGPEcOkNANwWP	1	1	1	KTCH	943	221
944	MettHVJNghgaftcLCzVivNFWCVPKOC	1	1	1	LBB	944	215
945	EgrQLEKNAVTBoMxKMhltxojzKBKLhC	1	1	1	BDR	945	228
946	HFoeJPbkyNlxzNhxkRLNfYBSEpEtlh	1	1	1	KTCH	946	215
947	LJnykoufmhqbRMqNDkmIRWxezwIZGQ	1	1	1	LBB	947	226
948	wpFUjKGbBsZzsQpoSUqYRqayQOqlUD	1	1	1	KTCH	948	228
949	LUXrSGOyuQRDOnJUoeqcwmCEMgVTSL	1	1	1	LBB	949	226
950	jxugbiwlixKNODAswOsIBkMqqkvDGT	1	1	1	BDR	950	226
951	JAjcshwLfeKfWfMZUDzhEAMfnUSJko	1	1	1	LRM	951	216
952	IHJaaQdYaqhRZzKmLPWqqUKSVzyKOc	1	1	1	BDR	952	243
953	lvhwYgMGmnJvyEIiIEukBfhpSJsEXN	1	1	1	LBB	953	243
954	HZaHDAEDBWRiCRSUXiXAujcVQwfmQf	1	1	1	BDR	954	211
955	BMnzerzzZiVRtoBkfPhUEcPRFytTYL	1	1	1	BDR	955	242
956	QbiSwEYOQRhCPUcyYeSpmqhPTeDpUc	1	1	1	BDR	956	228
957	ETgiErDtNLrVlsmpryHCEJOonODydx	1	1	1	LBB	957	255
958	klqnUiJxvQYUAMUDcCOZuSgpviEyOP	1	1	1	KTCH	958	220
959	jIwhhxqJGxoYpyXunlrDnsDlSiGeNI	1	1	1	LRM	959	258
960	huxKyuTXbOVfFnXVGZJsfHXhEvsfbe	1	1	1	BDR	960	226
961	EQEOHtwimLRoQkJmFRBaUlCPZAcaQs	1	1	1	LBB	961	232
962	izJWtaVtgpFzyovqJcQilsxcMFNxVo	1	1	1	LBB	962	215
963	IhoiCIcHbHoUZOEJrhZFxfnlnRkKpW	1	1	1	BDR	963	236
964	kfnkTtUZuTBxbXyZydNJJgWptmEUhk	1	1	1	LBB	964	217
965	oEbNPtksBrKXndfZrJeCDgiIcSJZPI	1	1	1	BDR	965	250
966	MpGZvRGaidFUYbBIgrAeYfjXUEDVxg	1	1	1	BDR	966	230
967	bfxsmOgTeTZWbszvNAgDFDkeOaTbbz	1	1	1	BDR	967	234
968	hCRVXjKjDkVBXbNGZNbVGCEHGQSubT	1	1	1	BDR	968	223
969	rErDYdJarQpYdvISSyPQwvXnoOrhZL	1	1	1	BDR	969	220
970	DWduYFceIFBcdYcJyYxVAAlJbeqNKI	1	1	1	KTCH	970	249
971	SuwVHbSawvqFJCZBoGaHFqdmGJqJVX	1	1	1	BDR	971	220
972	koscDCzDQlEXdWaXgEmEhAqCKYzYMO	1	1	1	LRM	972	240
973	ehwyaVtRNahfZVVfUXdjHHfupKcXkc	1	1	1	LRM	973	254
974	UPbjzhHELSwRTiQvhyLInhpwVjsZwP	1	1	1	BDR	974	237
975	wEzwamwZlmbmjyFBwtvLTFgYCdlmXu	1	1	1	KTCH	975	213
976	IKHlIDDGcQOwztjrAmyslYVpffffBK	1	1	1	LBB	976	213
977	oYYGFZvFGCCfbgEXuQNgLCGsNrGAom	1	1	1	LRM	977	227
978	RIGvdGhUwONLiUgmULnHpqGLfeZNen	1	1	1	BDR	978	237
979	XylyRQDTalJIbvGZMboXQxuFFMfnQs	1	1	1	LBB	979	225
980	LkYUilTLAIOMDUDIpDPJniMckdQkKh	1	1	1	LBB	980	220
981	jMrwVsVCmCXZupfNZonVxbXcWlWApC	1	1	1	KTCH	981	214
982	aTtfyTahDRxHLIeaEGgctUJvEechXv	1	1	1	KTCH	982	231
983	OBjhevWNeOlltfFanqbrvUtZrVoCHz	1	1	1	LRM	983	231
984	KFucZYHgmCWwSXoNuNoXwCqoCfgprh	1	1	1	LRM	984	239
985	yvzRYMOVXEvdqPMBQEkffpEFObamyZ	1	1	1	LBB	985	240
986	CmMdaJYNYddPMDyIPefIWxRGupmqqp	1	1	1	KTCH	986	219
987	nRjngMhAwhQljPeofNcKKJcjxGTgrL	1	1	1	LBB	987	256
988	TptBTgxEmKQNEpgbZLUjAFkblCIKJR	1	1	1	LRM	988	241
989	iLaKnMZkboZbpiNieGiKeElKhMQoNQ	1	1	1	BDR	989	239
990	FrhVbEsCEkffDnGkxzQTUnxZbAVXEl	1	1	1	BDR	990	258
991	yCFBbDBdvzeNOgdhwIiGTJgAzenfao	1	1	1	LRM	991	227
992	tdioQKKPTyLGesQrTtAWpARvDwwgOR	1	1	1	LRM	992	237
993	vNJpTVTxFbyhjIbJGgCnhdneWQGlSe	1	1	1	LRM	993	250
994	tLVhBPhajrQKqEGpOcMXtUFIOIkTuO	1	1	1	BDR	994	211
995	VVGLMAxVxjtSSGudzFzijdTXvrURpH	1	1	1	KTCH	995	245
996	PHVukAnLRuaGbQWWmYezWHefJqqFIa	1	1	1	BDR	996	242
997	DJAVKXPvdwdzRaxRDKJRqgHppZnWAX	1	1	1	LRM	997	226
998	zDKJzkyPnnQkxVjoInkCUyhOGaqTpu	1	1	1	LBB	998	239
999	ivqSFDbLPXDskYJAsdAXNMPeRPjziz	1	1	1	BDR	999	255
1000	ZHHDOYWvVlfTzJrXsaButSqFonsCrj	1	1	1	LBB	1000	250
1001	KxPjgytecUiWSygtHKrIGLbaCXueLY	1	1	1	KTCH	1001	211
1002	KHKMCTScIZxpBBBaYdPUVtdleUmXSn	1	1	1	LBB	1002	250
1003	KIPojmXSERLIYCvhVOFUajAyGXusyp	1	1	1	LBB	1003	234
1004	OkspdYBtrfxsGSnVkFwhCAoTwzAOSR	1	1	1	LBB	1004	232
1005	sqjamWHEcmmDJFSIVMsEnoHUuxXqyo	1	1	1	BDR	1005	244
1006	flzffKpYExnNoRmifdlwKLceuDUnRR	1	1	1	LRM	1006	214
1007	JxDaFogIIOAnNMRWxbYYeADYyJJrJb	1	1	1	LBB	1007	258
1008	DHgiPepIvrqUAgsENecDySWQKnnSTN	1	1	1	LBB	1008	217
1009	HsbMRKlOHQRCzeavtxbuMGhbuEUmCw	1	1	1	LRM	1009	233
1010	MrKeDJzBZFFqUDJLpkhZLiXpDGzjTt	1	1	1	LBB	1010	248
1011	QhSQWKYayKbKcUvJLtUjaZlEWHopgZ	1	1	1	BDR	1011	255
1012	NCiIHNBHzyZWetkLmQyqaQrloElghO	1	1	1	KTCH	1012	224
1013	MBKTrsiTUroYYuvCmFEPvOowaWEDdf	1	1	1	KTCH	1013	220
1014	kGHqOHrvWBKnBUTctHBqNbLMedHGsQ	1	1	1	KTCH	1014	226
1015	zhIMlbqReLLTsLbUwgVUVIzMNAUZJJ	1	1	1	BDR	1015	219
1016	ZnncliUWSDnjjmGBNhYvZCtwdoOjcx	1	1	1	LRM	1016	233
1017	QAAuWNTNmyNyICBKWcWQEcXzgkRMwK	1	1	1	LBB	1017	212
1018	TPGhHeHfbSOUIGoRoDQPqSyWmqRZFk	1	1	1	LBB	1018	247
1019	WCEvfPNIwdjwMDywRWwWeYXoGnvbgX	1	1	1	BDR	1019	215
1020	wKFFiNlLyzwimRMfSkUOTdKxTlmLGs	1	1	1	LRM	1020	217
1021	gkYtqKMzdFLtKLNUdWwLFrxxJitGCQ	1	1	1	KTCH	1021	260
1022	ZMVDoizLlSTQSsywRWjeesueqQGLhk	1	1	1	KTCH	1022	248
1023	xrDxpzsOSfqGrHBTqbGENGqHtiafck	1	1	1	KTCH	1023	222
1024	ZKTtshytAucTsKHypkMnMIUooVJnsV	1	1	1	KTCH	1024	251
1025	PWuqmYbFSAUzBTtxkobDHZTdcshjDK	1	1	1	KTCH	1025	216
1026	ABRkfYksjPBBPGpWMKnebFdpJdKjVH	1	1	1	KTCH	1026	247
1027	BgSuWffpJVkAhhAulIlPaTgpPwQnhi	1	1	1	KTCH	1027	212
1028	FtpXNpzPOsaSMEtwXZKQJPlXrzvozf	1	1	1	BDR	1028	252
1029	rtUZYPDCKJWcQZHAJttInQxEaqYEgo	1	1	1	LRM	1029	232
1030	MkMBEZvGgsEkuIzXhCIfUFeKBTuyQY	1	1	1	BDR	1030	254
1031	nDUcgSKJNUmYsGyOIbOnRcGfLbPjFj	1	1	1	KTCH	1031	220
1032	cIupGAQMfZVcfmHUkdaEMlYgJHqaSg	1	1	1	LRM	1032	257
1033	OtLDpDwgPvsQeKdeNxLhjSNVLcmkln	1	1	1	KTCH	1033	236
1034	iOzHZVHgoUuIEQmRecZcZYNItYuBNe	1	1	1	LBB	1034	228
1035	hHEblQUyASKEcnUNiwCmEMYOeBjiQX	1	1	1	KTCH	1035	252
1036	emLKCOIMaXnGdaJFDcuFQKmFZYbsbz	1	1	1	LRM	1036	228
1037	LgYeXahWVgSTXQUxKEKsKcaHOYgLXn	1	1	1	BDR	1037	234
1038	COPZMPZAbcsdwubcLuQIZgwXGYFJqv	1	1	1	KTCH	1038	255
1039	iwELjPQEGrLQdhTzjQXFkfxlAepZMi	1	1	1	LBB	1039	236
1040	iDyGOhheILKiJfvKDmYjpiOGSRhLNI	1	1	1	LBB	1040	213
\.


--
-- TOC entry 3784 (class 0 OID 16734)
-- Dependencies: 251
-- Data for Name: rooms_souvenir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_souvenir (id, name) FROM stdin;
651	mFczkGmsxNucDEIiKNCukovwoJPpVO
652	BgmcmwIzrJDsavAnxlPJJBECAwQeMv
653	RosfrqVWqTStFfKZRDmmXJRvWLwSRu
654	ZioxdvBLwqWXeHnfYtHAQsBMRwruXP
655	MFoFzfRuKGQWSqNCwyqjVmrrbGVdng
656	mUghwnvlSDnjmMqlwKdRjlrnKsvWxU
657	LPDgiODibykAptytWBzoqrAfPGHZnb
658	iNIzMsybEweSjJpuYpQojMSFWLWASt
659	VlODSlyyvQKZUEqYFXUiBZBoFUPtAF
660	ApFkZSAoRAwKWisLjDKvzoMwFkCQrk
661	qVnKathjInLfRGLSfYRizetyMKoRjF
662	MSsBPljTGmDxljSGlalEZmLCExXLHD
663	tVtNTUmtiLCqTShIVQdnvSnSkvqqBM
664	kkKhVbDyGVuxlBqrPEnZtfiAAyHWnU
665	ljRqIuJcjZMjfdBRqZdCtudnVCKSop
666	wGbErhcwOgHLMiqgYurHuBpXKutBtI
667	ZbpvYoOnyVBnTcaqHXHKZHWzUqdJFg
668	ZWhflOFINKcHdCLtzNSoEoStSQKySA
669	sRsiGWbmVSyVGTsblSWOrLUDPVsIwP
670	vRTdPBmjzVgquQmgtWWFotGeBsztHs
671	oqSBvejDscNQsdUfTJTBecUgLYECyg
672	ZgnTzbkaBVysLFnSceGfWdjycJjwjx
673	vnEoVsNVIWdxpGIJmSaYoIjJGwoJaF
674	yMJZeqnTDjrudbqfltIlYWSMXQoaQd
675	oDlAfxPplfvuSolazyQirvvfRfkaDD
676	VYdtZUtfiUbjqBYoEMOkBaBfETUgsK
677	RclnMbnWbogrtjHNOgaCWmLKigjARW
678	OvpuhmpuINczLMUiZLMGyUSHrbhUOz
679	lqfuPXugQrrAvYaTbtmRKiPdIiYztZ
680	jaqZhEamxDuyIGpSjqjTDiDffylUhq
681	JxEcuhOShYZzIKxBGLoGMPqSYUoQph
682	HxoRDhnnCJMQVlejGRmHSLUIHeVfRJ
683	cVNifMMiJFSxwTLvNRhzKLodmfJbmK
684	iBjrhsxrLUtpWJCgvXGjyowIxpKKme
685	PZrpAggaMWcpIXjdTCmbqAUlEgYjLh
686	JQlKtlRwJmdAsVrMYyTmrPNzfDPEjz
687	uJutTcuEkkKdeyidovlLxPISBGFxwm
688	YhumMZobCNueJjOteHGHUlxBaMCTpT
689	nXHeqFTLARXbFAmftzldYzrHyriEhJ
690	HNQNfShtYaLXPfKfHkdMSmqyAoutwY
691	CIyVOzaJMMBTsjtgSRPPlSWxhkjgIV
692	XksjQtnTUUuuSpjsSCegIVWYiITPRS
693	oTuMbCwfAniOLxHQivEChQyrlHlEcI
694	VRBSgzBHSZpHSSNNzFZXqlrNGmZYlP
695	OWrCvIShpGkJTQFmkZFsTqjBapEDzY
696	LJGXMWODyyFiWaXuPeZoiWeZNKRZxo
697	okviEkfmiixuPtKgxVrHzGTtIdqdPu
698	yIqjubxMApqTHiMQTGRjpJhlPXlnOo
699	WZcVHrQKAGjYhMQcTZtYcSvIzezfVf
700	KfEzQrDSpdtdGKEUHzxXvlAADWidbm
701	RIHEpuFeiqXidPqQOQbxYyFexlVzEa
702	cEpZLGucBLihYXJkYAErNLZKoKEyoV
703	yVWNNnSbzQwYaesjTWOlZZahFpuCqb
704	zrFcBQaXQixRzLiSTFYOzlrspdBFoX
705	MICnHfyccdhpkfDdGZrBAdfUGfrHNF
706	bSeejCPxQINqZtIwPTjjgfyVblPZKg
707	ClHrxmQortZLtmlXUHBXyFNLRnQdLt
708	SoOMLWZlvMzUTlBGKFERTmEcevepMb
709	lmgCGwCMusZlbhsUOUNqOplotJLuaU
710	JKUaJwegBvUKQBaeKAlthvDfQBFwjy
711	jpQXrFbHeZEKFNWXKyPCTUNGuzuSIK
712	hVifdjoenzLCaqrxhptXOCgPaNwcqs
713	wgkWBGknUhsgXreQVEpsUYkHwezFfG
714	ZpEfbaqPUIaDSFziYMSWRiuqLlspyR
715	UaGbGOpjIwtnYygFZldzlZWKTXoeCp
716	aQioJCnIyDqDHJWiLxLWLXDPxAKurJ
717	kwuEbiFlgLuWzhpnjoKeZeQEwjnFtK
718	EoUIiFFrmoomghbqpfghRapTcCRPEI
719	bRwoeLqKyhCJwRtQrXeavMTeXxvfDq
720	IOkNIVBJIQunCtdHpuFWbpogotXESm
721	fXTetwucHvpzqJIfspdlgGLFtUQnSK
722	zSzrhmTiemGdbGEyWnBcsUvkDtfpCL
723	uVBFhhzpaAaJBlyVnRbwoqUcQlDwlI
724	iOYtQnhhjxxsddsZngAMnhrqbjRQUU
725	IlrXXHCmrjYUWhDadlTGWsZFTFVILh
726	nrdZVwHIzTvUCtGFcLdszkFhmvHnRo
727	EMmyfDYSqYjFnFMsbJSIwsxtNQaCRz
728	rtaFVqZeevTJOVIIibzRNzZvQEgPWu
729	cfSYaaqMQbRYIrtGOxYnfUjbBTBBrX
730	AQoZphzcnjFvqsneltaUnteqXeIyhQ
731	BxuplfaqPEUABEGaNDncwysWkCfwsT
732	EAiLouFxQVdsEXPQmnBqyZHMnmrsQe
733	zocNemoWlizYbmxDipFzNthIHmbeDS
734	JlztCyqQnjDQCDvuChcEIQUqUoTAzo
735	GHKWpLpiLFNYdcPfGSdapGiknFOUtE
736	nBAfGpAqZgWUnXDRvUvmYlDkypDamu
737	PFzOTepzTqxJAFbcndOaXGfxCjJHFx
738	axPyTTjKLcYEtBRyztylAvdruDynxt
739	PZKuyLGMdpMeqXXOLXsmodwwQBDGMg
740	jiPHZCcnQgTylTVwqAadUqDccHquqe
741	LFGaCPKqPteayTzWIXkIyjKZDcttDC
742	YockElMYBWSKOtAaRZAgBELecTJBgF
743	qlXSwggTIyfijaEfRTNSWdcqEEnXGs
744	lEUpfAXVPNxlsBvLRwHykqqdgVmUkz
745	BPiiNdeaJzZqqjogwUltGENxtopjBo
746	xUPKvFGZfNqnMUABmLgNLHYoSJfQeO
747	mskyCKISTnkMQsmnvWGeTHApSsfiid
748	bykYyQrRhGyLeqqIuKZexbdnCfsWqH
749	MLlJbcArCsYygDcSBcYXZqnFjiNVBY
750	xGUmjwCSIcnDTXKOuoZTtlxTstNDlV
751	vquVCGMRikDGDJObjXYTwwqDOVBLCC
752	NIZusQLrTAGrWTAeQtNpncLfquWBnn
753	kohEkqQyHibiezTLEmrOqXUcbDLwCw
754	rLEJtKMsJBDuQqgiaEOADmqrEQXlbb
755	YznNgYIipnOoiPFnPegdhoavljHZrD
756	AuUmLIMmRbuJaICBAnsmsFfJYMZmHJ
757	gpVsyccmeYjVgoUmDwkILIpoSoGfGc
758	tDXtpXFksebQsZLWDNQMkbLWvJVGSq
759	MyxXXmKSctyAjXdfafvTgaHFDqLCuf
760	DneEcChCIbcinLvFHgcSBqYmRMrXPW
761	AHzcraTdSJUCjZLydJgBNsniXUjZMf
762	SwBwKbmdWMjYhnqtIJwMjGKHdAbOJG
763	hdwZWqpZWKwIANbfNRjjvZjydnbthZ
764	hMbPHLUeBvcGmvmoQGYypSmylGkmpK
765	kprbwwhChvNYEpSehSnUOoFbxTknSi
766	iAZONvetTxxvTwXVujAtoyPsKGnYJv
767	CectmsBnSiEdvXdaBHcsoatTiadxsz
768	ZxPNTSGVvZzAycjPjSFsughDEfnjAq
769	RKTzTgVxaChbkQAzbquyfYuQZhvCsD
770	JReRCZoJqoYXzaSAtTNaLKDHnIKAai
771	RrlvzIRUpSTvkNnFYqYOmlpsiWwRlY
772	gIbhtebneDPqxzdZmXIbNptqsMpcXo
773	HakoEPtLAQMvdVwyJYlOVBMrrSMNmA
774	ZvUhuPEHMRSkjLBaFggIRrxmqfGihJ
775	LUcAWXsdOLIupwwJAEoplLjgGwSVAs
776	WAKCIurYsYGArwkCaSifyyrQrtDvdP
777	DTMEbIkUQjLNehXEOviqOjUjGdQaWk
778	HxHYDRgwjaosSCReHJcmfPzOLJGXpz
779	ntWHtwGFshiBdiRzfMxEwAHWeWWYws
780	mfHfDXbxqwnEtLrwHVfdHULIzDaGOb
781	SwNrTnlpTWRRXSIiYMDzVTYIhUmjCz
782	TjxTvSoEWbTafHKQgWuGJfFSAhZEXQ
783	HlGNhOLGNOUopntkpxvTQsylELzMsV
784	zEApcSJsikmNLMKmZsiAHizXQSRMla
785	RRhKrbcapRoOiivJIkGUWvKSSWjpSC
786	NBhMqCPPBpSSRUNsUJScGSVRQSTPwx
787	mfOkJFeSgGTdpAVQOoHIlTxbOvBoKo
788	ftKoWLoMZRFphIznrAaXnDbiPhhEQE
789	tVtmVMnoSalSmWgsQoHETwNnihlpGd
790	EirsKqeAhoMmRIFHIXPHSXBJVIaVEI
791	LyGLXUNkXFcGwoJGnuFwGccgFdoPoM
792	XDNjLVBIygpofXPZndduhNKlQKladr
793	MMrKfQlWPosLTfQHFTKwcjDYZYcHQc
794	NdQkvTGlSXnKRTTqCKjEbzbZwjywaU
795	dUpdynVWEskoyULLzugNDvvqchCKgY
796	OEfVrwVPhJOZZciIpEpxUGWiYEAjZQ
797	ejlvoUYHiXRlojWDGxGEYeodEvYuzg
798	LafORvOgIQYoszqBjlsHjOACFFKWKc
799	aLFMJSUSygsBuihpToZMSEupcmnSSB
800	XsAGkChRyrlVjLsHHrSugUdVRVUCmp
\.


--
-- TOC entry 3792 (class 0 OID 16768)
-- Dependencies: 259
-- Data for Name: rooms_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_table (id, name, width, length, height, type) FROM stdin;
811	cJSVPPjRhToqgWxtbVvrhNaCegXfPV	1	1	1	TBLT3
812	cjZLmpbKwfuEFkFJJWosURiefWQYTX	1	1	1	TBLT3
813	gVeIawhvJXJfSewJsmxmlojXIxXDdO	1	1	1	TBLT3
814	yCnLGdKObkjjSZUqcTmYKYnQxsrWtY	1	1	1	TBLT1
815	GEcCVEUtMgQdturxbeUHYHIioyCaSV	1	1	1	TBLT2
816	hogNEzyWidQZWdNOiniRsLjvksMPMC	1	1	1	TBLT2
817	bMRhGrdwAwNOKAFbtsgpLeNmSweYoF	1	1	1	TBLT2
818	gKFNpjWFYDdfCnacfTjtDxhZQMNsUd	1	1	1	TBLT3
819	uytWkBvPNPtkdaHNOshBAjbrTXkkkQ	1	1	1	TBLT3
820	AwJlnaElTdMZxOOJkcELjGCfFHZYKG	1	1	1	TBLT3
821	xJVqCmWhXPYYOxTOGdgjrRlExZYhML	1	1	1	TBLT3
822	HHaQDpJYPACycGmcHhKzXqaNVwOCSk	1	1	1	TBLT1
823	OZhMURZUunjMWvGxbboMSMtZexjxJu	1	1	1	TBLT2
824	RzXWjAPimpLVwjLfHREaDYExjCPbaB	1	1	1	TBLT3
825	SiyaGekbaUjyQilXfYGTJEDoyzhjXB	1	1	1	TBLT1
826	MTWEdNsydbxXVwWKIaOQUDBvLYJoVx	1	1	1	TBLT1
827	dWPIGCLwteBYhWxWMaJZPBajroacEf	1	1	1	TBLT3
828	nmRfRSLfBAnJUlaKFCSmqtLVjKByUZ	1	1	1	TBLT3
829	PVFMRvOaYmxEjJVjdZmwlxqtDPMdEe	1	1	1	TBLT2
830	nlKcELNfJrGRzaEFLYwnIVaFkdxcqi	1	1	1	TBLT2
831	cVmDFGkdJsoyFdmoaTjErgsAFhOxxJ	1	1	1	TBLT2
832	ABHfLCHjFYZEUPyHnZkSxdiyMzHHfv	1	1	1	TBLT1
833	UWcYWIMNvaWMLbbDPWxFZfISSVEffx	1	1	1	TBLT1
834	iULOuHdGueJTVpikEQQqIISfVehXiI	1	1	1	TBLT3
835	lXWYETMltzMrvlBWLLRudAcHngTypQ	1	1	1	TBLT2
836	QsdMcCkpyHmmkxfyOdtSEDkQDmAkVL	1	1	1	TBLT2
837	RmLGBVaLHzXDRDncmsudShBKLRlOOc	1	1	1	TBLT3
838	NReGMKfCfzMkfIBBAKnhKEsXoESXnJ	1	1	1	TBLT3
839	XsHwnOaBtFOTQZnNNKoqFcjgYqckYM	1	1	1	TBLT3
840	WeYECFXRsCwMvRWknVGsnultvTiVnR	1	1	1	TBLT1
841	ittNhPBAHVScOpOqfJRUYYahWfTUrz	1	1	1	TBLT1
842	csCtLyRFeDOzBvUgvANzkAsNZFHEBT	1	1	1	TBLT1
843	pQBPgOlqfrqtVLwqepXaHQDwRDQlMd	1	1	1	TBLT1
844	zxwKPSiWmgTVkrtpvmzXbZuHxCuERb	1	1	1	TBLT1
845	LtTQEOAvYvIosyWnOcxPHtlYBtpezP	1	1	1	TBLT1
846	UisUvXPIdPHQnCIDqMgbjePLrJBAnb	1	1	1	TBLT2
847	ZssxSgwwCIYpSnHbXdqXOVCWnbsSwC	1	1	1	TBLT2
848	TXBhsKzrJcuLaHlXIbEpyvTMkFnFDV	1	1	1	TBLT3
849	xjGOGszMYvdpFagEyqlDZCOHgzwSpa	1	1	1	TBLT3
850	lzazVcEkVkgVabZcJXNDuVzwwQdqDI	1	1	1	TBLT2
851	NRZgomwaktlBAZQSdKzspThrYHQhjO	1	1	1	TBLT3
852	youuvSLLUYumzvhQvdLcrzOpholKvi	1	1	1	TBLT1
853	GWpJrDdKdDgajEuSSQunvSfhJPhwEF	1	1	1	TBLT2
854	yqbqynTwPHWTkNMVzSotMWPBpmiEpH	1	1	1	TBLT1
855	mFXLsJuuFjFzTgQygEzkTtalyTKnyg	1	1	1	TBLT2
856	ZvpZpNOtVVsxcYadkvownRLTPRCXsm	1	1	1	TBLT2
857	JKwFzEILZGLMDxEjdFTAYWelyYnVBK	1	1	1	TBLT3
858	rAmRjMSNeCPHfzIhUSnbALgovwCyxf	1	1	1	TBLT2
859	QkpArvlkntisNBZpJpFVFMWpKIROWp	1	1	1	TBLT1
860	zCDFTsVUxflqCTFEiTRCdHQIJdrQlr	1	1	1	TBLT3
861	SPErULvmpZiXgnkOhjVowrnoKZSUHp	1	1	1	TBLT2
862	EQYmHDAKfOsZhiJjOTwHDRBqTaQTKV	1	1	1	TBLT3
863	qDymKSliBAlWcJyNxoCXnZsuYJePmV	1	1	1	TBLT3
864	mMcgkiaqJQGmsPbgNUvKsqcxHjwOPN	1	1	1	TBLT2
865	THHrTCWROgiBXUfMXTKwfYAJNwoyWF	1	1	1	TBLT1
866	VMXOUSRGCZooSKexnfQPGqEDaxmBlt	1	1	1	TBLT3
867	tHxwsNZCqKtymJyLgRmScuEjLAdckc	1	1	1	TBLT1
868	nLvsSkNUQPCMRlZtgDArzWBUbvcMRc	1	1	1	TBLT3
869	PLIglqrldsUlKrvCAtEGgBAosmjtQg	1	1	1	TBLT2
870	iPyDBXAQizBXoxEHXMQzawZEoIUyyQ	1	1	1	TBLT3
871	IXPGekXFTYSFdewJhnjHaIbNhqlYWX	1	1	1	TBLT1
872	ToUqWlnzvhZXswzzIzIFGgdgeBaThp	1	1	1	TBLT3
873	CBQNOCOfEJTngcPvJyHnjNIBAgIQGP	1	1	1	TBLT1
874	AGdFyvNriRZVEfsYKbqSHJWCZaQrKL	1	1	1	TBLT2
875	uDaLRIKMxYkTzYcyQMxhVYxzPiMdav	1	1	1	TBLT2
876	GBdJuQERAOsDnIrUQuKxroojwVShKo	1	1	1	TBLT3
877	oWhLUoJweWBciPIeJlZHHgpyZeuKii	1	1	1	TBLT2
878	ziVPYpadYgNLmNPaaRBNfEidUAvmhT	1	1	1	TBLT2
879	ATpYpNanWYJvKVEHfvYpOUdOUIOWLe	1	1	1	TBLT3
880	RfbFAfGvmvCvykEOMElsUCmqImlbKR	1	1	1	TBLT3
881	qeAsmVgoJuPomxZLIdznRJKaGigTiQ	1	1	1	TBLT1
882	ZblUEmWtouNJGWMEApUQOcnSXRSINn	1	1	1	TBLT1
883	XaIaGBMYCUmxIppfmjrmDVZPzKeeoe	1	1	1	TBLT2
884	pawyOzJophUeSerEfjAJRTwMBavFbs	1	1	1	TBLT3
885	ykuoFymVHlrAyQoWaZIJmGHvybILlW	1	1	1	TBLT1
886	GJaxravfZsaeJBJFaxlMxTRjPEJVNp	1	1	1	TBLT1
887	sqcpTjiNETuwxlUckIrBUzmmQQLHZK	1	1	1	TBLT1
888	xnGjWBvyDqpGtCuwAQyoRnMZMqupwk	1	1	1	TBLT3
889	zkJNeUiITyXaYLFSXgpAdvfovGitvn	1	1	1	TBLT1
890	BLESHasOaMGPGrFylKAalHZNGsRShS	1	1	1	TBLT2
891	FkkFNIBztxwxdfPEctKYJpZNpIdHal	1	1	1	TBLT3
892	CbgDBZKNoYJpPevJUzMAAdapEtfbic	1	1	1	TBLT2
893	tTlcqdVGPiljkzkIoIvvvoxCxTIuCB	1	1	1	TBLT3
894	EZHdncjFkBPNHCkNGvjpAARGtlpxxb	1	1	1	TBLT1
895	rgoFaPxnLmyrPqRmpMGXcTPEkMvUYq	1	1	1	TBLT2
896	RLLuPJgJRYjqlnHcuiZceAwXolPinS	1	1	1	TBLT3
897	hxSZJLQycrIsVeWqBrQkuqGzkVGskj	1	1	1	TBLT2
898	NfVXrVtePJIKxJofVWVhDjSsVnXrcR	1	1	1	TBLT1
899	OliTEfKxfxntQpENsvLTQcTUsLwTQj	1	1	1	TBLT3
900	dmCRVuTPPySbLURSpaWjIuefiicfhS	1	1	1	TBLT1
901	mOCBHPiLlBFehWHxbUfxGVWOqxoFga	1	1	1	TBLT1
902	eOPugDOxttvsGONZmnLHrbVZxxrIdh	1	1	1	TBLT3
903	DnDHjXYyeCbbHIzpaeKhpOSpwjoyYv	1	1	1	TBLT2
904	NVhMYdKeZBiMJEHqygDeirmmttqKah	1	1	1	TBLT1
905	JAgBBCfFeNYASUbaoesOClxDseLgeD	1	1	1	TBLT2
906	iyONQBvlGvVoMnPAkIRdsqmNeHZwEM	1	1	1	TBLT3
907	UCoSOujbpFYmvjGnPhWrBxAPpNwggH	1	1	1	TBLT3
908	IPXpgynuLEqdPtmrwUZfmdjfdfKPjQ	1	1	1	TBLT3
909	BNHhzDoehaAruIsKsjFXXWBjjhbazi	1	1	1	TBLT3
910	plnGikRgraiJqygYIxIpskHuTEFGdf	1	1	1	TBLT2
911	fnlRTrlbBDZwyeJwudqGmkxiUqRiNS	1	1	1	TBLT3
912	JaGlZgqBxNLbiBXMvKVrzMPUKJOorV	1	1	1	TBLT2
913	rUsqdUSJPJcjXkbYuwuOMIaIyeHoNC	1	1	1	TBLT2
914	ugGOnRexBqNylsmeALNyyuXlssTQBl	1	1	1	TBLT2
915	eunPWQaRCQmWpKQeqQJbqOnUrSwrvh	1	1	1	TBLT3
916	RqzjdWTfrpDDWbWmwxVrLBZcCwpTSY	1	1	1	TBLT2
917	LnbPzaMseYRAWLsOlOaiiAUfmRQeGM	1	1	1	TBLT3
918	oRxOWZINrxJyaQKCqAxqTULrxCBASQ	1	1	1	TBLT2
919	MhoYoazqfCSjMfXbsneEoMXzIdDTaQ	1	1	1	TBLT3
920	vufCyVMDVwKdAOQqJCxWgNghuspiiG	1	1	1	TBLT3
921	HSNJAwGaiXeTdAIusazKZRxMpZiWhM	1	1	1	TBLT2
922	AZAlHzJmdVwQhTCXTXuRJiHNbxZiBx	1	1	1	TBLT1
923	wPYPVZLUYRddEmonIZdXiuBWxpqHXz	1	1	1	TBLT1
924	PfaJBimSbCnuBKUgLCZornIpoedPAX	1	1	1	TBLT3
925	utpSOaYnDgiHvtcMSLFheOIireDLiZ	1	1	1	TBLT1
926	sYITyeJxTQNbXmtRsOKfrgXiYwGbaO	1	1	1	TBLT3
927	QBDywyeODzKtTQWtXOkXWYtUDvxjBQ	1	1	1	TBLT1
928	ZSEwuqPnzJeEvPGKJdfuTCHkDADUjf	1	1	1	TBLT1
929	aPeBYzMNhMmIxDAbJOKGtLlDMgPGbd	1	1	1	TBLT2
930	aXoWRlNuiEMfmJYOJOxDHCijwiGlAh	1	1	1	TBLT2
931	vyuEIUBEdohDugbUfrFNIiCEKRFvPk	1	1	1	TBLT1
932	krIshpjZYLDCGYjsapBNZykymQRnsi	1	1	1	TBLT2
933	HVGZwzFdKCgAdEfyPrhYknpFFStAuw	1	1	1	TBLT1
934	jeKQYoMiXIEFWtdmCZLxqNgaIXiVEc	1	1	1	TBLT3
935	ulwxOmzptkPxLJKRbOcsnTRVMgzTRp	1	1	1	TBLT3
936	SKGhwSurGaUEpbylZicmojQpHGOeud	1	1	1	TBLT2
937	IeRUvtetYPznQfVjQTockPLONobgKW	1	1	1	TBLT2
938	mDmUMpCvsytIsRwMWdFniUjVFPogRJ	1	1	1	TBLT3
939	vHdjucRUYTULTjXjALxzUkwfosreGr	1	1	1	TBLT2
940	IoGurKgZgezNHxLLByeaSKxkCMEkwW	1	1	1	TBLT2
941	RYXeDWoLBreupvdbBhTXyfKfDzMHTo	1	1	1	TBLT1
942	jukZUEJPcCbANUkGRlnerCmgmtOsCL	1	1	1	TBLT2
943	OBjCgobpIoLoQwRagItUwYlocgxBQL	1	1	1	TBLT3
944	zgoExIyexgxmSNCJXMlWjHJpOlzNvG	1	1	1	TBLT2
945	EaWVLHYKaQVWMIlZoTiWmUrUJSJVLc	1	1	1	TBLT1
946	VqaMqKVYkzsDRxWfrMmnzoezYWTLis	1	1	1	TBLT1
947	tpGKAPimvrnnwsQVTMmPOpHurKERAX	1	1	1	TBLT2
948	uEgGdiaFBzPljisvidemtmwPwfgqVT	1	1	1	TBLT2
949	xrLQpZHjFppvunBXhFAdJfNTtXhpbF	1	1	1	TBLT1
950	FoXSUzQJvEzuVkMSyMsokIHgdWoObJ	1	1	1	TBLT3
951	zQvqyVbdXvXByehyDkiNFftGZBFDSp	1	1	1	TBLT3
952	wKxQIyaWGoJrSsvcLQhkzalqbqHOQA	1	1	1	TBLT2
953	lWEWjhHzNKDEcpfrvtMhSDkWbTzMcV	1	1	1	TBLT3
954	JJjiWPqCoxatjInRKJpWRugsiEjZtD	1	1	1	TBLT3
955	mLmmiSDuwRbhHiKpvClTxgkZCVEWYz	1	1	1	TBLT2
956	gzQelzARmVWgNsJDnWneSFPnobPGif	1	1	1	TBLT1
957	VHcTmNipYXoQzhfcUysDrqVkZwGPQi	1	1	1	TBLT3
958	tRFevsjqiArdGOsEjQPTdkmtvDKGKp	1	1	1	TBLT1
959	AEDuPTOdbSwXNLmKaNXjOwzwaheCZu	1	1	1	TBLT1
960	HRRQFiPfaYImAcWAHrArAheoSuyeDT	1	1	1	TBLT1
961	HFUaaPBIauomPTQRnQsBRHSBzdjTTh	1	1	1	TBLT2
962	svWptJMuyUxMlXJhHZjvPvvowVKkxx	1	1	1	TBLT1
963	XPOceuuGJUgxYYPlGbvgDsaGuyZbQi	1	1	1	TBLT2
964	eIhdWGIeDxaweVyWEigTmYYQgjuvSy	1	1	1	TBLT2
965	LlQWeBJaMsZDsmcPWhhvaGmYRwSsWB	1	1	1	TBLT2
966	ixdjXYaMzjGWpWZFXmtintRELJPmdp	1	1	1	TBLT3
967	hFLWaTYtHQoNxKGyewqQKeHvYyCHNL	1	1	1	TBLT1
968	tzQOokzZYoSOTWxqoVXFVdfkisLOeY	1	1	1	TBLT1
969	RorkoEBGWemUOxZMkTAoHWGyyfgoWF	1	1	1	TBLT1
970	hhSarxpUGHTDCAlMvLMrQgfjNdjGnu	1	1	1	TBLT2
971	jZQhbTOyDaVhQHdnDKTMnDtUUtgsYM	1	1	1	TBLT3
972	qeqkgViwPoFuhGIvBFIWejhyNrDhrD	1	1	1	TBLT1
973	XdgvYsUMZWEKjixUnGQpaGbPpzBTVu	1	1	1	TBLT1
974	pyAltTKfLfkbCOLNZUOldIXCYxrqRb	1	1	1	TBLT1
975	dvaeJUPQBCsYLlteveiePqYcGdCcrp	1	1	1	TBLT1
976	rKRLYnCVphlCeZyAqcjppHiQXzVbVh	1	1	1	TBLT1
977	jlpThePSYWLsKwzzJupNnciVQEwKli	1	1	1	TBLT2
978	ZCBFHpNeRSHkhTkqCVVXlrByDqGxmt	1	1	1	TBLT1
979	ZyMQBmocMRijmtuHBmcASScFZAKKFf	1	1	1	TBLT2
980	EFqklhamYrARIWtXLwQIvBBPxgYKFG	1	1	1	TBLT3
981	wTSWyaAgUbxjnXnGxlhAFZCZncXkLB	1	1	1	TBLT3
982	UbkWCVTtqfGeQVSEwipQmmWKxsniLv	1	1	1	TBLT2
983	mlaGODyWXlqqKdoOKoxbGuohTADxWw	1	1	1	TBLT2
984	abfQoLBRKfGLOTpbdeoQnMwvWIkyiv	1	1	1	TBLT3
985	yfoniKYkdhBktUjDFxACzTUszVHKmk	1	1	1	TBLT1
986	jGiziHvVcNNuFUbWZLLYeZKoIJGDfE	1	1	1	TBLT2
987	ODxZKMZqRqyVcxtDWuCxqyhYBgzlOh	1	1	1	TBLT1
988	YwgoEyIHibcqldMWhNronKHxSsUkbR	1	1	1	TBLT3
989	GSDjopwLHVzcYSiOGobtRpsZnqFTVA	1	1	1	TBLT3
990	EeZAAiaKEkvkEOycUKqXoHYJFUJrQi	1	1	1	TBLT1
991	tkBnuruokYroGkVptYUzErkNfyuJvh	1	1	1	TBLT1
992	tuhbAvTZHeFpawmVaxZxDgTiJOvOgl	1	1	1	TBLT2
993	XdBKJRUXTHyOAUYsBEcgabCAiPqRhi	1	1	1	TBLT1
994	yahscQtvbQHkitryZQTuPwwxwbVMCj	1	1	1	TBLT2
995	BvdpgoxJEWSDZuKhbPsOhrXVrHRcKc	1	1	1	TBLT1
996	LvQcAeRApFoDjNPqvFwlOCQqwPDgiy	1	1	1	TBLT1
997	KcYmbnMcIgvNlNMufimAaWQZteuPbI	1	1	1	TBLT3
998	veaZJiDUeaeGrtYBySABEWOwwaCgtI	1	1	1	TBLT2
999	loJmihEKtaTuDXCbGUYePtPBTDamjn	1	1	1	TBLT2
1000	ejSDhosKvOZGtpHaMHRlEDWsBWltFw	1	1	1	TBLT3
1001	qLNMAEjxsybcEicxbrqvHkdgUoeJFV	1	1	1	TBLT2
1002	wQgMaCDsUKQPpBhPRyvvwZMFXRzDmx	1	1	1	TBLT1
1003	AJTkQzexcbPpkGBegfxEknilGnqUVJ	1	1	1	TBLT3
1004	DGalJPzcNnEdMgKiOGbwSHotkXFNEE	1	1	1	TBLT2
1005	ievuEEAGRTlLqPhPUgbsfRlfeNmFBW	1	1	1	TBLT2
1006	YtYDopLhNeRiHuDXNtHfxLfTeZfRgJ	1	1	1	TBLT1
1007	dzbuETRqmnUiWBTXCpKSNmaVjWpxFB	1	1	1	TBLT1
1008	dNvUYbzpFWcaYIamARWrGlVlFwdjAT	1	1	1	TBLT2
1009	gFYYKaZiPLJmLpqclSxNxYmwskrOFy	1	1	1	TBLT3
1010	sUtnFDWPRdgZxiRTSszMlqNJoQCECa	1	1	1	TBLT3
1011	IbLQLPvCkEaboAjSwpUGrKLKUpSDhg	1	1	1	TBLT3
1012	gYSBAxNGEmLPWPFKLdKsyrraQTfqxa	1	1	1	TBLT2
1013	cVTqsslGlvIvOzFjvXNNAKUSDfXtvt	1	1	1	TBLT2
1014	VBJszrIAnkwUswASdCvbBkyAlFQEFk	1	1	1	TBLT2
1015	yEiKNmpZfbRqTRjpNkwamRiJAsiKvd	1	1	1	TBLT1
1016	GfQcpKxZgVDfXawqfdggswnfPysmUZ	1	1	1	TBLT1
1017	OMTiaCdHMiqBRdFmjhQYbsAINffqnF	1	1	1	TBLT1
1018	uWYzrCgCpimpJPhTGNEzKPZhARJBpf	1	1	1	TBLT3
1019	rMOgFLvTqLuzpqsTEOsuEBxJXIgloi	1	1	1	TBLT3
1020	orVobCNwBiQeZcRsxRDyAHoIOBwXcO	1	1	1	TBLT2
1021	PhybHVFoEEoREfyYnfiBjDZaySESYy	1	1	1	TBLT1
1022	XFzYuzeSAlBihzZUcAsKXaVtAZzcxj	1	1	1	TBLT3
1023	HmiFYyaSSARYjYNPTscErIuMcSICef	1	1	1	TBLT3
1024	ktMKnnpmasqRsYPEfZXIvHPtnxATjt	1	1	1	TBLT1
1025	cRdubanaOUAARqLWrSPngLlaajsfna	1	1	1	TBLT1
1026	pdquHJDMtJrfqugTeGXkBSoyuWUOXu	1	1	1	TBLT1
1027	JsSzCKPDxBwhmdFEkRalpvcXnGxXKi	1	1	1	TBLT2
1028	AnrzGnIZQBxZIgeiQUpGkJuyzvhARG	1	1	1	TBLT3
1029	MtnBedvmxWNsVRUHlZdQVDiTvYnVSa	1	1	1	TBLT1
1030	hPBHOyHhirAcoNiymGbPlaVpgCwDnc	1	1	1	TBLT3
1031	pOhIdhPKTTRFHFiNwDVeDdSDlZuYZx	1	1	1	TBLT2
1032	FhTZHPdreVFtEbRWvwKmzCBsxwBlvX	1	1	1	TBLT3
1033	QOhqenbmigxCxjpeOYRumMZjFeeima	1	1	1	TBLT3
1034	aEJHfeFzruwjnbmCGWbLYKKqOHjqUr	1	1	1	TBLT2
1035	LXUynGvZtaXoABzRJWpspaURqRFSUc	1	1	1	TBLT1
1036	RWmIosEkJNArWsawthPRvHpdrcJEAe	1	1	1	TBLT3
1037	vtTEuSGNNIQhfQcFajpuhWHhnCBZgd	1	1	1	TBLT2
1038	jcdxxfxNhEBRXDgiIvudVYyAGpIhSN	1	1	1	TBLT3
1039	IqOoFfbmRHSYTDeOaDkUbpUxGwHqJi	1	1	1	TBLT1
1040	HFsAmdrgFAkPxvfMLpPZAAiCAmHLgX	1	1	1	TBLT2
1041	GTjcmfyUZHiXyjUveiHaGSjzfjzPqO	1	1	1	TBLT2
1042	fUcptuqaajsmVRMVNkxSNxiUcpgIuV	1	1	1	TBLT2
1043	CNqmNKnsQWixDjxzZmfqPqGDishuGz	1	1	1	TBLT1
1044	YYOjGIcxGBrEnNRkeMlttkEqZISYej	1	1	1	TBLT2
1045	uvVADQJsYjPyADrAvLanDFIGTGBmfB	1	1	1	TBLT2
1046	RFQjiARDSHbBOaKrFuKVoqaZdEdUWe	1	1	1	TBLT2
1047	irUuTmHMogzMOKIghIBcnUfeLzClol	1	1	1	TBLT3
1048	XIcKBRwpxjDmQBQUHCUzNDbvVnQSFM	1	1	1	TBLT2
1049	NChPXAZGxiHkvfTrPrJPxTrLMzgmnF	1	1	1	TBLT1
1050	pJFIdfNExtmiUHrnfEVjhMeeauTLDf	1	1	1	TBLT1
1051	ZctTtxEgmtvyVMolqycQvPNzGBNSod	1	1	1	TBLT3
1052	PuFwFspQhXKfgkehYmDQvojcbVcwBY	1	1	1	TBLT3
1053	MczdutvOcehcArkRPPveiRwSEFspZx	1	1	1	TBLT1
1054	ZldGpkodmpilPxxwJjZRHHcBFiqlHO	1	1	1	TBLT2
1055	HEuszQoPOhHVKohZzLGzXXTmVKftLC	1	1	1	TBLT2
1056	EVkOgGZdbFMlqzRYSFrlosmlFyCKXm	1	1	1	TBLT1
1057	gklDALMuSeTsdaasulMxTWNZqVCUbw	1	1	1	TBLT1
1058	FCAVgtPddQfLyWNkNijVQZioXtxtdF	1	1	1	TBLT1
1059	OiPWfKasbehvkDFDZfxrEnILqFeqhi	1	1	1	TBLT2
1060	ANEuTykwkhPvPAWTNFDRqNlJNFXBJv	1	1	1	TBLT3
1061	OlbMbDjggWUPxzgApxFfPdvJKtFPrJ	1	1	1	TBLT2
1062	KUdtCCkHINKRTuGpCXlCZsAGzzuLXX	1	1	1	TBLT1
1063	qTSOSnWairEXZQoZxmmcVhgaQEvoWf	1	1	1	TBLT1
1064	BgGxcEtZFbdmYGYAbgqMPUgpSrVmqV	1	1	1	TBLT2
1065	BdQuObdcfXFHEqmmgIyxDVZJWKsLAz	1	1	1	TBLT2
1066	QMAjqkZNoeVJtjrOPedCDnLvWHqhxj	1	1	1	TBLT2
1067	QOfgKHpuOfYoNvkIJZKIXdqHdBlRtO	1	1	1	TBLT1
1068	bGzRfzzPDWYlsFxFcapLBOUpNPfmjF	1	1	1	TBLT3
1069	smsAvhFRilyyQmOFbCxkIXAHizgqHs	1	1	1	TBLT3
1070	ldSJEumhGmcgaDqNDSmlsZtqmUNVTq	1	1	1	TBLT2
1071	qphEHkDnrtFhhtuIfoFpxQMhvYgVNv	1	1	1	TBLT1
1072	gNvhEyoaSIYpgftvAZArdePlewuqHq	1	1	1	TBLT2
1073	YEUmQomcaIPZUtuZWELggRLKaEcDPz	1	1	1	TBLT3
1074	GSugwJAHcYUbmLuAKmLtiumnLWJkgW	1	1	1	TBLT2
1075	FFJtGeDnPPAJgdryzqwhShYiTnIIma	1	1	1	TBLT1
1076	FNBXhGmYDsvEdxvOhmlmMuEpmXXwCs	1	1	1	TBLT3
1077	ANQoKHAEukpUCVtudpPhwXfWpDksqg	1	1	1	TBLT1
1078	sUGlWAWYWqmnTPpcmRrpwUhyRjITKa	1	1	1	TBLT1
1079	WnUOSRvwFlvhFbSPbDPnAbBCICDdGT	1	1	1	TBLT3
1080	qZUVIuVvZkzDEZobCtMsuONjNlNGOg	1	1	1	TBLT3
1081	dXbPkOCcAyyTeipjsYtbffkeaaLWgt	1	1	1	TBLT1
1082	eZiByaQGmRTvlzpmGqKcKuWUTnRZPr	1	1	1	TBLT2
1083	liyAqLLzrcwEBMVQiidWylqtdbLgHx	1	1	1	TBLT3
1084	HHwaNYQUHusuecrchKALOmdXdZZUkP	1	1	1	TBLT2
1085	KDPcjoKJCzjvcEkgPhqgrZTiIHlzim	1	1	1	TBLT1
1086	hqfUsdAkqUnYOOrmTPbEpdLhWJIZYT	1	1	1	TBLT1
1087	YOmlLGwSdDekvqGSebSuvgFYzdnTic	1	1	1	TBLT3
1088	SvylMYCfpPqntdeUeNVrulumLJhHAh	1	1	1	TBLT1
1089	bUDcDjYhlIrkWxiSswMzQRHCbvXZvM	1	1	1	TBLT1
1090	eenMdJcOXilCjYaZkWCLIEcpQHPFVH	1	1	1	TBLT3
1091	bOPALOWxZlPjKKJoeRQvxtIyBOcvLl	1	1	1	TBLT2
1092	LbzirvuLVyYMsFBvlwWjVMoEHuBgzj	1	1	1	TBLT1
1093	YpzRGnPewfZjMkjasKVyyfYSgJUQVL	1	1	1	TBLT1
1094	MCgPdQAyXbZKqktsHfPCAyPdPCLXsA	1	1	1	TBLT3
1095	lVdbKoBJFHAQlHWeBPkRQlxcwaZXmH	1	1	1	TBLT3
1096	kFZUHTBJxTMVooYbCUzdSgFWrcALfi	1	1	1	TBLT2
1097	PdQOcfKyBlcyNVEgLdvdhysiyFkClz	1	1	1	TBLT3
1098	jsNfWzLEhjIlntnIttNDZffGtlHPrW	1	1	1	TBLT1
1099	GcNtQQuzUeCkVXYlGclxnICQLnJPfs	1	1	1	TBLT1
1100	hSDyBgAJSVUGsTqNCVpZbJCJiAgdiK	1	1	1	TBLT2
1101	OEJmcElLaIGbfjEVdYcpiiOWquaUqf	1	1	1	TBLT3
1102	VzdyMJoxOhnssIqoWtwFnEHJNMmJWR	1	1	1	TBLT1
1103	gzejChkSauAYurdmeCFqkVMtrKWGMA	1	1	1	TBLT2
1104	LxzBUVgogDSFvGGfejHVvSoPTGagYA	1	1	1	TBLT1
1105	FfxLEsxAbAFSZBLTmWafsRlODTWYtN	1	1	1	TBLT1
1106	ITbjbnlnuUVICFDISwdPipnnKbqaOM	1	1	1	TBLT2
1107	APojWRaDeePmQPnlrYkYpHKpaQhbrp	1	1	1	TBLT1
1108	OCppCIQFlSGRNtyESFmWtQNzcIgLfJ	1	1	1	TBLT2
1109	maCPVMaTPbuydgaxggFLiDuFgzRIKr	1	1	1	TBLT2
1110	nHpHsJZauSVCxTRFYoqHETXCtnSlJO	1	1	1	TBLT3
1111	sSYpZcViCaEPQEuyWLUtVHKtwIxUHT	1	1	1	TBLT3
1112	dZnFxjJXAOVYEuodvkskqleVjmQyqW	1	1	1	TBLT2
1113	iSAmaYgyxjNsbDMVOAVwrzUhAsUpDo	1	1	1	TBLT1
1114	qZHwlouZLSxfMnvFFMFKafuNzuDyZB	1	1	1	TBLT1
1115	ziffUspBcBQSwIzdATROyaRMfSOkfO	1	1	1	TBLT2
1116	bVXaMwUFAkXKrxXKxeOVHbqULLswZv	1	1	1	TBLT2
1117	ayMRInhjcaSdTXKVyrNzXTscnKTsEs	1	1	1	TBLT1
1118	kZrSWMxOniBdXvFvINHsMHuLtzlvWT	1	1	1	TBLT2
1119	TpalQDTiiLoXiZpRFqaqGMsfxZdMau	1	1	1	TBLT2
1120	ivbPVWqiRHTYYYPvSLNKxmVJwNKhGj	1	1	1	TBLT2
1121	OVKOoCDVMXJPGvWLiqoEgckJXeuRyS	1	1	1	TBLT1
1122	CwHFfznXRSxATZRwHtrCOEkSAAwAbL	1	1	1	TBLT2
1123	GPqsNFnHxxtFAERVXAMTeEwkrwMHQe	1	1	1	TBLT3
1124	PCJEICwqETynGbTeeDufKJYFSGsobD	1	1	1	TBLT1
1125	sNOjjEDiMbwUTCYfDFvLerQOxhxNcB	1	1	1	TBLT1
1126	wuwRdoHkMYHkaotQKUErVBXAjkyNhw	1	1	1	TBLT3
1127	jviBbSwmzfZhrtIrghIHvaPlMDtWZY	1	1	1	TBLT2
1128	mOalSBnNZwbLahroCtsmzQenBNxJLS	1	1	1	TBLT2
1129	BmJkLTrUwiAtVtgErrhdZCIosejscT	1	1	1	TBLT3
1130	aAXqBRokxRTCTjielhrXYNFzipljPR	1	1	1	TBLT2
1131	tpKguhAueWLVAEifxSpbnXExehuPzF	1	1	1	TBLT2
1132	KKRHNBmercNmvBWFHVacxzpINcmUOw	1	1	1	TBLT2
1133	NjjeqGhtbAressGQOECCxIeukIcaZa	1	1	1	TBLT2
1134	zzPQwjBOiUHWMJxfgRlPDIRUzIciUt	1	1	1	TBLT3
1135	gBUlUBDyCKjugyCihXNBxsWaqodFBi	1	1	1	TBLT1
1136	lSgFRcGBuWbBmZGxWOFBPGLHBnbufT	1	1	1	TBLT2
1137	jgPGutJynzjWKbKpLXbQxLGVRjbQbE	1	1	1	TBLT1
1138	qUUdQROUZdiZbRfKJoipoikPyMHMjW	1	1	1	TBLT3
1139	CWuvLJXBOFvBXLJugZTntVlYlsxEne	1	1	1	TBLT3
1140	tYrxoIWiKPfcbBkJItUqGHwfIwIYKN	1	1	1	TBLT3
1141	BXAqQibnfxolYPUvrdTMRXkacjCtNO	1	1	1	TBLT3
1142	lGSEuoBRBanFXaOkjatwFQJqszrnhJ	1	1	1	TBLT2
1143	jLWZLwUVmgghlfOUDkVKnYZAcWggUZ	1	1	1	TBLT3
1144	UPCFdscaEvmpZltLeRiCQwIFVfQuya	1	1	1	TBLT1
1145	fPaYrHuawZyUVbKWQWEpOOBpaIWaXq	1	1	1	TBLT2
1146	fZMuZQIwaEvjJyDiDFkkNTEuwcfpSr	1	1	1	TBLT3
1147	EutqwoCxbaNuQDkGOSjUtrTRfdomrI	1	1	1	TBLT3
1148	zYGaRjgHsWaXpliflubCRgIyBSCanO	1	1	1	TBLT1
1149	CHAzklHHScAnqdfofIZkMtPurznmHH	1	1	1	TBLT1
1150	nAhMKZaLQoQpWHDggmcobYapAKDZPD	1	1	1	TBLT2
1151	AdXGIOwCbQkvySJKaDDMNhhAsmzhcx	1	1	1	TBLT1
1152	kctKSkOgShUJiJHePNirdGHGLqOcwJ	1	1	1	TBLT3
1153	hIACalQQujuXYufQmWkKwmFundRMCq	1	1	1	TBLT3
1154	HSKxRwgJOYcmvFUVobDuhlRaRBBdnE	1	1	1	TBLT3
1155	hvrUkkzLdMEpXDOTtHZPEBvyLxUcGM	1	1	1	TBLT2
1156	ETrkpCUVDCTjkTnDNiXKyyXdBiTWVB	1	1	1	TBLT2
1157	GGcroTxwsyUCYwjGBnANRkBueVERaU	1	1	1	TBLT2
1158	qreznQnElbuHnPuglEikGioAJfuNCb	1	1	1	TBLT3
1159	fTWnwdLSRawJnFWNFCmySeCmzyjmYe	1	1	1	TBLT1
1160	zvzQFkJaxdClVqInStmMrfpWyqTdSp	1	1	1	TBLT3
1161	eMMwJcmppkARlBdiTDMnYNcOfbSwBO	1	1	1	TBLT2
1162	lQegnpdKlYDvcgETZWJYEAdYDLTIVB	1	1	1	TBLT1
1163	OHdDtwGmOOkrcJoZhdVDlAJFPNwUEG	1	1	1	TBLT2
1164	intWHFVoOHSEKoIhxjAHQvpRRiYJXd	1	1	1	TBLT3
1165	ZqDGwWuOTFRGjuowuVHSnazIpvUbNp	1	1	1	TBLT2
1166	ICQyrhLOySXiyfVAcaMMFjaqVnHYUl	1	1	1	TBLT3
1167	cqMidsoouxFwRdRguZsUEuAhLmXNIg	1	1	1	TBLT3
1168	QrqUBLFqOSMzyKYmyUEeCJFNyfGxpV	1	1	1	TBLT2
1169	aEMpiqMilxfkTbiwlMtWDQCcWYzcVw	1	1	1	TBLT3
1170	TmHbiQlAxrkuCVXmHZkbchqUdEFHCL	1	1	1	TBLT3
1171	NhHUpqwYKEagEmTJcIwKvjQZDZtCZe	1	1	1	TBLT3
1172	XCxTbBTOzYEnUFgpxwLXhTPIlJCBsj	1	1	1	TBLT2
1173	qovjKAAkxoqzBvwctWMaDjfVaBfRIy	1	1	1	TBLT1
1174	dcielcusQcRqwqLUfzrWhOcmdABDyf	1	1	1	TBLT2
1175	hhhYlaonJsgKvWOMPnxFmFBxkKzPLL	1	1	1	TBLT2
1176	LKWywCkOvIGAWwNdrrqhFvmlhhnCJj	1	1	1	TBLT3
1177	OllmlPCMIoiDIcEMxrwevQSPnXQmEz	1	1	1	TBLT2
1178	BdjefFqbgKhcTvMjiCwAqBdSvZTCWk	1	1	1	TBLT3
1179	SNoNWchgHrNhLJaGyTLQYfdcXjaXug	1	1	1	TBLT1
1180	PyRkAiOIIIyzThTtTAgllQDDGqnEMj	1	1	1	TBLT2
1181	QkKsWPgSMKpbBhcHIjEhkoWDXBoPjV	1	1	1	TBLT3
1182	bZhUJtzrVaUtwrUgsgdRFiEavbctrq	1	1	1	TBLT2
1183	LvoTzPFKswlOORQysBLypVidJYHWCr	1	1	1	TBLT1
1184	UUdCJIQYmngcKvbmTiINgwOXEBoUAR	1	1	1	TBLT3
1185	YukXDRRPBZLxiJbrzlyqzVKgGvCMir	1	1	1	TBLT3
1186	mzDVWpVoVLYReAwpHokoVzKxuFZVsO	1	1	1	TBLT1
1187	OxzojqfBVHqmXtALVPaDKPyrvCtVII	1	1	1	TBLT1
1188	DlCzbCqjQByahULOGJOdXqPEIMSvbn	1	1	1	TBLT1
1189	HBTcsctRmcfAtRRrSFxheQHdVflOwk	1	1	1	TBLT3
1190	qHNSmnJjbAmbYVxlquueqqjbkVxSzM	1	1	1	TBLT1
1191	VNAUAzmabGwhjNZxahovNBsounWqHi	1	1	1	TBLT3
1192	YNEpfapIkaCZcioaelsIYIGXLYnCUq	1	1	1	TBLT1
1193	FFsAmFNxmOgQWJsSOasdoHxTHRNvQG	1	1	1	TBLT2
1194	pqMyBzuOrlNLPQuLLuDUgqVLGillQb	1	1	1	TBLT3
1195	SvknjuMZUHweIWIFNtamHpiIDiHXIu	1	1	1	TBLT1
1196	WtJqvIAvZannWydBBBbXmCYlkFLMJN	1	1	1	TBLT3
1197	VDRIiJncprXNdSVoUDHpeCVKkXmixX	1	1	1	TBLT2
1198	zAbamkorkJynnfAZiGYcNIxWmUGJJc	1	1	1	TBLT3
1199	YlgybtVQCnpOMrhqJbalRfnvzAVMci	1	1	1	TBLT2
1200	dQRpkWCgUYNfKNtrHJzWIeJlDkObNe	1	1	1	TBLT3
1201	mCeKtVezbQKZBnLtelVSVjdeAGwsOv	1	1	1	TBLT1
1202	dKlmbsMlEgwjPidBPUdXzGxpkuzBBS	1	1	1	TBLT2
1203	QShIvwEAuUbRLbQCElvhpBvDpzosvm	1	1	1	TBLT2
1204	CllRbeubMTUhegSIjiISlcHBzuPmFT	1	1	1	TBLT3
1205	xiXTGhhSVaCumEhyfOTgbplWthvgfm	1	1	1	TBLT3
1206	QjXfnrSKyfSrQoRAntUbeafppAZkMZ	1	1	1	TBLT2
1207	EsEEsLpzfwuHAoaaBxqyWeTMypkjTS	1	1	1	TBLT1
1208	DjHBEkxEhkpysQHAfBNwIQACszyfUv	1	1	1	TBLT2
1209	xbUSUuTAnZaGhBECkMBKedcdUrJCgT	1	1	1	TBLT2
1210	YYUpHdbMBZuFxbQifEslDgFbJZahxv	1	1	1	TBLT1
1211	GrLCRYAkEDPnANFHFeatioLShlnnIu	1	1	1	TBLT1
1212	PXFncdxPvmcJpUpZXIpsrpKxbBtBqg	1	1	1	TBLT2
1213	tgpqYdlrUTqsJzAFFUWkCkEOITpfQt	1	1	1	TBLT2
1214	uOLnqvShfAtsCFbMRoWJyXfjNeJWzI	1	1	1	TBLT2
1215	CxFhTRHyMJVsMKOlSXDgsqjSuylwsO	1	1	1	TBLT2
1216	ZbhERJSCsTAHHgGlpSCqwbSOUFqkkH	1	1	1	TBLT2
1217	jLfmWxVRuPbMRitgwidIsNmQZQmeiD	1	1	1	TBLT1
1218	ZXtwajeXtxIhNpGqSSSQjsIKGDYkvX	1	1	1	TBLT3
1219	gPtJDPeunwAYqIkiXkVdTjMxwQLbur	1	1	1	TBLT1
1220	HTiBFkEDAXLJsiUNoDRuQLNNMQUqKv	1	1	1	TBLT1
1221	NnyvCwAArKuFIYDByZNKptgFlslpYr	1	1	1	TBLT3
1222	thAiXbdmkoZhDlabYnbKTIfTkWdAob	1	1	1	TBLT3
1223	iASTkxUEGQhALePCAPPtrPQkgycDwM	1	1	1	TBLT3
1224	PmAciuKBqsgJJHcFQRqRdlCSihDJWs	1	1	1	TBLT1
1225	uGxNvUJYZVEFkbrWGRJFMDvyglVAIe	1	1	1	TBLT3
1226	HOtNfLSKYRPTRTFzFzQDjPlvHmwYJi	1	1	1	TBLT3
1227	QnhnYRSTMvXagkWSKenbpYnVUgLnGG	1	1	1	TBLT2
1228	BrMAudzxkOXPRgODAHRGCJDcnQznqq	1	1	1	TBLT3
1229	dPkEFgvziMkPJSAngkdSqcRohobYZu	1	1	1	TBLT2
1230	PeNvrfVkzrgiRsLXyYNSEJVkbZZkSn	1	1	1	TBLT2
1231	yFBnLotmJwyqCFnHqoJPOPZBEQdUTz	1	1	1	TBLT1
1232	vYHPNgdAyMkebmwHndAiYdIJFrvXDT	1	1	1	TBLT3
1233	qhhoONtCIMWbKCWPKQpsvEkaMsUFIE	1	1	1	TBLT3
1234	zcyEPhxwgSAqVyINfZktDGaYlureVA	1	1	1	TBLT2
1235	cHfthNvHwDHSkZmqWnFjqapmtFTaiF	1	1	1	TBLT1
1236	TJgtAlpZWUbLNSVOyqvfMwmDcdlukL	1	1	1	TBLT3
1237	DbPclvtBalgqFvnbUMRsHZuGWTlsqy	1	1	1	TBLT2
1238	nNPWDHTmiswANfDaguefdySbdCWkTV	1	1	1	TBLT2
1239	OKziTMpfXxaBLcuqfPzLoyhaUfkIGZ	1	1	1	TBLT1
1240	dfHTmBiyhlQgvldRGgfTpBrjgGiggz	1	1	1	TBLT3
1241	tyDwwhJandAiiKxoIXzHSqejCPTZyx	1	1	1	TBLT1
1242	GFcfsVhWERlltQbTTXrlYgsADDouSQ	1	1	1	TBLT3
1243	AwWFyoabbYvmtXyRdzzZkPjEozZXjI	1	1	1	TBLT1
1244	eiWCQAKtssptCqDuCfSVEplARJYSnc	1	1	1	TBLT2
1245	vadfvOkzByemHpZfSrvMqHbLhSfEUh	1	1	1	TBLT1
1246	EtmfzEnzaKnPHWBCJnuTKmaEnhADMv	1	1	1	TBLT3
1247	vzbdIMhjrXobdwElIrNcMVXlADlQDL	1	1	1	TBLT1
1248	yOblLqhazSXBxeyndIcaPpOtUTsDxE	1	1	1	TBLT2
1249	EBjGqZbauRmFAyIsWONEXpMvMJLPta	1	1	1	TBLT3
1250	tgndFasVZpbXCprmWeUuciociNsymr	1	1	1	TBLT3
1251	OGfpWUYqkjLSYYIoXXFjshQktYwlQP	1	1	1	TBLT3
1252	VOWwBzToXDWLJxzLdhWYgEUiHMwvmK	1	1	1	TBLT2
1253	FfemINLIESgPOEnvThYWBChcBlNLcV	1	1	1	TBLT3
1254	AHRvwWpwPnheVNBxCNZiZLctSDkOkK	1	1	1	TBLT2
1255	whvikumoxNEeRiOZVOiPbKeHnQmftv	1	1	1	TBLT1
1256	eOElPpTddOUqTWBzTqGcvuiWzusxLc	1	1	1	TBLT3
1257	JORBFnQtpDWOCqTAWJbpJrXGlKYmgP	1	1	1	TBLT1
1258	WtKrFvzfLbQklElZlTNhxQFhBETlVq	1	1	1	TBLT3
1259	ldyNLvwmZqFsSgMuiqNTvitACupmcH	1	1	1	TBLT2
1260	YEMsNlXyYOtcjHMGIKBeihxPZEIgRB	1	1	1	TBLT2
1261	iEMZPyWbvYAaYSVdaqctjVJCJDpaLR	1	1	1	TBLT2
1262	AamxEynbJbExevFSWTGGArOrzdDWXD	1	1	1	TBLT2
1263	WSaQomzNrtehqfxsVxveYkTtqtJIYY	1	1	1	TBLT3
1264	tjNuvoWjNmtDlCbbBDUEiObnAmhKaa	1	1	1	TBLT3
1265	AgEGnOgGrhCDsNsjwSoYMEwwIngjRl	1	1	1	TBLT3
1266	uDrphXtozjSLoLZmslQTffwuVLpyEN	1	1	1	TBLT3
1267	dzMkFSgjKBRiJCspoAsNqcHuWLLUkl	1	1	1	TBLT1
1268	UqvkaMACVdUtRrADJskzKlQaaQzVOr	1	1	1	TBLT3
1269	luWzIoOIqLeVuPbGFgrjLswNuWfqxE	1	1	1	TBLT1
1270	gVsZSSBuTjGbStGxrWFmArknHFGnqe	1	1	1	TBLT2
1271	IgDyFionyqedWKSOzZusZknhPhtrzV	1	1	1	TBLT1
1272	yoCMBVSUAOyLYDLisAmGgwCaQCMxKu	1	1	1	TBLT3
1273	zHUlNopGXcQVTBXTgUutqJybtsrqDg	1	1	1	TBLT1
1274	mCnJEopVFtenatYTntVzjMyprJdWlF	1	1	1	TBLT2
1275	XcTrGJsRcgzQOlALKJXtAWFWorwqho	1	1	1	TBLT2
1276	NnsCNVQeDKmMDFZRdjKizsZpXITvNY	1	1	1	TBLT1
1277	nnEMQxLLVaahursLKrowzkyjHWBSdY	1	1	1	TBLT2
1278	LZWbaYNtdipidovJtxqbFXAiaRiCbZ	1	1	1	TBLT1
1279	pdAWXABxjvrdgsjctRjkMmiQTfvutt	1	1	1	TBLT3
1280	NmFZHhDFwWpYVxhaaNKBRvSJLUyCum	1	1	1	TBLT3
1281	jOtmEKipfhBpZiCAzDVSyCTKElxlrI	1	1	1	TBLT2
1282	JpGPOKeYkwveJpRLhDwAYqXaxaymZY	1	1	1	TBLT3
1283	xvVsGiuEMjtJQTezLJIisRCSQSAxze	1	1	1	TBLT2
1284	qDogaOHJIMUepSwAjrajGNrgWIkgEK	1	1	1	TBLT3
1285	LXRPQRJuNEKBIyEcpWmaTcaUxJakzL	1	1	1	TBLT2
1286	acuaLlxUMpWhkTvlzRTCobxTXyQJlN	1	1	1	TBLT2
1287	bQSdiMBOYPzOYHesREAuDhVdXsQYve	1	1	1	TBLT2
1288	UXmSgrKDXPuPSZkrrrIwOmDRdhqVsg	1	1	1	TBLT1
1289	zoGWvUqAhnIIKfcowYebuFLZZuvSNz	1	1	1	TBLT3
1290	XPDAvkazcoAjEEDFKalmIgnxYDaIEC	1	1	1	TBLT3
1291	PVPlYhgNgHEoDlkLaarfjGTwqiWpEL	1	1	1	TBLT2
1292	eolXYNhJqpXBmweUWVPcsKudxqKfFK	1	1	1	TBLT1
1293	FXvrImKZMhdLwkNDxMyZSOfpSYVxDI	1	1	1	TBLT2
1294	GaaiMAwUTMwnOVmkvxfqqSgpPQEKJl	1	1	1	TBLT3
1295	UkOQqkWLtCLTYetjLZsWEtZDMkncZF	1	1	1	TBLT1
1296	OUlETZkbElKBszIegFeTTcqiHbGGKK	1	1	1	TBLT1
1297	fwJbYFEYdODUBzPcRjtMeZmvvcabag	1	1	1	TBLT3
1298	TBWxXziGJuSldzmtQSpsnvsGrVGUXq	1	1	1	TBLT1
1299	ZZwZbDpfMIqEadIJBhPSoxZkYleber	1	1	1	TBLT2
1300	RTkuXSRGqRdeTmFMgApbBZfOeWmDkY	1	1	1	TBLT2
1301	qHtEIlbCQjgKEinxUIdPbCYEXIoXIt	1	1	1	TBLT2
1302	pqAwlgrWtCISJZCJIfnEErJPgVOdPG	1	1	1	TBLT2
1303	bJOBXkCDvDmSQfZHPNrbpemxQvekYU	1	1	1	TBLT3
1304	kwzmkyZzhRjoiymFbIzWMzNwotzqiX	1	1	1	TBLT2
1305	MwKDeNBsqYmglQSTGCaYqWmKIVaIeh	1	1	1	TBLT3
1306	PnsifwwoJAmjjKpYVIsqaDdDStMlQe	1	1	1	TBLT2
1307	YBSpJGSycWqJapHPAFvJcWblKcgTdE	1	1	1	TBLT2
1308	fRDeFBYXQrdeslHcAmwwlTSVHJBqqi	1	1	1	TBLT1
1309	ZfjFcoprhJTOWgdmjZqlPqovwARCvr	1	1	1	TBLT3
1310	rRxybQuBZjCIYrLTCjlsqEntShYILe	1	1	1	TBLT3
\.


--
-- TOC entry 3794 (class 0 OID 16777)
-- Dependencies: 261
-- Data for Name: rooms_table_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_table_rooms (id, table_id, room_id) FROM stdin;
2431	811	1021
2432	811	1268
2433	811	873
2434	812	1294
2435	812	1047
2436	812	1053
2437	813	999
2438	813	1304
2439	813	1177
2440	814	927
2441	814	1247
2442	814	961
2443	815	1121
2444	815	933
2445	815	967
2446	816	967
2447	816	966
2448	816	1144
2449	817	1061
2450	817	1134
2451	817	1195
2452	818	1217
2453	818	1290
2454	818	839
2455	819	1060
2456	819	903
2457	819	1179
2458	820	1008
2459	820	1048
2460	820	864
2461	821	1034
2462	821	943
2463	821	1058
2464	822	909
2465	822	978
2466	822	953
2467	823	1012
2468	823	875
2469	823	1181
2470	824	877
2471	824	990
2472	824	1308
2473	825	1040
2474	825	1251
2475	825	1034
2476	826	895
2477	826	1210
2478	826	988
2479	827	1066
2480	827	862
2481	827	1151
2482	828	1001
2483	828	957
2484	828	1217
2485	829	1242
2486	829	903
2487	829	1106
2488	830	996
2489	830	1126
2490	830	1075
2491	831	1191
2492	831	1058
2493	831	1059
2494	832	924
2495	832	950
2496	832	979
2497	833	1290
2498	833	853
2499	833	1031
2500	834	955
2501	834	1266
2502	834	1136
2503	835	1056
2504	835	1033
2505	835	1087
2506	836	864
2507	836	930
2508	836	1004
2509	837	925
2510	837	1055
2511	837	1147
2512	838	874
2513	838	1102
2514	838	857
2515	839	1287
2516	839	1114
2517	839	1306
2518	840	933
2519	840	1094
2520	840	1060
2521	841	1018
2522	841	852
2523	841	1229
2524	842	1214
2525	842	941
2526	842	1170
2527	843	1116
2528	843	1164
2529	843	1254
2530	844	1246
2531	844	1244
2532	844	1082
2533	845	1054
2534	845	1198
2535	845	1035
2536	846	967
2537	846	882
2538	846	1217
2539	847	1290
2540	847	1021
2541	847	1258
2542	848	1272
2543	848	1145
2544	848	1035
2545	849	1048
2546	849	1016
2547	849	921
2548	850	833
2549	850	1252
2550	850	873
2551	851	1025
2552	851	1143
2553	851	904
2554	852	1003
2555	852	1282
2556	852	1004
2557	853	1150
2558	853	1005
2559	853	939
2560	854	957
2561	854	917
2562	854	1227
2563	855	1124
2564	855	1139
2565	855	1222
2566	856	1281
2567	856	1197
2568	856	880
2569	857	1062
2570	857	1204
2571	857	1251
2572	858	968
2573	858	958
2574	858	894
2575	859	1056
2576	859	833
2577	859	867
2578	860	973
2579	860	930
2580	860	1251
2581	861	1201
2582	861	906
2583	861	838
2584	862	862
2585	862	1274
2586	862	1009
2587	863	1239
2588	863	939
2589	863	922
2590	864	874
2591	864	1095
2592	864	876
2593	865	1244
2594	865	981
2595	865	976
2596	866	1158
2597	866	1195
2598	866	998
2599	867	993
2600	867	848
2601	867	1263
2602	868	837
2603	868	1017
2604	868	1099
2605	869	1290
2606	869	1307
2607	869	1068
2608	870	1047
2609	870	1287
2610	870	1165
2611	871	1030
2612	871	1004
2613	871	1160
2614	872	862
2615	872	1276
2616	872	1294
2617	873	966
2618	873	827
2619	873	880
2620	874	1253
2621	874	902
2622	874	1229
2623	875	993
2624	875	1302
2625	875	1259
2626	876	1062
2627	876	1077
2628	876	1278
2629	877	979
2630	877	864
2631	877	1090
2632	878	1008
2633	878	994
2634	878	1278
2635	879	1087
2636	879	968
2637	879	1167
2638	880	852
2639	880	1090
2640	880	938
2641	881	1001
2642	881	1240
2643	881	1154
2644	882	1079
2645	882	1253
2646	882	912
2647	883	1011
2648	883	1310
2649	883	1253
2650	884	838
2651	884	862
2652	884	1235
2653	885	995
2654	885	1075
2655	885	1097
2656	886	1001
2657	886	1268
2658	886	977
2659	887	1012
2660	887	1220
2661	887	840
2662	888	828
2663	888	899
2664	888	1235
2665	889	1035
2666	889	1128
2667	889	931
2668	890	1210
2669	890	1107
2670	890	1271
2671	891	854
2672	891	870
2673	891	968
2674	892	1246
2675	892	967
2676	892	1231
2677	893	842
2678	893	1271
2679	893	1101
2680	894	1179
2681	894	1013
2682	894	911
2683	895	1206
2684	895	1147
2685	895	1267
2686	896	883
2687	896	1307
2688	896	887
2689	897	1267
2690	897	1147
2691	897	1146
2692	898	1210
2693	898	841
2694	898	1095
2695	899	1132
2696	899	1214
2697	899	1035
2698	900	936
2699	900	1015
2700	900	1054
2701	901	983
2702	901	1206
2703	901	940
2704	902	819
2705	902	991
2706	902	1258
2707	903	1195
2708	903	1072
2709	903	820
2710	904	1199
2711	904	988
2712	904	814
2713	905	1014
2714	905	1140
2715	905	990
2716	906	1081
2717	906	1305
2718	906	1022
2719	907	948
2720	907	1058
2721	907	1096
2722	908	1191
2723	908	1063
2724	908	1295
2725	909	872
2726	909	1052
2727	909	1145
2728	910	1223
2729	910	1012
2730	910	853
2731	911	1180
2732	911	953
2733	911	1282
2734	912	885
2735	912	1012
2736	912	835
2737	913	930
2738	913	1008
2739	913	1242
2740	914	858
2741	914	1062
2742	914	1306
2743	915	874
2744	915	1280
2745	915	1150
2746	916	1279
2747	916	1165
2748	916	1006
2749	917	1144
2750	917	1304
2751	917	862
2752	918	1199
2753	918	1070
2754	918	1058
2755	919	1015
2756	919	930
2757	919	1265
2758	920	1033
2759	920	1125
2760	920	932
2761	921	1116
2762	921	1141
2763	921	1283
2764	922	1070
2765	922	1171
2766	922	1022
2767	923	1027
2768	923	1296
2769	923	876
2770	924	1143
2771	924	1154
2772	924	849
2773	925	1124
2774	925	954
2775	925	1189
2776	926	852
2777	926	1283
2778	926	890
2779	927	991
2780	927	1133
2781	927	1132
2782	928	952
2783	928	1008
2784	928	926
2785	929	1304
2786	929	936
2787	929	1087
2788	930	850
2789	930	1075
2790	930	918
2791	931	1059
2792	931	1233
2793	931	899
2794	932	1051
2795	932	1115
2796	932	846
2797	933	1294
2798	933	982
2799	933	900
2800	934	1010
2801	934	828
2802	934	1000
2803	935	891
2804	935	922
2805	935	1097
2806	936	941
2807	936	985
2808	936	1020
2809	937	1031
2810	937	1242
2811	937	956
2812	938	1297
2813	938	1002
2814	938	1168
2815	939	1249
2816	939	939
2817	939	895
2818	940	1271
2819	940	1064
2820	940	1049
2821	941	945
2822	941	1068
2823	941	1292
2824	942	1079
2825	942	853
2826	942	999
2827	943	912
2828	943	1180
2829	943	895
2830	944	1270
2831	944	1056
2832	944	1030
2833	945	1128
2834	945	1200
2835	945	1202
2836	946	813
2837	946	1247
2838	946	951
2839	947	1136
2840	947	1141
2841	947	1227
2842	948	899
2843	948	980
2844	948	1051
2845	949	1275
2846	949	867
2847	949	862
2848	950	955
2849	950	1224
2850	950	1208
2851	951	1292
2852	951	1140
2853	951	881
2854	952	1018
2855	952	858
2856	952	1139
2857	953	1275
2858	953	1019
2859	953	1063
2860	954	1244
2861	954	824
2862	954	1222
2863	955	1061
2864	955	890
2865	955	876
2866	956	1038
2867	956	1295
2868	956	950
2869	957	1262
2870	957	840
2871	957	1083
2872	958	1084
2873	958	1278
2874	958	1209
2875	959	1306
2876	959	907
2877	959	1012
2878	960	872
2879	960	1091
2880	960	811
2881	961	884
2882	961	1143
2883	961	1132
2884	962	855
2885	962	837
2886	962	997
2887	963	994
2888	963	1270
2889	963	1186
2890	964	1070
2891	964	998
2892	964	1067
2893	965	941
2894	965	861
2895	965	1112
2896	966	1134
2897	966	935
2898	966	1062
2899	967	1091
2900	967	889
2901	967	1299
2902	968	1085
2903	968	914
2904	968	1016
2905	969	1233
2906	969	1076
2907	969	1184
2908	970	1268
2909	970	927
2910	970	1244
2911	971	1242
2912	971	1269
2913	971	1267
2914	972	978
2915	972	1041
2916	972	859
2917	973	1249
2918	973	1108
2919	973	989
2920	974	1223
2921	974	1045
2922	974	1287
2923	975	826
2924	975	893
2925	975	870
2926	976	1098
2927	976	1060
2928	976	852
2929	977	1187
2930	977	1108
2931	977	975
2932	978	1248
2933	978	903
2934	978	1063
2935	979	858
2936	979	820
2937	979	1135
2938	980	869
2939	980	1113
2940	980	1220
2941	981	912
2942	981	1149
2943	981	986
2944	982	1024
2945	982	1033
2946	982	1134
2947	983	1054
2948	983	1069
2949	983	1289
2950	984	1062
2951	984	1053
2952	984	1169
2953	985	1012
2954	985	1071
2955	985	1149
2956	986	813
2957	986	1031
2958	986	862
2959	987	993
2960	987	875
2961	987	917
2962	988	1204
2963	988	909
2964	988	901
2965	989	1029
2966	989	1182
2967	989	1236
2968	990	1053
2969	990	955
2970	990	1076
2971	991	1189
2972	991	1014
2973	991	1294
2974	992	1252
2975	992	1251
2976	992	830
2977	993	822
2978	993	1264
2979	993	995
2980	994	898
2981	994	1205
2982	994	1056
2983	995	1170
2984	995	1275
2985	995	913
2986	996	1167
2987	996	1235
2988	996	900
2989	997	945
2990	997	933
2991	997	857
2992	998	862
2993	998	817
2994	998	1179
2995	999	1161
2996	999	1084
2997	999	1176
2998	1000	849
2999	1000	1187
3000	1000	1131
3001	1001	816
3002	1001	988
3003	1001	1220
3004	1002	839
3005	1002	1019
3006	1002	1193
3007	1003	1032
3008	1003	976
3009	1003	889
3010	1004	1263
3011	1004	1188
3012	1004	986
3013	1005	1243
3014	1005	1085
3015	1005	1020
3016	1006	1276
3017	1006	876
3018	1006	1243
3019	1007	1179
3020	1007	938
3021	1007	1289
3022	1008	1168
3023	1008	939
3024	1008	1310
3025	1009	898
3026	1009	941
3027	1009	974
3028	1010	1200
3029	1010	1052
3030	1010	1247
3031	1011	1304
3032	1011	908
3033	1011	1159
3034	1012	942
3035	1012	835
3036	1012	1034
3037	1013	935
3038	1013	1207
3039	1013	1197
3040	1014	1047
3041	1014	1075
3042	1014	1150
3043	1015	941
3044	1015	1188
3045	1015	1066
3046	1016	925
3047	1016	1094
3048	1016	939
3049	1017	1235
3050	1017	1063
3051	1017	1075
3052	1018	1223
3053	1018	1167
3054	1018	996
3055	1019	1147
3056	1019	1269
3057	1019	891
3058	1020	1008
3059	1020	1280
3060	1020	882
3061	1021	1092
3062	1021	1024
3063	1021	990
3064	1022	1094
3065	1022	827
3066	1022	1136
3067	1023	1144
3068	1023	874
3069	1023	945
3070	1024	1123
3071	1024	1301
3072	1024	1153
3073	1025	816
3074	1025	986
3075	1025	819
3076	1026	936
3077	1026	1202
3078	1026	1083
3079	1027	1001
3080	1027	1121
3081	1027	836
3082	1028	1290
3083	1028	954
3084	1028	829
3085	1029	1080
3086	1029	920
3087	1029	1112
3088	1030	979
3089	1030	1243
3090	1030	1283
3091	1031	817
3092	1031	897
3093	1031	1212
3094	1032	1087
3095	1032	929
3096	1032	1075
3097	1033	1144
3098	1033	1280
3099	1033	1170
3100	1034	941
3101	1034	867
3102	1034	990
3103	1035	1266
3104	1035	1099
3105	1035	1165
3106	1036	900
3107	1036	1147
3108	1036	891
3109	1037	1249
3110	1037	1118
3111	1037	944
3112	1038	911
3113	1038	827
3114	1038	1094
3115	1039	847
3116	1039	890
3117	1039	1233
3118	1040	1237
3119	1040	1056
3120	1040	1051
3121	1041	1011
3122	1041	909
3123	1041	884
3124	1042	868
3125	1042	814
3126	1042	905
3127	1043	990
3128	1043	1021
3129	1043	944
3130	1044	927
3131	1044	1044
3132	1044	1164
3133	1045	1231
3134	1045	883
3135	1045	925
3136	1046	1044
3137	1046	1120
3138	1046	1129
3139	1047	1230
3140	1047	1177
3141	1047	1017
3142	1048	1094
3143	1048	1157
3144	1048	1145
3145	1049	1052
3146	1049	936
3147	1049	1155
3148	1050	1279
3149	1050	905
3150	1050	837
3151	1051	935
3152	1051	1030
3153	1051	1080
3154	1052	988
3155	1052	1188
3156	1052	893
3157	1053	909
3158	1053	1170
3159	1053	1227
3160	1054	922
3161	1054	1166
3162	1054	1153
3163	1055	1137
3164	1055	953
3165	1055	1259
3166	1056	1248
3167	1056	1292
3168	1056	940
3169	1057	1030
3170	1057	1134
3171	1057	1050
3172	1058	822
3173	1058	1218
3174	1058	953
3175	1059	831
3176	1059	1205
3177	1059	1021
3178	1060	1254
3179	1060	1261
3180	1060	1027
3181	1061	1130
3182	1061	962
3183	1061	916
3184	1062	927
3185	1062	1292
3186	1062	1304
3187	1063	1196
3188	1063	1275
3189	1063	1104
3190	1064	983
3191	1064	1204
3192	1064	1238
3193	1065	1089
3194	1065	811
3195	1065	968
3196	1066	926
3197	1066	1272
3198	1066	1216
3199	1067	1082
3200	1067	1183
3201	1067	1192
3202	1068	1023
3203	1068	1228
3204	1068	1032
3205	1069	1240
3206	1069	832
3207	1069	874
3208	1070	1186
3209	1070	834
3210	1070	934
3211	1071	1284
3212	1071	849
3213	1071	1136
3214	1072	1295
3215	1072	926
3216	1072	1144
3217	1073	903
3218	1073	883
3219	1073	910
3220	1074	1097
3221	1074	1144
3222	1074	1275
3223	1075	1092
3224	1075	1298
3225	1075	855
3226	1076	1254
3227	1076	1260
3228	1076	1028
3229	1077	1071
3230	1077	1037
3231	1077	1075
3232	1078	859
3233	1078	1000
3234	1078	836
3235	1079	950
3236	1079	872
3237	1079	1268
3238	1080	1242
3239	1080	975
3240	1080	1153
3241	1081	1045
3242	1081	1102
3243	1081	1059
3244	1082	1038
3245	1082	985
3246	1082	909
3247	1083	1040
3248	1083	976
3249	1083	863
3250	1084	1052
3251	1084	907
3252	1084	1076
3253	1085	1201
3254	1085	1030
3255	1085	883
3256	1086	1162
3257	1086	1239
3258	1086	962
3259	1087	1251
3260	1087	996
3261	1087	1253
3262	1088	1078
3263	1088	1174
3264	1088	1193
3265	1089	1195
3266	1089	1184
3267	1089	1256
3268	1090	994
3269	1090	1204
3270	1090	1261
3271	1091	951
3272	1091	830
3273	1091	896
3274	1092	856
3275	1092	1099
3276	1092	1077
3277	1093	1133
3278	1093	996
3279	1093	949
3280	1094	990
3281	1094	1138
3282	1094	1071
3283	1095	984
3284	1095	1088
3285	1095	925
3286	1096	1295
3287	1096	871
3288	1096	922
3289	1097	988
3290	1097	1095
3291	1097	1205
3292	1098	1063
3293	1098	939
3294	1098	1285
3295	1099	1272
3296	1099	1055
3297	1099	1009
3298	1100	1194
3299	1100	1038
3300	1100	1081
3301	1101	1082
3302	1101	811
3303	1101	854
3304	1102	1088
3305	1102	1079
3306	1102	908
3307	1103	1212
3308	1103	958
3309	1103	819
3310	1104	1157
3311	1104	1268
3312	1104	1122
3313	1105	826
3314	1105	1095
3315	1105	855
3316	1106	865
3317	1106	1260
3318	1106	856
3319	1107	1154
3320	1107	1206
3321	1107	1239
3322	1108	1231
3323	1108	1180
3324	1108	1102
3325	1109	910
3326	1109	1278
3327	1109	1129
3328	1110	1014
3329	1110	1158
3330	1110	833
3331	1111	1150
3332	1111	1114
3333	1111	1268
3334	1112	1192
3335	1112	1031
3336	1112	846
3337	1113	908
3338	1113	1166
3339	1113	1258
3340	1114	1267
3341	1114	968
3342	1114	921
3343	1115	1144
3344	1115	1011
3345	1115	898
3346	1116	1175
3347	1116	1140
3348	1116	880
3349	1117	1015
3350	1117	935
3351	1117	876
3352	1118	1270
3353	1118	1234
3354	1118	1190
3355	1119	1056
3356	1119	895
3357	1119	1153
3358	1120	873
3359	1120	865
3360	1120	1178
3361	1121	1150
3362	1121	1114
3363	1121	862
3364	1122	933
3365	1122	1187
3366	1122	1216
3367	1123	1125
3368	1123	1186
3369	1123	951
3370	1124	920
3371	1124	996
3372	1124	1114
3373	1125	1036
3374	1125	818
3375	1125	812
3376	1126	1183
3377	1126	916
3378	1126	1086
3379	1127	1013
3380	1127	1201
3381	1127	916
3382	1128	1085
3383	1128	1164
3384	1128	1151
3385	1129	1125
3386	1129	948
3387	1129	888
3388	1130	1151
3389	1130	882
3390	1130	1105
3391	1131	996
3392	1131	830
3393	1131	861
3394	1132	1155
3395	1132	1275
3396	1132	1144
3397	1133	1008
3398	1133	1283
3399	1133	931
3400	1134	1153
3401	1134	1111
3402	1134	940
3403	1135	1170
3404	1135	831
3405	1135	1075
3406	1136	894
3407	1136	1191
3408	1136	1116
3409	1137	986
3410	1137	1244
3411	1137	1085
3412	1138	817
3413	1138	1297
3414	1138	986
3415	1139	841
3416	1139	893
3417	1139	823
3418	1140	1071
3419	1140	1151
3420	1140	1173
3421	1141	914
3422	1141	823
3423	1141	1122
3424	1142	960
3425	1142	975
3426	1142	1182
3427	1143	1004
3428	1143	902
3429	1143	1038
3430	1144	1305
3431	1144	1157
3432	1144	986
3433	1145	861
3434	1145	1148
3435	1145	1267
3436	1146	1158
3437	1146	1132
3438	1146	836
3439	1147	953
3440	1147	1166
3441	1147	1069
3442	1148	1274
3443	1148	1122
3444	1148	816
3445	1149	822
3446	1149	1177
3447	1149	1150
3448	1150	1089
3449	1150	1013
3450	1150	1053
3451	1151	1218
3452	1151	981
3453	1151	940
3454	1152	901
3455	1152	1037
3456	1152	1086
3457	1153	1111
3458	1153	1057
3459	1153	982
3460	1154	822
3461	1154	1012
3462	1154	1202
3463	1155	1009
3464	1155	1214
3465	1155	977
3466	1156	1076
3467	1156	981
3468	1156	1245
3469	1157	1056
3470	1157	1277
3471	1157	1148
3472	1158	995
3473	1158	960
3474	1158	892
3475	1159	865
3476	1159	950
3477	1159	827
3478	1160	882
3479	1160	907
3480	1160	1053
3481	1161	1216
3482	1161	861
3483	1161	942
3484	1162	976
3485	1162	982
3486	1162	1028
3487	1163	1079
3488	1163	928
3489	1163	1241
3490	1164	986
3491	1164	947
3492	1164	956
3493	1165	1017
3494	1165	1158
3495	1165	863
3496	1166	1044
3497	1166	926
3498	1166	824
3499	1167	1056
3500	1167	1215
3501	1167	1279
3502	1168	1025
3503	1168	1015
3504	1168	1057
3505	1169	1112
3506	1169	950
3507	1169	1075
3508	1170	999
3509	1170	842
3510	1170	1236
3511	1171	1190
3512	1171	1180
3513	1171	1043
3514	1172	1206
3515	1172	1148
3516	1172	1294
3517	1173	969
3518	1173	1088
3519	1173	1041
3520	1174	1305
3521	1174	1087
3522	1174	1009
3523	1175	1190
3524	1175	1023
3525	1175	1051
3526	1176	1259
3527	1176	1112
3528	1176	1288
3529	1177	940
3530	1177	1152
3531	1177	979
3532	1178	1310
3533	1178	1057
3534	1178	1122
3535	1179	1300
3536	1179	1022
3537	1179	1185
3538	1180	845
3539	1180	1098
3540	1180	828
3541	1181	1260
3542	1181	1121
3543	1181	1150
3544	1182	970
3545	1182	912
3546	1182	968
3547	1183	1286
3548	1183	926
3549	1183	966
3550	1184	883
3551	1184	1114
3552	1184	1007
3553	1185	884
3554	1185	977
3555	1185	877
3556	1186	1068
3557	1186	1184
3558	1186	1034
3559	1187	1112
3560	1187	1020
3561	1187	1246
3562	1188	1152
3563	1188	985
3564	1188	1236
3565	1189	932
3566	1189	1254
3567	1189	1285
3568	1190	1267
3569	1190	901
3570	1190	1250
3571	1191	1255
3572	1191	1007
3573	1191	1070
3574	1192	1298
3575	1192	1154
3576	1192	1293
3577	1193	1020
3578	1193	1300
3579	1193	1052
3580	1194	1021
3581	1194	1216
3582	1194	1148
3583	1195	1284
3584	1195	1275
3585	1195	1068
3586	1196	824
3587	1196	1118
3588	1196	852
3589	1197	864
3590	1197	834
3591	1197	1241
3592	1198	964
3593	1198	1172
3594	1198	1305
3595	1199	1220
3596	1199	1132
3597	1199	877
3598	1200	1290
3599	1200	1195
3600	1200	1201
3601	1201	961
3602	1201	947
3603	1201	1118
3604	1202	1142
3605	1202	1108
3606	1202	1116
3607	1203	1307
3608	1203	1109
3609	1203	1025
3610	1204	945
3611	1204	1263
3612	1204	1254
3613	1205	870
3614	1205	1029
3615	1205	1072
3616	1206	1146
3617	1206	1246
3618	1206	1297
3619	1207	973
3620	1207	954
3621	1207	1102
3622	1208	904
3623	1208	1238
3624	1208	1221
3625	1209	1036
3626	1209	1308
3627	1209	881
3628	1210	1201
3629	1210	911
3630	1210	1086
3631	1211	837
3632	1211	902
3633	1211	1137
3634	1212	1085
3635	1212	1090
3636	1212	889
3637	1213	881
3638	1213	1085
3639	1213	1016
3640	1214	1005
3641	1214	846
3642	1214	1100
3643	1215	841
3644	1215	1087
3645	1215	1172
3646	1216	900
3647	1216	847
3648	1216	1187
3649	1217	1258
3650	1217	875
3651	1217	1244
3652	1218	853
3653	1218	953
3654	1218	1134
3655	1219	969
3656	1219	1145
3657	1219	1112
3658	1220	1243
3659	1220	961
3660	1220	1191
3661	1221	869
3662	1221	1035
3663	1221	1269
3664	1222	937
3665	1222	811
3666	1222	1187
3667	1223	1242
3668	1223	1063
3669	1223	934
3670	1224	1001
3671	1224	1118
3672	1224	1048
3673	1225	985
3674	1225	1269
3675	1225	1047
3676	1226	889
3677	1226	1266
3678	1226	1009
3679	1227	969
3680	1227	1307
3681	1227	1207
3682	1228	851
3683	1228	1234
3684	1228	1047
3685	1229	945
3686	1229	1161
3687	1229	1026
3688	1230	881
3689	1230	1263
3690	1230	1050
3691	1231	961
3692	1231	1148
3693	1231	1234
3694	1232	1054
3695	1232	1186
3696	1232	1156
3697	1233	1103
3698	1233	1128
3699	1233	1218
3700	1234	1034
3701	1234	1068
3702	1234	992
3703	1235	943
3704	1235	1050
3705	1235	1265
3706	1236	1231
3707	1236	1305
3708	1236	1165
3709	1237	915
3710	1237	876
3711	1237	1237
3712	1238	1272
3713	1238	1296
3714	1238	1225
3715	1239	876
3716	1239	1014
3717	1239	1030
3718	1240	1014
3719	1240	1009
3720	1240	1120
3721	1241	1236
3722	1241	992
3723	1241	884
3724	1242	938
3725	1242	1165
3726	1242	1298
3727	1243	875
3728	1243	1025
3729	1243	1216
3730	1244	845
3731	1244	949
3732	1244	988
3733	1245	1225
3734	1245	903
3735	1245	1159
3736	1246	968
3737	1246	990
3738	1246	1234
3739	1247	858
3740	1247	1076
3741	1247	987
3742	1248	1301
3743	1248	864
3744	1248	1058
3745	1249	1157
3746	1249	904
3747	1249	1162
3748	1250	1078
3749	1250	905
3750	1250	878
3751	1251	827
3752	1251	1187
3753	1251	1252
3754	1252	1066
3755	1252	1046
3756	1252	1105
3757	1253	1182
3758	1253	1262
3759	1253	1058
3760	1254	1267
3761	1254	1291
3762	1254	1168
3763	1255	1300
3764	1255	1088
3765	1255	818
3766	1256	956
3767	1256	1173
3768	1256	841
3769	1257	1165
3770	1257	908
3771	1257	954
3772	1258	1075
3773	1258	1031
3774	1258	1125
3775	1259	859
3776	1259	1210
3777	1259	1032
3778	1260	1127
3779	1260	936
3780	1260	1048
3781	1261	829
3782	1261	1254
3783	1261	1237
3784	1262	1211
3785	1262	836
3786	1262	1275
3787	1263	1015
3788	1263	860
3789	1263	1010
3790	1264	1247
3791	1264	1031
3792	1264	1107
3793	1265	925
3794	1265	1042
3795	1265	904
3796	1266	930
3797	1266	945
3798	1266	1256
3799	1267	1029
3800	1267	965
3801	1267	847
3802	1268	968
3803	1268	1141
3804	1268	876
3805	1269	1255
3806	1269	1203
3807	1269	1144
3808	1270	1145
3809	1270	940
3810	1270	1128
3811	1271	989
3812	1271	819
3813	1271	1295
3814	1272	848
3815	1272	915
3816	1272	1082
3817	1273	1269
3818	1273	1194
3819	1273	1002
3820	1274	1089
3821	1274	1221
3822	1274	1185
3823	1275	1234
3824	1275	1188
3825	1275	1102
3826	1276	1063
3827	1276	1232
3828	1276	993
3829	1277	1128
3830	1277	1075
3831	1277	839
3832	1278	989
3833	1278	858
3834	1278	876
3835	1279	1288
3836	1279	1175
3837	1279	918
3838	1280	1201
3839	1280	1048
3840	1280	1152
3841	1281	841
3842	1281	822
3843	1281	1140
3844	1282	1021
3845	1282	1172
3846	1282	1103
3847	1283	1099
3848	1283	1022
3849	1283	837
3850	1284	951
3851	1284	1281
3852	1284	1098
3853	1285	1245
3854	1285	1031
3855	1285	1273
3856	1286	1159
3857	1286	1281
3858	1286	1084
3859	1287	943
3860	1287	1172
3861	1287	1098
3862	1288	872
3863	1288	838
3864	1288	1300
3865	1289	1289
3866	1289	865
3867	1289	1008
3868	1290	1058
3869	1290	1034
3870	1290	1066
3871	1291	1068
3872	1291	1152
3873	1291	1278
3874	1292	1115
3875	1292	917
3876	1292	1244
3877	1293	984
3878	1293	1108
3879	1293	918
3880	1294	1307
3881	1294	971
3882	1294	1283
3883	1295	1047
3884	1295	1138
3885	1295	1272
3886	1296	1096
3887	1296	1153
3888	1296	965
3889	1297	1057
3890	1297	871
3891	1297	1194
3892	1298	1292
3893	1298	1231
3894	1298	1196
3895	1299	1021
3896	1299	1054
3897	1299	1284
3898	1300	916
3899	1300	932
3900	1300	1176
3901	1301	1006
3902	1301	894
3903	1301	1052
3904	1302	996
3905	1302	971
3906	1302	998
3907	1303	1285
3908	1303	866
3909	1303	822
3910	1304	894
3911	1304	1238
3912	1304	999
3913	1305	1230
3914	1305	1090
3915	1305	843
3916	1306	1098
3917	1306	1211
3918	1306	1101
3919	1307	999
3920	1307	997
3921	1307	1171
3922	1308	1178
3923	1308	1045
3924	1308	941
3925	1309	1261
3926	1309	940
3927	1309	936
3928	1310	917
3929	1310	947
3930	1310	1146
\.


--
-- TOC entry 3786 (class 0 OID 16743)
-- Dependencies: 253
-- Data for Name: rooms_window; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_window (id, name, width, length, height, type, room_id) FROM stdin;
2081	PjzFYyQdrLiicwSgxbdIIpkeKFSmSM	1	1	1	WT1	1041
2082	VWrQzkNcXmadqRZYantwkVLLHJLpYK	1	1	1	WT1	1041
2083	VggGoUZQyvIGlbjqqHvBBogFXbbCOa	1	1	1	WT1	1042
2084	GSCURvFyVYLiyDmnNcwsWGkcnkBcdY	1	1	1	WT3	1042
2085	wNVXfzQWlwgBtzJByVLLgcTvdgKPlf	1	1	1	WT1	1043
2086	TkgzEEtynPdaTBZkbxfaHwDndoPBHp	1	1	1	WT3	1043
2087	MnAHejbGvzgyrAfCmIbJFuPfyEkscp	1	1	1	WT1	1044
2088	UiDPkBiQgiwOKVgBaLxuAodvzYTjyf	1	1	1	WT2	1044
2089	EHFfODVnwnmcmlhTKMkWbzcVweikiC	1	1	1	WT2	1045
2090	dEExWmsfgILfuPULXZhDBRmYdpxNrv	1	1	1	WT3	1045
2091	KTnRzVgJglGXGYyWNuugnMHFSGBabh	1	1	1	WT2	1046
2092	uvGEeXHtNKLcCtlqLbelTvuqTQJJqU	1	1	1	WT3	1046
2093	FAsREymCpNjXyLAiqdZMMOVOFozuRu	1	1	1	WT1	1047
2094	shhWERgzYqggEOgrGKsWulrDZtoyCe	1	1	1	WT1	1047
2095	ghlUoQwjTQXvTljKOsQPuFOyvAIHGm	1	1	1	WT3	1048
2096	UMAiqCfGlGpEkNvXqggVcbdLAKaPCl	1	1	1	WT3	1048
2097	JtOZuaChoyrjzKuOTRXvJljiuNEsms	1	1	1	WT2	1049
2098	IJuCnEqAEoOOPjmdEmmOwBjANVbgGx	1	1	1	WT3	1049
2099	llECZxcfzdjtMYVVycOkkgFMSmXCKd	1	1	1	WT1	1050
2100	KIRcbNICRJQjqJtgcUudaESzBQltjN	1	1	1	WT2	1050
2101	SAFKZPBuBAzdSKgowUKDeyeLbkcFhU	1	1	1	WT3	1051
2102	fjSWlnneJNGxnSbyhvIlOIkKYWSptd	1	1	1	WT3	1051
2103	WJwtEiIdQBYWUJhrLDiOiPIpiZwqrD	1	1	1	WT1	1052
2104	JoZwlbzfUsMaOtSSMqzAzwNgsKBxjf	1	1	1	WT2	1052
2105	fPcTaUBAcFERAPMHCSawPimVpUTwld	1	1	1	WT3	1053
2106	IFRQJwgsqXogrwJVWpnHKcqmBBowku	1	1	1	WT1	1053
2107	kMMToRHUimboHIlDYNpVLchnbcehhX	1	1	1	WT2	1054
2108	NetzuuHAUbRuwAFcqOTduKGoYSFNuS	1	1	1	WT3	1054
2109	CyKOJaVnJScaRVWbYBzqlLNltWsBkx	1	1	1	WT2	1055
2110	tCxuLRrceRwNcXQMlAcrqDLdgdqjps	1	1	1	WT3	1055
2111	nzhFtFZiGvZwqHCRUhPSAgBsjyNQTF	1	1	1	WT2	1056
2112	mFvAtOMDqrCtcwPbJzHAdQPiZgaJup	1	1	1	WT1	1056
2113	MPomCIloBOrYKQemTUmioMeOemvjrw	1	1	1	WT2	1057
2114	TDKufFUrwhivSKCqnTRimxcsmVcjMC	1	1	1	WT1	1057
2115	DcasWttGaELAPdxTOnGmrVFHqZFWyn	1	1	1	WT2	1058
2116	pUQmiaHvXvfTYCAfwkjfbTPQcApxAz	1	1	1	WT3	1058
2117	JxaIRxZOBZAOmGmRBZpeaKgXvfeuvz	1	1	1	WT3	1059
2118	rZtnGeOWdQSGAQZcRqixBndoIXTfsh	1	1	1	WT2	1059
2119	ERJxdpGXAJLGrwyworLskvdGmyHTSz	1	1	1	WT3	1060
2120	fEWLBEhBObkzWwLMBnGrrWNoWVnJsd	1	1	1	WT2	1060
2121	zOQxvYQdhQBrYEvTyglIcYCfbsiwKU	1	1	1	WT1	1061
2122	rInjSKGxnVzAmUIbCEpmQhSiRuTHMU	1	1	1	WT2	1061
2123	IRrCyDCXcVTVVXdMxGYVxlXXvmAiMa	1	1	1	WT3	1062
2124	irrkPGmOAsNoKnnppeiSaorPrGqZEe	1	1	1	WT3	1062
2125	ZiDanUSvasGlhfhXZxsMZspnDFaBwy	1	1	1	WT2	1063
2126	DBMAZVgaegZLyCheRomWiaoSOmissU	1	1	1	WT3	1063
2127	WjxmMSnlNVugMfyYQafIaVFJvGwMbb	1	1	1	WT1	1064
2128	QcrRiJxFBoiMdYehkISVbjFpXOWwHh	1	1	1	WT2	1064
2129	DiTUULlGIVzvKbmCQBEenCjeMUPVAv	1	1	1	WT1	1065
2130	WxGyoORbftQhuZmZLqFiIaUOrbPcJL	1	1	1	WT3	1065
2131	oHoCNZkRfGDyJzgDLqKOskygfNzrpQ	1	1	1	WT3	1066
2132	spFncDMHpsqOtDYUhRTcrBCjmKIWcW	1	1	1	WT2	1066
2133	QraxLRsLwZoPEyYxuKRpbPkMXnErpx	1	1	1	WT3	1067
2134	cqHhVJVnaDkzYkYYGiSMsFFOtrKTHb	1	1	1	WT2	1067
2135	dDbfylxfxtHnogHBWowPripJquxXMy	1	1	1	WT1	1068
2136	nVFYQssdATeSzcejiqxFtxrPteEDhW	1	1	1	WT1	1068
2137	EnhGZqVRvmUfQiUQoWNaFOecfvfJtY	1	1	1	WT3	1069
2138	TOlUofhKZAKzLnarJjpMjfuocJQmpT	1	1	1	WT1	1069
2139	uVeGWORyFrDLrJftGQPFTCGAozsKxK	1	1	1	WT1	1070
2140	gsNlnHGacPhSQdxEEeOxHkOsXedOmt	1	1	1	WT2	1070
2141	cYpcEXUeyQOEiGQEuYOyHwaBLfIixU	1	1	1	WT2	1071
2142	bkPQbkevrrQttoDWdwAOiAjkwtxirt	1	1	1	WT1	1071
2143	tVoBmRMQNEjEYsCpyXqtbgMDLVoSXY	1	1	1	WT2	1072
2144	NMbgXUfugTpJrKfAUPBPPuJIZdMwSe	1	1	1	WT1	1072
2145	ddKdMJbiuEQVnwvecMQxXaTJDqfDNT	1	1	1	WT1	1073
2146	sLOiGcRndUypirfEzpQOAaofrXPJLK	1	1	1	WT2	1073
2147	xRKyyMUJUtRIuamixKxUtLtHvSyFqd	1	1	1	WT1	1074
2148	SdZreKsQnGVSZbHBnzQhCRuHDgzNPd	1	1	1	WT2	1074
2149	sjiCXNnXFCkUZgRLGpJQLozQTcLYpH	1	1	1	WT1	1075
2150	CFcCDQpXCIiRSMkgkeyppOYGJExgwW	1	1	1	WT2	1075
2151	gLkLDRHlnyXVivbdkEmRzFTXuywbLd	1	1	1	WT2	1076
2152	UhLJOmzycMdAMwSsZPoAqnPODxTeBw	1	1	1	WT1	1076
2153	OnRIJIBWrlSuuHzIvQyagDQmoYlrSY	1	1	1	WT2	1077
2154	IfYSFzOfdDpoHnAQEsdVDpyMnpgBAV	1	1	1	WT3	1077
2155	SjkQaRjpqaMnRGOEdewTPtMMSGZLlx	1	1	1	WT2	1078
2156	pieFWpicaMRUzRgfXRxEYDFsdoNptu	1	1	1	WT2	1078
2157	eMKPXJoSCnfpAEIzGeAZXjryBYFYuk	1	1	1	WT3	1079
2158	QBUIYZBtxxXNPqzTKTIKnHSZDdtNeR	1	1	1	WT1	1079
2159	nAENTTmBjpccZMTOXoxKrcMkyYuzzk	1	1	1	WT3	1080
2160	cQXYTCkwmwmfwUNxViVvCgWFohuWgA	1	1	1	WT3	1080
2161	rwcPZgCJnLwEWUGaJlybvhIwanLjnK	1	1	1	WT1	1081
2162	bVXuroqsJJJBLYmZWZlYzLptwFcWvd	1	1	1	WT3	1081
2163	rdNswGhiDWwgbnYupdVerpwsdQCGpx	1	1	1	WT2	1082
2164	RhXXRPYEoyHjompSqesGwGglTCavVc	1	1	1	WT3	1082
2165	lqUfrEkfjfRleUcLolaEkgSYIziOja	1	1	1	WT3	1083
2166	reizGjLemXGzGefDsGSsxWgDFiEBgu	1	1	1	WT2	1083
2167	DZQnGXqJmZYhKdPmVWgimtdPulgAsj	1	1	1	WT2	1084
2168	heRENzcsOviBHiPpKGIVEgpnmPuxhM	1	1	1	WT2	1084
2169	CgIDkUQyEBUjKxPXLVeerbebCOMiQk	1	1	1	WT2	1085
2170	VkFjMhwXrRyCZTxQUHsgJOyQKNqmHY	1	1	1	WT1	1085
2171	ZniSnfLmzcMRXTusWCzIipSOWseXVO	1	1	1	WT1	1086
2172	xQGebAAAcwAtwnjtSDNgxMOCLvOaXs	1	1	1	WT2	1086
2173	UncCUqbERoeFyAcknKstmZRiPFxRzm	1	1	1	WT1	1087
2174	fvwjrjxsxSzmAdThCyJLZQhQojqBKX	1	1	1	WT2	1087
2175	cHRRlARvHJAmddhaiqFAHJkPxQysjp	1	1	1	WT2	1088
2176	dBTuHExQDuZWmmaxJSLBectjAWwofp	1	1	1	WT3	1088
2177	HryHhwWOyrvDjCAfKMSdnRJrclXkwT	1	1	1	WT3	1089
2178	qUXBNHPhOFfHKQEiJBbZolIRsycuNP	1	1	1	WT1	1089
2179	PQLOUePKWklnmyZgMsUuQsRnPbVrwt	1	1	1	WT1	1090
2180	HLtSCHWRWbkthWiCODduewksYwHlOb	1	1	1	WT1	1090
2181	lcWBdSOuTYgAGSQevzzReZitmokRae	1	1	1	WT1	1091
2182	KejxHabLAUjGccbsbZMHoBcLpYqfCo	1	1	1	WT3	1091
2183	HQpvkOzHzBDrhVOxCSYGSArtkJqkEh	1	1	1	WT3	1092
2184	ZcFiEnzZCKaQXuWQamTxYJyTTuHNkd	1	1	1	WT3	1092
2185	sMdLDhSBzpObeBLDqLemYXfsrzAeqk	1	1	1	WT3	1093
2186	mRduBmNMhMZrZcmqYuvKLwqwFhYoCs	1	1	1	WT1	1093
2187	GEflqdvZRFsoAIaVYesqFZDrfANlRG	1	1	1	WT2	1094
2188	EksmELqTPXSwRQjOHMObNIjJhIsNBy	1	1	1	WT3	1094
2189	TrIcBjSZHsOvZywaDVDVCPByzgSPWe	1	1	1	WT1	1095
2190	bBBltxKXbSvvXEOpfsodWNePJyUqKm	1	1	1	WT2	1095
2191	UCjQDkqFGjqpUrCJYsLwCFPQGAmfhg	1	1	1	WT3	1096
2192	fNQwFxusaReGxAkpxxddJtVmXZoCnH	1	1	1	WT1	1096
2193	vWAKfDuPVfLpuriQZsOMtyTLaOsibl	1	1	1	WT1	1097
2194	DjSDvKNZiQuNXXmVVyQcKUIwkEfIUJ	1	1	1	WT2	1097
2195	TPuwbGZHTfRePmrBwoSCckYgomQsRy	1	1	1	WT1	1098
2196	VbTwmSUHreJLCxWMPrqaVNAethvTlq	1	1	1	WT3	1098
2197	AMMeDhgNpIyUseGintZuROqzwrFjBp	1	1	1	WT3	1099
2198	QgneHLYNjeIyYJjEIGrEpYZtBKdbfc	1	1	1	WT2	1099
2199	tqJWRVyIOxjbdRvKOZOAPuPUgeHAnm	1	1	1	WT1	1100
2200	ZjOcCQfxALCGdoAmqJKNTRAvsHdPiN	1	1	1	WT3	1100
2201	iKzxJnOpbBOZUMbvSceTLtkWXFiaPC	1	1	1	WT2	1101
2202	SfZNWQihkevWWiXpgglPOyYVAOzRoS	1	1	1	WT2	1101
2203	tQEKlhrEWtwSjAsOnaHHJiWifODIPe	1	1	1	WT3	1102
2204	rhtnUazVPmIUXoatzxKTcnovHRfNcq	1	1	1	WT2	1102
2205	AqIfGSQJVrRElSlFKqjkNLohTHJWgy	1	1	1	WT2	1103
2206	BssapNdVncZncyNuDUVLgxUmzlROyk	1	1	1	WT2	1103
2207	xMTqTlJIxXBLHrnvOtDGMKEGaytcUd	1	1	1	WT1	1104
2208	ZQZpAbsXfzunlogIhvzyJMPgnimSRX	1	1	1	WT2	1104
2209	uyRTtRTmKldSxcxIofuVMKBPPxwaPY	1	1	1	WT1	1105
2210	aZRKFwYMWKYRuKmkDdlNWnXfIjphWC	1	1	1	WT3	1105
2211	SjIOoxWtWzMRdAtlIDjnChqCZgJSEW	1	1	1	WT2	1106
2212	UovZLCpVCzcVERDKtUydiBVIdreWvc	1	1	1	WT2	1106
2213	tuacEysQqUAugdOrZJBkzDHfrXYTGH	1	1	1	WT3	1107
2214	eHpNRUBHEBCvZahGneQaNUcPIZgtJO	1	1	1	WT1	1107
2215	ttHWmZtVwZIkyBaInYYjExPKtaeubW	1	1	1	WT2	1108
2216	mRPgDUHHOpiZejQqKBZqEyHISUVnNi	1	1	1	WT2	1108
2217	CgYzqLKYcKmxHzhYYUrDqSUEVpSaTs	1	1	1	WT2	1109
2218	LMVePAPaIFgONscCRWyGaQQrONPAwV	1	1	1	WT1	1109
2219	hUibffWvgKcRBqbfuPvnGcOqVyUsZh	1	1	1	WT1	1110
2220	yMUvZfFzpvmQWOZHvrBFnvCgeNcqEZ	1	1	1	WT2	1110
2221	kNJNZHheeHXcWzVYbuSoCiKEsufiTf	1	1	1	WT3	1111
2222	HaQSdMgzfrbAsebFUEnouqSAZeiVta	1	1	1	WT2	1111
2223	bdnkNKsqRvgYcTZqRNNlMMmxZfBEzs	1	1	1	WT2	1112
2224	XDhguqpKFlPeYPVYNWMsDZrBFVkcZY	1	1	1	WT1	1112
2225	paUgivmZoWzHonJcWjiAtgDFhSnhPs	1	1	1	WT2	1113
2226	CvkbPcKRJVXHpnWkxyQfZNyxMmDKEI	1	1	1	WT1	1113
2227	stpJaVypNNTlwKvoWprapIRxohqtUd	1	1	1	WT1	1114
2228	tKyHZCEWbFFZFsbnQYNlXZIfnlIsNU	1	1	1	WT3	1114
2229	BjTMfHLsHEvQNrunjqxpxjZtFwHhUF	1	1	1	WT1	1115
2230	GekxhehbBYIVjvphOiXwVCjLOcymTV	1	1	1	WT3	1115
2231	fevRIBuoyoWHfkTvAwbshVFQKZOBDj	1	1	1	WT1	1116
2232	XLcpAaHLDuWILqJBwpEzdeylozzlea	1	1	1	WT2	1116
2233	rJRnMvmuJnUpDWeNzAyPjcrDQucIag	1	1	1	WT3	1117
2234	eMNVKDbKVreVOBQZwrOEQKCycakDqT	1	1	1	WT1	1117
2235	DSsFjaFjlRyQmdbHnzUVvWOaaKxLGf	1	1	1	WT3	1118
2236	taOnWRqVxkhELiPbaSqjAJGPUwrpMO	1	1	1	WT1	1118
2237	JvwfkiVBTIbYkXgjZOnnCFSuHTOiEx	1	1	1	WT3	1119
2238	AJZuoiZOlcvXQkKnKpBRKCtLGNoaIy	1	1	1	WT1	1119
2239	ZmvqshjXhAVNEaQxoLcsWiRXQQuFKi	1	1	1	WT1	1120
2240	fwpvrqgKTpKKAyaDRAkFdnhHTmfcPQ	1	1	1	WT1	1120
2241	TdRCBsvwrYbKeWHAImDTEIDBUdFvUG	1	1	1	WT1	1121
2242	hEOxbDPSOiwpeAYwmBoaNGOGipHcwt	1	1	1	WT3	1121
2243	QkwHjwiBvFMFRnIKzvdSIZrnNjLBIi	1	1	1	WT1	1122
2244	roibgjLEfiZKfMibMPDzjQnKhcMJNZ	1	1	1	WT1	1122
2245	ZvHeOpXyKHxRecdfttyZZdRzgoikib	1	1	1	WT3	1123
2246	WPdnPerkjyyyKvcXqfIKrWFrsHDdLM	1	1	1	WT2	1123
2247	JIvtqiMNxiQmXJTCfbcQbbJeaqYQGj	1	1	1	WT2	1124
2248	KTDQJkjDrToZuEqtfZwlyAZJwQuKOk	1	1	1	WT2	1124
2249	jYQFFylqhGwLpdrJkNHSKPlPHeNrnE	1	1	1	WT2	1125
2250	ktifltkXWJSRAaHUTEkrNJmhnEApkD	1	1	1	WT2	1125
2251	jYrQdxhxLVtJRIpYygRLarkIQDYmDB	1	1	1	WT2	1126
2252	plEhvEIozjfCUwuFzBbeZmDYXlLlpZ	1	1	1	WT3	1126
2253	ppjcCNPjxtrKIgIRUGhGtbxdhjIdjY	1	1	1	WT2	1127
2254	OWzNgHeEKjLXZABXyzGBKLqUVgfKEI	1	1	1	WT3	1127
2255	hcAYSoEjODDDSRHZXBlXZJAKuczFGW	1	1	1	WT1	1128
2256	oEfSnHIcHZOMuKaBbgZBkoMyuzlTcn	1	1	1	WT2	1128
2257	MSbHMevWqPDktcCJeozojWBiBWHYfG	1	1	1	WT1	1129
2258	cKYUvnfYKOGeuSnGkLuuKrpJSQvJMi	1	1	1	WT2	1129
2259	aGGFAXJnLctluWcuomNLrxVDKgkJyn	1	1	1	WT2	1130
2260	eIxHUrgduUHDyFrZZZpVPHzwUKLinr	1	1	1	WT3	1130
2261	tZWyDRGnaZsRHcwDDRMhODmEoeuVDg	1	1	1	WT1	1131
2262	vdPRaZCZFXXLsYijDbysABsnUBWwHm	1	1	1	WT1	1131
2263	rUpKFNqOAHfAoiOSHMJRuwbcZusxZH	1	1	1	WT2	1132
2264	DTZwxgXAuBWIWmRuDMbWkpNIjtIIPH	1	1	1	WT3	1132
2265	gKyufwtHqpIMRREiXbzWqfQiXBdMoF	1	1	1	WT1	1133
2266	cUZFBeNkiOALaPGEVPKoHTwJqCexlO	1	1	1	WT3	1133
2267	NehxaLMjqIrwDmAkKwpsDFUWFbRjDX	1	1	1	WT1	1134
2268	SPqpMzDbstgaYJfimUJAGBtLbkgUcH	1	1	1	WT3	1134
2269	YbObxaEdJjhCCWzFOiAXulIfLIYUIv	1	1	1	WT3	1135
2270	UuRzbOnGCKIwSYdwlpnCCzGfnCLwtY	1	1	1	WT3	1135
2271	scZkQZAjYfAIkZCbmfuieiQwaerQNF	1	1	1	WT1	1136
2272	MZeSrXaZiXyYAoFcgxpywOXJLqYnCd	1	1	1	WT1	1136
2273	yywLTAZGhQzLLluSqaWdPHnfyEWrSw	1	1	1	WT1	1137
2274	psPFPhAjxrDNxKdKCdrrmdMkZhAeBO	1	1	1	WT2	1137
2275	MfOWSAHWbWfVtAfgowcONLYcKkLOsQ	1	1	1	WT1	1138
2276	lMemcHYQDUysnGoDODJfWNMEbcBByl	1	1	1	WT2	1138
2277	zxYmEqqWOLvoTppprfdpcUQODBFnQu	1	1	1	WT2	1139
2278	iSyhGeQASKxjWdMANicWlAEjuJQNET	1	1	1	WT1	1139
2279	IKXmNnlxRWewxtWNJNIwEvybBhyoVW	1	1	1	WT2	1140
2280	OpzjrkXuTeVUhhJPfdtyoLZJVogGaB	1	1	1	WT2	1140
2281	gXxkoySVztKbsbvqwZvZHEJWWuqbom	1	1	1	WT1	1141
2282	aDctCLBCKzfrKEDadvVeXpyBoiqMTq	1	1	1	WT2	1141
2283	OyLzsxdIgntxguKPHrBqAqrrIvOzUF	1	1	1	WT1	1142
2284	fZRnnZhRRrNkKGFpbHYuQboQtCBnvy	1	1	1	WT3	1142
2285	NZuQSfWtXaSFNTopfnTbBPsfVAnZkD	1	1	1	WT3	1143
2286	uNBVBGhKSlsVMSSjKwIlPtJIXfduNq	1	1	1	WT3	1143
2287	tHrBJQpfsZKQXerMenSMJwGsquZnbp	1	1	1	WT2	1144
2288	odDXGqdSZfulguerKPCUoxycHVHUqc	1	1	1	WT2	1144
2289	kpcWTAlMrpVIcJnQQfeqSOEPOAuQmt	1	1	1	WT1	1145
2290	NDmtMXZSzmhQoejzzzPcIYcCjIEHwQ	1	1	1	WT1	1145
2291	UfrLZRqETemvibtKhfCPRXDFmDvJLO	1	1	1	WT2	1146
2292	uafRMIwWqPOaFihDrsWLllwVVVsbbj	1	1	1	WT1	1146
2293	iVdZDWFNQZgXHFNqBrusfccJWMohYp	1	1	1	WT3	1147
2294	ixzCyMgciShWZpdhBVUybsyGvgdvyb	1	1	1	WT2	1147
2295	nUjouAoesMKRKqWQLpzjKsTsYEyLmj	1	1	1	WT1	1148
2296	VQxpUZFrGSAPxwDJHRxMEZoYmRfFDv	1	1	1	WT3	1148
2297	YBbUEakVDeJPidGgqNAliLlXrjHZPa	1	1	1	WT3	1149
2298	hVnkqXcPUrrDDEITBNlkAneNLLqnIc	1	1	1	WT2	1149
2299	MJeGjEUwwIuJIjQoIMFuUcjFZoAQKu	1	1	1	WT3	1150
2300	VeDGavrtAmokmUlReGDdqmmBtuWLQR	1	1	1	WT3	1150
2301	jVJOWlNLhrZRzUPGtfPOkCZpNyRxTf	1	1	1	WT2	1151
2302	SQGZzlfsqxsbVEBjkfdLRJPwnwKTNV	1	1	1	WT3	1151
2303	rgOquMypWfleFORiTDBzdVIAXlZRCW	1	1	1	WT1	1152
2304	pEYaTPklnOGprkgUVGqEAUsxHrqorx	1	1	1	WT1	1152
2305	AuujRvIQdjNkPKIobGvczKbtcMQZSd	1	1	1	WT2	1153
2306	qWbfWisowqCgzzneTiwkOZrLXVbfpK	1	1	1	WT3	1153
2307	JnYncHGIzcUMtWLyzdGfElaDtaJaUC	1	1	1	WT3	1154
2308	JDlTLZlvUQbAeFEDQeudqeEDMuEwYh	1	1	1	WT2	1154
2309	alNAyAHQjKmwGHCiKoZNfLDEKlLQgk	1	1	1	WT3	1155
2310	hkUTUQebsiQhaOEIMvfmGyWzxHYmJu	1	1	1	WT1	1155
2311	bkzpzOOBzQPPuvGwBCwdxpNGotSBVz	1	1	1	WT1	1156
2312	myuFozYVhMpDhyZooXErzTOQYSSaxf	1	1	1	WT1	1156
2313	wRwDqbfuKvcoxDhtmhfSAmbidYvOfJ	1	1	1	WT2	1157
2314	TJmlCxKdmBeXKyZcCEaaLYEslqmRXC	1	1	1	WT3	1157
2315	HpcmYXGLEltUsdEEGQRujQFUijguUG	1	1	1	WT3	1158
2316	IewPnIFBmdvnTdzKdicsmTnAqaxLuZ	1	1	1	WT1	1158
2317	RoYEpIlbziHSVjkDroBgUPrijMTUvv	1	1	1	WT3	1159
2318	fumAAcglKPGePhlzfxpMNjSdUUmpyy	1	1	1	WT2	1159
2319	rWoDewnIgsVfcnRfTMSXWrxwZvqfsm	1	1	1	WT1	1160
2320	nJOnXlTyxVDEBtZFcPjTPJrVfpeqOc	1	1	1	WT2	1160
2321	snlelbHuYUivclrKIEKNvZxSDwTnBI	1	1	1	WT2	1161
2322	OzUTcoodaTrrAKcRZlwaTGUSMlayof	1	1	1	WT3	1161
2323	KWrqolQjoeYFQPvuMCOqSlwhQXbUcq	1	1	1	WT3	1162
2324	cfEwtGnJbxbQqxEjfNkkGmQToJNNeN	1	1	1	WT2	1162
2325	VrrAhexhvYmJggawYBCDxecCgrhEMz	1	1	1	WT1	1163
2326	QwVZjmLvUrpLBIxZQsgYpMrOWHXNRj	1	1	1	WT1	1163
2327	ryjvxfVYBoKcilPCcMWFKquLuffXmF	1	1	1	WT2	1164
2328	wtvyejeMesRwXcMBXVaqGfUqlpGWmz	1	1	1	WT1	1164
2329	IRnZjqpMynFpawkBmESjtHxAyhNerd	1	1	1	WT1	1165
2330	qjQQmTwLnSsqowGjvREcUsAAkKEBSL	1	1	1	WT3	1165
2331	tIZYzHklYnTnRGthIeXzdWdSCdzHqS	1	1	1	WT2	1166
2332	KTeqhPKGPDSBcozFTZFePQzMERAGQK	1	1	1	WT2	1166
2333	UphSzRtiNPWlwubhqipYDNuiXuVobt	1	1	1	WT2	1167
2334	ZEvemkvmwDadgAClqulKbIuFVeRqXu	1	1	1	WT2	1167
2335	yRqIQpKTFqgHMaAyhWvKtNQpuAVJwR	1	1	1	WT3	1168
2336	TMincDNRQtktXoOSRwoosHDIertdwX	1	1	1	WT1	1168
2337	WdbySwrSVZbsxCMQxBwqeBFnObVvNi	1	1	1	WT2	1169
2338	KpxTZjoBFQlcHSBBBNsqTZjrGqYBct	1	1	1	WT1	1169
2339	mSvCsRQzkHQAGIEMaUvvXVdxwYyqwk	1	1	1	WT1	1170
2340	cwPHwMbaCwDLetLEwMVnEFEDSMRyZx	1	1	1	WT1	1170
2341	boRrNQzfoPcmuchYjQHueIXwWnJkWc	1	1	1	WT3	1171
2342	bsDmzWeBCYTMvEkGEchaPBzJdcixaL	1	1	1	WT3	1171
2343	hpAVQmTlKZybUBYPNgGVMyVTMvUPgX	1	1	1	WT3	1172
2344	HhtssRxwxrLwiOhtroKLYZKUCzIScl	1	1	1	WT3	1172
2345	zSRuqSSrkVcSefjbwoGPKhMfZAyzNF	1	1	1	WT2	1173
2346	aRPtQzKStrRRxstJIScZHQqHlLLloV	1	1	1	WT2	1173
2347	LvBXqIqBfwYgWlPyRSoQHRUrXiaqfU	1	1	1	WT3	1174
2348	ZPsSPJwLoBGhzBMTVWZbAlPsUtyniA	1	1	1	WT3	1174
2349	ZiHdmniWFDutOcdDSLbZhMoWeRaPpP	1	1	1	WT1	1175
2350	uzXTmVbZAOEgyDLKFJJNkoxqgwJBCD	1	1	1	WT2	1175
2351	ZWvQITNvlaLiFxPmzqsHqHiLNsFVQd	1	1	1	WT2	1176
2352	NxWQCTxbqiamvNoRTQnXLidHGdGUwh	1	1	1	WT2	1176
2353	ftzIWKTTRRgVjIOeDxskKdgDcUBUHF	1	1	1	WT3	1177
2354	poQZqKjduFqvpRrCNzildZwOCwPSgg	1	1	1	WT1	1177
2355	gCfasQrYrLCcrfVRiJQkmqklNLpcfn	1	1	1	WT2	1178
2356	qbDqzXFswMvkAwOTCocOfiYuoKfIwB	1	1	1	WT2	1178
2357	zEEWODlUQVZkGjmTIjlrhkiMqbvpSO	1	1	1	WT2	1179
2358	epnhozErNcveRMIoLMWNXrpnkgeUcS	1	1	1	WT3	1179
2359	yxbJnkkzRIlTNVpRBfVoFXwOsOKApX	1	1	1	WT2	1180
2360	gCxnkqdJeIoOPTihRRJcsXzuNGXLaN	1	1	1	WT3	1180
2361	qzAogIjsRmZqJbiFPqGATGVqUhGGwZ	1	1	1	WT1	1181
2362	FWqZrWqOVZEdKtDcqPuGohkKhsffgW	1	1	1	WT3	1181
2363	BphdnSLqPjTcWFksLPobquXpTatBHX	1	1	1	WT2	1182
2364	VgfbFUmHEmvIbsLGeMAviVhsiPcXSE	1	1	1	WT2	1182
2365	dyKZPxvBZeMQCALhyltUpwKXfDTRpT	1	1	1	WT3	1183
2366	pCudupBQoHpakDabxzyFYUmYowFfBv	1	1	1	WT2	1183
2367	ppHOSRfJcqeAfkepArgTBsLkfsLVUD	1	1	1	WT3	1184
2368	aisLmfMXLsqbwynGtMabQPhlnCEItm	1	1	1	WT1	1184
2369	gkIvWiJFBkHFvqdEUvKVGoRBSZaclv	1	1	1	WT3	1185
2370	iGMWaDWvkKzJZFmKVsYXmEMYwYeIDZ	1	1	1	WT1	1185
2371	cfGckblLHLSdaLZqlQnGSErNnbLfMu	1	1	1	WT1	1186
2372	GeJAynpUKSxPGZjftxqgsVeHwepWPu	1	1	1	WT1	1186
2373	IXmQafhPwQLkhBwrnVxkxOkgfNVDuE	1	1	1	WT3	1187
2374	JzIOLIAuhMKNYcZbhgzuecdGoxtATs	1	1	1	WT2	1187
2375	MJcZVnwfctjfgHNuggDesBTsNPGceO	1	1	1	WT3	1188
2376	okLMYZIpXYMSkYVeBUasKiJaHQPFVa	1	1	1	WT1	1188
2377	uPMolKJmJCBwMFSLKSgtpYADOihCkL	1	1	1	WT3	1189
2378	pkawjPzsjjrGDKBrvWBolDeMtPIHQl	1	1	1	WT3	1189
2379	kpWwTOxMuLRMYnsUknoptDmHUeakbw	1	1	1	WT2	1190
2380	jsfJqAmcLRtaqUFImTypAHcVjaKQim	1	1	1	WT3	1190
2381	NXqoZYjUcTjbnTYUfHsDVTTppKuxBb	1	1	1	WT1	1191
2382	jPGKRqdBIbfMeBYuRNFXfcBpchGqsx	1	1	1	WT2	1191
2383	KLFEwbrWEkZxmjbvThbqRyRlWgzLVI	1	1	1	WT1	1192
2384	AeUYxbFxUksgJABoUXMbXynxPlSPqS	1	1	1	WT2	1192
2385	JjfsfZhGeFBmUwkLMKmbfPpnfiXMAz	1	1	1	WT3	1193
2386	kqsvRNQswBfykkCbyRrxVOqfdotLJv	1	1	1	WT1	1193
2387	jwCvGybpjUFRvyKUUyJuRfFbbwlMiA	1	1	1	WT2	1194
2388	VXspwEVpjUrKzBEodVOFLHTTmlxJLd	1	1	1	WT2	1194
2389	OXyfZOsoePClDgSOXkrOfPtgHwTmnd	1	1	1	WT1	1195
2390	pZlxZWEejHTuufOtPlcbcHvgjPWBPE	1	1	1	WT1	1195
2391	DbIjrbkNwwISZBpZGPqRPKKeDxnzNS	1	1	1	WT2	1196
2392	xcVZEJKXFdKWVJnIpFJszLKSFjSgRJ	1	1	1	WT2	1196
2393	oQMYqMGTGbvqHRbBGsKpApTaJPQOGc	1	1	1	WT1	1197
2394	QBQyhxEgNNzdnJqukIHSdpkqFRyoFp	1	1	1	WT3	1197
2395	OhJlvnEVyEggtvjuozmLZmwPfPLUej	1	1	1	WT3	1198
2396	usuVuwbiCKdfNzkTsoFkeEEWWSJvHI	1	1	1	WT1	1198
2397	BkFeakpgGLGqYzcyDySlTdYFEALrSE	1	1	1	WT1	1199
2398	PRrfpSlEhWPijdKpPyIdqAGqRYoEFp	1	1	1	WT1	1199
2399	AfETUmgEYlhHApgSfEnnBwybiVhfZv	1	1	1	WT3	1200
2400	DVKooMrxBzxDCXsvEdwPPHBAsdbxOv	1	1	1	WT3	1200
2401	gscuifhtmjgeChCeDWXtiSWWyqVInR	1	1	1	WT2	1201
2402	tqeZAdogzCthrmistrtXYcgMMTCuMH	1	1	1	WT1	1201
2403	oSBPvYpWBpGxnWtnWnlrDRiHgDlCrQ	1	1	1	WT1	1202
2404	eavBEOlFPaPOcMeRCDHZEzTufXyvoq	1	1	1	WT3	1202
2405	brLLciHUlDXWdnxOaZRZQjbNthSHZs	1	1	1	WT1	1203
2406	LDFFXYpqwkNeBXSMMnwoEpcvsEcrdZ	1	1	1	WT1	1203
2407	BJxkljhTQixlRTPFGCvxZNLCORLWdV	1	1	1	WT3	1204
2408	lsqqmDguQVSjSulPvMsoerCbITiXBO	1	1	1	WT3	1204
2409	VUGAJsgUTAiyZKnZJpRUqMshVCcEjN	1	1	1	WT1	1205
2410	oKMrDQEIIrSlYjnaBVHLaJRIwPPBCj	1	1	1	WT2	1205
2411	ciwmMQdSIkPRLRUQZMAaEAbMTTavkm	1	1	1	WT2	1206
2412	fArIhgcfsYkmRrRupbDImPFLXozgvv	1	1	1	WT1	1206
2413	WZTpKRXcbNXdAFphitQfEpWtGewZWr	1	1	1	WT3	1207
2414	qCexlrDPRAZwvUtxiYXVskZlvpgtnU	1	1	1	WT1	1207
2415	dPioCCicrZSdPtdngfzMpOIYjRkaGx	1	1	1	WT3	1208
2416	lDpsANneFNnNAQRvznkwTNuqPfTudL	1	1	1	WT3	1208
2417	UQPnclzBPqqIWKJddvYkxyvdTzblXu	1	1	1	WT1	1209
2418	BynHSVaHGaGtfbNdyOEOBhSHKxgwgU	1	1	1	WT2	1209
2419	JfrPVVNJdONalLXsbXepinLOiSFwPH	1	1	1	WT3	1210
2420	KPgSZkVSpzJemApoiFwJBVrrKAcHKf	1	1	1	WT1	1210
2421	ELnGEvDdFcuUhLhqaKNBRJpHhAWqey	1	1	1	WT2	1211
2422	gTJLmnEDsXtKzJhTzYUuKlcMrWpyKk	1	1	1	WT2	1211
2423	gexxwYzZtqQiLMRtgCRKJWxdKLAQQA	1	1	1	WT2	1212
2424	qLRgAZmTJqfAtupETecMcOHffsKXmr	1	1	1	WT2	1212
2425	SOrCAIxNoegmpRfDqILlkczhbWcLkO	1	1	1	WT3	1213
2426	kyRKvbbDRDfLboRbUaNnQlufEFUsSZ	1	1	1	WT3	1213
2427	NqjEPReLvIlqaaymbMctnftAJXfuWq	1	1	1	WT3	1214
2428	BHhRuaOeiUmLlelKNypppvwBcVUUXJ	1	1	1	WT3	1214
2429	bHlMwgefwgwuddFIbOxEZWOkXhNZPH	1	1	1	WT3	1215
2430	UxyKwVGOEktncdOFNTQYrGJnzYIvRO	1	1	1	WT3	1215
2431	rWwAzxygrWGBjGEtbjlwXGlITMGYTu	1	1	1	WT2	1216
2432	SxhnzoCXZoSNREkoqEjtTLSuHEqjIs	1	1	1	WT2	1216
2433	TidWVaPmVpnzoqSWnIZgraKxAZnmnh	1	1	1	WT1	1217
2434	WaZzFTatkajhyYeeAQbSARKXHaFpYD	1	1	1	WT1	1217
2435	ZqmcuMuuINTJWRqFruivWMrglnJWfJ	1	1	1	WT2	1218
2436	NsWodKHubhaeZZFvQFQOdPqkaOfpMU	1	1	1	WT2	1218
2437	FYSZyprGNkqfPIFwffhklKqPXGuSkY	1	1	1	WT1	1219
2438	qNViihLJKomCmgamcJITymMjtYRqRB	1	1	1	WT3	1219
2439	PqFPUrzgUsiPVbdnOnYeiGyhDLVUiY	1	1	1	WT2	1220
2440	AzTxGfeEsFZalunUrmwOdJewZNZBAZ	1	1	1	WT1	1220
2441	dVxvEMFLCZoxjSnkqHdAnmGWXZngji	1	1	1	WT1	1221
2442	NklosRnuxOkhuBhWypnQqOZcwZqPhL	1	1	1	WT2	1221
2443	TmhZGbjdqzMgYmOYoEHCFQngbfBQPh	1	1	1	WT3	1222
2444	iUYPhgwbWksgPbbpwzniKrdIhHpOIl	1	1	1	WT2	1222
2445	LDAvuPIhNvmWydzpijImkLGVNvuaMW	1	1	1	WT2	1223
2446	lZPemSMiJExKHHDlcOfevGnrpNyaih	1	1	1	WT2	1223
2447	jqirvRwQzRWdIRPxfblCEmbGNAFVVY	1	1	1	WT2	1224
2448	bvJzhbnKbkvWfzQNpmMAMqhURKYpnF	1	1	1	WT1	1224
2449	QjwCOelHXnSkKUSNVmoniCYgOxBmxp	1	1	1	WT3	1225
2450	jYgPWosmbCXKUswpuGRrfkjJtfTnvH	1	1	1	WT1	1225
2451	mvuexXXqOzSzygNEuaYzpVmkNWcNQP	1	1	1	WT2	1226
2452	SghPFwxeyVRpISZiTLMNhTsVTKJgSD	1	1	1	WT1	1226
2453	PqEshflzThdjcHXiSukUQvPeytyWvp	1	1	1	WT2	1227
2454	KWbIlHDSPBJsaEQKIAExEtMhWBOGJS	1	1	1	WT3	1227
2455	LGiSbUGjSjbvuVsYXUNvLmmELnKQZr	1	1	1	WT1	1228
2456	xmLMJlCeGDEGfzOtHlNfRHtJnhOZRq	1	1	1	WT2	1228
2457	bQoTuCaVkfyJRIxpAGIOXSMcHNDLDK	1	1	1	WT1	1229
2458	DDfjHNQVSyPeUkawjlvrAMEccTsOAf	1	1	1	WT3	1229
2459	asUAdsWdICIbPBvMDFvrkdXMABWbCW	1	1	1	WT3	1230
2460	qyHLKpZfwqnylLlnyNkaxjnpevALFg	1	1	1	WT1	1230
2461	kLcNmQGRmFfjSyONxUpuEUsVoHqrzx	1	1	1	WT2	1231
2462	fwQTNqOEaVlsbCIFLNOpVKDpiCnWDI	1	1	1	WT2	1231
2463	QxpMNzAiBJzhvTThChBvcOGSssPlFa	1	1	1	WT1	1232
2464	RwfgKFmWXhgmbqbTJlOPuxYWnDuPcc	1	1	1	WT1	1232
2465	nLKfzIjSJPpiIqwKGWtGKDsnyTeAjS	1	1	1	WT3	1233
2466	LTLrpNulfUsmkDRMeqwomMaXjrkhqg	1	1	1	WT1	1233
2467	hGMgmZTVGjeugznupvoqfQBMsEKSTG	1	1	1	WT2	1234
2468	qHELNtFrTtbONqakwsrpPOEhJJXAQC	1	1	1	WT3	1234
2469	FeJndntMzkUWKtITMkHDBmaLNoQkGq	1	1	1	WT3	1235
2470	UDiuMIRTIEqOpYiVhbjwSjmuyqTNbE	1	1	1	WT3	1235
2471	LcVEgrlfwPNCueImDWpvYWgUPbThFT	1	1	1	WT3	1236
2472	ABRfzJeNxzhgkcpDOAwdOFbeQUxaDo	1	1	1	WT3	1236
2473	pPoxJeOVydHIVXXLjxznhbFuxCvmXw	1	1	1	WT2	1237
2474	otcKmDvxTOmkDPfaWItxveymbwAGSg	1	1	1	WT1	1237
2475	koPdfYjyecrJFmwJPgNjtdcuNhIWuI	1	1	1	WT3	1238
2476	wZtqlXWiAQNnNRtsduylmJLCszAzWa	1	1	1	WT1	1238
2477	vfmFILIeepMjEYtNzuMRUNEgWidXfb	1	1	1	WT3	1239
2478	cNzMXUBuGtHyFaCMxtuVGCGDOUirOR	1	1	1	WT3	1239
2479	HaBrcKUwjYwkeOBKBweHEGURccGdok	1	1	1	WT2	1240
2480	fyyoQQdsXdzswbXZdppEkugokYZVfe	1	1	1	WT2	1240
2481	pWxbABaSbqDTGXZpQMNPfRxjmcVenB	1	1	1	WT2	1241
2482	EkderYMcuacpunGdTWIiemeroMYQxS	1	1	1	WT3	1241
2483	KfhRDDghxuKqvwtrIZMwphzmQiCCKC	1	1	1	WT3	1242
2484	nLyAZkfKaBFyrmcgQmYoZCAzgLeGyz	1	1	1	WT2	1242
2485	dtsklwTkKeoogsKBjKBnNmyogcIyat	1	1	1	WT3	1243
2486	FrWyybKacBHMjbtyyvHtiWlPjoGBKt	1	1	1	WT1	1243
2487	esTehijkBxfpOUjUztpMKrPxGvoLBC	1	1	1	WT3	1244
2488	UarZgHnleIbRPxWphEUDsPdYlxxBTv	1	1	1	WT2	1244
2489	hAOkztVUitaiYOmyCWWMPXmIrhbDVc	1	1	1	WT3	1245
2490	oyOamNiDjYXnDZpkhMsZKxNfcXTGgk	1	1	1	WT2	1245
2491	loqwqXhtvGyMFoDYralbtAGSoqNpyx	1	1	1	WT1	1246
2492	RWPfPFRZtefFuPZAxQWlLnByHeuero	1	1	1	WT3	1246
2493	vBANdmHPomIoKDvRVGOrhoMbrEmcOJ	1	1	1	WT1	1247
2494	ZWfuwfyteYXNiBebvGmYJnnuGDZOxU	1	1	1	WT3	1247
2495	EVTQJGOVsAeTbqpcinNYfKNOfdOTsx	1	1	1	WT1	1248
2496	rwZneIRpKxqcStKGTZOzkZJEHLyUpP	1	1	1	WT2	1248
2497	IKkGrkqtYBDrnbXYSdhVAYtihFLwkP	1	1	1	WT2	1249
2498	VToHHtjwBeHeWrHYQyBrsMjqPHwIeQ	1	1	1	WT2	1249
2499	YwhePwUSrfPnNniEQHJNVsaKIKCzWK	1	1	1	WT3	1250
2500	umpXKtqvmbpnNOsXESfcdZYNgoTvJT	1	1	1	WT3	1250
2501	QswFTMlYNwyDGXYAKDCXffqhHiyacz	1	1	1	WT1	1251
2502	WDsPzyunULXkHAxogJWlHXVPZAgoBR	1	1	1	WT1	1251
2503	RkqRtytpZHLPmigdvmxCjsBLjCznZy	1	1	1	WT1	1252
2504	WuYTMmaLYdAaFiQNZVFKKfBDZnidIc	1	1	1	WT2	1252
2505	YPsaJXMQhnfSOufAByEvtZVHGoirNm	1	1	1	WT1	1253
2506	aDUtDZlVRZarNGwTMpyMPNhRvhcjLS	1	1	1	WT1	1253
2507	VCsXQnmxLYUCgZagoSIoPrGJAmjoaV	1	1	1	WT2	1254
2508	abAjwgvWpkpPpvoGMEBoqpnSGDohAX	1	1	1	WT1	1254
2509	kdOuytGULkiwSQAzlSWQnEGjNEgeXj	1	1	1	WT1	1255
2510	xflmBUrWfHjmfqxDwEXVQtpwGDdLFv	1	1	1	WT3	1255
2511	iHlvDSrgjxfuXRFqFxyrOhbEXFUCwB	1	1	1	WT3	1256
2512	CaYmMFzrFRLuysvVuwXqndMfcUoktj	1	1	1	WT3	1256
2513	XWSKdnkSnkDwyNigQOKFTVwxaUONQz	1	1	1	WT2	1257
2514	KufybIOryKBOyPUYJRlDqTLHAxEVBw	1	1	1	WT1	1257
2515	cWTbXkhoWTmGzmgrghODMnTMuMBIxl	1	1	1	WT3	1258
2516	wIZzzqivyImGhitqvsPKQvOdFyVvck	1	1	1	WT2	1258
2517	eKeHsBCOZiTVrvxVtrikMwxGDDoxwW	1	1	1	WT3	1259
2518	XIYrDJRtllvGYOdvqOMcvXgLeFMZDp	1	1	1	WT3	1259
2519	EMdFPSYVGLcAFNaZDfGpeDigKSifjz	1	1	1	WT3	1260
2520	sIcCjNiBEkunlSLZEGvcjXGqAnlmHN	1	1	1	WT1	1260
2521	KLbdgmihVJDDVFKMguRvYgoBXFzslb	1	1	1	WT3	1261
2522	lBcPoATuFqeuuRvpiRMAFiBLOWXeOE	1	1	1	WT3	1261
2523	DTUSIosTJjkyCXKwgNnVtfKfAUFpVA	1	1	1	WT3	1262
2524	NHpPrJMtILjqEGxxxuKroKHMgWqkLV	1	1	1	WT3	1262
2525	aLaWKXicgUxTfUSuFBxoOflLTeiBNH	1	1	1	WT1	1263
2526	poynWaADDTEDpTQKkzImJcDruojEJz	1	1	1	WT1	1263
2527	GArwvxsTTGnwzKiLHHmWSzbBcCtgjN	1	1	1	WT3	1264
2528	MabgGFQZsmzyzYpqTKEguWZFkWgRiH	1	1	1	WT2	1264
2529	WkEyozEMeVeVBtxAsYPWAtRZQMfoVa	1	1	1	WT3	1265
2530	VNlOOJDGsxvIbIkGCWLrCDkGPNQxZK	1	1	1	WT1	1265
2531	HwzeANauhANZWNtPXlFBqpVXmoZGKi	1	1	1	WT3	1266
2532	wVzKrWiuwrtFCNGyNVDlVaFUqTjVlN	1	1	1	WT1	1266
2533	CKjBBRsrjNRuiDfXTSxMNlwCcLAtVN	1	1	1	WT2	1267
2534	IeyokPfAhrGWPxidqbOdpfBtxuaHHN	1	1	1	WT2	1267
2535	MNJHEixLhdesGlwNwCSgRQbZJSbokc	1	1	1	WT2	1268
2536	tWmRouLpZOXIzmzycnKvOwNgtYyoVC	1	1	1	WT1	1268
2537	TLjLJIdtpjeLAyqlYivEtjjJyLCrLb	1	1	1	WT2	1269
2538	AiVIukKZaRAsWdoDRaWvCDpVMxyApT	1	1	1	WT1	1269
2539	nWWggDaMrttRyPYVgGJMBjoDlsjIKH	1	1	1	WT3	1270
2540	fhvePfeHxwqhkmuEsXuDZlPCrcUIhK	1	1	1	WT1	1270
2541	zKnjaSbwxMTLpWPTQuyhTxDUSkBwcU	1	1	1	WT1	1271
2542	lQcdrveaNLNAlBknwpJTGrnvCgwFqe	1	1	1	WT1	1271
2543	MAMuljbaPODDHBePcbQJGTSnqZrmEm	1	1	1	WT2	1272
2544	OQofpRcikwkySunwLaJZKQlMIqjevk	1	1	1	WT1	1272
2545	CScJemEDNdpCxpvozvzVQiFYfwzKdr	1	1	1	WT1	1273
2546	iIhnrKUJWvBGnlmgImmWjKquxrRrWv	1	1	1	WT3	1273
2547	mhFwfkSFoDGvkgrXVeRfAImQzKelLm	1	1	1	WT3	1274
2548	FGUINgbFhoPGrOHzRnEZWkXKzfpoLm	1	1	1	WT2	1274
2549	FlkAjBkADQClvooFIBkieEPSfbcssc	1	1	1	WT2	1275
2550	zkbrRnQIYDQTIUDQGxAQqxZpnmBfxQ	1	1	1	WT1	1275
2551	agvMyioFSIuHkMEnSgYslcSBICdgtd	1	1	1	WT3	1276
2552	rRmVLFjOLJDxUZXmTLcEMPeimwhYBB	1	1	1	WT1	1276
2553	oeWMPrCpoHqGbOeqdqsWJBQFgpIWDX	1	1	1	WT2	1277
2554	WnvztOIFfHjACWCrZcsPeVHSIDoGUI	1	1	1	WT1	1277
2555	TTQpdsVKxauSqmSherqOyzaFkcNVji	1	1	1	WT1	1278
2556	wGdspGRmeaBGqmWqylWjbhYKaxGhmV	1	1	1	WT1	1278
2557	EdTNGIoOxDoXMSTxgzqgovojZGNMQQ	1	1	1	WT3	1279
2558	MiOOoUduKsTgIGxBtHRPSPshNcyhWa	1	1	1	WT3	1279
2559	mCWvzioJxdfVtYeoYzihAqTGmSnTXY	1	1	1	WT3	1280
2560	NOJVrDARusuYIGtZWfNPPdKaQTeMHN	1	1	1	WT2	1280
2561	XVRRPWDzXsXLNVWOosltTJEHQaQint	1	1	1	WT3	1281
2562	LqXdXrqeQzpyPcppOsEvgpIhFxfvaI	1	1	1	WT3	1281
2563	MWDvBkNWnQKHeBWfstaDBTggjKPtFw	1	1	1	WT2	1282
2564	egINdjGDpbSCdQyUFBHdTkMcsxOTzF	1	1	1	WT1	1282
2565	zpKnyNYApurglJgSNQRfhIUvyIAKtE	1	1	1	WT3	1283
2566	HNJFXPFwKbQmmFcIqthcpluJtNiEdM	1	1	1	WT3	1283
2567	BsXZbhgkwMgzNWxhWfpGiIixWUCDjU	1	1	1	WT1	1284
2568	hkluXOlBVbcnhXcUjwkOVDlSKEnCHx	1	1	1	WT3	1284
2569	dOkdrsiHOUYlLbUPbCnizDsjQXsBgT	1	1	1	WT1	1285
2570	ejqHDTyqGUgkTHypBaoeVFnCVhlUWZ	1	1	1	WT3	1285
2571	UOoEccYiwVGcyZzHvtdlXWlEMQKGYb	1	1	1	WT1	1286
2572	GvTqPzMjACXaZYNnbJQSRqDPISbXDC	1	1	1	WT3	1286
2573	MTwsJtPGTUdKgUtSdrOMlBBpskWOyz	1	1	1	WT1	1287
2574	rKyCqtFspwErAXNjgLhhqXyQHtVjIJ	1	1	1	WT3	1287
2575	xqaWFGoPCmuubLbiqlqBLyTdUmbSvi	1	1	1	WT1	1288
2576	WInMECcHwZYjoLibSaIREYNRWAGQDD	1	1	1	WT1	1288
2577	PBiIxncSiDUAOElDQHfQRLkytXDdYv	1	1	1	WT2	1289
2578	soatnpiIjUzTcKSTyxzxZkveBcyoss	1	1	1	WT3	1289
2579	LBkcvxAnqOKsXMzXEYmYEXIDFgGwsi	1	1	1	WT1	1290
2580	iOLICRuamcpOmjHTNKjUQTMqNIhpRN	1	1	1	WT3	1290
2581	ImYjPONGkfuaGIAselaUBTlQUlkhEy	1	1	1	WT2	1291
2582	SMEFXVcvdgwHoggLMGxQkRBlDNoTKz	1	1	1	WT1	1291
2583	RMpVsGtaiSzvBUydycGEJereXttJKW	1	1	1	WT3	1292
2584	yjLvEKtpyyiuiZuvOuWpnNzQujQWFc	1	1	1	WT2	1292
2585	eZfZCcEiGlDubSWNTJtgjuWwGlTzru	1	1	1	WT3	1293
2586	rfdxSISVlSiOBNyaNLjhqnfZpADfBp	1	1	1	WT2	1293
2587	KwQKbgruWhEsYZDcRNXPEpATNChRAN	1	1	1	WT3	1294
2588	CkzqjGtVEpcWmUEvVMdqlHulfxJQwo	1	1	1	WT1	1294
2589	sBmZeOiWiNvWIsEUUoSktpHDpaAYdZ	1	1	1	WT2	1295
2590	OELMUpBrarSTUeSbLqFDEVNZeThpza	1	1	1	WT3	1295
2591	lZIDIhCNUxQIlcDTZXLLCBvrBffbBQ	1	1	1	WT1	1296
2592	jDKfxsVPACzJbWGJzyQmwWGZYxrwJh	1	1	1	WT3	1296
2593	JOaOxsUUQGYpdidEwHFOoSiOpxzxfy	1	1	1	WT3	1297
2594	EFWAvACwrkEQmAYYRbsQvGWrphlbPy	1	1	1	WT2	1297
2595	IGYaWNYrdwZbVhOTiDSDBNIexZAMIB	1	1	1	WT2	1298
2596	lMfooxhDaZbIWgWpdzkORMDUiIDZTt	1	1	1	WT1	1298
2597	JgSOSQuSxkiGgrTifrlSclUJgPoYKu	1	1	1	WT1	1299
2598	gSKYFsWuGrQYqPaAaENkjAjpIKatQB	1	1	1	WT3	1299
2599	AfTxonLBOwlsrrbQnDiSqshNtVrhmA	1	1	1	WT1	1300
2600	xNRKZfdqYWsNSEqemdHXASZxStDXiA	1	1	1	WT3	1300
2601	VKfbBqPlSNeBvWvjBjezlCWEVsShTK	1	1	1	WT1	1301
2602	rSfWUHHOmFzevfPJLqnCIPZHLgVUWK	1	1	1	WT2	1301
2603	bKqqpZVjivqpgaxjaMXzolifqwNdoq	1	1	1	WT1	1302
2604	BCkJkycNIbPzGTBwBdZclJBqZyqGeE	1	1	1	WT3	1302
2605	AUdUIUgqXrnKWTUauxTUlPYOcCtuWt	1	1	1	WT1	1303
2606	YoUAMCxyuqFoGxLkYeyIkloCNxSGfS	1	1	1	WT1	1303
2607	IMtTqNjOePHYJEVqlltbjmpLRsQmzw	1	1	1	WT3	1304
2608	FhXWHegwHJjLVThIuqQNQCWAEotHRE	1	1	1	WT2	1304
2609	RxawuiDrQmWhZnlHGCYPffPYhbZLLW	1	1	1	WT3	1305
2610	vkpDBshSrNqaTRgarUgmvXVhpvcTJK	1	1	1	WT2	1305
2611	OJKKBwjTkAsaoKJMfqNwHQBDVMzaZL	1	1	1	WT3	1306
2612	gltQkUpJhlPZzfNpXcXJpDzyzNqCPq	1	1	1	WT1	1306
2613	NwwWeQDBYUEMmycyiugkIzqRMdTtDp	1	1	1	WT1	1307
2614	pNBGMGcDjfoXxzhAOahusYwGLkQWrV	1	1	1	WT2	1307
2615	yVSuiWwGlrLTzQwzccOtFJAsroXGeM	1	1	1	WT3	1308
2616	lmCjCiBBkSsDEuARIgmHOMlhmREYXd	1	1	1	WT1	1308
2617	CEOmyakGmNJZLggOmjsTaIRYiHxThH	1	1	1	WT2	1309
2618	mbGYsKLFJtKjBvHJylrQtWwRIrMiEq	1	1	1	WT2	1309
2619	cCBuahrzvzgYaozsQrFFZrKfHxdyrx	1	1	1	WT2	1310
2620	qllnBSUHjlEnVJYPRCnSquYKBrrPbc	1	1	1	WT1	1310
1621	FBSjqPnEMhtnETPNZFgVAKDJqBlpLA	1	1	1	WT2	811
1622	nnnWZDCndJgmNPwiSzAvicxNQrIKMF	1	1	1	WT1	811
1623	iaOQKizDgoaIrgMaeevEHAuGoMJJMT	1	1	1	WT1	812
1624	CxqisNqiowOnRjzsxawGxQCPzazLOM	1	1	1	WT2	812
1625	AYbGjLUuIXrtGAwwjBzoAiOCsALanb	1	1	1	WT3	813
1626	lJEYadtlJuEtphaUucpwUQuxCpdmJW	1	1	1	WT1	813
1627	RspdLXLjJJHOAxjLaAdlAwSnXOdzCc	1	1	1	WT2	814
1628	NgsxWUIFhefAfsNKnCUaBRyrQRNFfA	1	1	1	WT3	814
1629	SkXLStIcQugfmaWPDSqHQzznqQWgLV	1	1	1	WT2	815
1630	FQCJZGkGAZZBojHkYPbaFKwKkqHiZf	1	1	1	WT1	815
1631	PsJCUOMRDnVbtEnxHtgevQgbyGLMgN	1	1	1	WT2	816
1632	PVAciROnTCuBiraHaVriMTOrLIwVqG	1	1	1	WT2	816
1633	iARbnupdgZxREkAdccmIlrmdGEcBNe	1	1	1	WT1	817
1634	QmurzFkCaCxzehTyUyQjWXFVyruTeX	1	1	1	WT1	817
1635	sXZZHKCAMNVcGIHBdalMmsSUdHwoCt	1	1	1	WT3	818
1636	JEvAzasxCoCpZoVicjbGMHHWkrFxZu	1	1	1	WT3	818
1637	ZEOyifoYXgZRznmlUuEXBgNtBHYKDh	1	1	1	WT3	819
1638	QwZcbglgdepFscgowNvxFyuzEXxYet	1	1	1	WT2	819
1639	WMKhuDVrkGBawXVVzcCaIVABbDbThJ	1	1	1	WT3	820
1640	GERHfywihcXOJLPSdvcDYuhPxxChov	1	1	1	WT1	820
1641	bnRmbbKHTpwKxZJVPUGpCyZAcEzvvZ	1	1	1	WT3	821
1642	xqgIcGFbnZeQgToFWtQAOgOvSQsbNm	1	1	1	WT2	821
1643	mZaxFPzxWNsNOKpnYATKyIEdUNJuQd	1	1	1	WT2	822
1644	sZnrjfVbLLNdAiuzieiVEcrCcbybkZ	1	1	1	WT1	822
1645	IGQteQyuvTaElIQeOLfgYinaWGoRKS	1	1	1	WT1	823
1646	TjmRDESZMiAvGoNGecGOQhMwSMshbC	1	1	1	WT1	823
1647	mCaPDSJxxjRsIXOkclwJSUmJyMsnwZ	1	1	1	WT3	824
1648	sAbtftSNjacroUOSRIyhJdXjQPwlCb	1	1	1	WT3	824
1649	TiTZtAPtDaCwYCjlEtSbnUkBzgCAoe	1	1	1	WT3	825
1650	ZOsnwwIlqMdqEgivsxVMJSwhXkcAVY	1	1	1	WT2	825
1651	XokLoSAROHXFvTbkPNyAJcEclNBTef	1	1	1	WT1	826
1652	puyrgemIdZwuXfZRPLEOEMWkAMOLhq	1	1	1	WT2	826
1653	SYiloNwxBMWJIjcDcupyNpMGCwUWjF	1	1	1	WT3	827
1654	XDsDtYckicWpySqcGAzFNjAFbQANcL	1	1	1	WT1	827
1655	fffwKbxGLDEppGdrpFRhzksOfzWfKJ	1	1	1	WT3	828
1656	RhzNYGxsARJHwupjDxmLMsVeUJdqbS	1	1	1	WT1	828
1657	HPGntuNzJdXGqXteHWKjXHzmojOcBv	1	1	1	WT2	829
1658	CnzRwrygEWEmMUQLWsgmORAXLsjRof	1	1	1	WT3	829
1659	pDVooryRBDfVksLMpStKnFFhdyhlNP	1	1	1	WT1	830
1660	HWPoLSUnLHYFrnbfibnPEZMgImrkjx	1	1	1	WT1	830
1661	xZWnIEttSJmNLFGKjmTDQFFQJbpuTr	1	1	1	WT1	831
1662	pITzcIoVhlhkMBxWeqmTVheGzxsomy	1	1	1	WT1	831
1663	vKktMgTHggQNoxVEclVMiUObLOGEQV	1	1	1	WT2	832
1664	YECzryYGeloQKJULzmJXfpnLWxwsGe	1	1	1	WT2	832
1665	tEoSmpJrdRcgerjjIOidZDPzmAgini	1	1	1	WT1	833
1666	WpfQnZKCgWsnplmgUOmjbSNSKVhmoX	1	1	1	WT3	833
1667	RlnRrKedFbnVGjvZJmbLLaZcqrQfIF	1	1	1	WT3	834
1668	ilWAcEHhUwxYtutuZsgkGxGLadWBZd	1	1	1	WT2	834
1669	lxseArTKVxggAXaeJItiWXwXHMAwWb	1	1	1	WT3	835
1670	ONtvVmCEsQxpMYrJYsSSuwVWRbizGR	1	1	1	WT1	835
1671	nCfIayclKyRLSRGsVJVKAvhoDUhiAL	1	1	1	WT1	836
1672	pkUEvuSTfYzuiEXEGRiyGqXqvjSTwW	1	1	1	WT1	836
1673	okflcVVWLaCkitYelmrGWJPQODkOZu	1	1	1	WT1	837
1674	iIUcgfqborHVVsalppnMymWgHVRpXs	1	1	1	WT2	837
1675	CgLisSBySPQWGZnOWOsIUIhsUFxAsK	1	1	1	WT1	838
1676	RIOCAQMjzJCXkGwRKRPuLjJmHHHKuB	1	1	1	WT3	838
1677	VguSQsiRfqAmYnPJTsGSKFCNlUsyJo	1	1	1	WT2	839
1678	DmXXHDrQneyqQeHDKHrBWVnSBlQDTY	1	1	1	WT3	839
1679	KQhzMyJWJGfaYGGxTJLFjhyZqluCBA	1	1	1	WT3	840
1680	cQCuznNoOCbxIrNaNJHleXtKxNaZFZ	1	1	1	WT3	840
1681	pzzpjkaXyfmruLPeZYnINOQBWRddiv	1	1	1	WT1	841
1682	WRcWVAyNjyiVLLuQUFLWhMNdElaVgk	1	1	1	WT2	841
1683	kIRgERABYNDErZfHbOyKXjmniiHqMa	1	1	1	WT1	842
1684	dqYIPRaLnXKUnqDkusZsDmlIWffOeG	1	1	1	WT1	842
1685	oLwubaaVGfsHikkhpyhVfCFCYTbhMw	1	1	1	WT3	843
1686	JEdRBjpofIKxzFnIqzzBNUUSPpBghN	1	1	1	WT2	843
1687	JMufhpGvVMUsIvpCTmwyIPWpsYfFRC	1	1	1	WT1	844
1688	TngMSybIbHnraWYvhIzNTUWevuJopp	1	1	1	WT2	844
1689	amEekPyybMCroQUVxuzjZilyZRxyMT	1	1	1	WT3	845
1690	yVAcaHjcJtDWdEbQeLHqEoMhaboCAH	1	1	1	WT2	845
1691	NkzBGAzycwGZMsMEHNyWMoffNbBftt	1	1	1	WT2	846
1692	MIDyClWxdyylInyWGdRCmTzLhGUNeP	1	1	1	WT3	846
1693	sJYBPozJLmEpmgrJDOhhoPhILysggS	1	1	1	WT3	847
1694	RwZJeVzNPhtPKEXgRthAvPZiEAgoyv	1	1	1	WT2	847
1695	YmeCIRyfsUZRUKebgctjabhRUToJoE	1	1	1	WT1	848
1696	ynzygArIFZqtiwHniSkEaiAptLFMTB	1	1	1	WT3	848
1697	eVgFPXTuvjDKSMDFlOQwfihicLiqqB	1	1	1	WT1	849
1698	mHYGwxjPffJFJbWkMLkhVheezYFdyD	1	1	1	WT3	849
1699	hKNYfTXTUqLOLivWgtTlPJTwoNSidg	1	1	1	WT1	850
1700	ojqAzzBekdDotMmhdAoFBDcrNLuvbQ	1	1	1	WT1	850
1701	XTWwlupQRsDAbuCxWPIpOmecgIuhYc	1	1	1	WT2	851
1702	mQvWtTJyPCPWUXVuJsoaULSauPejqv	1	1	1	WT2	851
1703	OYevYDFvaujHYaTSaXpkMtAxmkwNWt	1	1	1	WT3	852
1704	rZnpPfMCAkDuFSUMBflmAYZpXkyPlQ	1	1	1	WT2	852
1705	TuVpxxIzgtFdvFYXSjalZQaPigAbZx	1	1	1	WT2	853
1706	XgcJycNrUPTEDryxeineWfUguDvhxb	1	1	1	WT2	853
1707	ggQTatAWOpeLOREcPSxawltufuGXHO	1	1	1	WT1	854
1708	bAmErUnJYUZzowueSwUGsouOQamgYD	1	1	1	WT1	854
1709	hzfwVbrbatYOMSKAUNzQIvdoTiBVve	1	1	1	WT1	855
1710	LbKyVdoWtHcIgOmKCPzoiMymSkZBRO	1	1	1	WT1	855
1711	sFILULmmyWhVqLGeKsMRmFVzjRiLqV	1	1	1	WT1	856
1712	rSeFhzvRRLdxmUlFqKGznWSFtCVKvg	1	1	1	WT1	856
1713	aNdpzZMWNvqzQtnbroiYlgMvvkXZtX	1	1	1	WT3	857
1714	bnRvQLFRTLGFpJleUDEclbLXXvrQoi	1	1	1	WT3	857
1715	jDzvevGpszgAHgKNVjczJaQnvzYlzS	1	1	1	WT1	858
1716	disodaPpYdEIttZAAmZsgAyWVYgVCO	1	1	1	WT2	858
1717	tfIMrdTSkNEJvJZRItalKOkwFHhJQo	1	1	1	WT3	859
1718	AbKjPqydcsVoIeFKQSFZlnkrrugirt	1	1	1	WT2	859
1719	DwVNdADjvNGejALSABLKcnUdYnxJjh	1	1	1	WT1	860
1720	jvaTIsomxExNTgsingyawqCNOjFoGf	1	1	1	WT3	860
1721	wkWEsNmelvgwysZzqJJFYPNKaiKrUx	1	1	1	WT1	861
1722	HbHbZkTcZgDKrXGGQkzMIsIcQtDFTf	1	1	1	WT1	861
1723	mqHbSrdemKOAhSZFqxdiOiQoGssjWL	1	1	1	WT3	862
1724	oMCaYZwWiWAQwPZytxpWcGOxiAIqFs	1	1	1	WT1	862
1725	FyAIAeeReaSZuNngwrkbewarVXWDlB	1	1	1	WT2	863
1726	bvTqqqtNUsPCXhZdFcWqTEhwrPnDWo	1	1	1	WT1	863
1727	dOHHDxTTKbjSibBnMXUYJKKLKNELSg	1	1	1	WT3	864
1728	mErMyJHnbGbajqKeOLCCrSqNgwARNG	1	1	1	WT2	864
1729	CoGVvkuVeeizveEQUXEdJeDedxdhDj	1	1	1	WT3	865
1730	UyoRyVGhVtUGOiEbPyYDJaFjEqZDBS	1	1	1	WT2	865
1731	jKVFFCGzAOhExNVnyCOaMFAQoSnapk	1	1	1	WT1	866
1732	utrRYabbhjJKcSZmhGoLACAvPWUaPf	1	1	1	WT3	866
1733	ZIkbwExZXsuDZaINRNaiWYHsQQhEeC	1	1	1	WT3	867
1734	WoUjTxRzjdMkNatZiCTmVnawTHLhEM	1	1	1	WT1	867
1735	zXfUPHgHqgcuFWrphJRmpKIWNPCRSL	1	1	1	WT1	868
1736	SUtoxgVSyXwcdSOrOmpuEOxHYlTRVt	1	1	1	WT1	868
1737	pzXDnioxJDydbJSLGyEqRlirgMIkwR	1	1	1	WT1	869
1738	vcidLewoVjAlRVDxVDeGRvJZTFFcpJ	1	1	1	WT2	869
1739	gMKNBfyLmIhGyzJdfQRiNxnxZrNUfj	1	1	1	WT2	870
1740	olYgGwjGUfttgaZuYjYQKSkJYUVmlb	1	1	1	WT1	870
1741	OHhlXanPyHANAaLtNEcUZUNxEhjCze	1	1	1	WT1	871
1742	AtnfTNKpZbjZQMSEyIILhigIjWHlqb	1	1	1	WT1	871
1743	ZXLaLgkrGicudWxQiVUWIafoHJdQDP	1	1	1	WT3	872
1744	KqSZlrpAQQUDRyLcRdmPuGyspZDpuC	1	1	1	WT1	872
1745	sxSBJBfBDUWpZuWLhnyOwMmWqphEqB	1	1	1	WT2	873
1746	orrWMquJRRFwEeTKiUAKDMgAELIHpp	1	1	1	WT3	873
1747	GsLOUUEXKtXUtjpGMdKroWYNAXPpYk	1	1	1	WT2	874
1748	UpPKVtqEWJtJFCAjTIWjglHAqrZwVy	1	1	1	WT1	874
1749	aeyOIwMsXZKwyVscdwFTUcohAYyDtZ	1	1	1	WT1	875
1750	lPsVcsKCNUbLJczRHCJPqGjJdOOFyb	1	1	1	WT3	875
1751	UADETUVqJnpiyaNjuIgLUAFXVXFuSO	1	1	1	WT3	876
1752	autkOyFTfgSDVhhxdWahkZOaRtZDAi	1	1	1	WT2	876
1753	uQFoNaOmDGgYpHILYKLoEptpBOtsID	1	1	1	WT1	877
1754	oBdgofFcKsStZeSdwbcDMEVhdxrhlg	1	1	1	WT3	877
1755	aSkXVdCPyrlWOxCHfimMqjxqSoixZd	1	1	1	WT1	878
1756	iRggfLCEHAUnCqhiRMbLiUuSfGrNQr	1	1	1	WT1	878
1757	MjZmEaigKWDdGjRGWHqJPLBCaMeQkm	1	1	1	WT1	879
1758	GebyumoVnplpzKFoTTEYGlKfXtxkmq	1	1	1	WT3	879
1759	XrgIBnwkLyApgADeoWvvdRAXllYoTb	1	1	1	WT2	880
1760	glNtsaLjQkClAtPDHyOtzDUDjzzOzZ	1	1	1	WT3	880
1761	pSlhDRZMOFGojHZoMLiCAOZhLgPfau	1	1	1	WT2	881
1762	cbqAFhjfkStuDANdJALDIJlFjCfGOB	1	1	1	WT1	881
1763	EFxnqxnGQrjdNPkuEPimCsxBUYqcJT	1	1	1	WT1	882
1764	sJEpcoZyryvNINAjsWQLFlNWwrvVDB	1	1	1	WT1	882
1765	QWVthLHrOHOUeDXRJreNjucCqjLViv	1	1	1	WT1	883
1766	EhVmUCaQhDaLuaVYUNQreYKJqHqqlQ	1	1	1	WT1	883
1767	sfTQnikXgfpxyurcIemmhBzZdaTnVS	1	1	1	WT2	884
1768	VdOjMcaMUBmTmwmLQLXTZIroDNmdpT	1	1	1	WT1	884
1769	ogCQJIGwxEsEnyevPaQyrhDExYuFRQ	1	1	1	WT3	885
1770	RfQHVLgLfldPJBURxjucVzKCmBPaid	1	1	1	WT2	885
1771	kdEnZKJmuPeAziXrAgEPOBqJRmOULh	1	1	1	WT3	886
1772	vgPtetGdaGeJtqjDNUAVqZqwDLaXRY	1	1	1	WT1	886
1773	DEqCveGvlgJEwWFnhsyquEtzeaSELp	1	1	1	WT3	887
1774	xUPJDyxnXrWKvapLhWPEzweQjkVEMD	1	1	1	WT3	887
1775	VXTXPZbOLdZpmhLGfrxZuWkXNcWOiP	1	1	1	WT3	888
1776	VzeTcACAzavoeJSkuziBlzxaMyPKUP	1	1	1	WT3	888
1777	HfikIBCZHXrwjaRKGKlbOAgqmDPzph	1	1	1	WT1	889
1778	xnahQbuvkzVTQWgYTZbCRYWiQLstpv	1	1	1	WT1	889
1779	jeUuVcVtRIIdJYipISIEHseZhNSHLQ	1	1	1	WT1	890
1780	VMzbsVpqAnYxXhleQXTdNTXAVhMZsx	1	1	1	WT2	890
1781	ZHRlBbZZFbRDFbPtqxWWgTRCrSIaAo	1	1	1	WT3	891
1782	ucbnzcqXtbMFwLzVOKmkxFRlRPHDSs	1	1	1	WT2	891
1783	YHDqoYvomcjDmSokmlukYaZnIXnLbY	1	1	1	WT1	892
1784	DOyZXwbCnlmZRIuJEHFndnVmPENSKC	1	1	1	WT3	892
1785	mfFiOrBKVzVCuCrIwmhFWrhujXdeCB	1	1	1	WT1	893
1786	SqeIxojSxKZdzGckmEeHvnJZiEmPzT	1	1	1	WT1	893
1787	uKMYIsDeKztWnYyGjVEQVhgUDHxRQT	1	1	1	WT1	894
1788	feSmcQEINHSUWOcpkJQMCERnfioIaM	1	1	1	WT1	894
1789	EZymxzozemDAcSloIiIIfEdksrUDlD	1	1	1	WT2	895
1790	IpplnBERQARRyaYDqHckzSaRhoaTJV	1	1	1	WT1	895
1791	bemmCiSVSvsLerVpWhKssjXDYeqUnd	1	1	1	WT2	896
1792	kyKPMTDVwbtrpBiartKpqCuwNxDNTK	1	1	1	WT3	896
1793	ShlepJlAEHENUAAVhisDaCUfbejYAc	1	1	1	WT2	897
1794	HRiLcVoQBiMywwFqdtouUPccfXofIQ	1	1	1	WT1	897
1795	lKqFCeQWDGpGhjRQemhfCeAfmLbzMY	1	1	1	WT1	898
1796	qEzGgLbGCAlIbTNsugpxjxDvYvRshO	1	1	1	WT3	898
1797	aMVtQtczqxWJonOuvyXZeftkAObkGp	1	1	1	WT3	899
1798	PRsadaihkFQKpLZNaSvtbAqXszNydd	1	1	1	WT2	899
1799	drGmzajlmIsVOJQZupivogcvZFWNJq	1	1	1	WT3	900
1800	chLrbCGoHBJCGUwFNfhnGMjSlzXKqn	1	1	1	WT1	900
1801	lWLLBjlslPJqBKwiPTyIqoNNXvvddY	1	1	1	WT3	901
1802	TYSrAazHjntTIecgeatfIuYzyNLPBo	1	1	1	WT1	901
1803	whcIxDDQfkctQbUxAkCxUhadPLtpZi	1	1	1	WT1	902
1804	NLixlpOXqNUrOTCwFNERXmMikJWbXB	1	1	1	WT3	902
1805	DExYclbGedDxFOMgPCndxSmZJvOZcu	1	1	1	WT1	903
1806	kEciiJDEBLqxwbXliEnHnRdUXyMFUT	1	1	1	WT1	903
1807	DrRWtkHtVvwEPPlYVLQkCAoTalhBTY	1	1	1	WT3	904
1808	pdhQHITKAFHuuBPPLtYsciHAanYsyW	1	1	1	WT3	904
1809	snJrxqNITdqPEncdBZbMDpgunGZyKv	1	1	1	WT1	905
1810	XcMCiOSmOmEZPLxTaPcmlbbLhRshCV	1	1	1	WT3	905
1811	dUDbvxWkowXqJFYvLdNeJxFyzccAhe	1	1	1	WT1	906
1812	dARrTQSBcieqSJRXbUdgvaVeYATfcf	1	1	1	WT3	906
1813	qvyBXpuxdDuoejNsSxaznSNSNEQulL	1	1	1	WT1	907
1814	ySpBTDxaEalprPEcpkLstswMlHOvrb	1	1	1	WT2	907
1815	unFKdbkgtyDEdedKojXVnAQxpcNJQy	1	1	1	WT1	908
1816	kwlSRDmFSbNtzsSiIfIeNFcjIzojfj	1	1	1	WT1	908
1817	BVyeIEkEWmKmFlgaQmixTIKoVIpKGU	1	1	1	WT2	909
1818	hYHCmfrSsStVxXCQhpcTQqamHXLSCi	1	1	1	WT3	909
1819	YPUSgWlgDVrnbxaxvQQSDvAzokgztx	1	1	1	WT1	910
1820	DyuHxTvvuzbQwrTiKXKkteIhCQLcxi	1	1	1	WT3	910
1821	LddtxtrOJhSqSABSmVzGzqAVrMHlbD	1	1	1	WT3	911
1822	WQNpvaHyBlSKOnLZzDWRxkueVtEHhu	1	1	1	WT1	911
1823	QnVbIOgtVeCTCTgaprIJjTXBzGILoO	1	1	1	WT3	912
1824	utosDWVnVHVGviKZqjaBgNqjFexGmu	1	1	1	WT2	912
1825	zbXYoUdKMGBYbkbYOAJOjtxQOKokFJ	1	1	1	WT1	913
1826	gwVuTETqRuWTxujVCPvFDtKHpOgdXl	1	1	1	WT2	913
1827	HBlvJKbupJmEVjQEtCWtCRtSNrhLHJ	1	1	1	WT1	914
1828	tQTWiBOFTDVqWDKFgvdEWxRbTFfzEi	1	1	1	WT1	914
1829	LtIRIIxoijzCEhiBebFTCKsPpkrwGB	1	1	1	WT1	915
1830	hhvNNKnfrvvfPGRiTOUpXeUnigDhim	1	1	1	WT2	915
1831	iJeitsBEjejBdjnUuCxKDlfAtTEccJ	1	1	1	WT2	916
1832	daNyfBJMZwtvsiCnrQBXBRSzPvKHuF	1	1	1	WT1	916
1833	YUBRlPLxMczxGWNkhwMTglHhvRbIBt	1	1	1	WT1	917
1834	KHjNCIEQBoBTAmaflzhncZhiTXFBGq	1	1	1	WT2	917
1835	WYZJFXuRLQCshFWCnOPoXrpcYRazMl	1	1	1	WT3	918
1836	GJZTOjONlIurdEOopKZXcFivgArmGS	1	1	1	WT1	918
1837	YVyGakWWHzEqikFxjiQTUzJDhkpGBY	1	1	1	WT2	919
1838	VWNhZpsAzBQawGycktEGkrjCmCedyI	1	1	1	WT2	919
1839	mkVOoSINxpuRODzWqziaqqVHwPNwWF	1	1	1	WT1	920
1840	MeCnSeNbBHlAvnzJKHGnrfxwicQXvJ	1	1	1	WT3	920
1841	QSIbUfTgLEvEduFlTSbbvqTMlhOGRU	1	1	1	WT1	921
1842	eQHrBczzPCDaOREFSHAuWAgirWDUcz	1	1	1	WT3	921
1843	oSTvuSChBgHNmJVfoVXVPevUGekENH	1	1	1	WT3	922
1844	FferQdkrBUHKozxpkfGpxEdAWIqJXJ	1	1	1	WT2	922
1845	TWEycvbKBUussBeqNQJLBMYDEXVzds	1	1	1	WT1	923
1846	MGhRGVqzHnMEmhvUqzSpxjPqvWcJNA	1	1	1	WT1	923
1847	bgsqbXqJfQYJZimxpdlqcGJpDKfGoM	1	1	1	WT1	924
1848	ywmuYRuJZHVqJcBuTUBhfRnIQaNZZH	1	1	1	WT2	924
1849	cNcZAcGXDCiSAvxAruXplNwiWzZWeg	1	1	1	WT3	925
1850	SUDPfCekjtmxQCTcXHvaVIljvlMonr	1	1	1	WT2	925
1851	vJdTqgzbCJXhycqFpQPvDFtttJnkIR	1	1	1	WT1	926
1852	EQITPizPbINJjvTZfbmGJvgKDkBwZj	1	1	1	WT1	926
1853	MdIjaBVOjvxRRvgvOCfWJMlWAZqFhe	1	1	1	WT3	927
1854	iIcLoxjFJjBOUdlmBvfkevTrZWUwZi	1	1	1	WT2	927
1855	AfdrMqtmwATPxxaEShXMDGMMcDShPX	1	1	1	WT3	928
1856	AysIffzoCbkwTmfLzFQjKsvbyfZESM	1	1	1	WT1	928
1857	WJloZhHJtQvuGIXvapRjEPRLRVtqgB	1	1	1	WT1	929
1858	SQNVJPXrEeLIvxNbWORmCcOAEELLUB	1	1	1	WT2	929
1859	liIIunwUMGUqZeQVxccrFlgtHggloH	1	1	1	WT3	930
1860	tHwdNGJPzxMxwuLQrAMGyyQKEiwljp	1	1	1	WT1	930
1861	AgTcCswseSoWznRYClxEzMIoiYmdRx	1	1	1	WT1	931
1862	AVkOZqgeVJeYBwAcEeDdZAnvNuybmP	1	1	1	WT2	931
1863	SuuEYcYPuBYezxgjyBGtKtmscDgKIa	1	1	1	WT2	932
1864	XPaayIxFgxvpYmQBPGeABoZSqpMFIh	1	1	1	WT1	932
1865	FGGTFzBlUtlfvXuulurtyxJSCEiTVW	1	1	1	WT2	933
1866	CYrOqkBEtNNillzDUMWdCZrZnoYnMy	1	1	1	WT1	933
1867	DyeXSCTlfzQNbgNuABLZxaCuYFURyj	1	1	1	WT3	934
1868	ADKECEQPnUUgGdRAsZRnpicINUgJNh	1	1	1	WT1	934
1869	kzJSEMBxWuaQjpjMuRcYkDIyscFTTV	1	1	1	WT3	935
1870	SaDsjnoeOiYCZnLgzkmJXnxlLbXyou	1	1	1	WT2	935
1871	NcyMCiZEzFhATxhleHTMbKUNvZzitq	1	1	1	WT2	936
1872	DowMuyGbbPBOsFpSJKlZhQErpqtmwG	1	1	1	WT1	936
1873	qvpZQtQBOtPUiRYRyalGsffEjWQJME	1	1	1	WT3	937
1874	PmrlDAhWQEaMuTIFypswGvHYOMtugW	1	1	1	WT1	937
1875	FdOnHJdIleePNrBBbwvhlGuHogXiup	1	1	1	WT3	938
1876	jNlPNrIHLhqmYJZXVwBZJNKFnruWEv	1	1	1	WT3	938
1877	dNhNlMWTtqjHmNkRjUoSDbJeHSNAtt	1	1	1	WT1	939
1878	ojVJyOtAgIHBTcFUOkltsIjqjjIfom	1	1	1	WT1	939
1879	GxnOFEiPkyMFnNXAddtHynuYnFJjoJ	1	1	1	WT1	940
1880	dazLJIFssCcdHSZwlBXLfTSbjmyZaT	1	1	1	WT2	940
1881	IpVZApkJovlxKdsQonoaRdtoDelOsz	1	1	1	WT2	941
1882	YwVcYpMejVyeGEnezzifFRUTutopYI	1	1	1	WT1	941
1883	yrcozxaUmPpKgInyozzBfzJLFgOPFm	1	1	1	WT1	942
1884	mJofhQgDXkmRPYSiqGEkNxqZDXUxsu	1	1	1	WT3	942
1885	aFFOYGXOGvwLkNHunpxvpcoLUjwhfC	1	1	1	WT2	943
1886	ZDjFnFeRvQxlSthWLeNMzKIKTFUlLX	1	1	1	WT2	943
1887	EWpQbQiCJyExNSXKVhWDTxseMrFxQv	1	1	1	WT2	944
1888	ZuLYAHkBsUWgjPTZtBVCtxYwNbQKEo	1	1	1	WT2	944
1889	ibgPWNEatKKizAFgGbWrPFZgBcZOGC	1	1	1	WT3	945
1890	tWMVEhvagcKiDtjmfimlsMOEFxmfXU	1	1	1	WT2	945
1891	jOlxDfbIAXyAPBeHPMkhCrnoPTkiJg	1	1	1	WT3	946
1892	qEyubFVUMXRDPJoYkAwadkSIUqQeYV	1	1	1	WT2	946
1893	CXhEKsNhVXzEXaONFzsRnCsfjUUCVE	1	1	1	WT1	947
1894	DAGouyqGMrIqKcEVfXDVrmaLQzlikT	1	1	1	WT1	947
1895	bedJKXfUuBeUvtZllkFElBlaiFadHm	1	1	1	WT1	948
1896	HvpgDjrzskvxhePyCLTRSSBRCrMzNm	1	1	1	WT2	948
1897	APOvknqNbTiBBBdeypynwYHoSkudMf	1	1	1	WT1	949
1898	FCozQxNIPPEwdMTSwcAYiYBiGXbVdd	1	1	1	WT2	949
1899	owISAPcdJwkUQfwihoAWJOmOlXmwCL	1	1	1	WT2	950
1900	naIcMkCVHhXUQiByDpvzclygAftyRB	1	1	1	WT2	950
1901	ELumCrbySyVzVfbJLaHiKDyECVaDZd	1	1	1	WT2	951
1902	oriPdVJwzYifdbwjimaedntIgMsuMI	1	1	1	WT2	951
1903	kvpLNLrUaRngcxlTwsINNnisJYPuet	1	1	1	WT2	952
1904	ggwcbYvVEpHRTVgpBugJJtTEgkZaxb	1	1	1	WT1	952
1905	AvEaUWLzoMOCarbtsGJZkPkDJTzlzw	1	1	1	WT3	953
1906	TJIElRRQKDIPRPYaJQCbIEYpxAjgPu	1	1	1	WT2	953
1907	XfFGpiCgQIxEPvNdHTDjJoBFKwwPNU	1	1	1	WT1	954
1908	hIRpKvuyQCAcrgAPpDRsmaJPjmplzF	1	1	1	WT1	954
1909	vEdloiPckTwGenAyfEWUzXidrVbDgU	1	1	1	WT2	955
1910	VmbpIynwILfeZXuLIsDMtaKypgaxqC	1	1	1	WT2	955
1911	fEZfzaPmNBTGZBmkPRcmNHFufOEQtU	1	1	1	WT2	956
1912	miJtcddCWvzzMMtxEIpqaFTWtQCbrA	1	1	1	WT3	956
1913	oVkJahXgfMcakyoIXRkzunQCsVUPlD	1	1	1	WT2	957
1914	BFSgSrgYQTbCbgRBLCGSMSqXaMRCWi	1	1	1	WT2	957
1915	ReUiWYlEqMxLdRbcNYsxELSUbvJNZX	1	1	1	WT3	958
1916	XmcLUPLrwVFIRzXptQFiyZmIASyYiF	1	1	1	WT1	958
1917	bgYZLDlosoVnKojMMmwHdWEVyANTDr	1	1	1	WT1	959
1918	ruZztUzURNsvFJUqWRTWmxHGIFZqNS	1	1	1	WT1	959
1919	MRTrDOOSogSgeCzRqZITnNCiCQfpHA	1	1	1	WT3	960
1920	ukIxgnjCjWQshJHbdkMOUgNnjBohLG	1	1	1	WT1	960
1921	YjGGAsbYDUZKscVmrDclnYDLqQtjdt	1	1	1	WT1	961
1922	TNjPqwXFIdfqqsEFnqklBfWCfxWcnj	1	1	1	WT2	961
1923	VenTEalLefNeHkbMpQYfUpPwFFjsxF	1	1	1	WT2	962
1924	KxWsqlJCFcXZGWCcWPkHhDmhNxzMcd	1	1	1	WT1	962
1925	vLKqXNmXBmdvrBzsDCOdRYNYsbVYzu	1	1	1	WT1	963
1926	kcFOTQzfPmKcJUeFqpjHVYueHXvGft	1	1	1	WT2	963
1927	keUsULeVTArCUQexUVEfhNaomOKZyE	1	1	1	WT3	964
1928	YdmSeZOAikoazPPpxPAMxbUZVzmEcT	1	1	1	WT2	964
1929	gIobmddsjliBAhJdXrUGySQvWRSmte	1	1	1	WT1	965
1930	UPEfoTUhgSqBvxirJcrknClJVMhazi	1	1	1	WT1	965
1931	vGwYSMzTuQGxKaqaYxLRtrnKvgwyzP	1	1	1	WT3	966
1932	aEjzJjCkriwVejSkuWSoKDSDWGosGi	1	1	1	WT2	966
1933	xEGlGwgZMbgFJnGrGXypsELSJzdfqR	1	1	1	WT2	967
1934	zgBCvkMpUEYgNSUysfqBanCfTVSeHl	1	1	1	WT3	967
1935	NSIrorMiCAUiamEZfhXCppfpvJZbOr	1	1	1	WT2	968
1936	gTBRcttSKgSlvIWQqqBsBWuhggOUen	1	1	1	WT1	968
1937	wjnvtEkVKvtpNsDaAyHmIZnTvjekef	1	1	1	WT1	969
1938	HqkyAFMHODxGUpHretjcNlVFewRJNi	1	1	1	WT1	969
1939	awzsVwFQjxBjbHDWMfpRYJhOAYlBSJ	1	1	1	WT3	970
1940	SDIOXCJNtnurZSCGAEyuppNjfOeJpq	1	1	1	WT3	970
1941	JpmXtqLkhBBAcvYrujfiJCMlINhUQh	1	1	1	WT2	971
1942	yrIXYFfwVuXeyXBmzZqrSnsUPKDesA	1	1	1	WT2	971
1943	dLrEiimraRDXgkmBmTwbpmnPFTEtmU	1	1	1	WT1	972
1944	YlsDzJguRvlFPjlJbHoStwRnYAxizJ	1	1	1	WT3	972
1945	HVtFfLVrPaFerBDbHmhhtNfBATqWib	1	1	1	WT1	973
1946	mHvlhIChEGPynBUkPhhCkjwwWqqNck	1	1	1	WT2	973
1947	cYcrYDTLjsZHtEDnRRGOQLYApNaByA	1	1	1	WT2	974
1948	hRPnStXhhUiQtHJxMUioqJDiLiFJsp	1	1	1	WT2	974
1949	EpyXImYUzXeCbLDNfMvyeBBsbHiggc	1	1	1	WT2	975
1950	WCxAqkqDrJffGVUoidAfBqlBVXWSnL	1	1	1	WT3	975
1951	DEIsBJMmbQQFfvNfRikZnaFiOWJDOl	1	1	1	WT3	976
1952	PxRmorwkjIlfpRIPctgfASvQcZVJiX	1	1	1	WT3	976
1953	LPaFgJUUOBylYAdwwxuzlTldmKpNEb	1	1	1	WT3	977
1954	AyvwflQYjgVkiNDRhmqPLNKhwSmnNV	1	1	1	WT3	977
1955	XBQhDMICMIDOgpSUmPbbWHJCYcuFeE	1	1	1	WT3	978
1956	xJNtpIutkxhJEjESBoaMxEfsLyfoOA	1	1	1	WT3	978
1957	dOOCrcuTwmhXAhlnYuurZQcZHmvGeF	1	1	1	WT2	979
1958	xiAFFpNaVDMkBSaOMPoXwIKeGHNLFl	1	1	1	WT2	979
1959	amGOMPYbFPEiePaQEfPeVxsYuVqFin	1	1	1	WT2	980
1960	hvTbBrBMXCJITvqQQKvqlCcPjQEuqc	1	1	1	WT1	980
1961	bNmMnbXFUoiBLFuXofTYDiVnHEojJa	1	1	1	WT1	981
1962	QEtQQSscWwIkITfAkjBuIiQAgbeWdd	1	1	1	WT1	981
1963	ZbJUqybysqVmJndfRHfLHIkjglyTHF	1	1	1	WT2	982
1964	mwgOeVZAiOnMTVmcqnyzZGAHPnSNsm	1	1	1	WT3	982
1965	CBNClgRNQrbNEzsUHgeYrbGHqDtuJI	1	1	1	WT1	983
1966	IKukQknFcjFjgSdMokgsSHwQqOwIIP	1	1	1	WT1	983
1967	irvCjqPTqTUeEcpvymErrDhXKYmgkA	1	1	1	WT3	984
1968	UUlggigmtMMAVfYaybnHybvsPbCksp	1	1	1	WT1	984
1969	szXEPfzviTCgQbvnzWXFDCorVPbBNz	1	1	1	WT3	985
1970	lRenSHZTymnwIwrTVXGMhPaEHIlyTm	1	1	1	WT1	985
1971	hjiYbOWUjBDcFWbMBfgPPhsCcbeIQs	1	1	1	WT1	986
1972	pIzZdqFWyRfMWsOtcQsGpEddEIKHho	1	1	1	WT2	986
1973	jsicjoYAnInUBkVdUSSeQNyEXfftCM	1	1	1	WT3	987
1974	EeiOOSCvVqBmmOXCtvslAEykhTTrUs	1	1	1	WT2	987
1975	IhExvoMWLztJOAfPJjVsFZvPuEWOgb	1	1	1	WT3	988
1976	aKawzVtXLcRmywvylzKkXkdfNHqEdL	1	1	1	WT2	988
1977	SJgZiFDWyQeWfwmDcGnTnMXXoNxrTl	1	1	1	WT3	989
1978	YJPlbrhunUMTrLEoOdqktAOGbqTCVS	1	1	1	WT2	989
1979	ZYqJiCJjRRvCLXbhOWSNChEaGmYQUU	1	1	1	WT2	990
1980	GtwfosoVfYBiAMKqEFkJHSKDpmVVlJ	1	1	1	WT3	990
1981	DhdZllWZtSkCLPFdqMvahbwEhMbxZm	1	1	1	WT1	991
1982	glNVwbnFkyDuhPwbfDGKdhGYyrIdRC	1	1	1	WT1	991
1983	lLQRTREwFOANOuVqvLgYoVUpNOiKZA	1	1	1	WT3	992
1984	VEJCKPsriIdOsBlxWkzZpoGvnGIQNr	1	1	1	WT2	992
1985	mPDTPzsRIwmTwmnedcQHJYkQwhajtC	1	1	1	WT2	993
1986	QCmLVmJSOZlWwNctdOOhhsmqgEPYju	1	1	1	WT2	993
1987	DBUybpYwqUjJvZxaGwlvPRWMiZXeZP	1	1	1	WT1	994
1988	DLelYTCXVchfeJoSpjKGsUNdnYXaPH	1	1	1	WT2	994
1989	iYqgDNzLVRAbjRNerzyOUxFgsxlrvE	1	1	1	WT2	995
1990	dNPKuktQPDCqvgPPLKSZCuGebDlPPu	1	1	1	WT3	995
1991	FkLFpnkZezZyfexUOtNdamfgYLlPwf	1	1	1	WT2	996
1992	DvLXOiQfepjdKrLBhRqmUpqkisaFSq	1	1	1	WT2	996
1993	MhTxdYSHvFsHgEGWtpWspnYOpqtelJ	1	1	1	WT2	997
1994	vdEtBGpCZQagJxHCCzpniyyoVePYrV	1	1	1	WT2	997
1995	eQEELRlMCOWniRJalvVDdqASNtuXvU	1	1	1	WT2	998
1996	PkjfFnwrCVhVTyqUzcwehYVdOmPbQt	1	1	1	WT1	998
1997	ipDqUhyaecTXmZemQyqKJMLGHxiWaI	1	1	1	WT1	999
1998	ExSjuDlpxUzPOqPqUVmOYrNOCARdCu	1	1	1	WT3	999
1999	BJIkVLazIMKHrdfUyjgiRNiZghvluq	1	1	1	WT1	1000
2000	mkzUnvHYYEvsDWriezIagoVNoHBHiJ	1	1	1	WT1	1000
2001	JdRnxTtcBhbPTidDNbOPyAbBjgNIkZ	1	1	1	WT2	1001
2002	GcDsoNQLImpKyVIyQaqvBIAjxUEazV	1	1	1	WT1	1001
2003	iwMxazkvqKOgTvoDhLlOCwCLsHVKid	1	1	1	WT3	1002
2004	oiJhSmonrTOWihwRakeUmptYHqHwOE	1	1	1	WT2	1002
2005	xcpbBaLuAPmEZVkQhymAZeOvoqLXVE	1	1	1	WT2	1003
2006	ulCMuAEEazBbYNkdKPfcgzlKGReAOS	1	1	1	WT3	1003
2007	zqqiWNmQPTJXEKLgqcgAlhSyLWNfrM	1	1	1	WT3	1004
2008	TwrhuWQtQNRUvXALSOqtLzidvXTBqY	1	1	1	WT3	1004
2009	cDBiYrbKzMjRqQejckBtAbmqrcMgCz	1	1	1	WT3	1005
2010	orUIHuziGtEhYAYxpuXcjdSIFJuceO	1	1	1	WT1	1005
2011	aDTslGSsQlxrRwijSVPQTHkKMDsjkF	1	1	1	WT2	1006
2012	FyTIwnzmJHQOjgRlDahiGfGzqSFnBv	1	1	1	WT2	1006
2013	afbTebrwHIyJgvtfrZFGeHcYfWWsyn	1	1	1	WT2	1007
2014	YXEcYffTfYfFqsSCDUqlaTigvfmMXQ	1	1	1	WT3	1007
2015	dVAAQaicNptNKKAhCmauDyZZCKZjvr	1	1	1	WT1	1008
2016	rgFgMumkldiEzICQKrMDMbYJcJyEqd	1	1	1	WT2	1008
2017	kiXaYKZFVvtlUpnfOFScvzzUkXGMGD	1	1	1	WT3	1009
2018	DIvVrrssiNTaDbwIzbzqNzGQoGpKMi	1	1	1	WT3	1009
2019	EIZXTESqhHekLQSCAypVaxyBBZEsgE	1	1	1	WT2	1010
2020	cauFbKniCSezlrLUiQZAVBtdDKHolV	1	1	1	WT3	1010
2021	LnxMSDtJBMLXXyaiORGDtvhDXaAEKZ	1	1	1	WT1	1011
2022	gEXjRRSXzBSANgoXNrQQdaJTHLMiBK	1	1	1	WT2	1011
2023	esQuCHGrflpjPXnmSSSwLtWrVZTPzN	1	1	1	WT2	1012
2024	oGiCXsiKlqHmtYZtAPWaLftGPJTqGr	1	1	1	WT1	1012
2025	fjllBzEitLKGkWaawPhhYkdbGvZtkL	1	1	1	WT3	1013
2026	SWEEGPVvXGxjzGhTpayqyURjffCBOP	1	1	1	WT2	1013
2027	bKlLiNrMoOlSfvNQMOaMruqKSuJzow	1	1	1	WT3	1014
2028	jmUABpKbqLZfPZBZmgKVdfmQqBsGlB	1	1	1	WT3	1014
2029	uLCmFzLWXUXkYXfwnSXZbiqVuHhTgd	1	1	1	WT1	1015
2030	wdBBLRyvNwsNESdlBrSvGXEfLJkYqf	1	1	1	WT1	1015
2031	HqZBBbQKjCBwJuKInzeLyTpzOYnkjJ	1	1	1	WT1	1016
2032	TXHjcUXFwuQWkgGbmIlAClhkipsgAW	1	1	1	WT2	1016
2033	zlgtGNmyJRgorpivVYIPgGXveozfTE	1	1	1	WT1	1017
2034	AXRWlPGwLDobjOYgGdxOsryZBwQJtl	1	1	1	WT1	1017
2035	glkgtEGFcwaAQSjOsFSQqAfldNYikT	1	1	1	WT1	1018
2036	ZiKNigFGwIzQJDmMmAEAopkwiGSNkB	1	1	1	WT3	1018
2037	RpBEloQmcmFzoogQZMTUxxRYDOojqY	1	1	1	WT2	1019
2038	tKjWbHyIVChuAQgRilXrxtVAblGroY	1	1	1	WT2	1019
2039	kFYzETaniwbSAMKwfbaqEqlemQNXxX	1	1	1	WT2	1020
2040	cfFHABqUpftYlzhbSGadrzKwTBugxO	1	1	1	WT2	1020
2041	NuUjHdOnlTmNXhAxoZmbuOjmIKgbxp	1	1	1	WT3	1021
2042	AUCdeWnECoizEgMHKHlmFfeiBFPJpx	1	1	1	WT3	1021
2043	nfViKyrpcogiOWtAyWjwdyJcMZmRTm	1	1	1	WT3	1022
2044	KjuQrWjigggaFCVEVoiqZjXdJtusra	1	1	1	WT1	1022
2045	ZqXVQxPNkFvFvBQUakwpFPPdFgQovL	1	1	1	WT2	1023
2046	PyLiMmrCuysUfPXvfGGuaBPNwWWOfa	1	1	1	WT2	1023
2047	QDCucDZDVBynSDVwyWTkAWVCPDgBBB	1	1	1	WT1	1024
2048	xGKiyrrpvwMPdTsiuAKclXzigdfTfq	1	1	1	WT1	1024
2049	UZdmzBfzkDasoOmnSsrrCsOwOqXQQE	1	1	1	WT3	1025
2050	lJxGNSEpZUewaSECSzKiOiuQvvjuWY	1	1	1	WT2	1025
2051	WDJuevSSbZLzivaiZYGZVzYwwjWxWf	1	1	1	WT3	1026
2052	zNkzBXNcYmuggetchZHaYGRHxLqDRT	1	1	1	WT3	1026
2053	UdWaIdQrnnAvBGQWdhHonjpojBREWx	1	1	1	WT3	1027
2054	zgHZHOwnJkqnrjCcsvyADjilqmkJAF	1	1	1	WT1	1027
2055	cDFjyUNZtMJlbbcVWZFJGUxSLvNHpA	1	1	1	WT1	1028
2056	rYvXWNZekLdKRJAbJmkZTtIPGAPeUP	1	1	1	WT1	1028
2057	jqmIhJBuxvzLPaNcKWUCrkgtWdSiyZ	1	1	1	WT3	1029
2058	ChWrdpgqqDgjevdyFDaiLMbaBYJznH	1	1	1	WT1	1029
2059	MaqIitsOKgeyWtQFYGISZXMIuPCFVW	1	1	1	WT2	1030
2060	iFcQhJSjeLEhbrogErxlEpjwhzpNIk	1	1	1	WT3	1030
2061	bnLeTKkZfSMzjUbJDbhXfnznNQUOJb	1	1	1	WT3	1031
2062	bOJAibHiQlbFVFxZbPmrZQzdjolOro	1	1	1	WT3	1031
2063	NVObgDVJHAOlOZXrmeYWLFfQrUOciE	1	1	1	WT3	1032
2064	DwovTNnsUoPzzyVPSehRxuaRRsIMXr	1	1	1	WT3	1032
2065	EGiOHnCuglhushUamKGJsJtdiOQdOe	1	1	1	WT3	1033
2066	MjDcpKDYENefXeWnQKxtZjkLSdLlfL	1	1	1	WT2	1033
2067	vguFsUpWoBNeJLTnodoyzolQxyYhLE	1	1	1	WT1	1034
2068	qNhsSvttXPAHaESJmKDzxZSzWffaOR	1	1	1	WT2	1034
2069	jYhjqKTJoswqupiDQoKThpUuDXswRr	1	1	1	WT1	1035
2070	rdGTdOQwOeVSUiIEroDynYeiweKbYG	1	1	1	WT3	1035
2071	DHlExbceILjCJvTKBPeKGvAsqqJapY	1	1	1	WT3	1036
2072	REzBjXyIFhUBvVRZoTRlJTZaaAeIgS	1	1	1	WT1	1036
2073	JjqdMVhdCiBKzGyGgmArkHUYcojwyb	1	1	1	WT3	1037
2074	HblLelDvqYhNXbGgzkCqrIRfrZjUxC	1	1	1	WT2	1037
2075	leURxVRqqpBNKkgfZMWvaIBBLjAvyh	1	1	1	WT2	1038
2076	tAlrPtZhPGHIBFZfwaGZrZwTqViHWj	1	1	1	WT2	1038
2077	qWEBKAkbYuhTKjdcSujklmOPMiKGMt	1	1	1	WT2	1039
2078	xywRCGJxbeeDBYJgSqIzBsmzupAwSG	1	1	1	WT3	1039
2079	jKIOWiaijOGOYaQtBfDfnZkKhpvoYm	1	1	1	WT3	1040
2080	LXAuSthFJqvYOTzjsjzXaQAerDNqhZ	1	1	1	WT2	1040
\.


--
-- TOC entry 3788 (class 0 OID 16752)
-- Dependencies: 255
-- Data for Name: rooms_windowfittings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_windowfittings (id, name, width, length, height, type) FROM stdin;
811	fmKQAOWwiFgYFcnyXPBoouNtRldqWG	1	1	1	WFT2
812	FedHFDSohsqeewVoytEiilEIKFuVCd	1	1	1	WFT3
813	MtImHkbTZwOELRbGDmBCruyhiUTEpA	1	1	1	WFT1
814	ZqwrqSGevPOsAMBEXCMwIJPCVgOmww	1	1	1	WFT2
815	eGOoCXBtFVReSrHhDFxygyXLMvRAOD	1	1	1	WFT3
816	pMLYWpbyuelOBXavOaSHDMNPmykLIA	1	1	1	WFT2
817	bpLlleFDavAguoDaBHynsQNiuClCtH	1	1	1	WFT1
818	OvPKdYXnCVUJoslljYsrMryMljBwaJ	1	1	1	WFT3
819	hWkVVJWpJAAOVHVkjAIqCtzPXdUBmh	1	1	1	WFT3
820	KEaUnlRKtaeAsnoEFrZSoVSbjiJyas	1	1	1	WFT3
821	OGWWFIKXFeKMqyvQRssuRLACZqNuVF	1	1	1	WFT1
822	lZKnonCpvbPJrZAAuZAMvmYGSqxZTB	1	1	1	WFT2
823	AaWpCrEmUpGZNPLPOXMnUvBjhmFwdB	1	1	1	WFT1
824	uVskjygFnEjpdVHAsMQirqXcDspaNz	1	1	1	WFT2
825	jECYhODGWIGSptSblXUSSeRrGUMeeD	1	1	1	WFT2
826	CKJkPaLqQFSWAGfLbWgcNCtnOLhRDi	1	1	1	WFT2
827	NEimehQPtLHLDiEKCwtPlgHaUaaAzL	1	1	1	WFT2
828	nUfmHrPcBfwAybZHxkispqInyoIKgR	1	1	1	WFT1
829	EJDQhKdRjMEfLFgPseUfPIqFdHvJml	1	1	1	WFT2
830	vkzqfCmNKtMCFBrVbwGscVXeaaAIMC	1	1	1	WFT3
831	IOThMvoWwUwaWoUQuFxGIHYpVFLeBf	1	1	1	WFT1
832	mFNjQhXaWnInMTbxtzQpyJouIEnMNP	1	1	1	WFT2
833	RleoqGwHmyHdfFIrDSgHHpOfAFwlHt	1	1	1	WFT2
834	iisufFbdjHLOVbupARTJHlyEVLcrFa	1	1	1	WFT2
835	BvsHzqDhdrJVgzntQJSJjBzrBvzWfy	1	1	1	WFT3
836	EqRGYmOqDZIMWpkXKjTJaDQGTMCWcM	1	1	1	WFT2
837	oRYLuqYkGNQbULTZGvyQymmOEWtzAi	1	1	1	WFT3
838	ztlnvcKvRPJxBIboZdFarCAcetKoHI	1	1	1	WFT1
839	DlbtTtMzVGiujAvbTtkzDWATGFfNcu	1	1	1	WFT2
840	kvutzlpulQycpyomlQAdXvVVmsNFGe	1	1	1	WFT1
841	KsrbWnsyqojyAxiJSLpucrVGezQPqk	1	1	1	WFT1
842	kSPuXVzRoxznBNeMxCPyzYrUwxCjXx	1	1	1	WFT2
843	pxRoLXiNlqfHyUoCOgAJsoCrRhdYWB	1	1	1	WFT2
844	FeqxzMxIvTGCqppXErQEbaghduuMVd	1	1	1	WFT1
845	KxqTZDPBxjZjYXZKfKJjQfQniQdgAE	1	1	1	WFT2
846	YPYEHeBXMKCzXZgSprqtpfeQLHgFCl	1	1	1	WFT2
847	imFDdVdZffHUiMfKenRhGPuwYMoRnI	1	1	1	WFT3
848	uizgJCtJCKGAqynrhqvVixJprBsJGT	1	1	1	WFT2
849	MswsBHEzDHiQTCErjrfdCWmYOAyUOg	1	1	1	WFT1
850	CegwkjATMzJwmUClficxDumrEerIuY	1	1	1	WFT2
851	OKUWsBhaWEwwObaExtdIIbeVreJNaM	1	1	1	WFT3
852	faCxeGwLWyIiCdilJtRqAFBfeGzdZk	1	1	1	WFT3
853	LHHeLshMkAiINEVORzcHhMKZEQloiZ	1	1	1	WFT3
854	OHrjRTudTxEBiKuRrdRhyzGaOnJdSq	1	1	1	WFT3
855	kSxbWOmtWUehQhunqMZinUDTYJSPbm	1	1	1	WFT3
856	MmYaLShKpFMrVcSCxUdUvIQkHwVwzW	1	1	1	WFT2
857	NNMHGrshChEIpforFUCndlBUrGbpZb	1	1	1	WFT1
858	btYYPMZsmvPuJKBqTHwHdLlwOWYGAK	1	1	1	WFT2
859	cMvZcZWIlqhUdaPfkUUGowhdsMXpUd	1	1	1	WFT2
860	dENYSuwrunWrGvEwMfFCtiFPpcjbWU	1	1	1	WFT1
861	fjjzYexXFAqGvldLExsCgrWJHaCzzr	1	1	1	WFT2
862	fXJPOOlUfgHRUcWDcpTjLrVnWrZmnb	1	1	1	WFT3
863	ZVKATTkgSwktohtnbdmEbXbAzVBvSk	1	1	1	WFT1
864	wEkTxSHyySdbLNQrQzUUPcxobsAnqf	1	1	1	WFT3
865	UxzjDqElxnMuzuGwQKLXbDAQUthubU	1	1	1	WFT2
866	pwTmJOGEWwMrsrpdztWjUCkSalxYen	1	1	1	WFT1
867	ggEBwPctHSVRTtQEiGsDTSRYINmfUn	1	1	1	WFT3
868	hHjqbpbbFxtCZKIHqbAEgfrAXLXcfo	1	1	1	WFT2
869	hptSVcNxylBebNoujTAQKZZhKNDACI	1	1	1	WFT2
870	MUjLGzUSEVpuBnkJvMayPOJYogKHPT	1	1	1	WFT1
871	SCELBzcHZyKtgeZeXequcAtxxpZmGB	1	1	1	WFT3
872	UMpLOijfZAkmYEtXarDAzUMuclInmp	1	1	1	WFT2
873	MuDEzZNibAJyubwLGunEwFzvpIWBXB	1	1	1	WFT3
874	QPkFNCOAFgAvfejHSacBwubhuljxTV	1	1	1	WFT3
875	EfcHvIuYPgceAJfLYOflczLIfekJMn	1	1	1	WFT1
876	OJOczcrosnfnGViadVVeFJaSWIXtXB	1	1	1	WFT1
877	DbhEFhjMtRBpQyamEcsSrEoHAwSaEl	1	1	1	WFT2
878	PTGXAwNeJuLBmLZNgADuCJUqiIwnfa	1	1	1	WFT3
879	VgVJIWzXMHmOQqdsMjZTThZJuJcKJi	1	1	1	WFT3
880	ZtiLuQefCurKxLJjrhhvThmWhqNfJm	1	1	1	WFT3
881	sEhuwXCPuGvQPxaPjddJqpBxZabLfH	1	1	1	WFT3
882	nsRQxpCkaecumVoDBDXdHBgVosTkXn	1	1	1	WFT1
883	WEfegEbxBlOTpNEUhAPlJiDCNtEhnq	1	1	1	WFT1
884	vRtqcmrhDMMZpIxTojNxIoWjOxSOww	1	1	1	WFT1
885	fkIwlxwwHpMSZEwvtlteQhmjUjGPyb	1	1	1	WFT3
886	yBgfXZapZDMQEsTtBuOMVUMHSMHijh	1	1	1	WFT2
887	GrKddxXgiJScvfCHXBAsiZEgYeKbZY	1	1	1	WFT3
888	fNchrzOuVVvpDHkKRBFwmvyZWwgKyS	1	1	1	WFT2
889	SxNaIOuaKcElkzKRarqPuVbJcwDXuq	1	1	1	WFT3
890	IspCoOGCfCJaZPNtXDiHoDDTiUAtWV	1	1	1	WFT1
891	KjdhVfpQOpxprqAQZrVUuwOcPjOSpx	1	1	1	WFT1
892	wzDgkkwodmlzdqeiKETpQiyTBZwubb	1	1	1	WFT2
893	XOKANeGNKHluklfKKuqmupKMHESNax	1	1	1	WFT2
894	RBQevitnjsXsunlsPrhAatdPzlhDiX	1	1	1	WFT1
895	aCYubwoorzTGcHIvezyxJtarvfEESI	1	1	1	WFT1
896	JgDKtzEcOzAPctbLxpxwguzSxksaAH	1	1	1	WFT1
897	lJrLfHAaKtZijNfsbUuIlchjVnpZKo	1	1	1	WFT3
898	zYfEZvEbPKBbOfZdtyhuVISuuaGAvS	1	1	1	WFT1
899	jhSqanBSNYjjRbdSftRxAxdieDXWBG	1	1	1	WFT3
900	aOzjxWccItQIxbfsZUKYJsLhKfiNfF	1	1	1	WFT3
901	JkCxVTjWVcEkitghcReuHCfFwCshad	1	1	1	WFT3
902	LFNdxVggKaPQfbCjBBaVPaRGeXmcIR	1	1	1	WFT1
903	gEDMaeMzzzMlQCIpqWsXIEODLCeTIA	1	1	1	WFT3
904	FaBoOweXOrOTaXgosNiPtfvpZUSBXV	1	1	1	WFT1
905	LnWgCvKLTebsOZBJABvNomZGEWAjfy	1	1	1	WFT1
906	NUzMUGqiAWszQCHkAetyzNbOOLhAmz	1	1	1	WFT1
907	tTPLiDybycjXsTekgjsqQrAyFKFaRy	1	1	1	WFT3
908	uKxYumDTmYBWzAUdrhLTYGcOyySpCX	1	1	1	WFT1
909	OEqBbmCxbKAgrcRyAlIoTtEWalKGRm	1	1	1	WFT3
910	eBRbJurGHFoJFXmEMmMCNlCHOxpTVn	1	1	1	WFT1
911	BCpVPNWymBcBjpxbbQDYXyZpxJfpPr	1	1	1	WFT1
912	IGuQvhTiBRbXFEeLgDFyRrhfgvvqJi	1	1	1	WFT3
913	ZpOBSLjXqELkeIUsBBkxclpHXjoTmN	1	1	1	WFT3
914	yPuiBVMwnXfmofSvhZJuzkssnVuVYk	1	1	1	WFT1
915	oWeUGjaodzrwnyyYMNPpJItdpaIrNk	1	1	1	WFT1
916	bbolWvoJUfexaGWmQzygnLuEfFoqhJ	1	1	1	WFT2
917	xlhZTOQuloAYESLRJmqSggwBfQECyC	1	1	1	WFT1
918	syhCrrIUXyAGvMaTwAWWyivnUnpgEv	1	1	1	WFT1
919	xShYYOGQKaOrTkaTTGDrlAxWWEKmWL	1	1	1	WFT2
920	nYsqIswKqDUyzyNojxpYteMntDxmZS	1	1	1	WFT2
921	rlizStCaQYJUlCtZRDIptrEAXqiwvl	1	1	1	WFT2
922	ftslayLIgqcszZUnmymCDsildFOgLK	1	1	1	WFT2
923	dvtQIQVSXwUzkskYWWnBSRrqnqmYDE	1	1	1	WFT3
924	pXXzGvVqcKHfPxjDSOuoZeUiDTzkeq	1	1	1	WFT2
925	RTgkqXZwPwYzbaSSDDflLOfnbBIlVI	1	1	1	WFT1
926	uzqrrjoLGegNzaIgZlgpXCnTzMuKgt	1	1	1	WFT3
927	ZXqLPCdEYWRCgQOyeSDoFHHsMeWMSJ	1	1	1	WFT1
928	ucUcSquRnJaqCjlTStweglIrGJYWsD	1	1	1	WFT1
929	hmRgHUGUYWmPHjBFFdSZpImKDYtOJI	1	1	1	WFT1
930	ODUFVzdbpKLxmAZRBvdEOeNSXtfvbv	1	1	1	WFT2
931	rBWwBWDToFdLPyGOzKbzYWRfTTBFIZ	1	1	1	WFT2
932	JxcqXDeqffTzORaIItLWPtswdPbuLW	1	1	1	WFT2
933	wRcSVfbFJowluaVJTUBOfzhLJCqXfA	1	1	1	WFT1
934	JMdXySYeoIGXCfFLamlKFNlmUpZmmy	1	1	1	WFT2
935	qfLfSIJZCnfeXEGzehYEHLDxAJnRyS	1	1	1	WFT1
936	sKoEXAYRHspUXyTDmMhzVXOWzEzmnV	1	1	1	WFT3
937	koKsTuFAWVJcJrGWbcwmSppEivtlap	1	1	1	WFT1
938	EzSHxKzvLrDBDtuYsvyEWCuGnWHkpb	1	1	1	WFT1
939	jYgGfBwkHUoCCrAKYLrfETcVuYidds	1	1	1	WFT2
940	FXgDJztlilCOEToUWhmfqKGsdZXeJd	1	1	1	WFT1
941	IJIGjtInpqylcRWyHWkZvurNcNLlmL	1	1	1	WFT2
942	FhpjxNZDDDLqpTQnCQoAsPfXPNRShH	1	1	1	WFT2
943	PjNfkLhQlCXxZTdyOJDtIBEubLTYzw	1	1	1	WFT1
944	RbIwRoluRSLMVOpigEPegtlZNjIgvo	1	1	1	WFT2
945	YWFZuESqOJCtMaZuziatsHsDNDlWVR	1	1	1	WFT1
946	lvgXlmysbiMfInwQMMHlrmizGboLBV	1	1	1	WFT2
947	PDriwXyeRARzIptuIqmxRKxvBHPmKF	1	1	1	WFT3
948	rHIuDcJcCKDxFmROLoYvEntQsQOknb	1	1	1	WFT2
949	uGqlBItwhnTfizQWiuGQDKhrtpVXyG	1	1	1	WFT3
950	tofDcVveHWvigvQyjyZcaUKHgRRrkZ	1	1	1	WFT2
951	qReylrLvKiUwzfeCHLClplSmxlDtcr	1	1	1	WFT2
952	DhqXxyaGysKNJDNyiPwVKQSKgjMBej	1	1	1	WFT2
953	qSwWAotToQkQfwuxPOEGOkhKYIxJDt	1	1	1	WFT1
954	VyyQAJCannOomukiOYLmuWWyloLsMW	1	1	1	WFT2
955	gWGFtUykimUajYqPgEZgGJoLhbnBtw	1	1	1	WFT2
956	MifGCIZQXVgmEkSvrBcsGoqdoXBihU	1	1	1	WFT2
957	iRHWeHrSwkEMTelZJgiRKfqdqXoszi	1	1	1	WFT2
958	EpdtviqhqwIZDvfouOrWkuzzYryRFO	1	1	1	WFT1
959	CJxsxexRWfWYJSwRJEfNXRuLOSVlpw	1	1	1	WFT1
960	IdsgVgxrOkBucAXUGzynJsnkcspzcn	1	1	1	WFT1
961	lfLZCSFVgnOhkxBAKwkdqtmiRACxiw	1	1	1	WFT1
962	EpDmlGQQTNDKrkpMyQAniXaeDofMvO	1	1	1	WFT3
963	aPfEJyEDQUmEUZrwkAHpzSQBlURkrp	1	1	1	WFT1
964	VtnvDeCvdFWlYoSicbnZFiOOveTtWo	1	1	1	WFT1
965	nzPatERhZYGiDhJpDOjakJfbdPMdsa	1	1	1	WFT1
966	jEqnnTargrqvgXbEezAbnfelulcVJl	1	1	1	WFT1
967	mQSnAlowrQPcSHhppavWJhcINwBtYL	1	1	1	WFT2
968	vXytvIybcvFInknABvSuRwpzNlacZl	1	1	1	WFT1
969	fHyfoWNqKzTayPPSDAVdBFnGREnaff	1	1	1	WFT1
970	hpJWAfRazWZrDPgOcpCNShuLKrfBJM	1	1	1	WFT2
971	pChjWVcfXMoVfJZcIrXghmCYtoTPSS	1	1	1	WFT3
972	EwEzJpuTYlNyyfPzvCjsdlriuLIWgK	1	1	1	WFT2
973	sWqvoFPiYuYSuGyQwlPolyZVeTArdt	1	1	1	WFT3
974	cEtulQPLlCJvAYeBkFgSWZNOtRgHkl	1	1	1	WFT3
975	YEdrhCGkIHdMGjRWnJRIMKsmSoleNI	1	1	1	WFT1
976	fZsLGZGjQGeoWHLmgvpQLTeXpuOHwx	1	1	1	WFT3
977	loQVeKrsKTFNvbdKFdkZHyQvmrNmdE	1	1	1	WFT1
978	gGOlKYkxHVtUbQozqGppGPowfPjrfy	1	1	1	WFT3
979	VEsfWJHwZtiNBiRSqaCHdQTFObuxzq	1	1	1	WFT1
980	wqHrqFPhYQFLAulIQZIdKHgBCPrgtj	1	1	1	WFT2
981	aZshqfeyZceijAtMCCeZVghGHXlAbn	1	1	1	WFT1
982	EPKiHIxKoKvtwhrIcWckIfNiOShYoG	1	1	1	WFT1
983	wSgrTkLOiAwogxtpPzCvLAUaGGfiza	1	1	1	WFT3
984	gQlKwjYpzvjRbCBFrkHKBjNUzvshru	1	1	1	WFT1
985	CmvJKULrMOYXxqUlUhTMFylWqYnIqU	1	1	1	WFT2
986	lRzCweruCwTZmJHzNKrBzCchtoLMNi	1	1	1	WFT1
987	MITtTwUeyJiVuAJXfqNZsJbzaqkkqw	1	1	1	WFT3
988	EahWajbCEwLJXzuAjMRVtXslLctHkR	1	1	1	WFT2
989	cbWPmxChWPQqTmYlmTMhwhcNHuLNTl	1	1	1	WFT3
990	jUvBmDCSICIvrGDuUfIKmtCfBUJITW	1	1	1	WFT2
991	RzeJBINDzlohDcVdTjmDmNbgivwLyc	1	1	1	WFT3
992	xkjywUIrpcRnTwWeBfxkpKtpsQVZcs	1	1	1	WFT3
993	gIgDDvbOBZWiJEYDbcSMnwvlbhtYUd	1	1	1	WFT1
994	oOdEsiZyZHeZiJcXZZRuEeeCNrKgEl	1	1	1	WFT3
995	oBWJBtdSDBuNAwCkSinZabbsrfiVPl	1	1	1	WFT1
996	msjOqDuaGyZBwrNgtsvybGPyfKonjv	1	1	1	WFT2
997	jsMeGaTDzILMXkIHlJmIxKoKQNexAJ	1	1	1	WFT2
998	noQmfHObUJwOpTDIfEiFlccNaZilrW	1	1	1	WFT3
999	FvidBeHaGaeafaEfidcsykhABDiGFc	1	1	1	WFT3
1000	dLIpiRamQKZOVNLTAXUaLplZVcCHsc	1	1	1	WFT3
1001	maEOyYaDsyWCeOPXCbGfNwOpGJHzor	1	1	1	WFT2
1002	KrseZXLsLnNPblyDMlXagdRfkcfIeg	1	1	1	WFT3
1003	fCeqzWmVUuuleNMzbfiBLjsgKKBeTh	1	1	1	WFT3
1004	CEoHuMEyhmTPDZtoSifVbqIGuVAJpx	1	1	1	WFT3
1005	xabanmnLkgXPLVuHIjTuzxSHYazgQt	1	1	1	WFT3
1006	YfBgOpvIPXIEEAahjGdNLFHetCglQe	1	1	1	WFT1
1007	XlUGicNAXDhunKOLQDRMRIIJisHMaV	1	1	1	WFT1
1008	tSdujDxFpVAyntnqVJfQCcIleoFDDP	1	1	1	WFT1
1009	NdtqGqpyBzGoqawMYwBCrdFlzSHZwu	1	1	1	WFT1
1010	GPrAVinLfGTeKscJclYRKmXgeRaKye	1	1	1	WFT3
1011	FwTEBFTklTDMAaHtSXCwHxCqBaUyHH	1	1	1	WFT3
1012	HfFsKMdEWrTUbFftumFbEoPlTcqfHY	1	1	1	WFT2
1013	pgfKllsZWqzgiAspnegLboJxwlwqbH	1	1	1	WFT1
1014	aoLvVoxKfRQUhLhSughilWAEOPjlKx	1	1	1	WFT1
1015	MQiMgBZobmTORTSEmjAGTvUSyHmbmT	1	1	1	WFT1
1016	EhLhGhYRcZOfJcBXXbcdHiTOznqdMg	1	1	1	WFT1
1017	vNHtaoqgxPFfVgoZViYdcHMfnfFErZ	1	1	1	WFT3
1018	NkKuYkOVyiRfpffDTPIQNjAZEcAsEa	1	1	1	WFT1
1019	NLPxaCOJyjyOHyaKSgSPqpDUUVmvpq	1	1	1	WFT3
1020	NYTFhJPbOxWtKxORJiMCwDctdXSuSA	1	1	1	WFT2
1021	pINtsVViVjbtEiqYYfjmDuapRCrODL	1	1	1	WFT1
1022	sXfqkKjHqWwQkHKHcXXIIkUOwDOlJA	1	1	1	WFT2
1023	AqXPjGhxFfQiDJjcAOSEcCylokTlLi	1	1	1	WFT3
1024	fXgmHbvqJFNmgkhVmQvCFmczMxvUDq	1	1	1	WFT3
1025	GyNfYNaZyEVFVfgZQziovnhoxYPMad	1	1	1	WFT2
1026	lHEYHlpzIUIFysIdefFirRGBuFiweR	1	1	1	WFT1
1027	HWggcAeZfpsiWcmtnswpPsljVfcJGO	1	1	1	WFT3
1028	JMHMgVyLHRtIQBRUQXbrNVZgRUQFjh	1	1	1	WFT2
1029	UCbPzBUCTzqzsbYIfasvpxporDhbps	1	1	1	WFT2
1030	VyFGINURTbTyxwIshVmVRkUahSIOmP	1	1	1	WFT1
1031	acKfMIBCMyrbAFFUrkctXPBPatCbUl	1	1	1	WFT2
1032	eWTaDHHannqtScyiFTMIMMhwdmHHSh	1	1	1	WFT2
1033	TTBpRMitRZMkkAdccSsvFyWoswwvjA	1	1	1	WFT2
1034	ZaKZQTsMOqVdpMJXhNIUTwvilYLsVV	1	1	1	WFT3
1035	tqMFtqYwFiZGRVXQHMrxQIbbfxqreT	1	1	1	WFT3
1036	GqWzxIEReJGmuYWmDKLgHcDoTdlbzc	1	1	1	WFT1
1037	HVMwoVSyEDOFXSoFoaxkdCxkxQMTrL	1	1	1	WFT3
1038	TjZnDMbtbccXthqHfJGKmnygtscjlO	1	1	1	WFT3
1039	xdgWLqekgFRFQgyQzQUHBrQoCxvNEy	1	1	1	WFT1
1040	OWrFGLfxsAOzpGxuroUpKTSEGmZxwv	1	1	1	WFT1
1041	KnUmOZGEEGNMwLaLreLEJwSAAvxzIH	1	1	1	WFT2
1042	BGlRZhgDTMtovZXzexfGbSnFpyWLYW	1	1	1	WFT2
1043	kUxUVqClBkNOHDoDcdtEQSJLrbrAOW	1	1	1	WFT3
1044	WuZUAJHjALRiRBHuJGffubijYBjxXY	1	1	1	WFT1
1045	NDgkgHvwDQnTSSUPuRpqQSZFTAUZpR	1	1	1	WFT3
1046	ZKZBAjeEUqpLYUgBuszZadAhrFugQS	1	1	1	WFT2
1047	BeysxqQJwklrPzpjjpdEzNIgLbDFMZ	1	1	1	WFT1
1048	qQAUiigvSrgARpivbqrAUjuXVECyzN	1	1	1	WFT1
1049	xQsNivOnCXHHkhPJIGhLqtzQreTgRo	1	1	1	WFT2
1050	vhILsLlPHheXlYLCPRoigcVtTJsEeg	1	1	1	WFT3
1051	vhBOWrOkRVcMALRLbQDzUYNFzsbiXV	1	1	1	WFT2
1052	dCLjnZsfoaHLDBTKohHQNupCTRQRTy	1	1	1	WFT1
1053	vDdzqDRmoJDgAznxcjBTQqpxEpTUer	1	1	1	WFT1
1054	tSYbChtKsuEHCfQeEMXKBqfIlcNWOs	1	1	1	WFT1
1055	hPjaGzhENQBukZJYbFJvXpOhAWJBfP	1	1	1	WFT2
1056	OwbziwGMESFVpWIVcZqtUctiWtOQuK	1	1	1	WFT3
1057	jrlGHJIbUQATwwNqoWelOgHwbxakbq	1	1	1	WFT2
1058	hsmRvkRgBccszegysQgCgcKneLDzrb	1	1	1	WFT1
1059	LjBoAMPjEXmiOsPofBvhkOzxXqzsRm	1	1	1	WFT1
1060	wzbsZdbfdctNiWeyJSGOHMdmzrbRXx	1	1	1	WFT2
1061	rMXIJzeRxdwPKrkFKxfkpxsUQKMktX	1	1	1	WFT2
1062	dYtDjlWgRvjyUQpFrJRaNeqgIdPfDM	1	1	1	WFT2
1063	mxWEZpNtsRItVFyjawwqvJkSFPTvYz	1	1	1	WFT3
1064	EoZqQULExVxxovlTDsMKFAEcyobbxT	1	1	1	WFT3
1065	BsHxPDSIREfhTvTTdomjZalwwAiXVP	1	1	1	WFT3
1066	FnDnpBbnfqqvGoZYtddOPwUZMasQFp	1	1	1	WFT2
1067	wuZSgamQZNMgWgpkXnlszvanOhRCiy	1	1	1	WFT3
1068	lbaImzzKAtvASFizTtJeMdJSyrBPmM	1	1	1	WFT2
1069	hRtASssUnceVQEZGlHjEfuKehJZDkh	1	1	1	WFT2
1070	MVKQuYtFeEIEvdbhABTXBoqpEYkVpq	1	1	1	WFT3
1071	teBFwRsydYywqrwGYaWwadOLdkhEPv	1	1	1	WFT2
1072	ERZNueChbEZXvkedXVQKmSRRViskCS	1	1	1	WFT1
1073	xsisTzBpfYwnZrzIsVAmPJDxqQngQP	1	1	1	WFT3
1074	sZlpxiDjjZBcCTYhQcPtkaWcEqiORj	1	1	1	WFT2
1075	wQYYSKLRxWuJZdlnjTBLzSwuVuBGcq	1	1	1	WFT3
1076	PtreHhvMKILTQGGeIBLjFWXszQKXYW	1	1	1	WFT1
1077	LthavQHMflJJhQiaIRnGyquxCVOBuH	1	1	1	WFT1
1078	ranFmhCaedbzdxiSANInjItJGtigag	1	1	1	WFT1
1079	ibBRLBCAJZfGYmzQkqPiGFhGIrkUOs	1	1	1	WFT1
1080	dtdDKcLIClnJqeacKltuSXUyqjFtrt	1	1	1	WFT3
1081	HTBnwRoGfpOZWmKIzQqlKPyaQEhXlV	1	1	1	WFT3
1082	jnGVEAMYbxvxjSTCMiWOpVHAAQKDMw	1	1	1	WFT3
1083	MaaZeAsvvTWXCHiqeCLPefhTgudghZ	1	1	1	WFT2
1084	fYfTkxTFBkeMFqZfGgfjMWsgGJJIWs	1	1	1	WFT2
1085	uMczZcCMUCjbyljcIgiGhTuLiseJej	1	1	1	WFT2
1086	OmJxqkhxyQKQDoWlmBszouZXjojjyF	1	1	1	WFT1
1087	pNqMRPkRPnqsklJUNjdTxPGeLjCdXp	1	1	1	WFT1
1088	GTCNLTeXvAdZfCKUGCraEyCBGOgbQo	1	1	1	WFT3
1089	tSPvZnbvHAsukiwjKzcEWrlNITlMvb	1	1	1	WFT3
1090	lFMQXYrfKiQtnOOnwBmbkYAPJLRpYG	1	1	1	WFT1
1091	qhYITFBizpRkaQEgyUlHooNitaiGZz	1	1	1	WFT2
1092	gvwrLLbRIVBkbTBFhsLazyaXhTUIlr	1	1	1	WFT2
1093	bwHBoJCfFfZbDMoOARIQjuIMTNCTRY	1	1	1	WFT2
1094	FdIOMhkWVMwxNKlGCSWIDtmDrigxPw	1	1	1	WFT2
1095	jZnEatNpzKAtZMYcofMGPLcXGUZpKo	1	1	1	WFT3
1096	fmmUJuDfiHjnRCHkxpWMXXgvjWYkzL	1	1	1	WFT2
1097	FFApaLEseOBuLXHOrGqwYpawybGhVG	1	1	1	WFT3
1098	eRgByjyvTrCKdCJZYetoSQJSjKCUOo	1	1	1	WFT3
1099	AOGYqrAglSuTEyBrlWVtomfCLVePcj	1	1	1	WFT2
1100	ILxCxFwEuYEPCQZKjaJQUUYgKAxsLX	1	1	1	WFT3
1101	JeJKJyFANhajALHJiISiiKfspEOhfZ	1	1	1	WFT2
1102	JsyNTxIuNsansVLGXvSpovrDhYiHZQ	1	1	1	WFT1
1103	XaxQQmPAoQHWqRqkwGtvWzezvHfgTv	1	1	1	WFT2
1104	LJsUJyhvWPoSXixkktNzTUqXRKWIHw	1	1	1	WFT1
1105	VnklSswtHNqmmxOnmOkacVjiylJLuj	1	1	1	WFT1
1106	KPPylziuGYwvergECVSiRzYRNJSEoV	1	1	1	WFT3
1107	DvnaiXStqsxCujsgVvNmRUgCUaHOOl	1	1	1	WFT2
1108	TEUdKyRBkkiugQaRWpwsprYWUkYXyN	1	1	1	WFT1
1109	oCQQeRofKJpCcmJnlEkNwfWYFdFuip	1	1	1	WFT1
1110	sBBngRsFvbRNDEFsevlhMOZrWMdUYg	1	1	1	WFT3
1111	okOdqBerrUTnEmpZNNTQJAJUQqEvmP	1	1	1	WFT3
1112	GTahVKEpTpxAuWKGWyhiSmBcxLLooK	1	1	1	WFT1
1113	XGIYKVUDapApQRbPpTyPpmZppnFIAi	1	1	1	WFT3
1114	TguIxsBEraUnXytrYwGnUWuAvartJC	1	1	1	WFT1
1115	CnKXasPJFUjwyzoIuUPNKRcvscEiFE	1	1	1	WFT1
1116	XnysfCrRgsprpMEvljiPBEYrrCTota	1	1	1	WFT3
1117	SnvOcfoYZDSLfkNEFjDDATMmRcsJnQ	1	1	1	WFT1
1118	viXYxRAMFaJtkKLKrDyyylKVNhjaqM	1	1	1	WFT2
1119	hqxiekHeXKIzSLgYsGPTKfcNlShvsO	1	1	1	WFT3
1120	erCdRNIjLGiTUgJlrmJRUUNLxeKtgS	1	1	1	WFT3
1121	cuKbGOPqDNYihPmFOzeVZqRgFFycSM	1	1	1	WFT2
1122	xFTKyBUKkryXrZxPeeUfsIBQMSFFGb	1	1	1	WFT3
1123	iahTLAHnhKKsexkWuGNNpofcQDLNBy	1	1	1	WFT1
1124	DTwoNaoRlODpLFSLZjxZdzWIardgna	1	1	1	WFT3
1125	eKljguCMoOyTvmaoXadsOtFXQQbvYH	1	1	1	WFT1
1126	SXRXVwxXWtIfwpacCIGyiHgPdoHnlh	1	1	1	WFT2
1127	UlHVmkuaZRpXHCLuCibFnqAVHhmyps	1	1	1	WFT2
1128	arUYmfCNzaOoEyYgEriZRxkFjkrGoi	1	1	1	WFT1
1129	uoMaXaHLxJjLIWTuLlqrxFyusUKOpE	1	1	1	WFT2
1130	mmwpXAkwOoDZIHhfppfEfEUmQVWgGo	1	1	1	WFT2
1131	QTzMIjYVyaRZrPvYbuLEDBNGbNhxUA	1	1	1	WFT1
1132	hGpNJxYKToGTjjIkbrYangyXcqVsyu	1	1	1	WFT3
1133	eIPlQbNNnNPBXCDddaLsQaznNnToFD	1	1	1	WFT3
1134	sNvKzmGYWoYPODTdeufjSkpFKgZYJe	1	1	1	WFT1
1135	ryCTUnerAbcZlVGYuTqlJDUNwMDRhl	1	1	1	WFT2
1136	yVkgHNoDKRKUDcSGGBdrIUyRYgDTAB	1	1	1	WFT2
1137	aDMMSNvDzCVhkZewDstDZIIYuWTAXV	1	1	1	WFT1
1138	OkjoKAUPSpUJYLDJEDQEiEgfXJkqNn	1	1	1	WFT1
1139	RTPNpUhvHuxHmUMccfAQGDzusyobAf	1	1	1	WFT2
1140	CtwBHKkAjvYOduvokStfPVUNTslANx	1	1	1	WFT1
1141	teDQHRNpjFekUOUvnAzxdlIYzlufgK	1	1	1	WFT2
1142	igRNmGLhWmlHIgQQWQmKZlHuGIEKyG	1	1	1	WFT3
1143	lqYORzzkLCIqibkLIQQKNaOeSVtqlw	1	1	1	WFT2
1144	ydKndLbumaMvPpaDpuijqgwMWlkfyI	1	1	1	WFT1
1145	ucsDCJlUObDUJouVoGJXezqifXLeAC	1	1	1	WFT2
1146	JGSbrfgpiyigtYwfyldicdxQRDycmr	1	1	1	WFT3
1147	IzAcinbEtbboxlwUnFmkpcedfvxcLK	1	1	1	WFT2
1148	zFDpLmfQxrinrjDFNSGTpZBxYyIvbo	1	1	1	WFT2
1149	xfvMeqhCmsmKQdFFRAmZqgdqUbINZx	1	1	1	WFT2
1150	XQVpCpAlsDWudAOviUBjIEzHsInCky	1	1	1	WFT1
1151	VQaUGrUBGtvQvxklRNiNvsmEgQbYnM	1	1	1	WFT3
1152	VVrauXCuPcKZdLYMFtafcyXdGSxvJM	1	1	1	WFT2
1153	pBTlKDLEIqCDNWUWsRDbTxIlXjHKIy	1	1	1	WFT1
1154	JtsmLrEbFxTcTVLmfvqHskLIaUYlKZ	1	1	1	WFT3
1155	rUlDYuGYLAGDoPwGFtlOjjTRrfqjDQ	1	1	1	WFT1
1156	njFSJxsVJRqKtHbHePEuhvXIVrnHCG	1	1	1	WFT2
1157	wjmjBOZBNoNGUqehlnBbrvvXpLvGgF	1	1	1	WFT3
1158	wnIKZNGFyDdIfWulmDMxEDApWpjtCm	1	1	1	WFT3
1159	zVYvixoBANYovwPgjLFLSkybmuPJBD	1	1	1	WFT2
1160	tUGZrDhrWfQMpSEWGhGbwGUxhRhAaB	1	1	1	WFT2
1161	HOdroddILjaUthaNmpgInIhVgJkwBh	1	1	1	WFT2
1162	ZtsZanmrdJGPKmHhWdLdtGlnfOYJIL	1	1	1	WFT1
1163	mZoQowjDrxEdPctKQPwsFRTMMgyBdQ	1	1	1	WFT3
1164	ndNtfutmUydXLrriRemEAlMbCxvHWl	1	1	1	WFT3
1165	tgMGeONBNCCiLPUGvfkPdZhCHSDbuj	1	1	1	WFT2
1166	FmrgtZoOqKYzaYPDubbQoVOaDFhvcl	1	1	1	WFT1
1167	cwadTvvfqJpHfUbAcVBNVnHCWrnFad	1	1	1	WFT1
1168	wTxKKxNuuwIhtjAiCfJKqAjKfCiXYq	1	1	1	WFT3
1169	UuauQfjeyUgDgzCNmKTNvKZjdGGREZ	1	1	1	WFT3
1170	aCTewHrNUIAMmCpYEOkACHLakoAuDd	1	1	1	WFT1
1171	ibNmdGctIGSPcOajGGIARnosItAJfC	1	1	1	WFT1
1172	ioEAkKBOklfSwbbjHcXmpphmjcJZDm	1	1	1	WFT2
1173	TwmXctZLtmnFbiuRJvgZeCDxzSZMuW	1	1	1	WFT1
1174	MbezMAamdbarXgQzEcOQDSrnYdqTrW	1	1	1	WFT1
1175	gQGYoVOhVNvBPJgtrEZVnxtxYWqUgR	1	1	1	WFT1
1176	OPwvEyKnuSVpbfkXIJHkamYGbpGGLb	1	1	1	WFT1
1177	rxWdQRqnKStFasQrlRkRGQIblifALG	1	1	1	WFT2
1178	psszUkZTBTVxesJpGgFWrGMHoPrMDu	1	1	1	WFT3
1179	nfjxiZevrnqkgMCSXqvulSUmjKvcwh	1	1	1	WFT3
1180	bMrlbmskEdBpTopIPeSKIUdPsEzoFc	1	1	1	WFT1
1181	sJlVHbfeFbbeEVCQerfzRhQpzkoseU	1	1	1	WFT2
1182	QnAswbuoxUgsDePgAbqbTpIwshSWub	1	1	1	WFT2
1183	ytYQJRmPztxLiKHMSieZfJBgODJaNC	1	1	1	WFT3
1184	mhIfMtBfhqmRgQGvSKPAUTabBCIIFJ	1	1	1	WFT1
1185	WhOxVNRhFsTDGSXbNtMmOrnRzXmJeg	1	1	1	WFT2
1186	NErYnbmqHUbnGvPKclZAbMPwhIoOCE	1	1	1	WFT3
1187	JowyiCGtyKfoUdzoQmjzRAckNpxMBh	1	1	1	WFT2
1188	MLcAihQfMvFVkHxlAPWkmfBqERBxGW	1	1	1	WFT2
1189	xrRttzMQzcthXFkPUYkbkfcOJVNQwB	1	1	1	WFT3
1190	WVjeQuvQiwGizUCfNWvykoCPmfcNIO	1	1	1	WFT2
1191	AvuVrFlsLBWmwPVawbiUmOOoTxPTzS	1	1	1	WFT3
1192	LBVZFkjqLrEBJgoomDwlYbPwdojVtm	1	1	1	WFT3
1193	zGunOhqLRJqgHZHMGfKnElCCMEHtUq	1	1	1	WFT2
1194	ESFyurALNsHjbmmDygecOKwIyJiglG	1	1	1	WFT2
1195	lroCJGDujtGGQBbucDoIIwjJDFflrN	1	1	1	WFT1
1196	aDSjirjRcyklZXQouwbnBZCDrdDnES	1	1	1	WFT3
1197	SozZyESwwVubxQrkfIKgIVieGuCZIf	1	1	1	WFT3
1198	zpoHBFjSggQtLfObvVLTXmKlyyJlYk	1	1	1	WFT2
1199	luPFMiQEnmrkRiFxNxQUWMfKDJJYpo	1	1	1	WFT3
1200	xLzRYEfUaEqftdYNHqPASPZDTTdexI	1	1	1	WFT3
1201	igDPpYikvjQCnOXpmfxOkHTwNCaJTb	1	1	1	WFT3
1202	KTnqUUHUSxlwJmryIXQvxSLAdeaIWI	1	1	1	WFT2
1203	qMyujfKTtKZKLSGPrROkQZFNaWoiGN	1	1	1	WFT1
1204	dMdqYJiZBnluKJobAfxEkMQrhXqsak	1	1	1	WFT2
1205	xEuOfdAnrfpMOUrTIbxQtHtWDbHyZN	1	1	1	WFT2
1206	EgkRfhejTqgdiihNPpuCrPTrErfWxV	1	1	1	WFT1
1207	QhpgLpTlCFmqHpFvoAaTylcVULBiuN	1	1	1	WFT3
1208	rfzwFLXQBbSoCRzsGuBlsVblNoYrbh	1	1	1	WFT2
1209	qUXBXnNoCjViVVNidEvlPjvxpAPvtq	1	1	1	WFT3
1210	mQjNEHeAvDOMFXoOTSgvlzwSeJzbDj	1	1	1	WFT3
1211	yHnmjPoCRWCITuKRmuSxDpajEkYbQy	1	1	1	WFT1
1212	xdbzjzRKteSLidOEeRayVqQWGBYStv	1	1	1	WFT1
1213	KMqZhhXGIXoyoLuBNjSeOSLtYhuMzB	1	1	1	WFT3
1214	HPVVqbvhDeSHsnMDQGVkDRxHvSsoZW	1	1	1	WFT3
1215	RTJIIBirhnZsBXDogChQHXHUxkYKGl	1	1	1	WFT3
1216	QXsMaFgniVnhOONlhavYQlDnoqfUhb	1	1	1	WFT1
1217	leDSpEpwKgWwlSUCpJbFpFgkOnCOqA	1	1	1	WFT3
1218	frONbpLiEyMkKUJKVtoaxyKbeEdGXv	1	1	1	WFT3
1219	sUsTtFlNoaVNqboQyyKqaYWnxNnAhN	1	1	1	WFT2
1220	rhgcvTchQohiGocKxIOWSaaYHuoEdT	1	1	1	WFT3
1221	VVcLaFsgprwluGpyJXowANsrSgvJsV	1	1	1	WFT2
1222	MdzffOjYCsZsbzRIpTkrdZmclyHxne	1	1	1	WFT2
1223	eiiHnmThZDExHOmDyqdWySkxPCtvzO	1	1	1	WFT2
1224	dvkNTDdMhGoEVBOmbGQGdsjOELuwZt	1	1	1	WFT2
1225	YFHlBPtYEnCXvCrcGUOLatDGNyDtik	1	1	1	WFT1
1226	NTgqeqmtnebShlRZLUIDCFWNelkRRH	1	1	1	WFT1
1227	uvESfDxbZBUzAYURbQqtqOrlkVaEvI	1	1	1	WFT1
1228	bnHQazuxlDyWLIbLxGwaLhdMFMyPiF	1	1	1	WFT1
1229	LxqkfYnmNlHzWKMPPKeWALLMxatTLn	1	1	1	WFT3
1230	strfPVAPPBSyUMjUXLlXxfOzDBKMww	1	1	1	WFT2
1231	vNOYuzNFJpyBKhQRvautjKlTyVxaau	1	1	1	WFT3
1232	UwKnywSOhVxdsQcHDPJaMWicSaWGOr	1	1	1	WFT3
1233	HcOgSvCdedOzStmEOrgLqgnDZvERMp	1	1	1	WFT3
1234	DabzGWyEasPCVTdlBXBrUtCaPWNqWi	1	1	1	WFT1
1235	maVBvhGrFJQrVjIveXXJfDQkMiRACD	1	1	1	WFT1
1236	tsmfQZOfuAJvxJSdYwxuwiSQNrBHaJ	1	1	1	WFT1
1237	iZoASimQhaQTkQkSAXaDqZVHWMThDV	1	1	1	WFT1
1238	pmpywQdMDCMLMOAiYZwGBkfLeHsEnb	1	1	1	WFT3
1239	JuzKctjLrVWBIMxhTwTZECdasnsYXT	1	1	1	WFT3
1240	NHquHUoGHknrDhCvOevVYkcZIgTuUV	1	1	1	WFT1
1241	JnDxjEukliAuAhJDQvynqkzDntosgn	1	1	1	WFT2
1242	uPuLwIwBnvbBehXIRHhxDdxzknZuFJ	1	1	1	WFT3
1243	PQGFBuRNYqKBzRIbSndndleOsxpzZJ	1	1	1	WFT2
1244	kQHOYMMfuHgVbIGRhzufvpkKyBMutq	1	1	1	WFT1
1245	NpUmxKZSilKilPsXXroQBSSiListMp	1	1	1	WFT1
1246	wzRzisDFSsRFPsQYTTusfONWcHQCuu	1	1	1	WFT3
1247	SNXOkNUMQBsJUtYAhWGZZOkkGTAqSb	1	1	1	WFT2
1248	ExFaeuLKtYeEQIupGiaiDCsKYWuvtl	1	1	1	WFT1
1249	jcYNtenoEvWSjHCyKUWJXHNUGcclQB	1	1	1	WFT3
1250	OIJZYCVBiCoiiGmJfZzAgZFeRvqLUb	1	1	1	WFT1
1251	POVeuZUcoeYomFqkFZtaKwFBsFVIpM	1	1	1	WFT1
1252	BaLLzGhDOXEiPAcETzwjLWLdVSzYxa	1	1	1	WFT2
1253	PpeuckjMHxBOoeGuNmuMhVAoLjQUuO	1	1	1	WFT1
1254	tsJArQAwPIDCriTLxWHCbPrMoKUOvQ	1	1	1	WFT3
1255	qmhkWiKkYUFNMqODblsTHAaeDtiitj	1	1	1	WFT3
1256	oREdXzjLVowTZlWidDKAcNYWeMqmkU	1	1	1	WFT3
1257	vBlWDBWZJpzcXRwxAZLSZTIcZQvGRe	1	1	1	WFT3
1258	cKbbtCtUNFpLklVPsjgPHRyleKspvL	1	1	1	WFT3
1259	IgEMuDuxlqEhazuiNCMJWfXPTZjKWa	1	1	1	WFT1
1260	FrtPrxBVtepOAynZVBRMyIcqVfsYik	1	1	1	WFT3
1261	iCBsLOfXIRsaveyEsNzFWDXoOSCHWW	1	1	1	WFT2
1262	qWRRityzOzKPmhCBDOILqdLWXlxWyu	1	1	1	WFT1
1263	EPNmzoazEJWrnqxMQdfHAqYYQgjREx	1	1	1	WFT1
1264	uZxooIDIFqbLXFSfoVGatjNpEmxWdn	1	1	1	WFT2
1265	DsTboryoBVPXKnzvRUsGQUCjuAByxM	1	1	1	WFT2
1266	BBcOkXpnpNRHUGUsDLDzLGfzNeQouK	1	1	1	WFT2
1267	yOrPVSeosIZCMTmneZiLJwHcpunXWd	1	1	1	WFT2
1268	uOADdnjhBnnibicNrVzutjAJQwtbeM	1	1	1	WFT1
1269	kKMfdaIowZqcWBHuifGhbnlvOgnQqA	1	1	1	WFT1
1270	KDceHvfbqqQEuSUzSJmokpMRTScTcd	1	1	1	WFT3
1271	VFzTASyEmLgVWbyhBWiCwYimiTKpdF	1	1	1	WFT1
1272	cjpFamTQiIeNKpSIImLIUqHVkoWAQs	1	1	1	WFT3
1273	dDgGJJdXBGJZfrkDAqYTQsFJbcUgnM	1	1	1	WFT2
1274	yJxRFvYzRhCyHnexCVLmnTTrSUjhnI	1	1	1	WFT3
1275	FhQQAcdRbwSHagWQXVufxINktYQhRb	1	1	1	WFT3
1276	WsplzBnsLppPAmedVLLYDDiuuxVbMY	1	1	1	WFT1
1277	SDwknrIHGoEwFWFohLGJkhDcNWCXaE	1	1	1	WFT2
1278	UpLRnNaPLDtOUqHZkcvzAhzHbOQwiA	1	1	1	WFT2
1279	fvwxbZEOxsABHnTLbNQBCfyBxkdKHH	1	1	1	WFT2
1280	uefTaSdIOgIMwebGTXkVYfLRQGDKEg	1	1	1	WFT3
1281	ygYoHBuOxUakUoZDiKgEJQymhICsNh	1	1	1	WFT3
1282	FrMpbNSBjEEPhfxgOvJnArbUHpHKUP	1	1	1	WFT2
1283	wUJNIEnjXryVkZtDRGPSzvIFjSCOrs	1	1	1	WFT1
1284	JMRRdxlVJJSHGoqRdNTWlyyzxFnEme	1	1	1	WFT3
1285	ArXwiLTjVLgSNCYhlkxjAxAYhqJAgx	1	1	1	WFT3
1286	EboUSInCSIkgoJJioaDAGjEGdZbtod	1	1	1	WFT3
1287	PobqNQFakIGMUvNZcKPprBLTJJfmvi	1	1	1	WFT3
1288	bvlJpOxykRyPmRiVXsyngkxwKtgcQJ	1	1	1	WFT2
1289	vXjiFNTdIwfBLoCQUwRzaGCLoGEjkV	1	1	1	WFT3
1290	SgJNxhXAaQMYKYgkYnfshbGWipWlzL	1	1	1	WFT2
1291	wAgccxxXibWnvPiFnYfXJdEYknNVOP	1	1	1	WFT3
1292	jmjhjfGYSsbXRfpdTjtEJPzZYvJOsf	1	1	1	WFT3
1293	AgoBUiPqhXDboiSHUjmMvmwTOIadhX	1	1	1	WFT3
1294	HSvhWwDYEddLoIeqkYExHfcCQudChN	1	1	1	WFT3
1295	PhzWhvzDAchWStFgQlvjTzRNUTzgBh	1	1	1	WFT2
1296	goXpJuSoNbwNPtufCicfrZWVPfGxeq	1	1	1	WFT2
1297	blSCDRzJrZfqtSkJJpkdaJRIoeVlmo	1	1	1	WFT3
1298	yaJRQlAsRKkYdyHWRNUYLjTbkBMHfw	1	1	1	WFT2
1299	yNlQANkTIqwoWeJMASlkhCOeQlrqXW	1	1	1	WFT1
1300	xfxtaMUKKDgGIercjyyCqasTxbhJDC	1	1	1	WFT3
1301	MCNnCsnnFjViXwtJqjRokdsBYSxNuf	1	1	1	WFT1
1302	AwldxgtugupNQFcDyLbojZZjRFxOQl	1	1	1	WFT3
1303	NmGIEghqZsFFDqpELBcpXeRHsDOAGk	1	1	1	WFT1
1304	ZwbHXSOBzZfifqqLUzWfJCSdYxhZvk	1	1	1	WFT2
1305	cMztRwsdqDuBoLNmcDVPdsDmtdqePl	1	1	1	WFT3
1306	thgZHHmUnnpOMFzMGyoEuNuUMOwmmZ	1	1	1	WFT2
1307	xxYvyvMukkLLrCZwSPVWHjWDGpSFnt	1	1	1	WFT2
1308	hCdzWjIVEZIBaphMHOAPPrcBzGjaZv	1	1	1	WFT3
1309	SZDreHwgtYUltSQtCWiPXdVXWaredO	1	1	1	WFT2
1310	sWzRXToLmSWkizpgvfpTVUdhFNRyfx	1	1	1	WFT1
\.


--
-- TOC entry 3790 (class 0 OID 16761)
-- Dependencies: 257
-- Data for Name: rooms_windowfittings_windows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_windowfittings_windows (id, windowfittings_id, window_id) FROM stdin;
2431	811	1782
2432	811	2182
2433	811	2587
2434	812	2181
2435	812	2399
2436	812	2083
2437	813	1790
2438	813	2414
2439	813	2180
2440	814	1679
2441	814	1970
2442	814	2036
2443	815	1685
2444	815	2050
2445	815	1981
2446	816	2148
2447	816	1770
2448	816	2332
2449	817	2091
2450	817	1693
2451	817	2367
2452	818	2303
2453	818	2429
2454	818	2400
2455	819	2082
2456	819	2498
2457	819	2262
2458	820	2262
2459	820	1689
2460	820	2015
2461	821	1866
2462	821	2436
2463	821	2373
2464	822	1947
2465	822	2321
2466	822	2510
2467	823	2428
2468	823	2257
2469	823	1639
2470	824	2070
2471	824	1741
2472	824	2570
2473	825	2607
2474	825	2461
2475	825	2110
2476	826	1710
2477	826	2435
2478	826	2259
2479	827	2299
2480	827	2196
2481	827	2015
2482	828	2059
2483	828	1714
2484	828	1717
2485	829	1834
2486	829	1965
2487	829	2237
2488	830	2071
2489	830	2293
2490	830	1784
2491	831	2124
2492	831	2056
2493	831	1661
2494	832	1825
2495	832	2526
2496	832	2051
2497	833	1642
2498	833	1986
2499	833	1696
2500	834	1916
2501	834	2341
2502	834	1700
2503	835	1684
2504	835	2551
2505	835	2151
2506	836	2341
2507	836	2451
2508	836	2120
2509	837	2619
2510	837	2283
2511	837	1952
2512	838	2463
2513	838	2384
2514	838	1697
2515	839	2563
2516	839	1921
2517	839	2216
2518	840	2388
2519	840	2552
2520	840	2176
2521	841	2172
2522	841	2072
2523	841	1671
2524	842	1888
2525	842	2364
2526	842	2568
2527	843	2362
2528	843	2214
2529	843	2022
2530	844	2187
2531	844	1918
2532	844	1851
2533	845	1747
2534	845	2149
2535	845	2010
2536	846	2449
2537	846	1924
2538	846	2403
2539	847	1781
2540	847	1949
2541	847	1771
2542	848	2606
2543	848	1720
2544	848	1972
2545	849	1698
2546	849	2351
2547	849	1622
2548	850	2330
2549	850	2256
2550	850	2485
2551	851	2446
2552	851	2067
2553	851	2168
2554	852	2508
2555	852	2585
2556	852	1982
2557	853	2430
2558	853	2406
2559	853	2296
2560	854	1940
2561	854	2239
2562	854	2429
2563	855	2005
2564	855	2370
2565	855	2248
2566	856	2343
2567	856	2366
2568	856	1772
2569	857	2459
2570	857	1994
2571	857	1801
2572	858	2378
2573	858	1782
2574	858	1799
2575	859	1834
2576	859	2240
2577	859	2285
2578	860	2220
2579	860	1653
2580	860	2207
2581	861	2282
2582	861	2388
2583	861	2193
2584	862	2052
2585	862	2473
2586	862	2490
2587	863	2088
2588	863	1782
2589	863	1874
2590	864	2294
2591	864	1646
2592	864	2158
2593	865	1801
2594	865	1871
2595	865	2351
2596	866	1802
2597	866	1779
2598	866	2453
2599	867	1819
2600	867	2536
2601	867	2593
2602	868	2189
2603	868	1769
2604	868	2553
2605	869	1653
2606	869	2227
2607	869	1689
2608	870	2479
2609	870	1877
2610	870	2487
2611	871	2415
2612	871	2467
2613	871	1894
2614	872	1655
2615	872	2494
2616	872	1782
2617	873	2223
2618	873	2297
2619	873	2424
2620	874	2078
2621	874	2134
2622	874	1708
2623	875	1820
2624	875	2056
2625	875	2176
2626	876	2386
2627	876	1721
2628	876	2545
2629	877	2495
2630	877	1707
2631	877	1754
2632	878	1774
2633	878	2594
2634	878	2352
2635	879	2486
2636	879	1955
2637	879	2012
2638	880	2069
2639	880	2302
2640	880	2023
2641	881	1688
2642	881	2561
2643	881	2155
2644	882	2487
2645	882	2237
2646	882	2321
2647	883	2450
2648	883	1980
2649	883	2460
2650	884	2380
2651	884	1939
2652	884	1908
2653	885	2560
2654	885	2512
2655	885	2318
2656	886	2283
2657	886	1777
2658	886	2384
2659	887	2197
2660	887	2591
2661	887	1810
2662	888	1863
2663	888	2048
2664	888	2526
2665	889	2493
2666	889	2586
2667	889	2192
2668	890	1983
2669	890	1848
2670	890	2533
2671	891	2390
2672	891	2005
2673	891	2006
2674	892	2335
2675	892	1679
2676	892	2291
2677	893	1691
2678	893	2062
2679	893	2280
2680	894	1969
2681	894	1852
2682	894	1635
2683	895	2023
2684	895	1979
2685	895	2534
2686	896	2457
2687	896	1680
2688	896	2458
2689	897	2521
2690	897	1789
2691	897	2190
2692	898	2194
2693	898	2517
2694	898	1897
2695	899	2015
2696	899	2291
2697	899	2618
2698	900	2343
2699	900	2394
2700	900	2488
2701	901	1856
2702	901	2154
2703	901	1891
2704	902	2364
2705	902	1757
2706	902	2596
2707	903	2405
2708	903	1970
2709	903	1724
2710	904	2388
2711	904	2192
2712	904	1701
2713	905	1939
2714	905	2402
2715	905	2134
2716	906	2335
2717	906	1681
2718	906	2556
2719	907	2339
2720	907	2239
2721	907	2571
2722	908	1657
2723	908	2049
2724	908	2125
2725	909	2050
2726	909	1695
2727	909	2509
2728	910	2209
2729	910	2406
2730	910	2552
2731	911	2568
2732	911	2618
2733	911	2091
2734	912	1820
2735	912	2123
2736	912	1915
2737	913	2479
2738	913	2132
2739	913	2465
2740	914	2288
2741	914	1712
2742	914	2440
2743	915	1997
2744	915	2141
2745	915	2524
2746	916	2042
2747	916	2339
2748	916	2243
2749	917	2234
2750	917	1786
2751	917	2620
2752	918	2350
2753	918	2407
2754	918	2601
2755	919	2518
2756	919	1873
2757	919	1892
2758	920	2174
2759	920	2573
2760	920	1702
2761	921	1744
2762	921	2092
2763	921	1711
2764	922	2070
2765	922	2250
2766	922	2330
2767	923	2316
2768	923	1747
2769	923	1702
2770	924	2177
2771	924	1894
2772	924	2514
2773	925	2308
2774	925	2160
2775	925	1718
2776	926	2096
2777	926	2092
2778	926	1621
2779	927	1663
2780	927	1938
2781	927	1731
2782	928	2181
2783	928	1745
2784	928	2437
2785	929	2532
2786	929	2411
2787	929	2524
2788	930	1690
2789	930	1962
2790	930	2075
2791	931	1700
2792	931	1711
2793	931	2424
2794	932	2172
2795	932	2510
2796	932	2425
2797	933	2474
2798	933	1814
2799	933	2512
2800	934	2151
2801	934	2229
2802	934	2482
2803	935	2377
2804	935	1882
2805	935	2047
2806	936	1965
2807	936	1712
2808	936	2567
2809	937	2313
2810	937	1944
2811	937	2190
2812	938	1731
2813	938	2400
2814	938	2303
2815	939	1627
2816	939	2193
2817	939	2587
2818	940	1887
2819	940	2220
2820	940	2589
2821	941	1773
2822	941	2611
2823	941	1809
2824	942	1685
2825	942	1759
2826	942	1862
2827	943	1710
2828	943	2375
2829	943	2406
2830	944	2167
2831	944	2439
2832	944	2471
2833	945	2446
2834	945	1621
2835	945	2153
2836	946	1874
2837	946	1912
2838	946	2361
2839	947	2128
2840	947	2385
2841	947	2362
2842	948	2070
2843	948	1879
2844	948	1921
2845	949	1966
2846	949	1741
2847	949	2533
2848	950	1969
2849	950	2602
2850	950	1757
2851	951	1957
2852	951	1774
2853	951	2254
2854	952	1961
2855	952	1706
2856	952	2237
2857	953	1726
2858	953	2347
2859	953	1757
2860	954	2403
2861	954	2130
2862	954	2132
2863	955	2500
2864	955	2202
2865	955	1688
2866	956	2025
2867	956	2474
2868	956	2237
2869	957	2084
2870	957	2513
2871	957	1938
2872	958	2235
2873	958	2297
2874	958	2166
2875	959	2493
2876	959	2254
2877	959	1691
2878	960	2264
2879	960	2440
2880	960	2235
2881	961	1642
2882	961	2284
2883	961	1990
2884	962	1685
2885	962	2166
2886	962	2455
2887	963	1966
2888	963	2178
2889	963	2432
2890	964	2220
2891	964	2113
2892	964	2159
2893	965	2446
2894	965	2133
2895	965	2089
2896	966	2244
2897	966	1794
2898	966	2002
2899	967	1692
2900	967	2251
2901	967	2195
2902	968	2028
2903	968	2597
2904	968	1652
2905	969	2088
2906	969	1631
2907	969	2515
2908	970	2052
2909	970	1903
2910	970	1689
2911	971	2067
2912	971	2453
2913	971	1638
2914	972	2564
2915	972	2071
2916	972	2495
2917	973	2455
2918	973	1824
2919	973	2381
2920	974	2325
2921	974	1646
2922	974	2021
2923	975	2465
2924	975	2256
2925	975	2358
2926	976	2431
2927	976	2401
2928	976	2293
2929	977	2201
2930	977	2296
2931	977	2451
2932	978	2095
2933	978	1773
2934	978	2019
2935	979	2322
2936	979	2401
2937	979	1642
2938	980	1856
2939	980	1634
2940	980	2143
2941	981	2473
2942	981	1722
2943	981	1673
2944	982	2111
2945	982	1958
2946	982	2502
2947	983	2226
2948	983	1987
2949	983	1741
2950	984	2302
2951	984	2001
2952	984	2209
2953	985	1707
2954	985	2591
2955	985	1656
2956	986	2271
2957	986	1645
2958	986	2281
2959	987	1731
2960	987	2321
2961	987	1816
2962	988	2408
2963	988	1715
2964	988	2151
2965	989	2386
2966	989	2571
2967	989	1876
2968	990	1685
2969	990	1933
2970	990	1777
2971	991	2609
2972	991	2492
2973	991	1909
2974	992	1914
2975	992	2474
2976	992	1763
2977	993	2493
2978	993	2557
2979	993	1776
2980	994	1762
2981	994	1845
2982	994	2547
2983	995	1822
2984	995	1680
2985	995	1991
2986	996	2152
2987	996	2428
2988	996	2285
2989	997	1853
2990	997	1770
2991	997	2267
2992	998	2367
2993	998	2221
2994	998	1942
2995	999	2365
2996	999	1674
2997	999	1823
2998	1000	2564
2999	1000	2459
3000	1000	1980
3001	1001	1691
3002	1001	1777
3003	1001	2037
3004	1002	2575
3005	1002	2253
3006	1002	1869
3007	1003	1822
3008	1003	2190
3009	1003	2309
3010	1004	2585
3011	1004	1622
3012	1004	2431
3013	1005	2610
3014	1005	2529
3015	1005	1775
3016	1006	2609
3017	1006	2534
3018	1006	2470
3019	1007	1772
3020	1007	2054
3021	1007	1719
3022	1008	1943
3023	1008	2270
3024	1008	2061
3025	1009	2407
3026	1009	2214
3027	1009	2419
3028	1010	1648
3029	1010	1812
3030	1010	2231
3031	1011	2102
3032	1011	1792
3033	1011	2390
3034	1012	2452
3035	1012	2184
3036	1012	2118
3037	1013	2014
3038	1013	2566
3039	1013	2383
3040	1014	1775
3041	1014	2063
3042	1014	1678
3043	1015	1912
3044	1015	1864
3045	1015	2491
3046	1016	1863
3047	1016	2056
3048	1016	2571
3049	1017	1742
3050	1017	2030
3051	1017	2366
3052	1018	1959
3053	1018	1924
3054	1018	2364
3055	1019	2450
3056	1019	1693
3057	1019	1734
3058	1020	2501
3059	1020	1735
3060	1020	2376
3061	1021	2154
3062	1021	1684
3063	1021	2521
3064	1022	1737
3065	1022	2016
3066	1022	1629
3067	1023	1735
3068	1023	2192
3069	1023	2484
3070	1024	2376
3071	1024	2498
3072	1024	1657
3073	1025	2187
3074	1025	1743
3075	1025	2200
3076	1026	2261
3077	1026	2095
3078	1026	2596
3079	1027	2430
3080	1027	1663
3081	1027	1678
3082	1028	2106
3083	1028	2328
3084	1028	1712
3085	1029	1814
3086	1029	1794
3087	1029	2076
3088	1030	1996
3089	1030	2394
3090	1030	2077
3091	1031	1657
3092	1031	1634
3093	1031	2532
3094	1032	2482
3095	1032	2084
3096	1032	2010
3097	1033	2144
3098	1033	2419
3099	1033	2553
3100	1034	2457
3101	1034	2122
3102	1034	1818
3103	1035	2042
3104	1035	1854
3105	1035	2389
3106	1036	1892
3107	1036	2032
3108	1036	2573
3109	1037	2084
3110	1037	1654
3111	1037	2213
3112	1038	2460
3113	1038	2040
3114	1038	2299
3115	1039	1677
3116	1039	2299
3117	1039	1776
3118	1040	1641
3119	1040	2291
3120	1040	2358
3121	1041	2202
3122	1041	2595
3123	1041	1825
3124	1042	2429
3125	1042	2349
3126	1042	2242
3127	1043	2572
3128	1043	2513
3129	1043	2474
3130	1044	2018
3131	1044	2134
3132	1044	1973
3133	1045	2130
3134	1045	2201
3135	1045	1916
3136	1046	2229
3137	1046	1969
3138	1046	1843
3139	1047	2458
3140	1047	1998
3141	1047	2384
3142	1048	2046
3143	1048	1690
3144	1048	1962
3145	1049	2321
3146	1049	1864
3147	1049	2136
3148	1050	1653
3149	1050	2334
3150	1050	2040
3151	1051	2268
3152	1051	1840
3153	1051	2361
3154	1052	2406
3155	1052	2077
3156	1052	1887
3157	1053	1753
3158	1053	2248
3159	1053	2283
3160	1054	2432
3161	1054	2228
3162	1054	2342
3163	1055	1709
3164	1055	2047
3165	1055	2334
3166	1056	2027
3167	1056	2230
3168	1056	1723
3169	1057	2323
3170	1057	2272
3171	1057	2072
3172	1058	2182
3173	1058	1954
3174	1058	2470
3175	1059	2215
3176	1059	1801
3177	1059	1662
3178	1060	1895
3179	1060	2394
3180	1060	2520
3181	1061	2106
3182	1061	2541
3183	1061	1639
3184	1062	1642
3185	1062	2522
3186	1062	1660
3187	1063	1778
3188	1063	2614
3189	1063	2137
3190	1064	2395
3191	1064	2489
3192	1064	2051
3193	1065	1746
3194	1065	1851
3195	1065	2588
3196	1066	2461
3197	1066	1688
3198	1066	1756
3199	1067	2107
3200	1067	2591
3201	1067	1804
3202	1068	2226
3203	1068	2503
3204	1068	2486
3205	1069	2123
3206	1069	2223
3207	1069	2221
3208	1070	2290
3209	1070	1911
3210	1070	1959
3211	1071	1837
3212	1071	2216
3213	1071	2428
3214	1072	2107
3215	1072	2564
3216	1072	2348
3217	1073	1730
3218	1073	1928
3219	1073	1867
3220	1074	2367
3221	1074	1638
3222	1074	2478
3223	1075	2166
3224	1075	2252
3225	1075	2304
3226	1076	2067
3227	1076	2010
3228	1076	1748
3229	1077	1711
3230	1077	2043
3231	1077	1797
3232	1078	2432
3233	1078	2041
3234	1078	2346
3235	1079	1866
3236	1079	1841
3237	1079	1703
3238	1080	2482
3239	1080	2302
3240	1080	2194
3241	1081	2115
3242	1081	2351
3243	1081	2206
3244	1082	2030
3245	1082	1723
3246	1082	1875
3247	1083	2443
3248	1083	1727
3249	1083	2295
3250	1084	1691
3251	1084	1713
3252	1084	2598
3253	1085	2314
3254	1085	2420
3255	1085	2608
3256	1086	1885
3257	1086	2448
3258	1086	2172
3259	1087	1749
3260	1087	1796
3261	1087	1652
3262	1088	1746
3263	1088	2343
3264	1088	2023
3265	1089	1843
3266	1089	2411
3267	1089	2177
3268	1090	1787
3269	1090	2243
3270	1090	1802
3271	1091	1935
3272	1091	1652
3273	1091	2010
3274	1092	2048
3275	1092	2484
3276	1092	1794
3277	1093	2581
3278	1093	1948
3279	1093	2354
3280	1094	1895
3281	1094	1958
3282	1094	1949
3283	1095	2072
3284	1095	1666
3285	1095	2181
3286	1096	2324
3287	1096	2008
3288	1096	2481
3289	1097	2450
3290	1097	1880
3291	1097	2102
3292	1098	1946
3293	1098	1903
3294	1098	2419
3295	1099	2277
3296	1099	2059
3297	1099	2297
3298	1100	2363
3299	1100	1842
3300	1100	2341
3301	1101	2166
3302	1101	2218
3303	1101	1865
3304	1102	2456
3305	1102	2343
3306	1102	2245
3307	1103	1935
3308	1103	1721
3309	1103	1896
3310	1104	1934
3311	1104	1888
3312	1104	1731
3313	1105	1629
3314	1105	2602
3315	1105	2433
3316	1106	2340
3317	1106	1779
3318	1106	1851
3319	1107	2063
3320	1107	2279
3321	1107	2377
3322	1108	2382
3323	1108	2203
3324	1108	1846
3325	1109	2568
3326	1109	1936
3327	1109	2107
3328	1110	2038
3329	1110	1996
3330	1110	2238
3331	1111	2029
3332	1111	2173
3333	1111	1647
3334	1112	2391
3335	1112	2183
3336	1112	2490
3337	1113	2135
3338	1113	2237
3339	1113	2506
3340	1114	1653
3341	1114	1890
3342	1114	2454
3343	1115	1921
3344	1115	2266
3345	1115	1795
3346	1116	2425
3347	1116	2204
3348	1116	2222
3349	1117	2293
3350	1117	1737
3351	1117	2187
3352	1118	2541
3353	1118	2608
3354	1118	2216
3355	1119	1952
3356	1119	1795
3357	1119	2512
3358	1120	2257
3359	1120	2216
3360	1120	2030
3361	1121	1711
3362	1121	1726
3363	1121	2190
3364	1122	2496
3365	1122	2109
3366	1122	1640
3367	1123	1953
3368	1123	1805
3369	1123	2602
3370	1124	2081
3371	1124	2511
3372	1124	1977
3373	1125	1742
3374	1125	1994
3375	1125	1872
3376	1126	2065
3377	1126	1903
3378	1126	2119
3379	1127	2216
3380	1127	1922
3381	1127	2405
3382	1128	1947
3383	1128	2557
3384	1128	2270
3385	1129	1780
3386	1129	1800
3387	1129	2118
3388	1130	1708
3389	1130	1931
3390	1130	2191
3391	1131	2360
3392	1131	1698
3393	1131	2185
3394	1132	2402
3395	1132	1700
3396	1132	1883
3397	1133	1733
3398	1133	2093
3399	1133	1894
3400	1134	2171
3401	1134	2457
3402	1134	1889
3403	1135	2077
3404	1135	1918
3405	1135	2549
3406	1136	1692
3407	1136	1971
3408	1136	2369
3409	1137	2512
3410	1137	2013
3411	1137	2157
3412	1138	1919
3413	1138	2579
3414	1138	2582
3415	1139	1974
3416	1139	2501
3417	1139	2535
3418	1140	2158
3419	1140	2444
3420	1140	1698
3421	1141	1866
3422	1141	1955
3423	1141	2262
3424	1142	1832
3425	1142	1754
3426	1142	1628
3427	1143	2168
3428	1143	1691
3429	1143	2094
3430	1144	2213
3431	1144	2388
3432	1144	2195
3433	1145	2050
3434	1145	1929
3435	1145	1672
3436	1146	2134
3437	1146	2130
3438	1146	1842
3439	1147	1790
3440	1147	1687
3441	1147	2355
3442	1148	1951
3443	1148	2333
3444	1148	2442
3445	1149	2008
3446	1149	2316
3447	1149	1985
3448	1150	2250
3449	1150	2614
3450	1150	1682
3451	1151	2264
3452	1151	1717
3453	1151	2270
3454	1152	1897
3455	1152	1636
3456	1152	2375
3457	1153	1802
3458	1153	2015
3459	1153	2114
3460	1154	1671
3461	1154	2475
3462	1154	1891
3463	1155	2611
3464	1155	2021
3465	1155	2117
3466	1156	1843
3467	1156	2365
3468	1156	1775
3469	1157	1994
3470	1157	2582
3471	1157	1877
3472	1158	2453
3473	1158	1942
3474	1158	2293
3475	1159	1711
3476	1159	1647
3477	1159	2301
3478	1160	2047
3479	1160	1621
3480	1160	2177
3481	1161	2283
3482	1161	1631
3483	1161	2589
3484	1162	2309
3485	1162	1625
3486	1162	1883
3487	1163	2210
3488	1163	1883
3489	1163	1956
3490	1164	1812
3491	1164	1862
3492	1164	2289
3493	1165	2471
3494	1165	1880
3495	1165	2027
3496	1166	1986
3497	1166	2135
3498	1166	2393
3499	1167	2043
3500	1167	1633
3501	1167	2539
3502	1168	1657
3503	1168	2214
3504	1168	2364
3505	1169	2413
3506	1169	2157
3507	1169	1908
3508	1170	2226
3509	1170	2237
3510	1170	2058
3511	1171	2261
3512	1171	2042
3513	1171	2566
3514	1172	2568
3515	1172	2173
3516	1172	1938
3517	1173	2334
3518	1173	1907
3519	1173	2613
3520	1174	1930
3521	1174	2485
3522	1174	1761
3523	1175	1713
3524	1175	2062
3525	1175	2592
3526	1176	2134
3527	1176	2206
3528	1176	2078
3529	1177	1786
3530	1177	1677
3531	1177	1808
3532	1178	2053
3533	1178	1921
3534	1178	2099
3535	1179	1632
3536	1179	2014
3537	1179	2314
3538	1180	2125
3539	1180	1918
3540	1180	2285
3541	1181	1709
3542	1181	2140
3543	1181	1692
3544	1182	1881
3545	1182	2541
3546	1182	1740
3547	1183	2103
3548	1183	1633
3549	1183	1685
3550	1184	2381
3551	1184	2384
3552	1184	1976
3553	1185	2456
3554	1185	1725
3555	1185	2370
3556	1186	1864
3557	1186	2392
3558	1186	2576
3559	1187	1933
3560	1187	2179
3561	1187	2509
3562	1188	1865
3563	1188	2515
3564	1188	1791
3565	1189	1852
3566	1189	1928
3567	1189	1906
3568	1190	2218
3569	1190	1807
3570	1190	1974
3571	1191	2177
3572	1191	2036
3573	1191	2002
3574	1192	2510
3575	1192	2448
3576	1192	1773
3577	1193	1704
3578	1193	2298
3579	1193	2617
3580	1194	2557
3581	1194	1997
3582	1194	2194
3583	1195	1732
3584	1195	2366
3585	1195	1921
3586	1196	2122
3587	1196	1756
3588	1196	2213
3589	1197	1836
3590	1197	1635
3591	1197	2050
3592	1198	2565
3593	1198	2589
3594	1198	1621
3595	1199	2520
3596	1199	2177
3597	1199	1798
3598	1200	1877
3599	1200	2222
3600	1200	1869
3601	1201	1855
3602	1201	1950
3603	1201	1723
3604	1202	2465
3605	1202	2543
3606	1202	2515
3607	1203	2163
3608	1203	1704
3609	1203	2457
3610	1204	2404
3611	1204	2414
3612	1204	1898
3613	1205	1824
3614	1205	2491
3615	1205	1847
3616	1206	2433
3617	1206	2288
3618	1206	2290
3619	1207	1917
3620	1207	2593
3621	1207	1859
3622	1208	2028
3623	1208	2129
3624	1208	1945
3625	1209	1891
3626	1209	1866
3627	1209	2377
3628	1210	1661
3629	1210	1772
3630	1210	2449
3631	1211	2548
3632	1211	1905
3633	1211	1631
3634	1212	2523
3635	1212	2213
3636	1212	2375
3637	1213	2202
3638	1213	1983
3639	1213	2618
3640	1214	2377
3641	1214	2017
3642	1214	2010
3643	1215	1970
3644	1215	2465
3645	1215	1698
3646	1216	2464
3647	1216	2484
3648	1216	1872
3649	1217	2272
3650	1217	1776
3651	1217	2407
3652	1218	2415
3653	1218	2278
3654	1218	2205
3655	1219	2386
3656	1219	1953
3657	1219	2194
3658	1220	2461
3659	1220	2032
3660	1220	2012
3661	1221	2455
3662	1221	2195
3663	1221	2505
3664	1222	2612
3665	1222	2181
3666	1222	1869
3667	1223	1871
3668	1223	2350
3669	1223	1723
3670	1224	1994
3671	1224	2512
3672	1224	2335
3673	1225	1814
3674	1225	2507
3675	1225	2157
3676	1226	2289
3677	1226	1799
3678	1226	2493
3679	1227	1659
3680	1227	2224
3681	1227	1892
3682	1228	2486
3683	1228	2506
3684	1228	2339
3685	1229	2614
3686	1229	1986
3687	1229	2296
3688	1230	2160
3689	1230	2299
3690	1230	2150
3691	1231	2299
3692	1231	2436
3693	1231	1703
3694	1232	2378
3695	1232	2328
3696	1232	2236
3697	1233	2479
3698	1233	2346
3699	1233	2039
3700	1234	2463
3701	1234	2244
3702	1234	2356
3703	1235	2384
3704	1235	2131
3705	1235	2187
3706	1236	2270
3707	1236	2542
3708	1236	2034
3709	1237	1733
3710	1237	2319
3711	1237	2159
3712	1238	2031
3713	1238	2037
3714	1238	2541
3715	1239	2200
3716	1239	2560
3717	1239	1849
3718	1240	1726
3719	1240	2246
3720	1240	2486
3721	1241	1849
3722	1241	2037
3723	1241	2436
3724	1242	2059
3725	1242	1716
3726	1242	1782
3727	1243	2418
3728	1243	2221
3729	1243	2173
3730	1244	2338
3731	1244	2281
3732	1244	2218
3733	1245	2081
3734	1245	2179
3735	1245	2376
3736	1246	1897
3737	1246	2501
3738	1246	2320
3739	1247	1791
3740	1247	2604
3741	1247	2093
3742	1248	2367
3743	1248	2323
3744	1248	1886
3745	1249	1824
3746	1249	2431
3747	1249	1653
3748	1250	1985
3749	1250	1824
3750	1250	2583
3751	1251	2183
3752	1251	2142
3753	1251	2131
3754	1252	2503
3755	1252	1758
3756	1252	1641
3757	1253	2039
3758	1253	2084
3759	1253	1844
3760	1254	2267
3761	1254	1678
3762	1254	1836
3763	1255	1962
3764	1255	2110
3765	1255	2438
3766	1256	1710
3767	1256	1766
3768	1256	1978
3769	1257	2012
3770	1257	2376
3771	1257	1923
3772	1258	1708
3773	1258	1682
3774	1258	2269
3775	1259	1849
3776	1259	1675
3777	1259	1913
3778	1260	2248
3779	1260	2387
3780	1260	2351
3781	1261	2198
3782	1261	2587
3783	1261	2368
3784	1262	2428
3785	1262	2103
3786	1262	1755
3787	1263	2120
3788	1263	1854
3789	1263	2498
3790	1264	2301
3791	1264	2240
3792	1264	1630
3793	1265	1761
3794	1265	2525
3795	1265	1744
3796	1266	1736
3797	1266	1958
3798	1266	1953
3799	1267	1825
3800	1267	2487
3801	1267	2123
3802	1268	1948
3803	1268	1722
3804	1268	2173
3805	1269	1817
3806	1269	2453
3807	1269	2145
3808	1270	1798
3809	1270	2162
3810	1270	2145
3811	1271	2452
3812	1271	1670
3813	1271	2455
3814	1272	2583
3815	1272	2522
3816	1272	2619
3817	1273	2599
3818	1273	2536
3819	1273	2511
3820	1274	1735
3821	1274	2502
3822	1274	1638
3823	1275	2456
3824	1275	2506
3825	1275	2032
3826	1276	2235
3827	1276	1627
3828	1276	2371
3829	1277	1758
3830	1277	2452
3831	1277	1826
3832	1278	2480
3833	1278	1901
3834	1278	1831
3835	1279	1765
3836	1279	1730
3837	1279	1982
3838	1280	2317
3839	1280	2574
3840	1280	2126
3841	1281	2470
3842	1281	2171
3843	1281	1809
3844	1282	2466
3845	1282	2430
3846	1282	2498
3847	1283	2057
3848	1283	2054
3849	1283	2092
3850	1284	2105
3851	1284	1661
3852	1284	2155
3853	1285	2129
3854	1285	2284
3855	1285	2398
3856	1286	1622
3857	1286	2169
3858	1286	1741
3859	1287	2570
3860	1287	2619
3861	1287	1627
3862	1288	2535
3863	1288	2471
3864	1288	2439
3865	1289	1766
3866	1289	1795
3867	1289	2142
3868	1290	2080
3869	1290	2335
3870	1290	2486
3871	1291	2166
3872	1291	2579
3873	1291	2010
3874	1292	2585
3875	1292	2587
3876	1292	1746
3877	1293	2119
3878	1293	1960
3879	1293	2619
3880	1294	1834
3881	1294	2604
3882	1294	1888
3883	1295	2221
3884	1295	2034
3885	1295	2587
3886	1296	1795
3887	1296	2435
3888	1296	2269
3889	1297	2166
3890	1297	2126
3891	1297	1838
3892	1298	1666
3893	1298	2468
3894	1298	1910
3895	1299	1944
3896	1299	2499
3897	1299	2205
3898	1300	1888
3899	1300	1908
3900	1300	2066
3901	1301	2471
3902	1301	2292
3903	1301	2002
3904	1302	2615
3905	1302	2327
3906	1302	2187
3907	1303	2145
3908	1303	1624
3909	1303	2489
3910	1304	2328
3911	1304	1865
3912	1304	2168
3913	1305	2224
3914	1305	1625
3915	1305	1929
3916	1306	1973
3917	1306	2198
3918	1306	2401
3919	1307	2103
3920	1307	1975
3921	1307	2058
3922	1308	1983
3923	1308	1866
3924	1308	2067
3925	1309	1654
3926	1309	1915
3927	1309	1880
3928	1310	2044
3929	1310	2287
3930	1310	2574
\.


--
-- TOC entry 3835 (class 0 OID 0)
-- Dependencies: 231
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3836 (class 0 OID 0)
-- Dependencies: 233
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3837 (class 0 OID 0)
-- Dependencies: 229
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- TOC entry 3838 (class 0 OID 0)
-- Dependencies: 237
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3839 (class 0 OID 0)
-- Dependencies: 235
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 3840 (class 0 OID 0)
-- Dependencies: 239
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3841 (class 0 OID 0)
-- Dependencies: 241
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3842 (class 0 OID 0)
-- Dependencies: 227
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- TOC entry 3843 (class 0 OID 0)
-- Dependencies: 225
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- TOC entry 3844 (class 0 OID 0)
-- Dependencies: 268
-- Name: rooms_bed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_bed_id_seq', 1310, true);


--
-- TOC entry 3845 (class 0 OID 0)
-- Dependencies: 270
-- Name: rooms_bed_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_bed_rooms_id_seq', 3930, true);


--
-- TOC entry 3846 (class 0 OID 0)
-- Dependencies: 264
-- Name: rooms_chair_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_chair_id_seq', 1310, true);


--
-- TOC entry 3847 (class 0 OID 0)
-- Dependencies: 266
-- Name: rooms_chair_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_chair_rooms_id_seq', 3930, true);


--
-- TOC entry 3848 (class 0 OID 0)
-- Dependencies: 244
-- Name: rooms_decoration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_decoration_id_seq', 1310, true);


--
-- TOC entry 3849 (class 0 OID 0)
-- Dependencies: 262
-- Name: rooms_decoration_souvenirs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_decoration_souvenirs_id_seq', 6550, true);


--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 246
-- Name: rooms_door_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_door_id_seq', 260, true);


--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 248
-- Name: rooms_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_room_id_seq', 1310, true);


--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 250
-- Name: rooms_souvenir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_souvenir_id_seq', 800, true);


--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 258
-- Name: rooms_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_table_id_seq', 1310, true);


--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 260
-- Name: rooms_table_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_table_rooms_id_seq', 3930, true);


--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 252
-- Name: rooms_window_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_window_id_seq', 2620, true);


--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 254
-- Name: rooms_windowfittings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_windowfittings_id_seq', 1310, true);


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 256
-- Name: rooms_windowfittings_windows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_windowfittings_windows_id_seq', 3930, true);


--
-- TOC entry 3521 (class 2606 OID 16712)
-- Name: rooms_decoration rooms_decoration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_decoration
    ADD CONSTRAINT rooms_decoration_pkey PRIMARY KEY (id);


--
-- TOC entry 3526 (class 2606 OID 16721)
-- Name: rooms_door rooms_door_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_door
    ADD CONSTRAINT rooms_door_pkey PRIMARY KEY (id);


--
-- TOC entry 3533 (class 2606 OID 16730)
-- Name: rooms_room rooms_room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_room
    ADD CONSTRAINT rooms_room_pkey PRIMARY KEY (id);


--
-- TOC entry 3543 (class 2606 OID 16748)
-- Name: rooms_window rooms_window_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_window
    ADD CONSTRAINT rooms_window_pkey PRIMARY KEY (id);


--
-- TOC entry 272 (class 1259 OID 17035)
-- Name: rooms_related_objects; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.rooms_related_objects AS
 WITH room_id_door_decoration AS (
         SELECT room.id,
            jsonb_build_object('id', door.id, 'name', door.name, 'width', door.width, 'length', door.length, 'height', door.height, 'type', door.type) AS door,
            jsonb_build_object('id', decoration.id, 'name', decoration.name, 'souvenirs', jsonb_agg(souvenir.*)) AS decoration
           FROM ((((public.rooms_room room
             LEFT JOIN public.rooms_door door ON ((room.door_id = door.id)))
             LEFT JOIN public.rooms_decoration decoration ON ((room.decoration_id = decoration.id)))
             LEFT JOIN public.rooms_decoration_souvenirs ds ON ((decoration.id = ds.decoration_id)))
             LEFT JOIN public.rooms_souvenir souvenir ON ((ds.souvenir_id = souvenir.id)))
          GROUP BY room.id, door.id, decoration.id
        ), windows_in_room_by_id AS (
         WITH room_window_fittings AS (
                 SELECT win.room_id,
                    json_build_object('id', win.id, 'name', win.name, 'width', win.width, 'length', win.length, 'height', win.height, 'type', win.type, 'fittings', jsonb_agg(wf.*)) AS window_in_room
                   FROM ((public.rooms_window win
                     LEFT JOIN public.rooms_windowfittings_windows rwfw ON ((rwfw.window_id = win.id)))
                     LEFT JOIN public.rooms_windowfittings wf ON ((wf.id = rwfw.windowfittings_id)))
                  GROUP BY win.room_id, win.id
                )
         SELECT room_window_fittings.room_id AS id,
            jsonb_agg(room_window_fittings.window_in_room) AS windows
           FROM room_window_fittings
          GROUP BY room_window_fittings.room_id
        ), parameters_and_beds_in_room_by_id AS (
         SELECT room.id,
            room.name,
            room.width,
            room.length,
            room.height,
            room.type,
            jsonb_agg(bed.*) AS beds
           FROM ((public.rooms_room room
             LEFT JOIN public.rooms_bed_rooms bed_i ON ((room.id = bed_i.room_id)))
             LEFT JOIN public.rooms_bed bed ON ((bed.id = bed_i.bed_id)))
          GROUP BY room.id
        ), chairs_in_room_by_id AS (
         SELECT room.id,
            jsonb_agg(chair.*) AS chairs
           FROM ((public.rooms_room room
             LEFT JOIN public.rooms_chair_rooms chair_i ON ((room.id = chair_i.room_id)))
             LEFT JOIN public.rooms_chair chair ON ((chair.id = chair_i.chair_id)))
          GROUP BY room.id
        ), tables_in_room_by_id AS (
         SELECT room.id,
            jsonb_agg(table_f.*) AS tables
           FROM ((public.rooms_room room
             LEFT JOIN public.rooms_table_rooms table_i ON ((room.id = table_i.room_id)))
             LEFT JOIN public.rooms_table table_f ON ((table_f.id = table_i.table_id)))
          GROUP BY room.id
        )
 SELECT COALESCE(room_id_door_decoration.id, windows_in_room_by_id.id) AS id,
    room_id_door_decoration.door,
    room_id_door_decoration.decoration,
    windows_in_room_by_id.windows,
    parameters_and_beds_in_room_by_id.name,
    parameters_and_beds_in_room_by_id.width,
    parameters_and_beds_in_room_by_id.length,
    parameters_and_beds_in_room_by_id.height,
    parameters_and_beds_in_room_by_id.type,
    parameters_and_beds_in_room_by_id.beds,
    chairs_in_room_by_id.chairs,
    tables_in_room_by_id.tables
   FROM ((((room_id_door_decoration
     FULL JOIN windows_in_room_by_id ON ((room_id_door_decoration.id = windows_in_room_by_id.id)))
     FULL JOIN parameters_and_beds_in_room_by_id ON ((windows_in_room_by_id.id = parameters_and_beds_in_room_by_id.id)))
     FULL JOIN chairs_in_room_by_id ON ((parameters_and_beds_in_room_by_id.id = chairs_in_room_by_id.id)))
     FULL JOIN tables_in_room_by_id ON ((chairs_in_room_by_id.id = tables_in_room_by_id.id)))
  WITH NO DATA;


ALTER TABLE public.rooms_related_objects OWNER TO postgres;

--
-- TOC entry 3483 (class 2606 OID 16694)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3488 (class 2606 OID 16624)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3491 (class 2606 OID 16590)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3485 (class 2606 OID 16581)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3478 (class 2606 OID 16615)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3480 (class 2606 OID 16574)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3499 (class 2606 OID 16606)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3502 (class 2606 OID 16639)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3493 (class 2606 OID 16597)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3505 (class 2606 OID 16613)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3508 (class 2606 OID 16653)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3496 (class 2606 OID 16689)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3511 (class 2606 OID 16675)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3473 (class 2606 OID 16567)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3475 (class 2606 OID 16565)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3471 (class 2606 OID 16558)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3515 (class 2606 OID 16702)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3586 (class 2606 OID 16814)
-- Name: rooms_bed rooms_bed_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_bed
    ADD CONSTRAINT rooms_bed_name_key UNIQUE (name);


--
-- TOC entry 3588 (class 2606 OID 16812)
-- Name: rooms_bed rooms_bed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_bed
    ADD CONSTRAINT rooms_bed_pkey PRIMARY KEY (id);


--
-- TOC entry 3591 (class 2606 OID 16906)
-- Name: rooms_bed_rooms rooms_bed_rooms_bed_id_room_id_ddeceda4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_bed_rooms
    ADD CONSTRAINT rooms_bed_rooms_bed_id_room_id_ddeceda4_uniq UNIQUE (bed_id, room_id);


--
-- TOC entry 3593 (class 2606 OID 16821)
-- Name: rooms_bed_rooms rooms_bed_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_bed_rooms
    ADD CONSTRAINT rooms_bed_rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 3575 (class 2606 OID 16798)
-- Name: rooms_chair rooms_chair_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_chair
    ADD CONSTRAINT rooms_chair_name_key UNIQUE (name);


--
-- TOC entry 3577 (class 2606 OID 16796)
-- Name: rooms_chair rooms_chair_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_chair
    ADD CONSTRAINT rooms_chair_pkey PRIMARY KEY (id);


--
-- TOC entry 3580 (class 2606 OID 16891)
-- Name: rooms_chair_rooms rooms_chair_rooms_chair_id_room_id_f2f7634c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_chair_rooms
    ADD CONSTRAINT rooms_chair_rooms_chair_id_room_id_f2f7634c_uniq UNIQUE (chair_id, room_id);


--
-- TOC entry 3582 (class 2606 OID 16805)
-- Name: rooms_chair_rooms rooms_chair_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_chair_rooms
    ADD CONSTRAINT rooms_chair_rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 3519 (class 2606 OID 16714)
-- Name: rooms_decoration rooms_decoration_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_decoration
    ADD CONSTRAINT rooms_decoration_name_key UNIQUE (name);


--
-- TOC entry 3568 (class 2606 OID 16876)
-- Name: rooms_decoration_souvenirs rooms_decoration_souveni_decoration_id_souvenir_i_82e0235e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_decoration_souvenirs
    ADD CONSTRAINT rooms_decoration_souveni_decoration_id_souvenir_i_82e0235e_uniq UNIQUE (decoration_id, souvenir_id);


--
-- TOC entry 3571 (class 2606 OID 16789)
-- Name: rooms_decoration_souvenirs rooms_decoration_souvenirs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_decoration_souvenirs
    ADD CONSTRAINT rooms_decoration_souvenirs_pkey PRIMARY KEY (id);


--
-- TOC entry 3524 (class 2606 OID 16723)
-- Name: rooms_door rooms_door_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_door
    ADD CONSTRAINT rooms_door_name_key UNIQUE (name);


--
-- TOC entry 3531 (class 2606 OID 16732)
-- Name: rooms_room rooms_room_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_room
    ADD CONSTRAINT rooms_room_name_key UNIQUE (name);


--
-- TOC entry 3536 (class 2606 OID 16741)
-- Name: rooms_souvenir rooms_souvenir_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_souvenir
    ADD CONSTRAINT rooms_souvenir_name_key UNIQUE (name);


--
-- TOC entry 3538 (class 2606 OID 16739)
-- Name: rooms_souvenir rooms_souvenir_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_souvenir
    ADD CONSTRAINT rooms_souvenir_pkey PRIMARY KEY (id);


--
-- TOC entry 3558 (class 2606 OID 16775)
-- Name: rooms_table rooms_table_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_table
    ADD CONSTRAINT rooms_table_name_key UNIQUE (name);


--
-- TOC entry 3560 (class 2606 OID 16773)
-- Name: rooms_table rooms_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_table
    ADD CONSTRAINT rooms_table_pkey PRIMARY KEY (id);


--
-- TOC entry 3562 (class 2606 OID 16782)
-- Name: rooms_table_rooms rooms_table_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_table_rooms
    ADD CONSTRAINT rooms_table_rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 3566 (class 2606 OID 16862)
-- Name: rooms_table_rooms rooms_table_rooms_table_id_room_id_6b607969_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_table_rooms
    ADD CONSTRAINT rooms_table_rooms_table_id_room_id_6b607969_uniq UNIQUE (table_id, room_id);


--
-- TOC entry 3541 (class 2606 OID 16750)
-- Name: rooms_window rooms_window_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_window
    ADD CONSTRAINT rooms_window_name_key UNIQUE (name);


--
-- TOC entry 3547 (class 2606 OID 16759)
-- Name: rooms_windowfittings rooms_windowfittings_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_windowfittings
    ADD CONSTRAINT rooms_windowfittings_name_key UNIQUE (name);


--
-- TOC entry 3549 (class 2606 OID 16757)
-- Name: rooms_windowfittings rooms_windowfittings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_windowfittings
    ADD CONSTRAINT rooms_windowfittings_pkey PRIMARY KEY (id);


--
-- TOC entry 3551 (class 2606 OID 16847)
-- Name: rooms_windowfittings_windows rooms_windowfittings_win_windowfittings_id_window_c85a27d7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_windowfittings_windows
    ADD CONSTRAINT rooms_windowfittings_win_windowfittings_id_window_c85a27d7_uniq UNIQUE (windowfittings_id, window_id);


--
-- TOC entry 3553 (class 2606 OID 16766)
-- Name: rooms_windowfittings_windows rooms_windowfittings_windows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_windowfittings_windows
    ADD CONSTRAINT rooms_windowfittings_windows_pkey PRIMARY KEY (id);


--
-- TOC entry 3481 (class 1259 OID 16695)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3486 (class 1259 OID 16635)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3489 (class 1259 OID 16636)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3476 (class 1259 OID 16621)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3497 (class 1259 OID 16651)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3500 (class 1259 OID 16650)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3503 (class 1259 OID 16665)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3506 (class 1259 OID 16664)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3494 (class 1259 OID 16690)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3509 (class 1259 OID 16686)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3512 (class 1259 OID 16687)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3513 (class 1259 OID 16704)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3516 (class 1259 OID 16703)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3584 (class 1259 OID 16904)
-- Name: rooms_bed_name_b21f1500_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_bed_name_b21f1500_like ON public.rooms_bed USING btree (name varchar_pattern_ops);


--
-- TOC entry 3589 (class 1259 OID 16917)
-- Name: rooms_bed_rooms_bed_id_b99d227c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_bed_rooms_bed_id_b99d227c ON public.rooms_bed_rooms USING btree (bed_id);


--
-- TOC entry 3594 (class 1259 OID 16918)
-- Name: rooms_bed_rooms_room_id_c4044df7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_bed_rooms_room_id_c4044df7 ON public.rooms_bed_rooms USING btree (room_id);


--
-- TOC entry 3573 (class 1259 OID 16889)
-- Name: rooms_chair_name_083ba94f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_chair_name_083ba94f_like ON public.rooms_chair USING btree (name varchar_pattern_ops);


--
-- TOC entry 3578 (class 1259 OID 16902)
-- Name: rooms_chair_rooms_chair_id_0276d8c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_chair_rooms_chair_id_0276d8c7 ON public.rooms_chair_rooms USING btree (chair_id);


--
-- TOC entry 3583 (class 1259 OID 16903)
-- Name: rooms_chair_rooms_room_id_6ea50169; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_chair_rooms_room_id_6ea50169 ON public.rooms_chair_rooms USING btree (room_id);


--
-- TOC entry 3517 (class 1259 OID 16822)
-- Name: rooms_decoration_name_ab9bda5a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_decoration_name_ab9bda5a_like ON public.rooms_decoration USING btree (name varchar_pattern_ops);


--
-- TOC entry 3569 (class 1259 OID 16887)
-- Name: rooms_decoration_souvenirs_decoration_id_690c00fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_decoration_souvenirs_decoration_id_690c00fe ON public.rooms_decoration_souvenirs USING btree (decoration_id);


--
-- TOC entry 3572 (class 1259 OID 16888)
-- Name: rooms_decoration_souvenirs_souvenir_id_67b53432; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_decoration_souvenirs_souvenir_id_67b53432 ON public.rooms_decoration_souvenirs USING btree (souvenir_id);


--
-- TOC entry 3522 (class 1259 OID 16823)
-- Name: rooms_door_name_c270ee09_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_door_name_c270ee09_like ON public.rooms_door USING btree (name varchar_pattern_ops);


--
-- TOC entry 3595 (class 1259 OID 17042)
-- Name: rooms_related_objects_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX rooms_related_objects_id_idx ON public.rooms_related_objects USING btree (id);


--
-- TOC entry 3527 (class 1259 OID 16835)
-- Name: rooms_room_decoration_id_b0ac3b5b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_room_decoration_id_b0ac3b5b ON public.rooms_room USING btree (decoration_id);


--
-- TOC entry 3528 (class 1259 OID 16836)
-- Name: rooms_room_door_id_0683ba0f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_room_door_id_0683ba0f ON public.rooms_room USING btree (door_id);


--
-- TOC entry 3529 (class 1259 OID 16834)
-- Name: rooms_room_name_ee62aac2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_room_name_ee62aac2_like ON public.rooms_room USING btree (name varchar_pattern_ops);


--
-- TOC entry 3534 (class 1259 OID 16837)
-- Name: rooms_souvenir_name_bd003a34_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_souvenir_name_bd003a34_like ON public.rooms_souvenir USING btree (name varchar_pattern_ops);


--
-- TOC entry 3556 (class 1259 OID 16860)
-- Name: rooms_table_name_8c04b0a1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_table_name_8c04b0a1_like ON public.rooms_table USING btree (name varchar_pattern_ops);


--
-- TOC entry 3563 (class 1259 OID 16874)
-- Name: rooms_table_rooms_room_id_b88e04c3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_table_rooms_room_id_b88e04c3 ON public.rooms_table_rooms USING btree (room_id);


--
-- TOC entry 3564 (class 1259 OID 16873)
-- Name: rooms_table_rooms_table_id_0cddb2bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_table_rooms_table_id_0cddb2bd ON public.rooms_table_rooms USING btree (table_id);


--
-- TOC entry 3539 (class 1259 OID 16843)
-- Name: rooms_window_name_e0a82883_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_window_name_e0a82883_like ON public.rooms_window USING btree (name varchar_pattern_ops);


--
-- TOC entry 3544 (class 1259 OID 16844)
-- Name: rooms_window_room_id_9ef8cbc6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_window_room_id_9ef8cbc6 ON public.rooms_window USING btree (room_id);


--
-- TOC entry 3545 (class 1259 OID 16845)
-- Name: rooms_windowfittings_name_f9af8738_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_windowfittings_name_f9af8738_like ON public.rooms_windowfittings USING btree (name varchar_pattern_ops);


--
-- TOC entry 3554 (class 1259 OID 16859)
-- Name: rooms_windowfittings_windows_window_id_2834988b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_windowfittings_windows_window_id_2834988b ON public.rooms_windowfittings_windows USING btree (window_id);


--
-- TOC entry 3555 (class 1259 OID 16858)
-- Name: rooms_windowfittings_windows_windowfittings_id_0014c855; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rooms_windowfittings_windows_windowfittings_id_0014c855 ON public.rooms_windowfittings_windows USING btree (windowfittings_id);


--
-- TOC entry 3598 (class 2606 OID 16630)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3597 (class 2606 OID 16625)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3596 (class 2606 OID 16616)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3600 (class 2606 OID 16645)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3599 (class 2606 OID 16640)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3602 (class 2606 OID 16659)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3601 (class 2606 OID 16654)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3603 (class 2606 OID 16676)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3604 (class 2606 OID 16681)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3616 (class 2606 OID 16907)
-- Name: rooms_bed_rooms rooms_bed_rooms_bed_id_b99d227c_fk_rooms_bed_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_bed_rooms
    ADD CONSTRAINT rooms_bed_rooms_bed_id_b99d227c_fk_rooms_bed_id FOREIGN KEY (bed_id) REFERENCES public.rooms_bed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3617 (class 2606 OID 16912)
-- Name: rooms_bed_rooms rooms_bed_rooms_room_id_c4044df7_fk_rooms_room_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_bed_rooms
    ADD CONSTRAINT rooms_bed_rooms_room_id_c4044df7_fk_rooms_room_id FOREIGN KEY (room_id) REFERENCES public.rooms_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3614 (class 2606 OID 16892)
-- Name: rooms_chair_rooms rooms_chair_rooms_chair_id_0276d8c7_fk_rooms_chair_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_chair_rooms
    ADD CONSTRAINT rooms_chair_rooms_chair_id_0276d8c7_fk_rooms_chair_id FOREIGN KEY (chair_id) REFERENCES public.rooms_chair(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3615 (class 2606 OID 16897)
-- Name: rooms_chair_rooms rooms_chair_rooms_room_id_6ea50169_fk_rooms_room_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_chair_rooms
    ADD CONSTRAINT rooms_chair_rooms_room_id_6ea50169_fk_rooms_room_id FOREIGN KEY (room_id) REFERENCES public.rooms_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3612 (class 2606 OID 16877)
-- Name: rooms_decoration_souvenirs rooms_decoration_sou_decoration_id_690c00fe_fk_rooms_dec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_decoration_souvenirs
    ADD CONSTRAINT rooms_decoration_sou_decoration_id_690c00fe_fk_rooms_dec FOREIGN KEY (decoration_id) REFERENCES public.rooms_decoration(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3613 (class 2606 OID 16882)
-- Name: rooms_decoration_souvenirs rooms_decoration_sou_souvenir_id_67b53432_fk_rooms_sou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_decoration_souvenirs
    ADD CONSTRAINT rooms_decoration_sou_souvenir_id_67b53432_fk_rooms_sou FOREIGN KEY (souvenir_id) REFERENCES public.rooms_souvenir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3605 (class 2606 OID 16824)
-- Name: rooms_room rooms_room_decoration_id_b0ac3b5b_fk_rooms_decoration_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_room
    ADD CONSTRAINT rooms_room_decoration_id_b0ac3b5b_fk_rooms_decoration_id FOREIGN KEY (decoration_id) REFERENCES public.rooms_decoration(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3606 (class 2606 OID 16829)
-- Name: rooms_room rooms_room_door_id_0683ba0f_fk_rooms_door_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_room
    ADD CONSTRAINT rooms_room_door_id_0683ba0f_fk_rooms_door_id FOREIGN KEY (door_id) REFERENCES public.rooms_door(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3611 (class 2606 OID 16868)
-- Name: rooms_table_rooms rooms_table_rooms_room_id_b88e04c3_fk_rooms_room_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_table_rooms
    ADD CONSTRAINT rooms_table_rooms_room_id_b88e04c3_fk_rooms_room_id FOREIGN KEY (room_id) REFERENCES public.rooms_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3610 (class 2606 OID 16863)
-- Name: rooms_table_rooms rooms_table_rooms_table_id_0cddb2bd_fk_rooms_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_table_rooms
    ADD CONSTRAINT rooms_table_rooms_table_id_0cddb2bd_fk_rooms_table_id FOREIGN KEY (table_id) REFERENCES public.rooms_table(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3607 (class 2606 OID 16838)
-- Name: rooms_window rooms_window_room_id_9ef8cbc6_fk_rooms_room_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_window
    ADD CONSTRAINT rooms_window_room_id_9ef8cbc6_fk_rooms_room_id FOREIGN KEY (room_id) REFERENCES public.rooms_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3609 (class 2606 OID 16853)
-- Name: rooms_windowfittings_windows rooms_windowfittings_window_id_2834988b_fk_rooms_win; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_windowfittings_windows
    ADD CONSTRAINT rooms_windowfittings_window_id_2834988b_fk_rooms_win FOREIGN KEY (window_id) REFERENCES public.rooms_window(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3608 (class 2606 OID 16848)
-- Name: rooms_windowfittings_windows rooms_windowfittings_windowfittings_id_0014c855_fk_rooms_win; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_windowfittings_windows
    ADD CONSTRAINT rooms_windowfittings_windowfittings_id_0014c855_fk_rooms_win FOREIGN KEY (windowfittings_id) REFERENCES public.rooms_windowfittings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3805 (class 0 OID 17035)
-- Dependencies: 272 3807
-- Name: rooms_related_objects; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: postgres
--

REFRESH MATERIALIZED VIEW public.rooms_related_objects;


-- Completed on 2022-04-05 08:54:26 UTC

--
-- PostgreSQL database dump complete
--

