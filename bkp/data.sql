--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.0

-- Started on 2020-04-29 17:52:50

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
-- TOC entry 10 (class 2615 OID 24576)
-- Name: cliente; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cliente;


ALTER SCHEMA cliente OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 24579)
-- Name: cliente; Type: TABLE; Schema: cliente; Owner: postgres
--

CREATE TABLE cliente.cliente (
    idcliente integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    senha character varying(255) NOT NULL
);


ALTER TABLE cliente.cliente OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24577)
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: cliente; Owner: postgres
--

CREATE SEQUENCE cliente.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente.cliente_idcliente_seq OWNER TO postgres;

--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 205
-- Name: cliente_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: cliente; Owner: postgres
--

ALTER SEQUENCE cliente.cliente_idcliente_seq OWNED BY cliente.cliente.idcliente;


--
-- TOC entry 207 (class 1259 OID 32768)
-- Name: abastecimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abastecimento (
    idabastecimento integer NOT NULL,
    data date,
    cidade character varying(255),
    cnpj integer,
    quantidade double precision,
    valortotal double precision,
    valorunitario double precision,
    posto character varying(255),
    produto character varying(255),
    hodometro double precision
);


ALTER TABLE public.abastecimento OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 32774)
-- Name: abastecimento_idabastecimento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.abastecimento_idabastecimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abastecimento_idabastecimento_seq OWNER TO postgres;

--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 208
-- Name: abastecimento_idabastecimento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abastecimento_idabastecimento_seq OWNED BY public.abastecimento.idabastecimento;


--
-- TOC entry 209 (class 1259 OID 32776)
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat (
    idchat integer NOT NULL,
    idusuarioorigem integer,
    idusuariodestino integer,
    mensagem text,
    visualizada boolean DEFAULT false,
    datahoraenvio timestamp without time zone,
    datahoravisualizacao timestamp without time zone
);


ALTER TABLE public.chat OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 32783)
-- Name: chat_idchat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_idchat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_idchat_seq OWNER TO postgres;

--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 210
-- Name: chat_idchat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_idchat_seq OWNED BY public.chat.idchat;


--
-- TOC entry 226 (class 1259 OID 32935)
-- Name: colaborador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaborador (
    idcolaborador integer NOT NULL,
    nome character varying(255) NOT NULL,
    cpf character varying(15) NOT NULL,
    email character varying(255),
    idfilial integer NOT NULL,
    idsituacaousuario integer
);


ALTER TABLE public.colaborador OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32933)
-- Name: colaborador_idcolaborador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colaborador_idcolaborador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colaborador_idcolaborador_seq OWNER TO postgres;

--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 225
-- Name: colaborador_idcolaborador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colaborador_idcolaborador_seq OWNED BY public.colaborador.idcolaborador;


--
-- TOC entry 228 (class 1259 OID 32977)
-- Name: ferias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ferias (
    idferias integer NOT NULL,
    datainclusao timestamp without time zone DEFAULT now() NOT NULL,
    datainicio date NOT NULL,
    datafim date NOT NULL,
    idcolaborador integer NOT NULL,
    ativo character(1) DEFAULT 1 NOT NULL
);


ALTER TABLE public.ferias OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32975)
-- Name: ferias_idferias_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ferias_idferias_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ferias_idferias_seq OWNER TO postgres;

--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 227
-- Name: ferias_idferias_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ferias_idferias_seq OWNED BY public.ferias.idferias;


--
-- TOC entry 211 (class 1259 OID 32785)
-- Name: filial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filial (
    idfilial integer NOT NULL,
    fantasia character varying(255),
    uf character varying(2),
    numerofilial integer,
    cnpj character varying
);


ALTER TABLE public.filial OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 32791)
-- Name: localizacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.localizacao (
    idveiculo integer NOT NULL,
    datahora timestamp without time zone NOT NULL,
    longitude character varying(255) NOT NULL,
    latitude character varying(255) NOT NULL
);


ALTER TABLE public.localizacao OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 32797)
-- Name: multa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.multa (
    idmulta integer NOT NULL,
    prefixo integer NOT NULL,
    data date,
    placa character varying(255),
    infracao text,
    nomemotorista character varying(255),
    matriculamotorista character varying(255),
    local character varying(255),
    valorinflacao numeric NOT NULL,
    valorpago numeric
);


ALTER TABLE public.multa OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 32803)
-- Name: multa_idmulta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.multa_idmulta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.multa_idmulta_seq OWNER TO postgres;

--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 214
-- Name: multa_idmulta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.multa_idmulta_seq OWNED BY public.multa.idmulta;


--
-- TOC entry 215 (class 1259 OID 32805)
-- Name: ocorrencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ocorrencia (
    idocorrencia integer NOT NULL,
    idusuario integer NOT NULL,
    idusuarioinclusao integer NOT NULL,
    datainclusao timestamp without time zone NOT NULL,
    idtipoocorrencia integer NOT NULL,
    dataocorrencia date NOT NULL
);


ALTER TABLE public.ocorrencia OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32808)
-- Name: ocorrencia_idocorrencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ocorrencia_idocorrencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ocorrencia_idocorrencia_seq OWNER TO postgres;

--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 216
-- Name: ocorrencia_idocorrencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ocorrencia_idocorrencia_seq OWNED BY public.ocorrencia.idocorrencia;


--
-- TOC entry 217 (class 1259 OID 32810)
-- Name: situacaousuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.situacaousuario (
    idsituacaousuario integer NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.situacaousuario OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32813)
-- Name: situacaousuario_idsituacaousuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.situacaousuario_idsituacaousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.situacaousuario_idsituacaousuario_seq OWNER TO postgres;

--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 218
-- Name: situacaousuario_idsituacaousuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.situacaousuario_idsituacaousuario_seq OWNED BY public.situacaousuario.idsituacaousuario;


--
-- TOC entry 219 (class 1259 OID 32815)
-- Name: tipoocorrencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipoocorrencia (
    idtipoocorrencia integer NOT NULL,
    nome character varying(255) NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.tipoocorrencia OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32821)
-- Name: tipoocorrencia_idtipoocorrencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipoocorrencia_idtipoocorrencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipoocorrencia_idtipoocorrencia_seq OWNER TO postgres;

--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 220
-- Name: tipoocorrencia_idtipoocorrencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipoocorrencia_idtipoocorrencia_seq OWNED BY public.tipoocorrencia.idtipoocorrencia;


--
-- TOC entry 221 (class 1259 OID 32823)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    idusuario integer NOT NULL,
    idsituacaousuario integer,
    idfilial integer,
    nome character varying(255),
    email character varying(255),
    senha character varying(255),
    status integer,
    foto text,
    cpf character varying,
    datanascimento date,
    admissao date,
    idcargousuario integer
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32829)
-- Name: usuario_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_idusuario_seq OWNER TO postgres;

--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 222
-- Name: usuario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;


--
-- TOC entry 223 (class 1259 OID 32831)
-- Name: veiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veiculo (
    idveiculo integer NOT NULL,
    idfilial integer,
    prefixo integer,
    tipo character varying(255),
    ano integer,
    placa character varying(255),
    categoria character varying(255),
    capacidade double precision,
    modelo character varying(255),
    marca character varying(255)
);


ALTER TABLE public.veiculo OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 32837)
-- Name: veiculo_idveiculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veiculo_idveiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veiculo_idveiculo_seq OWNER TO postgres;

--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 224
-- Name: veiculo_idveiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veiculo_idveiculo_seq OWNED BY public.veiculo.idveiculo;


--
-- TOC entry 2858 (class 2604 OID 24582)
-- Name: cliente idcliente; Type: DEFAULT; Schema: cliente; Owner: postgres
--

ALTER TABLE ONLY cliente.cliente ALTER COLUMN idcliente SET DEFAULT nextval('cliente.cliente_idcliente_seq'::regclass);


--
-- TOC entry 2859 (class 2604 OID 32839)
-- Name: abastecimento idabastecimento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abastecimento ALTER COLUMN idabastecimento SET DEFAULT nextval('public.abastecimento_idabastecimento_seq'::regclass);


--
-- TOC entry 2861 (class 2604 OID 32840)
-- Name: chat idchat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat ALTER COLUMN idchat SET DEFAULT nextval('public.chat_idchat_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 32938)
-- Name: colaborador idcolaborador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador ALTER COLUMN idcolaborador SET DEFAULT nextval('public.colaborador_idcolaborador_seq'::regclass);


--
-- TOC entry 2869 (class 2604 OID 32980)
-- Name: ferias idferias; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ferias ALTER COLUMN idferias SET DEFAULT nextval('public.ferias_idferias_seq'::regclass);


--
-- TOC entry 2862 (class 2604 OID 32841)
-- Name: multa idmulta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multa ALTER COLUMN idmulta SET DEFAULT nextval('public.multa_idmulta_seq'::regclass);


--
-- TOC entry 2863 (class 2604 OID 32842)
-- Name: ocorrencia idocorrencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencia ALTER COLUMN idocorrencia SET DEFAULT nextval('public.ocorrencia_idocorrencia_seq'::regclass);


--
-- TOC entry 2864 (class 2604 OID 32843)
-- Name: situacaousuario idsituacaousuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.situacaousuario ALTER COLUMN idsituacaousuario SET DEFAULT nextval('public.situacaousuario_idsituacaousuario_seq'::regclass);


--
-- TOC entry 2865 (class 2604 OID 32844)
-- Name: tipoocorrencia idtipoocorrencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoocorrencia ALTER COLUMN idtipoocorrencia SET DEFAULT nextval('public.tipoocorrencia_idtipoocorrencia_seq'::regclass);


--
-- TOC entry 2866 (class 2604 OID 32845)
-- Name: usuario idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);


--
-- TOC entry 2867 (class 2604 OID 32846)
-- Name: veiculo idveiculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo ALTER COLUMN idveiculo SET DEFAULT nextval('public.veiculo_idveiculo_seq'::regclass);


--
-- TOC entry 3049 (class 0 OID 24579)
-- Dependencies: 206
-- Data for Name: cliente; Type: TABLE DATA; Schema: cliente; Owner: postgres
--

COPY cliente.cliente (idcliente, nome, email, senha) FROM stdin;
1	Matheus Ricardo Brunelli	matheus.bruneli@gazin.com.br	Logistica@321
2	Vinicius Marques Mazine	vinicius.marques@gazin.com.br	Gazin@123
3	Armando Bretas Neto	armando.luiz@gazin.com.br	Gazin@321
\.


--
-- TOC entry 3050 (class 0 OID 32768)
-- Dependencies: 207
-- Data for Name: abastecimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abastecimento (idabastecimento, data, cidade, cnpj, quantidade, valortotal, valorunitario, posto, produto, hodometro) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 32776)
-- Dependencies: 209
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat (idchat, idusuarioorigem, idusuariodestino, mensagem, visualizada, datahoraenvio, datahoravisualizacao) FROM stdin;
94	2719	2848	bmZuZmdoaGpmZ2o=	f	2020-04-13 18:23:49	2020-04-13 18:23:49
95	2719	2848	MTInMzEyMzEyMzEyMzE=	f	2020-04-13 18:23:58	2020-04-13 18:23:59
96	2719	2848	cXNkd3FkYXNkcXdzZA==	f	2020-04-13 18:23:59	2020-04-13 18:24:00
97	2719	2848	MTIzMTIzcXNk	f	2020-04-13 18:24:01	2020-04-13 18:24:02
98	2719	2848	ZGFzZGFzZGFzZA==	f	2020-04-13 18:24:03	2020-04-13 18:24:04
99	2848	2719	Smpq	f	2020-04-13 18:24:49	2020-04-13 18:24:50
100	2848	2719	Tmht	f	2020-04-13 18:24:57	2020-04-13 18:24:58
101	2719	2848	NzY3NTY3	f	2020-04-13 18:25:08	2020-04-13 18:25:08
102	2848	2903	VGVzdGU=	f	2020-04-14 16:04:38	\N
103	2848	2644	VGVzdGUgbXNn	f	2020-04-14 16:04:54	\N
71	2719	2848	dGVzdGU=	f	2020-04-13 17:57:39	2020-04-13 17:59:47
72	2848	2719	dGVzdGU=	f	2020-04-13 17:59:53	2020-04-13 17:59:55
73	2848	2719	S2tra2tra2s=	f	2020-04-13 18:00:26	2020-04-13 18:00:27
74	2848	2719	a2tra2tra2tra2tra2trayBkdWRhIGZlaWE=	f	2020-04-13 18:00:49	2020-04-13 18:00:50
75	2719	2848	TWtra2s=	f	2020-04-13 18:04:22	2020-04-13 18:04:22
77	2719	2848	TWtra2s=	f	2020-04-13 18:04:25	2020-04-13 18:04:25
76	2719	2848	TWtra2s=	f	2020-04-13 18:04:24	2020-04-13 18:04:25
80	2719	2848	TWtra2s=	f	2020-04-13 18:04:27	2020-04-13 18:04:27
79	2719	2848	TWtra2s=	f	2020-04-13 18:04:26	2020-04-13 18:04:27
78	2719	2848	TWtra2s=	f	2020-04-13 18:04:26	2020-04-13 18:04:27
82	2719	2848	TWtra2s=	f	2020-04-13 18:04:28	2020-04-13 18:04:29
81	2719	2848	TWtra2s=	f	2020-04-13 18:04:28	2020-04-13 18:04:29
84	2719	2848	TWtra2s=	f	2020-04-13 18:04:30	2020-04-13 18:04:30
83	2719	2848	TWtra2s=	f	2020-04-13 18:04:29	2020-04-13 18:04:30
85	2719	2848	TWtra2s=	f	2020-04-13 18:04:30	2020-04-13 18:04:31
87	2719	2848	TWtra2s=	f	2020-04-13 18:04:32	2020-04-13 18:04:32
86	2719	2848	TWtra2s=	f	2020-04-13 18:04:31	2020-04-13 18:04:32
88	2719	2848	TWtra2s=	f	2020-04-13 18:04:33	2020-04-13 18:04:34
89	2848	2719	S2o=	f	2020-04-13 18:09:38	2020-04-13 18:09:40
90	2848	2719	S2traw==	f	2020-04-13 18:18:05	2020-04-13 18:18:05
91	2848	2719	TW1r	f	2020-04-13 18:18:09	2020-04-13 18:18:10
92	2848	2719	Tmtra2trZmZ1ZnV1ZHVmamZqZmhkaGpmaGho	f	2020-04-13 18:20:31	2020-04-13 18:20:32
93	2848	2719	TmpqamtqampqampqamhqampoaXNoc3VzdWRmbGdsZmx4bGhvaGpibGdsdmtnZ2dnZ2dnZ2dnZmdnaGdmZ2pr	f	2020-04-13 18:21:20	2020-04-13 18:21:22
\.


--
-- TOC entry 3069 (class 0 OID 32935)
-- Dependencies: 226
-- Data for Name: colaborador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaborador (idcolaborador, nome, cpf, email, idfilial, idsituacaousuario) FROM stdin;
3	ADALTO PEREIRA DA SILVA	02496149107	teste@teste.com.br	140001	2
4	ARMANDO BEZERRA DE SOUZA JÚNIOR	1361387564	teste@teste.com.br	10146	2
2	ALLYSON DOUGLAS FARIA	8706734910	teste@teste.com.br	190005	2
1	MATHEUS RICARDO BRUNELLI	08307147905	matheus.brunelli@gazin.com.br	10001	2
5	ARMANDO LUIZ BRETAS NETO	9876068911	armando.luiz@gazin.com.br	10001	2
\.


--
-- TOC entry 3071 (class 0 OID 32977)
-- Dependencies: 228
-- Data for Name: ferias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ferias (idferias, datainclusao, datainicio, datafim, idcolaborador, ativo) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 32785)
-- Dependencies: 211
-- Data for Name: filial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filial (idfilial, fantasia, uf, numerofilial, cnpj) FROM stdin;
10067	JI-PARANA - RO (DEPOSITO)	RO	67	77941490003685
10115	RIO BRANCO - AC	AC	115	77941490012676
10121	JACIARA - MT	MT	121	77941490012757
10146	FEIRA DE SANTANA - BA	BA	146	77941490015349
10176	CAMPINA GRANDE - PB	PB	176	77941490019506
10265	NOVA ALVORADA DO SUL - MS	MS	265	77941490026626
140001	IPAMERI - GO - MATRIZ	GO	1	22962737000128
180001	TLG TRANSPORTE E LOGISTICA	PR	1	26519585000144
190002	VILHENA - RO	RO	2	28411905000254
190003	CANDELARIA - RS	RS	3	28411905000505
190004	FEIRA DE SANTANA - BA	BA	4	28411905000335
190005	JACIARA - MT	MT	5	28411905000416
10001	DOURADINA - PR	PR	1	77941490000155
10042	DOURADINA - PR	PR	42	77941490009616
10105	JI PARANA - RO 	RO	105	77941490011190
10125	JACIARA - MT	MT	125	77941490013486
190001	DOURADINA - PR ( Industria )	PR	1	28411905000173
\.


--
-- TOC entry 3055 (class 0 OID 32791)
-- Dependencies: 212
-- Data for Name: localizacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.localizacao (idveiculo, datahora, longitude, latitude) FROM stdin;
267	2020-04-08 07:56:40	-57.65773	-16.128958
478	2020-04-08 07:56:40	-54.730793	-2.4790983
16	2020-04-08 07:56:40	-53.299175	-23.378496
183	2020-04-08 07:56:40	-49.303005	-15.784975
462	2020-04-08 07:56:40	-38.892826	-12.309927
429	2020-04-08 07:56:40	-38.89202	-12.309981
121	2020-04-08 07:56:40	-60.08765	-12.789514
265	2020-04-08 07:56:40	-54.919685	-16.002838
119	2020-04-08 07:56:40	-61.203495	-11.631786
117	2020-04-08 07:56:40	-60.088272	-12.790537
335	2020-04-08 07:56:40	-38.893272	-12.310146
496	2020-04-08 07:56:40	-53.299465	-23.37894
470	2020-04-08 07:56:40	-38.892746	-12.310015
144	2020-04-08 07:56:40	-54.93562	-15.97465
483	2020-04-08 07:56:40	-53.29925	-23.379105
427	2020-04-08 07:56:40	-38.892536	-12.31062
477	2020-04-08 07:56:40	-53.37481	-23.407497
257	2020-04-08 07:56:40	-38.89158	-12.310543
45	2020-04-08 07:56:40	-53.300106	-23.37717
410	2020-04-08 07:56:40	-48.163315	-17.677046
182	2020-04-08 07:56:40	-44.877228	-3.488985
248	2020-04-08 07:56:40	-61.930843	-10.942449
135	2020-04-08 07:56:40	-54.934647	-15.972961
192	2020-04-08 07:56:40	-48.162437	-17.676254
31	2020-04-08 07:56:40	-53.300022	-23.378325
180	2020-04-08 07:56:40	-48.16258	-17.676374
247	2020-04-08 07:56:40	-67.8503	-10.002508
177	2020-04-08 07:56:40	-54.38622	-21.480715
202	2020-04-08 07:56:40	-54.93554	-15.974805
19	2020-04-08 07:56:40	-54.935196	-15.974845
379	2020-04-08 07:56:40	-39.37123	-7.22929
515	2020-04-08 07:56:40	-54.934685	-15.978345
151	2020-04-08 07:56:40	-67.85035	-10.002593
43	2020-04-08 07:56:40	-53.29993	-23.377474
214	2020-04-08 07:56:40	-48.949013	-16.370905
368	2020-04-08 07:56:40	-53.538334	-16.93227
464	2020-04-08 07:56:40	-38.892735	-12.3099165
76	2020-04-08 07:56:40	-60.08729	-12.789438
297	2020-04-08 07:56:40	-38.891575	-12.310723
210	2020-04-08 07:56:40	-54.386112	-21.480453
363	2020-04-08 07:56:40	-48.163372	-17.677044
124	2020-04-08 07:56:40	-38.891685	-12.310538
399	2020-04-08 07:56:40	-49.243565	-16.840326
376	2020-04-08 07:56:40	-35.75942	-5.9017334
401	2020-04-08 07:56:40	-46.479607	-14.4616165
449	2020-04-08 07:56:40	-54.93559	-15.973661
171	2020-04-08 07:56:40	-48.163258	-17.677078
230	2020-04-08 07:56:40	-38.985207	-12.272471
207	2020-04-08 07:56:40	-54.934483	-15.97274
71	2020-04-08 07:56:40	-48.16305	-17.676662
198	2020-04-08 07:56:40	-60.087723	-12.789563
466	2020-04-08 07:56:40	-39.46531	-11.410375
160	2020-04-08 07:56:40	-38.891884	-12.310358
245	2020-04-08 07:56:40	-61.930454	-10.942449
126	2020-04-08 07:56:40	-68.73528	-11.029678
33	2020-04-08 07:56:40	-53.29994	-23.378414
197	2020-04-08 07:56:40	-48.16241	-17.676458
362	2020-04-08 07:56:40	-48.163326	-17.677105
169	2020-04-08 07:56:40	-51.18144	-19.694473
344	2020-04-08 07:56:40	-54.386192	-21.480602
339	2020-04-08 07:56:40	-44.36165	-12.231894
205	2020-04-08 07:56:40	-54.93464	-15.974492
113	2020-04-08 07:56:40	-54.387318	-21.48004
418	2020-04-08 07:56:40	-38.341663	-10.072819
189	2020-04-08 07:56:40	-56.523952	-22.089912
361	2020-04-08 07:56:40	-48.162735	-17.677103
269	2020-04-08 07:56:40	-54.93455	-15.972796
48	2020-04-08 07:56:40	-53.29977	-23.377834
482	2020-04-08 07:56:40	-53.292942	-23.388643
369	2020-04-08 07:56:40	-54.934727	-15.973112
481	2020-04-08 07:56:40	-53.299767	-23.377857
90	2020-04-08 07:56:40	-54.93523	-15.974713
451	2020-04-08 07:56:40	-53.29855	-23.380022
78	2020-04-08 07:56:40	-61.93149	-10.9428835
11	2020-04-08 07:56:40	-53.30018	-23.377945
237	2020-04-08 07:56:40	-61.930996	-10.942425
208	2020-04-08 07:56:40	-54.934765	-15.973112
374	2020-04-08 07:56:40	-38.941086	-12.26765
13	2020-04-08 07:56:40	-53.299942	-23.377878
378	2020-04-08 07:56:40	-35.905075	-7.282815
242	2020-04-08 07:56:40	-61.930687	-10.942385
332	2020-04-08 07:56:40	-54.93469	-15.974753
47	2020-04-08 07:56:40	-53.299847	-23.377634
103	2020-04-08 07:56:40	-53.299595	-23.378613
98	2020-04-08 07:56:40	-53.299152	-23.378578
66	2020-04-08 07:56:40	-60.087482	-12.789521
485	2020-04-08 07:56:40	-53.590355	-25.08632
24	2020-04-08 07:56:40	-54.934536	-15.972473
441	2020-04-08 07:56:40	-54.749958	-22.231956
295	2020-04-08 07:56:40	-38.89231	-12.310365
118	2020-04-08 07:56:40	-60.088253	-12.790553
343	2020-04-08 07:56:40	-44.430927	-12.2261
7	2020-04-08 07:56:40	-53.3002	-23.377901
411	2020-04-08 07:56:40	-48.254597	-18.863731
304	2020-04-08 07:56:40	-38.891647	-12.31045
68	2020-04-08 07:56:40	-54.934452	-15.972283
6	2020-04-08 07:56:40	-53.30016	-23.377832
26	2020-04-08 07:56:40	-60.0878	-12.789548
408	2020-04-08 07:56:40	-49.320286	-14.854627
465	2020-04-08 07:56:40	-38.892467	-12.310003
439	2020-04-08 07:56:40	-53.29938	-23.378914
42	2020-04-08 07:56:40	-53.299694	-23.37951
364	2020-04-08 07:56:40	-56.377327	-14.377203
10	2020-04-08 07:56:40	-53.30253	-23.380379
371	2020-04-08 07:56:40	-38.892082	-12.310037
164	2020-04-08 07:56:40	-54.379326	-21.473904
508	2020-04-08 07:56:40	-53.30016	-23.377691
422	2020-04-08 07:56:40	-38.799255	-10.984607
503	2020-04-08 07:56:40	-50.201893	-23.867517
517	2020-04-08 07:56:40	-54.935627	-15.974618
301	2020-04-08 07:56:40	-38.891872	-12.31035
504	2020-04-08 07:56:40	-53.29908	-23.37908
299	2020-04-08 07:56:40	-38.89184	-12.310534
354	2020-04-08 07:56:40	-52.805866	-29.683353
356	2020-04-08 07:56:40	-52.805046	-29.684263
329	2020-04-08 07:56:40	-54.934593	-15.972834
249	2020-04-08 07:56:40	-61.93035	-10.942362
372	2020-04-08 07:56:40	-38.96464	-12.24239
302	2020-04-08 07:56:40	-38.891853	-12.310574
352	2020-04-08 07:56:40	-52.805508	-29.68371
216	2020-04-08 07:56:40	-53.30001	-23.378414
138	2020-04-08 07:56:40	-51.83643	-12.948914
107	2020-04-08 07:56:40	-61.93164	-10.942565
283	2020-04-08 07:56:40	-38.892223	-12.310355
96	2020-04-08 07:56:40	-53.299744	-23.377485
326	2020-04-08 07:56:40	-54.9196	-16.002697
284	2020-04-08 07:56:40	-54.387455	-21.479755
69	2020-04-08 07:56:40	-54.93502	-15.972716
405	2020-04-08 07:56:40	-54.386055	-21.480583
330	2020-04-08 07:56:40	-54.934746	-15.97302
425	2020-04-08 07:56:40	-53.29992	-23.378263
347	2020-04-08 07:56:40	-60.088257	-12.790578
367	2020-04-08 07:56:40	-54.935608	-15.97443
337	2020-04-08 07:56:40	-38.89145	-12.310498
20	2020-04-08 07:56:40	-54.938	-15.973168
63	2020-04-08 07:56:40	-61.930737	-10.942608
366	2020-04-08 07:56:40	-62.58053	-9.373259
294	2020-04-08 07:56:40	-52.805447	-29.683754
253	2020-04-08 07:56:40	-67.85023	-10.002443
152	2020-04-08 07:56:40	-54.93489	-15.974995
188	2020-04-08 07:56:40	-42.079994	-16.890263
175	2020-04-08 07:56:40	-48.162724	-17.676165
30	2020-04-08 07:56:40	-53.30019	-23.377136
457	2020-04-08 07:56:40	-53.298634	-23.379946
86	2020-04-08 07:56:40	-60.087746	-12.789705
475	2020-04-08 07:56:40	-54.38684	-21.480446
125	2020-04-08 07:56:40	-40.381233	-14.527108
342	2020-04-08 07:56:40	-38.892048	-12.310409
417	2020-04-08 07:56:40	-38.891922	-12.30985
318	2020-04-08 07:56:40	-38.891537	-12.310697
101	2020-04-08 07:56:40	-53.299984	-23.378302
236	2020-04-08 07:56:40	-61.93074	-10.94242
140	2020-04-08 07:56:40	-54.93448	-15.97248
264	2020-04-08 07:56:40	-54.98031	-15.952793
200	2020-04-08 07:56:40	-61.93121	-10.942413
206	2020-04-08 07:56:40	-54.93475	-15.974685
194	2020-04-08 07:56:40	-48.162445	-17.67608
479	2020-04-08 07:56:40	-53.29991	-23.378338
134	2020-04-08 07:56:40	-54.935085	-15.975065
75	2020-04-08 07:56:40	-60.087456	-12.789494
353	2020-04-08 07:56:40	-52.805798	-29.683342
137	2020-04-08 07:56:40	-54.934673	-15.974697
32	2020-04-08 07:56:40	-48.162846	-17.676735
139	2020-04-08 07:56:40	-58.52426	-10.364899
94	2020-04-08 07:56:40	-57.894356	-13.714909
162	2020-04-08 07:56:40	-38.8919	-12.31051
501	2020-04-08 07:56:40	-53.299397	-23.378996
474	2020-04-08 07:56:40	-38.95154	-12.298977
132	2020-04-08 07:56:40	-53.30036	-23.377666
413	2020-04-08 07:56:40	-38.891987	-12.310043
270	2020-04-08 07:56:40	-54.93456	-15.972828
250	2020-04-08 07:56:40	-60.102676	-12.754675
432	2020-04-08 07:56:40	-38.89255	-12.31056
3	2020-04-08 07:56:40	-67.85033	-10.002448
120	2020-04-08 07:56:40	-63.83639	-8.799269
176	2020-04-08 07:56:40	-48.1625	-17.677032
357	2020-04-08 07:56:40	-52.804836	-29.684284
438	2020-04-08 07:56:40	-53.299934	-23.377281
61	2020-04-08 07:56:40	-54.934853	-15.972424
246	2020-04-08 07:56:40	-61.931297	-10.942603
155	2020-04-08 07:56:40	-54.93553	-15.97453
381	2020-04-08 07:56:40	-35.904858	-7.2825065
29	2020-04-08 07:56:40	-52.80493	-29.684061
358	2020-04-08 07:56:40	-53.292877	-23.389023
21	2020-04-08 07:56:40	-54.935036	-15.974983
416	2020-04-08 07:56:40	-39.263874	-12.955528
288	2020-04-08 07:56:40	-61.931404	-10.942605
398	2020-04-08 07:56:40	-47.94301	-18.182344
480	2020-04-08 07:56:40	-53.30009	-23.377182
136	2020-04-08 07:56:40	-54.93459	-15.972955
234	2020-04-08 07:56:40	-54.38634	-21.480492
105	2020-04-08 07:56:40	-53.299213	-23.378767
426	2020-04-08 07:56:40	-38.89192	-12.309868
263	2020-04-08 07:56:40	-54.93478	-15.974747
229	2020-04-08 07:56:40	-38.89188	-12.310248
272	2020-04-08 07:56:40	-54.934807	-15.974825
281	2020-04-08 07:56:40	-38.893055	-12.310308
455	2020-04-08 07:56:40	-53.29807	-23.380537
313	2020-04-08 07:56:40	-38.891727	-12.310492
72	2020-04-08 07:56:40	-48.162888	-17.676695
227	2020-04-08 07:56:40	-42.799088	-12.27001
110	2020-04-08 07:56:40	-54.387688	-21.480392
49	2020-04-08 07:56:40	-53.28919	-23.778536
50	2020-04-08 07:56:40	-53.29986	-23.378275
56	2020-04-08 07:56:40	-54.93443	-15.972232
148	2020-04-08 07:56:40	-48.16242	-17.676638
312	2020-04-08 07:56:40	-38.891697	-12.310512
215	2020-04-08 07:56:40	-38.839424	-11.053416
327	2020-04-08 07:56:40	-54.934837	-15.97196
450	2020-04-08 07:56:40	-61.97408	-10.880355
271	2020-04-08 07:56:40	-55.117092	-10.616683
220	2020-04-08 07:56:40	-41.738255	-6.94373
204	2020-04-08 07:56:40	-54.93497	-15.97467
383	2020-04-08 07:56:40	-35.90495	-7.2824984
490	2020-04-08 07:56:40	-53.29984	-23.37976
17	2020-04-08 07:56:40	-53.299244	-23.37917
507	2020-04-08 07:56:40	-56.02666	-15.646787
396	2020-04-08 07:56:40	-48.162655	-17.676138
142	2020-04-08 07:56:40	-54.93485	-15.974955
97	2020-04-08 07:56:40	-53.29996	-23.377178
433	2020-04-08 07:56:40	-38.892403	-12.3102665
349	2020-04-08 07:56:40	-52.805042	-29.684351
311	2020-04-08 07:56:40	-38.893085	-12.31029
256	2020-04-08 07:56:40	-52.80525	-29.684143
397	2020-04-08 07:56:40	-41.064953	-20.364738
241	2020-04-08 07:56:40	-63.836193	-8.798957
211	2020-04-08 07:56:40	-54.386135	-21.48037
149	2020-04-08 07:56:40	-61.930393	-10.942465
468	2020-04-08 07:56:40	-38.89251	-12.309961
161	2020-04-08 07:56:40	-38.89215	-12.310364
80	2020-04-08 07:56:40	-60.087654	-12.789514
130	2020-04-08 07:56:40	-53.498516	-26.761808
181	2020-04-08 07:56:40	-54.386227	-21.480608
513	2020-04-08 07:56:40	-38.891815	-12.310373
380	2020-04-08 07:56:40	-35.905064	-7.2828665
277	2020-04-08 07:56:40	-38.89184	-12.31044
471	2020-04-08 07:56:40	-38.952427	-12.295237
389	2020-04-08 07:56:40	-54.38687	-21.480366
60	2020-04-08 07:56:40	-53.29977	-23.378233
158	2020-04-08 07:56:40	-54.919594	-16.002733
14	2020-04-08 07:56:40	-55.998436	-4.26016
498	2020-04-08 07:56:40	-53.299313	-23.379066
434	2020-04-08 07:56:40	-40.003376	-11.38147
407	2020-04-08 07:56:40	-48.16279	-17.676186
222	2020-04-08 07:56:40	-39.74098	-17.587292
338	2020-04-08 07:56:40	-42.113827	-4.767345
25	2020-04-08 07:56:40	-60.08778	-12.789647
221	2020-04-08 07:56:40	-44.403778	-12.233512
458	2020-04-08 07:56:40	-51.96578	-23.42372
81	2020-04-08 07:56:40	-54.934437	-15.971929
500	2020-04-08 07:56:40	-53.299282	-23.37906
129	2020-04-08 07:56:40	-61.931206	-10.890997
195	2020-04-08 07:56:40	-49.17355	-11.903711
167	2020-04-08 07:56:40	-52.18442	-3.17906
430	2020-04-08 07:56:40	-36.91639	-10.392484
492	2020-04-08 07:56:40	-53.299984	-23.379644
191	2020-04-08 07:56:40	-61.93095	-10.942458
54	2020-04-08 07:56:40	-53.300304	-23.377756
259	2020-04-08 07:56:40	-54.934685	-15.972245
168	2020-04-08 07:56:40	-48.16243	-17.67673
395	2020-04-08 07:56:40	-61.93078	-10.94234
442	2020-04-08 07:56:40	-53.300247	-23.377731
443	2020-04-08 07:56:40	-53.299835	-23.376955
386	2020-04-08 07:56:40	-52.422523	-21.717817
456	2020-04-08 07:56:40	-53.294262	-23.383184
165	2020-04-08 07:56:40	-48.16249	-17.67632
23	2020-04-08 07:56:40	-54.935165	-15.975001
59	2020-04-08 07:56:40	-54.934395	-15.972177
184	2020-04-08 07:56:40	-48.884716	-10.147509
336	2020-04-08 07:56:40	-41.23863	-14.032269
355	2020-04-08 07:56:40	-52.805477	-29.683687
51	2020-04-08 07:56:40	-48.16302	-17.676615
18	2020-04-08 07:56:40	-53.29983	-23.377476
278	2020-04-08 07:56:40	-40.481277	-9.467722
239	2020-04-08 07:56:40	-61.93078	-10.942338
285	2020-04-08 07:56:40	-48.162964	-17.676218
402	2020-04-08 07:56:40	-45.098103	-18.37446
156	2020-04-08 07:56:40	-54.93495	-15.975059
377	2020-04-08 07:56:40	-35.97041	-8.178492
260	2020-04-08 07:56:40	-54.93461	-15.97313
274	2020-04-08 07:56:40	-38.89208	-12.3102865
350	2020-04-08 07:56:40	-52.80537	-29.683764
92	2020-04-08 09:09:39	-54.935204	-15.974882
359	2020-04-08 09:09:39	-49.243973	-16.839193
174	2020-04-08 09:09:39	-48.162895	-17.676125
166	2020-04-08 09:09:39	-48.162407	-17.677015
437	2020-04-08 09:09:39	-38.89184	-12.309823
193	2020-04-08 09:09:39	-48.162445	-17.677036
497	2020-04-08 09:09:39	-53.299873	-23.379179
88	2020-04-08 09:09:39	-60.087738	-12.789715
262	2020-04-08 09:09:39	-54.93493	-15.974974
38	2020-04-08 09:09:39	-53.299587	-23.37953
516	2020-04-08 09:09:39	-54.936024	-15.97397
393	2020-04-08 09:09:39	-65.327614	-10.401047
505	2020-04-08 09:09:39	-53.30013	-23.37765
317	2020-04-08 09:09:39	-38.891457	-12.310615
400	2020-04-08 09:09:39	-48.25569	-18.86541
67	2020-04-08 09:09:39	-54.92008	-16.002544
472	2020-04-08 09:09:39	-38.89241	-12.30994
87	2020-04-08 09:09:39	-61.931377	-10.942705
375	2020-04-08 09:09:39	-35.904953	-7.2826333
217	2020-04-08 09:09:39	-38.892254	-12.31038
390	2020-04-08 09:09:39	-54.274555	-23.938784
414	2020-04-08 09:09:39	-38.8927	-12.310512
392	2020-04-08 09:09:39	-61.93063	-10.942344
286	2020-04-08 09:09:39	-48.16267	-17.676172
333	2020-04-08 09:09:39	-54.93501	-15.972393
293	2020-04-08 09:09:39	-52.8055	-29.683508
46	2020-04-08 09:09:39	-53.29994	-23.37793
385	2020-04-08 09:09:39	-35.889435	-7.236225
308	2020-04-08 09:09:39	-38.891838	-12.310614
469	2020-04-08 07:56:40	-38.981213	-12.23364
163	2020-04-08 07:56:40	-48.16259	-17.676113
406	2020-04-08 07:56:40	-49.24387	-16.839436
404	2020-04-08 07:56:40	-49.30275	-15.785559
493	2020-04-08 07:56:40	-53.299168	-23.379065
325	2020-04-08 07:56:40	-54.934464	-15.972707
514	2020-04-08 07:56:40	-54.935104	-15.97491
173	2020-04-08 07:56:40	-46.033863	-18.378798
233	2020-04-08 07:56:40	-54.38624	-21.48066
499	2020-04-08 07:56:40	-52.276455	-24.595455
511	2020-04-08 07:56:40	-52.804264	-29.684402
203	2020-04-08 07:56:40	-54.934887	-15.974923
153	2020-04-08 07:56:40	-54.9196	-16.002668
58	2020-04-08 07:56:40	-53.299652	-23.378113
423	2020-04-08 07:56:40	-40.38125	-14.527195
370	2020-04-08 07:56:40	-58.759094	-11.427063
435	2020-04-08 07:56:40	-38.89183	-12.309843
460	2020-04-08 07:56:40	-57.695927	-16.086454
231	2020-04-08 07:56:40	-54.37574	-21.473532
28	2020-04-08 07:56:40	-52.805042	-29.684092
324	2020-04-08 07:56:40	-38.89314	-12.310206
77	2020-04-08 07:56:40	-61.930527	-10.942576
382	2020-04-08 07:56:40	-38.20723	-6.12993
34	2020-04-08 07:56:40	-53.299675	-23.378231
102	2020-04-08 07:56:40	-54.85841	-9.486551
100	2020-04-08 07:56:40	-49.10968	-4.4296083
104	2020-04-08 07:56:40	-54.935005	-15.972362
320	2020-04-08 07:56:40	-38.892063	-12.310427
305	2020-04-08 07:56:40	-38.89196	-12.310472
219	2020-04-08 07:56:40	-39.003956	-10.521914
232	2020-04-08 07:56:40	-53.299194	-23.378525
64	2020-04-08 07:56:40	-53.299828	-23.37753
73	2020-04-08 07:56:40	-48.162895	-17.676645
228	2020-04-08 07:56:40	-38.89195	-12.310335
316	2020-04-08 07:56:40	-38.480537	-4.134168
296	2020-04-08 07:56:40	-38.891544	-12.310535
428	2020-04-08 07:56:40	-38.891994	-12.310048
314	2020-04-08 07:56:40	-38.891838	-12.310467
251	2020-04-08 07:56:40	-61.930336	-10.942364
133	2020-04-08 07:56:40	-54.934658	-15.973068
187	2020-04-08 07:56:40	-48.162704	-17.676903
44	2020-04-08 07:56:40	-53.29969	-23.37865
509	2020-04-08 07:56:40	-48.16342	-17.676678
55	2020-04-08 07:56:40	-54.93451	-15.972395
309	2020-04-08 07:56:40	-38.891796	-12.310534
27	2020-04-08 07:56:40	-49.813766	-24.153088
9	2020-04-08 07:56:40	-53.30026	-23.377909
116	2020-04-08 07:56:40	-60.088123	-12.790571
109	2020-04-08 07:56:40	-54.93457	-15.972096
484	2020-04-08 07:56:40	-53.048702	-25.785696
300	2020-04-08 07:56:40	-39.375484	-15.417005
254	2020-04-08 07:56:40	-52.805637	-29.683662
488	2020-04-08 07:56:40	-52.37137	-24.066671
37	2020-04-08 07:56:40	-53.29971	-23.3781
340	2020-04-08 07:56:40	-40.0135	-11.358501
290	2020-04-08 07:56:40	-52.805504	-29.68367
258	2020-04-08 07:56:40	-38.892056	-12.31031
388	2020-04-08 07:56:40	-54.38647	-21.4803
494	2020-04-08 07:56:40	-53.299328	-23.378956
447	2020-04-08 07:56:40	-54.722282	-2.4363384
131	2020-04-08 07:56:40	-53.299774	-23.37803
244	2020-04-08 07:56:40	-61.930336	-10.94386
328	2020-04-08 07:56:40	-54.934647	-15.972406
452	2020-04-08 07:56:40	-53.298656	-23.38066
196	2020-04-08 07:56:40	-48.162617	-17.677038
287	2020-04-08 07:56:40	-72.64784	-7.6515765
99	2020-04-08 07:56:40	-53.29916	-23.378607
12	2020-04-08 07:56:40	-53.300137	-23.378239
310	2020-04-08 07:56:40	-38.891575	-12.310518
486	2020-04-08 07:56:40	-54.2821	-23.781372
92	2020-04-08 07:56:40	-54.935333	-15.974765
359	2020-04-08 07:56:40	-49.243973	-16.839193
174	2020-04-08 07:56:40	-48.162914	-17.67611
166	2020-04-08 07:56:40	-48.16251	-17.676756
437	2020-04-08 07:56:40	-38.891872	-12.309807
193	2020-04-08 07:56:40	-48.16239	-17.676987
497	2020-04-08 07:56:40	-53.299904	-23.379215
88	2020-04-08 07:56:40	-60.08775	-12.789677
262	2020-04-08 07:56:40	-54.934887	-15.975005
38	2020-04-08 07:56:40	-53.2996	-23.37951
516	2020-04-08 07:56:40	-54.936024	-15.97397
393	2020-04-08 07:56:40	-65.32761	-10.401067
505	2020-04-08 07:56:40	-53.30013	-23.37765
317	2020-04-08 07:56:40	-38.89152	-12.310654
400	2020-04-08 07:56:40	-48.25569	-18.86541
67	2020-04-08 07:56:40	-54.920063	-16.00248
472	2020-04-08 07:56:40	-38.89241	-12.30994
87	2020-04-08 07:56:40	-61.93138	-10.94275
375	2020-04-08 07:56:40	-35.904896	-7.2826486
217	2020-04-08 07:56:40	-38.89234	-12.310265
390	2020-04-08 07:56:40	-54.274616	-23.938797
414	2020-04-08 07:56:40	-38.892708	-12.310495
392	2020-04-08 07:56:40	-61.930576	-10.942347
286	2020-04-08 07:56:40	-48.16268	-17.676197
333	2020-04-08 07:56:40	-54.934917	-15.972428
293	2020-04-08 07:56:40	-52.80541	-29.68355
46	2020-04-08 07:56:40	-53.299927	-23.377916
385	2020-04-08 07:56:40	-35.889435	-7.236225
308	2020-04-08 07:56:40	-38.891796	-12.31054
323	2020-04-08 09:09:39	-38.89221	-12.310351
391	2020-04-08 09:09:39	-54.38681	-21.480362
303	2020-04-08 09:09:39	-38.89173	-12.310498
322	2020-04-08 09:09:39	-38.893135	-12.310235
40	2020-04-08 09:09:39	-53.30014	-23.377144
409	2020-04-08 09:09:39	-48.16338	-17.67708
384	2020-04-08 09:09:39	-35.905083	-7.282935
446	2020-04-08 09:09:39	-53.298786	-23.38004
226	2020-04-08 09:09:39	-41.841057	-12.419762
127	2020-04-08 09:09:39	-68.73539	-11.029569
387	2020-04-08 09:09:39	-54.386818	-21.48037
341	2020-04-08 09:09:39	-38.89163	-12.31062
128	2020-04-08 09:09:39	-60.087803	-12.789558
84	2020-04-08 09:09:39	-60.087193	-12.789465
346	2020-04-08 09:09:39	-50.75438	-24.45643
2	2020-04-08 09:09:39	-54.935562	-15.974753
15	2020-04-08 09:09:39	-53.30018	-23.377705
268	2020-04-08 09:09:39	-54.9346	-15.972925
491	2020-04-08 09:09:39	-53.29994	-23.379786
39	2020-04-08 09:09:39	-53.30023	-23.377537
282	2020-04-08 09:09:39	-38.480537	-4.134155
243	2020-04-08 09:09:39	-61.931095	-10.942485
489	2020-04-08 09:09:39	-52.23041	-23.547802
106	2020-04-08 09:09:39	-53.300312	-23.377867
57	2020-04-08 09:09:39	-54.93449	-15.972174
179	2020-04-08 09:09:39	-47.921936	-18.17126
421	2020-04-08 09:09:39	-38.89286	-12.310467
412	2020-04-08 09:09:39	-38.891933	-12.309927
502	2020-04-08 09:09:39	-53.299454	-23.378775
276	2020-04-08 09:09:39	-38.89171	-12.310093
224	2020-04-08 09:09:39	-42.541664	-14.072382
360	2020-04-08 09:09:39	-48.369373	-10.584806
459	2020-04-08 09:09:39	-61.931297	-10.94296
22	2020-04-08 09:09:39	-54.934998	-15.974645
240	2020-04-08 09:09:39	-61.93071	-10.94261
147	2020-04-08 09:09:39	-61.930023	-10.943162
345	2020-04-08 09:09:39	-61.93001	-10.8922415
218	2020-04-08 09:09:39	-38.892117	-12.310402
292	2020-04-08 09:09:39	-52.805435	-29.68379
266	2020-04-08 09:09:39	-54.93503	-15.972292
373	2020-04-08 09:09:39	-38.891945	-12.310037
83	2020-04-08 09:09:39	-61.203514	-11.63185
185	2020-04-08 09:09:39	-49.934177	-7.09946
93	2020-04-08 09:09:39	-54.919636	-16.002697
95	2020-04-08 09:09:39	-61.930172	-10.943865
419	2020-04-08 09:09:39	-38.89234	-12.310635
420	2020-04-08 09:09:39	-38.802864	-10.98794
154	2020-04-08 09:09:39	-54.024563	-14.43768
461	2020-04-08 09:09:39	-38.89243	-12.310224
280	2020-04-08 09:09:39	-42.120148	-6.187422
108	2020-04-08 09:09:39	-61.93067	-10.942572
473	2020-04-08 09:09:39	-38.892784	-12.309865
487	2020-04-08 09:09:39	-53.299896	-23.379715
141	2020-04-08 09:09:39	-54.93466	-15.973077
331	2020-04-08 09:09:39	-54.934643	-15.972973
454	2020-04-08 09:09:39	-53.320576	-23.774996
201	2020-04-08 09:09:39	-60.087193	-12.7896
82	2020-04-08 09:09:39	-53.30002	-23.378366
74	2020-04-08 09:09:39	-48.162525	-17.676598
65	2020-04-08 09:09:39	-51.591637	-10.721659
238	2020-04-08 09:09:39	-61.930508	-10.9425
424	2020-04-08 09:09:39	-38.891792	-12.309832
319	2020-04-08 09:09:39	-38.891476	-12.310614
35	2020-04-08 09:09:39	-51.887737	-23.43468
146	2020-04-08 09:09:39	-60.12832	-12.729293
79	2020-04-08 09:09:39	-61.93145	-10.942614
225	2020-04-08 09:09:39	-38.892216	-12.310422
41	2020-04-08 09:09:39	-53.299637	-23.378101
403	2020-04-08 09:09:39	-48.162743	-17.676159
476	2020-04-08 09:09:39	-54.375748	-21.473251
289	2020-04-08 09:09:39	-60.08741	-12.789495
321	2020-04-08 09:09:39	-38.89204	-12.310416
448	2020-04-08 09:09:39	-53.292324	-23.383806
298	2020-04-08 09:09:39	-38.89214	-12.31036
440	2020-04-08 09:09:39	-57.652386	-19.032251
351	2020-04-08 09:09:39	-52.80572	-29.68355
143	2020-04-08 09:09:39	-54.935596	-15.974829
365	2020-04-08 09:09:39	-61.92984	-10.893648
157	2020-04-08 09:09:39	-54.97869	-15.953116
291	2020-04-08 09:09:39	-52.804993	-29.684282
307	2020-04-08 09:09:39	-38.891674	-12.310568
261	2020-04-08 09:09:39	-54.93562	-15.97488
510	2020-04-08 09:09:39	-60.08788	-12.79001
415	2020-04-08 09:09:39	-41.28965	-12.499653
348	2020-04-08 09:09:39	-52.805748	-29.683487
315	2020-04-08 09:09:39	-38.892063	-12.310365
255	2020-04-08 09:09:39	-52.446896	-29.707312
62	2020-04-08 09:09:39	-54.934444	-15.972312
85	2020-04-08 09:09:39	-60.08736	-12.789545
91	2020-04-08 09:09:39	-54.934814	-15.974836
159	2020-04-08 09:09:39	-38.89174	-12.310583
223	2020-04-08 09:09:39	-40.7957	-9.496965
123	2020-04-08 09:09:39	-38.891495	-12.31065
213	2020-04-08 09:09:39	-54.386833	-21.480543
436	2020-04-08 09:09:39	-38.892048	-12.31048
178	2020-04-08 09:09:39	-48.16243	-17.677044
209	2020-04-08 09:09:39	-53.2672	-23.77901
145	2020-04-08 09:09:39	-60.095627	-12.653276
279	2020-04-08 09:09:39	-35.968468	-6.246765
150	2020-04-08 09:09:39	-54.94172	-15.971187
275	2020-04-08 09:09:39	-38.8922	-12.310395
172	2020-04-08 09:09:39	-40.094036	-19.190426
252	2020-04-08 09:09:39	-44.061047	-22.473991
334	2020-04-08 09:09:39	-54.935608	-15.974925
212	2020-04-08 09:09:39	-54.386677	-21.480537
306	2020-04-08 09:09:39	-38.891945	-12.310449
114	2020-04-08 09:09:39	-60.088085	-12.790558
5	2020-04-08 09:09:39	-54.934513	-15.9723
122	2020-04-08 09:09:39	-53.299904	-23.37718
431	2020-04-08 09:09:39	-38.892376	-12.310265
512	2020-04-08 09:09:39	-52.805458	-29.683475
112	2020-04-08 09:09:39	-54.387604	-21.480448
52	2020-04-08 09:09:39	-61.931442	-10.942728
170	2020-04-08 09:09:39	-48.16292	-17.67608
394	2020-04-08 09:09:39	-67.33283	-8.7769165
190	2020-04-08 09:09:39	-48.16271	-17.67614
186	2020-04-08 09:09:39	-54.386135	-21.480684
273	2020-04-08 09:09:39	-54.38618	-21.48067
199	2020-04-08 09:09:39	-60.087624	-12.789825
115	2020-04-08 09:09:39	-61.931293	-10.9426565
111	2020-04-08 09:09:39	-54.387173	-21.479916
463	2020-04-08 09:09:39	-38.895817	-12.245562
235	2020-04-08 09:09:39	-61.93029	-10.94388
89	2020-04-08 09:09:39	-53.299873	-23.377285
495	2020-04-08 09:09:39	-55.00753	-23.61964
70	2020-04-08 09:09:39	-48.162895	-17.676134
53	2020-04-08 09:09:39	-54.93482	-15.974565
267	2020-04-08 09:09:39	-57.65773	-16.128958
478	2020-04-08 09:09:39	-54.730793	-2.4790983
16	2020-04-08 09:09:39	-53.29911	-23.37848
183	2020-04-08 09:09:39	-49.302956	-15.78496
462	2020-04-08 09:09:39	-38.89286	-12.310037
429	2020-04-08 09:09:39	-38.89198	-12.310019
121	2020-04-08 09:09:39	-60.08767	-12.789525
265	2020-04-08 09:09:39	-54.919685	-16.002808
119	2020-04-08 09:09:39	-61.203495	-11.631795
117	2020-04-08 09:09:39	-60.088223	-12.790568
335	2020-04-08 09:09:39	-38.893276	-12.310195
496	2020-04-08 09:09:39	-53.299435	-23.37897
470	2020-04-08 09:09:39	-38.892746	-12.310015
144	2020-04-08 09:09:39	-54.9356	-15.974551
483	2020-04-08 09:09:39	-53.299282	-23.379156
427	2020-04-08 09:09:39	-38.89248	-12.310525
477	2020-04-08 09:09:39	-53.374767	-23.407461
257	2020-04-08 09:09:39	-38.891598	-12.310683
45	2020-04-08 09:09:39	-53.300194	-23.37724
410	2020-04-08 09:09:39	-48.163334	-17.677126
182	2020-04-08 09:09:39	-44.877228	-3.488985
248	2020-04-08 09:09:39	-61.93081	-10.942525
135	2020-04-08 09:09:39	-54.934635	-15.972966
192	2020-04-08 09:09:39	-48.162445	-17.676256
31	2020-04-08 09:09:39	-53.30002	-23.378412
180	2020-04-08 09:09:39	-48.16247	-17.676367
247	2020-04-08 09:09:39	-67.85027	-10.002505
177	2020-04-08 09:09:39	-54.386227	-21.480717
202	2020-04-08 09:09:39	-54.935562	-15.974916
19	2020-04-08 09:09:39	-54.935177	-15.974948
379	2020-04-08 09:09:39	-39.371304	-7.2293434
515	2020-04-08 09:09:39	-54.93575	-15.973713
151	2020-04-08 09:09:39	-67.85025	-10.00255
43	2020-04-08 09:09:39	-53.29989	-23.377398
214	2020-04-08 09:09:39	-48.949013	-16.370905
368	2020-04-08 09:09:39	-53.538334	-16.932251
464	2020-04-08 09:09:39	-38.89272	-12.309934
76	2020-04-08 09:09:39	-60.08722	-12.789462
297	2020-04-08 09:09:39	-38.891655	-12.310712
210	2020-04-08 09:09:39	-54.386288	-21.48041
363	2020-04-08 09:09:39	-48.163425	-17.677061
124	2020-04-08 09:09:39	-38.891598	-12.310603
399	2020-04-08 09:09:39	-49.243607	-16.840313
376	2020-04-08 09:09:39	-35.759377	-5.901758
401	2020-04-08 09:09:39	-46.479626	-14.461641
449	2020-04-08 09:09:39	-54.93559	-15.973661
171	2020-04-08 09:09:39	-48.163227	-17.677069
230	2020-04-08 09:09:39	-38.985207	-12.272471
207	2020-04-08 09:09:39	-54.934456	-15.972735
71	2020-04-08 09:09:39	-48.163063	-17.67672
198	2020-04-08 09:09:39	-60.08769	-12.789567
466	2020-04-08 09:09:39	-39.465343	-11.410387
160	2020-04-08 09:09:39	-38.891945	-12.310409
245	2020-04-08 09:09:39	-61.930485	-10.94239
126	2020-04-08 09:09:39	-68.735275	-11.029687
33	2020-04-08 09:09:39	-53.299885	-23.378399
197	2020-04-08 09:09:39	-48.162262	-17.676298
362	2020-04-08 09:09:39	-48.16337	-17.67709
169	2020-04-08 09:09:39	-51.18143	-19.694546
344	2020-04-08 09:09:39	-54.386173	-21.480604
339	2020-04-08 09:09:39	-44.36165	-12.231894
205	2020-04-08 09:09:39	-54.934628	-15.974512
113	2020-04-08 09:09:39	-54.387306	-21.480015
418	2020-04-08 09:09:39	-38.34164	-10.072802
189	2020-04-08 09:09:39	-56.523922	-22.089895
361	2020-04-08 09:09:39	-48.16276	-17.677078
269	2020-04-08 09:09:39	-54.93455	-15.97286
48	2020-04-08 09:09:39	-53.299717	-23.377836
482	2020-04-08 09:09:39	-53.292927	-23.388622
369	2020-04-08 09:09:39	-54.934727	-15.973112
481	2020-04-08 09:09:39	-53.299755	-23.377947
90	2020-04-08 09:09:39	-54.935062	-15.974878
451	2020-04-08 09:09:39	-53.29855	-23.380022
78	2020-04-08 09:09:39	-61.931583	-10.9428
11	2020-04-08 09:09:39	-53.30021	-23.377907
237	2020-04-08 09:09:39	-61.93089	-10.94253
208	2020-04-08 09:09:39	-54.934765	-15.973112
374	2020-04-08 09:09:39	-38.94106	-12.267732
13	2020-04-08 09:09:39	-53.299915	-23.377953
378	2020-04-08 09:09:39	-35.90501	-7.28285
242	2020-04-08 09:09:39	-61.93071	-10.942393
332	2020-04-08 09:09:39	-54.934757	-15.974682
47	2020-04-08 09:09:39	-53.299774	-23.377636
103	2020-04-08 09:09:39	-53.299564	-23.378681
98	2020-04-08 09:09:39	-53.29914	-23.378523
66	2020-04-08 09:09:39	-60.08752	-12.789501
485	2020-04-08 09:09:39	-53.590355	-25.08632
24	2020-04-08 09:09:39	-54.934513	-15.972484
441	2020-04-08 09:09:39	-54.74992	-22.23186
295	2020-04-08 09:09:39	-38.892292	-12.310364
118	2020-04-08 09:09:39	-60.088207	-12.790565
343	2020-04-08 09:09:39	-44.43102	-12.226218
7	2020-04-08 09:09:39	-53.3002	-23.377901
411	2020-04-08 09:09:39	-48.25463	-18.863756
304	2020-04-08 09:09:39	-38.89171	-12.310465
68	2020-04-08 09:09:39	-54.934483	-15.972312
6	2020-04-08 09:09:39	-53.30016	-23.377832
26	2020-04-08 09:09:39	-60.087814	-12.789492
408	2020-04-08 09:09:39	-49.320232	-14.8547
465	2020-04-08 09:09:39	-38.892467	-12.310003
439	2020-04-08 09:09:39	-53.29935	-23.378971
42	2020-04-08 09:09:39	-53.29965	-23.3795
364	2020-04-08 09:09:39	-56.37735	-14.377255
10	2020-04-08 09:09:39	-53.30253	-23.380379
371	2020-04-08 09:09:39	-38.892006	-12.3101015
164	2020-04-08 09:09:39	-54.37932	-21.473936
508	2020-04-08 09:09:39	-53.30016	-23.377691
422	2020-04-08 09:09:39	-38.799255	-10.984607
503	2020-04-08 09:09:39	-50.201824	-23.867516
517	2020-04-08 09:09:39	-54.9356	-15.974608
301	2020-04-08 09:09:39	-38.89188	-12.310235
504	2020-04-08 09:09:39	-53.29908	-23.37908
299	2020-04-08 09:09:39	-38.891865	-12.310509
354	2020-04-08 09:09:39	-52.805866	-29.683353
356	2020-04-08 09:09:39	-52.805046	-29.684263
329	2020-04-08 09:09:39	-54.934574	-15.97292
249	2020-04-08 09:09:39	-61.93041	-10.9423685
372	2020-04-08 09:09:39	-38.964706	-12.24243
302	2020-04-08 09:09:39	-38.891872	-12.310534
352	2020-04-08 09:09:39	-52.805508	-29.68371
216	2020-04-08 09:09:39	-53.29993	-23.378328
138	2020-04-08 09:09:39	-51.836384	-12.948947
107	2020-04-08 09:09:39	-61.93164	-10.942565
283	2020-04-08 09:09:39	-38.892258	-12.310333
96	2020-04-08 09:09:39	-53.299786	-23.377518
326	2020-04-08 09:09:39	-54.919582	-16.002687
284	2020-04-08 09:09:39	-54.387356	-21.479778
69	2020-04-08 09:09:39	-54.93499	-15.972735
405	2020-04-08 09:09:39	-54.386044	-21.480618
330	2020-04-08 09:09:39	-54.93469	-15.97298
425	2020-04-08 09:09:39	-53.29992	-23.378263
347	2020-04-08 09:09:39	-60.088295	-12.790638
367	2020-04-08 09:09:39	-54.93553	-15.974515
337	2020-04-08 09:09:39	-38.89147	-12.310632
20	2020-04-08 09:09:39	-54.93806	-15.973119
63	2020-04-08 09:09:39	-61.930744	-10.94253
366	2020-04-08 09:09:39	-62.580547	-9.37337
294	2020-04-08 09:09:39	-52.805466	-29.683739
253	2020-04-08 09:09:39	-67.85025	-10.002417
152	2020-04-08 09:09:39	-54.93497	-15.975008
188	2020-04-08 09:09:39	-42.079994	-16.890263
175	2020-04-08 09:09:39	-48.162804	-17.676125
30	2020-04-08 09:09:39	-53.300198	-23.377155
457	2020-04-08 09:09:39	-53.298595	-23.37995
86	2020-04-08 09:09:39	-60.08776	-12.78965
475	2020-04-08 09:09:39	-54.386856	-21.480433
125	2020-04-08 09:09:39	-40.381226	-14.527075
342	2020-04-08 09:09:39	-38.892048	-12.310409
417	2020-04-08 09:09:39	-38.891987	-12.30984
318	2020-04-08 09:09:39	-38.891567	-12.310685
101	2020-04-08 09:09:39	-53.300014	-23.378325
236	2020-04-08 09:09:39	-61.93073	-10.942415
140	2020-04-08 09:09:39	-54.93455	-15.972524
264	2020-04-08 09:09:39	-54.980392	-15.952782
200	2020-04-08 09:09:39	-61.93121	-10.94241
206	2020-04-08 09:09:39	-54.9348	-15.974573
194	2020-04-08 09:09:39	-48.16251	-17.676075
479	2020-04-08 09:09:39	-53.299908	-23.378387
134	2020-04-08 09:09:39	-54.93506	-15.97507
75	2020-04-08 09:09:39	-60.08746	-12.789565
353	2020-04-08 09:09:39	-52.805817	-29.683367
137	2020-04-08 09:09:39	-54.93485	-15.974687
32	2020-04-08 09:09:39	-48.16287	-17.676743
139	2020-04-08 09:09:39	-58.524246	-10.364915
94	2020-04-08 09:09:39	-57.894356	-13.714909
162	2020-04-08 09:09:39	-38.891914	-12.31049
501	2020-04-08 09:09:39	-53.29936	-23.378983
474	2020-04-08 09:09:39	-38.951496	-12.299005
132	2020-04-08 09:09:39	-53.300327	-23.377794
413	2020-04-08 09:09:39	-38.891987	-12.310043
270	2020-04-08 09:09:39	-54.934532	-15.972877
250	2020-04-08 09:09:39	-60.102695	-12.75471
432	2020-04-08 09:09:39	-38.89255	-12.31056
3	2020-04-08 09:09:39	-67.85036	-10.00246
120	2020-04-08 09:09:39	-63.83647	-8.799309
176	2020-04-08 09:09:39	-48.162533	-17.677084
357	2020-04-08 09:09:39	-52.804836	-29.684284
438	2020-04-08 09:09:39	-53.299915	-23.37728
61	2020-04-08 09:09:39	-54.934994	-15.972422
246	2020-04-08 09:09:39	-61.93121	-10.942518
155	2020-04-08 09:09:39	-54.935604	-15.974584
381	2020-04-08 09:09:39	-35.90484	-7.2824416
29	2020-04-08 09:09:39	-52.80493	-29.684061
358	2020-04-08 09:09:39	-53.292854	-23.3891
21	2020-04-08 09:09:39	-54.935024	-15.974934
416	2020-04-08 09:09:39	-39.26393	-12.955522
288	2020-04-08 09:09:39	-61.931442	-10.942565
398	2020-04-08 09:09:39	-47.942986	-18.182337
480	2020-04-08 09:09:39	-53.300087	-23.377218
136	2020-04-08 09:09:39	-54.93459	-15.97297
234	2020-04-08 09:09:39	-54.386024	-21.480444
105	2020-04-08 09:09:39	-53.299202	-23.378813
426	2020-04-08 09:09:39	-38.89193	-12.309863
263	2020-04-08 09:09:39	-54.9348	-15.974762
229	2020-04-08 09:09:39	-38.891945	-12.31031
272	2020-04-08 09:09:39	-54.934887	-15.97488
281	2020-04-08 09:09:39	-38.893055	-12.310308
455	2020-04-08 09:09:39	-53.29807	-23.380537
313	2020-04-08 09:09:39	-38.89168	-12.310536
72	2020-04-08 09:09:39	-48.16283	-17.676727
227	2020-04-08 09:09:39	-42.799088	-12.27001
110	2020-04-08 09:09:39	-54.387703	-21.48042
49	2020-04-08 09:09:39	-53.28924	-23.778545
50	2020-04-08 09:09:39	-53.299835	-23.37829
56	2020-04-08 09:09:39	-54.93443	-15.972232
148	2020-04-08 09:09:39	-48.16242	-17.676638
312	2020-04-08 09:09:39	-38.8917	-12.310603
215	2020-04-08 09:09:39	-38.839424	-11.053416
327	2020-04-08 09:09:39	-54.93476	-15.972047
450	2020-04-08 09:09:39	-61.97405	-10.880342
271	2020-04-08 09:09:39	-55.117092	-10.616683
220	2020-04-08 09:09:39	-41.738255	-6.94373
204	2020-04-08 09:09:39	-54.93497	-15.97467
383	2020-04-08 09:09:39	-35.90494	-7.2825785
490	2020-04-08 09:09:39	-53.29981	-23.379827
17	2020-04-08 09:09:39	-53.299244	-23.37917
507	2020-04-08 09:09:39	-56.02666	-15.646787
396	2020-04-08 09:09:39	-48.162724	-17.676205
142	2020-04-08 09:09:39	-54.93488	-15.974947
97	2020-04-08 09:09:39	-53.29993	-23.37712
433	2020-04-08 09:09:39	-38.892403	-12.31026
349	2020-04-08 09:09:39	-52.805042	-29.684351
311	2020-04-08 09:09:39	-38.89309	-12.310237
256	2020-04-08 09:09:39	-52.80525	-29.684143
397	2020-04-08 09:09:39	-41.064953	-20.364738
241	2020-04-08 09:09:39	-63.836254	-8.798982
211	2020-04-08 09:09:39	-54.386154	-21.48057
149	2020-04-08 09:09:39	-61.930386	-10.942335
468	2020-04-08 09:09:39	-38.89244	-12.310057
161	2020-04-08 09:09:39	-38.892094	-12.310393
80	2020-04-08 09:09:39	-60.087646	-12.789514
130	2020-04-08 09:09:39	-53.49844	-26.7618
181	2020-04-08 09:09:39	-54.386173	-21.480658
513	2020-04-08 09:09:39	-38.891872	-12.31034
380	2020-04-08 09:09:39	-35.90514	-7.282865
277	2020-04-08 09:09:39	-38.891834	-12.310465
471	2020-04-08 09:09:39	-38.952423	-12.295201
389	2020-04-08 09:09:39	-54.38687	-21.480366
60	2020-04-08 09:09:39	-53.29977	-23.378233
158	2020-04-08 09:09:39	-54.919594	-16.002733
14	2020-04-08 09:09:39	-55.998444	-4.260165
498	2020-04-08 09:09:39	-53.299347	-23.379051
434	2020-04-08 09:09:39	-40.00331	-11.381489
407	2020-04-08 09:09:39	-48.162796	-17.67618
222	2020-04-08 09:09:39	-39.74095	-17.58727
338	2020-04-08 09:09:39	-42.113827	-4.767345
25	2020-04-08 09:09:39	-60.087784	-12.789632
221	2020-04-08 09:09:39	-44.403778	-12.233512
458	2020-04-08 09:09:39	-51.96578	-23.42372
81	2020-04-08 09:09:39	-54.934395	-15.971889
500	2020-04-08 09:09:39	-53.299294	-23.379087
129	2020-04-08 09:09:39	-61.931206	-10.890997
195	2020-04-08 09:09:39	-49.173504	-11.903697
167	2020-04-08 09:09:39	-52.184395	-3.1791
430	2020-04-08 09:09:39	-36.91639	-10.392484
492	2020-04-08 09:09:39	-53.29998	-23.37971
191	2020-04-08 09:09:39	-61.93092	-10.942455
54	2020-04-08 09:09:39	-53.300304	-23.377756
259	2020-04-08 09:09:39	-54.934784	-15.972101
168	2020-04-08 09:09:39	-48.16243	-17.67673
395	2020-04-08 09:09:39	-61.930767	-10.942355
442	2020-04-08 09:09:39	-53.300247	-23.377731
443	2020-04-08 09:09:39	-53.299835	-23.376955
386	2020-04-08 09:09:39	-52.422523	-21.717817
456	2020-04-08 09:09:39	-53.294262	-23.383184
165	2020-04-08 09:09:39	-48.162403	-17.6763
23	2020-04-08 09:09:39	-54.935165	-15.975001
59	2020-04-08 09:09:39	-54.934383	-15.972247
184	2020-04-08 09:09:39	-48.884754	-10.147587
336	2020-04-08 09:09:39	-41.238647	-14.032269
355	2020-04-08 09:09:39	-52.805477	-29.683687
51	2020-04-08 09:09:39	-48.162983	-17.676691
18	2020-04-08 09:09:39	-53.29983	-23.377476
278	2020-04-08 09:09:39	-40.481266	-9.467696
239	2020-04-08 09:09:39	-61.9308	-10.942398
285	2020-04-08 09:09:39	-48.162895	-17.676126
402	2020-04-08 09:09:39	-45.098103	-18.37446
156	2020-04-08 09:09:39	-54.934937	-15.975027
377	2020-04-08 09:09:39	-35.970436	-8.178476
260	2020-04-08 09:09:39	-54.934696	-15.973112
274	2020-04-08 09:09:39	-38.8921	-12.310297
350	2020-04-08 09:09:39	-52.80537	-29.683764
469	2020-04-08 09:09:39	-38.981194	-12.233577
163	2020-04-08 09:09:39	-48.162556	-17.67614
406	2020-04-08 09:09:39	-49.243896	-16.839397
404	2020-04-08 09:09:39	-49.30275	-15.785559
493	2020-04-08 09:09:39	-53.299286	-23.379137
325	2020-04-08 09:09:39	-54.934444	-15.972767
514	2020-04-08 09:09:39	-54.935085	-15.974876
173	2020-04-08 09:09:39	-46.03392	-18.378803
233	2020-04-08 09:09:39	-54.386208	-21.480751
499	2020-04-08 09:09:39	-52.276367	-24.595455
511	2020-04-08 09:09:39	-52.804264	-29.684402
203	2020-04-08 09:09:39	-54.934875	-15.974915
153	2020-04-08 09:09:39	-54.91963	-16.002623
58	2020-04-08 09:09:39	-53.299652	-23.378113
423	2020-04-08 09:09:39	-40.38134	-14.5271635
370	2020-04-08 09:09:39	-58.759033	-11.426976
435	2020-04-08 09:09:39	-38.89189	-12.30985
460	2020-04-08 09:09:39	-57.69591	-16.086441
231	2020-04-08 09:09:39	-54.375828	-21.473621
28	2020-04-08 09:09:39	-52.805042	-29.684092
324	2020-04-08 09:09:39	-38.89311	-12.310285
77	2020-04-08 09:09:39	-61.930424	-10.9424
382	2020-04-08 09:09:39	-38.20723	-6.12993
323	2020-04-08 07:56:40	-38.892128	-12.310284
391	2020-04-08 07:56:40	-54.38679	-21.480318
303	2020-04-08 07:56:40	-38.891747	-12.31046
322	2020-04-08 07:56:40	-38.89312	-12.310217
40	2020-04-08 07:56:40	-53.300163	-23.37708
409	2020-04-08 07:56:40	-48.163383	-17.677078
384	2020-04-08 07:56:40	-35.905113	-7.2829
446	2020-04-08 07:56:40	-53.298725	-23.379982
226	2020-04-08 07:56:40	-41.84109	-12.419777
127	2020-04-08 07:56:40	-68.73541	-11.029612
387	2020-04-08 07:56:40	-54.386833	-21.480415
341	2020-04-08 07:56:40	-38.891636	-12.310601
128	2020-04-08 07:56:40	-60.087852	-12.789545
84	2020-04-08 07:56:40	-60.087307	-12.7894535
346	2020-04-08 07:56:40	-50.754383	-24.45646
2	2020-04-08 07:56:40	-54.93554	-15.974809
15	2020-04-08 07:56:40	-53.30015	-23.37764
268	2020-04-08 07:56:40	-54.934544	-15.972814
491	2020-04-08 07:56:40	-53.299866	-23.37967
39	2020-04-08 07:56:40	-53.300236	-23.377586
282	2020-04-08 07:56:40	-38.480537	-4.134155
243	2020-04-08 07:56:40	-61.931095	-10.942485
489	2020-04-08 07:56:40	-52.23037	-23.5478
106	2020-04-08 07:56:40	-53.300312	-23.377867
57	2020-04-08 07:56:40	-54.934566	-15.972147
179	2020-04-08 07:56:40	-47.921867	-18.17129
421	2020-04-08 07:56:40	-38.892857	-12.310449
412	2020-04-08 07:56:40	-38.89198	-12.309937
502	2020-04-08 07:56:40	-53.29945	-23.37877
276	2020-04-08 07:56:40	-38.891754	-12.310059
224	2020-04-08 07:56:40	-42.541607	-14.072376
360	2020-04-08 07:56:40	-48.369385	-10.584775
459	2020-04-08 07:56:40	-61.931297	-10.94296
22	2020-04-08 07:56:40	-54.934975	-15.97458
240	2020-04-08 07:56:40	-61.930748	-10.942385
147	2020-04-08 07:56:40	-61.930134	-10.943162
345	2020-04-08 07:56:40	-61.93001	-10.8922415
218	2020-04-08 07:56:40	-38.892086	-12.310371
292	2020-04-08 07:56:40	-52.805435	-29.68379
266	2020-04-08 07:56:40	-54.93493	-15.972245
373	2020-04-08 07:56:40	-38.89207	-12.309952
83	2020-04-08 07:56:40	-61.20349	-11.63182
185	2020-04-08 07:56:40	-49.934204	-7.0995035
93	2020-04-08 07:56:40	-54.919567	-16.002619
95	2020-04-08 07:56:40	-61.93021	-10.94383
419	2020-04-08 07:56:40	-38.89247	-12.310607
420	2020-04-08 07:56:40	-38.802845	-10.987924
154	2020-04-08 07:56:40	-54.02471	-14.437714
461	2020-04-08 07:56:40	-38.892433	-12.310251
280	2020-04-08 07:56:40	-42.120033	-6.1873665
108	2020-04-08 07:56:40	-61.930595	-10.942482
473	2020-04-08 07:56:40	-38.892715	-12.309849
487	2020-04-08 07:56:40	-53.29989	-23.379705
141	2020-04-08 07:56:40	-54.93466	-15.973077
331	2020-04-08 07:56:40	-54.93462	-15.972937
454	2020-04-08 07:56:40	-53.320576	-23.774996
201	2020-04-08 07:56:40	-60.0872	-12.789597
82	2020-04-08 07:56:40	-53.300137	-23.378466
74	2020-04-08 07:56:40	-48.162525	-17.676598
65	2020-04-08 07:56:40	-51.591637	-10.721659
238	2020-04-08 07:56:40	-61.930492	-10.942367
424	2020-04-08 07:56:40	-38.891872	-12.309765
319	2020-04-08 07:56:40	-38.891476	-12.310614
35	2020-04-08 07:56:40	-51.887745	-23.434671
146	2020-04-08 07:56:40	-60.128323	-12.729281
79	2020-04-08 07:56:40	-61.931496	-10.942549
225	2020-04-08 07:56:40	-38.89222	-12.310355
41	2020-04-08 07:56:40	-53.299675	-23.378044
403	2020-04-08 07:56:40	-48.16278	-17.67613
476	2020-04-08 07:56:40	-54.375748	-21.473251
289	2020-04-08 07:56:40	-60.087418	-12.789507
321	2020-04-08 07:56:40	-38.892025	-12.31048
448	2020-04-08 07:56:40	-53.29222	-23.383842
298	2020-04-08 07:56:40	-38.892094	-12.310318
440	2020-04-08 07:56:40	-57.652424	-19.03218
351	2020-04-08 07:56:40	-52.80572	-29.68355
143	2020-04-08 07:56:40	-54.93562	-15.974751
365	2020-04-08 07:56:40	-61.92984	-10.893648
157	2020-04-08 07:56:40	-54.978542	-15.953155
291	2020-04-08 07:56:40	-52.804928	-29.684235
307	2020-04-08 07:56:40	-38.891735	-12.310522
261	2020-04-08 07:56:40	-54.935574	-15.974796
510	2020-04-08 07:56:40	-60.08795	-12.790013
415	2020-04-08 07:56:40	-41.28965	-12.499653
348	2020-04-08 07:56:40	-52.805748	-29.683487
315	2020-04-08 07:56:40	-38.892	-12.310396
255	2020-04-08 07:56:40	-52.446896	-29.707312
62	2020-04-08 07:56:40	-54.93445	-15.972279
85	2020-04-08 07:56:40	-60.087353	-12.789475
91	2020-04-08 07:56:40	-54.934906	-15.97486
159	2020-04-08 07:56:40	-38.891747	-12.310538
223	2020-04-08 07:56:40	-40.795647	-9.49698
123	2020-04-08 07:56:40	-38.89147	-12.310647
213	2020-04-08 07:56:40	-54.386765	-21.480532
436	2020-04-08 07:56:40	-38.892014	-12.310364
178	2020-04-08 07:56:40	-48.162476	-17.676983
209	2020-04-08 07:56:40	-53.267166	-23.778969
145	2020-04-08 07:56:40	-60.09562	-12.653272
279	2020-04-08 07:56:40	-35.968468	-6.246765
150	2020-04-08 07:56:40	-54.94172	-15.971187
275	2020-04-08 07:56:40	-38.89221	-12.310425
172	2020-04-08 07:56:40	-40.093987	-19.19047
252	2020-04-08 07:56:40	-44.061092	-22.474049
334	2020-04-08 07:56:40	-54.935574	-15.974952
212	2020-04-08 07:56:40	-54.38674	-21.4805
306	2020-04-08 07:56:40	-38.891945	-12.310411
114	2020-04-08 07:56:40	-60.088085	-12.790558
5	2020-04-08 07:56:40	-54.934513	-15.9723
122	2020-04-08 07:56:40	-53.299934	-23.377184
431	2020-04-08 07:56:40	-38.892334	-12.310264
512	2020-04-08 07:56:40	-52.805458	-29.683475
112	2020-04-08 07:56:40	-54.387604	-21.480356
52	2020-04-08 07:56:40	-61.93139	-10.942721
170	2020-04-08 07:56:40	-48.162926	-17.676111
394	2020-04-08 07:56:40	-67.332794	-8.776901
190	2020-04-08 07:56:40	-48.162773	-17.676105
186	2020-04-08 07:56:40	-54.386314	-21.480577
273	2020-04-08 07:56:40	-54.386196	-21.480711
199	2020-04-08 07:56:40	-60.087624	-12.789825
115	2020-04-08 07:56:40	-61.93136	-10.942634
111	2020-04-08 07:56:40	-54.38708	-21.479912
463	2020-04-08 07:56:40	-38.89587	-12.24558
235	2020-04-08 07:56:40	-61.93029	-10.94388
89	2020-04-08 07:56:40	-53.2999	-23.377243
495	2020-04-08 07:56:40	-55.007484	-23.619688
70	2020-04-08 07:56:40	-48.162907	-17.676144
53	2020-04-08 07:56:40	-54.93467	-15.974613
34	2020-04-08 09:09:39	-53.299664	-23.378227
102	2020-04-08 09:09:39	-54.85841	-9.486551
100	2020-04-08 09:09:39	-49.10967	-4.4296083
104	2020-04-08 09:09:39	-54.93503	-15.97238
320	2020-04-08 09:09:39	-38.892063	-12.31042
305	2020-04-08 09:09:39	-38.89179	-12.310583
219	2020-04-08 09:09:39	-39.00395	-10.521927
232	2020-04-08 09:09:39	-53.2992	-23.378614
64	2020-04-08 09:09:39	-53.299862	-23.377602
73	2020-04-08 09:09:39	-48.16293	-17.676672
228	2020-04-08 09:09:39	-38.891865	-12.310311
316	2020-04-08 09:09:39	-38.48059	-4.134112
296	2020-04-08 09:09:39	-38.891544	-12.310536
428	2020-04-08 09:09:39	-38.892014	-12.310083
314	2020-04-08 09:09:39	-38.891983	-12.31055
251	2020-04-08 09:09:39	-61.93034	-10.942402
133	2020-04-08 09:09:39	-54.934742	-15.973032
187	2020-04-08 09:09:39	-48.16273	-17.677025
44	2020-04-08 09:09:39	-53.299603	-23.378601
509	2020-04-08 09:09:39	-48.16345	-17.676723
55	2020-04-08 09:09:39	-54.934513	-15.972392
309	2020-04-08 09:09:39	-38.89185	-12.310605
27	2020-04-08 09:09:39	-49.813797	-24.153093
9	2020-04-08 09:09:39	-53.30026	-23.377909
116	2020-04-08 09:09:39	-60.088097	-12.790575
109	2020-04-08 09:09:39	-54.934517	-15.972107
484	2020-04-08 09:09:39	-53.04871	-25.78568
300	2020-04-08 09:09:39	-39.375484	-15.417005
254	2020-04-08 09:09:39	-52.805637	-29.683662
488	2020-04-08 09:09:39	-52.37137	-24.066671
37	2020-04-08 09:09:39	-53.299747	-23.378122
340	2020-04-08 09:09:39	-40.013542	-11.358528
290	2020-04-08 09:09:39	-52.80556	-29.683619
258	2020-04-08 09:09:39	-38.89208	-12.310429
388	2020-04-08 09:09:39	-54.38647	-21.4803
494	2020-04-08 09:09:39	-53.29929	-23.378975
447	2020-04-08 09:09:39	-54.722256	-2.43638
131	2020-04-08 09:09:39	-53.29972	-23.378038
244	2020-04-08 09:09:39	-61.930336	-10.94386
328	2020-04-08 09:09:39	-54.934555	-15.972464
452	2020-04-08 09:09:39	-53.298656	-23.38066
196	2020-04-08 09:09:39	-48.162655	-17.677044
287	2020-04-08 09:09:39	-72.64787	-7.6515784
99	2020-04-08 09:09:39	-53.299152	-23.378513
12	2020-04-08 09:09:39	-53.300106	-23.378187
310	2020-04-08 09:09:39	-38.89157	-12.310543
486	2020-04-08 09:09:39	-54.282093	-23.78146
\.


--
-- TOC entry 3056 (class 0 OID 32797)
-- Dependencies: 213
-- Data for Name: multa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multa (idmulta, prefixo, data, placa, infracao, nomemotorista, matriculamotorista, local, valorinflacao, valorpago) FROM stdin;
4427	420	2019-08-29	AOH6666	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	DINEI GOMES DA SILVA	25955	GO 020 KM 114 CRISTIANOPOLIS, SANTA CRUZ DE GOIAS	957.69	766.15
4428	1535	2019-08-27	NCU3177	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	ANDREYSON ROGERIO FERREIRA DA SILVA	\N	DETRAN/MS	104.12	83.3
4429	6455	2019-08-27	AYR9572	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCINALDO FIRMINO DA SILVA	111	AV. PERIMETRAL DA CIENCIA LADO OPOSTO  N 1000	104.13	83.3
4430	7275	2019-08-26	BBM8419	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	EMERSON GUEDES DE SOUZA	\N	SP 280 KM 080,200	104.13	83.3
4431	6685	2019-08-26	BAQ4021	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	GO 330, KM 52 CATALAO, IPAMERI	957.69	766.15
4432	7165	2019-08-26	BBI9838	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	ELEANDRO DA SILVA MACHDO	\N	RUA ANTONIO JOAO, ESQUINA COM A RUA JORGE ROBERTO S	293.47	234.78
4433	7275	2019-08-22	BBM8419	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	EMERSON GUEDES DE SOUZA	\N	SP 280 KM 091,700	104.13	83.3
4434	420	2019-08-22	AOH6666	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	ALBERTINO VIRGULINO DOS SANTOS	\N	AV. FERNANDO CORRÊA  DA COSTA, 3813, BOA ESPERANÇA, CUIABA, FRENTE A PAIOL MADEIRAS	104.13	83.3
4435	7180	2019-08-21	BBH8858	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	AV. GURY MARQUES X AV. GUAICURUS	156.18	96
4436	4710	2019-08-18	AUZ8421	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILLIAM PEREIRA DA SILVA	283	REC 453 KM  4.350	104.13	68.1
4437	7505	2019-08-16	PRR7103	ESTACIONAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	JOSE CARLOS SANTOS DO VALE	18208	PE 22 EM FRENTE  A LOJA DE REVENDA DE COLCHOES SONO PERFEITO	180	144
4438	8115	2019-08-16	BDC9E15	PARAR SOBRE FAIXA DE PEDESTRE NA MUDANCA DE SEMAFORO(ELET)	\N	\N	AV. PARANAM X RIO GRANDE DO SUL	104.13	83.3
4439	3830	2019-08-16	ARC1290	CONDUZIR O VEÍCULO COM EQUIPAMENTO OBRIGATÓRIO INEFICIENTE/INOPERANTE	JOSELITO FERREIRA DA SILVA	\N	RV CE 176 KM 470 TAUA-CE	156.18	124.94
4440	7570	2019-08-14	BCH2977	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	MULTA DA EMPRESA	\N	BR 174 KM 75	104.13	83.21
4441	7285	2019-08-09	AYH2376	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	\N	\N	BR 153 KM 362	104.13	104.13
4442	7465	2019-08-08	PRV9972	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VOLNEI DE LARA	15512	AV. OSVALDO JULIO WERLANG, PROX N 1380 BAIRRO, CENTRO PISTA ESQUERDA	104.13	83.3
4443	1405	2019-08-08	BXF4340	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - PBT/PBTC E POR EIXO	MULTA DA EMPRESA	\N	BR 435 KM 19,000	104.13	83.44
4444	7330	2019-08-06	BBQ6208	DEIXAR DE ADENTRAR ÀS ÁREAS DESTINADAS À PESAGEM DE VEÍCULOS	DARLAN LEITE VAZ	29087	ROD. BA 093 KM 44 MATA DE SÃO JOÃO	156.18	124.94
4445	7945	2019-08-02	BDB2F36	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELISANGELA LAVEZZO	22140	SP 425 KM 227,950	104.13	83.3
4446	3800	2019-08-02	ABG1440	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS VIRGINIO DA SILVA	18243	RODOVIA PE 218 KM 16,80 - SENTIDO BREJAO	104.13	83.3
4447	7415	2019-07-31	BBW7840	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	NILTON RODRIGUES ALVES	27	SP 310 KM 233,100	104.13	83.3
4448	8280	2019-07-31	BDF4J81	TRANSITAR EM DESACORDO C/ AUTORIZAÇÃO EXPEDIDA P/VEÍCULO C/ DIMENSÕES EXCEDENTES	MIGUEL AGUIAR RIBEIRO	4	BR 376 KM 411	156.18	124.94
4449	7175	2019-07-31	BBH8859	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	PR 986 KM 4+700	104.13	83.3
4450	1525	2019-07-30	NCU3167	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIEGO FERREIRA DA SILVA	\N	BR 364 KM 464,300	104.13	83.3
4451	4935	2019-07-30	AWG1781	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	RAIMUNDO FILHO DA SILVA HENRIQUE	225	AV. JOAO PAULO II  X TRAV. HUMAITA	191.54	153.23
4452	2990	2019-07-29	AMX5243	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	WILLIAM PEREIRA DA SILVA	283	SP 150 KM 059,00	104.13	83.3
4453	7285	2019-07-29	AYH2376	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	\N	\N	DETRAN/MS	156.18	124.94
4454	460	2019-07-28	AFD5132	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	BR 163 KM 480+600	104.13	83.3
4455	1180	2019-07-28	AJC8792	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TIAGO DIAS BORGES DA SILVA	129	PR 092 KM 281+300	104.13	83.3
4456	7525	2019-07-28	BBC8666	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	AV. ARQ. NILDO RIBEIRO DA ROCHA, N 5960 MAIS 112 M L/O FAIXA 2	104.13	83.3
4457	2380	2019-07-27	AOQ5817	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALDEMIR ROCHA DOS SANTOS	19	BR 050 KM 206+700	104.13	83.3
4458	4700	2019-07-26	AUZ8422	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DANILO DA SILVA SANTOS	26454	BR 116 KM 5,000	104.13	83.3
4459	3290	2019-07-26	ARI6189	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	GILVAN SANTOS CRUZ	34126	CE 162 KM 113	104.13	83.3
4460	7335	2019-07-25	PRR0194	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	EDILSON FERREIRA LIMA	414	SP 160 KM 042,800	85.13	68.1
4461	4365	2019-07-25	ATY5536	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	MARCELO DE MELO SANTOS	\N	PE 009 E/F AO POSTO DO BRRV MURO ALTO	156.18	124.94
4462	2315	2019-07-25	AON5143	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	ALCIDES FELICIANO SILVA	24376	BR 101 KM 81 UF/SC	156.18	124.94
4463	2315	2019-07-25	AON5143	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	MULTA DA EMPRESA	\N	BR 101 KM 81 UF SC	156.18	102.15
4464	7275	2019-07-24	BBM8419	DIRIGIR VEÍCULO UTILIZANDO-SE DE TELEFONE CELULAR	GILBERTO GIMENEZ ANTONUCCI	\N	SP 280 KM 197,600	104.13	83.3
4465	4930	2019-07-24	AWF5880	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	HUELTON CARLOS GOMES	\N	BR 364 KM 464+300	104.13	83.3
4466	6605	2019-07-24	BAE8370	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCOS GODOY DE LIMA	6248	BR 364 KM 458+700	104.13	83.3
4467	3570	2019-07-22	AGZ2050	DEIXAR DE ADENTRAR ÀS ÁREAS DESTINADAS À PESAGEM DE VEÍCULOS	ALDO SOARES DE ABREU	251	MG 187 KM 67	156.18	124.94
4468	4345	2019-07-22	ATW4394	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	ALEXANDRE DA SILVA XAVIER	\N	BR 364 KM 211 UF/MT	104.13	68.1
4469	7405	2019-07-20	PRI2997	TRANSITAR PELA CONTRAMÃO DE DIREÇÃO EM VIA COM DUPLO SENTIDO DE CIRCULAÇÃO	CLEMILSON BARBOZA DE SOUZA	28923	AV. RODRIGUES ALVES/ CENTRO - PROXIMO A LOJA IMPACTO BIJU	156.18	124.95
4470	1895	2019-07-19	AMK7493	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	\N	\N	BR 364 KM 338	104.13	83.3
4471	4860	2019-07-03	AWC9135	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSINER SILVA DE CARVALHO	138	AV. PERIMETRAL DA CIENCIA EM FRENTE N 1000	104.13	83.3
4472	4100	2019-06-21	AAV7009	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - PBT/PBTC E POR EIXO	MULTA DA EMPRESA	\N	MG 190 KM 126.30	104.13	83.3
4473	1340	2019-06-17	AKX9332	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	JOAO CARLOS COELHO ROSA	404	AV. GOV. JADER BARBALHO PROX AO N 1781 ALTAMIRA PA	293.47	234.78
4474	6475	2019-06-16	AYZ5647	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOILSON SANTOS AMORIM	10024	CE 282 KM 90.0	104.13	83.3
4475	2365	2019-06-13	APF2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELISANGELA LAVEZZO	22140	BR 376 KM 308+700	104.13	83.3
4476	4240	2019-06-11	AGZ0288	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TABAJARA SOARES BOAVENTURA NETO	27346	BR 367 KM 82.000	104.13	83.3
4477	4300	2019-06-10	CKT5776	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	MULTA DA EMPRESA	\N	BR 262 KM 483	104.13	83.44
4478	7750	2019-06-09	BCS9E03	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	AV. ISAAC POVOAS X RUA COMANDANTE COSTA	104.13	83.3
4479	8115	2019-06-08	BDC9E15	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	\N	\N	AV. TENENTE CEL. DUARTE X TRAV. JOAO DIAS	195.19	156.15
4480	4680	2019-06-07	AUZ5650	PARAR SOBRE FAIXA DE PEDESTRES NA MUDANÇA DE SINAL LUMINOSO (FISCALIZAÇÃO ELETRÔNICA)	RONIEL CARDOSO SANTANA	25919	CE 292 KM 19.8 JUAZEIRO DO NORTE	104.13	83.3
4481	1420	2019-06-07	ALH0523	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	JOEL LUIZ DA SILVA	14	BR 040 KM 471	156.18	124.94
4482	7455	2019-06-07	PRY3952	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	WELLINTON SECKLER FURLAN	30317	PONTE HERCILIO DEEKE	104.13	68.1
4483	7285	2019-06-06	AYH2376	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	AV. MARECHAL FLORIANO. FRENTE AO N 200. JÁ GAS	156.18	124.94
4484	1865	2019-06-06	NCU7799	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RENATO MARCELINO DE ARAUJO	\N	BR 364 KM 464+300	104.13	83.3
4485	3310	2019-06-06	ARL7069	TRANSITAR EM DESACORDO C/ AUTORIZACAO ESPECIAL SUPERDIMENS	GEFRSON ANTONIO DE SOUZA	24	PR 323 KM 30.00	156.18	124.94
4486	7270	2019-06-06	BBL8231	DEIXAR DE PARAR NO ACOSTAMENTO À DIREITA. P/ CRUZAR PISTA OU ENTRAR À ESQUERDA	REGINALDO SOARES	\N	BR 230 KM 613	156.18	124.94
4487	7295	2019-06-05	BBM8429	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 116 PVAIMGA	80	64
4488	7425	2019-06-04	BBX0953	MULTA.POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR. IMPOSTA A PESSOA JURÍDICA	\N	\N	INFRAÇÃO REFERENTE AO AUTO 00717595LE OCORRIDO NO DIA 14/04/2019	104.12	83.3
4489	3230	2019-06-04	ARA4018	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO PBT/PBTC	MULTA DA EMPRESA	\N	BR 376 KM 13.200	104.13	68.1
4490	485	2019-06-04	AIE1844	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOÃO LAURINDO MOREIRA	26522	BR 163 KM 593+400	104.13	83.3
4491	2980	2019-06-04	IPE2395	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	HEMERSON CLEIK	\N	BR 116 KM 817.580	104.13	83.3
4492	1210	2019-06-03	AKG2144	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ISAAC BRUNO MARTINS SUCUPIRA	4	BR 116 KM 909+660	104.13	83.3
4493	6505	2019-06-03	AZH9816	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 163 KM 834+300	156.18	124.94
4494	7430	2019-06-03	BBX5412	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 624+500	104.13	83.3
4495	2900	2019-06-03	AQN2073	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE WILSON BRITO TEIXEIRA	364	AV PERIMETRAL DA CIENCIA OPOSTO N 1000	104.13	83.3
4496	3810	2019-06-01	AEQ1440	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	JOSE RAIMUNDO BRITO VIEIRA	32321	AVENIDA SAO JOAO. B JARDIM FLORIDA 92	293.47	234.78
4497	6350	2019-06-01	OVC1657	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	DOUGLAS CUNHA DE SOUZA	26939	BR 116 KM 760 UF/BA	104.13	83.3
4498	1885	2019-05-31	ABW0789	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	JOSE CARLOS DA ROSA BELLO	\N	RUA URUGAUI X AV. NEREU RAMOS-FE - OESTE-LESTE - FX 01	156.18	124.94
4499	1500	2019-05-31	NCR3513	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	RICARDO RODRIGUES FERNANDES	14945	BR 364 KM 363	104.13	68.1
4500	4935	2019-05-28	AWG1781	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	GEISSON DANIEL ROCHA LIMA	159	BR 153 KM 67	156.18	102.15
4501	760	2019-05-27	JYR1428	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOÃO LAURINDO MOREIRA	26522	BR 163 KM 593+400	104.13	83.3
4502	7295	2019-05-24	BBM8429	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - PBT/PBTC E POR EIXO	MULTA DA EMPRESA	\N	SP 280 KM 074.000	104.13	83.3
4503	3810	2019-05-24	AEQ1440	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	NAILSON RODRIGUES CAETANO	\N	RUA DR. MARIO MOREIRA	127.69	102.15
4504	7450	2019-05-23	PRR6122	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO SERGIO MANGINI	1027	BR 163 KM 144	104.13	83.3
4505	7275	2019-05-21	BBM8419	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	MULTA DA EMPRESA	\N	BR 376 KM 116 PVAIMGA	80	64
4506	4370	2019-05-21	ATZ2095	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	SANDRO GABRIEL DE MORAES MOTA	28739	BR 101 KM 101	104.13	83.3
4507	3550	2019-05-21	ACZ1599	CONDUZIR O VEÍCULO COM EQUIPAMENTO OBRIGATÓRIO INEFICIENTE/INOPERANTE	FERNANDO BORGES BRITO	32920	BR 116 KM 71 UF-CE	156.18	124.94
4508	7220	2019-05-20	PKM4632	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 324  KM 522+600	104.13	83.3
4509	4915	2019-05-20	AWF5881	CONDUZIR O VEÍCULO COM O LACRE DE IDENTIFICAÇÃO VIOLADO/FALSIFICADO	DENES CESAR SILVA DOS ANJOS	\N	MT 010. EM FRENTE . KM 22. ZONA RURAL	312.28	249.82
4510	7145	2019-05-20	BBH4430	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	SIDNEI MOREIRA BONFIM	29	BR 153 KM 502	104.13	83.29
4511	4120	2019-05-17	AGZ0096	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	ANTONIO CLEYTON AMORIM SANTOS	28330	AV. PONTES VIEIRA X AV. VISCONDE DO RIO BRANCO	104.13	83.3
4512	385	2019-05-15	ACA6668	CONDUZIR O VEÍCULO COM QUALQUER UMA DAS PLACAS SEM LEGIBILIDADE E VISIBILIDADE	ALDAIR DE SOUZA ACOSTA	\N	MS 377 KM 48 AGUA CLARA/ INOCENCIA	191.54	153.23
4513	480	2019-05-15	AFX8521	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	JUSCELINO FERREIRA DA ROCHA	23154	BR 158 KM 770	80	64
4514	4830	2019-05-14	AWB7320	TRANSITAR PELA CONTRAMÃO DE DIREÇÃO EM VIA C/ SINALIZAÇÃO DE REGUL SENTIDO ÚNICO	JOSE DIVINO SOARES DE ALMEIDA	218	RUA SAO JOSE. PARAGOMINAS/PA	191.54	153.23
4515	4455	2019-05-14	AUA8522	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DENISON RIBEIRO SANTANA	27996	CE - 060. KM 201. PROXIMO AO HOSPITAL REGIONAL DO SERTÃO CENTRAL	104.13	83.3
4516	7440	2019-05-12	BBX0949	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	AVENIDA EILLY BARTH. PROX. RUA SEBALDO WUNSCH (SUL/NORTE)	104.12	68.1
4517	8000	2019-05-10	OUL4282	ESTACIONAR VEIC NO PASSEIO. FAIXA DE PEDESTRES. ETC	JHONE GONCALVES MEIRELES	24317	AV. FRANCISCO SA 2675 OPOSTO	120	96
4518	3415	2019-05-09	ARR4616	DIRIGIR VEÍCULO UTILIZANDO-SE DE TELEFONE CELULAR	\N	\N	RUA RUI BARBOSA - Nº 380 - CENTRO - PAPELARIA ARNALDO	85.13	68.1
4519	3380	2019-05-09	ARP8608	CONDUZIR O VEÍCULO EM MAU ESTADO DE CONSERVAÇÃO. COMPROMETENDO A SEGURANÇA	EDMIR ALVES SANTOS	\N	BR 364 KM 1	156.18	124.94
4520	7715	2019-05-09	BCO7189	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	Jose Antonio Juliani	31	BR 101 KM 105	104.13	83.3
4521	3415	2019-05-08	ARR4616	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	\N	\N	RUA RUI BARBOSA COM RUA  MARECHAL DEODORO	293.47	234.78
4522	7760	2019-05-06	BCS9E05	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 163 KM 491+2111	156.18	124.94
4523	445	2019-05-04	AAL4480	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	ALBERTINO VIRGULINO DOS SANTOS	\N	RUA ALBA GONZAGA 245	127.69	102.15
4524	2030	2019-05-03	NCQ0932	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	TABAJARA SOARES BOAVENTURA NETO	27346	AVENIDA JURACY MAGALAHES. SEM NUMERO	127.69	102.15
4525	2030	2019-05-03	NCQ0932	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	TABAJARA SOARES BOAVENTURA NETO	27346	AVENIDA JURACY MAGALHAES SEM NUMERO	156.18	124.94
4526	7260	2019-05-02	BBK6724	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 114	104.13	83.3
4527	6595	2019-05-02	BAU3983	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 548+789	104.13	83.3
4528	2720	2019-05-02	NDN5433	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SAMUEL VIANA NUNES	117	BR 116 KM 804+700 M UF/BA	104.13	83.3
4529	610	2019-05-01	AGM5424	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	OZIEL CRUZ DE MACEDO	\N	AV. MIGUEL  SUTIL. PROXIMO AO NUMERO 6500	191.54	153.23
4530	1410	2019-05-01	ALH2052	DEIXAR DE REDUZIR A VELOC ONDE O TRÂNSITO ESTEJA SENDO CONTROLADO PELO AGENTE	JORDANIO PAULO PEREIRA DOS SANTOS	114	PR 151 KM 264	127.69	102.15
4531	7145	2019-04-30	BBH4430	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SIDNEI MOREIRA BONFIM	29	SP 333 KM 321+500	104.13	83.3
4532	6595	2019-04-30	BAU3983	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 593+400	104.13	83.3
4533	3360	2019-04-29	ARO4464	MULTA.POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR. IMPOSTA A PESSOA JURÍDICA	SILVANO BISPO DA TRINDADE	\N	MULTA REFERENTE AO AUTO 00709811LE	205.25	164.2
4534	6550	2019-04-29	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 307+217	104.13	83.3
4535	7610	2019-04-29	PRN5016	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS GILBERTO BOCATTO	7	BR 376 KM 588.800	104.13	83.3
4536	395	2019-04-29	ACL5398	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	EVERALDO PEDRO DOS SANTOS	\N	BR 364 KM 352	104.13	83.3
4537	7830	2019-04-27	BCX4B10	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONALDO BELES DE LIMA	\N	BR 163 KM 270+700	104.13	83.3
4538	3140	2019-04-26	AQR7284	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	SIDNEI BURIAN	23	SP 270 KM 612	156.18	102.15
4539	1480	2019-04-26	NCT1813	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	VICENTE DE PAULO FERREIRA	14115	SP 294 KM 456+400	104.13	83.3
4540	7760	2019-04-25	BCS9E05	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 397	104.13	83.3
4541	7295	2019-04-25	BBM8429	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	RUDNEY ALVES MAGALHAES JUNIOR	21056	PR 082 KM 519+000	104.13	83.3
4542	7295	2019-04-25	BBM8429	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	MULTA DA EMPRESA	\N	BR 376 KM 116	104.13	83.3
4543	7460	2019-04-24	PRR7053	PARAR SOBRE FAIXA DE PEDESTRES NA MUDANÇA DE SINAL LUMINOSO (FISCALIZAÇÃO ELETRÔNICA)	MATEUS FRANCISCO RIBEIRO	21083	CE 292 KM 20.4 - JUAZEIRO DO NORTE	104.13	68.1
4544	790	2019-04-23	KCV1932	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTENOR DOS SANTOS LIMA JUNIOR	21094	BR 163 KM 593+400	104.13	83.3
4545	4935	2019-04-23	AWG1781	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEISSON DANIEL ROCHA LIMA	159	AV. PERIMETRAL DA CIENCIA EM FRENTE N 1000	104.13	68.1
4546	6370	2019-04-23	OZE9396	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	PAULO SERGIO MANGINI	1027	AV. MARECHAL DEODORO X AV. PRESIDENTE GETULIO VARGAS	234.78	153.23
4547	5590	2019-04-23	AWO3560	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	\N	\N	BR 364 KM 211 UF/MT	104.13	83.3
4548	1420	2019-04-20	ALH0523	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOEL LUIZ DA SILVA	14	BR 364 KM 464+300	104.13	83.29
4549	7760	2019-04-19	BCS9E05	MULTA.POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR. IMPOSTA A PESSOA JURÍDICA	\N	\N	DETRAN. CAMPO GRANDE-MS              MULTA REFERETE AO AUTO MS2695806	104.12	83.3
4550	7365	2019-04-18	PRH9056	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	MOISES OLIVEIRA CARNEIRO	27690	ROD. BA 099 KM 45 GUARAJUBA - PRAIA DO FORTE	104.13	83.3
4551	6000	2019-04-18	AWM5525	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 270+700 M US/MS	104.13	83.3
4552	6195	2019-04-18	NCE0H17	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 163 KM 106+800	195.23	156.18
4553	6370	2019-04-18	OZE9396	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	JOSE CARLOS ESPERANÇA.	\N	AV. MARECHAL  DEODORO X AV. PRESIDENTE GETULIO VARGAS	234.78	153.23
4554	3900	2019-04-17	AGZ0113	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	CE 060 KM 201	104.13	83.3
4555	7170	2019-04-15	BBH8857	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 163 KM 363+500	156.18	124.94
4556	8000	2019-04-15	OUL4282	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JHONE GONCALVES MEIRELES	24317	CE 060 KM 201. PROXIMO AO HOSPITAL REGIONAL DEO SERTÃO CENTRAL	104.13	0
4557	7425	2019-04-14	BBX0953	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	AB. BRASIL. PROXIMO ESCOLA MARIA L. BORGES	104.12	83.3
4558	7265	2019-04-13	BBL6637	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	MARCOS ANTONIO DA COSTA	22438	BR 070 KM 22 UF/MT	104.13	83.3
4559	7210	2019-03-27	BBJ9943	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	JOSE LAURENI DE SILVA	25957	GO 213, KM 118 IPAMERI, CALDAS NOVAS	85.13	68.1
4560	7295	2019-03-22	BBM8429	DEIXAR GUARDAR DIST SEGURANÇA LAT/FRONT ENTRE SEU VEÍCULO E DEMAIS E AO BORDO PISTA	RUDNEY ALVES MAGALHAES JUNIOR	21056	SP 075 KM 60+250	127.69	102.15
4561	7295	2019-03-22	BBM8429	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	RUDNEY ALVES MAGALHAES JUNIOR	21056	SP 075 KM 020+000 MTROS SUL ITU-SP	0	0
4562	2990	2019-03-22	AMX5243	CONDUZIR VEÍCULO C/ REGISTRADOR INSTAN INALT DE VELOCIDADE/TEMPO VICIADO/DEFEITUOSO	\N	\N	GO 060 KM 112 SAO LUIZ DOS MONTES BELOS FIRMINOPOLIS                               MULTA DE RESPONSABILIDADE DA EMPRESA	127.69	102.15
4563	7170	2019-03-19	BBH8857	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ANEL VIARIO PREF. SINCLER SAMBATTI, N, 2806 O/L FAIXA 1	104.13	83.3
4564	4080	2019-03-14	AAV7008	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	SILVANO MOREIRA BONFIM	21	BR 153 KM 61 UF-SP	104.13	83.3
4565	1490	2019-03-13	NCR3413	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIARLES ALVES ROCHA	257	AV. PERIMETRAL DA CIENCIA  EM FRENTE N 1000	104.13	68.1
4566	6290	2019-03-12	OVA1273	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	JOSE HEUDES BATISTA DE OLIVEIRA	31053	AV. JURACY MAGALAHES PROXIMO N 504 SBC FX 1	180	144
4567	3360	2019-03-11	ARO4464	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SILVANO BISPO DA TRINDADE	\N	ROD MS 164, NUM 4464	104.13	83.3
4568	3360	2019-03-11	ARO4464	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SILVANO BISPO DA TRINDADE	\N	ROD. MD 164 NUM 3258	104.13	83.3
4569	420	2019-03-07	AOH6666	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	DINEI GOMES DA SILVA	25955	AVENIDA AV. FERNANDO CORREA SA COSTA, 4777, JD DAS PALMEIRAS, CUIABA, FRENTE A TAURO MOTORS	80	64
4570	4175	2019-03-07	NEC2978	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALMIR LIMA BORGES	16359	CE 282 KM 95,0 - IGUATU/CE	104.13	83.3
4571	820	2019-03-07	AHV3957	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	GILMAR SANTOS OLIVEIRA	\N	BR 163 KM 733 UF/MT - DECRESCENTE	104.13	83.44
4572	3765	2019-03-05	ACU2228	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	\N	\N	GO 050 KM 35 CHAPADO DO CEU	85.13	68.1
4573	1120	2019-03-01	AJU1034	DIRIGIR SEM ATENÇÃO OU SEM OS CUIDADOS INDISPENSÁVEIS À SEGURANÇA	RUDNEY ALVES MAGALHAES JUNIOR	21056	SP 310 KM 424,800	53.21	42.57
4574	1120	2019-03-01	AJU1034	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	RUDNEY ALVES MAGALHAES JUNIOR	21056	SP 310 KM 424,800	120	96
4575	4710	2019-02-28	AUZ8421	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	MULTA DA EMPRESA	\N	ERS 265 KM 175,175	85.13	68.1
4576	4465	2019-02-27	AUB3552	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	LUIZ CARLOS MORAES	22435	AV. MIGUEL SUTIL. PROXIMO AO NUMERO 6500	191.54	153.23
4577	2440	2019-02-26	AOU3266	CONDUZIR O VEÍCULO SEM EQUIPAMENTO OBRIGATÓRIO	ALEX DE OLIVEIRA PEREIRA	\N	BR 364 KM 494 - UF/MT	156.18	156.18
4578	1575	2019-02-23	NCU2477	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	MULTA DA EMPRESA	\N	CE 257 KM 235	120	96
4579	2310	2019-02-23	AON5139	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONALDO BECEGATTO	\N	BR 116 KM 518+400 M	104.13	83.3
4580	4380	2019-02-22	AUA1816	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NIVALDO DE OLIVEIRA FREITAS	24290	BR 101 KM 718,290	104.13	68.1
4581	7295	2019-02-22	BBM8429	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	GILBERTO GIMENEZ ANTONUCCI	\N	AVENIDA NIPOBRASILEIRA, 55  MARIPORA-SP	104.13	83.3
4582	7295	2019-02-21	BBM8429	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILBERTO GIMENEZ ANTONUCCI	\N	PR 323 KM 3+600	85.13	68.1
4583	4470	2019-02-21	AUB3541	RETORNAR SOBRE CALCADA/CANTEIRO/JARDIM/FAIXA PEDESTRE	\N	\N	BR 163 KM 117 UF/MT	293.47	234.78
4584	7350	2019-02-18	PRR0214	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEIDIVAN DE CARVALHO CELESTINO	28	GO 403 KM 1+650/SENADOR CANEDO / GOIANIA	85.13	68.1
4585	7295	2019-02-17	BBM8429	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILBERTO GIMENEZ ANTONUCCI	\N	PR 323 KM 3+600 M  SENTIDO CRESCENTE	104.13	83.3
4586	6685	2019-02-15	BAQ4021	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	GO 330 KM 82+500 M IPAMERI / CATALÃO	120	96
4587	6365	2019-02-11	AYB3788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JEAN MEDRADO - REGIONAL	\N	BR 163 KM 306+100 M UF/MT	104.13	83.3
4588	2370	2019-02-11	APD2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	BR 364 KM 209 + UF/MT	104.13	83.3
4589	7265	2019-02-07	BBL6637	ESTACIONAR EM DESACORDO COM AS POSIÇÕES ESTABELECIDAS NO CTB	MARCOS ANTONIO DA COSTA	22438	AVENIDA CENTRAL, AO LADO, HOTEL BRISA, SETOR E	85.13	68.1
4590	7160	2019-02-05	BBH5572	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	ROBSON MUNIZ DE MORAIS	40	RODOVIA BRL 135 KM 385	957.69	766.15
4591	7200	2019-02-05	BBK1065	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	\N	\N	BR 365 KM 389,000	85.13	0
4592	4710	2019-02-04	AUZ8421	DESOBEDECER ÀS ORDENS EMANADAS DA AUTORID COMPET DE TRÂNSITO OU DE SEUS AGENTES	VALDECI ANTONIO PEREIRA	24677	RUA JOAO BATISTA DE MELL, 237 LAJEADO-RS	127.69	102.15
4593	4710	2019-02-04	AUZ8421	ESTACIONAR SOBRE FAIXA DESTINADA A PEDESTRE	VALDECI ANTONIO PEREIRA	24677	RUA JOAO BATISTA MELLO, 237	127.69	102.15
6140	2950	2017-03-01	AQP6134	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	CESAR MACHADO DE AZEVEDO	19317	RS 122 KM 46,800	195.23	156.18
4594	4665	2019-02-02	AUZ3716	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WELLINTON SECKLER FURLAN	30317	RSC 287 KM 139,860 SANTA CRUZ DO SUL -SANTA MARIA	104.13	83.3
4595	1415	2019-02-01	ALH2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO WOEZELI FELISMINO DE MELO	\N	BR 116 KM 909+ 660 M UF/BA	104.13	83.3
4596	2030	2019-01-29	NCQ0932	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	FERNANDO BORGES BRITO	32920	BR 110 KM 0 UF/BA	130.16	104.13
4597	6685	2019-01-29	BAQ4021	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 330, KM 102 URUTAI, IPAMERI	80	64
4598	1150	2019-01-28	AAW7701	ESTACIONAR AO LADO OU SOBRE CANTEIRO CENTRAL/DIVISORES DE PISTA DE ROLAMENTO	ALRIVAN SANTANA DOS SANTOS	31332	AVENIDA SUL, INDUSTRIAL	127.69	102.15
4599	1065	2019-01-28	AJP6850	ESTACIONAR AO LADO OU SOBRE CANTEIRO CENTRAL/DIVISORES DE PISTA DE ROLAMENTO	ALRIVAN SANTANA DOS SANTOS	31332	AVENIDA SUL, INDUSTRIAL	127.69	102.15
4600	4100	2019-01-25	AAV7009	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	EMILIO VALDEMIR GUION	\N	SP 316 KM 075,500	120	96
4601	7360	2019-01-24	PRI1776	EXECUTAR OPER DE CONVERSAO A DIR OU A ESQ LOCAIS PROIBIDOS	LEANDRO CARNEIRO GOMES	25939	RUA CONSELHEIRO SARAIVA	120	96
4602	2005	2019-01-23	NCQ0882	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	RICARDO APARECIDO SANTOS SILVA	30401	DETRAN/MS                                                MULTA REFERENTE AO AUTO MS2286003	156.18	124.94
4603	4855	2019-01-23	AWC9082	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	RICARDO DA SILVA MARTINS	30180	DETRAN/ MS                                              MULTA REFERENTE AO AUTO MS2286002	156.18	124.94
4604	7135	2019-01-23	BBI3135	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	LUCIANO DE JESUS LOPOES	\N	DETRAN/MS                                           MULTA REFERENTE AO AUTO MS2286001	156.18	124.94
4605	1285	2019-01-21	AKP2741	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DIEGO PEREIRA DA SILVA	425	ROD ES- 060 KM  91,4 PIUMA ES SENTIDO ANCHIETA FAIXA 1	120	96
4606	1150	2019-01-21	AAW7701	ESTACIONAR EM GUIA DE CALÇADA REBAIXADA DESTINADA À ENTRADA/SAÍDA DE VEÍCULOS	ALRIVAN SANTANA DOS SANTOS	31332	AVENIDA LODOVICO DA RIVA	85.13	68.1
4607	1490	2019-01-20	NCR3413	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	JOAO CARLOS COELHO ROSA	404	GO 164, KM 604 ARAGUAPAZ, FAINA	85.13	68.1
4608	1490	2019-01-20	NCR3413	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	JOAO CARLOS COELHO ROSA	404	GP 164 KM 604 ARAGUAPAZ, FAINA	0	0
4609	4745	2019-01-18	AVJ7601	AVANÇAR O SINAL VERMELHO DO SEMÁFORO	ROVANIO REDEL DE CAMARGO	\N	RUA BARAO DO RIO BRANCO, 927	191.54	153.23
4610	6365	2019-01-17	AYB3788	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	JEAN MEDRADO - REGIONAL	\N	AGÊNCIA DE TRANSITO / DETRAN - MS	104.12	83.3
4611	7365	2019-01-16	PRH9056	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO CONCEICAO DA SILVA	31111	BR 324 KM 523+525 M UF-BA	85.13	68.1
4612	6080	2019-01-16	OLF8027	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	CLEMILSON BARBOZA DE SOUZA	28923	RUA PEDRO PAULO CARNEIRO	50	40
4613	2365	2019-01-16	APF2054	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	ELISANGELA LAVEZZO	22140	BR 376 KM 671	130.16	104.13
4614	4140	2019-01-15	AGZ0119	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILMAR OLIVEIRA SOUZA	25063	BR 424 KM 222+600	104.13	83.3
4615	7750	2019-01-14	BCS9E03	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	SP 270 KM 439,000	85.13	68.1
4616	7570	2019-01-14	BCH2977	TRANSITAR EM DESACORDO C/ AUTORIZAÇÃO EXPEDIDA P/VEÍCULO C/ DIMENSÕES EXCEDENTES	VALDEMIR ROCHA DOS SANTOS	19	SP 413 KM 024,435	127.69	102.15
4617	6485	2019-01-13	AYZ8643	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 393 KM 137	80	64
4618	2030	2019-01-13	NCQ0932	DEIXAR O PASSAGEIRO DE USAR O CINTO SEGURANÇA	ARMANDO BEZERRA DE SOUSA JUNIOR	32415	ROD. BA 001 KM 104 ILHEUS - CANAVIEIRAS	127.69	102.15
4619	7235	2019-01-12	BBO8816	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	PR 218 MK 322+500 M SENTIDO CRESCENTE	130.16	104.13
4620	7155	2019-01-12	BBJ3916	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NELSON LUIZ MARRA	25326	BR 267 KM 474,720	104.13	83.3
4621	7135	2019-01-11	BBI3135	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	LUCIANO DE JESUS LOPOES	\N	RUA MAJOR CAPILE C/ PRESIDENTE VARGAS	234.77	187.82
4622	470	2019-01-11	AFN8349	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ALRIVAN SANTANA DOS SANTOS	31332	BR 060 KM 182 UF/GO - CRESCENTE	104.13	83.3
4623	950	2019-01-09	AIY4742	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EVANDRO PEREIRA RIBEIRO	245	SP 354 KM 061+260	104.13	83.3
4624	1285	2019-01-09	AKP2741	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	DIEGO PEREIRA DA SILVA	425	GO 330, KM 102 URUTAI, IPAMERI	80	64
4625	6275	2019-01-09	OUY9951	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	JOAO INACIO BRIOSCHI	12	BR 277 KM 130	85.13	68.1
4626	7405	2019-01-09	PRI2997	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	CLEMILSON BARBOZA DE SOUZA	28923	RODOVIA AC- 40 KM 30, TREVO DE SENADOR GUIMARD	85.13	68.1
4627	2630	2019-01-08	NDT9362	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEISSON DANIEL ROCHA LIMA	159	AV. DR. LAMARTINE P. DE AVELAR, Nº 2338, SENTIDO BR 050 - FX ESQUERDA PAQUETÁ, CATALAO GO	104.13	83.3
4628	1755	2019-01-07	NCT5109	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADELAIDO CARDOSO DE MEDEIROS	43	BR 386 KM 213,502	130.16	104.13
4629	7600	2019-01-06	PRL8256	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	SP 425 KM 227,950, JOSÉ BONIFÁCIO-SP	104.13	83.3
4630	820	2019-01-06	AHV3957	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	MG 190 KM 126,30	80	64
4631	7505	2019-01-06	PRR7103	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS SANTOS DO VALE	18208	BR 423 KM 50,900	104.13	83.3
4632	4425	2019-01-05	AUB3551	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CELIO APARECIDO SOUZA SANTOS	6634	BR 070 KM 275,500	104.13	83.3
4633	6465	2019-01-04	AYY6578	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	VERONILDO PEREIRA CUSTODIO	29204	MULTRA REFERENTE AO AUTO M505001754	14.13	11.3
4634	7485	2019-01-03	PRY4102	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	AECIO RUTSATZ	29241	BR 101 KM 220 UF/SC	130.16	104.13
4635	1415	2018-12-31	ALH2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO WOEZELI FELISMINO DE MELO	\N	BR 116 KM 909+660M  UF/BA	104.13	83.3
4636	4830	2018-12-27	AWB7320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE DIVINO SOARES DE ALMEIDA	218	BR 458 KM 126,140	130.16	104.13
4637	4665	2018-12-27	AUZ3716	PARAR VEIC NO PASSEIO OU FAIXA DE PEDESTRES, ETC	WELLINTON SECKLER FURLAN	30317	BR 101 KM 212 UF/SC	50	40
4638	1500	2018-12-27	NCR3513	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ZENO SALDANHA DOS SANTOS	12698	BR 364 KM 310	80	64
4639	7055	2018-12-24	OUJ6448	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDIMILSON JOSÉ DE SOUZA	1141	BR 407 KM 73,500	104.13	83.3
4640	4380	2018-12-23	AUA1816	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NIVALDO DE OLIVEIRA FREITAS	24290	BR 116 KM 27,100	104.13	84.9
4641	2365	2018-12-22	APF2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELISANGELA LAVEZZO	22140	RODOVIA: PR 092 KM 282+0 M SENTIDO: CRESC	130.16	104.13
4642	4380	2018-12-22	AUA1816	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NIVALDO DE OLIVEIRA FREITAS	24290	CE - 060, KM 316,3 - PIQUET CARNEIRO/CE	104.13	68.1
4643	7135	2018-12-21	BBI3135	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	LUCIANO DE JESUS LOPOES	\N	BR 267 KM 141	1467.35	766.15
4644	4050	2018-12-21	ATD4117	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	AIRTON CORREIA PINHEIRO	31981	BR 116 KM 688 UF/BA	1467.5	1467.35
4645	1405	2018-12-20	BXF4340	ESTACIONAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	PEDRO FERMOU	\N	BR 435 KM 62 UF/RO - DECRESCENTE	293.47	234.78
4646	2170	2018-12-20	NCS0563	ESTACIONAR EM DESACORDO COM A REGULAMENTAÇÃO ESPECIFICADA PELA SINALIZAÇÃO	JAILTON DO NASCIMENTO PEREIRA	32320	RUA BARAO DO COTEGIPE 20	127.69	0
4647	2990	2018-12-20	AMX5243	PARAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	JOVAIR MIGUEL VIEIRA	\N	GO 0890 KM 26 NEROPOLIS, PETROLINA DE GOIÁS	156.18	96
4648	4365	2018-12-19	ATY5536	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	MARCELO DE MELO SANTOS	\N	R. ESCRITOR RUI BARBOSA 19 PATOS- PB	156.18	96
4649	3800	2018-12-18	ABG1440	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS VIRGINIO DA SILVA	18243	ROD. PE 060 KM 0,1 CABO DE SANTO AGOSTINHO SENTIDO IPOJUCA	104.13	68.1
4650	1340	2018-12-17	AKX9332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO DE OLIVEIRA GARCIA	141465	AV. PERIMETRAL DA CIENCIA LADO OPOSTO N 1000	85.13	68.1
4651	7275	2018-12-17	BBM8419	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 116	90.45	72.36
4652	4160	2018-12-16	NEC2958	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DANIEL LUIS DOS SANTOS	19662	BR 010 KM 17,220	130.16	104.13
4653	2720	2018-12-16	NDN5433	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	SAMUEL VIANA NUNES	117	BR 163 KM 1003 UF/PA	195.23	156.18
4654	7600	2018-12-16	PRL8256	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CELIO INICENCIO	\N	BR 324 KM 522+600	130.16	104.13
4655	2890	2018-12-16	AQN2080	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIO FILHO GONCALVES DOS SANTOS	316	BR 010 KM 131,100	130.16	104.13
4656	7600	2018-12-14	PRL8256	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CELIO INICENCIO	\N	BR 135 KM 411,0 BOCAIUVA FX 1 SC	104.13	68.1
4657	3920	2018-12-14	AGZ0114	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELINALDO BORGES DA HORA SILVA	11525	CE 060 KM 59,5	104.13	83.3
4658	6685	2018-12-13	BAQ4021	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO 330 KM 101+100 M / CATALAO / IPAMERI	104.13	104.13
4659	4985	2018-12-13	AWL5717	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RICARDO FRANCISCO DE ASSIS	16	BR 364 KM 263,900	103.13	82.5
4660	1380	2018-12-12	CLH0535	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMERSON PEDRO DOS SANTOS	11896	BR 364 KM 233,960	104.13	83.3
4661	3680	2018-12-11	ANX0075	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALDIR SANTOS MARCELINO	\N	RODOVIA BR 232 KM 113,4 - ENCRUZILHADA DE SÃO JOÃO - SENTIDO CARUARU	104.13	68.1
4662	7175	2018-12-10	BBH8859	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ANEL VIARIO PREF. SINCLER SAMBATTI, N 2806 O/L FAIXA 1	104.13	68.1
4663	2365	2018-12-09	APF2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM203,450	104.13	68.1
4664	4180	2018-12-09	NEC2968	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LOURIVAL SANTOS	10011	BR 407 KM 73,500	104.13	83.3
4665	1150	2018-12-08	AAW7701	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VOLMIR MATTIONI	6829	BR 070 KM 279,760	104.13	83.3
4666	7440	2018-12-08	BBX0949	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	ROD. MS 276 KM 60+100 M  SENTIDO C/B	120	96
4667	3025	2018-12-07	NCS9802	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALEX DE OLIVEIRA PEREIRA	\N	BR 158 KM 793,500	104.13	83.3
4668	2990	2018-12-07	AMX5243	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOVAIR MIGUEL VIEIRA	\N	GO- 164 KM 584+500 M / ARAGUAPAZ / FAINA	104.13	83.3
4669	7330	2018-12-06	BBQ6208	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	FERNANDO BORGES BRITO	32920	ROD. BA 026 KM 48 TANHCU - CONTENDAS DO SINCORA	85.13	68.1
4670	4785	2018-12-06	AWA4930	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	ITAPEMA - SC	95.77	76.62
4671	7505	2018-12-05	PRR7103	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS SANTOS DO VALE	18208	BR 242 KM 389,130	104.13	83.3
4672	7035	2018-12-05	OUG3320	PARAR SOBRE FAIXA DE PEDESTRE NA MUDANCA DE SEMAFORO(ELET)	JOUMACIO SOUZA DE OLIVEIRA	14681	SENTIDO: QUIXADÁ/ QUIXERAMOBIM	104.13	64
4673	4120	2018-12-05	AGZ0096	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EVERALDO PEREIRA DA SILVA	18775	BR 116 KM 27,100	104.13	83.3
4674	3220	2018-12-04	ARA4017	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO PBT/PBTC	\N	\N	MG 223 KM 13,80	85.13	68.1
4675	2810	2018-12-03	AQN5331	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	OSEIAS MACHADO VIDAL	\N	BR 070 KM 275,500	104.13	104.13
4676	7005	2018-12-03	OUG5253	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	ED WILSON MARQUES DOS SANTOS	26455	RV CE 187 KM 153, PROXIMO 1573-3 UBAJARA / CE	156.18	102.15
4677	365	2018-12-02	AEU7528	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DINEI GOMES DA SILVA	25955	DDDDDDDBR 153 KM 330,080	85.13	68.1
4678	7590	2018-12-02	PRI9656	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 10,390	104.13	83.3
4679	4925	2018-12-02	AWF3252	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SIDNEI PINHO DOS SANTOS	\N	BR 070 KM 539,830	104.13	83.3
4680	4670	2018-12-01	AUZ3423	TAXA DE PRESERVAÇÃO AMBIENTAL	GERSON MATIAS RUTSATZ	\N	BOMBINHAS	65.5	0
4681	6515	2018-11-29	AZO8477	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	WANDERSON SOUZA SANTOS	\N	GO 020 KM 42+300	156.18	124.94
4682	2760	2018-11-29	AQL7376	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	LUCIANO DE JESUS LOPOES	\N	AV. MARCELINO PIRES, EM FRENTE A METAL FORTE	104.12	83.3
4683	6605	2018-11-29	BAE8370	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCOS GODOY DE LIMA	6248	BR 163 KM 593+400	104.13	83.3
4684	1750	2018-11-29	NCT4919	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOEL LUIZ DA SILVA	14	BR 070 KM 696,850	130.16	104.13
4685	6620	2018-11-29	NBH7656	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOÃO LAURINDO MOREIRA	26522	BR 364 KM 297+800M	85.13	704.33
4686	6300	2018-11-29	AXV3296	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 50%	\N	\N	BR 364 KM 297+800	574.61	459.69
4687	6620	2018-11-28	NBH7656	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOÃO LAURINDO MOREIRA	26522	BR 364 KM 194,200	104.13	83.3
4688	6685	2018-11-28	BAQ4021	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 330, KM 99 IPAMERI,CATALÃO	104.13	64
4689	1420	2018-11-28	ALH0523	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	ADAIRTON DE SANTANA CHALEGRE	10	BR 060 KM 95 UF/GO - DECRESCENTE	130.16	104.13
4690	7180	2018-11-27	BBH8858	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	BR 487 KM 7 UF/PR - CRESCENTE	1467.35	1173.88
4691	7425	2018-11-27	BBX0953	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 223+ UF/MT	130.16	104.13
4692	1340	2018-11-27	AKX9332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO DE OLIVEIRA GARCIA	141465	BR 020 KM 0,100	85.13	68.1
4693	2660	2018-11-27	NEA0252	ESTACIONAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	\N	\N	BR 010 KM 263 UF/MA - CRESCENTE	293.47	234.78
4694	7175	2018-11-26	BBH8859	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EGNALDO TRINDADE	\N	RODOVIA PR 482 KM  55+500 M SENTIDO CRESCENTE	130.16	104.13
4695	6550	2018-11-25	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JUNIOR CESAR DA SILVA	1271	BR 364 KM 196,300	104.13	83.3
4696	6365	2018-11-24	AYB3788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JEAN MEDRADO - REGIONAL	\N	AV. CAP. OLINTO MANCINI, PROX, NR 2720 TRES LAGOAS	104.12	83.3
4697	1010	2018-11-24	AJI4719	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAQUIM LEITE DA PENHA ANDRADE	140000444	GO-020 KM 141+410 M / PIRES DO RIO / URUTAI	104.13	83.3
4698	4865	2018-11-24	AWB8560	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CASSIO FERNANDES MARTINS	249	BR 116 KM 406,700	104.13	83.3
4699	2005	2018-11-22	NCQ0882	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	RICARDO APARECIDO SANTOS SILVA	30401	RUA DONA FRANCISCA STRANDIOTTI 1140 CENTRO	156.18	102.15
4700	4855	2018-11-22	AWC9082	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	RICARDO DA SILVA MARTINS	30180	RUA DONA FRANCISCA STRADIOTTI 1140 CENTRO	156.18	102.15
4701	7135	2018-11-22	BBI3135	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	LUCIANO DE JESUS LOPOES	\N	RUA DONA STRADIOTTI 1140 CENTRO	156.18	102.15
4702	7360	2018-11-22	PRI1776	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEANDRO CARNEIRO GOMES	25939	BR 101 KM 717,585	104.13	83.3
4703	3800	2018-11-21	ABG1440	CONDUZIR VEÍCULO C/ REGISTRADOR INSTAN INALT DE VELOCIDADE/TEMPO VICIADO/DEFEITUOSO	JOSE CARLOS VIRGINIO DA SILVA	18243	RV CE 371 KM 504, PROXIMO 1353-6 CAMPOS SALES / CE	156.18	102.15
4704	2890	2018-11-21	AQN2080	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIO FILHO GONCALVES DOS SANTOS	316	BR 153 KM 330,080	85.13	68.1
4705	7360	2018-11-20	PRI1776	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEANDRO CARNEIRO GOMES	25939	BR 101 KM 490+600M UF/BA	130.16	104.13
4706	7370	2018-11-20	PRI1687	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE DIVINO SOARES DE ALMEIDA	218	AV. SANTO AMARO, Nº 1600, SENT. CENTRO - FX DIREITA, TURISTA II	104.13	83.3
4707	7220	2018-11-19	PKM4632	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MANOEL SILVA DE ALMEIDA JUNIOR	18358	ROD. BA 526, KM 12 - SENTIDO DECRESCENTE	85.13	68.1
4708	2370	2018-11-17	APD2054	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	CELIO INICENCIO	\N	BR 376 KM - 652 UF/PR	130.16	104.13
4709	4920	2018-11-17	AWF3249	ESTACIONAR NOS ACOSTAMENTOS	YAGO NOBRES DINIZ OLIVEIRA	25598	BR 364 KM - 396- UF/MT	88.38	70.7
4710	6360	2018-11-17	OVC2581	TRANSITAR C/ VEÍC E/OU CARGA C/ DIMENSÕES SUPERIORES EST P/SINALIZAÇÃO S/AUTORIZ	GENESIS NASCIMENTO ARAUJO	24772	ROD. BA 099 KM 45 GUARAJUBA- PRAIA DO FORTE	127.69	102.15
4711	7235	2018-11-16	BBO8816	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	RODOVIA: PR 580 KM 14+0 M SENTIDO CRESCENTE	130.16	104.13
4712	7185	2018-11-14	BBJ6138	ESTACIONAR NO PASSEIO	LEIDIMAR COSTA LIMA	23058	AVENIDA ROTARY INTERNACIONAL, EM FRENTE, GAZIN	156.18	102.15
4713	2530	2018-11-14	APU6320	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	SANDRA ARAUJO SILVA	387	GO 330 KM 98 URUTAI IPAMERI	104.13	83.3
4714	2660	2018-11-13	NEA0252	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EUDES RIBEIRO	228	AC 40, 1298 EM ( EM FRENTE A ESCOLA ZULEIDE PEREIRA) SENTIDO: C/B	85.13	68.1
4715	4300	2018-11-09	CKT5776	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	ANANIAS PEREIRA	\N	AV. MARCELINO PIRES, 3930, 1. PISO, TERM. RODOVIARIO, DOURADOS, MS, CEP 79800-003	104.12	83.3
4716	3470	2018-11-09	ASN2097	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMIR GUION	25	B R364 KM 263,900	104.13	83.3
4717	6370	2018-11-08	OZE9396	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEVALDO GONÇALVES DE OLIVEIRA	\N	BR 070 KM 740,840	104.13	83.3
4718	8025	2018-11-08	OUK9922	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ABELARDO OLIVEIRA GUIMARAES FILHO	24312	BR 1010 KM 262,040	120	96
4719	7115	2018-11-08	OKN7515	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDIO SANTOS BARBOSA	31109	BR 101 KM 494+300	85.13	68.1
4720	7135	2018-11-08	BBI3135	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	LUCIANO DE JESUS LOPOES	\N	RUA MAJOR CAPILE C/ PRESIDENTE VARGAS	234.77	234.78
4721	2830	2018-11-08	AQN7413	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CAIQUE JEAN BENTO DA SILVA	30070	BR 104 KM 39,100	104.13	83.3
4722	3670	2018-11-07	ANX0071	TRANSITAR PELA CONTRAMÃO DE DIREÇÃO EM VIA C/ SINALIZAÇÃO DE REGUL SENTIDO ÚNICO	VALDICK RAMOS DA SILVA	\N	RUA JOSÉ EPAMINONDAS DEFRONTE AO NÚMERO 477. PORX AO MERCADINHO BOM DE COMPRAR	234.78	153.23
4723	1535	2018-11-06	NCU3177	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	ALCEU ROBERTO DE OLIVEIRA	\N	\N	104.12	102.15
4724	4950	2018-11-06	AWI3927	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	\N	\N	MG 170 KM 56,50	112.64	90.11
4725	4950	2018-11-06	AWI3927	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	\N	\N	MG 170- KM 56,50	85.13	68.1
4726	7295	2018-11-06	BBM8429	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	MAURO PEREIRA DOS SANTOS	959	BR  376 KM 116 VAIMGA	90.45	72.36
4727	3320	2018-11-06	ARL7A67	CONDUZIR O VEÍCULO COM EQUIPAMENTO OBRIGATÓRIO INEFICIENTE/INOPERANTE	\N	\N	RODOVIA MG 190 KM 99	127.69	0
4728	1750	2018-11-06	NCT4919	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOEL LUIZ DA SILVA	14	SP 425 KM 227+950 SENTIDO SUL, JOSE BONIFACIO SP	85.13	68.1
4729	7035	2018-11-06	OUG3320	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	JOUMACIO SOUZA DE OLIVEIRA	14681	RV CE 356 KM 31, PROXIMO 1341-2 BATURITE / CE	104.13	64
4730	7215	2018-11-05	BBK5705	ESTACIONAR LOCAL/HORÁRIO DE ESTACIONAMENTO E PARADA PROIBIDOS PELA SINALIZAÇÃO	CLEBER HILARIO PRIEBE	\N	DR. BARCELOS, 1380/ AO LADO, CANOAS-RS	156.18	102.15
4731	970	2018-11-05	AJG6204	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIR GOMES DA SILVA	19195	BR 116 KM 909+660 M UF/BA	130.16	104.13
4732	7610	2018-11-04	PRN5016	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DEVALDINO PEDRO TORRES	11	BR 251 KM 443,050	104.13	83.3
4733	7610	2018-11-04	PRN5016	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DEVALDINO PEDRO TORRES	11	BR 251 KM 442,900	104.13	83.3
4734	4010	2018-11-04	ATD8971	ESTACIONAR VEIC NO PASSEIO, FAIXA DE PEDESTRES, ETC	CLEBSON DOMINGOS MOREIRA	140000409	RUA 44 EM FRENTE A QD 173 ST NORTE FERROVIARIO	120	124.94
4735	2990	2018-11-03	AMX5243	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE DIVINO SOARES DE ALMEIDA	218	BR 365 KM 382,040	104.13	83.3
4736	6515	2018-11-03	AZO8477	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	WANDERSON SOUZA SANTOS	\N	GO 164 KM 738 SAO MIGUEL DO ARAGUAIA NOVA CRIXAS	104.13	83.3
4737	2830	2018-11-03	AQN7413	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	CAIQUE JEAN BENTO DA SILVA	30070	RV CE 356 KM 31, PROXIMO 1341-2 BATURITE/ CE	104.13	64
4738	4860	2018-11-02	AWC9135	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSINER SILVA DE CARVALHO	138	BR 153 KM 330,080	104.13	83.3
4739	2400	2018-11-01	AOT5935	MULTA ANTT	LUCAS PEREIRA JORGE	352	CHEGOU APENAS O BOLETO PARA PAGAMENTO SEM INFORMAÇÕES	197.18	157.74
4740	4550	2018-11-01	NDB3955	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALMIR LIMA BORGES	16359	BR 1160 KM 206,500	104.13	83.3
4741	6365	2018-10-31	AYB3788	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	JEAN MEDRADO - REGIONAL	\N	ROD. MS 276 - KM 60+100M - SENTIDO C/B	120	96
4742	4675	2018-10-31	AUZ5041	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CESAR MACHADO DE AZEVEDO	19317	BR 471 KM 544,975	104.13	83.3
4743	7465	2018-10-30	PRV9972	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	VOLNEI DE LARA	15512	MULTA REF AO AUTO E017314188	104.12	83.3
4744	3890	2018-10-30	AGZ0118	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	WENDSON CARNEIRO OLIVEIRA	15816	AV. PONTES VIEIRA X AV. VISCONDE DO RIO BRANCO	104.13	83.3
4745	7285	2018-10-29	AYH2376	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO- 213 KM 155+400 M/ IPAMER/ CALDAS NOVAS	104.13	83.3
4746	6610	2018-10-28	NDT5333	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ITAMAR MOHR	30112	BR 364 KM 276,000	104.13	68.1
4747	4175	2018-10-27	NEC2978	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	VALMIR LIMA BORGES	16359	BR 104 KM 39,100	120	96
4748	820	2018-10-27	AHV3957	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOEL LUIZ DA SILVA	14	BR 163 KM 269+400	85.13	68.1
4749	480	2018-10-26	AFX8521	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	JUSCELINO FERREIRA DA ROCHA	23154	AVENIDA LUDOVICO DA RIVA NETO	85.13	68.1
4750	480	2018-10-26	AFX8521	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	JUSCELINO FERREIRA DA ROCHA	23154	AVENIDA LUDOVICO DA RIVA NETO	104.13	83.3
4751	2315	2018-10-26	AON5143	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AGENOR FRANCISCO DA SILVA	17	RODOVIA: PR 092 KM 224+/00 M SENTIDO: DECRE	130.16	0
4752	7055	2018-10-26	OUJ6448	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	EDIMILSON JOSÉ DE SOUZA	1141	RV CE 364 KM 01, EM FRENTE PFF DE GRANJA 1395-1 GRANJA / CE	104.13	83.3
4753	7285	2018-10-25	AYH2376	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO-070 KM 144+700M / ITAPIRAPUA - CIDADE DE GOIÁS	104.13	83.3
4754	4665	2018-10-25	AUZ3716	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WELLINTON SECKLER FURLAN	30317	BR 470 KM 3,200	104.13	83.3
4755	4710	2018-10-25	AUZ8421	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALDECI ANTONIO PEREIRA	24677	BR 470 KM 3,200	85.13	68.1
4756	3220	2018-10-25	ARA4017	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	HUDSON CAETANO DE SANTANA JUNIOR	406	GO 164, KM 730 SAO MIGUEL DO ARAGUAIA, NOVA CRIXAS	0	0
4757	3220	2018-10-25	ARA4017	UTILIZAR LUZ ALTA E BAIXA INTERMITENTE. EXCETO QUANDO PERMITIDO PELO CTB	HUDSON CAETANO DE SANTANA JUNIOR	406	GO 164 KM 730 SÃO MIGUEL DO ARAGUAIA NOVA CRIXAS	156.18	124.94
4758	7295	2018-10-24	BBM8429	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO PBT/PBTC	\N	\N	BR 376 KM 116 PVAIMGA	90.45	72.36
4759	4230	2018-10-24	AGZ0304	CONDUZIR VEÍC COM VIDRO TOTAL/PARCIALMENTE COBERTO POR PELÍCULA. PAINÉIS/PINTURA	JOAO PAULO NASCIMENTO VERAS	144	GO 164 KM 604 ARAGUAPAZ FAINA	156.18	124.94
4760	1220	2018-10-24	AKI6988	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEITON RENATO DOS SANTOS PEREIRA	\N	BR 364 KM  348,785	104.13	68.1
4761	6670	2018-10-24	PQX0514	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	DOMINGOS CRUZ DOS SANTOS	105	RODOVIA MGC381 KM 30	104.13	83.3
4762	2315	2018-10-23	AON5143	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AGENOR FRANCISCO DA SILVA	17	ROD. SP 333 KM 318,800 LESTE MARÍLIA SP	130.16	104.13
4763	6275	2018-10-22	OUY9951	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	LEANDRO VIEIRA	3	BR 365 KM 389,000	80	64
4764	3140	2018-10-22	AQR7284	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SIDNEI BURIAN	23	SP 354 KM 048,800 SENTIDO SUL, FRANCO DA ROCHA-SP	130.16	104.13
4765	7150	2018-10-22	BBI9759	TRANSPORTAR CRIANÇA SEM OBSERVÂNCIA DAS NORMAS DE SEGURANÇA ESTABELECIDAS P/ CTB	ALDAIR DE SOUZA ACOSTA	\N	R. WEIMARGONÇALVES TORRES COM JOÃO ROSA GOES, DOURADOS-MS	191.54	153.23
4766	6275	2018-10-21	OUY9951	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	\N	\N	BR 376 KM 116 PVAIMGA	90.45	72.36
4767	2630	2018-10-20	NDT9362	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	JAMES PERTESON BATISTA DE SOUSA	140000445	BR 226 KM 364 UF/MA - CRESCENTE	195.23	156.18
4768	7245	2018-10-20	BBK7415	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	ROGERIO CONCEICAO DA SILVA	31111	ACESSO PI 140 - BR 343 SENTIDO PI 140 / BR 343	156.18	96
4769	3670	2018-10-19	ANX0071	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALDICK RAMOS DA SILVA	\N	BR 405 KM 90,100	85.13	68.1
4770	4710	2018-10-19	AUZ8421	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALDECI ANTONIO PEREIRA	24677	ROD. RSC KM 78 SENTIDO  VENANCIO AIRES - SANTA CRUZ DO SUL	104.12	68.1
4771	2300	2018-10-19	AOL2105	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	EGLESON MOUZINHO FIGUEIREDO DE SOUSA	31054	AV. DOM  LUIS X AV. SEN. VIRGILIO TAVORA	104.13	64
4772	5570	2018-10-19	NBS5371	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VILSON BARBOSA	1130	BR 163 KM 593+400M UF/MT	85.13	68.1
4773	6610	2018-10-19	NDT5333	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOELCIO WINCK	\N	BR 364 KM 276,000	85.13	68.1
4774	8000	2018-10-18	OUL4282	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	JHONE GONCALVES MEIRELES	24317	RV CE 362 KM 145 SOBRAL , PROXIMO, PFF TAPERUABA1559-8 SOBRAL/CE	80	64
4775	3750	2018-10-18	ATF1590	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NILSON DOS SANTOS	28	RODOVIA PR 151 KM 304+150 M SENTIDO DECRE	130.16	83.3
4776	6365	2018-10-18	AYB3788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JEAN MEDRADO - REGIONAL	\N	BR 158 KM 28+ UF/MS	85.13	68.1
4777	7430	2018-10-17	BBX5412	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 163 KM-324 UF/MS - DECRESCENTE	80	64
4778	7460	2018-10-17	PRR7053	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MATEUS FRANCISCO RIBEIRO	21083	BR 265 KM 90,150	104.13	68.1
4779	2740	2018-10-17	NDN5483	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SIDNEI MOREIRA BONFIM	29	BR 116 KM 909+660	85.13	68.1
4780	2890	2018-10-16	AQN2080	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	EVANDRO CAMPOS MACIEL	383	BR 153 KM 330,080	120	96
4781	3080	2018-10-16	AQP6143	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIEL BEZERRA GOMES	107	BR 010 KM 352,760	104.12	83.3
4782	5590	2018-10-16	AWO3560	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	JAIRO PEREIRA MARTINS	16032	AV. MARECHAL DUTRA NÚMERO 1422	156.18	102.15
4783	2740	2018-10-15	NDN5483	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	SIDNEI MOREIRA BONFIM	29	BR 365 KM 389,000	85.13	68.1
4784	7285	2018-10-14	AYH2376	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	MGC 0497 KM 44+800 M DECRESCENTE	104.12	83.3
4785	2360	2018-10-14	APG2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RICARDO FRANCISCO DE ASSIS	16	BR 070 KM 740,840	130.16	68.1
4786	4920	2018-10-12	AWF3249	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	YAGO NOBRES DINIZ OLIVEIRA	25598	BR 158 KM 793,500	104.13	83.3
4787	3045	2018-10-12	NCS9822	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARIO SILVA DE BRITO	299	AV. PERIMETRAL DA CIENCIA EM FRENTE N 1000	104.13	83.3
4788	4965	2018-10-11	AWD7591	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADELAIDO CARDOSO DE MEDEIROS	43	ROD PR 151 KM 260+200 M SENTIDO DECRE	130.16	83.3
4789	3955	2018-10-11	NDR8325	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 101 KM 147,170	85.13	68.1
4790	6685	2018-10-09	BAQ4021	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 213, KM 052 CALDAS NOVAS, MORRINHOS	104.13	64
4791	3220	2018-10-09	ARA4017	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	HUDSON CAETANO DE SANTANA JUNIOR	406	GO 164 MK 604 FAINA ARAGUAPAZ	104.13	83.44
4792	3220	2018-10-09	ARA4017	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	HUDSON CAETANO DE SANTANA JUNIOR	406	GO 164, KM 604, FAINA ARAGUAPAZ	0	0
4793	460	2018-10-08	AFD5132	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	LINDOMAR GALBIATI	30880	\N	130.16	104.13
4794	6540	2018-10-08	AZU5059	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RICARDO ALVES MARTINS	385	AV. ARAGUAIA X RUA 3 B ST CENTRAL SENT SUL NORTE	104.13	83.3
4795	2910	2018-10-08	NDN3455	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEITON RENATO DOS SANTOS PEREIRA	\N	BR 364 KM 196,300	85.13	68.1
4796	4020	2018-10-08	ATD5602	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	JUCELIO FERREIRA DA SILVA	24123	RUA DEMOSTENES CARDOSO PROXIMO A AVANTE ODONTOLOGIA	195.23	156.18
4797	4020	2018-10-08	ATD5602	ESTACIONAR EM DESACORDO COM A REGULAMENTAÇÃO ESPECIFICADA PELA SINALIZAÇÃO	\N	\N	RUA DEMOSTENES CARDOSO	197.18	157.74
4798	2890	2018-10-07	AQN2080	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EVANDRO CAMPOS MACIEL	383	BR 153 KM 410,050	130.16	104.13
4799	1750	2018-10-07	NCT4919	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOEL LUIZ DA SILVA	14	BR 163 KM 593+400	130.16	104.13
4800	4965	2018-10-06	AWD7591	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIR GOMES DA SILVA	19195	BR 364, KM 273,050	104.13	83.3
4801	1430	2018-10-05	ALH9513	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CELIO INICENCIO	\N	BR 365 KM 404,300	104.13	83.3
4802	1430	2018-10-05	ALH9513	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CELIO INICENCIO	\N	BR 365 KM 372,000	104.13	83.3
4803	3035	2018-10-05	NCS9792	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ROBERTO LIMA SERRA	30407	BR 104, KM 39,100	130.16	83.2
4804	4840	2018-10-04	AWB7318	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	REGINALDO ARAUJO VERNOCHI	\N	BR 364 KM 276,000	104.13	83.3
4805	6330	2018-10-04	OVB7350	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADAILTON FERREIRA SOUZA	21368	BR 116 KM 27,100	85.13	68.1
4806	4140	2018-10-03	AGZ0119	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	GILMAR OLIVEIRA SOUZA	25063	AV.PONTES VIEIRA X AV.VISCONDE DO RIO BRANCO	104.13	0
4807	5010	2018-10-01	AWE3538	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	PR 082 KM 513:+0M SENTIDO:CRESC	130.16	0
4808	1430	2018-09-30	ALH9513	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CELIO INICENCIO	\N	BR 153 KM 382,9 MONTES CLAROS	104.12	68.1
4809	1430	2018-09-30	ALH9513	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOMICIO JOAQUIM DA SILVA	13	BR 135 KM 382,9	85.13	0
4810	4830	2018-09-30	AWB7320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE DIVINO SOARES DE ALMEIDA	218	BR 153 KM 243,900	130.16	104.13
6141	4575	2017-03-01	NCW8226	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	\N	\N	BR 343 KM 364	293.47	234.78
4811	2760	2018-09-29	AQL7376	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUCIANO DE JESUS LOPOES	\N	AV. MARCELINO PIRES, EM FRENTE A METAL FORTE	104.12	83.3
4812	6685	2018-09-28	BAQ4021	DIRIGIR SEM ATENÇÃO OU SEM OS CUIDADOS INDISPENSÁVEIS À SEGURANÇA	\N	\N	GO 330 KM 126	70.7	0
4813	7465	2018-09-28	PRV9972	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 50%	VOLNEI DE LARA	15512	BR 158 KM 505,950	574.61	459.69
4814	3600	2018-09-28	ASB6672	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	SP 333 KM 348	85.13	0
4815	1120	2018-09-27	AJU1034	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	BR 373 KM 479,060	130.16	104.13
4816	7425	2018-09-26	BBX0953	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 106+800 M UF/MS	104.13	83.3
4817	6610	2018-09-26	NDT5333	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ITAMAR MOHR	30112	BR 364 KM 276,000	104.13	83.3
4818	7265	2018-09-26	BBL6637	ESTACIONAR NAS ESQUINAS E A MENOS DE 5M DO ALINHAMENTO DA VIA TRANSVERSAL	ALEX DE OLIVEIRA PEREIRA	\N	AV. JAMANXIM NOVO PROGRESSO/PA	104.13	83.3
4819	4755	2018-09-25	MAX8035	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 276,000	130.16	104.13
4820	6245	2018-09-24	OVB8860	PARAR SOBRE FAIXA DE PEDESTRES NA MUDANÇA DE SINAL LUMINOSO (FISCALIZAÇÃO ELETRÔNICA)	GILVAN DE ANDRADE OLIVEIRA	1697	BANCARIO SERGIO GUERRA X R. ROSALIMA DOS SANTOS (B/C)	130.16	68.1
4821	6245	2018-09-24	OVB8860	PARAR SOBRE FAIXA DE PEDESTRES NA MUDANÇA DE SINAL LUMINOSO (FISCALIZAÇÃO ELETRÔNICA)	GILVAN DE ANDRADE OLIVEIRA	1697	BANCARIO SERGIO GUERRA X R. FRANCISCO TIMOTEO DEE SOUZA (C/B)	130.16	68.1
4822	3850	2018-09-24	ATA1130	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE MACIEL DE ARAUJO	141458	BR 116 KM 267+ UF/MG	130.16	104.13
4823	3330	2018-09-24	ARL7076	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO SERGIO DOS SANTOS	26	BR 470 KM 35,000	130.16	104.13
4824	2700	2018-09-24	NEA0182	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AUGUSTO CESAR OLIVEIRA LOPES	\N	BR 364 KM 341,600	85.13	68.1
4825	4250	2018-09-24	AGZ0199	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	JOAO CARLOS COELHO ROSA	404	PRAÇA BELMIRO TEIXEIRA - PROX. BANCA DO BRIEL	234.78	187.76
4826	3660	2018-09-22	ANX0076	CONDUZIR O VEÍCULO COM EQUIPAMENTO OU ACESSÓRIO PROIBIDO	EDGLEY GESUINO DE SOUZA	\N	PE 120,EM FRENTE PEDREIRA DO AGRESTE	156.19	0
4827	2260	2018-09-21	AOL4465	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	PAULO RENATO VENCAO SILVEIRA	382	GO 070 , KM 113 GOIAS, ITABERAI	156.18	96
4828	3810	2018-09-21	AEQ1440	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE UBIRATAN ALVES DE FREITAS	\N	BR 101 KM 504,940	130.16	104.13
4829	7380	2018-09-21	PRI1677	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 135 KM 388+000	104.12	83.3
4830	7495	2018-09-21	PRR7143	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELCIMAR CANDIDO DA SILVA	253	PARAUAPEBAS/PA	104.13	83.3
4831	7035	2018-09-20	OUG3320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MANOEL EVANGELISTA GONCALVES DE JESUS	18776	CE 356, KM 23,4 - BUTURITE/CE	104.13	83.3
4832	6080	2018-09-20	OLF8027	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EVANGEVALDO RIOS LIMA	27740	BR 116 KM 828+220 UF/BA	104.12	83.3
4833	4300	2018-09-20	CKT5776	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	ANANIAS PEREIRA	\N	RUA PRESIDENTE VARGAS 447, DOURADOS-MS	104.12	64
4834	3540	2018-09-20	ATA1599	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALEXSANDRO RODRIGUES SEGURADO	343	GO 010 KM 52+100M	104.13	83.3
4835	4875	2018-09-19	AWC1491	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ARMANDO BEZERRA DE SOUSA JUNIOR	32415	BR 262 KM 380,700	85.13	0
4836	365	2018-09-19	AEU7528	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROSIMAR BATISTA DA SILVA	20687	BR 153 KM 330,080	85.13	83.3
4837	6685	2018-09-19	BAQ4021	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 330 KM 94	104.13	0
4838	4695	2018-09-19	AUZ8418	DEIXAR DE ADENTRAR ÀS ÁREAS DESTINADAS À PESAGEM DE VEÍCULOS	SIDNEI PINHO DOS SANTOS	\N	ROD. MT 130 TRECHO: POXOREU SENTIDO N KM 108	156.18	124.94
4839	485	2018-09-18	AIE1844	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 593+400 M UF/MT	104.13	83.3
4840	6620	2018-09-18	NBH7656	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 593+400 M UF/MT	104.13	83.3
4841	7370	2018-09-17	PRI1687	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONILDO DOURADO DE AZEVEDO	84	BR 153 M 690,120	130.16	104.13
4842	1545	2018-09-17	NCT1755	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	CARLOS GILBERTO BOCATTO	7	BR 376 KM 672	85.13	0
4843	7585	2018-09-17	BCI6779	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 262 KM 6,250	85.13	0
4844	7465	2018-09-17	PRV9972	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VOLNEI DE LARA	15512	BR 282 KM 44,000	130.16	104.13
4845	8005	2018-09-16	OUK8525	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALEX COQUEIRO	29332	BR 101 KM 348,140	85.13	68.1
4846	6610	2018-09-14	NDT5333	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CICERO DA SILVA	\N	BR 364 KM 58,900	104.13	83.3
4847	7465	2018-09-13	PRV9972	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VOLNEI DE LARA	15512	AVENIDA FERNANDO FERRARI  X RUA PEDRO BAMBINI  ESPUMOSO RS	104.13	83.3
4848	3800	2018-09-13	ABG1440	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS VIRGINIO DA SILVA	18243	BR 230 KM 158,600	85.13	0
4849	4240	2018-09-13	AGZ0288	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TABAJARA SOARES BOAVENTURA NETO	27346	BR 110 KM 58+UF/BA	85.13	0
4850	4445	2018-09-12	AUA8619	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	ROVANIO REDEL DE CAMARGO	\N	ACESSO GRASEL,190/POSTO	80	0
4851	4445	2018-09-12	AUA8619	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	ROVANIO REDEL DE CAMARGO	\N	ACESSO GRASEL, 1090/ OPOSTO, SANTA CRUZ DO SUL-RS	104.12	83.3
4852	4370	2018-09-12	ATZ2095	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO BATISTA DOS SANTOS DE JESUS	1732	BR 116 KM 563+UF/BA	85.13	0
4853	6550	2018-09-12	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	PR 317 KM 127+120	130.16	0
4854	1475	2018-09-12	NCT1713	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	JOAO MARCIO DA SILVA	21808	AV. BEIRA RIO -CUIABA- MT	80	0
4855	3680	2018-09-11	ANX0075	EXECUTAR OPER DE CONVERSAO A DIR OU A ESQ LOCAIS PROIBIDOS	VALDIR SANTOS MARCELINO	\N	RUA AURORA ,SOB AO SEMAFARO N.243 SENTIDO CIDADE SUBURBIO	156.19	0
4856	2620	2018-09-11	NDT8132	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NIVALDO ALVES CHALEGRA	\N	BR 070 KM 66,115	104.13	83.3
4857	1535	2018-09-11	NCU3177	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	ALCEU ROBERTO DE OLIVEIRA	\N	RUA PRESIDENTE VARGAS ESQ.C/AV.MARCELINO PIRES	104.12	0
4858	7105	2018-09-10	JSY3677	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	LOURIVAL SANTOS	10011	AV. BARAO DE STUDART X RUA PADRE VALDEVINO	104.13	0
4859	7295	2018-09-10	BBM8429	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	MAURO PEREIRA DOS SANTOS	959	SP 280 K  080	85.13	0
4860	3975	2018-09-09	AGZ0799	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMILIO VALDEMIR GUION	\N	VIA EXPRESSA N15860 SENTIDO CONTAGEM-BETIM	104.12	0
4861	3705	2018-09-08	NBG7891	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDIMAR SANTOS DE SOUZA	\N	BR 153 KM 760,980	104.13	83.3
4862	8040	2018-09-08	OUM0586	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DAVI SERGIO DE SOUZA BRITO	16321	CE-060 , KM 435,60-VARZEA ALEGRE /CE	104.13	68.1
4863	915	2018-09-07	AIO9751	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR365 KM 427,300	85.13	0
4864	915	2018-09-07	AIO9751	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDOMIRO CARLOS PEREIRA	\N	BR 365 KM 427,300	85.13	0
4865	2800	2018-09-07	IMQ0445	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCISCO DA CONCEIÇÃO	\N	BR 070 KM 503+360	85.13	0
4866	3975	2018-09-06	AGZ0799	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMILIO VALDEMIR GUION	\N	BR 423 KM 95,100	85.13	0
4867	7195	2018-09-05	BBK1069	ESTACIONAR VEIC NO PASSEIO, FAIXA DE PEDESTRES, ETC	GERSON MATIAS RUTSATZ	\N	RUA PIRATUBA ,1055 LADO OPOSTO	156.18	0
4868	7275	2018-09-05	BBM8419	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 116 PVAIMGA	95.77	64
4869	4010	2018-09-05	ATD8971	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	ANTONIO FILHO GONCALVES DOS SANTOS	316	GO 213 KM 116 IPAMERI CALDAS NOVAS	104.13	83.3
4870	4030	2018-09-05	ATD2714	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	VLADEMIR VIEIRA BEZERRA	31420	RUA VISCOND EDE SAO LOURENCO	156.16	0
4871	3975	2018-09-04	AGZ0799	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMILIO VALDEMIR GUION	\N	BR 116 KM 415,900	85.13	0
4872	6385	2018-09-04	AYE0619	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 470 KM 219+300M	85.13	0
4873	3820	2018-09-04	ABJ1290	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	BR 116 KM 600 IRAJUBA	85.13	0
4874	4645	2018-09-03	AUK9987	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JONAS DO NASCIMENTO	27084	BR 070 KM 740,840	85.13	0
4875	6475	2018-09-03	AYZ5647	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	VINICIUS LIMA BEZERRA	139	AV. CONEG B CAMPOS X RUA GERMANO ARANHA, BARCARENA-PA	234.78	187.8
4876	1520	2018-09-02	NCU3577	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 365 KM 382,040	85.13	0
4877	1520	2018-09-02	NCU3577	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO WOEZELI FELISMINO DE MELO	\N	BR 365 KM 433,500	85.13	0
4878	2540	2018-08-31	APZ1625	CONDUZIR O VEIC C/ O LACRE, ETC OU OUTRO ELEM VIOLADO	\N	\N	ROD.BA001 KM 14 001 - TREVO BR 367	180	0
4879	6685	2018-08-31	BAQ4021	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO 330 KM 99+510	104.13	0
4880	2370	2018-08-30	APD2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CELIO INICENCIO	\N	BR 116 KM 909+980	85.13	0
4881	1565	2018-08-30	AJA1857	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MIGUEL AGUIAR RIBEIRO	4	BR116 KM 909+660	85.13	0
4882	3220	2018-08-30	ARA4017	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDILSON FERREIRA LIMA	414	BR 040 KM 2+ UF/DF	85.13	0
4883	7215	2018-08-29	BBK5705	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	CLEBER HILARIO PRIEBE	\N	BR376 KM 652 UF/PR- DECRESCENTE	85.13	0
4884	7575	2018-08-28	BCH2976	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMIR GUION	25	BR 116 KM 832+500	85.13	0
4885	4635	2018-08-28	LWH5409	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEONARDO DA SILVA ARAUJO	141474	BR020 KM 0,100	85.13	0
4886	4100	2018-08-28	AAV7009	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	EMILIO VALDEMIR GUION	\N	PR 092 KM 323+800 M	120	96
4887	4830	2018-08-26	AWB7320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE DIVINO SOARES DE ALMEIDA	218	BR 153 KM 410,050	85.13	0
4888	3600	2018-08-26	ASB6672	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ANEL VIARIO PREF. SINCLER SAMBATTI, N 2806 O/L FAIXA 1	130.16	104.13
4889	2640	2018-08-25	NDU0332	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	JOAO CARLOS COELHO ROSA	404	GO 164 KM 650 NOVA CRIXAS ARAGUAPAZ	104.13	83.3
4890	2640	2018-08-25	NDU0332	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	WILLIAM PEREIRA DA SILVA	283	GO 164 KM 650	85.13	0
4891	7095	2018-08-23	OUL7376	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	DAMARIO DE SOUZA OLIVEIRA	21778	RUA EXUPERIO P.CANGUCU	130.16	0
4892	2650	2018-08-22	NEA0262	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOEL JANUARIO DA SILVA	30249	BR135KM91,710	104.13	83.3
4893	1545	2018-08-21	NCT1755	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	CARLOS GILBERTO BOCATTO	7	BR 277 KM136	85.13	68.1
4894	4705	2018-08-20	AVA3677	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DENES CESAR SILVA DOS ANJOS	\N	BR 010 KM 15,652	85.13	0
4895	3025	2018-08-18	NCS9802	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TIAGO LUIZ DE ASSIS	\N	BR 153 KM 410,050	85.13	0
4896	7585	2018-08-17	BCI6779	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 192+900M	85.13	0
4897	4040	2018-08-17	ATD2721	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDIMAR BARBOSA DE BRITO	13364	BR 101 KM 123,620	85.13	0
4898	7135	2018-08-16	BBI3135	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	APARECIDO DONIZETE DA FONSECA	1346	DETRAN/MS	104.13	83.3
4899	4630	2018-08-16	LWH5539	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	RAFAEL DE SOUZA SILVA	31421	ROD. BA 120 KM 129 CANSANCAO - QUEIMADAS	104.12	68.1
4900	4685	2018-08-16	AUZ5722	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	FELIPE MACIEL KUMM	30238	MULTA REFERENTE A INFRAÇÃO E016992923                                                  RSC-453 KM 110,330/ FARROUPILHA - BENTO GONÇALVES	104.12	83.3
4901	4050	2018-08-15	ATD4117	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	AIRTON CORREIA PINHEIRO	31981	ROD. BA 986 KM 9 BA 001 - ARRAIAL D AJUDA - BA 986	104.13	68.1
4902	7325	2018-08-14	BBQ6205	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TABAJARA SOARES BOAVENTURA NETO	27346	 BR 116 KM 222,400	85.13	0
4903	4460	2018-08-14	AUB3542	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO ROBERTO FERREIRA	18979	BR 070 KM 277,720	85.13	0
4904	3060	2018-08-14	IMF1438	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUCAS PEREIRA REZENDE TIRLONI	\N	BR 060 KM 508,600	85.13	0
4905	1565	2018-08-12	AJA1857	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CELIO INICENCIO	\N	BR 364 KM 276,000	85.13	68.1
4906	3400	2018-08-11	ARS6310	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JAMES PERTESON BATISTA DE SOUSA	140000445	BR153 KM 243,900	85.13	0
4907	1420	2018-08-11	ALH0523	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIO MARCOS CABRAL	21982	PR 487 KM 249+800 M SENTIDO DECRE	130.16	104.13
4908	1420	2018-08-11	ALH0523	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIO MARCOS CABRAL	21982	RODOVIA PR 487 KM 249+800 M SENTIDO: DECRE	130.16	8.1
4909	4460	2018-08-11	AUB3542	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO ROBERTO FERREIRA	18979	BR 364 KM 401,565	85.13	68.1
4910	2540	2018-08-10	APZ1625	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROBERTO LIMA SERRA	30407	PI 116, N° 3100 SENTIDO CAJUEIRO DA PRAIA / PARNAIBA	104.13	68.1
4911	4965	2018-08-10	AWD7591	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	ADELAIDO CARDOSO DE MEDEIROS	43	MG 190- KM 126,30	156.18	0
4912	4630	2018-08-09	LWH5539	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAFAEL DE SOUZA SILVA	31421	BR423 KM 95,100	85.13	68.1
4913	1535	2018-08-08	NCU3177	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	ALCEU ROBERTO DE OLIVEIRA	\N	PREFEITURA MUNICIPAL DE PONTA PORA                                                       MULTA REFERENTE AO AUTO: MS2511433	234.77	187.82
4914	6355	2018-08-08	OVC2786	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	MOISES OLIVEIRA CARNEIRO	27690	SENTIDO AV OTAVIO MANGABEIRA	120	0
4915	2620	2018-08-08	NDT8132	EXECUTAR OPERAÇÃO DE CONVERSÃO À ESQUERDA EM LOCAL PROIBIDO PELA SINALIZAÇÃO	DENES CESAR SILVA DOS ANJOS	\N	AVENIDA SÃO PAULO, SEMAFORO, CENTRO	156.18	0
4916	4020	2018-08-08	ATD5602	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	JUCELIO FERREIRA DA SILVA	24123	RUA ESCRITOR RUI BARBOSA VIZI PATOS-PB	199.09	0
4917	3670	2018-08-08	ANX0071	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALDICK RAMOS DA SILVA	\N	CE - 040, KM 133,3 - ARACATI/CE	104.13	68.1
4918	4365	2018-08-08	ATY5536	ESTACIONAR VEIC NO PASSEIO, FAIXA DE PEDESTRES, ETC	MARCELO DE MELO SANTOS	\N	RUA GOVERNADOR  ERELADO GUERREIROS  LEITE LADO OPOSTO AO POSTO JOALINA	156.18	96
4919	6685	2018-08-07	BAQ4021	DEIXAR DE INDICAR MEDIANTE GESTO REALIZACAO DE MANOBRA	\N	\N	GO330KM102IPAMERI-URUTAI	156.18	96
4920	4830	2018-08-07	AWB7320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE DIVINO SOARES DE ALMEIDA	218	BR 010 KM 273,120	85.13	68.1
4921	3830	2018-08-06	ARC1290	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSELITO FERREIRA DA SILVA	\N	BR230 KM 334,900	85.13	0
4922	2370	2018-08-05	APD2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CELIO INICENCIO	\N	BR 163 KM 363+500M UF/MS	85.13	0
4923	5010	2018-08-05	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO -020 KM 1+850 M GOIANNIA / BELA VISTA	85.13	68.1
4924	4740	2018-08-04	IAO6299	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON PIRES DA SILVA	30187	PI 368, KM 15+690 SENTIDO NORTE SUL	104.13	68.1
4925	6365	2018-08-02	AYB3788	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	JEAN MEDRADO - REGIONAL	\N	DETRAN/MS, REFEITURA MUNICIPAL DE PARANAIBA.	156.18	124.94
4926	2830	2018-08-02	AQN7413	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CAIQUE JEAN BENTO DA SILVA	30070	BR415 KM 17+800 M UF/BA	85.13	0
4927	7280	2018-08-02	BBN2931	DESOBEDECER ÀS ORDENS EMANADAS DA AUTORID COMPET DE TRÂNSITO OU DE SEUS AGENTES	IRENIO DOMINGOS DA SILVA	22514	GO 164, KM 830 DIVISA GO/TO, SAO MIGUEL DO ARAGUAIA	156.18	102.15
4928	7280	2018-08-02	BBN2931	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	IRENIO DOMINGOS DA SILVA	22514	GO 164, KM 830 DIVISA GO/TO, SAO MIGUEL DO ARAGUAIA	104.13	64
4929	4740	2018-08-02	IAO6299	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON PIRES DA SILVA	30187	BR 222 KM 295+800 M	85.13	0
4930	755	2018-08-01	AHC7729	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 163 K-542 UF/MT DECRECESNTE	80	0
4931	7350	2018-08-01	PRR0214	UTILIZAR-SE DE VEIC P/ DEMONSTRAR MANOBRA PERIGOSA	ANDERSON MENESES SANT ANA	323	RODOVIA IMG 721 KM 10	156.18	124.94
4932	7480	2018-07-31	PRY4022	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	FABRICIO ALVES DE CAMARGOS	23544	AVENIDA RIO GRANDE DO SUL	156.18	0
4933	4795	2018-07-31	AWA4718	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 480+600M UF/MS	85.13	0
4934	4375	2018-07-31	ATZ8141	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ROMILSON ALMEIDA DA SILVA	25603	BR 116 KM 36 + UF/CE	0	0
4935	5010	2018-07-26	AWE3538	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	SPA079/613	957.69	0
4936	3830	2018-07-26	ARC1290	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSELITO FERREIRA DA SILVA	\N	CE-060,KM 52,8 - REDENÇÃO/CE	104.13	0
4937	5010	2018-07-26	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR163 KM 278+200M UF/MS	85.13	0
4938	3800	2018-07-24	ABG1440	PARAR SOBRE FAIXA DE PEDESTRE NA MUDANCA DE SEMAFORO(ELET)	JOSE CARLOS VIRGINIO DA SILVA	18243	AV.PREFEITO SEVERINO BEZERRA CABRAL X RUA RAIMUNDO NONATO DE ARAUJO - C/B	132.73	0
4939	3800	2018-07-24	ABG1440	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS VIRGINIO DA SILVA	18243	AV.MANOEL TAVARES (PROXIMO AO ATACADÃO)	130.16	68.1
4940	7055	2018-07-24	OUJ6448	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDIMILSON JOSÉ DE SOUZA	1141	BR 405 KM 17,230	104.13	0
4941	4930	2018-07-23	AWF5880	EM MOVIMENTO. DEIXAR DE MANTER A PLACA TRASEIRA ILUMINADA À NOITE	VICENTE DE PAULO FERREIRA	14115	GO 164, KM 738 SAO MIGUEL DO ARAGUAIA, NOVA CRIXAS	104.13	68.1
4942	7260	2018-07-23	BBK6724	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR163 KM 278+300M UF/MS	85.13	0
4943	4430	2018-07-23	AUA8616	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	JOSIMAR LOPES DE ASSUNÇÃO	29845	AV ORCALINO SANTOS QD 11 CENTRO	104.13	0
4944	4430	2018-07-23	AUA8616	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	JOSIMAR LOPES DE ASSUNÇÃO	29845	AV. ORCALINO SANTOS, QD. 11, CENTRO	80	64
4945	6550	2018-07-23	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	RODOVIA MS376, PERIMETRAL NORTE,	104.12	104.13
4946	7235	2018-07-20	BBO8816	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	RODOVIA PR 580 KM 14+0 M SENTIDO: CRESC	130.16	104.13
4947	7195	2018-07-20	BBK1069	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	\N	\N	\N	104.12	83.3
4948	7425	2018-07-20	BBX0953	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	\N	\N	\N	234.77	187.82
4949	7425	2018-07-19	BBX0953	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	BR487KM-7UF/PR-CRESCENTE	957.69	766.15
4950	3735	2018-07-18	ATN1590	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROBSON MUNIZ DE MORAIS	40	BR 376 KM 308+700 M UF/PR	85.13	68.1
4951	3735	2018-07-18	ATN1590	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROBSON MUNIZ DE MORAIS	40	BR 376 KM 308+700M UF/PR	130.16	104.13
4952	3520	2018-07-18	AKY9654	DEIXAR DE REDUZIR A VELOC ONDE O TRÂNSITO ESTEJA SENDO CONTROLADO PELO AGENTE	\N	\N	GO 530, KM 27 ARUANA, ARAGUAPAZ	156.18	102.15
4953	7275	2018-07-18	BBM8419	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 116 PVAIMGA	106.41	85.13
4954	3290	2018-07-17	ARI6189	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JAILTON DE JESUS	1570	BR 242 KM 778+700 M UF/BA	85.13	68.1
4955	2440	2018-07-16	AOU3266	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - PBT/PBTC E POR EIXO	\N	\N	ROD. MT. 130 TRECHO POXOREU SENT	209.56	167.65
4956	2690	2018-07-13	NEA0212	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	HUDSON CAETANO DE SANTANA JUNIOR	406	GO 330, KM 146 PIRES DO RIO, URUTAI	80	64
4957	8040	2018-07-13	OUM0586	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	ROBERTO LIMA SERRA	30407	RUA EXUPERIO PINHEIRO CANGUCU	120	0
4958	4960	2018-07-13	AWD3204	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	GESIEL ROSA FERNANDES	\N	BR 364 KM 33 UF/RO - CRESCENTE	1467.35	1173.88
4959	5010	2018-07-13	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	SP 320 KM 628	85.13	0
4960	5010	2018-07-13	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	SP 320 KM 628,400	85.13	68.1
4961	4120	2018-07-10	AGZ0096	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 131	90.45	0
4962	4240	2018-07-06	AGZ0288	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	ED WILSON MARQUES DOS SANTOS	26455	RODOVIA MCG 497 KM 8	1173.87	766.15
4963	3600	2018-07-05	ASB6672	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	SP 333 KM 449,000 FLORINEA	80	64
4964	4130	2018-07-05	AGZ0159	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 131 PVAIMGA	532.01	0
4965	4240	2018-07-05	AGZ0288	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	ED WILSON MARQUES DOS SANTOS	26455	BR 376 KM 131 PVAIMGA	80	0
4966	3670	2018-07-04	ANX0071	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	\N	\N	AV. PRUDENTE DE MORAIS EM FRENTE AO N 4275 LAGOA NOVA	132.73	0
4967	2540	2018-07-03	APZ1625	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	EDSON BRANDAO SANTOS	30067	ROB BA 263 KM 85 VITORIA DA CONQUISTA- ITAMBE	132.75	68.1
4968	6250	2018-07-02	OVB5284	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	NILTON PINHO BRASILEIRO	17510	RUA LIMOEIRO ,255,CENTRO INDUSTRIAL LI	104.13	0
4969	7275	2018-07-02	BBM8419	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	ROBSON HERMES DA SILVA	22392	SP 280 KM 080,000 LESTE ITU	132.73	68.1
4970	8020	2018-07-01	OUK0433	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILMAR OLIVEIRA SOUZA	25063	BR 135 KM 309,100	85.13	68.1
4971	7275	2018-07-01	BBM8419	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 131 PVAIMGA	80	0
4972	7130	2018-06-30	BBJ3905	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JHONE GONCALVES MEIRELES	24317	BR 101 KM 507,690	104.13	68.1
4973	1405	2018-06-29	BXF4340	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	\N	\N	GO 164 KM 738 NOVA CRIXAS, SAO MIGUEL DO ARAGUAIA	156.18	96
4974	1405	2018-06-29	BXF4340	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO  164, KM 738, NOVA CRIXAS, SAO MIGUEL DO ARAGUAIA	104.13	64
4975	6080	2018-06-28	OLF8027	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	JULIO CESAR LIMA DOS SANTOS	31184	TOD BA 987 KM 4 BA 001 - BA 987 TRANCOSO	104.12	68.1
4976	1180	2018-06-28	AJC8792	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TIAGO DIAS BORGES DA SILVA	129	GO - 080 KM 51+700M/ PETROLINA/ NEROPOLIS	104.13	68.1
4977	8000	2018-06-28	OUL4282	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSEMAR SILVA DE LIMA	21082	BR 116 KM 36+ UF/CE	130.16	104.13
4978	6265	2018-06-28	OVB5978	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	ANTONIO CARLOS SANTOS SOUZA	17509	R. LEONCIO WANDERLEY 36 CEN PATOS PR	50	40
4979	4685	2018-06-28	AUZ5722	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALCEU LUIS SIEGERT	19320	RSC 453 KM 110,330/ FARROUPILHA	104.12	0
4980	4100	2018-06-28	AAV7009	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	EMILIO VALDEMIR GUION	\N	BR 116 KM 909+ 660 UF/BA	195.23	156.18
4981	6385	2018-06-27	AYE0619	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	\N	\N	\N	127.69	0
4982	7415	2018-06-26	BBW7840	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMIR GUION	25	BR 116 KM 909+980 UF/BA	130.16	104.13
4983	1285	2018-06-26	AKP2741	CONDUZIR O VEÍCULO COM CARACTERÍSTICA ALTERADA	DIEGO PEREIRA DA SILVA	425	RODOVIA PA 150 KM 123 TAILANDIA/PA	156.18	124.94
4984	7170	2018-06-26	BBH8857	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	PR 486 KM 522+100 M	130.16	64
4985	7170	2018-06-26	BBH8857	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	PR 486 KM 522+100M	130.16	104.13
4986	7275	2018-06-24	BBM8419	MULTA ANTT	\N	\N	BR 376 KM 131 PVAIMGA	90.45	756
4987	2400	2018-06-23	AOT5935	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUCAS PEREIRA JORGE	352	AV.DR.LAMARTINE P DE AVELAR N°2139 SENTIDO CENTRO	104.13	0
4988	5010	2018-06-23	AWE3538	DIRIGIR VEÍCULO UTILIZANDO-SE DE TELEFONE CELULAR	\N	\N	AVENIDA LUDOCICO DA RIVA NETO, ALTA FLORESTA	104.13	68.1
4989	420	2018-06-23	AOH6666	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LINDOMAR GALBIATI	30880	BR 070 KM 275,500	85.13	68.1
4990	4130	2018-06-22	AGZ0159	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	EVERTON MELCHIOR	21099	BR 158 KM 505,950	156.18	96
4991	7510	2018-06-22	PRR7163	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON PIRES DA SILVA	30187	BR 316 KM 57,300	85.13	68.1
4992	3080	2018-06-22	AQP6143	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	\N	\N	CIRETRAN DE IPAMERI	156.18	96
4993	4370	2018-06-22	ATZ2095	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	Maristela Santos Oliveira Souza	31110	BR 104 KM 39,100	104.13	68.1
4994	2300	2018-06-21	AOL2105	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	CE 293 KM 16, PROXIMO 1467-2 MILAGRES / CE	1173.88	766.15
4995	420	2018-06-21	AOH6666	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	LINDOMAR GALBIATI	30880	GO 164, KM 738 SAO MIGUEL DO ARAGUAIA, NOVA CRIXAS	104.13	68.1
4996	7285	2018-06-21	AYH2376	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	GO-213 KM 155+400M/ IPAMERI / CALDAS NOVAS	156.18	96
4997	4965	2018-06-21	AWD7591	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADELAIDO CARDOSO DE MEDEIROS	43	LMG 653 KM 12+000 MONTES CLAROS	104.12	68.1
4998	4435	2018-06-21	AUA8610	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 174 KM 99,500	104.13	68.1
4999	7135	2018-06-21	BBI3135	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	APARECIDO DONIZETE DA FONSECA	1346	RODOVIA MS 376, PERIMETRAL NORTE	104.13	68.1
5000	6660	2018-06-21	BAO7497	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADELAIDO CARDOSO DE MEDEIROS	43	BR 251 KM 470,000	104.13	68.1
5001	7520	2018-06-20	PRU1383	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BE 050 KM 68,680	85.13	68.1
5002	7275	2018-06-20	BBM8419	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	ROBSON HERMES DA SILVA	22392	BR 376 KM 131 PVAIMGA	80	8.87
5003	2690	2018-06-20	NEA0212	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	HUDSON CAETANO DE SANTANA JUNIOR	406	GO  330, KM 49 IPAMERI ,CATALAO	120	96
5004	4100	2018-06-20	AAV7009	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMILIO VALDEMIR GUION	\N	BR 116 KM 909+660 M UF/BA	130.16	104.13
5005	1535	2018-06-20	NCU3177	AVANÇAR O SINAL VERMELHO DO SEMÁFORO	ALCEU ROBERTO DE OLIVEIRA	\N	AVENIDA BRASIL ESQUINA COM A RUA SETE DE SETEMBRO, PONTA PORA	234.77	153.23
5006	7285	2018-06-19	AYH2376	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 162+ UF/GO	130.16	68.1
5007	1415	2018-06-19	ALH2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIR GOMES DA SILVA	19195	BR 116 KM 909+660  UF/BA	85.13	68.1
5008	4940	2018-06-19	AWG9462	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	CLEBER DE SOUZA RODRIGUES	\N	TO 080 KM 12,5	156.18	102.15
5009	2260	2018-06-18	AOL4465	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	HUDSON CAETANO DE SANTANA JUNIOR	406	BR 040 KM 11+900M UF/GO	130.16	104.13
5010	2385	2018-06-17	AOQ5819	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALEXANDRE DE CARVALHO SEREN	21539	BR 364 KM 263,900	104.13	68.1
5011	3900	2018-06-16	AGZ0113	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 423 KM 16 UF/AL - CRESCENTE	130.16	104.13
5012	6540	2018-06-16	AZU5059	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RICARDO ALVES MARTINS	385	RROD  080 ES SENTIDO SAO DOMINGOS DO NORTE FAIXA 1	85.13	0
5013	4950	2018-06-16	AWI3927	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR 153 KM 410,050	104.13	68.1
5014	1875	2018-06-16	NCU7899	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JORDANIO PAULO PEREIRA DOS SANTOS	114	BR 324 KM 526+450 M  UF/BA	130.16	104.13
5015	2290	2018-06-15	AOL4468	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	Eurivelton Santos	31892	BR 101 KM 494+300 M UF/BA	85.13	68.1
5016	6360	2018-06-15	OVC2581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALEX COQUEIRO	29332	BR 230 KM 84,360	85.13	68.1
5017	7055	2018-06-15	OUJ6448	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	EDIMILSON JOSÉ DE SOUZA	1141	RODOVIA CE 178 KM 99, PROXIMO PFF DE SOBRAL 1559-8 SOBRAL-CE	104.13	64
5018	1545	2018-06-14	NCT1755	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	CARLOS GILBERTO BOCATTO	7	SP 280 KM 023 BARUERI SP	85.13	68.1
5019	7305	2018-06-14	BBN4853	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	GENIVALDO FRANCISCO FELIX DA SILVA	29339	GO 164, KM 738 SAO MIGUEL DO ARAGUAIA, NOVA CRIXAS	104.13	68.1
5020	7305	2018-06-14	BBN4853	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	GENIVALDO FRANCISCO FELIX DA SILVA	29339	GO 164, KM 738 SAO MIGUEL DO ARAGUAIA, NOVA CRIXAS	104.13	64
5021	2830	2018-06-14	AQN7413	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NIVALDO DE OLIVEIRA FREITAS	24290	BR 116 KM 600+ UF/BA	130.16	104.13
5022	7440	2018-06-13	BBX0949	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	\N	\N	DETRAN/MS	156.18	124.94
5023	4455	2018-06-13	AUA8522	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE UBIRATAN ALVES DE FREITAS	\N	BR 101 KM 348,140	104.13	68.1
5024	1340	2018-06-13	AKX9332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 330,080	104.13	83.3
5025	1340	2018-06-13	AKX9332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIARLES ALVES ROCHA	257	BR 153 KM 330,080	104.13	83.3
5026	2310	2018-06-13	AON5139	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALEXANDRE DE CARVALHO SEREN	21539	PR 151 KM 283+200 M SENTIDO: CRESC	130.16	68.1
5027	6365	2018-06-13	AYB3788	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	JEAN MEDRADO - REGIONAL	\N	PRAÇA DA REPUBLICA AREA AZUL VAGA 125	156.18	156.18
5028	985	2018-06-13	AJI2983	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AGUINALDO ROCHA GUIMARAES	121	BR 116 KM 660M UF/BA	130.16	104.13
5029	7370	2018-06-13	PRI1687	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONILDO DOURADO DE AZEVEDO	84	GO-080KM51+700M/PETROLINA  DE GOIAS/GO	104.13	83.3
5030	2205	2018-06-13	ANV3726	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	.BR 070 KM 275,500	104.13	83.3
5031	2640	2018-06-12	NDU0332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILLIAM PEREIRA DA SILVA	283	GO- 020 KM 141+410M / URUTAI / PIRES DO RIO	101.13	68.1
5032	3310	2018-06-12	ARL7069	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEFRSON ANTONIO DE SOUZA	24	BR 116 KM 909+660 M UF/BA	130.16	104.13
5033	6580	2018-06-11	AZY5793	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FLAVIANO OLIVEIRA DA SILVA	140000416	BR 365 KM 433,500	104.13	83.3
5034	6005	2018-06-10	AWN1825	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 364 KM 144,300	156.18	96
5035	7295	2018-06-10	BBM8429	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR376KM131PVAIMGA	95.77	76.62
5036	4860	2018-06-10	AWC9135	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	WILSINER SILVA DE CARVALHO	138	GO 330 KM 102 IPAMERI  URUTAI	104.13	83.3
5037	4860	2018-06-10	AWC9135	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	WILSINER SILVA DE CARVALHO	138	GO 330, KM 102 IPAMERI,URUTAI	80	64
5038	6455	2018-06-09	AYR9572	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEISSON DANIEL ROCHA LIMA	159	BR 153 KM243,900	104.13	83.3
5039	2440	2018-06-09	AOU3266	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	CELIO INICENCIO	\N	BR 277 KM 315 UF/PR - CRESCENTE	80	0
5040	7520	2018-06-09	PRU1383	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	SANDOVAL DE JESUS FERNANDES	116	BR 153 KM 330,080	156.18	124.94
5041	1885	2018-06-08	ABW0789	ESTACIONAR SOBRE CICLOVIA OU CICLOFAIXA	JOSE CARLOS DA ROSA BELLO	\N	RUA FREDERICO JENSEN, LADO OPOSTO N. 1161	127.69	102.15
5042	6465	2018-06-08	AYY6578	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	VERONILDO PEREIRA CUSTODIO	29204	AV.DUQUE DE CAXIAS X RUA BARAO DO RIO BRANCO	104.13	0
5043	4375	2018-06-08	ATZ8141	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROMILSON ALMEIDA DA SILVA	25603	BR 101 KM 260+500 M UF/BA	85.13	68.1
5044	4670	2018-06-08	AUZ3423	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	IVAN RUTSATZ	16911	AV. PREF. WALDEMAR GRUBBA/ R. ALBERTO SANTOS DUMONT - SENTIDO N/S	293.47	153.23
5045	4870	2018-06-07	AWC1282	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON FERREIRA DA PENHA	26539	BR 364 KM 708,105	85.13	68.1
5046	1010	2018-06-07	AJI4719	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANDERSON MENESES SANT ANA	323	BR 153 KM 194,615	104.13	68.1
5047	3830	2018-06-07	ARC1290	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	JOSELITO FERREIRA DA SILVA	\N	RV CE 293 KM 58, PRXIMO  1337-4 BARBALHA / CE	1173.88	766.15
5048	7360	2018-06-07	PRI1776	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NOEL PINHEIRO DA CRUZ	26242	BR 101 KM 348,140	104.13	68.1
5049	7370	2018-06-06	PRI1687	DIRIGIR SEM ATENÇÃO OU SEM OS CUIDADOS INDISPENSÁVEIS À SEGURANÇA	RONILDO DOURADO DE AZEVEDO	84	GO 010 KM 180 LUZIANIA VIANAPOLIS	70.7	56.56
5050	465	2018-06-06	AEM3056	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 153 KM 793,500	156.18	124.94
5051	7275	2018-06-06	BBM8419	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	ROBSON HERMES DA SILVA	22392	BR 376KM 131	90.45	64
5052	4675	2018-06-06	AUZ5041	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CESAR MACHADO DE AZEVEDO	19317	BR 101 KM 116+500 M UF/SC	130.16	104.13
5053	4375	2018-06-05	ATZ8141	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROMILSON ALMEIDA DA SILVA	25603	KM 106 + 800M BR 482 GUACUI -ES	85.13	68.1
5054	4070	2018-06-05	ATD8970	CONDUZIR O VEIC EM MAU ESTADO DE CONSERVACAO	RAFAEL PINHEIRO ARAUJO	434	GO 174 KM 388 IPORAAMORINOPOIS	156.18	124.94
5055	1070	2018-06-04	AJS5294	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	FABRICIO SOUSA SILVA	140000447	GO 330 KM 103 URUTAI IPAMERI	80	83.3
5056	3680	2018-06-02	ANX0075	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	VALDIR SANTOS MARCELINO	\N	SABINIANO MAIA, OPOSTO AO 639	134.05	64
5057	4705	2018-06-02	AVA3677	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	YAGO NOBRES DINIZ OLIVEIRA	25598	BR 364 KM 13,780	85.13	68.1
5058	7355	2018-06-01	PRI2455	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DANIEL TEODORO DE SOUZA	407	AV RICARDO PARANHOS, N 634 SENTIDO CENTRO - FX DIREITA PIO GOMES	104.13	83.3
5059	4250	2018-05-31	AGZ0199	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO COUTINHO AGUIAR	384	GO 080 KM 51+200 M / NEROPOLIS / PETROLINA	104.13	83.3
5060	7185	2018-05-31	BBJ6138	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEIDIMAR COSTA LIMA	23058	BR 364 KM 13+ 780 M ALTO ARAGUAIA MT	104.13	68.1
5061	7015	2018-05-31	OUG7788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO SERGIO DA SILVA SANTOS	23185	BR 135 KM 309,100	85.13	68.1
5062	7305	2018-05-31	BBN4853	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GENIVALDO FRANCISCO FELIX DA SILVA	29339	JACIARA/ MT KM 276 BR 364	104.13	68.1
5063	3800	2018-05-31	ABG1440	CONDUZIR O VEÍCULO COM QUALQUER UMA DAS PLACAS SEM LEGIBILIDADE E VISIBILIDADE	JOSE CARLOS VIRGINIO DA SILVA	18243	KM 17 CE292 CRATO- CE	234.78	153.23
5064	3540	2018-05-31	ATA1599	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALEXSANDRO RODRIGUES SEGURADO	343	BR 153 KM 137,340	104.13	83.3
5065	4685	2018-05-30	AUZ5722	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALCEU LUIS SIEGERT	19320	BR 386 KM 435 + 023 M	104.13	68.1
5066	460	2018-05-29	AFD5132	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	118 BR 364 RIO BRANCO -AC	85.13	1
5067	460	2018-05-29	AFD5132	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO CESAR DE PAULA HOLANDA	\N	BR 364 KM 118,000	104.13	83.3
5068	7425	2018-05-25	BBX0953	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	\N	\N	R. BARAO DO RIO BRANCO N. 682        CAMPO GRANDE - MS	234.77	234.78
5069	7170	2018-05-24	BBH8857	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	FREDOLIN WOLF OP 3121 SENT CB	130.16	68.1
5070	6505	2018-05-24	AZH9816	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 20% ATÉ 50%	\N	\N	BR 369 KM 156 + 600 M LONDRINA-PR	127.69	102.15
5071	6550	2018-05-22	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 363+500 M  UF/MS	85.13	68.1
5072	6550	2018-05-22	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 269+400 M UF/MS	85.13	68.1
5073	3670	2018-05-22	ANX0071	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	KM 90+ 200 M BR 424	104.13	68.1
5074	4190	2018-05-22	AGZ0299	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	VOLNEI DE LARA	15512	RUA OIAPOC x AVENIDA SALGADO FILHO (LESTE/OESTE)	293.47	153.23
5075	4365	2018-05-21	ATY5536	ESTACIONAR AFASTADO DA GUIA DA CALÇADA (MEIO-FIO) A MAIS DE 1M	MARCELO DE MELO SANTOS	\N	RUA ADILON ALMEIDA BARRETO, PRÓXIMO A FARMACIA DIAS	202.18	102.15
5076	3760	2018-05-21	AOO6619	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	SEBASTIAO SILVERIO DA SILVA	390	KM 38 MG 240 POMPEU -MG	156.18	102.15
5077	6365	2018-05-20	AYB3788	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	\N	\N	GO  330, KM 041 CATALÃO IPAMERI	104.13	68.1
5078	4705	2018-05-19	AVA3677	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	YAGO NOBRES DINIZ OLIVEIRA	25598	BR 158 KM 793,500	85.13	68.1
5079	2860	2018-05-18	AQN2074	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSEVALDO SILVA CERQUEIRA	30234	BR423 KM 95,100	104.13	68.1
5080	7385	2018-05-18	PRI3017	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	REINAILDO ALVES RODRIGUES	30406	BR 116 KM 805+ UF/BA	130.16	104.13
5081	985	2018-05-18	AJI2983	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EVANDRO PEREIRA RIBEIRO	245	BR 146,KM 89,500	104.13	68.1
5082	7105	2018-05-18	JSY3677	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	LOURIVAL SANTOS	10011	KM 153 CE187	153.18	102.15
5083	2630	2018-05-18	NDT9362	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LINDOMAR CARLOS BEZERRA GOMES	317	BR 153 KM 597,650	85.13	68.1
5084	6250	2018-05-18	OVB5284	DEIXAR DE PARAR NO ACOSTAMENTO À DIREITA. P/ CRUZAR PISTA OU ENTRAR À ESQUERDA	NILTON PINHO BRASILEIRO	17510	BR 230 KM 215 UF/PB	195.23	156.18
5085	7105	2018-05-18	JSY3677	CONDUZIR O VEÍCULO EM MAU ESTADO DE CONSERVAÇÃO. COMPROMETENDO A SEGURANÇA	LOURIVAL SANTOS	10011	CE187 KM 135 TIANGUA -  CE	156.18	102.15
5086	7105	2018-05-18	JSY3677	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	LOURIVAL SANTOS	10011	KM 135 CE187	104.13	68.1
5087	7195	2018-05-17	BBK1069	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GERSON MATIAS RUTSATZ	\N	ROD. ERS 130 KM 74 SENTIDO LAJEADO - ARROIO DO MEIO	104.12	68.1
5088	7335	2018-05-16	PRR0194	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE JADSON BARBOSA DA SILVA	395	BR 020 KM 0,100	104.13	83.3
5089	2510	2018-05-16	APW1934	ESTACIONAR EM LOCAL/HORÁRIO PROIBIDO ESPECIFICAMENTE PELA SINALIZAÇÃO	ISAAC BRUNO MARTINS SUCUPIRA	4	RUA 1  DE MAIO C/AV DOM PEDRO II ABAETETUBA/PA	104.13	0
5090	2520	2018-05-16	APX8950	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	APARECIDO FRAZAO DE MORAIS	276	GO 070 KM 113 GOIAS/GO	104.13	83.3
5091	7285	2018-05-15	AYH2376	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 123+ 670 M	104.13	68.1
5092	7440	2018-05-15	BBX0949	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO - 080 KM 51+200 M NEROPOLIS / PETROLINA	104.13	68.1
5093	7440	2018-05-15	BBX0949	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	\N	\N	BR 153 KM 496 UF/GO - DECRESCENTE	293.47	234.78
5094	7185	2018-05-15	BBJ6138	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEIDIMAR COSTA LIMA	23058	KM 206 + 520M BR 364	104.13	68.1
5095	6615	2018-05-14	NDE7804	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	SANDRA ARAUJO SILVA	387	GO 184 KM 61 SERRANOPOLIS ITUMIRIM	104.13	83.3
5096	4865	2018-05-12	AWB8560	TRANS COM VEÍCULO DESAC C/ESPECIFICAÇÃO/FALTA DE INSCR/SIMBOLOGIA NECESSÁRIA IDENTIF	GENILSON DE SOUSA COELHO	140	GO 330, KM 041 CATALAO, IPAMERI	156.18	102.15
5097	7425	2018-05-12	BBX0953	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 202+ 880 M	104.13	68.1
5098	1340	2018-05-12	AKX9332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIARLES ALVES ROCHA	257	AV. DR. LAMARTINE P DE AVELAR, N 2338, SENTIDO BR 050 - FX. ESQUEDA, PAQUETÁ, CATALÃO, GO	156.18	68.1
5099	3280	2018-05-12	ARI6190	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	RAIMUNDO SENA PINTO	28366	RVCE 293 KM 16, EM FRENTE SO , PFF MILAGRES	104.13	68.1
5100	6325	2018-05-11	OVB4961	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	LUIZ FERNANDO RIBEIRO OLIVEIRA	28680	ROD.BA001 KM 14 BA 001-TREVO BR 367	85.13	83.3
5101	6325	2018-05-11	OVB4961	TRANSPOR BLOQUEIO VIÁRIO POLICIAL	LUIZ FERNANDO RIBEIRO OLIVEIRA	28680	ROD. BA BR001- TREVO BR 367	191.54	190.22
5102	1140	2018-05-11	AJW1071	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SERGIO RAEL FERREIRA	252	BR 153 KM 330,080	104.13	83.3
5103	6455	2018-05-11	AYR9572	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCINALDO FIRMINO DA SILVA	111	BR 316 KM 19,670	104.13	68.1
5104	2690	2018-05-10	NEA0212	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	HUDSON CAETANO DE SANTANA JUNIOR	406	BR 365 KM 404,300	104.13	68.1
5105	2830	2018-05-10	AQN7413	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	JOSE NIVALDO DE OLIVEIRA FREITAS	24290	BA 263 KM 85 VIT. CONQUIESTA- ITAMBE	195.26	102.15
5106	8050	2018-05-10	OUM7977	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSYELL ALVES DE JESUS	179	BR 153 KM 330,080	85.13	68.1
5107	4635	2018-05-09	LWH5409	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	PAULO CESAR CARVALHO DA SILVA	440	RUA BENEDITO VALADARES	156.18	102.15
5108	3650	2018-05-05	ANX0074	CONDUZIR VEIC C/ DESCARGA LIVRE OU SILENCIADOR C/ DEFEITO	\N	\N	CE 257 KM 235	104.13	96
5109	4250	2018-05-05	AGZ0199	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO COUTINHO AGUIAR	384	BR 010 KM 129,300	104.13	83.3
5110	6360	2018-05-05	OVC2581	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	ALEX COQUEIRO	29332	ROD BA 120 KM 129 CANSANCAO-QEUIMADAS	130.16	68.1
5111	2180	2018-05-05	NCS0543	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOEL ROBERTO DA SILVA	28688	BR 070 KM 665,150	104.13	83.3
5112	3340	2018-05-04	ARO4462	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIO FILHO GONCALVES DOS SANTOS	316	BR 153 KM 143,900	104.13	83.21
5113	3400	2018-05-04	ARS6310	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	MARIO SILVA DE BRITO	299	BR 316 KM 47,300	156.18	96
5114	4020	2018-05-03	ATD5602	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JUCELIO FERREIRA DA SILVA	24123	CE-030, KM 513,7 JUAZEIRO DO NORTE	134.05	0
5115	1380	2018-05-02	CLH0535	ESTACIONAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	EMERSON PEDRO DOS SANTOS	11896	BR 364 KM - 602 UF-RO - CRESCENTE	293.47	234.78
5116	3660	2018-05-02	ANX0076	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	JOSE WOGAN RIBEIRO SANTOS	\N	AV. EPITACIO PESSOA 242 PATOS-PB	202.18	102.15
5117	7195	2018-05-01	BBK1069	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 470 KM 53+ UF/SC	130.16	104.13
5118	7255	2018-05-01	BBL2645	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	JULIO CICERO RIBEIRO DA SILVA	9384	ROD BA 262 KM 321 VITORIA DA CONQUISTA	195.23	102.15
5119	7255	2018-05-01	BBL2645	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	JULIO CICERO RIBEIRO DA SILVA	9384	ROD. BA 262 KM 321 VITÓRIA DA CONQUISTA	130.16	68.1
5120	4080	2018-04-30	AAV7008	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROBSON MUNIZ DE MORAIS	40	BR 116 KM 909+660	130.16	104.13
5121	4230	2018-04-30	AGZ0304	CONDUZIR O VEÍCULO COM EQUIPAMENTO OU ACESSÓRIO PROIBIDO	\N	\N	MG 223 KM 13	127.69	102.15
5122	2920	2018-04-30	NDX1844	TRANSITAR EM DESACORDO C/ AUTORIZACAO ESPECIAL SUPERDIMENS	\N	\N	TO 373 KM 327	156.18	124.94
5123	7005	2018-04-30	OUG5253	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	JOSYELL ALVES DE JESUS	179	BR 262 KM 449,500	156.18	96
5124	6290	2018-04-29	OVA1273	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE HEUDES BATISTA DE OLIVEIRA	31053	BR 324 KM 523+528	130.16	104.13
5125	4890	2018-04-28	AWC1488	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELISANGELA LAVEZZO	22140	BR 365 KM 382,040	104.13	68.1
5126	2890	2018-04-28	AQN2080	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	REGIMAR JESUS DE SOUSA	345	GO 020 KM  412	104.13	68.1
5127	940	2018-04-28	AIY2379	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RICARDO FRANCISCO DE ASSIS	16	BR 364 KM 206+520	104.13	68.1
5128	3110	2018-04-27	AQP6139	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILSON MARTINS BORGES	\N	BR 364 KM 263,900	104.13	68.1
5129	2500	2018-04-27	APS5203	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO DANILO EVANGELISTA	372	BR 230 KM 93,000	104.13	83.3
5130	6245	2018-04-27	OVB8860	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMERSON THIAGO RIBEIRO SANTANA	23181	BR 235 KM 42,500	85.13	68.1
5131	7325	2018-04-27	BBQ6205	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	ANDRE GERMANO DORETTO	27184	R CAOITAO ROCHA 1653 DEFRONTE	195.23	40
5132	6370	2018-04-27	OZE9396	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEVALDO GONÇALVES DE OLIVEIRA	\N	BR 163 KM 292+300M UF/MS	85.13	68.1
5133	3370	2018-04-27	ARP8607	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 070 KM 277,720	104.13	68.1
5134	4100	2018-04-27	AAV7009	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	EMILIO VALDEMIR GUION	\N	SP 348 KM 117,000	120	96
5135	1255	2018-04-26	AKN6845	TRANS COM VEÍCULO DESAC C/ESPECIFICAÇÃO/FALTA DE INSCR/SIMBOLOGIA NECESSÁRIA IDENTIF	CARLOS APARECIDO DOS SANTOS	27695	BR 163 KM 323 UF/MS - CRESCENTE	156.19	127.35
5136	3470	2018-04-25	ASN2097	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMIR GUION	25	BR 251 KM 443,050	104.13	68.1
5137	2000	2018-04-24	AAK8762	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	VLADEMIR VIEIRA BEZERRA	31420	BR 116 KM 909+660 M UF/BA	120	96
5138	5580	2018-04-24	AWN1830	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELISANGELA LAVEZZO	22140	PR 151 KM 304+450M SENTIDO: DECRE	130.16	68.1
5139	5580	2018-04-24	AWN1830	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELISANGELA LAVEZZO	22140	RODOVIA PR 151 KM 304+150 SENTIDO: DECRE	130.16	104.13
5140	1520	2018-04-24	NCU3577	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIR GOMES DA SILVA	19195	BR 267 KM 124,880	104.13	83.3
5141	7270	2018-04-23	BBL8231	DIRIGIR VEIC C/ CNH OU PERMISSAO P/DIRIGIR CATEG DIFERENTE	\N	\N	BR364 KM 132 UF/AC	180	144
5142	7330	2018-04-23	BBQ6208	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	CELIO INICENCIO	\N	PR 576 KM 086+000	130.16	104.13
5143	7330	2018-04-23	BBQ6208	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	CELIO INICENCIO	\N	PR 576 KM 086+000M	130.16	104.13
5144	7440	2018-04-23	BBX0949	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 397+ UF/MS	130.16	104.13
5145	6550	2018-04-23	AZU9715	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	PR 323 KM 184+500M	130.16	104.13
5146	8050	2018-04-22	OUM7977	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSYELL ALVES DE JESUS	179	BR 153 KM 330,080	85.13	68.1
5147	7415	2018-04-22	BBW7840	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 131 PVAIMGA	95.77	76.62
5148	3820	2018-04-21	ABJ1290	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUIZ FERNANDO RIBEIRO OLIVEIRA	28680	BR 101 KM 208,890	104.13	68.1
5149	6260	2018-04-21	OVB7540	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	CARLOS ANDRE SIMOES DOS SANTOS	25064	AVENIDA ALMERINDO REHEM, EM FRENTE A MIROMOVEIS	195.23	156.18
5150	2510	2018-04-20	APW1934	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR 226 KM 39,830	104.13	83.3
5151	820	2018-04-19	AHV3957	MULTA ANTT	\N	\N	BR 163 KM 323	550	440
5152	820	2018-04-19	AHV3957	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 163 KIM 323	236.56	189.25
5153	2740	2018-04-19	NDN5483	MULTA ANTT	\N	\N	RODOVIA BR 163 , KM 323	550	440
5154	2740	2018-04-19	NDN5483	MULTA ANTT	\N	\N	RODOVIA BR 163, KM 323, RIO BRILHANTE-MS	550	440
5155	2740	2018-04-19	NDN5483	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 163  KM 323	80	108.38
5156	4175	2018-04-19	NEC2978	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 230 KM 159,750	156.18	124.94
5157	4375	2018-04-19	ATZ8141	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ROMILSON ALMEIDA DA SILVA	25603	BR 116 KM 524+200 M UF-BA	120	96
5158	3900	2018-04-19	AGZ0113	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 405 KM 150,660	234.78	144
5159	7440	2018-04-18	BBX0949	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	MS-382 KM 42	156.18	96
5160	4010	2018-04-18	ATD8971	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RICARDO ALVES MARTINS	385	BR 020, KM 0,100	104.13	83.3
5161	7350	2018-04-18	PRR0214	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEIDIVAN DE CARVALHO CELESTINO	28	KM 51 + 200 M GO 080 PETROLINA DE GOIAS /GO	104.13	83.3
5162	6385	2018-04-17	AYE0619	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ROD. RSC287 KM 111 SENTIDO VALE DO SOL - VERA CRUZ	104.12	68.1
5163	5010	2018-04-16	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 10,390	104.13	83.3
5164	4385	2018-04-16	NCW1467	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 364 KM 196,300	104.13	83.3
5165	1285	2018-04-16	AKP2741	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIO FILHO GONCALVES DOS SANTOS	316	BR 153 KM 330,080	104.13	68.1
5166	7430	2018-04-16	BBX5412	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 060 KM 508,600	104.13	83.3
5167	3900	2018-04-16	AGZ0113	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 230 KM 159,750	104.13	68.1
5168	1130	2018-04-16	AJU4771	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	TIAGO BATISTA DA SILVA	137	AV. CONEGO JOAO LIMA, N° 644	156.18	124.94
5169	1285	2018-04-16	AKP2741	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIO FILHO GONCALVES DOS SANTOS	316	BR 153 KM 522,000	104.13	68.1
5170	5020	2018-04-16	AWE5894	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO 330 KM 49/IPAMERI CATALAO	104.13	68.1
5171	1340	2018-04-15	AKX9332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIARLES ALVES ROCHA	257	BR 226 KM 39,830	104.13	68.1
5172	1180	2018-04-14	AJC8792	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AGUINALDO ROCHA GUIMARAES	121	PR 151 KM 260.300M SENTIDO : DECRE	130.16	0
5173	7205	2018-04-14	BBJ8583	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE ALVES FERREIRA	\N	BR 476 KM 233,300	104.13	68.1
5174	3045	2018-04-14	NCS9822	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEISSON DANIEL ROCHA LIMA	159	BR 020 KM 0,100	104.13	83.3
5175	3350	2018-04-13	ARO4467	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	REGINALDO PEREIRA LEITE	275	GO 244 KM 67 NOVO PLANALTO PORANGATU	104.13	83.3
5176	5020	2018-04-13	AWE5894	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO 020 KM 103/ GOIANIA - S CRUZ	104.3	68.1
5177	5020	2018-04-13	AWE5894	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	GO 020 KM 81+300 M/B VISTA - CRISTIANOPOLIS	156.18	96
5178	5020	2018-04-13	AWE5894	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	GO -070 KM 30/ INHUMAS / GOIANIRA	156.18	96
5179	705	2018-04-13	AGX7129	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELIEL BALDUINO DE OLIVEIRA	3972	BR 316 KM 19,670	104.13	68.1
5180	925	2018-04-12	CGR3558	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DEVALDINO PEDRO TORRES	11	BR 381 KM 920+800 UF/MG	130.16	104.13
5181	3700	2018-04-12	NBG7931	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCISCO VIEIRA NETO	\N	BR 364 KM 196,300	104.13	83.3
5182	4420	2018-04-12	NCV1428	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDUARDO JOSE EUZEBIO	\N	BR 153 KM 410,050	104.13	83.3
5183	3270	2018-04-11	NCO9565	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSON DA SILVA	11039	BR 364 KM 707,660	85.13	68.1
5184	7235	2018-04-10	BBO8816	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	\N	\N	AV. PARANA OPOSTO 5636	195.23	156.18
5185	7235	2018-04-10	BBO8816	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	\N	\N	AV. PARANA OPOSTO 5636	195.23	156.21
5186	2690	2018-04-10	NEA0212	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	HUDSON CAETANO DE SANTANA JUNIOR	406	BR 135 KM 309,100	104.13	68.1
5187	2205	2018-04-10	ANV3726	DIRIGIR VEÍCULO UTILIZANDO-SE DE TELEFONE CELULAR	\N	\N	AV  09 MAIO, PROXIMO, RODOVIARIA	133.44	106.75
5188	6290	2018-04-09	OVA1273	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE HEUDES BATISTA DE OLIVEIRA	31053	BR 324 KM 527+200M UF/BA	130.16	104.13
5189	7100	2018-04-09	BAU8280	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 158 KM 283,200	156.18	96
5190	1855	2018-04-09	NDF5580	CONDUZIR O VEIC EM MAU ESTADO DE CONSERVACAO	JOELCIO WINCK	\N	GO 164, KM 828 DIVISA GO/TO, SAO MIGUEL DO ARAGUAIA	156.18	96
5191	3340	2018-04-08	ARO4462	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR 010 KM 129,300	104.13	83.3
5192	1340	2018-04-06	AKX9332	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	DIARLES ALVES ROCHA	257	BR 153 KM - 339 UF/TO- DECRESCENTE	80	64
5193	3035	2018-04-06	NCS9792	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ARMANDO BEZERRA DE SOUSA JUNIOR	32415	BR 222 KM 30,500	104.13	68.1
5194	7185	2018-04-06	BBJ6138	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEIDIMAR COSTA LIMA	23058	BR 364 KM 276,000	104.13	0
5195	7525	2018-04-06	BBC8666	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	AV. SETE DE SATEMBRO. 1557	130.16	104.1
5196	5005	2018-04-02	AWE1751	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 070 KM 381,640	85.13	68.1
5197	7270	2018-04-02	BBL8231	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADAO DANIEL MOTA DE ARAUJO	\N	BR 153 KM 243,900	104.13	0
5198	7525	2018-04-02	BBC8666	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ROD. OSVALDO REIS 3558	130.16	104.13
5199	7525	2018-04-02	BBC8666	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ROD. OSVALDO REIS. 3558	85.13	68.1
5200	3310	2018-04-01	ARL7069	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEFRSON ANTONIO DE SOUZA	24	BR 116 KM 909+660 M	130.16	104.13
5201	7165	2018-03-31	BBI9838	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUCIANO DE JESUS LOPOES	\N	BR 262 KM 371,460	104.13	68.1
5202	5580	2018-03-31	AWN1830	MULTA ANTT	ELISANGELA LAVEZZO	22140	BR 116 KM 909+660M UF/BA	0	0
5203	4100	2018-03-31	AAV7009	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMILIO VALDEMIR GUION	\N	BR 163 KM 314,700	104.13	68.1
5204	7365	2018-03-31	PRH9056	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEANDRO CARNEIRO GOMES	25939	BR 324 KM 536+550 M	85.13	68.1
5205	3890	2018-03-30	AGZ0118	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	RAFAEL LIMA DE OLIVEIRA	24316	RV CE 178 KM 99, EM FRENTE, AO  PFF DE SOBRAl 1559-8 SOBRAL/CE	104.13	64
5206	7165	2018-03-30	BBI9838	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUCIANO DE JESUS LOPOES	\N	BR 262 KM 371,460	85.13	68.1
5207	4120	2018-03-30	AGZ0096	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALDECI ANTONIO PEREIRA	24677	BR 386 KM 435,023	85.13	68.1
5208	1835	2018-03-30	NDB7020	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO MARCIO DA SILVA	21808	BR 153, KM 330,080	104.13	68.1
5209	4845	2018-03-29	AWC1346	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JULIANO OLIVEIRA PINTO	25600	BR 070 KM 279,760	104.13	68.1
5210	4890	2018-03-29	AWC1488	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELISANGELA LAVEZZO	22140	BR 365 KM 382,040	104.13	0
5211	6000	2018-03-29	AWM5525	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ANEL VIARIO PREF. SINCLER SAMBATTI, N 2806 O/L FAIXA 1	130.16	68.1
5212	7160	2018-03-28	BBH5572	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MILTON MACHADO DA CRUZ	\N	BR 116 KM 817+580M UF/BA	85.13	68.1
5213	7160	2018-03-28	BBH5572	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MILTON MACHADO DA CRUZ	\N	BR 116 KM 909+660M UF/BA	130.16	104.13
5214	4690	2018-03-28	AUZ8420	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	CLAUDENIO DANTAS DE SOUZA	27326	BR 101 KM 720 UF/BA - CRESCENTE	160.16	104.13
5215	4785	2018-03-28	AWA4930	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	Jose Antonio Juliani	31	BR 277 KM 128 UF/PR - CRESCENTE	130.16	104.13
5216	2890	2018-03-28	AQN2080	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EVANDRO PEREIRA RIBEIRO	245	BR 226 KM 39,830	104.13	68.1
5217	7380	2018-03-27	PRI1677	ESTACIONAR LOCAL/HORÁRIO DE ESTACIONAMENTO E PARADA PROIBIDOS PELA SINALIZAÇÃO	EDILSON FERREIRA LIMA	414	RUA PRINCESA ISABEL N 21 SAO VICENTE	156.18	124.94
5218	8050	2018-03-27	OUM7977	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSYELL ALVES DE JESUS	179	BR 316 KM 19,670	104.13	83.3
5219	1275	2018-03-26	AKO3699	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	CAIQUE JEAN BENTO DA SILVA	30070	CE 321 KM 13,EM FRENTE PFF DE CARIRE 1361-7 CARIRE/CE	120	96
5220	1030	2018-03-26	AHN3351	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO CARLOS COELHO ROSA	404	BR 153 KM 410,050	104.13	83.3
5221	7360	2018-03-26	PRI1776	ESTACIONAR EM DESACORDO COM A REGULAMENTAÇÃO - ESTACIONAMENTO ROTATIVO	TIAGO BATISTA DA SILVA	137	AVENIDA REGIS PACHECO	195.23	156.18
5222	2800	2018-03-26	IMQ0445	DEIXAR DE REDUZIR A VELOC ONDE O TRÂNSITO ESTEJA SENDO CONTROLADO PELO AGENTE	\N	\N	GO 173, KM 162 ARUANA, BRITANIA	156.18	102.15
5223	7075	2018-03-26	OUK2422	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	JUTAIR SANTOS SOARES	23436	AV. PRESIDENTE CASTELO BRANCO, N 5180 HORIZONTE/CE	80	83.3
5224	1255	2018-03-23	AKN6845	FALTA DE ESCRITURAÇÃO LIVRO REGISTRO ENTRADA/SAÍDA E DE USO PLACA DE EXPERIÊNCIA	CARLOS APARECIDO DOS SANTOS	27695	BR 153 KM 109,280	191.54	153.23
5225	3850	2018-03-23	ATA1130	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	SANDRA ARAUJO SILVA	387	GO 213 KM 54 CALDAS NOVAS MORRINHOS	104.13	83.3
5226	1995	2018-03-23	NCQ0842	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	IDEVAN CARLOS VIANA	\N	BR 316 KM 19,670	104.13	83.3
5227	1180	2018-03-22	AJC8792	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	\N	\N	SP 330 KM 305 METROS 500	134.76	0
5228	3550	2018-03-22	ACZ1599	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	PAULO CEZAR LIMA DE SANTANA	32140	CE 292 KM 17, EM FRENTE, PFF, CRATO	104.13	83.3
5229	3470	2018-03-22	ASN2097	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	ADEMIR GUION	25	VIA EXPRESSA DE CONTAGEM N 12311 SENT. BETIM/ BH	234.78	187.82
5230	4710	2018-03-21	AUZ8421	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEANDRO GUEDES	17633	BR 163 KM 11,700	104.13	68.1
5231	7150	2018-03-20	BBI9759	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALDAIR DE SOUZA ACOSTA	\N	BR 463 KM 71,610	104.13	68.1
5232	7390	2018-03-20	PRI3037	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEIDMILSON DOS SANTOS ALMEIDA	31112	BR 116 KM 818+995M UF/BA	130.16	104.13
5233	6065	2018-03-20	NBS7993	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDIMILSON JOSÉ DE SOUZA	1141	BR 407,KM 73,500	104.13	83.3
5234	2430	2018-03-19	AOU2115	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 480+600	85.13	104.13
5235	2640	2018-03-19	NDU0332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILLIAM PEREIRA DA SILVA	283	BR 153 KM 243,900	104.13	68.1
5236	7425	2018-03-19	BBX0953	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 267 KM 395,590	104.13	68.1
5237	5010	2018-03-17	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 262 KM 5,400	104.18	83.34
5238	3490	2018-03-17	ASN2099	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEFRSON ANTONIO DE SOUZA	24	BR 365 KM 448,500	104.13	83.3
5239	4755	2018-03-17	MAX8035	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WELINGTON SOARES PEREIRA	\N	BR 364 KM 123,670	104.13	68.1
5240	4830	2018-03-17	AWB7320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE DIVINO SOARES DE ALMEIDA	218	BR 364 BR 382,040	104.13	68.1
5241	2320	2018-03-17	NCJ8385	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	LEANDRO MARCOS DA CONCEICAO	29522	BR 435 KM 19 UF/RO - 00230	80	104.13
5242	4000	2018-03-16	ATD0748	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONALDO BECEGATTO	\N	BR 163 KM 122,800	104.13	68.1
5243	4300	2018-03-16	CKT5776	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	\N	\N	AV. P S SAMBATI x AV. CARMEN M	180	144
5244	4300	2018-03-16	CKT5776	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	\N	\N	AV. P SAMBATTI X AV CARMEN M	293.46	234.77
5245	4300	2018-03-16	CKT5776	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	ANANIAS PEREIRA	\N	AV P S SAMBATTI X AV CARMEN M	180	0
5246	3220	2018-03-16	ARA4017	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	CASSIO FERNANDES MARTINS	249	BR 070 KM 315,000	156.18	96
5247	7370	2018-03-16	PRI1687	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	RONILDO DOURADO DE AZEVEDO	84	MARG BOTAFOGO QD B ST CENTRAL	104.13	83.3
5248	780	2018-03-16	AHL0451	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	\N	\N	GO 164 KM 850 DIVISA GO/TO, SAO MIGUEL DO ARAGUAIA	104.13	68.1
5249	6085	2018-03-16	OLF5495	DIRIGIR SEM ATENÇÃO OU SEM OS CUIDADOS INDISPENSÁVEIS À SEGURANÇA	\N	\N	GO 164, KM 850 DIVISA GO/TO, SAO MIGUEL DO ARAGUAIA	70.7	42.57
5250	4450	2018-03-15	AUA8607	CONDUZIR O VEIC EM MAU ESTADO DE CONSERVACAO	JOSIMAR LOPES DE ASSUNÇÃO	29845	GO 164, KM 660 ARAGUAPAZ NOVA CRIXAS	156.18	96
5251	7070	2018-03-15	OUK4212	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	MATEUS FRANCISCO RIBEIRO	21083	ROD. BA 120 KM 129 QUEIMADAS-CANSANÇÃO	195.23	102.15
5252	4955	2018-03-14	AWI5199	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JECONIAS JOSE SILVA DOS SANTOS	28705	BR 070 KM 155,060	104.13	68.1
5253	4455	2018-03-14	AUA8522	ESTACIONAR O VEÍCULO QO LADO OU SOBRE GRAMADOS OU JARDIM PÚBLICO	JULIO NERI DA SILVA	25607	LARGO DA SANTA CRUZ, LADO OPOSTO AO N. 428	156.19	0
5254	4455	2018-03-14	AUA8522	ESTACIONAR VEIC NO PASSEIO, FAIXA DE PEDESTRES, ETC	JULIO NERI DA SILVA	25607	LARGO DA SANTA CRUZ	156.19	124.95
5255	6670	2018-03-13	PQX0514	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	DOMINGOS CRUZ DOS SANTOS	105	BR 251 KM 176	104.12	83.3
5256	805	2018-03-11	KDL3292	DIRIGIR SEM ATENÇÃO OU SEM OS CUIDADOS INDISPENSÁVEIS À SEGURANÇA	CASSIO FERNANDES MARTINS	249	GO 213 KM 120 CALDAS NOVAS , IPAMERI	70.7	42.57
5257	1130	2018-03-11	AJU4771	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO DA SILVA NASCIMENTO	388	BR 153 KM 241,900	104.13	68.1
5258	1535	2018-03-10	NCU3177	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	CARLOS APARECIDO DOS SANTOS	27695	AV. ATILIO FONTANA N° 3373	130.16	96
5259	7325	2018-03-10	BBQ6205	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	CELIO INICENCIO	\N	PR 218 KM 230	130.16	64
5260	2480	2018-03-10	APO9699	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 158 KM 250,480	104.13	68.1
5261	7180	2018-03-09	BBH8858	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	JOEL LUIZ DA SILVA	14	AVENIDA. JUSCELINO KUBITSCHEK CRUZ. COM R. ALAGOAS- A/C	293.46	234.77
5262	7180	2018-03-09	BBH8858	AVANÇAR O SINAL VERMELHO DO SEMÁFORO	JOEL LUIZ DA SILVA	14	AV. JUSCELINO KUBITSCHEK CRUZ. COM R. ALAGOAS - A/C	293.46	153.23
5263	4050	2018-03-09	ATD4117	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	CLAUDIO SANTOS BARBOSA	31109	BR 425 KM 140 UF/PE - 05525	120	96
5264	450	2018-03-09	AFC3176	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 163 KM 675 UF/PA - DECRESCENTE	80	64
5265	4675	2018-03-09	AUZ5041	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CESAR MACHADO DE AZEVEDO	19317	BR 435,023 KM 435,023	104.13	68.1
5266	1030	2018-03-09	AHN3351	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	GERALDO LAURIANO NASCIMENTO	141	BR 153 KM 330,080	156.18	96
5267	4990	2018-03-09	AWE1761	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FABIANO BINI	2624	BR 364 KM 348,785	104.13	68.1
5268	900	2018-03-08	BTA9258	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 364 KM 270 UF/MT - DECRESCENTE	130.16	104.13
5269	7195	2018-03-08	BBK1069	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	\N	\N	DETRAN, PORTO ALEGRE	104.12	83.3
5270	7325	2018-03-08	BBQ6205	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	CELIO INICENCIO	\N	PR 218 KM 32+0 SENTIDO CRESCENTE	195.23	96
5271	3340	2018-03-08	ARO4462	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR 153 KM 243,900	104.13	83.3
5272	7240	2018-03-08	BBK8161	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCOS BRITO DA SILVA	16606	BR 104 KM 39,100	104.13	68.1
5273	4250	2018-03-07	AGZ0199	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	ROGERIO COUTINHO AGUIAR	384	FL28 QD40, LT04 MARABA/PA	156.18	124.94
5274	3910	2018-03-07	AGZ0115	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WANDERSON PEDREIRA ESTRELA	12527	BR 242 KM 222+ UF/BA	85.13	68.1
5275	4020	2018-03-07	ATD5602	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JUCELIO FERREIRA DA SILVA	24123	BR 116 KM 472,500	104.13	68.1
5276	4830	2018-03-06	AWB7320	RETIRAR DO LOCAL VEÍCULO LEGALMENTE RETIDO PARA REGULARIZAÇÃO. SEM PERMISSÃO	JOSE DIVINO SOARES DE ALMEIDA	218	KM 109+20 M MGC265	234.77	153.23
5277	3310	2018-03-06	ARL7069	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEFRSON ANTONIO DE SOUZA	24	PR 092 KM 211+600 M SENTIDO CRESC	130.16	68.1
5278	4545	2018-03-06	NCY4696	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DANIEL LUIS DOS SANTOS	19662	GO-080 KM 51+200M / NEROPOLIS / PETROLINA	85.13	68.1
5279	6370	2018-03-06	OZE9396	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EGNALDO TRINDADE	\N	BR 163 KM 363+500	130.16	104.13
5280	4990	2018-03-05	AWE1761	DEIXAR DE INDICAR MEDIANTE GESTO REALIZACAO DE MANOBRA	FABIANO BINI	2624	AVENIDA ANTONIO FERREIRA  SOBRINHO EM FRENTE GAZIN CENTRO	156.18	96
5281	4690	2018-03-04	AUZ8420	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LOURIVAL SANTOS	10011	BR 407 KM 73,500	104.13	68.1
5282	6590	2018-03-04	BWJ4576	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE HEUDES BATISTA DE OLIVEIRA	31053	BR 101 KM 263,660	104.13	83.3
5283	4635	2018-03-02	LWH5409	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	DANIEL TEODORO DE SOUZA	407	GO 060 KM 51	104.13	68.1
5284	7180	2018-03-02	BBH8858	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEVALDO GONÇALVES DE OLIVEIRA	\N	ANEL VIARIO PREF. SINCLER SAMBATTI, N 2806 O/L FAIXA 1	130.16	68.1
5285	3670	2018-03-01	ANX0071	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GEORGE DE LIRA FERREIRA	21837	CE 060 KM  513,7 - JUAZEIRO DO NORTE	104.13	68.1
5286	5010	2018-03-01	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO 330 KM 49/ CATALÃO - IPAMERI	104.13	68.1
5287	6065	2018-03-01	NBS7993	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDIMILSON JOSÉ DE SOUZA	1141	BR 407 KM 73,500	104.13	83.3
5288	7315	2018-03-01	BBQ6210	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONALDO BECEGATTO	\N	BR 163 KM 314,700,	104.13	68.1
5289	4350	2018-02-28	ATW6589	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	GIVANILDO RAMOS DA CONCEICÃO	28340	ROD BA 120 KM 129 QUIMADAS - CANSANCAO	130.16	68.1
5290	6515	2018-02-27	AZO8477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ISRAEL BEZERRA DOS SANTOS	370	ROD ES-165 AFONSO CLAUDIO ES SENTIDO BR 262 FEIA 1	104.13	83.3
5291	6245	2018-02-27	OVB8860	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CAZUZA CRUZ NICOLAU	29333	BR 101 BR 94,080	104.13	83.3
5292	4690	2018-02-27	AUZ8420	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LOURIVAL SANTOS	10011	BR 407 KM 73,500	104.13	68.1
5293	4950	2018-02-26	AWI3927	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	SANDOVAL DE JESUS FERNANDES	116	GO 330, KM 41 CATALAO, IPAMERI	156.18	102.15
5294	1750	2018-02-26	NCT4919	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 365 KM 404,300	85.13	68.1
5295	2510	2018-02-26	APW1934	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	DOUGLAS ROBERTO NEVES BEZERRA	247	KM13,7 ES 010 SERRA/ ES	234.78	187.82
5296	4635	2018-02-23	LWH5409	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	RUAN FERREIRA DA SILVA	219	GO 164, KM 604 FAINA,ARAGUAPAZ	104.13	0
5297	4785	2018-02-22	AWA4930	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR163 KM 323,39	80	0
5298	4840	2018-02-22	AWB7318	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	IVAN GONÇALVES RIBEIRO	22515	BR 364 KM 176,550	104.13	68.1
5299	820	2018-02-22	AHV3957	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOEL LUIZ DA SILVA	14	BR 116 KM 858+400M UF/BA	130.16	104.13
5300	3340	2018-02-22	ARO4462	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR 153 KM 410,050	104.13	83.3
5301	6570	2018-02-21	AZY5791	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	JOSE JADSON BARBOSA DA SILVA	395	GO 213 KM 09 MORRINHO CALDAS NOVAS	104.13	83.3
5302	2000	2018-02-21	AAK8762	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIOMARIO PEDRO DE OLIVEIRA	30310	BR 316 KM 96,150	104.13	68.1
5303	3840	2018-02-20	ATU1130	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	CLEBER BORGES MARTINES PEDROSA	29206	BR 364 KM 472 UF/RO - DECRESCENTE	957.69	0
5304	6480	2018-02-20	AYZ4108	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FABRICIO FRANCALINO DA SILVA	28704	BR 381 KM 920+800 M UF/MG	130.16	104.13
5305	8045	2018-02-19	OUM5422	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JURANDI COSTA VIANA	20880	CE- 060, KM, 52,6 - REDENÇÃO	85.13	68.1
5306	8045	2018-02-19	OUM5422	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JURANDI COSTA VIANA	20880	CE-060 KM 52,6 - REDENÇÃO - CE	85.13	68.1
5307	4965	2018-02-19	AWD7591	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TIAGO DIAS BORGES DA SILVA	129	BR 470 KM 35,000	104.13	68.1
5308	2320	2018-02-18	NCJ8385	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JUARES FERREIRA BRANCO	\N	BR 153 KM 410,050	104.13	83.3
5309	4705	2018-02-17	AVA3677	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	YAGO NOBRES DINIZ OLIVEIRA	25598	BR 364 KM 13,780	104.13	68.1
5310	4705	2018-02-16	AVA3677	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	YAGO NOBRES DINIZ OLIVEIRA	25598	BR364 KM 123 + 670 M	104.13	68.1
5311	4955	2018-02-14	AWI5199	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	MARILDO ALVES DE OLIVEIRA	29643	GO 213, KM 112 IPAMEI, CALDAS NOVAS	104.13	64
5312	1405	2018-02-14	BXF4340	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FABIO THOMAZ DE SOUZA	\N	BR174 K M126	104.16	68.1
5313	3985	2018-02-14	ASY8825	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GIVALDO BORGES FERREIRA	30	BR 116 KM 563+ /UF BA	130.16	68.1
5314	4090	2018-02-14	AAZ7005	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	GIVALDO BORGES FERREIRA	30	BR 116 KM 563 UF/BA DECRESCENTE	957.69	766.15
5315	2430	2018-02-14	AOU2115	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	BR 365 KM 433 +500M	85.13	68.1
5316	2430	2018-02-14	AOU2115	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	BR 365 KM 433,500	104.13	83.3
5317	3540	2018-02-13	ATA1599	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 226 KM 39,830	104.13	83.3
5318	3955	2018-02-13	NDR8325	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MANOEL EVANGELISTA GONCALVES DE JESUS	18776	BR 116 KM 415,900	104.13	83.3
5319	2800	2018-02-13	IMQ0445	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	\N	\N	GO 164 KM 738 NOVA CRIXAS SAO MIGUEL DO ARAGUAIA	156.18	124.94
5320	7220	2018-02-11	PKM4632	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 324 KM 526.450M UF-PA	85.13	68.1
5321	7005	2018-02-10	OUG5253	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TIAGO BATISTA DA SILVA	137	BR 101 KM 813,580	104.13	83.3
5322	7170	2018-02-10	BBH8857	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	\N	\N	AV. DOUTOR VLADIMI BABKOV NÚMERO 900, MARINGA-PR	195.23	156.18
5323	7170	2018-02-10	BBH8857	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	MARIA AP. DA SILVA SOUZA	\N	AV. DOUTOR VLADIMIR BABKOV NUMERO 900	195.23	156.18
5324	2830	2018-02-09	AQN7413	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NIVALDO DE OLIVEIRA FREITAS	24290	CE-282 KM 95,0  IGUATU/CE	104.13	68.1
5325	2510	2018-02-08	APW1934	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR 156 KM 410,050	156.18	124.94
5326	370	2018-02-08	AHD3293	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMERSON PEDRO DOS SANTOS	11896	BR 364 KM 707,660	104.13	68.1
5327	4935	2018-02-08	AWG1781	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	JOSE RAIMUNDO DE OLIVEIRA	224	ROD PA 252 KM 08 AURORA DO PARA/PA	156.18	124.94
5328	4130	2018-02-06	AGZ0159	ESTACIONAR SOBRE FAIXA DESTINADA A PEDESTRE	WELLINTON SECKLER FURLAN	30317	AV. SÃO JOÃO 588- CENTRO , FAXINAL DOS GUEDES	195.23	102.15
5329	8020	2018-02-06	OUK0433	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	MANOEL EVANGELISTA GONCALVES DE JESUS	18776	PI 368, KM 13+330 SENTIDO SUL-NORTE	195.23	156.18
5330	6365	2018-02-05	AYB3788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 227+ UF/MT	130.16	104.13
5331	6365	2018-02-05	AYB3788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 55,000	104.13	68.1
5332	2890	2018-02-04	AQN2080	TRANSITAR EFETUANDO TRANSPORTE REMUNERADO DE BENS QDO NÃO LICENCIADO P/ ESSE FIM	RAIMUNDO CESAR OLIVEIRA BARROSO	389	RODOVIA PA 252KM 08 AURORA DO PARA/PA	104.13	83.3
5333	4990	2018-02-04	AWE1761	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PABLO BONETTI JUNGLES	27598	BR 364 KM 263,900	104.13	68.1
5334	2500	2018-02-03	APS5203	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	JOAO DANILO EVANGELISTA	372	GO 164 KM 738 NOVA CRIXAZ SÃO MIGUEL DO ARAGUAIA	156.18	124.94
5335	5010	2018-02-02	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	LMG 749 KM 2,3 UBERLANDIA FX 1 SC	104.13	68.1
5336	5010	2018-02-02	AWE3538	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	LMG 79 KM 6+000 UBERLANDIA	156.18	96
5337	3900	2018-02-02	AGZ0113	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	CE 282- KM 95,1 IGUATU-CE	104.13	83.3
5338	3900	2018-02-02	AGZ0113	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	KM 95+100 M CE 282	85.13	68.1
5339	2290	2018-02-02	AOL4468	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIARLES ALVES ROCHA	257	BR 153 KM 619,970	104.13	68.1
5340	1110	2018-02-01	AJT7581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDINEI CANDIDO ZEFERINO	\N	BR 364 KM 118,000	104.13	68.1
5341	4090	2018-02-01	AAZ7005	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GIVALDO BORGES FERREIRA	30	KM 53 BR470 UF SC	85.13	68.1
5342	7300	2018-02-01	BBM9414	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	NILSON MOURA DE ARRUDA	15300	BR 163 KM 994 UF/MT DECRESCENTE	156.18	156.18
5343	2950	2018-02-01	AQP6134	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	FLAVIO HELTON GONZAGA	226	AV. BERNARDO SYAO EM FRENTE AO NUM. 4300	159.74	124.94
5344	4840	2018-02-01	AWB7318	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	IVAN GONÇALVES RIBEIRO	22515	BR 070 KM 66,115	104.13	68.1
5345	6250	2018-02-01	OVB5284	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	NILTON PINHO BRASILEIRO	17510	ACESSO PI 140- BR 343 SENTIDO  PI 140/ BR343	195.23	156.18
5346	1285	2018-01-31	AKP2741	ESTACIONAR EM DESACORDO COM AS POSIÇÕES ESTABELECIDAS NO CTB	LUAN JAYLLY FREIRE DE BRITO	214	AV. BERNARDO SAYAO OPOSTO AO NUM. 1110	104.13	68.1
5347	7320	2018-01-31	BBQ6209	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	\N	\N	AV. JUSCELINO KUBITSCHEK, PROX. 3897	293.46	234.77
5348	7320	2018-01-31	BBQ6209	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	\N	\N	AV. JUSELINO KUBITSCHEK PROX. 3897	180	144
6142	5045	2017-03-01	AWG8679	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FARLEI ARTUR WINTERHALTER	15687	\N	104.12	0
5349	4190	2018-01-30	AGZ0299	ESTACIONAR SOBRE FAIXA DESTINADA A PEDESTRE	FELIPE MACIEL KUMM	30238	RUA LAURO NULLER- ALVORADADA, VIDEIRA-SC PROXIMO A CLINICA S O LUCAS	204.24	102.15
5350	7260	2018-01-30	BBK6724	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	BR 163 KM 329 UF/MS DECRESCENTE	1467.35	1173.88
5351	7135	2018-01-29	BBI3135	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	AMARO PEREIRA DA SILVA	29521	AV. P S SAMBATI x AV. JOSE A N	293.46	234.77
5352	7135	2018-01-29	BBI3135	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	AMARO PEREIRA DA SILVA	29521	AV. P S SAMBATTI X AV JOSE A N	293.46	144
5353	7240	2018-01-29	BBK8161	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MANOEL SILVA DE ALMEIDA JUNIOR	18358	BR 101 KM 180 + 620 M	104.13	0
5354	4325	2018-01-28	ATV6796	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	EGNALDO TRINDADE	\N	KM 159 + 200 M PR 323	130.16	96
5355	4675	2018-01-28	AUZ5041	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CESAR MACHADO DE AZEVEDO	19317	BR 386 KM 213,502	85.13	68.1
5356	4860	2018-01-28	AWC9135	CONDUZIR O VEÍCULO COM EQUIPAMENTO OBRIGATÓRIO INEFICIENTE/INOPERANTE	WILSINER SILVA DE CARVALHO	138	KM 738 GO 164 MUNDO NOVO - GO	156.18	0
5357	3680	2018-01-25	ANX0075	EXECUTAR OPER DE CONVERSAO A DIR OU A ESQ LOCAIS PROIBIDOS	\N	\N	AV OSVALDO CRUZ 17 29 ITAPORANGA-PB	205.26	156.18
5358	3680	2018-01-25	ANX0075	EXECUTAR OPERAÇÃO DE CONVERSÃO À ESQUERDA EM LOCAL PROIBIDO PELA SINALIZAÇÃO	\N	\N	AV. OSVALDO CRUZ 17 29 ITAPO	127.69	102.15
5359	4955	2018-01-24	AWI5199	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	JECONIAS JOSE SILVA DOS SANTOS	28705	KM 001 GO 180	104.13	68.1
5360	4040	2018-01-24	ATD2721	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDIMAR BARBOSA DE BRITO	13364	BR 232 KM 182,000	104.13	68.1
5361	1420	2018-01-23	ALH0523	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADAIRTON DE SANTANA CHALEGRE	10	BR 116 KM 64+ 800 M	85.13	68.1
5362	5580	2018-01-23	AWN1830	MULTA ANTT	\N	\N	RODOVIA BR 163 KM 4	550	440
5363	5580	2018-01-23	AWN1830	MULTA ANTT	CLAUDEMIR GOMES DA SILVA	19195	\N	550	385
5364	1415	2018-01-23	ALH2054	MULTA ANTT	ELISANGELA LAVEZZO	22140	RODOVIA BR 163, KM 4	550	385
5365	3550	2018-01-22	ACZ1599	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DANIEL CARVALHO DE OLIVEIRA	31036	BR 116 KM 818+995M UF/BA	130.16	104.13
5366	4220	2018-01-22	AGZ0305	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	ALDO SOARES DE ABREU	251	AVENIDA JSOE MAGALHÃES PINTO  435	156.18	124.94
5367	1220	2018-01-21	AKI6988	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	AV. MIGUEL SUTIL - PROX AOUTO PECA AMIGAO TRINC- SENT VIADUTO COXIPO CUIBA- MT	104.13	68.1
5368	1285	2018-01-19	AKP2741	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	ALEX DE JESUS BRITO	31982	GO 184 KM 79	104.13	68.1
5369	1220	2018-01-19	AKI6988	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEDINEI FUSSINGER	\N	BR 070 KM 279 + 960 M	104.13	68.1
5370	7285	2018-01-18	AYH2376	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	\N	\N	MULTA POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR	156.18	124.94
5371	7000	2018-01-17	BEM3419	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 20% ATÉ 50%	\N	\N	BR 163 KM 623	127.69	102.15
5372	1255	2018-01-16	AKN6845	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	\N	\N	R. FRANCISCO PAULI, 1209 - CRUZEIRO BENTO SUL- SC, BRASIL	120	96
5373	1255	2018-01-16	AKN6845	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	JULIO CESAR LIMA DOS SANTOS	31184	RUA FRANCISCO PAULI, 1209 - CRUZEIRO DO SUL - SC, BRASIL	195.23	156.18
5374	6685	2018-01-16	BAQ4021	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 330, KM 102 URUTAI, IPAMERI	80	64
5375	2025	2018-01-15	NCQ0852	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	JOSE ROBERTO DA SILVA	28000	ACESSO PI 140 - BR 343 SENTIDO PI 140/BR 343	120	124.94
5376	5005	2018-01-13	AWE1751	ESTACIONAR LOCAL/HORÁRIO DE ESTACIONAMENTO E PARADA PROIBIDOS PELA SINALIZAÇÃO	\N	\N	AEROPORTO FRENTE SN  CARZEA GRANDE/MT	156.18	124.94
5377	4300	2018-01-12	CKT5776	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	AMARO PEREIRA DA SILVA	29521	NOVA ALVORADA	104.12	83.3
5378	7195	2018-01-12	BBK1069	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ERS122 KM 46 + 800 M	104.12	68.1
5379	6665	2018-01-11	PQX0454	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	ADALTO PEREIRA DA SILVA	274	ROD.PA 253, KM. 08 IRITUBA/PA	104.13	83.3
5380	5010	2018-01-11	AWE3538	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 330, KM 041 IPAMERI, CATALAO	104.13	64
5381	3810	2018-01-10	AEQ1440	DEIXAR O PASSAGEIRO DE USAR O CINTO SEGURANÇA	EGLESON MOUZINHO FIGUEIREDO DE SOUSA	31054	BR 116 KM 408,000	127.69	102.15
5382	7350	2018-01-09	PRR0214	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	CLEIDIVAN DE CARVALHO CELESTINO	28	DF 003 KM 0 DISTRITO FEDERAL	130.16	104.13
5383	6520	2018-01-09	AZO8479	CONDUZIR O VEÍCULO EM MAU ESTADO DE CONSERVAÇÃO. COMPROMETENDO A SEGURANÇA	JOAO BONFIM DOS ANJOS NETO	220	KM 134 MGE 120	156.18	102.15
5384	3600	2018-01-08	ASB6672	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	RODOVIA: PR 323 KM 21+500 SENTIDO: DECRE	130.16	104.13
5385	3600	2018-01-08	ASB6672	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	PR 323 KM 21 KM + 500M	130.16	96
5386	4685	2018-01-08	AUZ5722	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FELIPE MACIEL KUMM	30238	ROD. ERS 130 KM 77 SENTIDO ARROIO DO MEIO - LAJEADO	85.13	68.1
5387	2290	2018-01-06	AOL4468	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	DIARLES ALVES ROCHA	257	AV BARÃO DO RIO BRANCO C/ AV MAXIMINO PORPINO	127.69	102.15
5388	2290	2018-01-06	AOL4468	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	PAULO CEZAR LIMA DE SANTANA	32140	AV BARAO DO RIO BRANCO C/ AV MAXIMINO PORPINO CASTANHAL/PA	202.18	124.94
5389	4860	2018-01-06	AWC9135	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	WILSINER SILVA DE CARVALHO	138	GO142 KM 072 MONTIVIDIU DO NORTE - GO	104.13	68.1
5390	440	2018-01-05	AET5327	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	ADAILTON APARECIDO GOMES	13940	BR 262 KM 481	85.13	68.1
5391	1010	2018-01-05	AJI4719	CONDUZIR O VEÍCULO COM QUALQUER UMA DAS PLACAS SEM LEGIBILIDADE E VISIBILIDADE	ALISSON DOS SANTOS ALVES	31035	KM 439 BR 262	293.47	153.23
5392	1010	2018-01-05	AJI4719	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	ALISSON DOS SANTOS ALVES	31035	ROD. BA 262  KM 439	85.13	68.1
5393	4995	2018-01-02	AWE3542	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 257,880	68.1	54.48
5394	3470	2018-01-02	ASN2097	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMIR GUION	25	BR 153 KM 610,800	68.1	54.48
5395	3045	2018-01-02	NCS9822	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	REGINALDO SOARES	\N	BR 163 KM 650,680	68.1	54.48
5396	6515	2018-01-02	AZO8477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEITON TONON DEOCLECIO	128	BR 262 KM 558,900	68.1	54.48
5397	385	2018-01-02	ACA6668	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 769,480	104.13	83.3
5398	4675	2018-01-02	AUZ5041	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 280 KM 111,800	68.1	54.48
5399	4160	2018-01-02	NEC2958	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LAERTE IRIAS DE SOUZA	16694	BR 364 KM 175,230	68.1	54.48
5400	4425	2018-01-02	AUB3551	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	\N	\N	BR 364 KM 269 UFMR DECRESCENTE	85.13	68.1
5401	6485	2018-01-02	AYZ8643	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 410,050	68.1	54.48
5402	4665	2018-01-02	AUZ3716	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VOLNEI DE LARA	15512	BR 280 KM 111,800	68.1	54.48
5403	6665	2018-01-02	PQX0454	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILSON SOUZA	106	BR 153 KM 71,800	104.13	83.3
5404	4835	2018-01-02	AWD7621	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 101 KM 208,890	68.1	54.48
5405	6290	2018-01-02	OVA1273	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	ELISANGELA LAVEZZO	22140	\N	158.66	126.93
5406	820	2018-01-01	AHV3957	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO FERREIRA	20	SP 425 KM 435 E METROS 400	85.13	68.1
5407	940	2018-01-01	AIY2379	TRANSITAR EM DESACORDO C/ AUTORIZAÇÃO EXPEDIDA P/VEÍCULO C/ DIMENSÕES EXCEDENTES	RICARDO FRANCISCO DE ASSIS	16	SP 330 KM  373 E METROS 000	127.69	102.15
5408	8055	2018-01-01	OUM6334	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	SILVANO DE SOUZA LAMEIRO	8884	BR 070 KM 287	68.1	54.48
5409	3320	2018-01-01	ARL7A67	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	ADEMIR GUION	25	KM 004 SPA 079/613	957.7	766.16
5410	6680	2018-01-01	PQX0724	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	\N	\N	KM 01 TO 336	68.1	54.48
5411	1060	2018-01-01	AJO4034	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 20% ATÉ 50%	\N	\N	KM 360,100 BR153	102.15	81.72
5412	2260	2018-01-01	AOL4465	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	VICENTE DE PAULO FERREIRA	15	KM 218 BR 153	68.1	54.48
5413	1070	2018-01-01	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	BR 153 KM 500	68.1	54.48
5414	4100	2018-01-01	AAV7009	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	\N	\N	KM 030 SP 021	85.13	68.1
5415	6205	2018-01-01	NCG1968	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	KM 9+ 500M BR 364	68.1	54.48
5416	6330	2018-01-01	OVB7350	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 20% ATÉ 50%	\N	\N	KM 31,050 BR 316	102.15	81.72
5417	950	2017-12-31	AIY4742	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO WOEZELI FELISMINO DE MELO	\N	KM 455 + 900 M BR 365 - PATROCINIO	104.13	68.1
5418	3090	2017-12-31	AQP6144	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SIDNEI MOREIRA BONFIM	29	BR 365 KM 455 + 900 M PATROCIONIO	104.13	0
5419	3090	2017-12-31	AQP6144	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SIDNEI MOREIRA BONFIM	29	BR329+900M BR365	104.13	68.1
5420	6485	2017-12-28	AYZ8643	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	EVANDRO PEREIRA RIBEIRO	245	KM 041 GO330 CATALÃO GO	104.13	68.1
5421	4365	2017-12-28	ATY5536	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCELO DE MELO SANTOS	\N	BR 101 KM  143 + 500 M	104.13	68.1
5422	2890	2017-12-27	AQN2080	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	LUAN JAYLLY FREIRE DE BRITO	214	KM 220 GO 154	136.85	68.1
5423	1350	2017-12-25	AKY2404	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 346,813	104.13	68.1
5424	7055	2017-12-23	OUJ6448	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 316 KM 311,320	104.13	83.3
5425	2280	2017-12-23	AOL4467	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ADALTO PEREIRA DA SILVA	274	CONTORNO ROD ES 080 KM 11,5 COLATINA ES SENIDO SAO DOMINGOS DO NORTE FAIXA 2	156.18	124.94
5426	3280	2017-12-23	ARI6190	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCELO SUZART DE SANTANA	27468	BR 407 KM 73,500	104.13	68.1
5427	4680	2017-12-22	AUZ5650	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JHONE GONCALVES MEIRELES	24317	BR 407 KM 73,500	104.13	83.3
5428	2890	2017-12-22	AQN2080	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	LUAN JAYLLY FREIRE DE BRITO	214	R. POAIS DE CARVALHO FRENTA No 3051 CASTANHAS/PA	156.18	124.94
5429	1475	2017-12-22	NCT1713	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	PAULO DULTRA DE OLIVEIRA	17092	 GO 164, KM 738, SÃO MIGUEL DO ARAGUAIA, NOCA CRIXAS	104.13	68.1
5430	2510	2017-12-22	APW1934	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	ROD. Fruk salmen km 8 parauapebas / PA	104.13	83.3
5431	7330	2017-12-21	BBQ6208	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	CARLOS APARECIDO DOS SANTOS	27695	DETRAN/MS	104.12	83.3
5432	5020	2017-12-21	AWE5894	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	KM 139 +300M BR 163	85.13	68.1
5433	7345	2017-12-21	PRR0264	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	GECIMAR NASCIMENTO 	19	RUA WAGNER E CAMPOS N 247, ESQ. AV.  RAULINAF. PASCHOSL, CENTRO	156.18	124.94
5434	2360	2017-12-20	APG2054	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	VALDEMIR ROCHA DOS SANTOS	19	KM 671 BR 376 / GUARATUBA UF- PR	104.13	68.1
5435	7355	2017-12-19	PRI2455	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	VAGMAR ALVES DA FONSECA	207	GO 164 KM 604 ARAGUAPAZ FAINA	104.13	83.3
5436	6570	2017-12-18	AZY5791	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	\N	\N	GO 330 KM 102 IPAMERI URUTAI	156.18	124.94
5437	7325	2017-12-18	BBQ6205	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CELIO INICENCIO	\N	BR463 KM 1,300	104.13	68.1
5438	4830	2017-12-18	AWB7320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE DIVINO SOARES DE ALMEIDA	218	KM 243 + 900 M BR 153	104.13	68.1
5439	3910	2017-12-18	AGZ0115	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	MANOEL EVANGELISTA GONCALVES DE JESUS	18776	ACESSO I 140- BR 343 SENTIDO PI 140 / BR 343	195.23	96
5440	7025	2017-12-16	OUG0085	CONDUZIR VEÍCULO C/ REGISTRADOR INSTAN INALT DE VELOCIDADE/TEMPO VICIADO/DEFEITUOSO	AGUINALDO ROCHA GUIMARAES	121	CATALÃO - GO	156.18	102.15
5441	7025	2017-12-16	OUG0085	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	AGUINALDO ROCHA GUIMARAES	121	CATALÃO- GO	104.13	68.1
5442	1440	2017-12-15	CLH0477	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	\N	\N	\N	104.12	83.3
5443	4345	2017-12-15	ATW4394	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ROBSON HERMES DA SILVA	22392	PR 090 KM 193+000M	80	64
5444	2000	2017-12-15	AAK8762	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	MARIA AP. DA SILVA SOUZA	\N	BR 376 KM 131 PVAIMGA	127.69	102.15
5445	6325	2017-12-15	OVB4961	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	BR 116 KM 818+995 UF/BA VITÓRIA DA CONQUISTA/ BA	85.13	68.1
5446	4345	2017-12-15	ATW4394	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ROBSON HERMES DA SILVA	22392	PR 090 KM 193+000	130.16	104.13
5447	4345	2017-12-15	ATW4394	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ROBSON HERMES DA SILVA	22392	PR 090 KM 193+000 M	130.16	64
5448	4010	2017-12-14	ATD8971	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	RICARDO ALVES MARTINS	385	GO 330 KM 102 URATAI	104.13	83.3
5449	7025	2017-12-14	OUG0085	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	AGUINALDO ROCHA GUIMARAES	121	KM 101 GO 330	104.13	83.3
5450	4375	2017-12-14	ATZ8141	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROMILSON ALMEIDA DA SILVA	25603	BR 316 KM 65,200	104.13	68.1
5451	8040	2017-12-14	OUM0586	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DAVI SERGIO DE SOUZA BRITO	16321	KM 47,9 CE 060 - ACARAPE	85.13	0
5452	515	2017-12-13	LWU8833	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR364 KM 350,665	104.13	68.1
5453	4020	2017-12-13	ATD5602	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JUCELIO FERREIRA DA SILVA	24123	BR230 KM 152,700	104.13	68.1
5454	7300	2017-12-12	BBM9414	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILSON MOURA DE ARRUDA	15300	BR 070 KM 275,500	104.13	68.1
5455	7005	2017-12-12	OUG5253	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TIAGO BATISTA DA SILVA	137	BR 153 KM 296,400	104.13	83.3
5456	1740	2017-12-12	NCT2288	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	ALUSIVANIO DE ALMEIDA PASTOR	28760	KM 136 CE 040 - ARACATI	156.18	124.94
5457	7245	2017-12-08	BBK7415	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	RONALDO DA SILVA LIMA	22032	KM 439 BR 262	130.16	68.1
5458	1130	2017-12-07	AJU4771	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	GILSON SOUZA	106	KM 41 GO 330 - CATALAO	104.13	83.3
5459	5010	2017-12-07	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 050 KM 68,680	104.13	68.1
5460	7005	2017-12-06	OUG5253	CONDUZIR O VEÍCULO COM O LACRE DE IDENTIFICAÇÃO VIOLADO/FALSIFICADO	TIAGO BATISTA DA SILVA	137	PA 483, KM 14, DECRESCENTE MARITUBA/PA	234.78	187.82
5461	7005	2017-12-06	OUG5253	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	TIAGO BATISTA DA SILVA	137	ROD PA 483, KM 14, CRESCENTE MARITUBA/PA	138.18	110.54
5462	4450	2017-12-06	AUA8607	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	GILSON PEREIRA DA SILVA	27734	BR 158 KM 725 UF/MT- CRESCENTES	85.13	68.1
5463	3750	2017-12-05	ATF1590	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	JOSE NILSON DOS SANTOS	28	BR 376 KM 131 IPVIMGA	95.77	76.62
5464	6540	2017-12-05	AZU5059	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	\N	\N	KM 23 GO 139	156.18	124.94
5465	1210	2017-12-05	AKG2144	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GISNEY ANDRADE SILVA	112	KM 270 + 300M BR 116	85.13	68.1
5466	3890	2017-12-05	AGZ0118	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WENDSON CARNEIRO OLIVEIRA	15816	KM 36 BR 116 / HORIZONTE- UF CE	85.13	68.1
5467	7375	2017-12-04	PRH9066	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	LUIZ FERNANDO RIBEIRO OLIVEIRA	28680	GO 330 KM 101	104.13	83.3
5468	2960	2017-12-04	AQO0864	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	MARCILIO TORRES JUNIOR	28706	AV. DAS PALMEIRAS CRUZAMENTO AV. DOS INGAS	156.18	124.94
5469	2960	2017-12-04	AQO0864	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	MARCILIO TORRES JUNIOR	28706	SINOP - MT	127.69	102.15
5470	805	2017-12-03	KDL3292	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ANTONIO CLEVIS BARROS	132	PR 093 KM 279+950 M	130.16	64
5471	4435	2017-12-02	AUA8610	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 070 KM 66,115	132.73	68.1
5472	5010	2017-12-01	AWE3538	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 330, KM 146 PIRES DO RIO, URUTAI	80	64
5473	7260	2017-12-01	BBK6724	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	MGC0497KM 22+100 M CRESCENTE	156.18	96
5474	4230	2017-11-30	AGZ0304	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	REGIMAR JESUS DE SOUSA	345	KM 049 GO 330 - CATALAO	104.13	83.3
5475	1275	2017-11-30	AKO3699	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	JULIO CESAR LIMA DOS SANTOS	31184	BR 262 KM 36 ILHEUS- URUCUCA	104.13	68.1
5476	4925	2017-11-30	AWF3252	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	MARCELO CARMO DA SILVA	22436	BR 163 KM 593 UF MT	0	0
5477	2790	2017-11-30	LRK0860	DIRIGIR VEÍCULO UTILIZANDO-SE DE TELEFONE CELULAR	LUCIANO ALVES DE ARAUJO PINHO	29060	RUA BELEM  COM RUA SANTA CATARINA  POSTO MARION MT	104.13	68.1
5478	1220	2017-11-30	AKI6988	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	\N	\N	AV COUTO MAGALHAES FRENTE PAPELARIA GRAFITTE	156.18	102.15
5479	4790	2017-11-29	AWA4935	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JEFESON ROMUALDO DE SANTANA	7352	BR 364KM 205,450	104.13	68.1
5480	6520	2017-11-29	AZO8479	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	JOAO BONFIM DOS ANJOS NETO	220	AVENIDA NOSSA SENHORA DA PENHA- CASTELO AUTO ELETRICA  BAIRRO SÃO MIGUEL, CASTELO/ES	156.18	124.94
5481	7285	2017-11-29	AYH2376	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	MS 306 KM 88	156.18	96
5482	6190	2017-11-29	OUK8345	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 213, KM 10 MORRINHOS, CALDAS NOVAS	104.13	64
5483	6505	2017-11-28	AZH9816	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	PRC 272 KM 516	1467.35	766.15
5484	6505	2017-11-28	AZH9816	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	PRC 272 KM 516 IPORÃ-PR	1467.35	1173.88
5485	4300	2017-11-27	CKT5776	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	AMARO PEREIRA DA SILVA	29521	AV. ANTONIO J.M ANDRADE NO C/ RUA PASTOR J LIO F.D	104.12	64
5486	7185	2017-11-25	BBJ6138	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	LEIDIMAR COSTA LIMA	23058	GO 164, KM 738 SAO MIGUEL DO ARAGUAIA, NOVA CRIXAIS	104.13	68.1
5487	7185	2017-11-25	BBJ6138	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	LEIDIMAR COSTA LIMA	23058	GO 164 KM 738 SAO MIGUEL DO ARAGUAIA NOVA CRIXAIS	104.13	68.1
5488	2400	2017-11-25	AOT5935	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUCAS PEREIRA JORGE	352	AV. DR. LAMARTE P. DE AVELAR N°2139	104.13	83.3
5489	4080	2017-11-25	AAV7008	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	ALEXANDRE DE CARVALHO SEREN	21539	BR 376 KM 131 PVAIMGA	308.57	246.86
5490	840	2017-11-24	AIA5198	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCELO RIBEIRO BARBOSA	\N	BR 070 KM 379,870	104.13	68.1
5491	2910	2017-11-24	NDN3455	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSIMAR LOPES DE ASSUNÇÃO	29845	BR 364 KM 55,800	85.13	68.1
5492	2950	2017-11-24	AQP6134	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FLAVIO HELTON GONZAGA	226	BR 010 KM 352,760	104.13	0
5493	3310	2017-11-24	ARL7069	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	GEFRSON ANTONIO DE SOUZA	24	MG 190 KM 126,30	80	64
5494	1430	2017-11-22	ALH9513	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AGENOR FRANCISCO DA SILVA	17	BR 376 KM 650+800M UF/PR	85.13	68.1
5495	3310	2017-11-22	ARL7069	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	GEFRSON ANTONIO DE SOUZA	24	BR 376 KM 131 PVAIMGA	127.69	102.15
5496	4925	2017-11-21	AWF3252	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCELO CARMO DA SILVA	22436	BR 364 KM 176,550	104.13	68.1
5497	2890	2017-11-21	AQN2080	DEIXAR DE INDICAR MEDIANTE GESTO REALIZACAO DE MANOBRA	LUAN JAYLLY FREIRE DE BRITO	214	GO 330,KM 101 IPAMERI, URUTAI	120	96
5498	7135	2017-11-20	BBI3135	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 131	90.45	72.36
5499	6270	2017-11-18	OVB2617	TRANSITAR C/ VEIC C/ DIMENSOES OU CARGA SUP A LEGISLACAO	JOSE CARLOS SANTOS DO VALE	18208	ROD. BA 099 KM 22 AREMBEPE	195.23	96
5500	2800	2017-11-18	IMQ0445	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	\N	\N	RUA RIO DE JANEIRO, 277	104.13	64
5501	4675	2017-11-17	AUZ5041	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	CESAR MACHADO DE AZEVEDO	19317	DETRAN-RS	104.12	83.3
5502	4090	2017-11-17	AAZ7005	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	ELISANGELA LAVEZZO	22140	BR 376 KM 156 UF/PR - DECRESCENTE	234.78	234.78
5503	2025	2017-11-16	NCQ0852	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	JOSE ROBERTO DA SILVA	28000	BR 116 KM 27 UF/PE CRESCENTE	80	64
5504	4865	2017-11-16	AWB8560	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	GENILSON DE SOUSA COELHO	140	MGC 369 KM 4	108.38	68.1
5505	3760	2017-11-14	AOO6619	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 20% ATÉ 50%	CHARLES RAILAN TAQUARI ALVES	28204	GO 174 KM 33 + 500M	156.18	124.94
5506	6470	2017-11-13	AYZ4107	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	\N	\N	MCG451 KM 87,40	108.38	86.7
5507	3795	2017-11-13	ASK5672	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	BR 364 KM 408 UF/ROCRESCENTE	957.69	766.15
5508	4995	2017-11-13	AWE3542	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	SP 421 KM 132,400 M SENTIDO MANTES SP	85.13	68.1
5509	6345	2017-11-12	AXY8479	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 50%	\N	\N	BR 272 KM 552,050	574.61	459.69
5510	2740	2017-11-10	NDN5483	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	SIDNEI MOREIRA BONFIM	29	BR 376 KM 131 PVAIMGA	90.45	72.36
5511	4465	2017-11-10	AUB3552	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	GRIGORIO GONCALVES NETO	17711	AVENIDA LUDOVICO  DA RIVA	136.85	64
5512	6190	2017-11-09	OUK8345	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 070 KM 12,000	104.13	68.1
5513	2540	2017-11-09	APZ1625	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	ELICARLOS DE OLIVEIRA SILVA	23932	PE 035 POSTO 04 BPRV	127.69	124.95
5514	2540	2017-11-09	APZ1625	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	ELICARLOS DE OLIVEIRA SILVA	23932	PE- 035 POSTO 04 BPRV	127.69	102.15
5515	4020	2017-11-09	ATD5602	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JUCELIO FERREIRA DA SILVA	24123	BR 101 KM 124,250	104.13	68.1
5516	4795	2017-11-09	AWA4718	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 131	80	102.15
5517	2260	2017-11-09	AOL4465	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	\N	\N	\N	120	96
5518	4680	2017-11-09	AUZ5650	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONALDO DA SILVA LIMA	22032	BR 428KM 8,800	133.44	68.1
5519	4230	2017-11-08	AGZ0304	CONDUZIR O VEÍCULO COM CARACTERÍSTICA ALTERADA	JOAO PAULO NASCIMENTO VERAS	144	RDO PA 150 KM 222 GOIANESIA DO PARA / PA	156.18	124.94
5520	4230	2017-11-08	AGZ0304	CONDUZIR O VEÍCULO COM CARACTERÍSTICA ALTERADA	JOAO PAULO NASCIMENTO VERAS	144	ROD PA 150 KM  222 GOIANESIA DO PARA /PA	156.18	124.94
5521	3350	2017-11-08	ARO4467	ESTACIONAR NAS ESQUINAS E A MENOS DE 5M DO ALINHAMENTO DA VIA TRANSVERSAL	REGINALDO PEREIRA LEITE	275	RUA NOVA	130.16	104.13
5522	4175	2017-11-07	NEC2978	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALMIR LIMA BORGES	16359	BR 116 KM 477,300	104.13	83.3
5523	1130	2017-11-07	AJU4771	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	\N	\N	ROD PA 150 KM 363 NOVA IPIXUNA PA	156.18	124.94
6234	4535	2017-01-16	NDB4395	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	BRUNO ALVES PEREIRA	135	BR 163, KM 992	120	156.18
5524	6080	2017-11-06	OLF8027	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NOEL PINHEIRO DA CRUZ	26242	BR 116/ KM 442 + UF / BA	85.13	68.1
5525	6570	2017-11-06	AZY5791	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	VAGMAR ALVES DA FONSECA	207	ROD GO 330 KM 2370 SN PREDIO - SETOR AEROPORTO	80	64
5526	1275	2017-11-06	AKO3699	PARAR SOBRE FAIXA DE PEDESTRES NA MUDANÇA DE SINAL LUMINOSO (FISCALIZAÇÃO ELETRÔNICA)	\N	\N	CE- 040, KM 15,2- EUSEBIO/CE	104.13	64
5527	4010	2017-11-06	ATD8971	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	MILTON CAETANO FELIPE	350	\N	120	96
5528	1130	2017-11-06	AJU4771	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	GILSON PEREIRA DE MELO	344	\N	156.18	96
5529	7290	2017-11-04	BBM1326	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONI ALFREDO PEREIRA NUNES	26570	BR 265 KM 267,700	104.13	68.1
5530	6520	2017-11-04	AZO8479	DEIXAR O PASSAGEIRO DE USAR O CINTO SEGURANÇA	CLEIDIVAN DE CARVALHO CELESTINO	28	GO 164, KM 541 GOIAS, FAINA	156.18	96
5531	7290	2017-11-03	BBM1326	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONI ALFREDO PEREIRA NUNES	26570	BR 494 KM 40,360	104.13	68.1
5532	6680	2017-11-02	PQX0724	CONDUZIR O VEÍCULO COM EQUIPAMENTO OBRIGATÓRIO INEFICIENTE/INOPERANTE	GIOVANI FILHO PEREIRA DA SILVA	16	ROD PA 150 KM 23 NOVA IPIXUNA/PA	156.18	124.94
5533	5580	2017-11-01	AWN1830	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO INACIO BRIOSCHI	12	ROD PR 092 KM 224+800 M SENTIDO CRESCENTE	130.16	68.1
5534	6035	2017-11-01	AWN1828	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 174 KM 81+750 M UF/MT	120	96
5535	3340	2017-11-01	ARO4462	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	RAIMUNDO FILHO DA SILVA HENRIQUE	225	GO - 336/ KM - 004/ ITAPACI ENTROMCAMENTO BR 153	104.13	83.3
5536	7330	2017-10-31	BBQ6208	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	AVENIDA BRASIL - ESCOLA MARIA LIGIA BORGES.	138.21	83.3
5537	7330	2017-10-31	BBQ6208	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	AVENIDA BRASIL S/N ESCOLA MARIA LIGIA BORGES	85.13	68.1
5538	7220	2017-10-31	PKM4632	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MANOEL SILVA DE ALMEIDA JUNIOR	18358	ROD BA 526 KM 12 SENTIDO DECRESCENTE	85.13	68.1
5539	6570	2017-10-31	AZY5791	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VAGMAR ALVES DA FONSECA	207	MG 285 KM 81,2 ASTOLFO DUTRA	104.12	68.1
5540	6455	2017-10-31	AYR9572	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCINALDO FIRMINO DA SILVA	111	BR 010 KM 352,760	104.13	68.1
5541	6570	2017-10-31	AZY5791	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VAGMAR ALVES DA FONSECA	207	MG  285 KM 72,0 ASTOLFO DUTRA	104.12	68.1
5542	4925	2017-10-30	AWF3252	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCELO CARMO DA SILVA	22436	BR 116 KM 65+400 M UF/SP	85.13	68.1
5543	4675	2017-10-30	AUZ5041	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CESAR MACHADO DE AZEVEDO	19317	BR 386 KM 213,502	85.13	68.1
5544	4675	2017-10-30	AUZ5041	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CESAR MACHADO DE AZEVEDO	19317	BR 386 KM 213,502	104.13	83.3
5545	4675	2017-10-30	AUZ5041	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CESAR MACHADO DE AZEVEDO	19317	BR 386 KM 246,360	104.13	68.1
5546	1440	2017-10-30	CLH0477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ERS-122, KM 46,800/ FAIXA 2/ S~]AO VENDELINO- FARROUPILHA	104.12	83.2
5547	1440	2017-10-30	CLH0477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VANESSA PEREIRA SATIMO	10135	ERS 122 KM 46,800/ FAIXA 2 / SAO VANDELINO - FARROUPILHA	85.13	68.1
5548	4380	2017-10-30	AUA1816	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AECIO RUTSATZ	29241	BR 101 KM 212+350 M US/SC	104.13	68.1
5549	4840	2017-10-30	AWB7318	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	IVAN GONÇALVES RIBEIRO	22515	BR 364 KM 125,060	104.13	68.1
5550	3760	2017-10-30	AOO6619	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 020 KM 0,100	104.13	83.3
5551	6480	2017-10-30	AYZ4108	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	FABRICIO FRANCALINO DA SILVA	28704	Av.Rndon Pacheco x Av Dos Municipios SBC FX1	234.78	153.23
5552	6680	2017-10-29	PQX0724	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	GIOVANI FILHO PEREIRA DA SILVA	16	ROD PA 483 KM 14 CRESCENTE MARITUBA/PA	138.18	110.54
5553	4040	2017-10-28	ATD2721	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	EDIMAR BARBOSA DE BRITO	13364	CE 282 KM 95,1 IGUATU/CE	156.18	96
5554	7305	2017-10-27	BBN4853	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	GENIVALDO FRANCISCO FELIX DA SILVA	29339	DF003 KM 5 SENTIDO CRESCENTE	130.16	64
5555	4020	2017-10-27	ATD5602	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	RODOVIA BR 232- KM 58,9, POMBOS	104.13	83.3
5556	4020	2017-10-27	ATD5602	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JUCELIO FERREIRA DA SILVA	24123	RODOVIA BR 232 KM 58,9 POMBOS - SENTIDO GRAVATA	85.13	68.1
5557	4040	2017-10-26	ATD2721	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDIMAR BARBOSA DE BRITO	13364	CE 282, KM 95,0 - IGUATU/ CE	104.13	68.1
5558	4380	2017-10-26	AUA1816	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AECIO RUTSATZ	29241	BR 153 KM 472,300	104.13	68.1
5559	6660	2017-10-26	BAO7497	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELISANGELA LAVEZZO	22140	BR 070 KM 273,300	104.13	68.1
5560	5030	2017-10-26	AWG8644	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	SP 425 KM 162+200	149.41	119.53
5561	5010	2017-10-26	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	MCG 497 KM 14,2 UBERLNADIA FX 1SD	130.16	68.1
5562	1835	2017-10-26	NDB7020	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 354 KM 202,880	104.13	83.3
5563	2510	2017-10-25	APW1934	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	DOUGLAS CUNHA DE SOUZA	26939	TV LINDOLFO ARANHA C/AV DJALMA DUTRA ALLTAMIRA-PA	127.69	102.15
5564	4060	2017-10-24	ATD5630	TRANSITAR PELA CONTRAMÃO DE DIREÇÃO EM VIA COM DUPLO SENTIDO DE CIRCULAÇÃO	\N	\N	VIA LOCAL DA PE 60 PROX AO PC C049867 IPOJUCA CENTRO	127.69	102.15
5565	4060	2017-10-24	ATD5630	TRANSITAR PELA CONTRAMÃO DE DIREÇÃO EM VIA COM DUPLO SENTIDO DE CIRCULAÇÃO	\N	\N	VIA LOCAL DE PE 60 PROX AO PC C049867	156.19	124.95
5566	2300	2017-10-24	AOL2105	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ALESSANDRO MENESES RIBEIRO	23221	BR 116 KM 71 UF/CE - CRESCENTE	80	64
5567	3360	2017-10-23	ARO4464	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	ADRIANO COSTA LIMA 	26658	MS 156 KM 242 AMAMBAI/TACURU	104.12	83.3
5568	7135	2017-10-23	BBI3135	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 376 KM 131 PVAIMGA	191.53	153.22
5569	2710	2017-10-23	NDU9273	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	LEANDRO MARCOS DA CONCEICAO	29522	BR 364 KM 600 UF- RO - 06831	85.13	68.1
5570	820	2017-10-23	AHV3957	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	JOEL LUIZ DA SILVA	14	MG190 KM 126+30M	112.64	90.11
5571	3820	2017-10-21	ABJ1290	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR376 KM 131, PVAIMGA	101.09	0
5572	6655	2017-10-21	BAO7496	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SIDNEI MOREIRA BONFIM	29	BR 262 KM 371,460	104.13	68.1
5573	6000	2017-10-20	AWM5525	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 50%	\N	\N	BR 070 KM 539,830	704.33	459.69
5574	6190	2017-10-20	OUK8345	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	KM 39,80 GO 2017/ PIRACANJUBA- C. NOVAS.	104.13	83.3
5575	2760	2017-10-20	AQL7376	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR376, KM 131- PVAIMGA	372.41	297.93
5576	1835	2017-10-20	NDB7020	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	\N	\N	AV FERNANDO CORREA DA COSTA	104.13	83.3
5577	4325	2017-10-19	ATV6796	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO -330 KM 49/ CALTALAO - IPAMERI	104.13	68.1
5578	3630	2017-10-19	ASC4453	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 691,980	85.13	68.1
5579	2790	2017-10-19	LRK0860	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEDINEI FUSSINGER	\N	BR 158  KM 793,500	104.13	68.1
5580	4860	2017-10-19	AWC9135	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	WILSINER SILVA DE CARVALHO	138	AV. TAVERES BASTOS X AV. ALMIRANTE BARROSO	238.34	144
5581	1340	2017-10-18	AKX9332	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	JHONATA DA SILVA PEREIRA	30242	ROD. BA 026 KM 45 SUSSUARANA - CONTENTADA DO SINCORA	130.16	68.1
5582	7185	2017-10-18	BBJ6138	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 452 KM 48,700	104.13	68.1
5583	4685	2017-10-18	AUZ5722	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	ALCEU LUIS SIEGERT	19320	BR 376 KM 672 UF/PR - CRESCENTE	85.13	68.1
5584	5585	2017-10-18	AWN4330	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO WOEZELI FELISMINO DE MELO	\N	BR 116 KM 909+660M UF-BA	104.13	68.1
5585	7180	2017-10-17	BBH8858	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 376 KM 509 UF/PR - CRESCENTE	80	64
5586	4190	2017-10-17	AGZ0299	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	FELIPE MACIEL KUMM	30238	DETRAN PORTO ALEGRE RS	104.12	83.3
5587	6690	2017-10-17	BAT4371	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	MARGINAL PINHEIROS, PISTA EXPRESSA (C. BRANCO/INTERLAGOS, A MENOS 242 M DO KM 2 VIA DE TRANSITO RAPIDO	85.13	68.1
5588	6690	2017-10-17	BAT4371	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	MARGINAL PINHEIROS, PISTA EXPRESSA( C. BRANCO/INTERLAGOS), A MENOS 242M DO KM 2 VIA DE TRANSITO RAPIDO	104.13	83.3
5589	6455	2017-10-16	AYR9572	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCINALDO FIRMINO DA SILVA	111	BR 010 KM 17,220	104.13	68.1
5590	8005	2017-10-16	OUK8525	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	SANDOVAL DE JESUS FERNANDES	116	KM 100 GO 330 CATALÃO/ IPAMERI	104.13	83.3
5591	3230	2017-10-15	ARA4018	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	\N	\N	AV. MARCELINO PIRES, 3930, 1 PISO, TERM. RODOVIÁRIO, DOURADOD, MS, CEP 79800-003	156.18	102.15
5592	7285	2017-10-15	AYH2376	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 343,940	104.13	68.1
5593	3430	2017-10-15	ARS6311	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILIARD FERREIRA TIMOTEO	29442	BR 070 KM 66,115	104.13	68.1
5594	4300	2017-10-14	CKT5776	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	AMARO PEREIRA DA SILVA	29521	PREFEITURA MUNICIPAL DE RIO BRILHANTE	104.12	83.3
5595	1220	2017-10-14	AKI6988	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 070 KM 620,450	68.1	54.48
5596	2990	2017-10-13	AMX5243	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	VALMIR LIMA BORGES	16359	AV NOIDE CERQUEIRA PROX ENT BR 324 SBC	104.13	64
5597	3380	2017-10-12	ARP8608	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	EDUARDO HERNANDES	\N	PA 150 KM 395 MARABA/PA	156.18	124.94
5598	4220	2017-10-12	AGZ0305	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	EVANDRO PEREIRA RIBEIRO	245	BR 230 KM 212,600	156.18	96
5599	4390	2017-10-11	NCW5997	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SILVIO MEURER	\N	BR 364 KM 9,500	104.13	83.3
5600	2510	2017-10-11	APW1934	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS CUNHA DE SOUZA	26939	GO- 020 KM 42+800 M / CRISTIANOPOLIS/ GOIANIA	104.13	0
5601	6535	2017-10-11	OHR3002	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 263,900	104.13	68.1
5602	6670	2017-10-11	PQX0514	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	DOMINGOS CRUZ DOS SANTOS	105	RODOVIA MG223 KM 38	130.16	104.13
5603	3850	2017-10-10	ATA1130	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	\N	\N	GO 330 KM 102 URUTAI IPAMERI	104.13	83.3
5604	7240	2017-10-10	BBK8161	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	EDSON CONCEIÇAO DOS SANTOS	26661	BR 428 KM 189,400	120	96
5605	4870	2017-10-10	AWC1282	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSIMAR RONALDO DA SILVA	\N	BR 364 KM 387,700	104.13	68.1
5606	2770	2017-10-10	AQL7377	CONDUZIR O VEÍCULO COM EQUIPAMENTO OBRIGATÓRIO INEFICIENTE/INOPERANTE	EMERSON DA SILVA MEDEIROS	30182	AV.. DES JOSE NUNES DA CUNHA, S/N, BL. 14, PQ. DOS PODERES, CAMPO GRANDE, MS,	156.18	124.94
5607	4920	2017-10-09	AWF3249	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANDRE LUIZ COUTO NETO	23541	BR 070 KM 728,440	68.1	54.48
5608	1475	2017-10-08	NCT1713	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO DULTRA DE OLIVEIRA	17092	BR 364 KM 400,800	104.13	68.1
5609	775	2017-10-08	BWA8731	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROSIMAR BATISTA DA SILVA	20687	BR 364 KM 495,340	68.1	54.48
5610	7275	2017-10-07	BBM8419	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIR GOMES DA SILVA	19195	BR 373 KM 479,060	85.13	68.1
5611	7275	2017-10-07	BBM8419	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIR GOMES DA SILVA	19195	BR 373 KM 479,060	104.13	83.3
5612	3415	2017-10-06	ARR4616	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	\N	\N	KM 04 AC 40 RIO BRANCO	156.18	122.54
5613	5590	2017-10-06	AWO3560	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JAIRO PEREIRA MARTINS	16032	AV PROF EDNA DE ALBUQUERQUE AFFI PTE PASTOR SEBASTIANO DENT BAIRRO - CUIABA- MT	104.13	68.1
5614	6685	2017-10-06	BAQ4021	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 330 KM 046 IPAMERI, CATALAO	104.13	64
5615	1470	2017-10-06	NCT1613	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	\N	\N	ROD PA 252 KM 12 ABAETETUBA/PA	156.18	124.94
5616	6470	2017-10-05	AYZ4107	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	ALISSON DOS SANTOS ALVES	31035	AV. JOAO PAULO II X TRAV. HUMITA	238.34	234.78
5617	2970	2017-10-05	AQO0863	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR116 KM587+580M UF/BA	104.13	68.1
5618	855	2017-10-04	AII2592	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO DULTRA DE OLIVEIRA	17092	BR 364 KM 196,300	104.13	68.1
5619	4930	2017-10-04	AWF5880	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	\N	\N	AV BANDEIRANTES CRUZAMENTO R BARAO DO RIO BRANCO	127.69	102.15
5620	4930	2017-10-04	AWF5880	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	\N	\N	AV BANDEIRANTES CRUZAMENTO R BARAO DO RIO BRANCO	156.18	124.94
5621	8040	2017-10-03	OUM0586	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DAVI SERGIO DE SOUZA BRITO	16321	CE- 060 KM 513,7- JUAZEIRO DO NORTE	85.13	68.1
5622	1755	2017-10-02	NCT5109	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GISNEY ANDRADE SILVA	112	BR 414 KM 372,567	104.13	68.1
5901	4935	2017-06-08	AWG1781	ULTRAPASSAR PELA CONTRAMAO VEIC NAS PONTES, VIADUTOS, ETC	JOSE RAIMUNDO DE OLIVEIRA	224	BR 153, KM 397	180	144
5623	4835	2017-10-02	AWD7621	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELICARLOS DE OLIVEIRA SILVA	23932	BR324 KM523+528M UF/BA	104.13	68.1
5624	4830	2017-09-30	AWB7320	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	ROBSON HERMES DA SILVA	22392	PREFEITURA MUNICIPAL DE RIO BRILHANTE	85.12	68.1
5625	2280	2017-09-30	AOL4467	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADALTO PEREIRA DA SILVA	274	BR 153 KM 597,650	104.13	68.1
5626	6485	2017-09-29	AYZ8643	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GERALDO LAURIANO NASCIMENTO	141	GO - 020 KM 142+550 M / PIRES DO RIO/ URUTAI	138.82	68.1
5627	1570	2017-09-29	NCT1566	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DANIEL SOUZA ALMEIDA JUNIOR	28003	BR 324 KM 474,985	156.18	96
5628	1140	2017-09-29	AJW1071	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	\N	\N	CIRETRAN DE IPAMERI	156.18	124.94
5629	6455	2017-09-29	AYR9572	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCINALDO FIRMINO DA SILVA	111	BR 010 KM 17,220	85.13	68.1
5630	6455	2017-09-29	AYR9572	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCINALDO FIRMINO DA SILVA	111	BR010 KM17 .220	104.13	68.1
5631	6465	2017-09-28	AYY6578	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VERONILDO PEREIRA CUSTODIO	29204	CE - 060, KM 437,2 VARZEA ALEGRE CE	104.13	68.1
5632	7150	2017-09-28	BBI9759	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	RICARDO APARECIDO SANTOS SILVA	30401	AV P HENRIQUE BX R ESTADOS UNIDOS	311.63	153.23
5633	5010	2017-09-28	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 262 KM 371,460	104.13	68.1
5634	4830	2017-09-28	AWB7320	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	ROBSON HERMES DA SILVA	22392	AVENIDA BENJAMIM CONSTANT NUMERO1332	85.13	54.47
5635	5025	2017-09-27	AWE6135	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR  364 KM 10,390	156.18	124.94
5636	5025	2017-09-27	AWE6135	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 364 KM 10,390	120	96
5637	4665	2017-09-27	AUZ3716	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 50%	VOLNEI DE LARA	15512	BR 158 KM 505,950	704.33	459.69
5638	2900	2017-09-27	AQN2073	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE DIVINO SOARES DE ALMEIDA	218	BR 010 KM 131,100	104.13	68.1
5639	2400	2017-09-26	AOT5935	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RUAN FERREIRA DA SILVA	219	BR 414 KM 360,910	104.13	68.1
5640	1275	2017-09-26	AKO3699	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	BR 316 KM 745	85.13	68.1
5641	2870	2017-09-26	AQN2076	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	ADEILTON ALMEIDA DE CARVALHO	27689	RUA LANDULFO ALVES 40	156.18	0
5642	7150	2017-09-25	BBI9759	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	RICARDO APARECIDO SANTOS SILVA	30401	AV P B X R  ESTADOS UNIDOS	311.63	153.23
5643	4675	2017-09-25	AUZ5041	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CESAR MACHADO DE AZEVEDO	19317	AV.MANOEL ELIAS 768 - S/N - AIXA 2 CENTRAL	104.12	68.1
5644	1285	2017-09-25	AKP2741	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 158 KM 505,950	156.18	96
5645	2450	2017-09-24	ARG2227	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	\N	\N	CIDADE DE  INOCENCIA MS	127.69	102.15
5646	6035	2017-09-23	AWN1828	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	\N	\N	AVENIDA SAO PAULO PROXIMO AO POSTO REAL CENTRO	207.31	102.15
5647	6035	2017-09-23	AWN1828	DIRIGIR SOB INFLUENCIA ALCOOL NIVEL SUP. OU ENTORPECENTE	\N	\N	AVENIDA SÃO PAULO     SÃO JOSÉ DOS QUATRO MARCOS	2347.76	2348.56
5648	6035	2017-09-23	AWN1828	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	\N	\N	AVENIDA SÃO PAULO	156.18	102.15
5649	6550	2017-09-22	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	RUA LEOPOLDINO SANDER, 681 - BAIRRO - CENTRO - FX01	130.32	104.13
5650	6550	2017-09-22	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	RUA LEOPOLDO  SANDER , 681 - BAIRRO- CENTRO  FX 01	85.13	68.1
5651	6490	2017-09-22	AYY7260	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILSON MARTINS BORGES	\N	BR 020 KM 57,900	104.13	68.1
5652	1030	2017-09-21	AHN3351	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	EVANDSON CASTRO DO NASCIMENTO	10743	BR 080 KM 181,00	156.18	96
5653	6520	2017-09-21	AZO8479	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	SANDOVAL DE JESUS FERNANDES	116	GO 210, KM 16 TUVERLANDIA PARA MAURILANDIA	104.13	68.1
5654	6550	2017-09-20	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 116 - -6748 - KM 40,1 - LAJES/ CAXIAS DO SUL	104.12	83.3
5655	6550	2017-09-20	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 116 -6748 - KM 40,1 - LAJES/ CAXIARS DO SUL	85.13	68.1
5656	2370	2017-09-20	APD2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JONAS DO NASCIMENTO	27084	BR 116 KM 604+300M UF/BA	85.13	68.1
5657	990	2017-09-20	AJI4717	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO CONCEICAO DA SILVA	31111	CE- 060, KM  59,8 REDENÇÃO -CE	104.13	68.1
5658	3900	2017-09-20	AGZ0113	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 230 KM -12 UF/ PB DECRESCENTE	85.13	68.1
5659	7250	2017-09-19	BBK4948	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	RODOVIA PR 158 KM 90+100M SENTIDO DECRE	130.16	96
5660	6685	2017-09-18	BAQ4021	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO-330 KM 0+84M /IPAMERI/ / CATALAO	104.13	68.1
5661	4855	2017-09-18	AWC9082	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	NELSON LUIZ MARRA	25326	BR 376 KM 131 PVAIMGA	95.77	76.62
5662	7245	2017-09-18	BBK7415	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ABELARDO OLIVEIRA GUIMARAES FILHO	24312	AV AYRTON SENNA PRIXIMO  AO N5308 SCB	156.18	96
5663	7250	2017-09-18	BBK4948	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	\N	\N	PR 323 KM 309+100M	130.16	64
5664	6335	2017-09-18	AXY3202	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM - 774 UF/RO - CRESCENTE	85.13	68.1
5665	7240	2017-09-17	BBK8161	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	JULIO NERI DA SILVA	25607	BR 116 KM 408,000	80	64
5666	7250	2017-09-17	BBK4948	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	PR 170 KM 01+200M	130.16	68.1
5667	980	2017-09-16	MAA9532	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ITAMAR MOHR	30112	BR070 KM 277,720	104.13	68.1
5668	3910	2017-09-16	AGZ0115	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WANDERSON PEDREIRA ESTRELA	12527	BR 116 KM 16,440	104.13	68.1
5669	1130	2017-09-16	AJU4771	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	WILLIAN RODRIGO LOURENCO	344	GO 330, KM 146 URITAI, PIRES DO RIO	104.13	64
5670	6365	2017-09-16	AYB3788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 179,140	85.13	68.1
5671	6365	2017-09-16	AYB3788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 197,140	104.13	83.3
5672	3910	2017-09-15	AGZ0115	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WANDERSON PEDREIRA ESTRELA	12527	BR 222 KM 48,200	104.13	0
5673	3910	2017-09-15	AGZ0115	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WANDERSON PEDREIRA ESTRELA	12527	BR222 KM 48,200	85.13	68.1
5674	7005	2017-09-15	OUG5253	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	JOSYELL ALVES DE JESUS	179	BR 153 KM 410,050	120	96
5675	1715	2017-09-15	NCT2488	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 324 KM 475,500	104.13	68.1
5676	3955	2017-09-15	NDR8325	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 101 KM 206,890	85.13	68.1
5677	2260	2017-09-14	AOL4465	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	LUAN JAYLLY FREIRE DE BRITO	214	AV. CRONGE DA SILVEIRA X M BARATA BARCARENA/ PA	127.69	102.15
5678	2260	2017-09-14	AOL4465	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	LUAN JAYLLY FREIRE DE BRITO	214	AV. CRONGE DA SILVEIRA X M BARATA CARCARENA/PA	156.18	124.94
5679	2260	2017-09-14	AOL4465	DEIXAR O PASSAGEIRO DE USAR O CINTO SEGURANÇA	LUAN JAYLLY FREIRE DE BRITO	214	AV.CRONGE DE SILVEIRA X BARATA BARCARENA / PA	127.69	102.15
5680	2260	2017-09-14	AOL4465	DEIXAR O PASSAGEIRO DE USAR O CINTO SEGURANÇA	LUAN JAYLLY FREIRE DE BRITO	214	 AV. CRONGE DA SILVIRA X M BAATA BARCARENA	156.18	124.94
5681	6685	2017-09-14	BAQ4021	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	GO-020 KM 64/B. VISTA - CRISTIANÓPOLIS	156.18	96
5682	3490	2017-09-14	ASN2099	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALEXANDRE DE CARVALHO SEREN	21539	BR 364 KM 263,900	85.13	68.1
5683	3735	2017-09-14	ATN1590	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	NILTON RODRIGUES ALVES	27	MG 190 KM  126,30	116.86	93.49
5684	1080	2017-09-14	AJT1350	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	\N	\N	ROD. BA 120 KM 129 CANSANCAO - QUEIMADAS	130.16	68.1
5685	3580	2017-09-13	NCG7720	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	OZIEL CRUZ DE MACEDO	\N	BR 364 KM 276,00	104.13	68.1
5686	4395	2017-09-13	NCW1397	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	\N	\N	UMUARAMA-PR	195.23	156.18
5687	6685	2017-09-13	BAQ4021	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO 020 KM 103/ GOIANIA- S.CRUZ	104.13	83.3
5688	6685	2017-09-13	BAQ4021	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO- 020 KM 103/GOIANIA	85.13	68.1
5689	2690	2017-09-13	NEA0212	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIARLES ALVES ROCHA	257	BR 153 KM 197,650	104.13	68.1
5690	3730	2017-09-13	ASN1458	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	DAVI LIMA BEZERRA	109	BR153 KM 62 UF/SP-Crescente	85.13	68.1
5691	2225	2017-09-12	AOC4360	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO GUILHERME DE SILVA PAULA	\N	BR 364 KM 307,175	104.13	68.1
5692	8005	2017-09-12	OUK8525	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSON SILVA DE OLIVEIRA	254	BR381 KM 381,066	104.13	68.1
5693	6485	2017-09-11	AYZ8643	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	GERALDO LAURIANO NASCIMENTO	141	GO 330, KM 146 URITAI, PIRES DO RIO	104.13	64
5694	1275	2017-09-11	AKO3699	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	BR 407 KM 74,100	104.13	68.1
6279	6580	2017-01-02	AZY5793	DIRIGIR SEM ATENÇÃO OU SEM OS CUIDADOS INDISPENSÁVEIS À SEGURANÇA	\N	\N	GO 326 KM 037	42.57	34.06
5695	1275	2017-09-11	AKO3699	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	BR 407 KM 122,400	85.13	68.1
5696	2320	2017-09-09	NCJ8385	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	REGINALDO SOARES	\N	BR 153 KM 619,970	104.13	68.1
5697	4185	2017-09-08	NDZ3191	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GIBSON FERREIRA TAVARES	12054	BR 407 KM 74,100	85.13	68.1
5698	3635	2017-09-08	NCH3221	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SAMUEL VIANA NUNES	117	LMG 653 KM 12+000 MONTES CLAROS	0	0
5699	3635	2017-09-08	NCH3221	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SAMUEL VIANA NUNES	117	LMG 653 KM 12+000 MONTES CLAROS	85.13	68.1
5700	2540	2017-09-08	APZ1625	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	ROGERIO CONCEICAO DA SILVA	31111	RUA PEDRO PAULO CARNEIRO, SEM NUMERO	156.18	40
5701	3415	2017-09-08	ARR4616	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR163 KM733	85.13	0
5702	2510	2017-09-07	APW1934	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 20% ATÉ 50%	DOUGLAS CUNHA DE SOUZA	26939	PA 160 KM 3 PARAUAPEBAS PA	161.5	0
5703	4120	2017-09-06	AGZ0096	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	VALDECI ANTONIO PEREIRA	24677	\N	104.12	83.3
5704	4250	2017-09-05	AGZ0199	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 414 KM 331,280	104.13	83.3
5705	6685	2017-09-05	BAQ4021	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	\N	\N	GO 330, KM 102 IPAMERI, URUTAI	104.13	68.1
5706	3760	2017-09-05	AOO6619	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GECIMAR NASCIMENTO 	19	ROD ES-264 KM  121,1 SANTA MARIA DE JETIBA ES SENTIDO SANTA M. DE JETIBA FX 1	104.13	83.3
5707	610	2017-09-05	AGM5424	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	\N	\N	AV SETE DE SETEMBRO PX. A GAZI	207.31	165.85
5708	610	2017-09-05	AGM5424	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	MESSIAS LUIZ DOS SANTOS	21156	AV STE DE SETEMBRO  PX A GAZIN CENTRO	156.18	40
5709	180	2017-09-05	BXI5745	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	MESSIAS LUIZ DOS SANTOS	21156	AV 7 DE SETEMBRO  PX. A LOJA GAZIN CENTRO	156.18	40
5710	180	2017-09-05	BXI5745	ESTACIONAR EM DESACORDO COM A REGULAMENTAÇÃO ESPECIFICADA PELA SINALIZAÇÃO	\N	\N	AV, 7 DE SETEMBRO PX. A LOJA G	207.31	165.85
5711	7155	2017-09-04	BBJ3916	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 016 KM 382,+100M UF/MS	85.13	68.1
5712	4170	2017-09-02	NEC2988	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DANIEL GUIMARAES DOS SANTOS	\N	BR 364 KM 263,900	104.13	68.1
5713	3550	2017-09-02	ACZ1599	CONDUZIR O VEÍCULO COM CARACTERÍSTICA ALTERADA	LEANDRO CARNEIRO GOMES	25939	ROD. BA 120 KM 129 CANSACAO - QUEIMADAS	195.23	102.15
5714	2870	2017-09-02	AQN2076	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	ADEILTON ALMEIDA DE CARVALHO	27689	ROSA LIMA DOS SANTOS, 264  JOÃO PESSOA	313.01	234.78
5715	4745	2017-09-01	AVJ7601	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ROD. RSC 453 KM 16 SENTIDO CRUZEIRO DO SUL-MATO LEITÃO	130.15	104.12
5716	4745	2017-09-01	AVJ7601	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	ROD. RSC453 KM 16 SENTIDO A CRUZIEIRO DO SUL-MATO LEITÃO	138.82	68.1
5717	3585	2017-09-01	NCG7320	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	EDIMAR SANTOS DE SOUZA	20993	AV COM NORTE TAG QNA 01 SENT NORTE/SUL CRUZ 243	180	144
5718	6480	2017-09-01	AYZ4108	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ALRIVAN SANTANA DOS SANTOS	31332	BR 070 KM 287 UF/MT	130.16	104.13
5719	4705	2017-08-31	AVA3677	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	YAGO NOBRES DINIZ OLIVEIRA	25598	ROD. MC 383 KM 303	104.12	83.3
5720	6685	2017-08-31	BAQ4021	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 330, KM 102 IPAMERI, URUTAI	80	68.1
5721	5010	2017-08-30	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 854,485	104.13	68.1
5722	1420	2017-08-30	ALH0523	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	\N	\N	\N	195.23	156.18
5723	6515	2017-08-30	AZO8477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILSON PEREIRA DE MELO	344	BR 020 KM 57,900	104.13	83.3
5724	4665	2017-08-29	AUZ3716	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	VOLNEI DE LARA	15512	BR 373 KM 479,060	156.18	96
5725	6190	2017-08-28	OUK8345	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	\N	\N	AVENIDA  BRASIL OPOSTO AO N°3515	195.23	40
5726	2310	2017-08-28	AON5139	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	\N	\N	BR 376 KM-182 UF /PR - CRESCENTE	234.78	144
5727	6670	2017-08-28	PQX0514	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	DOMINGOS CRUZ DOS SANTOS	105	GO 330 KM 101	104.13	83.3
5728	4175	2017-08-27	NEC2978	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALMIR LIMA BORGES	16359	BR 116 KM 415,900	0	68.1
5729	4740	2017-08-26	IAO6299	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	ALESSANDRO MENESES RIBEIRO	23221	ROD BA 262 KM 439 BRUMADO-ARACATU	104.13	0
5730	6515	2017-08-26	AZO8477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILSON PEREIRA DE MELO	344	BR 020 KM 57,900	104.13	68.1
5731	900	2017-08-25	BTA9258	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AILTON NAZIAZENO ROSA	6566	BR 163 KM-502 UF/MS - CRESCENTE	85.13	68.1
5732	1340	2017-08-25	AKX9332	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	JOSE ROBERTO DA SILVA	28000	RUA FRANCISCO BATISTA	156.18	124.94
5733	1170	2017-08-24	AJC9719	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	BRUNO ALVES PEREIRA	135	GO - 010 KM 67+100M / L. BULHOES / SILVANIA	104.13	83.3
5734	6080	2017-08-24	OLF8027	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NOEL PINHEIRO DA CRUZ	26242	BR 110 KM 201,000	104.13	83.3
5735	7135	2017-08-24	BBI3135	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	\N	\N	PR182 KM 001	195.23	0
5736	4190	2017-08-24	AGZ0299	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FELIPE MACIEL KUMM	30238	BR116,. Km 34,2	104.12	68.1
5737	6065	2017-08-24	NBS7993	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 101 KM 262,040	104.13	68.1
5738	4685	2017-08-23	AUZ5722	ESTACIONAR VEIC NO PASSEIO, FAIXA DE PEDESTRES, ETC	ALCEU LUIS SIEGERT	19320	AVENIDA GENEROSO MARQUES N°739	195.23	0
5739	6685	2017-08-22	BAQ4021	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO330 KM102	104.13	1
5740	4020	2017-08-22	ATD5602	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JUCELIO FERREIRA DA SILVA	24123	BR 101, KM 4,500	104.13	68.1
5741	3350	2017-08-22	ARO4467	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	REGINALDO PEREIRA LEITE	275	RUA VITORIO C/TV JOÃO HIPOLITO	156	124.8
5742	4795	2017-08-21	AWA4718	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	SILVANO MOREIRA BONFIM	21	MG 190, KM 126,3	112.54	68.1
5743	3680	2017-08-21	ANX0075	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 230 KM 506,900	104.13	68.1
5744	4560	2017-08-20	NCW8B46	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 020 KM180,600	85.13	68.1
5745	1330	2017-08-19	AKX7952	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 324, KM 440,350	104.13	68.1
5746	4030	2017-08-19	ATD2714	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	BR 476, KM 275,00	104.13	68.1
5747	3830	2017-08-19	ARC1290	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 282, KM 95	104.13	68.1
5748	4990	2017-08-18	AWE1761	ESTACIONAR LOCAL/HORÁRIO DE ESTACIONAMENTO E PARADA PROIBIDOS PELA SINALIZAÇÃO	FABIANO BINI	2624	AEROPORTO  FRENTE SN	156.18	102.15
5749	7185	2017-08-18	BBJ6138	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEIDIMAR COSTA LIMA	23058	AV. DR LAMARTE P. DE AVELAR, N°2338, SENTIDO BR 050 - FX ESQUERDA  PAQUETA	104.13	83.3
5750	2680	2017-08-18	NEA0192	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	JOSEVALDO SILVA CERQUEIRA	30234	SP 330, KM 448	120	96
5751	3230	2017-08-18	ARA4018	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	\N	\N	AVENIDA MARCELINO PIRES N° 1740	50	0
5752	3230	2017-08-18	ARA4018	ESTACIONAR EM DESACORDO COM A REGULAMENTAÇÃO ESPECIFICADA PELA SINALIZAÇÃO	\N	\N	AV MARCELINO PIRES N 1740	127.69	102.15
5753	4300	2017-08-17	CKT5776	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	AMARO PEREIRA DA SILVA	29521	RUA PREF ATHAYDE NOGUEIRA, FRENTE A GAZIN.	104.12	0
5754	4705	2017-08-17	AVA3677	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	YAGO NOBRES DINIZ OLIVEIRA	25598	BR 364, KM 58,900	104.13	68.1
5755	370	2017-08-17	AHD3293	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMERSON PEDRO DOS SANTOS	11896	br 364, km 708,105	104.13	68.1
5756	370	2017-08-17	AHD3293	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMERSON PEDRO DOS SANTOS	11896	BR 364, Km 710,430	104.13	68.1
5757	4995	2017-08-16	AWE3542	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO020 KM 1+700M	104.13	0
5758	4995	2017-08-16	AWE3542	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO020 KM 1+7000M	104.13	0
5759	5035	2017-08-15	AWH6705	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	EVANDSON CASTRO DO NASCIMENTO	10743	BR 386, KM 424	80	64
5760	6325	2017-08-15	OVB4961	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	LUIZ FERNANDO RIBEIRO OLIVEIRA	28680	ROD BA 409 KM 16 SERRINHA- CONCEIÇÃO DO COITE	130.16	68.1
5761	5005	2017-08-14	AWE1751	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 163, KM 454	80	64
5762	3560	2017-08-14	ASZ1599	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	DAMARIO DE SOUZA OLIVEIRA	21778	BR 116, KM 383	1467.35	1173.88
5763	8005	2017-08-12	OUK8525	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSON SILVA DE OLIVEIRA	254	BR116 KM 537,950	104.13	68.1
5764	3830	2017-08-11	ARC1290	PARAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	JOSE CARLOS VIRGINIO DA SILVA	18243	Rua Padre Rolim Oposto18 Cen	195.23	0
5765	2510	2017-08-10	APW1934	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR 153 KM 241,900	104.13	83.3
5766	4840	2017-08-10	AWB7318	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	IVAN GONÇALVES RIBEIRO	22515	br 070, km 288	104.13	68.1
5767	3540	2017-08-10	ATA1599	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	\N	\N	CIRETRAN DE IPAMERI	156.18	124.94
5768	6515	2017-08-10	AZO8477	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	GECIMAR NASCIMENTO 	19	SANCERLANDIA CHOUPANA KM 63 RODOVIA GO 326	104.13	83.3
5769	2510	2017-08-10	APW1934	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR 010 KM 131,100	120	124.94
5770	6580	2017-08-09	AZY5793	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	KM112 GO213	104.13	83.3
5771	6680	2017-08-09	PQX0724	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ALLYSON BRUNO DIAS RODRIGUES DE ARAUJO	146	IPAMERI URUTAI KM 129 RODOVIA GO 330	80	83.3
5772	6675	2017-08-09	PQX0794	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	ISAAC BRUNO MARTINS SUCUPIRA	4	MGC 120 - KM 134,50	108.38	86.7
5773	6475	2017-08-09	AYZ5647	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VINICIUS LIMA BEZERRA	139	RODOVIA SP330, KM 184, SENTIDO AO NORTE	85.13	0
5774	7260	2017-08-09	BBK6724	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 262 KM 371,460	104.13	83.3
5775	7260	2017-08-09	BBK6724	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 262, KM 371,460	85.13	68.1
5776	3830	2017-08-08	ARC1290	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	\N	\N	LOCAL DA INFRAÇÃO: AV DANTAS BARRETO.	195.23	0
5777	1120	2017-08-07	AJU1034	ESTACIONAR IMPEDINDO A MOVIMENTAÇÃO DE OUTRO VEÍCULO	RUDNEY ALVES MAGALHAES JUNIOR	21056	RUA CEVELANDIA, 138	130.16	68.1
5778	6515	2017-08-05	AZO8477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GECIMAR NASCIMENTO 	19	GO - 330 KM 0+790 KM / CATALAO /IPAMERI	104.13	68.1
5779	990	2017-08-03	AJI4717	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JAIR COSTA FIGUEREDO	28604	CE 060, KM 437,2	104.13	68.1
5780	3850	2017-08-03	ATA1130	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	LEANDRO DA SILVA	280	BR 365 KM 345,300	156.18	124.94
5781	3635	2017-08-03	NCH3221	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	SAMUEL VIANA NUNES	117	BR 470, KM 35,000	156.18	96
5782	4665	2017-08-02	AUZ3716	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	VOLNEI DE LARA	15512	PORTO ALEGRE	156.18	0
5783	2740	2017-08-02	NDN5483	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	SIDNEI MOREIRA BONFIM	29	BR 376 KM 131 PVAIMGA	101.09	80.87
5784	1070	2017-08-01	AJS5294	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	\N	\N	CIRETRAN DE IPAMERI	156.18	124.94
5785	1140	2017-08-01	AJW1071	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SERGIO RAEL FERREIRA	252	BR010 KM 131,100	104.13	0
5786	1575	2017-08-01	NCU2477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	REINAILDO ALVES RODRIGUES	30406	BR116 KM 818+955	104.13	0
5787	3900	2017-08-01	AGZ0113	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	MANOEL EVANGELISTA GONCALVES DE JESUS	18776	RV CE 060 KM 368, EM FRENTE, PFF, IGUATU 1411-7 IGUATU/CE	104.13	83.3
5788	4945	2017-07-31	AWH4450	RETIRAR DO LOCAL VEÍCULO LEGALMENTE RETIDO PARA REGULARIZAÇÃO. SEM PERMISSÃO	ALCIDES FELICIANO SILVA	24376	RODIA SP255 KM 026, SENTIDO AO NORTE	191.54	153.23
5789	6065	2017-07-31	NBS7993	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS DE SOUZA	38	BR 428, KM 189,400	104.13	68.1
5790	6205	2017-07-30	NCG1968	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDUARDO JOSE EUZEBIO	\N	BR 364 KM 58,900	104.13	68.1
5791	1870	2017-07-30	NDF5570	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDUARDO JOSE EUZEBIO	\N	BR 364, KM 56,400	104.13	68.1
5792	4550	2017-07-30	NDB3955	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	VALMIR LIMA BORGES	16359	BR407KM 74,100	120	0
5793	4100	2017-07-30	AAV7009	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMILIO VALDEMIR GUION	\N	BR070 KM 428,440	104.13	68.1
5794	4800	2017-07-29	AWA4714	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 695,970	104.13	68.1
5795	2400	2017-07-28	AOT5935	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	\N	\N	GERENCIA DE TECNOLOGIA DA INFORMAÇÃO	156.18	124.94
5796	4755	2017-07-28	MAX8035	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 010, KM 245,620	104.13	68.1
5797	6670	2017-07-28	PQX0514	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	DOMINGOS CRUZ DOS SANTOS	105	MGC 120 KM 134,50	112.64	90.11
5798	2500	2017-07-28	APS5203	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	\N	\N	GERENCIA DE TECNOLOGIA DA INFORMAÇÃO	156.18	124.94
5799	5010	2017-07-28	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR267 KM124,880	104.13	68.1
5800	6255	2017-07-28	OVB2741	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	TABAJARA SOARES BOAVENTURA NETO	27346	BR 407 KM 74,100	120	124.94
5801	3270	2017-07-27	NCO9565	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSON DA SILVA	11039	BR 364, KM 420,190	85.13	85.13
5802	2540	2017-07-27	APZ1625	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE ROBERTO DA SILVA	28000	BR 324, KM 522,600	104.13	68.1
5803	6355	2017-07-27	OVC2786	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	MOISES OLIVEIRA CARNEIRO	27690	PRACA DR JOSE GONÇALVES	50	40
5804	2280	2017-07-26	AOL4467	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	\N	\N	VPAT VUPT DETRAN/GO	156.18	96
5805	6605	2017-07-25	BAE8370	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCOS GODOY DE LIMA	6248	BR364 KM 58,900	133.44	68.1
5806	3100	2017-07-23	AQP6136	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIRO CARLOS PEREIRA	22	BR267 KM 124,880	104.13	0
5807	430	2017-07-22	AEW8486	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE BENEDITO DA SILVA	22230	BR070 KM 277,720	104.13	0
5808	1420	2017-07-22	ALH0523	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VILSON BARBOSA	1130	BR070KM 539,830	104.13	68.1
5809	6195	2017-07-21	NCE0717	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR364 KM-600 UF/RO - DECRESCENTE	130.16	0
5810	3600	2017-07-21	ASB6672	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	SP 270, KM 374	85.13	68.1
5811	6080	2017-07-20	OLF8027	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE RAIMUNDO DE OLIVEIRA	224	BR 116 KM 415,900	104.13	83.3
5812	4040	2017-07-20	ATD2721	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDIMAR BARBOSA DE BRITO	13364	BR423 KM 95,100	104.13	68.1
5813	4120	2017-07-20	AGZ0096	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALDECI ANTONIO PEREIRA	24677	RS122, KM 46,800	104.12	68.1
5814	3750	2017-07-19	ATF1590	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	JOSE NILSON DOS SANTOS	28	SP294, KM454	85.13	68.1
5815	3750	2017-07-19	ATF1590	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NILSON DOS SANTOS	28	SP 294, KM 454	131.46	68.1
5816	1120	2017-07-19	AJU1034	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	RUDNEY ALVES MAGALHAES JUNIOR	21056	AV. BRASIL, 821 SENTIDO B/C - FAIXA 1	130.16	0
5817	2205	2017-07-19	ANV3726	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR364KM 223 UF/MT	130.16	0
5818	6195	2017-07-18	NCE0717	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR364 KM 340,070	156.18	0
5819	5585	2017-07-17	AWN4330	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 163 KM 323,39 RIO BRILHANTE MS	146.12	64
5820	6085	2017-07-17	OLF5495	DEIXAR DE REDUZIR A VELOC ONDE O TRÂNSITO ESTEJA SENDO CONTROLADO PELO AGENTE	\N	\N	ARAGUAPAZ, ENTRONCAMENTO GO 070, KM RODOVIA GO 530	156.18	102.15
5821	2990	2017-07-17	AMX5243	ESTACIONAR EM LOCAL/HORÁRIO PROIBIDO ESPECIFICAMENTE PELA SINALIZAÇÃO	NOEL PINHEIRO DA CRUZ	26242	RUA PEDRO PAULO CARNEIRO, S/N°	104.13	68.1
5822	3540	2017-07-14	ATA1599	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	FAUSTO DE OLIVEIRA GOMES	205	BR 135, KM 309,100	156.18	96
5823	3430	2017-07-14	ARS6311	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GENIVALDO FRANCISCO FELIX DA SILVA	29339	BR 364, KM 55,000	104.13	68.1
5824	7285	2017-07-14	AYH2376	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 487 KM 229,1, MULTA OCORRIDA DIA 14/05/2017	201.06	160.85
5825	2680	2017-07-14	NEA0192	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	TABAJARA SOARES BOAVENTURA NETO	27346	BR407 KM 74,100	156.18	0
5826	2710	2017-07-12	NDU9273	DIRIGIR VEÍCULO UTILIZANDO-SE DE TELEFONE CELULAR	RONI CESAR NAZARIO	17446	AV. 25 DE AGOSTO, 5085	85.13	68.1
5827	6470	2017-07-12	AYZ4107	DEIXAR DE INDICAR C/ ANTEC. MED GESTO DE BRAÇO/LUZ INDICADORA. MUDANÇA DIREÇÃO	JOSYELL ALVES DE JESUS	179	GO 330, KM 101	156.18	102.15
5828	4370	2017-07-12	ATZ2095	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	DIOMARIO PEDRO DE OLIVEIRA	30310	RODOVIA BA 263 KM 20 BR 116 - BELO CAMPO	207.31	0
5829	3900	2017-07-11	AGZ0113	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 232, KM 91	104.13	68.1
5830	4630	2017-07-09	LWH5539	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	CARLOS GILBERTO BOCATTO	7	MG 190 KM107	104.12	0
5831	7055	2017-07-09	OUJ6448	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS DE SOUZA	38	BR116 KM 909,660	85.13	68.1
5832	3025	2017-07-08	NCS9802	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALRIVAN SANTANA DOS SANTOS	31332	BR 452, KM 48,700	104.13	68.1
5833	925	2017-07-07	CGR3558	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DEVALDINO PEDRO TORRES	11	MG 653, KM 12,400	104.12	0
5834	3025	2017-07-07	NCS9802	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 459, KM 84,985	104.13	68.1
5835	3750	2017-07-07	ATF1590	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NILSON DOS SANTOS	28	BR 470, KM 65,001	104.13	68.1
5836	3850	2017-07-06	ATA1130	DEIXAR DE INDICAR MEDIANTE GESTO REALIZACAO DE MANOBRA	WILSON SILVA DE OLIVEIRA	254	GO 330, KM 101	156.18	96
5837	4800	2017-07-05	AWA4714	DEIXAR DE REDUZIR A VELOC ONDE O TRÂNSITO ESTEJA SENDO CONTROLADO PELO AGENTE	ROGERIO FERREIRA	20	BR487 KM-6	195.23	15618.4
5838	2980	2017-07-04	IPE2395	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	CLAUDEMIRO CARLOS PEREIRA	22	BR153 KM 502 GO - CRESCENTE	130.16	104.13
5839	6465	2017-07-03	AYY6578	AVANÇAR O SINAL VERMELHO DO SEMÁFORO	NOEL PINHEIRO DA CRUZ	26242	RUA CEL TIBERIO MEIRA	293.47	0
5840	6485	2017-07-03	AYZ8643	DEIXAR DE ADENTRAR ÀS ÁREAS DESTINADAS À PESAGEM DE VEÍCULOS	GERALDO LAURIANO NASCIMENTO	141	MG120 KM 352	156.18	0
5841	4120	2017-07-03	AGZ0096	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FELIPE MACIEL KUMM	30238	BR 293, KM 178,370	104.13	68.1
5842	8050	2017-07-03	OUM7977	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	CARLOS GILBERTO BOCATTO	7	MG 190 KM 126,30	189.24	151.39
5843	6685	2017-07-03	BAQ4021	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO 330, KM 143,800	85.13	68.1
5844	2890	2017-07-02	AQN2080	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ADALTO PEREIRA DA SILVA	274	SP425 SP 123	120	0
5845	3570	2017-07-02	AGZ2050	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	BRUNO ALVES PEREIRA	135	BR 153 KM 33,080	68.1	54.48
5846	8050	2017-07-02	OUM7977	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	CARLOS GILBERTO BOCATTO	7	BR376 KM 131 PVAIMGA	121.69	97.35
5847	3340	2017-07-01	ARO4462	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	GO 010, KM 67,350	104.13	68.1
5848	3430	2017-06-30	ARS6311	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	JOÃO LAURINDO MOREIRA	26522	AVENIDA ANIBAL DE TOLEDO	50	40
5849	4935	2017-06-30	AWG1781	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	JOSE RAIMUNDO DE OLIVEIRA	224	AV. PEDRO ALVARES CABRAL x TRAV. DOM PEDRO I	193.47	144
5850	1215	2017-06-28	AKG2145	TRANSITAR C/ VEÍC E/OU CARGA C/ DIMENSÕES SUPERIORES LIMITE LEGAL S/ AUTORIZAÇÃO	\N	\N	TO 373, KM 113	195.23	156.18
5851	6520	2017-06-27	AZO8479	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO BONFIM DOS ANJOS NETO	220	GO 330,  KM 54	104.13	68.1
5852	2530	2017-06-26	APU6320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	AV. DR. LAMARTINE P. DE AVELAR, N° 2338	85.13	68.1
5853	2770	2017-06-26	AQL7377	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	EMERSON DA SILVA MEDEIROS	30182	BR376 KM131	191.53	0
5854	1070	2017-06-26	AJS5294	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR 153 KM 432,900	156.18	96
5855	4365	2017-06-26	ATY5536	DIRIGIR  VEÍCULO SEGURANDO TELEFONE CELULAR	\N	\N	AVENIDA JUSCELINO KUBBITSCHEK	293.47	234.78
5856	4860	2017-06-25	AWC9135	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSINER SILVA DE CARVALHO	138	RJ 116, KM 109	13.15	0
5857	7165	2017-06-24	BBI9838	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	JONATAS PEREIRA DELMONDES	30181	BR163 KM-363 UF/MS - CRESCENTE	80	0
5858	2690	2017-06-24	NEA0212	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIARLES ALVES ROCHA	257	BR 153, KM 432,200	104.13	68.1
5859	6455	2017-06-24	AYR9572	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCINALDO FIRMINO DA SILVA	111	GO 330 KM 147	104.13	68.1
5860	1565	2017-06-24	AJA1857	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR101 KM 153,050	104.13	0
5861	1030	2017-06-24	AHN3351	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEANDRO DA SILVA	280	BR 230, KM 212,600	104.13	68.1
5862	5020	2017-06-23	AWE5894	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	\N	\N	RUA PIRACICABA, 594	127.69	102.15
5863	6035	2017-06-22	AWN1828	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR364 KM 416,250	69.1	0
5864	1070	2017-06-22	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR381 KM 358,500	104.13	0
5865	2640	2017-06-22	NDU0332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EVANDRO PEREIRA RIBEIRO	245	BR080 KM 181,000	85.13	0
5866	4070	2017-06-22	ATD8970	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANDERSON MENESES SANT ANA	323	BR 365 KM 475,500	104.13	83.3
5867	2840	2017-06-21	AQN5336	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JHONE GONCALVES MEIRELES	24317	PI 113, KM 11,720	104.13	0
5868	6470	2017-06-21	AYZ4107	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCIO RODRIGUES	21245	BR-293 KM 179,370	85.13	0
5869	3710	2017-06-21	AHJ5474	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR-101 KM 131,100	85.13	0
5870	7135	2017-06-20	BBI3135	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	ALCIDES FELICIANO SILVA	24376	BR376 KM131	90.45	72.36
5871	2900	2017-06-20	AQN2073	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE DIVINO SOARES DE ALMEIDA	218	BR 153, KM 71,700	104.13	0
5872	4495	2017-06-20	NCI9945	DESOBEDECER ÀS ORDENS EMANADAS DA AUTORID COMPET DE TRÂNSITO OU DE SEUS AGENTES	REGINALDO KER SABINO	14426	AV. MONTE CASTELO, 1012	127.69	102.15
5873	8040	2017-06-20	OUM0586	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DAVI SERGIO DE SOUZA BRITO	16321	BR 101KM262,040	104.13	0
5874	2235	2017-06-19	IIU8889	MULTA ANTT	\N	\N	MULTA ANTT	0	440
5875	3785	2017-06-19	AFR3130	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NILSON DOS SANTOS	28	LMG 635 KM 12+000 MONTES CLAROS	104.12	0
5876	4030	2017-06-19	ATD2714	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	BR487 KM 229,100	104.13	0
5877	1140	2017-06-16	AJW1071	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SERGIO RAEL FERREIRA	252	BR 153 KM 391,800	104.13	68.1
5878	2395	2017-06-16	AOQ7980	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO FERREIRA	20	BR 376, KM 650,800	130.16	68.1
5879	4665	2017-06-16	AUZ3716	ESTACIONAR LOCAL/HORÁRIO DE ESTACIONAMENTO E PARADA PROIBIDOS PELA SINALIZAÇÃO	VOLNEI DE LARA	15512	\N	127.69	0
5880	4665	2017-06-16	AUZ3716	ESTACIONAR LOCAL/HORÁRIO DE ESTACIONAMENTO E PARADA PROIBIDOS PELA SINALIZAÇÃO	VOLNEI DE LARA	15512	AVENIDA FLORES DA CUNHA ESQUINA FREDERICO RITTER	156.18	0
5881	7005	2017-06-16	OUG5253	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	TIAGO BATISTA DA SILVA	137	GO 010, KM 187	120	0
5882	6080	2017-06-16	OLF8027	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	IGOR MATHEUS SILVA FERNANDES	12658	RV CE 257 KM 205	156.18	102.15
5883	4935	2017-06-16	AWG1781	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE RAIMUNDO DE OLIVEIRA	224	BR-158 KM 505,950	68.1	0
5884	3750	2017-06-15	ATF1590	FORÇAR PASSAGEM ENTRE VEÍCS TRANS SENT OPOSTOS NA IMINÊNCIA REALIZ ULTRAPASSAGEM	JOSE NILSON DOS SANTOS	28	BR 101, KM 190	1915.38	1532.3
5885	4535	2017-06-14	NDB4395	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	ISMAEL ARAUJO DA PAIXAO	147	AVENIDA MAXIMINIO PORPINO FRENTE AO N° 1808	0	0
5886	4535	2017-06-14	NDB4395	DESOBEDECER ÀS ORDENS EMANADAS DA AUTORID COMPET DE TRÂNSITO OU DE SEUS AGENTES	ISMAEL ARAUJO DA PAIXAO	147	ENIDA MAXIMINIO PORPINO N° 1808 CASTANHAL PA	0	0
5887	5010	2017-06-13	AWE3538	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	MS162KM50	1173.88	0
5888	4200	2017-06-13	AGZ0188	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	HERITO PEREIRA GOMES SANTOS	149	ROD/PA 447 KM 14 CONCEIÇÃO DO ARAGUAIA/PA	156.18	124.94
5889	515	2017-06-12	LWU8833	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 153, KM 497	80	64
5890	1080	2017-06-12	AJT1350	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	JOSIMARIO JOAO DOS SANTOS	28426	\N	80	0
5891	2650	2017-06-12	NEA0262	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JHONATA DA SILVA PEREIRA	30242	BR 101 KM 147,170	104.13	0
5892	6360	2017-06-12	OVC2581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GENESIS NASCIMENTO ARAUJO	24772	CE-366 KM 3,8	104.13	0
5893	6190	2017-06-11	OUK8345	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 362, KM 153	80	64
5894	1330	2017-06-11	AKX7952	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 365 KM 404.300	156.18	96
5895	4100	2017-06-11	AAV7009	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	BRUNO HENRIQUE DOS SANTOS	37	BR 163, KM 48	80	64
5896	4220	2017-06-11	AGZ0305	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALDO SOARES DE ABREU	251	BR 153 KM 357,200	104.13	0
5897	4220	2017-06-11	AGZ0305	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALDO SOARES DE ABREU	251	BR153 KM 391,800	104.13	0
5898	6485	2017-06-09	AYZ8643	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GERALDO LAURIANO NASCIMENTO	141	BR153 KM 280,784	104.13	0
5899	4915	2017-06-09	AWF5881	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELTON SANTANA DA SILVA	22086	BR 364 KM 13,781	104.13	0
5900	6275	2017-06-09	OUY9951	DEIXAR GUARDAR DIST SEGURANÇA LAT/FRONT ENTRE SEU VEÍCULO E DEMAIS E AO BORDO PISTA	LEANDRO VIEIRA	3	BR 364, KM 453	127.69	102.15
5902	5020	2017-06-08	AWE5894	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR163 KM 617,200	104.13	0
5903	6515	2017-06-08	AZO8477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEANDRO DA SILVA	280	RJ 116, PROX KM 109 SENT. BOM JARDIM	130.15	68.1
5904	4935	2017-06-08	AWG1781	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE RAIMUNDO DE OLIVEIRA	224	BR153 KM 71,700	104.13	0
5905	2640	2017-06-08	NDU0332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EVANDRO PEREIRA RIBEIRO	245	BR153 KM 296,400	156.18	0
5906	3520	2017-06-08	AKY9654	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONI ALFREDO PEREIRA NUNES	26570	BR381, KM568,890	130.16	68.1
5907	2640	2017-06-07	NDU0332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EVANDRO PEREIRA RIBEIRO	245	BE226 KM 39,830	104.13	0
5908	3520	2017-06-07	AKY9654	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RONI ALFREDO PEREIRA NUNES	26570	BR381, KM 568,890	130.16	68.1
5909	7005	2017-06-07	OUG5253	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TIAGO BATISTA DA SILVA	137	GO 154, KM 121,800	85.13	68.1
5910	1410	2017-06-07	ALH2052	ESTACIONAR NOS ACOSTAMENTOS	JORDANIO PAULO PEREIRA DOS SANTOS	114	BR 116, KM 459	53.21	42.57
5911	3600	2017-06-07	ASB6672	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR272 KM 522,050	156.18	0
5912	4665	2017-06-07	AUZ3716	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VOLNEI DE LARA	15512	BR 470, KM 73	104.13	0
5913	4665	2017-06-07	AUZ3716	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VOLNEI DE LARA	15512	BR 870 KM 65,001	104.13	0
5914	6335	2017-06-06	AXY3202	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364, KM 708,105	104.13	0
5915	2600	2017-06-06	NDT8022	ESTACIONAR VEIC NO PASSEIO, FAIXA DE PEDESTRES, ETC	EVERTON MELCHIOR	21099	AV. GENEROSO MARQUES, 739	195.23	0
5916	2600	2017-06-06	NDT8022	ESTACIONAR VEIC NO PASSEIO, FAIXA DE PEDESTRES, ETC	EVERTON MELCHIOR	21099	AV.GENEROSO MARQUES, 739	195.23	156.18
5917	5020	2017-06-06	AWE5894	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR163 KM 307,100	104.13	0
5918	3520	2017-06-06	AKY9654	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	RONI ALFREDO PEREIRA NUNES	26570	R BENTO FERREIRA, 141 - MERCES	234.78	64
5919	2890	2017-06-06	AQN2080	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	ADALTO PEREIRA DA SILVA	274	ROD PA 252, KM 12 ABAETETUBA- PA	156.18	124.94
5920	2400	2017-06-06	AOT5935	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	RUAN FERREIRA DA SILVA	219	ROD.PA 252, KM 12 ABAETETUBA/PA	156.18	124.94
5921	2400	2017-06-06	AOT5935	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	RUAN FERREIRA DA SILVA	219	ROD. PA 252 , KM 12 ABAETETUBA /PA	156.18	124.94
5922	2280	2017-06-05	AOL4467	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUAN JAYLLY FREIRE DE BRITO	214	GO330 KM 57+300	104.13	0
5923	1180	2017-06-05	AJC8792	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	TIAGO DIAS BORGES DA SILVA	129	GO330 KM 57+300	85.13	0
5924	3635	2017-06-05	NCH3221	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SAMUEL VIANA NUNES	117	BR226 KM 39,830	85.13	0
5925	450	2017-06-05	AFC3176	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	JONAS SILVA RIBEIRO	24160	BR 163 KM992 UFPA - CRESCENTE	156.18	124.94
5926	450	2017-06-05	AFC3176	CONDUZIR VEÍC COM VIDRO TOTAL/PARCIALMENTE COBERTO POR PELÍCULA. PAINÉIS/PINTURA	JONAS SILVA RIBEIRO	24160	BR 163 KM 992 UFPA- CRESCENTE	156.18	124.94
5927	450	2017-06-05	AFC3176	TRANS COM VEÍCULO DESAC C/ESPECIFICAÇÃO/FALTA DE INSCR/SIMBOLOGIA NECESSÁRIA IDENTIF	JONAS SILVA RIBEIRO	24160	BR 163 KM 992 UFPA - CRESCENTE	156.18	124.94
5928	2225	2017-06-04	AOC4360	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR163 KM 751,670	104.13	68.1
5929	8020	2017-06-04	OUK0433	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	VALMIR LIMA BORGES	16359	BR 116 KM 418,350	234.78	187.82
5930	3270	2017-06-03	NCO9565	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSON DA SILVA	11039	BR364 KM 420,190	85.13	0
5931	3670	2017-06-03	ANX0071	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	JOSE SERGIO BANDEIRA DE LIMA	25339	Av. Desembargador Moreira X Av. da Abolição	80	64
5932	6330	2017-06-02	OVB7350	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSEMAR SILVA DE LIMA	21082	BR 407, KM 74,100	104.13	0
5933	5010	2017-06-01	AWE3538	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR163 KM  550,010	104.13	0
5934	6435	2017-06-01	AYK5627	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROMILSON ALMEIDA DA SILVA	25603	BR407 KM 74,100	104.13	0
5935	7015	2017-06-01	OUG7788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DANIEL SOUZA ALMEIDA JUNIOR	28003	br 116 km 376.367	104.13	68.1
5936	1755	2017-05-31	NCT5109	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CASSIO FERNANDES MARTINS	249	BR 135, KM 21,150	85.13	0
5937	2500	2017-05-31	APS5203	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILLIAM PEREIRA DA SILVA	283	BR153 KM 432,900	104.13	0
5938	6515	2017-05-31	AZO8477	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	LEANDRO DA SILVA	280	ES 165 KM 119	156.18	96
5939	4930	2017-05-30	AWF5880	MULTA,POR NÃO IDENTIFICAÇÃO DO CONDUTOR INFRATOR, IMPOSTA A PESSOA JURÍDICA	VICENTE DE PAULO FERREIRA	14115	AV. LEONOR DE OLIVEIRA, 251	104.13	64
5940	2270	2017-05-30	AOL4462	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	HERMES MEDEIROS DE OLIVEIRA	13975	\N	85.13	0
5941	4465	2017-05-30	AUB3552	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	LUIZ CARLOS MORAES	22435	AVENIDA FERNANDO CORREA DA COSTA 4695 - CUIABA-MT	104.13	68.1
5942	2840	2017-05-27	AQN5336	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JHONE GONCALVES MEIRELES	24317	BR  146 KM 83,261	104.13	83.3
5943	2620	2017-05-26	NDT8132	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	YAGO NOBRES DINIZ OLIVEIRA	25598	Av. Brasil, 1375	195.23	156.18
5944	2840	2017-05-25	AQN5336	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	JHONE GONCALVES MEIRELES	24317	BR365 KM 382,040	156.18	0
5945	2840	2017-05-24	AQN5336	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JHONE GONCALVES MEIRELES	24317	BR146 KM 83,261	85.13	0
5946	805	2017-05-24	KDL3292	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIO CLEVIS BARROS	132	BR153 KM 343	85.13	0
5947	4860	2017-05-23	AWC9135	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	WILSINER SILVA DE CARVALHO	138	BR153 KM 208	957.69	0
5948	6515	2017-05-23	AZO8477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEANDRO DA SILVA	280	GO-330 KM 57	85.13	0
5949	6515	2017-05-23	AZO8477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEANDRO DA SILVA	280	GO-330 KM 57,300	104.13	0
5950	3570	2017-05-23	AGZ2050	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ARLINDO JOSE CARDOSO DE SOUSA NEVES	213	BR365 KM 404,300	104.13	0
5951	1070	2017-05-22	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIARLES ALVES ROCHA	257	BR060 KM 126,900	104.13	0
5952	6665	2017-05-22	PQX0454	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	GILSON SOUZA	106	BR 153 KM 71,800	120	124.94
5953	6455	2017-05-22	AYR9572	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	FRANCINALDO FIRMINO DA SILVA	111	\N	156.18	0
5954	830	2017-05-21	AIA5463	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LAERCIO IRIAS DE SOUZA	17601	BR364 KM 287	85.13	0
5955	2530	2017-05-20	APU6320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR414 KM331,854	104.13	0
5956	2620	2017-05-20	NDT8132	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	YAGO NOBRES DINIZ OLIVEIRA	25598	BR364 KM 255	80	0
5957	820	2017-05-20	AHV3957	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 407 KM 74,100	156.18	124.94
5958	820	2017-05-20	AHV3957	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	EDSON PEREIRA DE SOUZA	36	BR407 KM 47,100	120	0
5959	1140	2017-05-20	AJW1071	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	SERGIO RAEL FERREIRA	252	RODOVIA PA150 KM09 MAJU/PA	104.13	83.3
5960	4915	2017-05-19	AWF5881	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELTON SANTANA DA SILVA	22086	BR 364 KM 123,670	104.13	0
5961	2290	2017-05-19	AOL4468	CONDUZIR O VEÍCULO COM CARACTERÍSTICA ALTERADA	GILMAR OLIVEIRA SOUZA	25063	RV CE 293 KM 17	195.23	156.18
5962	4920	2017-05-18	AWF3249	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTENOR DOS SANTOS LIMA JUNIOR	21094	BR163 KM 824,135	104.13	0
5963	3810	2017-05-18	AEQ1440	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	JOAO WOEZELI FELISMINO DE MELO	\N	BR158 KM505,950	104.13	0
5964	7075	2017-05-17	OUK2422	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ZENO SALDANHA DOS SANTOS	12698	BR364 KM 600	80	0
5965	4945	2017-05-17	AWH4450	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	ALCIDES FELICIANO SILVA	24376	BR376 KM131	95.77	0
5966	8000	2017-05-17	OUL4282	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSEVALDO SILVA CERQUEIRA	30234	BR 407 KM 74,100	104.13	83.3
5967	820	2017-05-17	AHV3957	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	EDSON PEREIRA DE SOUZA	36	\N	156.18	0
5968	950	2017-05-17	AIY4742	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MIGUEL AGUIAR RIBEIRO	4	LMG653 KM 12+000	104.12	0
5969	1420	2017-05-16	ALH0523	MULTA ANTT	\N	\N	RODOVIA BR - 101 KM 464 METRO 975	1000	800
5970	1420	2017-05-16	ALH0523	MULTA ANTT	\N	\N	RODOVIA BR 101 KM 464 METRO 975	1500	1200
5971	6490	2017-05-15	AYY7260	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	EDENILSON HENNEMANN JORDÃO	35	BR-376 KM 672	104.13	0
5972	7070	2017-05-14	OUK4212	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DESLIGADO	Desligado	BR101 KM 262,040	104.13	0
5973	4845	2017-05-14	AWC1346	CONDUZIR VEÍC COM VIDRO TOTAL/PARCIALMENTE COBERTO POR PELÍCULA. PAINÉIS/PINTURA	MARCOS FERREIRA DA ROCHA	\N	BR 158 KM 789 UFMT	156.18	124.94
5974	4920	2017-05-13	AWF3249	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ANTENOR DOS SANTOS LIMA JUNIOR	21094	BR070 KM 275,500	156.18	0
5975	820	2017-05-12	AHV3957	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON PEREIRA DE SOUZA	36	PR 323 KM 3,600	130.16	0
5976	1420	2017-05-12	ALH0523	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON PEREIRA DE SOUZA	6	BR 487 KM 192,320	104.13	0
5977	460	2017-05-11	AFD5132	ESTACIONAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	\N	\N	BR364 KM604	234.78	0
5978	6695	2017-05-11	EKM2614	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 50%	\N	\N	BR 070 KM 288	574.61	0
5979	7070	2017-05-11	OUK4212	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DESLIGADO	Desligado	BR101 KM 713,880	104.13	0
5980	1070	2017-05-11	AJS5294	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	DIARLES ALVES ROCHA	257	BR153 KM503	104.13	0
5981	6685	2017-05-10	BAQ4021	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR050 KM278	104.13	0
5982	1740	2017-05-09	NCT2288	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	ADEILTON ALMEIDA DE CARVALHO	27689	BA 001, KM 15	195.23	156.18
5983	4740	2017-05-09	IAO6299	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	JURACY DE JESUS LOMBA	25264	BA 120, KM 129	130.16	104.13
5984	4740	2017-05-09	IAO6299	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	JURACY DE JESUS LOMBA	25264	BA 120, KM 129	195.23	156.18
5985	3920	2017-05-09	AGZ0114	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	ELINALDO BORGES DA HORA SILVA	11525	RV CE 060 KM 368	195.23	156.18
5986	2810	2017-05-09	AQN5331	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE BENEDITO DA SILVA	22230	BR364 KM355	85.13	0
5987	790	2017-05-09	KCV1932	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MOISES LUIS DOS SANTOS	19213	BR364 KM355	85.13	0
5988	8040	2017-05-09	OUM0586	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DAVI SERGIO DE SOUZA BRITO	16321	BR 242 KM 389,130	104.13	0
5989	1180	2017-05-08	AJC8792	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CASSIO FERNANDES MARTINS	249	GO-330 KM+300M/IPAMERI - CATLAO	0	0
5990	4020	2017-05-08	ATD5602	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JUCELIO FERREIRA DA SILVA	24123	BR 230 KM 158,600	104.13	0
5991	1525	2017-05-07	NCU3167	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	LUIZ FRANCISCO DE SOUZA	26523	BR 070 KM 275,500	156.18	0
5992	1570	2017-05-07	NCT1566	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	JULIO NERI DA SILVA	25607	BR 101 KM 81,000	156.18	96
5993	1340	2017-05-06	AKX9332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON BRANDAO SANTOS	30067	BR 407 KM 74,100	104.13	0
5994	4050	2017-05-06	ATD4117	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DARLAN LEITE VAZ	29087	BR 101 KM 156,500	104.13	0
5995	2520	2017-05-05	APX8950	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	APARECIDO FRAZAO DE MORAIS	276	BR153 KM 241,900	104.13	0
5996	3305	2017-05-05	ARF3169	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SAMUEL VIANA NUNES	117	BR 153 KM 296,400	104.13	0
5997	3025	2017-05-05	NCS9802	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILSON MOURA DE ARRUDA	15300	BR 364 KM 196,300	104.13	68.1
5998	4430	2017-05-05	AUA8616	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE LAURENI DE SILVA	25957	BR 364 KM 196,300	104.13	0
5999	4800	2017-05-05	AWA4714	CONDUZIR O VEÍCULO COM QUALQUER UMA DAS PLACAS SEM LEGIBILIDADE E VISIBILIDADE	MILTON MACHADO DA CRUZ	\N	BR 163 KM 714 UF/MS	234.78	187.82
6000	6390	2017-05-05	AYE0621	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 369 KM 164	85.13	0
6001	4990	2017-05-04	AWE1761	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	BR 364 KM 236	1173.88	939.1
6002	4990	2017-05-04	AWE1761	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	\N	\N	BR 364 KM 236	120	124.94
6003	7080	2017-05-04	OUJ5418	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	LEANDRO CARNEIRO GOMES	25939	LARGO DO PELOURINHO X RUA BAIXAS DOS SAPATEIROS - FAIXA 02	80	0
6004	6520	2017-05-04	AZO8479	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	JOSE RAIMUNDO DE OLIVEIRA	224	BR010 KM 162	0	0
6005	6475	2017-05-04	AYZ5647	ESTACIONAR NA CONTRAMÃO DE DIREÇÃO	VINICIUS LIMA BEZERRA	139	R DR SEBASTIAO FIGUEIREDO 768	104.12	0
6006	3955	2017-04-30	NDR8325	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 060 KM 90,950	85.13	0
6007	1140	2017-04-29	AJW1071	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SERGIO RAEL FERREIRA	252	BR 356 KM 31,550	104.13	0
6008	1070	2017-04-29	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR 153 KM 619,970	104.13	0
6009	4345	2017-04-29	ATW4394	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	CLAUDEMIR GOMES DA SILVA	19195	AVENIDA PRESIDENTE CASTELO BRANCO N°3887	195.23	0
6010	4470	2017-04-28	AUB3541	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	PAULO DULTRA DE OLIVEIRA	17092	BR 070 KM 635 UFMT - DECRESCENTE	195.23	102.15
6011	1070	2017-04-28	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR 010 KM 17,220	104.13	68.1
6012	4955	2017-04-28	AWI5199	TRANSITAR COM LUZ ALTA PERTURBANDO VISAO DE CONDUTOR	GILMAR FRANCISCO SOBRINHO	30184	BR163 KM-591 UF/MT - DECRESCENTE	104.13	0
6013	2225	2017-04-28	AOC4360	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	JAIR ALVES DOS SANTOS	\N	BR 364 KM 208 UFRO	104.13	83.3
6014	460	2017-04-27	AFD5132	ESTACIONAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	\N	\N	BR364 KM-604 UF/RO - DECRESCENTE	234.78	0
6015	4815	2017-04-27	AWA4716	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	\N	\N	AVENIDA PARANA AO LADO DO N°5392	195.23	0
6016	6615	2017-04-26	NDE7804	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LAERCIO IRIAS DE SOUZA	17601	BR 364 KM 10,390	104.13	0
6017	6490	2017-04-25	AYY7260	VELOCIDADE INCOMPATIVEL PROX DA GUIA OU ACOSTAMENTO	PAULO SERGIO MANGINI	1027	BR153 KM-343 UF/SP Decrescente	104.13	0
6018	1410	2017-04-25	ALH2052	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	JORDANIO PAULO PEREIRA DOS SANTOS	114	SP330 KM373	0	0
6019	7050	2017-04-25	AAV0987	DEIXAR DE DAR PREFERÊNCIA A PEDESTRE PORT DEFICIÊNCIA FÍS/CRIANÇA/IDOSO/GESTANTE	\N	\N	PRAÇA ROSSAFA EDIFICIO BURLE MARX EM FRENTE AO BOX 06	191.54	234.77
6020	4855	2017-04-25	AWC9082	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NELSON LUIZ MARRA	25326	BR 163 KM 617,200	104.13	0
6021	1470	2017-04-25	NCT1613	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO 164 KM 612,500	85.13	0
6022	1070	2017-04-24	AJS5294	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	DOUGLAS ROBERTO NEVES BEZERRA	247	ROD PA 483- KM ACARA/PA	957.69	766.15
6023	6665	2017-04-23	PQX0454	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILSON SOUZA	106	BR 153 KM 71,700	104.13	83.3
6024	1070	2017-04-22	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	PA 160 KM 3	104.13	0
6025	1255	2017-04-22	AKN6845	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSEVALDO SILVA CERQUEIRA	30234	BR 403 KM 27,800	104.13	0
6026	2530	2017-04-22	APU6320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	\N	0	0
6027	365	2017-04-21	AEU7528	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCELO MANOEL CARDOSO	25110	BR 163 KM 576,840	104.13	0
6028	6670	2017-04-20	PQX0514	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOMINGOS CRUZ DOS SANTOS	105	BR 153 KM 619,970	104.13	83.3
6029	1170	2017-04-19	AJC9719	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	BRUNO ALVES PEREIRA	135	SP 330 KM 373	0	0
6030	2530	2017-04-19	APU6320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR153 KM296,400	104.13	0
6031	4860	2017-04-19	AWC9135	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSINER SILVA DE CARVALHO	138	BR153 KM 71,800	104.13	0
6032	2670	2017-04-19	NEA0232	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	FABIO PAULINO MOREIRA	17148	BR364 KM 422	80	0
6033	4665	2017-04-19	AUZ3716	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VOLNEI DE LARA	15512	BR153 KM 472,300	104.13	0
6034	3830	2017-04-18	ARC1290	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE RICARDO DOS SANTOS	17448	BR101 KM 123,620	104.13	0
6035	3830	2017-04-18	ARC1290	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE RICARDO DOS SANTOS	17448	BR101 KM125,600	104.13	0
6036	970	2017-04-18	AJG6204	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	AGENOR FRANCISCO DA SILVA	17	\N	120	96
6037	2510	2017-04-18	APW1934	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	CESAR MACHADO DE AZEVEDO	19317	RUA URUGUAI X AV. GENERAL OSORIO/FE, 432 D LESTE - OESTE FX 03	0	0
6038	2970	2017-04-17	AQO0863	TRANSITAR EM LOCAL/HORÁRIO NÃO PERMITIDO PELA REGULAMENTAÇÃO - CAMINHÃO	LEANDRO RIBEIRO ARAUJO	24311	Av. Mal. floriano peixoto, 861	130.16	104.13
6039	3570	2017-04-17	AGZ2050	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ARLINDO JOSE CARDOSO DE SOUSA NEVES	213	GO-330 KM 171	0	0
6040	1030	2017-04-17	AHN3351	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEANDRO DA SILVA	280	BR 153 KM 301,480	104.13	0
6041	4815	2017-04-17	AWA4716	ESTACIONAR EM DESACORDO COM A REGULAMENTACAO	\N	\N	AVENIDA PARANA AO LADO DO N°5392	50	0
6135	6055	2017-03-06	NBS7983	ESTACIONAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	\N	\N	BR364 KM234	234.78	0
6042	6540	2017-04-17	AZU5059	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEIDIVAN DE CARVALHO CELESTINO	28	GO-137 KM 74	0	0
6043	8015	2017-04-17	OUK8605	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	GILMAR GOMES VITORIA	8821	BA 263, KM 85	130.16	104.12
6044	1470	2017-04-17	NCT1613	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	KM188 RODOVIA GO 070	0	0
6045	1030	2017-04-17	AHN3351	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIARLES ALVES ROCHA	257	GO-330 KM 143+800	0	0
6046	2315	2017-04-15	AON5143	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	JORGE PAULO HENZ	34	BR 376 KM 131	90.45	72.36
6047	170	2017-04-15	AHL5677	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 357,200	104.13	68.1
6048	970	2017-04-14	AJG6204	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	AGENOR FRANCISCO DA SILVA	17	\N	120	96
6049	2510	2017-04-13	APW1934	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	IVO MARIO DE SOUZA	16390	BR 290 KM54,2 UF/RS	85.13	0
6050	4325	2017-04-13	ATV6796	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BE267 KM 474,720	104.13	0
6051	1480	2017-04-13	NCT1813	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	VICENTE DE PAULO FERREIRA	15	KM 046 RODOVIA GO 330	81	0
6052	8040	2017-04-13	OUM0586	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DAVI SERGIO DE SOUZA BRITO	16321	BR 101 KM 208,890	104.13	0
6053	6695	2017-04-12	EKM2614	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR163 KM 493,370	0	0
6054	1070	2017-04-12	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR-153  KM760,980	85.13	0
6055	2870	2017-04-11	AQN2076	ESTACIONAR EM DESACORDO COM A REGULAMENTAÇÃO ESPECIFICADA PELA SINALIZAÇÃO	EDUARDO PEREIRA	24291	RUA SAO JOSE EM FRENTE  A PROMATER, LAGOA NOVA	127.69	0
6056	2030	2017-04-10	NCQ0932	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON PIRES DA SILVA	30187	BR101 KM 208,890	104.13	0
6057	4855	2017-04-10	AWC9082	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	NELSON LUIZ MARRA	25326	BR 376 KM 131	127.69	102.15
6058	4920	2017-04-09	AWF3249	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTENOR DOS SANTOS LIMA JUNIOR	21094	\N	104.13	0
6059	4920	2017-04-09	AWF3249	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ANTENOR DOS SANTOS LIMA JUNIOR	21094	AV. MUIGUEL SUTIL-PROX AUTO PECA AMIGAO- SENT VIADUTO COXIPO - CUIABA/MT	120	0
6060	4920	2017-04-08	AWF3249	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTENOR DOS SANTOS LIMA JUNIOR	21094	BR 364 KM 1188,955	104.13	0
6061	2520	2017-04-08	APX8950	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	RUAN FERREIRA DA SILVA	219	GO 330 KM 150	156.18	0
6062	4580	2017-04-07	NCW6976	EM MOVIMENTO DEIXAR DE MANTER ACESAS LUZES DE POSIÇÃO SOB CHUVA FORTE/NEBLINA/CERRAÇÃO	\N	\N	BR 153 KM 400	85.13	0
6063	6520	2017-04-07	AZO8479	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LEANDRO DA SILVA	280	GO 070 KM 39,850	0	0
6064	1490	2017-04-07	NCR3413	PARAR NA ÁREA DE CRUZAMENTO DE VIAS	MARCELO SUZART DE SANTANA	27468	\N	0	0
6065	4120	2017-04-06	AGZ0096	PORTAR NO VEÍCULO PLACAS DE IDENTIFICAÇÃO EM DESACORDO C/ ESPECIF/MODELO CONTRAN	VALDECI ANTONIO PEREIRA	24677	ERS 265 KM 175	104.12	0
6066	4120	2017-04-06	AGZ0096	PORTAR NO VEÍCULO PLACAS DE IDENTIFICAÇÃO EM DESACORDO C/ ESPECIF/MODELO CONTRAN	VALDECI ANTONIO PEREIRA	24677	ERS 265 KM 175	104.12	83.3
6067	4435	2017-04-06	AUA8610	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DINEI GOMES DA SILVA	25955	BR364 KM96,300	104.13	0
6068	2000	2017-04-05	AAK8762	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	ADELVAN PAULO DOS SANTOS	30354	CE363 KM 120	104.13	0
6069	2000	2017-04-05	AAK8762	EM MOVIMENTO. DEIXAR DE MANTER A PLACA TRASEIRA ILUMINADA À NOITE	ADELVAN PAULO DOS SANTOS	30354	CE-363 KM 120	104.13	0
6070	1070	2017-04-05	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	GO 164 KM 612,500	0	0
6071	4080	2017-04-04	AAV7008	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	SIDNEI MOREIRA BONFIM	29	MG 190 KM 126,3	138.17	0
6072	6680	2017-04-04	PQX0724	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GIOVANI FILHO PEREIRA DA SILVA	16	BR 226 KM 39,830	104.13	0
6073	2890	2017-04-04	AQN2080	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADALTO PEREIRA DA SILVA	274	GO 330 KM 68,500	0	0
6074	3890	2017-04-03	AGZ0118	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	WENDSON CARNEIRO OLIVEIRA	15816	\N	0	0
6075	6560	2017-04-03	AZY2902	CONDUZIR O VEÍCULO COM EQUIPAMENTO OBRIGATÓRIO INEFICIENTE/INOPERANTE	FERNANDO SILVERIO VIEIRA	1	Rod. PA 483, KM 16	156.18	124.94
6076	3570	2017-04-02	AGZ2050	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ARLINDO JOSE CARDOSO DE SOUSA NEVES	213	BR 153 KM 243,900	104.13	0
6077	3880	2017-04-01	AGZ0112	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	LORISVALDO MARTINS DOS SANTOS	25599	\N	0	0
6078	2530	2017-04-01	APU6320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR 153 KM 71,700	104.13	0
6079	6475	2017-04-01	AYZ5647	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	VINICIUS LIMA BEZERRA	139	BR 153 KM 71,800	156.18	0
6080	6515	2017-04-01	AZO8477	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	WILSON SILVA DE OLIVEIRA	254	DF 001 KM67 SENTIDO A SAMAMBAIA	130.16	0
6081	2530	2017-03-31	APU6320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR 153 KM 410,050	104.13	0
6082	4690	2017-03-31	AUZ8420	DIRIGIR S/ USAR LENTES, APAR, ETC IMPOSTAS PELA LICENCA	LUIZ FERNANDES SANTOS ALVES	22962	PE 126 EM FRENTE POSTO 02 BPRV	180	0
6083	4345	2017-03-29	ATW4394	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR-376 KM 131	80	0
6084	4040	2017-03-29	ATD2721	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS VIRGINIO DA SILVA	18243	BR 405 KM 151,900	104.13	0
6085	4690	2017-03-29	AUZ8420	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	LUIZ FERNANDES SANTOS ALVES	22962	BR 101 KM 206	104.13	0
6086	4400	2017-03-29	NCW1E37	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR364 KM 263,900	104.13	83.2
6087	4400	2017-03-29	NCW1E37	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AGENOR FRANCISCO DA SILVA	17	\N	0	0
6088	6695	2017-03-29	EKM2614	DESOBEDECER ÀS ORDENS EMANADAS DA AUTORID COMPET DE TRÂNSITO OU DE SEUS AGENTES	\N	\N	OLINTO MANCINI 46	156.18	0
6089	6695	2017-03-29	EKM2614	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	\N	\N	OLINTO MANCINI 46	104.12	104.12
6090	6520	2017-03-28	AZO8479	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	JOAO BONFIM DOS ANJOS NETO	220	GO-707 KM142/C. GOIAS-ITAPIRAPUA	120	0
6091	1575	2017-03-28	NCU2477	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	\N	\N	BR 101 KM 594 UFBA - DECRESCENTE	156.18	124.94
6092	6435	2017-03-27	AYK5627	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	DIEGO BARBOSA SILVA	20964	\N	156.18	0
6093	1475	2017-03-27	NCT1713	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	NEUZA LOPES DA SILVA	9635	AVENIDA LUDOVICO DA RIVA NETO	80	0
6094	1170	2017-03-27	AJC9719	DEIXAR DE ADENTRAR ÀS ÁREAS DESTINADAS À PESAGEM DE VEÍCULOS	BRUNO ALVES PEREIRA	135	MGC 265 KM 109.20, Rio Pomba - MG	156.18	0
6375	8005	2017-01-02	OUK8525	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	DENILSON DE CARVALHO	8	GO 060 KM 108	104.13	0
6095	3840	2017-03-27	ATU1130	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEBER BORGES MARTINES PEDROSA	29206	BR 364 KM 240,685	104.13	0
6096	3750	2017-03-26	ATF1590	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	JOSE NILSON DOS SANTOS	28	BR 909,660 KM 116	156.18	0
6097	3880	2017-03-26	AGZ0112	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	JECONIAS JOSE SILVA DOS SANTOS	28705	BR 158 KM 12	104.13	83.3
6098	3760	2017-03-24	AOO6619	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VAGMAR ALVES DA FONSECA	207	ROD. MGC 0259 KM 183 + 600M  DECRESCENTE	85.13	0
6099	370	2017-03-24	AHD3293	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMERSON PEDRO DOS SANTOS	11896	BR 364 KM 708,105	104.13	0
6100	4040	2017-03-23	ATD2721	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS VIRGINIO DA SILVA	18243	BR 230 KM 115,950	104.13	0
6101	4990	2017-03-23	AWE1761	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FABIANO BINI	2624	BR 364 KM 348,785	104.13	0
6102	6365	2017-03-23	AYB3788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 388,100	0	0
6103	3810	2017-03-22	AEQ1440	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	APARECIDO DONIZETE DA FONSECA	1346	ANEL VIÁRIO PREFEITO SINCLER SAMBATTI DEFRONTE	120	0
6104	3810	2017-03-22	AEQ1440	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	APARECIDO DONIZETE DA FONSECA	1346	ANEL VIÁRIO PREFEITO SINCLER SAMBATTI DEFRONTE 9332	120	0
6105	6290	2017-03-21	OVA1273	CONDUZIR O VEÍCULO COM EQUIPAMENTO OU ACESSÓRIO PROIBIDO	JONATAS PEREIRA DELMONDES	30181	BR 163 KM 454 UF/MS	156.18	124.94
6106	6290	2017-03-21	OVA1273	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	JONATAS PEREIRA DELMONDES	30181	BR 163 KM 454 UF/MS	156.18	124.94
6107	6290	2017-03-21	OVA1273	CONDUZIR O VEIC EM MAU ESTADO DE CONSERVACAO	JONATAS PEREIRA DELMONDES	30181	BR 163 KM 454 UF/MS	156.18	124.94
6108	3045	2017-03-21	NCS9822	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	REGINALDO SOARES	\N	BR364 KM 242,020	156.18	0
6109	1485	2017-03-21	NCR3713	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	JOSE ALVES DE SOUZA	8	\N	156.18	0
6110	3350	2017-03-20	ARO4467	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILSON SOUZA	106	GO-330 KM 54/IPAMERI-CATALAO	85.13	0
6111	4795	2017-03-20	AWA4718	TRANSITAR EM DESACORDO C/ AUTORIZACAO ESPECIAL SUPERDIMENS	ALEXANDRE DE CARVALHO SEREN	21539	BR 376 KM 509	195.23	156.18
6112	6395	2017-03-19	MBO3426	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 10,390	104.13	83.3
6113	4280	2017-03-17	AHM9953	CONDUZIR VEÍCULO C/ REGISTRADOR INSTAN INALT DE VELOCIDADE/TEMPO VICIADO/DEFEITUOSO	EDSON BRANDAO SANTOS	30067	\N	156.18	0
6114	4480	2017-03-17	NCI9905	DESOBEDECER ÀS ORDENS EMANADAS DA AUTORID COMPET DE TRÂNSITO OU DE SEUS AGENTES	BRUNO MANGAROTTI FONSECA	26722	BR 364 KM 745	0	0
6115	4355	2017-03-15	ACL4272	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	ROMILSON ALMEIDA DA SILVA	25603	BR153 KM 70+500M UF/SP	136.16	0
6116	8040	2017-03-15	OUM0586	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DAVI SERGIO DE SOUZA BRITO	16321	BR CE 366 KM 3,8	104.12	104.12
6117	5050	2017-03-14	AWJ8744	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	JHONY HUTTINGER	21781	AVENIDA MIGUEL SUTIL, 4068 - CUIABA/MT	156.18	124.94
6118	5050	2017-03-14	AWJ8744	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	JHONY HUTTINGER	21781	AVENIDA MIGUEL SUTIL 4068	104.13	83.3
6119	4240	2017-03-14	AGZ0288	PARAR SOBRE FAIXA DE PEDESTRES NA MUDANÇA DE SINAL LUMINOSO (FISCALIZAÇÃO ELETRÔNICA)	WELLINTON SECKLER FURLAN	30317	RUA ITABERABA X RUA WALDEMAR RANGRAB	130.16	104.13
6120	6485	2017-03-14	AYZ8643	ESTACIONAR IMPEDINDO A MOVIMENTAÇÃO DE OUTRO VEÍCULO	HERITO PEREIRA GOMES SANTOS	149	Rua Alexandre Calmon - Mania Festa	130.16	104.13
6121	6395	2017-03-13	MBO3426	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 276,000	104.13	83.3
6122	6200	2017-03-13	OBR5359	DEIXAR O PASSAGEIRO DE USAR O CINTO SEGURANÇA	\N	\N	AV. DJALMA DUTRA	127.69	124.94
6123	1070	2017-03-12	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR 153 KM 760,980	104.13	83.3
6124	1070	2017-03-12	AJS5294	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR-153 KM522,000	156.18	96
6125	1070	2017-03-11	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR- 153, KM 330,080	104.13	0
6126	6515	2017-03-11	AZO8477	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	GECIMAR NASCIMENTO 	19	BR020 KM 012	0	0
6127	3025	2017-03-11	NCS9802	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	NILSON MOURA DE ARRUDA	15300	AV. BRASIL N 1385	0	0
6128	3380	2017-03-11	ARP8608	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMAR BATISTA DE ABREU	30179	BR-364 KM 695,970	104.13	0
6129	4250	2017-03-11	AGZ0199	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RUAN FERREIRA DA SILVA	219	GO-330 KM 54 / IPAMERI - CATALÃO	85.13	0
6130	920	2017-03-10	CGR2682	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	CARLOS ALBERTO BORGES DA SILVA	\N	BR364 KM-106 UF/AC - Crescente	1173.88	0
6131	3380	2017-03-09	ARP8608	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMAR BATISTA DE ABREU	30179	BR-364 KM 707,660	104.13	0
6132	6665	2017-03-09	PQX0454	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILSON SOUZA	106	BR 153 KM 71,800	104.13	83.3
6133	6285	2017-03-06	OVA1884	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	ROGERIO BENITES DE PAIVA	27169	BR376 KM131	72.36	0
6134	4545	2017-03-06	NCY4696	TRANSITAR PELA CONTRAMÃO DE DIREÇÃO EM VIA C/ SINALIZAÇÃO DE REGUL SENTIDO ÚNICO	LAERTE IRIAS DE SOUZA	16694	AVENIDA JATOBA EM FRENTE A LOTERICA	234.78	187.82
6136	6060	2017-03-05	NBS8013	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 71,800	85.13	83.3
6137	1545	2017-03-03	NCT1755	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 425 KM 296,800	85.13	105.73
6138	1140	2017-03-01	AJW1071	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	SERGIO RAEL FERREIRA	252	MG223 KM 86	104.12	0
6139	1140	2017-03-01	AJW1071	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	SERGIO RAEL FERREIRA	252	RODOVIA MG223 KM 86	104.12	68.1
6143	1470	2017-02-28	NCT1613	EM MOVIMENTO. DEIXAR DE MANTER ACESA LUZ BAIXA DO CICLOMOTOR	CELLY SOARES DIAS	\N	BR364 KM-735UF/RO -000335	104.13	0
6144	1470	2017-02-28	NCT1613	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	CELLY SOARES DIAS	\N	BR 364 KM 680 UFRO - CRESCENTE	80	0
6145	1470	2017-02-28	NCT1613	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	CELLY SOARES DIAS	\N	BR364 KM-600 - Crescente	80	0
6146	2280	2017-02-27	AOL4467	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	CLAUDEMIR GOMES DA SILVA	19195	GO 330 KM 046 SENTIDO CATALAO IPAMERI	102.15	0
6147	6520	2017-02-27	AZO8479	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	LEANDRO DA SILVA	280	BR - 020 KM 180,00 - SIMOLANDIA/GO	156.18	0
6148	6670	2017-02-24	PQX0514	ESTACIONAR AO LADO DE OUTRO VEÍCULO EM FILA DUPLA	DOMINGOS CRUZ DOS SANTOS	105	AV. W. CAVALCANTE EM F/A MOVEIS VITORIA CANAA DOS CARAJAS	156.18	124.94
6149	2220	2017-02-24	AOC4359	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 264,800	104.13	83.3
6150	3810	2017-02-24	AEQ1440	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO BENITES DE PAIVA	27169	BR 267 KM 124 + 880 M	104.13	83.3
6151	4325	2017-02-24	ATV6796	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	BR 463 KM 3	1173.88	939.1
6152	2530	2017-02-23	APU6320	FORÇAR PASSAGEM ENTRE VEÍCS TRANS SENT OPOSTOS NA IMINÊNCIA REALIZ ULTRAPASSAGEM	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR 153 KM 535 UF TO	2347.76	1878.21
6153	1730	2017-02-22	NCT2388	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	ITAMAR LIMA SERRA	26241	BR 316 KM 542 UF/MA - CRESCENTE	165.19	156.18
6154	4050	2017-02-21	ATD4117	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DARLAN LEITE VAZ	29087	BR 101 KM 147,170	101.13	80.9
6155	6005	2017-02-21	AWN1825	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 080 KM 181,000	104.13	83.3
6156	4665	2017-02-20	AUZ3716	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	VOLNEI DE LARA	15512	BR 376 KM 672	104.13	0
6157	4450	2017-02-18	AUA8607	DEIXAR DE CONSERVAR O VEÍCULO NA FAIXA A ELE DESTINADA PELA SINALIZAÇÃO DE REGUL	MARCELO MANOEL CARDOSO	25110	BR 153 KM 507 UG GO	104.13	83.3
6158	4860	2017-02-17	AWC9135	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSINER SILVA DE CARVALHO	138	BR 101 KM 459,540	104.13	83.3
6159	4080	2017-02-17	AAV7008	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SILVANO MOREIRA BONFIM	21	BR 153 KM 343 UFSP - DECRESCENTE	130.16	68.1
6160	4220	2017-02-17	AGZ0305	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	ALDO SOARES DE ABREU	251	MG187 KM67	116.89	0
6161	3400	2017-02-17	ARS6310	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALLYSON BRUNO DIAS RODRIGUES DE ARAUJO	146	BR381KM401,420	104.13	83.3
6162	3850	2017-02-17	ATA1130	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	FAUSTO DE OLIVEIRA GOMES	205	SERRANOPOLIS APORE	104.13	0
6163	1030	2017-02-17	AHN3351	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO BONFIM DOS ANJOS NETO	220	AV. DR. LAMARTINE P. DE VELAR N°2139	130.16	0
6164	4400	2017-02-16	NCW1E37	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AGENOR FRANCISCO DA SILVA	17	BR 364 KM 263,900	104.13	83.3
6165	4870	2017-02-15	AWC1282	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON FERREIRA DA PENHA	26539	BR 364 KM 708,105	104.13	83.3
6166	2480	2017-02-15	APO9699	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	BR272 KM 522,050	104.13	83.3
6167	810	2017-02-15	AHS9704	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	EDSON PEREIRA DE SOUZA	36	BR 153 KM 200 UF SP -  DECRESCENTE	1467.35	1173.88
6168	3730	2017-02-15	ASN1458	FORÇAR PASSAGEM ENTRE VEÍCS TRANS SENT OPOSTOS NA IMINÊNCIA REALIZ ULTRAPASSAGEM	DAVI LIMA BEZERRA	109	BR 153 KM 200 UFDP- DECRESCENTE	2934.7	2347.76
6169	4300	2017-02-13	CKT5776	ESTACIONAR EM GUIA DE CALÇADA REBAIXADA DESTINADA À ENTRADA/SAÍDA DE VEÍCULOS	DESLIGADO	Desligado	\N	104.12	0
6170	4445	2017-02-13	AUA8619	ESTACIONAR NAS ESQUINAS E A MENOS DE 5M DO ALINHAMENTO DA VIA TRANSVERSAL	ARTUR ANDRADE DANTAS DE SOUZA PINTO	9566	RUA MANOEL LOPES DE OLIVEIRA X RUA GERVASIO HITOCHI DOI	104.12	0
6171	4445	2017-02-13	AUA8619	ESTACIONAR NAS ESQUINAS E A MENOS DE 5M DO ALINHAMENTO DA VIA TRANSVERSAL	ARTUR ANDRADE DANTAS DE SOUZA PINTO	9566	RUA MANOEL LOPES DE OLIVEIRA X RUA GERVASIO HITOCHI DOI	130.16	104.13
6172	1220	2017-02-12	AKI6988	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUCAS PEREIRA DOS SANTOS	30294	BR 070 KM 66,115	104.13	83.3
6173	4830	2017-02-11	AWB7320	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	TIAGO BATISTA DA SILVA	137	BR 494 KM 89,000	156.18	124.94
6174	1070	2017-02-11	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOUGLAS ROBERTO NEVES BEZERRA	247	BR 153 KM 56,100	104.13	83.3
6175	1695	2017-02-11	LZQ6917	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364KM 420,190	104.13	83.3
6176	3955	2017-02-11	NDR8325	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NILTON CEZAR CORDEIRO ALMEIDA	17752	BR 101 KM 208,890	104.13	83.3
6177	6470	2017-02-10	AYZ4107	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	MARCIO RODRIGUES	21245	GO - 010 / LEOPOLDO DE BULHOES - SILVANIA	80	0
6178	1110	2017-02-10	AJT7581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMAR BATISTA DE ABREU	30179	BR 364 KM 345,660	104.13	83.3
6179	3850	2017-02-10	ATA1130	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FAUSTO DE OLIVEIRA GOMES	205	GO 070 KM 24,400	104.13	0
6180	1110	2017-02-09	AJT7581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMAR BATISTA DE ABREU	30179	BR 364 KM 17,790	104.13	83.3
6181	1050	2017-02-08	AJK7054	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	\N	\N	AV P S SAMBATTI A AV JOSE A N	293.46	234.77
6182	7050	2017-02-08	AAV0987	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 50%	\N	\N	BR 272 KM 522,050	704.33	459.69
6183	3650	2017-02-06	ANX0074	CONDUZIR VEÍC COM VIDRO TOTAL/PARCIALMENTE COBERTO POR PELÍCULA. PAINÉIS/PINTURA	ANTONIO DOS SANTOS ARAUJO	29124	BR 230 KM 391 UFPB - CRESCENTE	195.23	156.18
6184	6515	2017-02-06	AZO8477	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	GECIMAR NASCIMENTO 	19	GO 556 KM 001	104.13	0
6185	1110	2017-02-06	AJT7581	DEIXAR O CONDUTOR DE USAR O CINTO SEGURANÇA	ADEMAR BATISTA DE ABREU	30179	Av. 25 de Agosto, 4822 - Em frente ao falcão magazine	195.23	156.18
6186	1140	2017-02-05	AJW1071	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	SERGIO RAEL FERREIRA	252	BR 226 KM  39,830	156.18	124.94
6187	6330	2017-02-05	OVB7350	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 242 KM 389,130	104.13	0
6188	6455	2017-02-04	AYR9572	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	CARLOS APARECIDO DOS SANTOS	27695	GO - 010 / LEOPOLDO DE BULHOES / SILVANIA	72.36	0
6189	1110	2017-02-04	AJT7581	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ADEMAR BATISTA DE ABREU	30179	BR 364 KM 431 UFRO - DECRESCENTE	80	83.3
6190	3830	2017-02-04	ARC1290	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	JOSE RICARDO DOS SANTOS	17448	PE 015 KM 10 SENTIDO ABREU E LIMA	156.19	124.95
6191	4535	2017-02-04	NDB4395	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	BRUNO ALVES PEREIRA	135	ROD PA 136 KM 03	156.18	124.94
6192	4545	2017-02-03	NCY4696	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	LAERTE IRIAS DE SOUZA	16694	\N	0	0
6193	6355	2017-02-02	OVC2786	RETIRAR DO LOCAL VEÍCULO LEGALMENTE RETIDO PARA REGULARIZAÇÃO. SEM PERMISSÃO	MOISES OLIVEIRA CARNEIRO	27690	ROD. BA099 KM 45	234.77	0
6194	3830	2017-02-02	ARC1290	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	JOSE RICARDO DOS SANTOS	17448	PE 60, EM FRENTE AO ENGENHO DETODOS OS SANTOS	120	0
6195	3785	2017-02-02	AFR3130	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	VILSON BARBOSA	1130	av. P S Sambati x Av. Carmen M	234.76	0
6196	4860	2017-02-01	AWC9135	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSINER SILVA DE CARVALHO	138	BR 153 KM 71,800	104.13	83.3
6197	3740	2017-02-01	ASK5589	ESTACIONAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	\N	\N	BR364 KM 603 UFRO - DECRESCENTE	293.47	234.78
6198	2660	2017-02-01	NEA0252	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 71,800	104.13	83.3
6199	800	2017-02-01	NBJ9482	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	NIVALDO ALVES CHALEGRA	\N	BR 364 KM 341,600	104.13	83.3
6200	2440	2017-02-01	AOU3266	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSEVALDO SILVA CERQUEIRA	30234	CE 282 KM 95	104.13	0
6201	4365	2017-01-31	ATY5536	DEIXAR DE DAR PREF EM INTERSECAO NAO SINALIZ.A VEIC CIRCUL	\N	\N	BR 230 K 509 UFPB - DECRESCENTE	195.23	156.18
6202	4305	2017-01-31	ATT3288	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	SILVANO MOREIRA BONFIM	21	Umuarama-pr	195.23	156.18
6203	3980	2017-01-31	AGZ0788	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	SILVANO MOREIRA BONFIM	21	\N	195.23	156.18
6204	4080	2017-01-31	AAV7008	DEIXAR DE EFETUAR REGISTRO DE VEIC NO PRAZO DE 30 DIAS	SILVANO MOREIRA BONFIM	21	Umuarama - pr	195.23	156.18
6205	745	2017-01-30	AHB6368	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	JONATAS PEREIRA DELMONDES	30181	BR262 KM 600 UFMS - DECRESCENTE	195.23	156.18
6206	2630	2017-01-28	NDT9362	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FLAVIO HELTON GONZAGA	226	BR 226 KM 39,830	130.16	104.13
6207	4705	2017-01-28	AVA3677	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	JONATAS MEDEIROS DE FREITAS	24489	BR-364 KM 10,390	156.19	0
6208	3305	2017-01-28	ARF3169	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GISNEY ANDRADE SILVA	112	BR 476 KM 147,000	104.13	83.3
6209	3750	2017-01-27	ATF1590	ESTACIONAR VEIC NO PASSEIO, FAIXA DE PEDESTRES, ETC	DESLIGADO	Desligado	BR 470, KM 53	195.23	156.18
6210	2640	2017-01-27	NDU0332	CONDUZIR O VEÍCULO SEM QUALQUER UMA DAS PLACAS DE IDENTIFICAÇÃO	EVANDRO PEREIRA RIBEIRO	245	BR 153 KM 194 UFGO - CRESCENTE	293.47	234.78
6211	6240	2017-01-27	OUZ4745	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIR GOMES DA SILVA	19195	BR 163 KM 150+800M MS	130.16	104.13
6212	3340	2017-01-26	ARO4462	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO BONFIM DOS ANJOS NETO	220	LMG 653 KM 12	104.12	0
6213	3820	2017-01-26	ABJ1290	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	JOAO FERREIRA LOPES	\N	BR 267 KM 1298 UFMS - DECRESCENTE	104.13	83.3
6214	2030	2017-01-25	NCQ0932	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JURANDI COSTA VIANA	20880	\N	130.16	104.13
6215	2030	2017-01-25	NCQ0932	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JURANDI COSTA VIANA	20880	BR-242 KM 389,130	104.13	0
6216	7015	2017-01-25	OUG7788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO SERGIO FERREIRA CAVALCANTE	24782	BR-262 KM 6,250	85.13	0
6217	7050	2017-01-24	AAV0987	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 50%	\N	\N	BR-272 KM522,050	704.34	0
6218	2450	2017-01-23	ARG2227	ESTACIONAR SOBRE FAIXA DESTINADA A PEDESTRE	\N	\N	AV. ALEXANDRE BATISTA GARCIA DE FRENTE AO ? MERO 5	127.69	81.72
6219	3410	2017-01-22	ARS6306	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	GESSY BARBOSA RODRIGUES	29203	BR 163 KM 48 UFMT - DECRESCENTE	130.16	104.13
6220	6240	2017-01-21	OUZ4745	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO BENITES DE PAIVA	27169	BR-267 KM 124,880	104.13	104.13
6221	3320	2017-01-20	ARL7A67	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 174 KM 290,927	104.13	83.3
6222	3320	2017-01-20	ARL7A67	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMIR GUION	25	BR 174 KM 290,927	104.13	83.3
6223	6620	2017-01-20	NBH7656	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 010 KM 258,600	104.13	68.1
6224	3270	2017-01-20	NCO9565	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCISCO DE OLIVEIRA LIMA	21896	BR-364 KM145,000	104.13	0
6225	1895	2017-01-20	AMK7493	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 224,955	104.13	83.3
6226	1110	2017-01-19	AJT7581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMAR BATISTA DE ABREU	30179	\N	130.16	104.13
6227	3600	2017-01-18	ASB6672	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 463 KM 56+300M MS	85.13	68.1
6228	6240	2017-01-18	OUZ4745	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO BENITES DE PAIVA	27169	BR-267 KM124,880	104.13	0
6229	4160	2017-01-17	NEC2958	CONDUZIR O VEÍCULO COM QUALQUER UMA DAS PLACAS SEM LEGIBILIDADE E VISIBILIDADE	LAERTE IRIAS DE SOUZA	16694	BR 376, KM 412	293.47	234.78
6230	4545	2017-01-17	NCY4696	TRANSITAR C/ VEIC C/ DIMENSOES OU CARGA SUP A LEGISLACAO	LAERTE IRIAS DE SOUZA	16694	BR 376 KM 412	195.23	156.18
6231	4515	2017-01-17	NCI9925	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	JOSIMAR LOPES DE ASSUNÇÃO	29845	ROD. MT 130 TRECHO POXOREU SENTIDO N KM 108	120	0
6232	3560	2017-01-17	ASZ1599	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DAMARIO DE SOUZA OLIVEIRA	21778	KM 442 BR 166	130.16	104.13
6233	4950	2017-01-16	AWI3927	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	FRANCINALDO FIRMINO DA SILVA	111	BR 153 KM 410,050	156.18	124.94
6235	4535	2017-01-16	NDB4395	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	BRUNO ALVES PEREIRA	135	BR 163, KM 992	127.69	102.15
6236	4535	2017-01-16	NDB4395	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	BRUNO ALVES PEREIRA	135	BR 163, KM 992	195.23	156.18
6237	4535	2017-01-16	NDB4395	CONDUZIR VEÍC COM VIDRO TOTAL/PARCIALMENTE COBERTO POR PELÍCULA. PAINÉIS/PINTURA	BRUNO ALVES PEREIRA	135	BR 163, KM 992	195.23	156.18
6238	4535	2017-01-16	NDB4395	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	BRUNO ALVES PEREIRA	135	BR 163, KM 992	130.16	104.13
6239	4535	2017-01-16	NDB4395	TRANS COM VEÍCULO DESAC C/ESPECIFICAÇÃO/FALTA DE INSCR/SIMBOLOGIA NECESSÁRIA IDENTIF	BRUNO ALVES PEREIRA	135	BR 163, KM 992	195.23	156.18
6240	2530	2017-01-15	APU6320	TRANSITAR COM VEÍC DERRAMANDO/LANÇANDO COMBUSTÍVEL/LUBRIF QUE ESTEJA UTILIZANDO	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR153 KM 397 UFGO - DECRESCENTE	293.47	234.78
6241	1110	2017-01-13	AJT7581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMAR BATISTA DE ABREU	30179	BR364 KM309,550	104.13	0
6242	1110	2017-01-13	AJT7581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMAR BATISTA DE ABREU	30179	BR-364 KM 242,020	104.13	0
6243	1110	2017-01-13	AJT7581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMAR BATISTA DE ABREU	30179	BR,364 KM19,790	104.13	0
6244	8030	2017-01-11	OUK1468	DESOBEDECER ÀS ORDENS EMANADAS DA AUTORID COMPET DE TRÂNSITO OU DE SEUS AGENTES	\N	\N	ROD. BA262 KM 439 ARACATU- BR 030/BR 026/BA 148 (BRUMADO)	127.69	102.15
6245	1110	2017-01-11	AJT7581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMAR BATISTA DE ABREU	30179	BR-364 KM242,020	104.13	0
6246	5590	2017-01-11	AWO3560	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DESLIGADO	Desligado	BR-364 KM10,390	156.19	0
6247	1230	2017-01-10	AKJ9050	CONDUZIR O VEÍCULO COM QUALQUER UMA DAS PLACAS SEM LEGIBILIDADE E VISIBILIDADE	JEFESON ROMUALDO DE SANTANA	7352	BR 163 KM 991 UFPA - DECRESCENTE	293.47	234.78
6248	1230	2017-01-10	AKJ9050	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	JEFESON ROMUALDO DE SANTANA	7352	BR163 KM 991 UFPA -  DECRESCENTE	195.23	156.18
6249	1230	2017-01-10	AKJ9050	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	JEFESON ROMUALDO DE SANTANA	7352	BR 163 KM991 UFPA - DECRESCENTE	195.23	156.18
6250	1230	2017-01-10	AKJ9050	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	JEFESON ROMUALDO DE SANTANA	7352	BR 163 KM 991 UFPA - DECRESCENTE	195.23	156.18
6251	3715	2017-01-10	ASO1590	CONDUZIR O VEIC COM A COR OU CARACTERISTICA ALTERADA	\N	\N	BR163 KM 991 UFPA - DECRESCENTE	195.23	156.18
6252	3715	2017-01-10	ASO1590	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	\N	\N	BR 163 KM 991 UFPA - DECRESCENTE	195.23	156.18
6253	3715	2017-01-10	ASO1590	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	\N	\N	BR163 KM 991 UFPA -  DECRESCENTE	195.23	156.18
6254	625	2017-01-10	AGM2934	PORTAR NO VEÍCULO PLACAS DE IDENTIFICAÇÃO EM DESACORDO C/ ESPECIF/MODELO CONTRAN	JEFESON ROMUALDO DE SANTANA	7352	BR 163 KM991 UFPA - DECRESCENTE	130.16	104.13
6255	625	2017-01-10	AGM2934	CONDUZIR VEÍC COM VIDRO TOTAL/PARCIALMENTE COBERTO POR PELÍCULA. PAINÉIS/PINTURA	JEFESON ROMUALDO DE SANTANA	7352	BR 163 KM 991 UFPA - DECRESCENTE	195.23	156.18
6256	625	2017-01-10	AGM2934	CONDUZIR O VEIC EM MAU ESTADO DE CONSERVACAO	JEFESON ROMUALDO DE SANTANA	7352	BR163 KM 991 UFPA - DECRESCENTE	195.23	156.18
6257	2480	2017-01-10	APO9699	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	BR 163 KM 314,700	104.13	83.3
6258	3270	2017-01-09	NCO9565	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCISCO DE OLIVEIRA LIMA	21896	BR 364  KM 420,190	130.16	104.13
6259	820	2017-01-09	AHV3957	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO FERREIRA	20	KM 9 BR 365	131.46	105.17
6260	6395	2017-01-08	MBO3426	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 10,390	104.13	83.3
6261	1285	2017-01-07	AKP2741	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DANIEL SOUZA ALMEIDA JUNIOR	28003	BR 222 KM 47,900	104.13	83.3
6262	1110	2017-01-06	AJT7581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMAR BATISTA DE ABREU	30179	BR-364 KM19,790	104.13	0
6263	2650	2017-01-06	NEA0262	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ALEX COQUEIRO	29332	BR 316 KM 381	104.13	83.3
6264	4695	2017-01-06	AUZ8418	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	ANDRE LUIZ COUTO NETO	23541	BR 364 KM 319 UFMT - DECRESCENTE	104.13	83.3
6265	8005	2017-01-06	OUK8525	DIRIGIR SEM ATENÇÃO OU SEM OS CUIDADOS INDISPENSÁVEIS À SEGURANÇA	JUNIOR GABRIEL DOS SANTOS	217	SANCLERLANDIA KM 3 RODOVIA GO 164	70.7	0
6266	6240	2017-01-06	OUZ4745	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO BENITES DE PAIVA	27169	BR-267 KM 124,880	104.13	0
6267	6240	2017-01-06	OUZ4745	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROGERIO BENITES DE PAIVA	27169	BR-267 KM124,880	104.13	0
6268	1010	2017-01-05	AJI4719	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	ALISSON DOS SANTOS ALVES	31035	ROD. BA 262 KM 439 BRUMADO - ARACATU	130.16	104.13
6269	4950	2017-01-05	AWI3927	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FRANCINALDO FIRMINO DA SILVA	111	BR 153 KM 619,970	104.13	83.3
6270	4535	2017-01-05	NDB4395	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	ALLYSON BRUNO DIAS RODRIGUES DE ARAUJO	146	\N	102.15	0
6271	4990	2017-01-04	AWE1761	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FABIANO BINI	2624	BR 364 KM 276,000	104.13	68.1
6272	6395	2017-01-03	MBO3426	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 10,390	130.16	104.13
6273	2640	2017-01-03	NDU0332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EVANDRO PEREIRA RIBEIRO	245	BR-010 KM131,100	104.13	104.13
6274	3795	2017-01-02	ASK5672	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 20% ATÉ 50%	\N	\N	BR 364 KM 236	195.23	156.19
6275	4990	2017-01-02	AWE1761	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FABIANO BINI	2624	BR 364 KM 343,940	68.1	54.48
6276	1215	2017-01-02	AKG2145	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	EMERSON PEDRO DOS SANTOS	11896	BR163 KM946 UF/MT- Crescente	85.13	68.1
6277	1110	2017-01-02	AJT7581	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ALISANDRO PEDRO	26024	BR 364 KM 309,550	130.16	104.13
6278	6580	2017-01-02	AZY5793	TRANSPOR,S/ AUTORIZACAO, BLOQUEIO VIARIO C/ OU S/ SINALIZ	\N	\N	GO 326 KM 037	102.15	81.72
6280	3060	2017-01-02	IMF1438	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	\N	\N	BR163 KM 532 UF/MS- Decrescente	127.69	102.15
6281	3850	2017-01-02	ATA1130	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	FAUSTO DE OLIVEIRA GOMES	205	GO 330 KM 046 SENTIDO CATALÃO IPAMERI	104.13	0
6282	850	2017-01-02	AIA7368	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIO MARCOS CABRAL	21982	BR 040 KM 39,300	104.13	83.3
6283	4440	2017-01-02	AUA8524	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	\N	\N	BR 101 KM 151	90.45	72.36
6284	400	2017-01-02	AEQ3754	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	AQUILES FERREIRA DE ANDRADE	6715	BR364 KM 600 UFRO - CRESCENTE	195.23	156.18
6285	1550	2017-01-02	NCT0555	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 040 KM 595,000	104.13	83.3
6286	2520	2017-01-02	APX8950	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	APARECIDO FRAZAO DE MORAIS	276	GO 174 KM 280	104.13	0
6287	2890	2017-01-02	AQN2080	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	LUIZ FERNANDES SANTOS ALVES	22962	BR 304 KM 63 UFCE - DECRESCENTE	85.13	68.1
6288	2650	2017-01-02	NEA0262	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	ERIVALDO OLIVEIRA GONCALVES	27999	BR 116 KM 159	127.69	102.15
6289	2650	2017-01-02	NEA0262	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	ERIVALDO OLIVEIRA GONCALVES	27999	BR 116 KM 159	85.13	68.1
6290	6520	2017-01-02	AZO8479	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DESLIGADO	Desligado	\N	68.1	0
6291	2520	2017-01-02	APX8950	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	APARECIDO FRAZAO DE MORAIS	276	GO 164 KM 604	104.13	0
6292	3400	2017-01-02	ARS6310	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GERALDO LAURIANO NASCIMENTO	141	BR 262 KM 594,480	68.1	54.4
6293	6550	2017-01-02	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO 139 800M	85.13	68.1
6294	6475	2017-01-02	AYZ5647	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 163 KM 323,39 RIO BRILHANTE MS	95.77	76.62
6295	2520	2017-01-02	APX8950	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	DESLIGADO	Desligado	GO 174 KM 276	104.13	0
6296	2690	2017-01-02	NEA0212	CONDUZIR O VEÍC DE CARGA C/ FALTA INSCRIÇÃO DA TARA E DEMAIS PREVISTAS NO CTB	ISAAC BRUNO MARTINS SUCUPIRA	4	GO 330 KM 150 URUTAI PIRES DO RIO	68.1	0
6297	6350	2017-01-02	OVC1657	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	CAZUZA CRUZ NICOLAU	29333	AV NOIDE CERQUEIRA PROX ENT BR 324 SBC	130.16	0
6298	2690	2017-01-02	NEA0212	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	ISAAC BRUNO MARTINS SUCUPIRA	4	GO 330 KM 150 URUTAI PIRES DO RIO	102.15	0
6299	810	2017-01-02	AHS9704	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EMILIO VALDEMIR GUION	\N	BR 158 KM 134,500	68.1	54.48
6300	4470	2017-01-02	AUB3541	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO DULTRA DE OLIVEIRA	17092	BR 070 KM 530,560	68.1	54.48
6301	6540	2017-01-02	AZU5059	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOEDSON NEVES QUINTINO	96	BR 060KM 267+300M GO	85.13	68.1
6302	3820	2017-01-02	ABJ1290	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROBSON HERMES DA SILVA	22392	BR 158 KM 505,950	68.1	54.48
6303	4810	2017-01-02	AWB4917	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 070 KM 665,150	68.1	54.48
6304	3045	2017-01-02	NCS9822	DEIXAR GUARDAR DIST SEGURANÇA LAT/FRONT ENTRE SEU VEÍCULO E DEMAIS E AO BORDO PISTA	\N	\N	BR364 KM253 UF/RO- DECRESCENTE	127.69	102.15
6305	3520	2017-01-02	AKY9654	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	RONI ALFREDO PEREIRA NUNES	26570	\N	156.18	0
6306	4860	2017-01-02	AWC9135	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	\N	\N	BR 153 KM 175,5	90.45	68.1
6307	985	2017-01-02	AJI2983	CONDUZIR O VEÍCULO COM QUALQUER UMA DAS PLACAS SEM LEGIBILIDADE E VISIBILIDADE	ANTONIEL BEZERRA GOMES	107	GO 330 KM 046	191.53	153.22
6308	1170	2017-01-02	AJC9719	TRANS COM VEÍCULO DESAC C/ESPECIFICAÇÃO/FALTA DE INSCR/SIMBOLOGIA NECESSÁRIA IDENTIF	ANTONIEL BEZERRA GOMES	107	GO 330 KM 046	127.69	102.15
6309	6605	2017-01-02	BAE8370	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCOS GODOY DE LIMA	6248	BR 070, K  42,500	85.13	68.1
6310	1210	2017-01-02	AKG2144	TRANS COM VEÍCULO DESAC C/ESPECIFICAÇÃO/FALTA DE INSCR/SIMBOLOGIA NECESSÁRIA IDENTIF	TIAGO DIAS BORGES DA SILVA	129	GO 330 KM 046	127.69	102.15
6311	6685	2017-01-02	BAQ4021	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	RONILDO DOURADO DE AZEVEDO	84	GO 330 KM 046	104.13	0
6312	6615	2017-01-02	NDE7804	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LAERCIO IRIAS DE SOUZA	17601	BR 364 MK 556,300	104.13	83.3
6313	1010	2017-01-02	AJI4719	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DARLAN LEITE VAZ	29087	BR 242 KM 389,130	68.1	54.48
6314	4435	2017-01-02	AUA8610	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DINEI GOMES DA SILVA	25955	BR 364 KM 226+0M MT	85.13	68.1
6315	6475	2017-01-02	AYZ5647	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 50%	\N	\N	BR 153 KM 610.800	574.62	574.62
6316	6550	2017-01-02	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 070 KM 16,900	68.1	54.48
6317	1405	2017-01-02	BXF4340	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 070 KM 728,440	104.13	83.28
6318	4695	2017-01-02	AUZ8418	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MESSIAS LUIZ DOS SANTOS	21156	BR364 KM 227+0M MT	85.13	68.1
6319	2890	2017-01-02	AQN2080	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEITON TONON DEOCLECIO	128	BR 153 KM 243,900	68.1	54.48
6320	3725	2017-01-02	AVE0096	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSIMAR LOPES DE ASSUNÇÃO	29845	BR 364 K 350,665	104.13	83.3
6321	4405	2017-01-02	NCV1888	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDINEI CANDIDO ZEFERINO	\N	BR 153 KM 451,100	68.1	54.48
6322	510	2017-01-02	AGC2541	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 247+0M RO	85.13	68.1
6323	6570	2017-01-02	AZY5791	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	GO 174 KM 255	766.15	612.92
6324	2500	2017-01-02	APS5203	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	DESLIGADO	Desligado	\N	102.15	0
6325	4970	2017-01-02	AWD7609	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ESMAEL MALHEIROS DA SILVA	11354	BR290 KM 472+200M RS	85.13	68.1
6326	6390	2017-01-02	AYE0621	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR158 KM 637,600	68.1	54.48
6327	4050	2017-01-02	ATD4117	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO SERGIO DA SILVA SANTOS	23185	BR 101 KM 262,040,	68.1	0
6328	3550	2017-01-02	ACZ1599	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ANTONIO CLEYTON AMORIM SANTOS	28330	BR 153 KM 597,650	85.13	68.1
6329	6485	2017-01-02	AYZ8643	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	HERITO PEREIRA GOMES SANTOS	149	BR 364 KM 196,300	69.1	0
6330	7025	2017-01-02	OUG0085	ESTACIONAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	DOMINGOS CRUZ DOS SANTOS	105	BR222 KM678UF/MA- DECRESCENTE	180	144
6331	6520	2017-01-02	AZO8479	PARAR NA PISTA DE ROLAMENTO DAS VIAS COM ACOSTAMENTO	GECIMAR NASCIMENTO 	19	GO 346 KM 001	127.69	102.15
6332	2960	2017-01-02	AQO0864	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 174 KM 12 MULTA OCORRIDA DIA 10/08/2016	85.13	68.1
6333	3470	2017-01-02	ASN2097	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 365 KM 460,900	104.13	83.3
6334	2760	2017-01-02	AQL7376	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 277 KM 234	130.16	104.13
6335	850	2017-01-02	AIA7368	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR364 KM 227+0M	85.13	68.1
6336	2800	2017-01-02	IMQ0445	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	FABRICIO FRANCALINO DA SILVA	28704	BR 174, KM 7	85.13	68.1
6337	7080	2017-01-02	OUJ5418	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DARLAN LEITE VAZ	29087	BE 230 KM 159,750	68.1	54.48
6338	1210	2017-01-02	AKG2144	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 174 KM 585	85.13	68.1
6339	1570	2017-01-02	NCT1566	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	LEUR GILVANY CARNEIRO OLIVEIRA	24315	ROD. BA 262, KM 615,899	85.13	68.1
6340	2365	2017-01-02	APF2054	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 174, KM 585	85.13	68.1
6341	2580	2017-01-02	NDT5692	TRANSITAR PELA CONTRAMÃO DE DIREÇÃO EM VIA COM DUPLO SENTIDO DE CIRCULAÇÃO	EDILSON GOMES	6492	BR 364, KM 435	127.69	102.15
6342	2810	2017-01-02	AQN5331	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE BENEDITO DA SILVA	22230	BR 364 KM 343,940	68.1	54.48
6343	2040	2017-01-02	AGJ9915	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELIEL BALDUINO DE OLIVEIRA	3972	BR 364 KM 175,230	68.1	0
6344	3820	2017-01-02	ABJ1290	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR381 KM 493,290	120	0
6345	3850	2017-01-02	ATA1130	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DESLIGADO	Desligado	BR 070 KM 311,400	104.13	0
6346	6490	2017-01-02	AYY7260	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDENILSON HENNEMANN JORDÃO	35	BR 364, KM 227	85.13	68.1
6347	3910	2017-01-02	AGZ0115	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VALMIR LIMA BORGES	16359	BR 230 KM 503,900	68.1	54.48
6348	4990	2017-01-02	AWE1761	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FABIANO BINI	2624	BR 364 KM 359,250	68.1	54.48
6349	820	2017-01-02	AHV3957	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	JORGE PAULO HENZ	34	GO 213 KM 109	127.69	102.15
6350	820	2017-01-02	AHV3957	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	JORGE PAULO HENZ	34	GO 213 KIM 109 CAMPO ALEGRE DE GOIAS IPAMERI	85.13	68.1
6351	6675	2017-01-02	PQX0794	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SANDOVAL DE JESUS FERNANDES	116	BR 153 KM 671,250	68.1	54.48
6352	850	2017-01-02	AIA7368	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	BR 153 KM 175 COMENDADOR GOMES	80	138.18
6353	4465	2017-01-02	AUB3552	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUIZ CARLOS MORAES	22435	BR 163 KM 753,110	104.13	0
6354	3730	2017-01-02	ASN1458	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 514,190	68.1	54.48
6355	4530	2017-01-02	NDB3625	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	WELTON SANTANA COSTA	11682	BR 158 KM 505,950	127.69	0
6356	6485	2017-01-02	AYZ8643	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	HERITO PEREIRA GOMES SANTOS	149	GO 010 KM 58	104.13	0
6357	3760	2017-01-02	AOO6619	CONDUZIR O VEÍCULO COM QUALQUER UMA DAS PLACAS SEM LEGIBILIDADE E VISIBILIDADE	VAGMAR ALVES DA FONSECA	207	GO 305 KM 014 SENTIDO CATALÃO GOIANDIRA	234.78	0
6358	3760	2017-01-02	AOO6619	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	VAGMAR ALVES DA FONSECA	207	\N	156.18	0
6359	570	2017-01-02	BXH9482	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364, KM 221,800	85.13	68.1
6360	830	2017-01-02	AIA5463	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 226	85.13	68.1
6361	745	2017-01-02	AHB6368	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	CARLOS APARECIDO DOS SANTOS	27695	GO 305 KM 001	102.15	0
6362	2690	2017-01-02	NEA0212	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JORDANIO PAULO PEREIRA DOS SANTOS	114	BR 153 KM 327,300	85.13	68.1
6363	3340	2017-01-02	ARO4462	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	RAIMUNDO FILHO DA SILVA HENRIQUE	225	BR 153 KM 330,080	156.18	124.94
6364	900	2017-01-02	BTA9258	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 382 UF-MS	139.58	111.66
6365	2205	2017-01-02	ANV3726	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 340,685	104.13	83.3
6366	6290	2017-01-02	OVA1273	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADRIANO COSTA LIMA 	26658	BR163  KM 515 UFMS- CRESCENTE	130.16	104.13
6367	4950	2017-01-02	AWI3927	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	SANDOVAL DE JESUS FERNANDES	116	BR 010 KM 193,100	120	102.16
6368	4915	2017-01-02	AWF5881	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	ELTON SANTANA DA SILVA	22086	BR 070 KM 288 UFMT CRESCENTE	85.13	68.1
6369	790	2017-01-02	KCV1932	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MOISES LUIS DOS SANTOS	19213	BR 163 KM 746,385	68.1	54.48
6370	6365	2017-01-02	AYB3788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 250,040	85.13	68.1
6371	2045	2017-01-02	AAY6694	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 145,000	68.1	54.48
6372	2310	2017-01-02	AON5139	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	JOSE CARLOS DE SOUZA	38	BR 316 KM 422 UFMA- CRESCENTE	85.13	68.1
6373	8005	2017-01-02	OUK8525	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	DENILSON DE CARVALHO	8	GO 060 KM 107	104.13	0
6374	6475	2017-01-02	AYZ5647	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 070  KM 6,600	68.1	54.48
6376	4780	2017-01-02	CWQ4261	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DENISON RIBEIRO SANTANA	27996	BR 163 KM 494,830	104.13	83.3
6377	4830	2017-01-02	AWB7320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR153 KM 619,670	68.1	0
6378	2720	2017-01-02	NDN5433	ESTACIONAR NOS ACOSTAMENTOS	SAMUEL VIANA NUNES	117	BR346 KM 57	88.38	0
6379	4200	2017-01-02	AGZ0188	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GISNEY ANDRADE SILVA	112	BR 153 KM 410,050	68.1	54.48
6380	2830	2017-01-02	AQN7413	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR101 KM 44,600	68.1	54.48
6381	2630	2017-01-02	NDT9362	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FLAVIO HELTON GONZAGA	226	BR 153 KM 296,400	104.13	83.3
6382	1030	2017-01-02	AHN3351	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 243,900	68.1	54.48
6383	2410	2017-01-02	AOU2118	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	SIDEMAR MANGAROTTI	23157	BR364 KM520 UF/RO- Decrescente	130.16	104.13
6384	6550	2017-01-02	AZU9715	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 267 KM 361,500	156.18	124.94
6385	2630	2017-01-02	NDT9362	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FLAVIO HELTON GONZAGA	226	\N	85.13	0
6386	2630	2017-01-02	NDT9362	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FLAVIO HELTON GONZAGA	226	BR 354 KM 307,600	85.13	0
6387	3260	2017-01-02	NCY2200	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOELCIO WINCK	\N	BR 163 KM 769,480	68.1	54.48
6388	4435	2017-01-02	AUA8610	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DINEI GOMES DA SILVA	25955	BR 070 KM 279,960	68.1	54.48
6389	5030	2017-01-02	AWG8644	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	JOEL LUIZ DA SILVA	14	\N	104.13	0
6390	3660	2017-01-02	ANX0076	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	EBERTON SILVA	27666	PE 03, EM FRENTE AO POSTO RODOVIÁRIO DO BPRV	104.13	0
6391	6005	2017-01-02	AWN1825	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR364 KM324+500	127.69	102.15
6392	4440	2017-01-02	AUA8524	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE ALVES FERREIRA	\N	BR 153 KM 472,300	68.1	54.48
6393	4870	2017-01-02	AWC1282	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DESLIGADO	Desligado	\N	85.13	0
6394	6600	2017-01-02	GLM5730	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 732,080	104.13	83.3
6395	385	2017-01-02	ACA6668	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 135 KM 309,100	68.1	54.48
6396	2365	2017-01-02	APF2054	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	EDSON PEREIRA DE SOUZA	36	BR487 KM 9 UFPR - DECRESCENTE	130.16	104
6397	6560	2017-01-02	AZY2902	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 330,080	68.1	54.48
6398	4200	2017-01-02	AGZ0188	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GISNEY ANDRADE SILVA	112	BR153 KM 330,080	68.1	54.48
6399	6395	2017-01-02	MBO3426	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 101 KM,020	68.1	0
6400	3510	2017-01-02	ASM2096	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO SERGIO DOS SANTOS	26	BR-153 KM 75,195	68.1	0
6401	6670	2017-01-02	PQX0514	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 71,800	68.1	54.48
6402	6600	2017-01-02	GLM5730	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 365 KM 305,200	68.1	54.48
6403	3045	2017-01-02	NCS9822	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 070 KM 740,840	120	81.72
6404	4705	2017-01-02	AVA3677	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	FABRICIO ALVES DE CAMARGOS	23544	BR 070 KM 665,150	104.13	83.3
6405	645	2017-01-02	AGP1349	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	ANDRE GERMANO DORETTO	27184	PR680 KM07	102.15	0
6406	2270	2017-01-02	AOL4462	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 470 KM 53, MULTA OCORRIDA DIA 09/01/2019	140.28	112.22
6407	6005	2017-01-02	AWN1825	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 158 KM 151,940	68.1	54.48
6408	3100	2017-01-02	AQP6136	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIRO CARLOS PEREIRA	22	BR 163 KM 769,480	104.13	83.3
6409	6485	2017-01-02	AYZ8643	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 572,400	68.1	54.48
6410	6675	2017-01-02	PQX0794	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	BR 262 KM 678,546	68.1	54.48
6411	3970	2017-01-02	NTP1264	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	PABLO BONETTI JUNGLES	27598	\N	293.47	0
6412	3745	2017-01-02	ASP1560	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	AV. JOAO PAULO II, EM FRENTE AI B.P.A	68.1	54.48
6413	3745	2017-01-02	ASP1560	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDINEI CANDIDO ZEFERINO	\N	BR 316 KM 6,800	68.1	54.48
6414	755	2017-01-02	AHC7729	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 274,000	68.1	54.48
6415	2500	2017-01-02	APS5203	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SAMUEL VIANA NUNES	117	BR 010 KM 271,644	68.1	54.48
6416	6620	2017-01-02	NBH7656	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR  153 KM 304,000	104.13	83.3
6417	4470	2017-01-02	AUB3541	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO DULTRA DE OLIVEIRA	17092	BR 163 KM 1067,970	85.13	68.1
6418	4665	2017-01-02	AUZ3716	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VOLNEI DE LARA	15512	BR 101 KM 175+500 M SC	130.16	68.1
6419	4950	2017-01-02	AWI3927	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SANDOVAL DE JESUS FERNANDES	116	BR 153 KM 296,400	85.13	68.1
6420	1030	2017-01-02	AHN3351	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	GERALDO LAURIANO NASCIMENTO	141	GO 330 KM 46	104.13	0
6421	3340	2017-01-02	ARO4462	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DESLIGADO	Desligado	GO 020 KM 12,9	68.1	0
6422	2640	2017-01-02	NDU0332	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	TIAGO BATISTA DA SILVA	137	BR 153 KM 71,800	102.15	81.72
6423	8020	2017-01-02	OUK0433	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DENISON RIBEIRO SANTANA	27996	BR 230 KM 506,900	68.1	54.48
6424	3280	2017-01-02	ARI6190	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	SENIVALDO VITOR FAUSTINO	24781	Br 116 X Km 384	957.69	766.15
6425	3280	2017-01-02	ARI6190	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	SENIVALDO VITOR FAUSTINO	24781	BR 116, KM 384	957.69	766.15
6426	915	2017-01-02	AIO9751	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 263,900	104.13	83.3
6427	6485	2017-01-02	AYZ8643	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR476 KM 233,300	69.1	55.28
6428	4670	2017-01-02	AUZ3423	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	IVAN RUTSATZ	16911	BR 282 KM 79,560	68.1	0
6429	4665	2017-01-02	AUZ3716	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	\N	\N	BR 116 KM 248	85.13	68.1
6430	4935	2017-01-02	AWG1781	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	ANTONIO CLEVIS BARROS	132	GO 060 KM 06	127.69	102.15
6431	1255	2017-01-02	AKN6845	TRANSITAR COM O VEÍCULO COM EXCESSO DE PESO - POR EIXO	GILMAR OLIVEIRA SOUZA	25063	ROS. BA 290 KM 13 MEDEIRO NETO - TEIXEIRA DE FREITAS	85.13	68.1
6432	3560	2017-01-02	ASZ1599	CONDUZIR O VEÍCULO COM EQUIPAMENTO OBRIGATÓRIO INEFICIENTE/INOPERANTE	DAMARIO DE SOUZA OLIVEIRA	21778	ROD.BA131 KM 120,82 RNTR BR 324 (B) (P/ MIGUEL  CALMON) - ENTR	127.69	102.15
6433	1070	2017-01-02	AJS5294	CONDUZIR VEÍCULO C/ REGISTRADOR INSTAN INALT DE VELOCIDADE/TEMPO VICIADO/DEFEITUOSO	DOUGLAS ROBERTO NEVES BEZERRA	247	ROD. PA 124 KM 35 SANTA LUZIA DO PARA / PA	156.18	0
6434	4540	2017-01-02	NDA8645	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	TIAGO BATISTA DA SILVA	137	\N	102.15	0
6435	7025	2017-01-02	OUG0085	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DOMINGOS CRUZ DOS SANTOS	105	BR 153 KM 410,050	85.13	68.1
6436	2500	2017-01-02	APS5203	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 316 KM 262 UFMA - DECRESCENTE	104.13	83.3
6437	4955	2017-01-02	AWI5199	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	LEIDIMAR COSTA LIMA	23058	BR 153 KM 410,050	102.15	81.72
6438	3425	2017-01-02	NEA3398	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DESLIGADO	Desligado	BR 364 KM 9,500	120	156.18
6439	4370	2017-01-02	ATZ2095	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	\N	\N	ROD. BA 262  KM 440,21 ARACATU- BR  030/ BA 026/ BA 148	127.69	102.15
6440	2005	2017-01-02	NCQ0882	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RICARDO DA SILVA MARTINS	30180	BR 262 KM 487,080	85.13	68.1
6441	1120	2017-01-02	AJU1034	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RUDNEY ALVES MAGALHAES JUNIOR	21056	BR 376 KM 589,001	104.13	83.3
6442	3320	2017-01-02	ARL7A67	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	ROBSON MUNIZ DE MORAIS	40	BR 316 KM 422 UFMA CRESCENTE	85.13	68.1
6443	4785	2017-01-02	AWA4930	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	Jose Antonio Juliani	31	BR 381, KM 877	127.69	102.15
6444	6580	2017-01-02	AZY5793	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	GECIMAR NASCIMENTO 	19	GO 330 KM 105 IPAMER URUTAI	102.15	81.72
6445	4350	2017-01-02	ATW6589	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JONAS DO NASCIMENTO	27084	BR 354 KM 237	85.13	68.1
6446	4230	2017-01-02	AGZ0304	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	DESLIGADO	Desligado	\N	102.15	0
6447	6045	2017-01-02	NBR9412	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 470 KM 53, MULTA OCORRIDA DIA 12/10/2016	85.13	68.1
6448	6580	2017-01-02	AZY5793	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	GECIMAR NASCIMENTO 	19	GO 330 KM 105 IPAMERI URUTAI	102.15	81.72
6449	530	2017-01-02	AAG5751	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	MG 439 585, MULTA OCORRIDA NO DIA 18/08/2012	90.45	72.36
6450	1550	2017-01-02	NCT0555	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 040 KM 595,000	68.1	54.48
6451	4920	2017-01-02	AWF3249	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOÃO LAURINDO MOREIRA	26522	BR 364 KM 280,500	68.1	52.08
6452	2700	2017-01-02	NEA0182	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	BRUNO MANGAROTTI FONSECA	26722	BR 364 KM 411,380	68.1	54.48
6453	820	2017-01-02	AHV3957	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON PEREIRA DE SOUZA	36	PR151 KM223	68.09	0
6454	1070	2017-01-02	AJS5294	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	BR 153 KM 496,000	68.1	54.48
6455	3280	2017-01-02	ARI6190	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VILOBALDO FRANÇA	23669	BR 101 KM 504,940	68.1	54.48
6456	1030	2017-01-02	AHN3351	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GISNEY ANDRADE SILVA	112	GO - 020 KM 33,3 / GOIANIA / BELA VISTA / GO	68.1	0
6457	420	2017-01-02	AOH6666	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 276,000	68.1	54.48
6458	6480	2017-01-02	AYZ4108	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCOS ANTONIO DA COSTA	22438	BR 364 KM 276,000	68.1	54.48
6459	2365	2017-01-02	APF2054	TRANSITAR C/ VEIC C/ DIMENSOES OU CARGA SUP A LEGISLACAO	ADEMAR ANTONIO DOS SANTOS	15	GO 212 KM 112 CALDAS NOVAS IPAMERI	102.15	0
6460	4955	2017-01-02	AWI5199	CONDUZIR O VEIC EM MAU ESTADO DE CONSERVACAO	LEIDIMAR COSTA LIMA	23058	\N	127.69	102.15
6461	6515	2017-01-02	AZO8477	TRANSITAR COM O VEÍCULO EM CALÇADAS. PASSEIOS	GISNEY ANDRADE SILVA	112	GO 060 KM 0	574.61	459.69
6462	4250	2017-01-02	AGZ0199	CONDUZIR O VEÍCULO SEM QUALQUER UMA DAS PLACAS DE IDENTIFICAÇÃO	TIAGO BATISTA DA SILVA	137	GO 330 KM 150 PIRES DO RIO URUTAI	153.23	0
6463	3140	2017-01-02	AQR7284	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	SIDNEI BURIAN	23	BR 70 KM 35,00	102.15	81.72
6464	6520	2017-01-02	AZO8479	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 040 KM 9,850	68.1	68.1
6465	1720	2017-01-02	NCT2088	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARILDO ALVES DE OLIVEIRA	29643	\N	104.13	0
6466	1720	2017-01-02	NCT2088	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARILDO ALVES DE OLIVEIRA	29643	BR 070 KM 728530	104.13	0
6467	4370	2017-01-02	ATZ2095	TRANSITAR PELA CONTRAMÃO DE DIREÇÃO EM VIA COM DUPLO SENTIDO DE CIRCULAÇÃO	SANDRO GABRIEL DE MORAES MOTA	28739	BR 407 KM 120 UFBA - CRESCENTE	127.69	156.18
6468	6580	2017-01-02	AZY5793	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 020 KM 57,900	68.1	54.48
6469	4700	2017-01-02	AUZ8422	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VILOBALDO FRANÇA	23669	BR 230 KM 115,950	68.1	54.48
6470	2520	2017-01-02	APX8950	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	RUAN FERREIRA DA SILVA	219	GO 330 KM 150	156.18	0
6471	4325	2017-01-02	ATV6796	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 386 KM 4,665	102.15	81.72
6472	4960	2017-01-02	AWD3204	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ITAMAR ALVES	\N	BR 070 KM 540,170	68.1	54.48
6473	6245	2017-01-02	OVB8860	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO MARCIO DA SILVA	21808	BR 364 KM 176,550	104.13	0
6474	4200	2017-01-02	AGZ0188	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	DESLIGADO	Desligado	\N	80	64
6475	365	2017-01-02	AEU7528	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEBER BORGES MARTINES PEDROSA	29206	BR 364 KM 194,200	68.1	54.48
6476	1490	2017-01-02	NCR3413	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 101 KM 79 UFPE CRESCENTE	80	6810.4
6477	3750	2017-01-02	ATF1590	TRANSITAR C/ VEIC C/ DIMENSOES OU CARGA SUP A LEGISLACAO	JOSE NILSON DOS SANTOS	28	GO 330 KM 105 IPAMERI / GO	102.15	0
6478	1535	2017-01-02	NCU3177	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NIVALDO DE OLIVEIRA FREITAS	24290	BR101 KM 11,020	68.1	0
6479	1375	2017-01-02	CLH0534	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR364 KM 674	85.13	68.1
6480	2465	2017-01-02	APS9626	CONDUZIR O VEIC C/ O LACRE, ETC OU OUTRO ELEM VIOLADO	VALDEMIR ROCHA DOS SANTOS	19	GO 330 KM 046	153.23	0
6481	3320	2017-01-02	ARL7A67	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMIR GUION	25	BR 264 KM264,790	104.13	83.3
6482	4250	2017-01-02	AGZ0199	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOAO PAULO NASCIMENTO VERAS	144	BR 153 KJM 194,615	104.13	83.3
6483	2360	2017-01-02	APG2054	TRANS COM VEÍCULO DESAC C/ESPECIFICAÇÃO/FALTA DE INSCR/SIMBOLOGIA NECESSÁRIA IDENTIF	VALDEMIR ROCHA DOS SANTOS	19	GO 330 KM 046	102.15	0
6484	3470	2017-01-02	ASN2097	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 528,600	104.13	83.3
6485	6670	2017-01-02	PQX0514	CONDUZIR O VEIC COM A COR OU CARACTERISTICA ALTERADA	AGUINALDO ROCHA GUIMARAES	121	PA 447 KM 14	156.18	0
6486	2360	2017-01-02	APG2054	TRANS COM VEÍCULO DESAC C/ESPECIFICAÇÃO/FALTA DE INSCR/SIMBOLOGIA NECESSÁRIA IDENTIF	VALDEMIR ROCHA DOS SANTOS	19	GO 330 KM 046	102.15	0
6487	2990	2017-01-02	AMX5243	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DESLIGADO	Desligado	\N	104.13	0
6488	4950	2017-01-02	AWI3927	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SANDOVAL DE JESUS FERNANDES	116	BR 226 KM 39,830	68.1	0
6489	6665	2017-01-02	PQX0454	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	GILSON SOUZA	106	BR153 KM67 UF/GO- DECRESCENTE	127.69	102.15
6490	7015	2017-01-02	OUG7788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO SERGIO FERREIRA CAVALCANTE	24782	BR-267 KM395,590	68.1	68.1
6491	2360	2017-01-02	APG2054	CONDUZIR VEÍCULO C/ REGISTRADOR INSTAN INALT DE VELOCIDADE/TEMPO VICIADO/DEFEITUOSO	VALDEMIR ROCHA DOS SANTOS	19	GO 330 KM 046	102.15	0
6492	6665	2017-01-02	PQX0454	CONDUZIR VEÍC DE TRANSP PASSAG OU CARGA EM DESACORDO C/ AS COND DO ART 67-A CTB	GILSON SOUZA	106	BR153 KM67 UF/GO- Decrescente	127.69	102.15
6493	7015	2017-01-02	OUG7788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO SERGIO FERREIRA CAVALCANTE	24782	BR-267 KM395,780	68.1	68.1
6494	530	2017-01-02	AAG5751	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	MG 439 585	90.45	72.36
6495	4250	2017-01-02	AGZ0199	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	DESLIGADO	Desligado	\N	102.15	0
6496	6045	2017-01-02	NBR9412	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SIDNEI BURIAN	23	\N	85.13	68.1
6497	6190	2017-01-02	OUK8345	EM MOVIMENTO. DEIXAR DE MANTER ACESA A LUZ BAIXA DURANTE À NOITE	\N	\N	PR 323 KM 286 + 100M	68.09	0
6498	4250	2017-01-02	AGZ0199	CONDUZIR O VEÍCULO COM QUALQUER UMA DAS PLACAS SEM LEGIBILIDADE E VISIBILIDADE	DESLIGADO	Desligado	\N	153.23	0
6499	6665	2017-01-02	PQX0454	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	GILSON SOUZA	106	Capelinha-mg	112.64	0
6500	4630	2017-01-02	LWH5539	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	RONIEL CARDOSO SANTANA	25919	ROD BA 120 KM 236,79 ENTR BA 381  (CANSANCAO) ENTR BA 383	127.69	102.15
6501	4950	2017-01-02	AWI3927	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	DESLIGADO	Desligado	\N	72.36	0
6502	4300	2017-01-02	CKT5776	ESTACIONAR EM DESACORDO COM AS POSIÇÕES ESTABELECIDAS NO CTB	HERMES MEDEIROS DE OLIVEIRA	13975	RUA BENJAMIM CONSTANT N1352	85.13	54.47
6503	4635	2017-01-02	LWH5409	CONDUZIR O VEÍCULO COM QUALQUER UMA DAS PLACAS SEM LEGIBILIDADE E VISIBILIDADE	RAIMUNDO SENA PINTO	28366	BA502 KM 21	293.47	234.78
6504	1535	2017-01-02	NCU3177	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NIVALDO DE OLIVEIRA FREITAS	24290	BR, 319, KM 329	85.13	68.1
6505	4935	2017-01-02	AWG1781	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	JOSE RAIMUNDO DE OLIVEIRA	224	\N	104.13	0
6506	3810	2017-01-02	AEQ1440	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIR GOMES DA SILVA	19195	BR 158 KM 402,800	104.13	83.3
6507	4860	2017-01-02	AWC9135	AVANÇAR O SINAL VERMELHO DO SEMÁFORO - FISCALIZAÇÃO ELETRÔNICA	WILSINER SILVA DE CARVALHO	138	AV. ALMIRANTE TAMANDARE X TV. PADRE EUTIQUIO	191.54	153.23
6508	2950	2017-01-02	AQP6134	DEIXAR GUARDAR DIST SEGURANÇA LAT/FRONT ENTRE SEU VEÍCULO E DEMAIS E AO BORDO PISTA	CESAR MACHADO DE AZEVEDO	19317	BR153 KM 17	127.69	102.15
6509	3570	2017-01-02	AGZ2050	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 554,600	68.1	54.48
6510	3705	2017-01-02	NBG7891	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE LAURENI DE SILVA	25957	BR 364 KM 276	85.13	68.1
6511	3760	2017-01-02	AOO6619	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	VAGMAR ALVES DA FONSECA	207	\N	1173.88	0
6512	1525	2017-01-02	NCU3167	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DESLIGADO	Desligado	BR 158 KM 505,950	102.15	0
6513	2430	2017-01-02	AOU2115	DIRIGIR O VEÍCULO USANDO CALÇADO QUE NÃO SE FIRME NOS PÉS/COMPROMETA UTILIZ PEDAIS	JOSE NIVALDO DE OLIVEIRA FREITAS	24290	ROD. BA 262 Km. 439 BRUMADO - ARACATU	130.16	0
6514	4840	2017-01-02	AWB7318	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	IVAN GONÇALVES RIBEIRO	22515	BR 264 KM 264,790	68.1	54.48
6515	6665	2017-01-02	PQX0454	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILSON SOUZA	106	BR 153 KM 71,800	68.1	54.48
6516	4965	2017-01-02	AWD7591	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 470 KM 53, MULTA OCORRIDA DIA 28/12/2016	209.36	167.49
6517	6485	2017-01-02	AYZ8643	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 153 KM 690,120	120	81.72
6518	6490	2017-01-02	AYY7260	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDENILSON HENNEMANN JORDÃO	35	BR 163 KM 382+0M MS	130.16	104.13
6519	6520	2017-01-02	AZO8479	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	GECIMAR NASCIMENTO 	19	GO 139 KM 056	68.1	0
6520	1525	2017-01-02	NCU3167	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	LUIZ FRANCISCO DE SOUZA	26523	BR 153 KM 497 UF GO DECRESCENTE	85.13	68.1
6521	1750	2017-01-02	NCT4919	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	RICARDO FRANCISCO DE ASSIS	16	BR 163, KM 501,800	85.13	68.1
6522	3970	2017-01-02	NTP1264	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GHIARLLAN EVANGELISTA BORGES MORAES	21138	AV. NOIDE CERQUEIRA 230 M SAO PEDRO ALDEIA BC	85.13	0
6523	1275	2017-01-02	AKO3699	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DANIEL SOUZA ALMEIDA JUNIOR	28003	BR 222 KM 90,460	104.13	83.3
6524	3910	2017-01-02	AGZ0115	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DENISON RIBEIRO SANTANA	27996	BR 222 KM 30,500	68.1	54.48
6525	1525	2017-01-02	NCU3167	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUIZ FRANCISCO DE SOUZA	26523	BR  040 KM, 7,000	68.1	54.48
6526	4200	2017-01-02	AGZ0188	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	WILSINER SILVA DE CARVALHO	138	GO 330 KM 150	156.18	0
6527	4375	2017-01-02	ATZ8141	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JUTAIR SANTOS SOARES	23436	BR 104 KM 62,500	104.13	83.3
6528	4690	2017-01-02	AUZ8420	EM MOVIMENTO DE DIA. DEIXAR DE MANTER ACESA LUZ BAIXA NAS RODOVIAS.	CARLOS ROBERTO FONSECA BOAVENTURA	16247	BR 101 KM 68 UFSE DECRESCENTE	85.13	68.1
6529	4145	2017-01-02	NCY7149	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELINALDO BORGES DA HORA SILVA	11525	BR 1101 KM 185,500	68.1	54.48
6530	4455	2017-01-02	AUA8522	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	\N	\N	BR 316, KM 207	127.69	102.15
6531	6190	2017-01-02	OUK8345	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	GO 010 KM 148	104.13	0
6532	6580	2017-01-02	AZY5793	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	CLEIDIVAN DE CARVALHO CELESTINO	28	BR 153 KM 507 UF/GO - DECRESCENTE	80	68.1
6533	7025	2017-01-02	OUG0085	CONDUZIR VEÍC COM VIDRO TOTAL/PARCIALMENTE COBERTO POR PELÍCULA. PAINÉIS/PINTURA	GIOVANI FILHO PEREIRA DA SILVA	16	BR 153, KM67	127.69	102.15
6534	2440	2017-01-02	AOU3266	DIRIGIR SEM ATENÇÃO OU SEM OS CUIDADOS INDISPENSÁVEIS À SEGURANÇA	NOEL PINHEIRO DA CRUZ	26242	\N	42.81	0
6535	4300	2017-01-02	CKT5776	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILMAR PAIA BONIFACIO	29381	BR 060 KM 508,600	68.1	0
6536	3910	2017-01-02	AGZ0115	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DENISON RIBEIRO SANTANA	27996	BR 222 KM 47,900	68.1	54.48
6537	4920	2017-01-02	AWF3249	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	ANTENOR DOS SANTOS LIMA JUNIOR	21094	BR364 KM 373 UFMT - DECRESCENTE	1476.35	1181.08
6538	4200	2017-01-02	AGZ0188	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	WILSINER SILVA DE CARVALHO	138	BR 153 KM 71,800	104.13	83.3
6539	4535	2017-01-02	NDB4395	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	ALLYSON BRUNO DIAS RODRIGUES DE ARAUJO	146	\N	102.15	0
6540	6045	2017-01-02	NBR9412	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	SIDNEI BURIAN	23	BR 262 KM 6,250	153.23	0
6541	4100	2017-01-02	AAV7009	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	BRUNO HENRIQUE DOS SANTOS	37	BR 381, KM 886,250	85.13	68.1
6542	3230	2017-01-02	ARA4018	ESTACIONAR EM DESACORDO COM AS POSIÇÕES ESTABELECIDAS NO CTB	RICARDO APARECIDO SANTOS SILVA	30401	\N	68.1	0
6543	4465	2017-01-02	AUB3552	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUIZ CARLOS MORAES	22435	BR070 KM 731,500	68.1	54.48
6544	6515	2017-01-02	AZO8477	CONDUZIR VEÍCULO SEM OS DOCUMENTOS DE PORTE OBRIGATÓRIO REFERIDOS NO CTB	GECIMAR NASCIMENTO 	19	GO 118 KM 092	70.7	0
6545	6540	2017-01-02	AZU5059	CONDUZIR O VEÍCULO COM EQUIP OBRIGATÓRIO EM DESACORDO COM O ESTAB PELO CONTRAN	DESLIGADO	Desligado	go 060 km 36	102.15	0
6546	820	2017-01-02	AHV3957	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SAMUEL VIANA NUNES	117	BR 153, KM 511,900	85.13	68.1
6547	3750	2017-01-02	ATF1590	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE NILSON DOS SANTOS	28	BR 364, KM 227	85.13	68.1
6548	6190	2017-01-02	OUK8345	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 213 KM 056	104.13	0
6549	2040	2017-01-02	AGJ9915	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ELIEL BALDUINO DE OLIVEIRA	3972	BR 070 KM 418,840	68.1	0
6550	4030	2017-01-02	ATD2714	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROBSON HERMES DA SILVA	22392	BR 262 KM 168,700	85.13	68.1
6551	5030	2017-01-02	AWG8644	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADAIRTON DE SANTANA CHALEGRE	10	BR 381, KM 886,250	85.13	68.1
6552	5590	2017-01-02	AWO3560	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 364 KM 223, MULTA OCORRIDA DIA 04/10/2016	127.69	102.15
6553	1140	2017-01-02	AJW1071	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	FLAVIO HELTON GONZAGA	226	BR153 KM507UF/GO- DECRESCENTE	130.16	68.1
6554	450	2017-01-02	AFC3176	DIRIGIR O VEICULO UTILIZANDO-SE DE FONES, TELEFONE CELULAR	JONAS SILVA RIBEIRO	24160	BR 364 KM 395 UFMT - CRESCENTE	130.16	64
6555	1535	2017-01-02	NCU3177	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	BR 116 KM 383 UFCE - DECRESCENTE	104.13	83.3
6556	6480	2017-01-02	AYZ4108	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCOS ANTONIO DA COSTA	22438	BR 070 KM 279,960	68.1	54.48
6557	6190	2017-01-02	OUK8345	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	\N	\N	GO 330 KM 150	80	104.13
6558	3280	2017-01-02	ARI6190	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 1010 KM 262,040	68.1	54.48
6559	6665	2017-01-02	PQX0454	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	GILSON SOUZA	106	BR 153 KM 361 EF GO - CRESCENTE	1467.35	1173.88
6560	4830	2017-01-02	AWB7320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CARLOS APARECIDO DOS SANTOS	27695	BR 153 KM 71,800	68.1	54.48
6561	2930	2017-01-02	NDX0774	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 174, KM 12,750	85.13	68.1
6562	6605	2017-01-02	BAE8370	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	MARCOS GODOY DE LIMA	6248	BR364 KM 221+800M MT	85.13	68.1
6563	3585	2017-01-02	NCG7320	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DANIEL LUIS DOS SANTOS	19662	BR 364 KM 196,300	104.13	0
6564	1415	2017-01-02	ALH2054	TRANS COM VEÍCULO DESAC C/ESPECIFICAÇÃO/FALTA DE INSCR/SIMBOLOGIA NECESSÁRIA IDENTIF	EDENILSON HENNEMANN JORDÃO	5	Catalao-go	127.69	0
6565	2530	2017-01-02	APU6320	DEIXAR O CONDUTOR/PASSAGEIRO DE USAR O CINTO DE SEGURANCA	JOSYELL ALVES DE JESUS	179	GO 244 KM 62	156.18	0
6566	6485	2017-01-02	AYZ8643	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 153 KM 432,200	102.15	81.72
6567	4490	2017-01-02	NCI9935	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSE CARLOS VIRGINIO DA SILVA	18243	BR 230 KM 152,700	104.13	0
6568	980	2017-01-02	MAA9532	CONDUZIR O VEÍCULO COM EQUIPAMENTO OU ACESSÓRIO PROIBIDO	OSIEL DE QUEIROZ MUNIZ	11430	BR 364, KM 387	127.69	102.15
6569	4665	2017-01-02	AUZ3716	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VOLNEI DE LARA	15512	BR 373, KM 479,060	85.13	0
6570	4370	2017-01-02	ATZ2095	NA FAIXA OU VIA DE TRÂNSITO EXCLUSIVO. REGULAMENTADA COM CIRCULAÇÃO DESTINADA AOS VEÍCULOS DE TRANSP	JOSIMARIO JOAO DOS SANTOS	28426	\N	153.23	0
6571	4100	2017-01-02	AAV7009	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DIRCEU KAMPFER MARQUES	33	BR 163, KM 87,400	85.13	68.1
6572	6485	2017-01-02	AYZ8643	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 241,900	68.1	54.48
6573	6435	2017-01-02	AYK5627	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	BR 101 KM 91,700	68.1	54.48
6574	4010	2017-01-02	ATD8971	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	JOSIMARIO JOAO DOS SANTOS	28426	BR-267 KM 124,880	68.1	0
6575	6475	2017-01-02	AYZ5647	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	DESLIGADO	Desligado	\N	68.1	0
6576	4540	2017-01-02	NDA8645	CONDUZIR VEÍC C/ DEFEITO NO SIST DE ILUMINAÇÃO. SINALIZ OU LÂMPADAS QUEIMADAS	GENILSON DE SOUSA COELHO	140	BR 153, KM 67	130.16	104.13
6577	8020	2017-01-02	OUK0433	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	SILVIO OLIVEIRA SANTOS	8453	BR-101 KM94,080	104.13	0
6578	4465	2017-01-02	AUB3552	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUIZ CARLOS MORAES	22435	BR 070 KM 620,450	85.13	68.1
6579	5040	2017-01-02	AWG8640	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	DEVALDINO PEDRO TORRES	11	BR 364 KM 264,790	68.1	54.48
6580	6515	2017-01-02	AZO8477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEITON TONON DEOCLECIO	128	BR381 KM 493,290	68.1	0
6581	1550	2017-01-02	NCT0555	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 040 KM 588,507	68.1	54.48
6582	4535	2017-01-02	NDB4395	CONDUZIR O VEIC EM MAU ESTADO DE CONSERVACAO	CLEITON TONON DEOCLECIO	128	BR 259, KM 144	120	102.15
6583	7015	2017-01-02	OUG7788	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	PAULO SERGIO FERREIRA CAVALCANTE	24782	BR-267 KM395,780	68.1	68.1
6584	2030	2017-01-02	NCQ0932	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOMARIO JORGE FREITAS DE SOUZA JUNIOR	22920	BR153 KM 330,080	68.1	54.48
6585	6560	2017-01-02	AZY2902	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILSON SOUZA	106	BR 153 KM 243,900	68.1	54.48
6586	6370	2017-01-02	OZE9396	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	\N	97.97	78.38
6587	6285	2017-01-02	OVA1884	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	\N	103.73	82.98
6588	6515	2017-01-02	AZO8477	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	VINICIUS LIMA BEZERRA	139	BR 153 KM 663,130	68.1	54.48
6589	4440	2017-01-02	AUA8524	TRANSITAR LOCAL/HORARIO NAO PERMITIDO	\N	\N	BOMBINHAS SANTA CATARINA	65.5	52.4
6590	730	2017-01-02	AGZ6481	AVANCAR O SINAL VERMELHO DO SEMAFORO OU DE PARADA	GILMAR PAIA BONIFACIO	29381	BR-262 KM 6,250	234.79	0
6591	3715	2017-01-02	ASO1590	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	BR 364, KM 392	957.69	766.15
6592	3220	2017-01-02	ARA4017	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	GILSON SOUZA	106	BR 262 KM 95,800	68.1	54.48
6593	350	2017-01-02	1857716	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 411,380	68.1	54.48
6594	4160	2017-01-02	NEC2958	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LAERTE IRIAS DE SOUZA	16694	BR 364 KM 194,200	68.1	54.48
6595	1730	2017-01-02	NCT2388	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUIZ FERNANDO RIBEIRO OLIVEIRA	28680	BR 101 KM 208,8902	104.13	83.3
6596	6485	2017-01-02	AYZ8643	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 153 KM 597,650	68.1	54.48
6597	6245	2017-01-02	OVB8860	CONDUZIR O VEÍCULO COM EQUIPAMENTO OU ACESSÓRIO PROIBIDO	JOAO MARCIO DA SILVA	21808	BR 364, KM 387	127.69	102.15
6598	2300	2017-01-02	AOL2105	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	UBIRANEY ARAUJO DE ALBUQUERQUE	28738	BR 343 KM 186,000	68.1	54.48
6599	2980	2017-01-02	IPE2395	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ROBSON MUNIZ DE MORAIS	40	BR 364 KM 543,360	104.13	0
6600	810	2017-01-02	AHS9704	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	BRUNO HENRIQUE DOS SANTOS	37	BR 163 KM 609+0M MS	85.13	68.1
6601	4070	2017-01-02	ATD8970	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLAUDEMIR GOMES DA SILVA	19195	BR 158 KM 402,800	68.1	54.48
6602	400	2017-01-02	AEQ3754	DESOBEDECER ÀS ORDENS EMANADAS DA AUTORID COMPET DE TRÂNSITO OU DE SEUS AGENTES	AQUILES FERREIRA DE ANDRADE	6715	COMPLEXO VIARIO DO ENTRONCAMENTO X AV. ALM. BARROSO	129.69	0
6603	4440	2017-01-02	AUA8524	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM MAIS DE 50%	JOSE ALVES FERREIRA	\N	BR 158 KM 505,950	459.7	367.76
6604	4870	2017-01-02	AWC1282	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	EDSON FERREIRA DA PENHA	26539	BR 364 KM 239,180	68.1	54.48
6605	3570	2017-01-02	AGZ2050	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR 153 KM 330,080	120	81.7
6606	1690	2017-01-02	LZL3753	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR-364 KM 319,225	68.1	0
6607	1470	2017-01-02	NCT1613	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 364 KM 126,000	68.1	54.48
6608	4330	2017-01-02	BWM0046	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	LUIZ FRANCISCO DE SOUZA	26523	BR 070 KM 277,720	68.1	0
6609	1500	2017-01-02	NCR3513	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	AUDECIR JOSE FUZARI JUNIOR	27992	BR 364 KM 707,660	104.13	0
6610	4470	2017-01-01	AUB3541	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	PAULO DULTRA DE OLIVEIRA	17092	BR364 KM387	127.69	0
6611	4470	2017-01-01	AUB3541	CONDUZIR VEÍC COM VIDRO TOTAL/PARCIALMENTE COBERTO POR PELÍCULA. PAINÉIS/PINTURA	PAULO DULTRA DE OLIVEIRA	17092	BR364 KM387	127.69	102.15
6612	3920	2017-01-01	AGZ0114	TRANSITAR EM DESACORDO C/ AUTORIZACAO ESPECIAL SUPERDIMENS	MANOEL EVANGELISTA GONCALVES DE JESUS	18776	BR230 KM70	127.69	0
6613	6570	2017-01-01	AZY5791	DIRIGIR SEM ATENÇÃO OU SEM OS CUIDADOS INDISPENSÁVEIS À SEGURANÇA	BRUNO ALVES PEREIRA	135	GO 164 KM 005 TRECHO BR 060 SANTAHELENA DE GOIAS	42.57	34.06
6614	4545	2017-01-01	NCY4696	CONDUZIR O VEÍCULO COM EQUIPAMENTO OU ACESSÓRIO PROIBIDO	LAERTE IRIAS DE SOUZA	16694	BR364  KM387UFMT	127.69	0
6615	5590	2017-01-01	AWO3560	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	YAGO NOBRES DINIZ OLIVEIRA	25598	BR364KM 221,800	85.13	68.1
6616	4845	2017-01-01	AWC1346	CONDUZIR O VEÍCULO COM EQUIPAMENTO OU ACESSÓRIO PROIBIDO	CELIO APARECIDO SOUZA SANTOS	6634	BR364 KM 387 UFMT	127.69	102.15
6617	4845	2017-01-01	AWC1346	CONDUZIR O VEÍCULO C/ EQUIP DO SISTEMA DE ILUMINAÇÃO E DE SINALIZAÇÃO ALTERADOS	CELIO APARECIDO SOUZA SANTOS	6634	BR364 KM387	127.69	0
6618	4545	2017-01-01	NCY4696	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	LAERTE IRIAS DE SOUZA	16694	BR364 KM 387	120	102.15
6619	3320	2017-01-01	ARL7A67	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMIR GUION	25	BR 364 KM 226+0M  MT	85.13	68.1
6620	4230	2017-01-01	AGZ0304	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	\N	\N	BR153 KM 162	957.69	0
6621	1500	2017-01-01	NCR3513	TRANSITAR PELA CONTRAMÃO DE DIREÇÃO EM VIA COM DUPLO SENTIDO DE CIRCULAÇÃO	AUDECIR JOSE FUZARI JUNIOR	27992	BR364 KM 435	127.69	0
6622	3850	2017-01-01	ATA1130	CONDUZIR O VEIC EM MAU ESTADO DE CONSERVACAO	VERONILDO PEREIRA CUSTODIO	29204	BR427 KM2	127.69	0
6623	6560	2017-01-01	AZY2902	CONDUZIR O VEIC S/ EQUIPAMENTO OBRIGATORIO OU INEFICIENTE	ROGERIO FERREIRA	20	BR010 KM156	127.69	0
6624	3710	2017-01-01	AHJ5474	CONDUZIR O VEIC C/ O LACRE, ETC OU OUTRO ELEM VIOLADO	\N	\N	BR364 KM760	191.54	153.23
6625	2650	2017-01-01	NEA0262	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	JOSEVALDO DOS SANTOS SUBRINHO	25604	BR 428 KM 189,400	104.13	83.3
6626	3320	2017-01-01	ARL7A67	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMIR GUION	25	BR 381 KM 886+250 M MG,                      MULTA OCORRIDA DIA 01/08/2016	68.1	68.1
6627	5590	2017-01-01	AWO3560	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 163 KM 87 , OCORRIDA DIA 23/08/2016	85.13	68.1
6628	615	2017-01-01	AGM5438	CONDUZIR O VEIC EM MAU ESTADO DE CONSERVACAO	EVANDSON CASTRO DO NASCIMENTO	10743	BR158 KM560	127.69	102.15
6629	2640	2017-01-01	NDU0332	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	CLEITON TONON DEOCLECIO	128	BR 153 KM 280,784	104.13	83.3
6630	4190	2017-01-01	AGZ0299	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR 116 KM 79 UF RS, MULTA OCORRIDA DIA 03/08/2016	85.13	68.1
6631	2980	2017-01-01	IPE2395	TRANSITAR C/ O VEIC C/ EXCESSO DE PESO	\N	\N	ROD BA 524 KM 6 CANAL TRAFE, MULTA OCORRIDA DIA 04/11/2018	90.45	72.36
6632	420	2017-01-01	AOH6666	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	\N	\N	BR070 KM42+500m	85.13	0
6633	2000	2017-01-01	AAK8762	QDO VEIC EM MOVIM NAO ACENDER LUZ BAIXA DE DIA TUNEIS	CAIQUE JEAN BENTO DA SILVA	30070	BR 407 KM 446 UFPI - DECRESCENTE MULTA OCORRIDA DIA 26/12/2016	104.13	83.3
6634	2980	2017-01-01	IPE2395	TRANSITAR EM DESACORDO C/ AUTORIZACAO ESPECIAL SUPERDIMENS	CLAUDEMIRO CARLOS PEREIRA	22	KM 500 SP 413	120	102.15
6635	1255	2017-01-01	AKN6845	EM MOV. DEIXAR DE MANTER ACESA LUZ BAIXA VEÍC TRANSP COLETIVO FAIXA/PISTA EXCLUSIVA	ANTONIO CLEYTON AMORIM SANTOS	28330	BR110 KM109	85.13	0
6636	6285	2017-01-01	OVA1884	TRANSITAR VELOC SUP MAX PERMITIDA EM MAIS DE 20% ATE 50%	\N	\N	BR267 KM39 UFMS - CRESCENTE	127.69	0
6637	3320	2017-01-01	ARL7A67	TRANSITAR EM VELOCIDADE SUPERIOR À MÁXIMA PERMITIDA EM ATÉ 20%	ADEMIR GUION	25	BR 381 KM 653+740 M	104.13	83.3
6638	940	2017-01-01	AIY2379	DEIXAR DE CONSERVAR NAS FAIXAS DA DIREITA O VEÍCULO LENTO E DE MAIOR PORTE	RICARDO FRANCISCO DE ASSIS	16	BR163 KM105	85.13	68.1
6639	4470	2017-01-01	AUB3541	ULTRAPASSAR PELA CONTRAMÃO LINHA DE DIVISÃO DE FLUXOS OPOSTOS. CONTÍNUA AMARELA	PAULO DULTRA DE OLIVEIRA	17092	BR364 KM340	957.69	0
\.


--
-- TOC entry 3058 (class 0 OID 32805)
-- Dependencies: 215
-- Data for Name: ocorrencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ocorrencia (idocorrencia, idusuario, idusuarioinclusao, datainclusao, idtipoocorrencia, dataocorrencia) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 32810)
-- Dependencies: 217
-- Data for Name: situacaousuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.situacaousuario (idsituacaousuario, descricao) FROM stdin;
1	Férias
2	Jornada Normal
3	Auxilio Doenca
4	Atestado
5	Acidente de trabalho
6	Folga
7	Demitido
\.


--
-- TOC entry 3062 (class 0 OID 32815)
-- Dependencies: 219
-- Data for Name: tipoocorrencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipoocorrencia (idtipoocorrencia, nome, descricao) FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 32823)
-- Dependencies: 221
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (idusuario, idsituacaousuario, idfilial, nome, email, senha, status, foto, cpf, datanascimento, admissao, idcargousuario) FROM stdin;
2848	\N	180001	ARMANDO LUIZ BRETAS NETO	armando.luiz@gazin.com.br	711d132bca779416cc0fc1384681a69efa365af1	1	\N	9876068911	\N	2018-01-01	\N
2719	\N	10001	CELIO ROBERTO CANTUARIOS	celio.cantuarios@gazin.com.br	711d132bca779416cc0fc1384681a69efa365af1	1	\N	2424172994	\N	2019-01-01	\N
2606	\N	10146	REINAILDO ALVES RODRIGUES 	\N	\N	1	\N	1537238582	\N	2017-03-06	\N
2607	\N	140001	SERGIO RAEL FERREIRA 	\N	\N	1	\N	77457730168	\N	2016-12-12	\N
2608	\N	140001	WILSINER SILVA DE CARVALHO 	\N	\N	1	\N	80081398115	\N	2016-09-01	\N
2609	\N	190005	ALEX SANDRO BERLOFA GARCIA	\N	\N	1	\N	84925035134	\N	2018-10-08	\N
2610	\N	10121	ALBERTINO VIRGULINO DOS SANTOS 	\N	\N	1	\N	97239526100	\N	2017-07-21	\N
2611	\N	140001	DOUGLAS ROBERTO NEVES BEZERRA	\N	f5f15426521bef68e0e0ec16723b27d20a88c3b1	1	\N	56331177	\N	2016-12-05	\N
2612	\N	10265	RODRIGO DA FONSECA	\N	\N	1	\N	62219259	\N	2006-10-02	\N
2613	\N	190004	ROMILSON ALMEIDA DA SILVA	\N	2b3c876f61ed81db65116245b6ad1fdf71d136f3	1	\N	69601542	\N	2014-05-20	\N
2614	\N	10146	EDSON NOVAES DOS SANTOS 	\N	\N	1	\N	111719526	\N	2020-02-20	\N
2615	\N	140001	FLAVIANO OLIVEIRA DA SILVA	\N	3a7876ff96f347409e2363494e25037965e5c7e9	1	\N	128949155	\N	2018-03-20	\N
2616	\N	10146	EVANGEVALDO RIOS LIMA	\N	7eb179c032187bbccc6cf407edb3d149f56ba694	1	\N	169189597	\N	2015-05-11	\N
2617	\N	190004	DAVID FERREIRA NASCIMENTO JUNIOR	\N	da6adc270ae2afe93c391ee98e3a1eaf0939acc8	1	\N	198652526	\N	2019-07-10	\N
2618	\N	10121	MARCOS GODOY DE LIMA	\N	dac7d64aa3928ef5777f714587b54e0bd0b4823c	1	\N	200457195	\N	2005-02-01	\N
2619	\N	10121	CELIO APARECIDO SOUZA SANTOS 	\N	\N	1	\N	200498118	\N	2005-06-01	\N
2620	\N	190003	VOLNEI DE LARA	\N	c95fa5d56f742d943dece5e1cc63016c42432dff	1	\N	205660002	\N	2010-10-02	\N
2621	\N	10146	ELICARLOS DE OLIVEIRA SILVA	\N	e669b99b252eb43ea20d676753e040a6e72e10c8	1	\N	216021588	\N	2013-10-10	\N
2622	\N	10146	GILMARIO SANTOS ARAUJO	\N	c495148545e150f5ce15af7f43e6b6a23df03a57	1	\N	216071500	\N	2013-08-01	\N
2623	\N	10146	MOISES OLIVEIRA CARNEIRO	\N	e4e7cc3135dd05dcf2b91629d6cb26ba7a58d055	1	\N	220761582	\N	2015-05-04	\N
2624	\N	190003	JONI ALEXANDRE POHLMANN	\N	c8809d008e461da9e06cfc7c6bd379b940a91223	1	\N	233634010	\N	2008-02-25	\N
2625	\N	190004	MARLIU FONESCA DOS REIS 	\N	\N	1	\N	244584575	\N	2020-02-20	\N
2626	\N	190003	CESAR MACHADO DE AZEVEDO 	\N	\N	1	\N	266759009	\N	2012-02-01	\N
2627	\N	10146	ANTONIO FABIO DOS SANTOS LIMA	\N	3bece7edbe52ce2b9e1ee7b5d4d7942de9bca70b	1	\N	390626511	\N	2014-09-08	\N
2628	\N	10146	EDSON DA CONCEICAO DE OLIVEIRA	\N	8cdba6d36e9352e65eff0582a3c43369fe94c0ac	1	\N	392454548	\N	2018-10-22	\N
2629	\N	10146	FERNANDO BORGES BRITO 	\N	\N	1	\N	393466507	\N	2018-06-04	\N
2630	\N	10121	WILKSON ADRIANO RODRIGUES	\N	\N	1	\N	396515999	\N	2019-10-08	\N
2631	\N	190002	ELVIO LUIZ BRASIL 	\N	\N	1	\N	426195213	\N	2019-08-19	\N
2632	\N	190004	ALEXSANDRO  AGUIAR SANTIAGO 	\N	\N	1	\N	462707520	\N	2020-02-20	\N
2633	\N	180001	MARISTELA SANTOS OLIVEIRA SOUZA	\N	f6e639f2d46e73bf69edcfc8b868fc8b793a2d95	1	\N	466173539	\N	2017-07-20	\N
2634	\N	10146	CLEIDMILSON DOS SANTOS ALMEIDA	\N	05b687b223ff68e525ec8a4e37d539a220329565	1	\N	548892512	\N	2017-07-20	\N
2635	\N	190005	HUELTON CARLOS GOMES	\N	7f953c60296e83fcbe4e30abee7c5b142ae0ef62	1	\N	575511117	\N	2018-08-13	\N
2636	\N	10146	EDSON PIRES DA SILVA	\N	db529b6d0f9c33ab1247669e4d7428b72adc644a	1	\N	582537509	\N	2016-12-12	\N
2637	\N	190004	ANTONIO CARLOS SANTOS SOUZA	\N	e3f6d45142d328709ea430a265df64c8989fc936	1	\N	617812586	\N	2011-06-02	\N
2638	\N	10146	SILVIO RIBEIRO DE SA	\N	1282b5ccf0dc965cc905fb6c15ac55a2d157a6a4	1	\N	640145507	\N	2013-08-01	\N
2639	\N	10146	JOSEVALDO DOS SANTOS SUBRINHO	\N	\N	1	\N	661374548	\N	2014-05-20	\N
2640	\N	190004	ANTONIO CARLOS DE JESUS SANTOS	\N	30229c94ffdae8762124ed017dbeaac1148ae4c1	1	\N	665744552	\N	2019-07-10	\N
2641	\N	140001	DIARLES ALVES ROCHA	\N	34a71f91c04a837bdf9dd69e3c618937ec36baf4	1	\N	685109186	\N	2017-01-09	\N
2642	\N	10067	WANDERSON CAETANO DE SOUZA 	\N	\N	1	\N	708781292	\N	2020-01-02	\N
2643	\N	190004	DANIEL CARVALHO DE OLIVEIRA	\N	52384003293f7f2a2c4801e55804626dd5c5e5cb	1	\N	767890558	\N	2017-07-04	\N
2644	\N	10265	JOSE RAFAEL DA SILVA LIMA	\N	\N	1	\N	818200111	\N	2019-11-04	\N
2645	\N	190003	CLEBER HILARIO PRIEBE	\N	0d66522fe4eafbbfcb0e97212646035a36151550	1	\N	820530069	\N	2007-12-17	\N
2646	\N	180001	LEANDRO VIEIRA	\N	26229ae170bed5c8b1b52c3b6e588004e55fc11b	1	\N	831834935	\N	2003-02-01	\N
2647	\N	190003	AECIO RUTSATZ	\N	de097beec88758c07a1cb55f440e26876db3d904	1	\N	844103020	\N	2016-04-20	\N
2648	\N	140001	RAFAEL PINHEIRO ARAUJO	\N	d1a40243f0f7e9a7cdb3628d5b9037e94da55d20	1	\N	873188144	\N	2018-04-05	\N
2649	\N	140001	RICARDO ALVES MARTINS	\N	\N	1	\N	902557122	\N	2017-11-24	\N
2650	\N	10146	MARCELO SUZART DE SANTANA	\N	6ca6df11ed6e623eafe64b108da31712077fd973	1	\N	907590527	\N	2015-04-01	\N
2651	\N	10121	RONI ALVES PERREIRA 	\N	\N	1	\N	921761198	\N	2019-12-03	\N
2652	\N	140001	GILMAR DE JESUS DIAS	\N	72fc5a33ab8d6e8a9363db29480b0e63ecafde80	1	\N	971034702	\N	2017-04-24	\N
2653	\N	140001	ROGERIO DE OLIVEIRA GARCIA	\N	8af695e7d8f4bd96e51d69ac1ba65aad68f97542	1	\N	974360112	\N	2018-06-25	\N
2654	\N	190005	ADEILDO TEODORO DAS CHAGAS	\N	b2dc4a1ef39d41274808a421ddda01e61c6ff12f	1	\N	982603169	\N	2018-08-20	\N
2655	\N	180001	CASSIO FERNANDES MARTINS	\N	343a25360ab44c9b0710d37b0c3f31a03b9eeb1f	1	\N	1006112146	\N	2016-12-05	\N
2656	\N	140001	EDER PEREIRA DE SOUZA LIMA	\N	8dd97f905390b6501727cab298af8d66febb022d	1	\N	1022190105	\N	2018-04-04	\N
2657	\N	10121	CLEDINEI FUSSIGER	\N	48088335811f105d4fe259653b587e0b32bf6125	1	\N	1074626133	\N	2017-10-02	\N
2658	\N	10121	FABRICIO ALVES DE CAMARGOS	\N	2382d7fa91074aea1a2ee20d4d1a4dbd575cf0ce	1	\N	1128681188	\N	2013-09-23	\N
2659	\N	140001	TIAGO DIAS BORGES DA SILVA KARAJA	\N	79611616e1dd9e7a55d5a4195c123cb6d10e9ec9	1	\N	1130888177	\N	2011-08-01	\N
2660	\N	190004	DENISON RIBEIRO SANTANA	\N	f8e39208ae232c0290f6b826f3ab98cadcf13ee0	1	\N	1143790502	\N	2015-07-20	\N
2661	\N	140001	JOAO CARLOS COELHO ROSA	\N	1a4a36ffd9ef9c0fdb4b5df312c1033947c14c98	1	\N	1163300152	\N	2018-01-18	\N
2662	\N	10121	JALMIR DE ARRUDA PEREIRA	\N	9e0ed970b0ec8513607efe50f145b4a20d9b5c6e	1	\N	1169293166	\N	2010-03-01	\N
2663	\N	10146	AIRTON CORREIA PINHEIRO	\N	300c9bd3f9e5eb20d2798981098ff09813dc6bfc	1	\N	1172582459	\N	2017-11-13	\N
2664	\N	10121	ANTENOR DOS SANTOS LIMA JUNIOR	\N	202fae0bcfbcc6ce9b71681cadb9d2eff5a5374a	1	\N	1186286156	\N	2012-10-18	\N
2665	\N	140001	CLEIDIVAN DE CARVALHO CELESTINO	\N	026fa15dcdd3fda6b9e0eb3b97a866db479f62d9	1	\N	1188387170	\N	2016-04-15	\N
2666	\N	190004	RONALDO BEZERRA FERREIRA	\N	fa31b44b085d837fcebb8e30515a8296da521f76	1	\N	1273182596	\N	2019-07-10	\N
2667	\N	10121	DIEGO FERREIRA DA SILVA	\N	75cf2d4135fa61fe35a151df9b72cbf53fb41a4c	1	\N	1288748132	\N	2018-11-06	\N
2668	\N	10146	ED WILSON MARQUES DOS SANTOS	\N	7dcfe7a78f61f23bc5b212599e8277f415183b59	1	\N	1301234559	\N	2018-03-20	\N
2669	\N	190005	ADAO DANIEL MOTA DE ARAUJO	\N	400e6a6d7bb9f8a7122841f11437feb8004efa16	1	\N	1310702152	\N	2017-08-01	\N
2670	\N	190004	ANDERSON PEREIRA DA SILVA 	\N	\N	1	\N	1359320560	\N	2020-02-20	\N
2671	\N	10146	ARMANDO BEZERRA DE SOUSA JUNIOR	\N	6d7e8c1449be7a2e707069ee57a4b4b6d920535f	1	\N	1361387564	\N	2018-03-05	\N
2672	\N	190004	WENDSON CARNEIRO OLIVEIRA	\N	be14da77f198b19deaa564e9bd1bdca509b37890	1	\N	1368840590	\N	2010-11-11	\N
2673	\N	140001	VINICIUS LIMA BEZERRA	\N	fb56e9daaa00a012faf6dadddf79088c0e49505a	1	\N	1409054136	\N	2016-09-01	\N
2674	\N	10146	LEANDRO CARNEIRO GOMES	\N	b766da8375e98ab5c2eab0029d791a7dfa81bbb1	1	\N	1432454579	\N	2014-09-08	\N
2675	\N	10265	NELSON LUIZ MARRA	\N	6a287e60835ac3715d81a52900e5455547a8935a	1	\N	1442259132	\N	2014-04-25	\N
2676	\N	140001	JOSE WILSON BRITO TEIXEIRA	\N	5ef0fc69f975f50a4290846308d1e05cc4d5413a	1	\N	1467136131	\N	2017-10-02	\N
2677	\N	10146	JOSE RAIMUNDO BRITO VIEIRA	\N	011d476dbb6728812e368628cc4339d05b44921c	1	\N	1482407558	\N	2018-02-20	\N
2678	\N	10265	LUCIANE MORINIGO DE OLIVEIRA SILVA	\N	17ccc772d0c147c970f4640b699c3b064636da76	1	\N	1488642109	\N	2019-05-02	\N
2679	\N	180001	SIDNEI MOREIRA BONFIM	\N	43cdecada17e932d72fcf4c1de1b8822ccb9fedb	1	\N	1499112971	\N	2009-01-05	\N
2680	\N	190004	JOAO BATISTA DOS SANTOS DE JESUS	\N	e53922ea3ea36f45a010d5868bc0e706fdd772e7	1	\N	1553134524	\N	2018-08-01	\N
2681	\N	10146	UBIRANEY ARAUJO DE ALBUQUERQUE	\N	01247f7157050ff08da76ee61faabc0d42644e56	1	\N	1602895562	\N	2016-01-06	\N
2682	\N	10146	PAULO SERGIO CORDEIRO ALMEIDA	\N	bac187d1163ab691e3786d0de39186d0ab001c72	1	\N	1620659573	\N	2017-02-01	\N
2683	\N	10146	ALEX SANTOS DA SILVA	\N	e5717dcffac6acec4da1f45c485d821ad63991e9	1	\N	1635839513	\N	2017-07-10	\N
2684	\N	10146	JUCIVAL DE ALMEIDA SANTOS	\N	240a2d6491d86a6c0a683d88c62d205b62414abd	1	\N	1655488511	\N	2017-07-04	\N
2685	\N	10265	SEVENEY VAGNER SOUZA	\N	5f32bb0907c68e15fb317a0b986aaae0eef307b1	1	\N	1798710137	\N	2019-05-02	\N
2686	\N	10146	GIVANILDO RAMOS DA CONCEICÃO	\N	77731e73e8ed46ca4a4ef3923c80c301d70b7838	1	\N	1843490528	\N	2015-09-24	\N
2687	\N	190004	ALDEMIR PEREIRA DOS SANTOS	\N	765f7f1bd89811c53df67469f2aafbd3cb8aca2f	1	\N	1900656566	\N	2019-01-09	\N
2688	\N	10146	MIRALDO MOREIRA DE OLIVEIRA	\N	eef7f9eaf17a8e53b142ba18f9f55f486cd67c44	1	\N	1906189579	\N	2019-05-21	\N
2689	\N	180001	PAULO SERGIO DOS SANTOS	\N	c27007c3c858c5a17141a1e84cd2ad5e2330c1d3	1	\N	1935630962	\N	2005-09-01	\N
2690	\N	10265	ELIANA NUNES GOMES 	\N	\N	1	\N	1938953150	\N	2019-09-03	\N
2691	\N	10265	DIEGO RODRIGO LINCK MENDES	\N	503f81a65ffeab9f3aeaa040aa79f2ea3f4ee435	1	\N	1948297159	\N	2018-04-12	\N
2692	\N	190004	ABELARDO OLIVEIRA GUIMARAES FILHO	\N	7d2aa8dfeab16317ebbb66489345ae208cda94df	1	\N	1949777570	\N	2013-12-10	\N
2693	\N	190004	EDVAN DA SILVA SANTOS	\N	75002580faf2731e86a07395121cf92a0c956e2a	1	\N	1967748535	\N	2019-07-15	\N
2694	\N	190005	DENES CESAR SILVA DOS ANJOS	\N	e58c9481dd7ba150f89b0988458a2deff391be40	1	\N	1971787159	\N	2017-06-01	\N
2695	\N	190004	LUCIANO RIBEIRO LOPES	\N	989ff4e999433a241d256472f0c7c9552034727c	1	\N	1996796577	\N	2019-05-02	\N
2696	\N	10121	ALEX DE OLIVEIRA PEREIRA	\N	8030fcb71d07e0185f03651f0f6dfed8cb44cef5	1	\N	2003857125	\N	2018-07-23	\N
2697	\N	10146	JOSEVALDO SILVA CERQUEIRA	\N	907042628a2feb800bfeb44f0dd2ff59b41b64be	1	\N	2005560537	\N	2017-01-04	\N
2698	\N	140001	DOMINGOS CRUZ DOS SANTOS	\N	77b52439e207bea9d66121603dc44dda77b54698	1	\N	2009878795	\N	2012-10-04	\N
2699	\N	10121	SEBASTIAO MANUEL DA PAZ BEZERRA	\N	1a06d214f7aacf125007d5c6d62c21fdcc78cae4	1	\N	2014104190	\N	2018-08-13	\N
2700	\N	10121	CRISTIANO M REIS DE OLIVEIRA 	\N	\N	1	\N	2017111171	\N	2019-12-12	\N
2701	\N	190004	ROGERIO CONCEICAO DA SILVA	\N	95f18d109cefbd4852ec176ea30f3b677b00ba7a	1	\N	2024083536	\N	2017-07-20	\N
2702	\N	140001	GUILHERME SANTOS TEIXEIRA	\N	3663e3cb0541d4b452ecc1b828191336115c89b4	1	\N	2044027194	\N	2019-01-21	\N
2703	\N	140001	JOAO DANILO EVANGELISTA	\N	\N	1	\N	2055184199	\N	2017-11-06	\N
2704	\N	190004	RONIEL CARDOSO SANTANA	\N	1023e2ddc0bf831e70b055fd017607abb61d6821	1	\N	2055588524	\N	2014-09-01	\N
2705	\N	140001	ROGERIO COUTINHO AGUIAR	\N	815724c2d107962f8f0b79853537de0583c1c6f7	1	\N	2129640117	\N	2017-11-22	\N
2706	\N	190004	RICARDO RAMOS SENA DA SILVA 	\N	\N	1	\N	2147692590	\N	2020-02-20	\N
2707	\N	190005	JOEL ROBERTO DA SILVA	\N	f9c8fb3048e37e977b643a807274a08ed7ddc81a	1	\N	2186643111	\N	2015-12-03	\N
2708	\N	10121	ADRIANO SOUZA SILVINO 	\N	\N	1	\N	2192253117	\N	2020-02-11	\N
2709	\N	10121	JEFESON ROMUALDO DE SANTANA	\N	759e381bcf9f12fd1a9a0304c19357555f198540	1	\N	2193988951	\N	2006-03-01	\N
2710	\N	180001	VALDEMIR ROCHA DOS SANTOS	\N	1c9ce59c2ed71995f4e43110a76ebcb19a5bfa6e	1	\N	2197922912	\N	2005-11-14	\N
2711	\N	10146	JHONATA DA SILVA PEREIRA	\N	cc084815f07118b55edd41c0785fd1fc2b4f974b	1	\N	2213926530	\N	2017-01-09	\N
2712	\N	10121	EWERTON MARCOS QUIRINO DA ROCHA 	\N	e34fc046d306e5e798471b0659e06d0bc111ee76	1	\N	2247433170	\N	2019-10-01	\N
2713	\N	180001	ALLYSON BRUNO DIAS RODRIGUES DE ARAUJO	\N	b659bbc63fe835fb8b9cd2b5675c5ee2c96ad663	1	\N	2276914157	\N	2016-10-03	\N
2714	\N	10146	JUSCELINO SANTOS DA SILVA 	\N	\N	1	\N	2304603564	\N	2020-02-20	\N
2715	\N	140001	Eudes Ribeiro	\N	7b989004038c20c1a367012d45ee857cda4c3bc1	1	\N	2318039151	\N	2019-11-18	\N
2716	\N	190004	JOSE EDUARDO DE ALMEIDA FERNANDES	\N	21adc412a16b0cae3b874871fb7c17c34e6eca74	1	\N	2339252520	\N	2017-07-20	\N
2717	\N	180001	RONALDO BECEGATTO	\N	8d497dc8a578ddab7c5cf734e7a85005500dcfad	1	\N	2384222910	\N	2014-03-20	\N
2718	\N	190003	FELIPE MACIEL KUMM	\N	efce6a6d1dfae58a4888853377843eadbda5a199	1	\N	2421696003	\N	2017-01-04	\N
2720	\N	140001	AGUINALDO ROCHA GUIMARAES	\N	7465dafdf04af71b2321f95d524cd91cac7279df	1	\N	2457019745	\N	2009-11-13	\N
2721	\N	190005	JECONIAS JOSE SILVA DOS SANTOS	\N	616f9f1b5d3f3418ce2567ea0bb7569bac840b73	1	\N	2474154132	\N	2015-12-10	\N
2722	\N	140001	ADALTO PEREIRA DA SILVA	\N	6dcb789abf516b3b1e718874d97a36169ef01641	1	\N	2496149107	\N	2017-01-20	\N
2723	\N	190004	ELON SANTOS DE SANT ANA 	\N	\N	1	\N	2510965565	\N	2020-02-20	\N
2724	\N	190004	CARLOS ROBERTO FARIAS PEDRA	\N	\N	1	\N	2543544593	\N	2020-02-20	\N
2725	\N	190005	JOAO MARCIO DA SILVA	\N	87d43b574889d54ba2715c9709d4f8a21b16f3a3	1	\N	2565486170	\N	2013-01-25	\N
2726	\N	190004	DIEGO BARBOSA SILVA	\N	aae0d4e50d2ced20497db9f16877ee9e27223747	1	\N	2648998578	\N	2012-10-02	\N
2727	\N	140001	ELCIMAR CANDIDO DA SILVA	\N	7010b97a7861c0e21cf8db1f210e996ef9ecaafa	1	\N	2820194133	\N	2017-01-03	\N
2728	\N	10146	LUIZ FERNANDO RIBEIRO OLIVEIRA	\N	b33433291d9be096d31f3436aa40f650a00bb3f0	1	\N	2847670505	\N	2015-12-07	\N
2729	\N	140001	ADRIANO ALENCAR DE SOUSA	\N	0f1e59e57eef8d772ff6b39eee2542895bbf1241	1	\N	2864949148	\N	2017-10-02	\N
2730	\N	140001	GEISSON DANIEL ROCHA LIMA 	\N	\N	1	\N	2865204197	\N	2016-04-10	\N
2731	\N	190003	LUCAS ROSA PEREIRA 	\N	\N	1	\N	2866566041	\N	2017-08-21	\N
2732	\N	10146	JOSIMARIO JOAO DOS SANTOS	\N	6e833086818a1f3484505bc55b9382e8aeaa3f34	1	\N	2884608478	\N	2015-10-20	\N
2733	\N	180001	VALMIR FERREIRA DA PAZ	\N	03a6b12cd66e78981e3d09ab2a485010dfc86e55	1	\N	2885079916	\N	2019-10-16	\N
2734	\N	190004	ANTONIO ROQUE FIGUEIREDO 	\N	\N	1	\N	2907644599	\N	2020-02-20	\N
2735	\N	140001	RENATO ZACARIAS DA COSTA REIS	\N	0aff5f354b4a8838178006a9c0568c79955a414f	1	\N	2913830250	\N	2019-02-20	\N
2736	\N	190005	JOSUE FLORENTINO DE MAGALHAES	\N	ff2159145f80f12d66f6070268d45c030fcc04d4	1	\N	2958212130	\N	2018-08-09	\N
2737	\N	140001	JOAO PAULO NASCIMENTO VERAS	\N	10f1b08dc2575bb8c8b1cf5652ce1ab5305a76d8	1	\N	2959952383	\N	2016-09-20	\N
2738	\N	190001	ELIAS MONTES QUITERIO	\N	017c9c58e6aad67b482779a22bb4ac2909a15e30	1	\N	2971353923	\N	2009-11-03	\N
2739	\N	180001	MARCOS ANTONIO ALVES	\N	10bfd731ac376116c89caab654abf134856abe51	1	\N	3018427955	\N	2019-10-14	\N
2740	\N	140001	TIAGO BATISTA DA SILVA	\N	7311c2cfd5298ab587dee39cba665270695ca15d	1	\N	3025028157	\N	2016-08-08	\N
2741	\N	180001	EMERSON GUEDES DE SOUZA	\N	6a5a644fe17da43292fd4b43988c0a5356a6fb5a	1	\N	3040957961	\N	2019-07-18	\N
2742	\N	10146	DARLAN LEITE VAZ	\N	ca2dbb76647f2f37f2aa8d424f2ecf20f0188d99	1	\N	3050729511	\N	2016-03-21	\N
2743	\N	140001	GENILSON DE SOUSA COELHO	\N	8ecb554882cac99cd55302e6a59fc097d742c26b	1	\N	3105800131	\N	2016-09-01	\N
2744	\N	10121	ROSIMEIRE GODOY DE LIMA	\N	6bdb6b785f52f82c1e8be2a9039b6d303fff9aa9	1	\N	3142969136	\N	2018-02-16	\N
2745	\N	190004	ROMILDO PEREIRA DA SILVA	\N	2149066ab569b760f7e38b5f86702aaec5c6fa8a	1	\N	3153815585	\N	2018-07-03	\N
2746	\N	140001	ISMAEL ARAUJO DA PAIXAO	\N	076401c6cfb90e2e5cd749b7b7ce5fbcdace3a52	1	\N	3160664198	\N	2016-10-03	\N
2747	\N	180001	MARCIO RODRIGUES	\N	2dac3992a219c3de1483b5feb84717b7cbb36516	1	\N	3174380936	\N	2012-11-05	\N
2748	\N	10121	MARCILIO TORRES JUNIOR	\N	fb1e87affdccd3996253b60c1d3ae5f5de13f9ad	1	\N	3245013159	\N	2015-12-10	\N
2749	\N	190003	EVERTON MELCHIOR	\N	f285495c0750ffb6bc87f198f23e4a7484120869	1	\N	3267430062	\N	2012-10-19	\N
2750	\N	10067	EDILSON RIBEIRO DE AMORIM	\N	210ea9dff837135efff1f90f591321faf8b320c2	1	\N	3283053677	\N	2013-01-16	\N
2751	\N	10176	JOSELITO FERREIRA DA SILVA	\N	0d0c00ee16782837dc264c2f9fa1ca0f5a835712	1	\N	3299557483	\N	2017-11-13	\N
2752	\N	140001	MARIO SILVA DE BRITO	\N	9932bc5fb3e8d786fc78becfcf1f132d337de951	1	\N	3331767158	\N	2017-04-19	\N
2753	\N	190005	GENIVALDO FRANCISCO FELIX DA SILVA	\N	513af3119b27ffb9dcd9384bf5a66f827dda4aaa	1	\N	3413001442	\N	2016-05-06	\N
2754	\N	190003	FILIPE PIRES SEHNEM	\N	e0111272f12ccd57fe0d0d2b36d5bab0fe99c0d7	1	\N	3421706000	\N	2018-08-13	\N
2755	\N	140001	PAULO CESAR CARVALHO DA SILVA 	\N	\N	1	\N	3513991193	\N	2018-04-26	\N
2756	\N	140001	RAIMUNDO FILHO DA SILVA HENRIQUE	\N	4de5cc47156408eac8a4a7d4b4029126655674f8	1	\N	3530387177	\N	2016-11-07	\N
2757	\N	10001	PAULO SERGIO MANGINI	\N	21362ea9418d2a0fa030ccb0a9e960b1e068d174	1	\N	3576873961	\N	2012-11-01	\N
2758	\N	10146	DANILO DA SILVA SANTOS	\N	66201c75449b75a62d52b9e0e0f1e2e4c9a67a40	1	\N	3578167576	\N	2018-03-20	\N
2759	\N	10121	RICARDO CESAR DOS SANTOS	\N	\N	1	\N	3596758165	\N	2019-12-05	\N
2760	\N	10001	EGNALDO RODRIGUES TRINDADE	\N	c249356613b7adb1833c5379116f405ae998a037	1	\N	3606580916	\N	2006-03-27	\N
2761	\N	190004	JOSE ROBERTO DA SILVA	\N	0cb1007f67ac408114bdc3ee3a02f344c8aaa401	1	\N	3607547599	\N	2015-07-20	\N
2762	\N	10265	FABIANO APARECIDO GUILHERMINO LUNKES	\N	\N	1	\N	3622116129	\N	2019-11-18	\N
2763	\N	190005	NILSON MOURA DE ARRUDA	\N	b7dbd7d6157961d0be0456cafaf1032adb636a64	1	\N	3653614104	\N	2010-09-02	\N
2764	\N	180001	MARCOS PAULO DA SILVA	\N	d29464391afdf2b23ea1cb376943b3786a2881f1	1	\N	3743334917	\N	2010-05-03	\N
2765	\N	190005	JOACI BARBOSA DA SILVA 	\N	\N	1	\N	3743771462	\N	2019-12-16	\N
2766	\N	10265	VAGNER MARTINS DE OLIVEIRA	\N	5581e1ff17d95f39acca289e6df8941138886913	1	\N	3792096919	\N	2018-05-07	\N
2767	\N	190005	KLEITON THIAGO DE SOUSA BORGES	\N	54cff649063d20ad49cf3ae799ea03490fa4e751	1	\N	3803000106	\N	2017-03-09	\N
2768	\N	190005	FABIO JUNIOR ALMEIDA SILVA	\N	5d1d5e7a3396bef3a5a719f3637ba5d109e67299	1	\N	3884157116	\N	2019-03-20	\N
2769	\N	140001	MAICON NEITE ROSA GUIMARAES	\N	\N	1	\N	3909961142	\N	2020-02-26	\N
2770	\N	140001	WALLISON DA CRUZ SANTOS	\N	f78a6503ee9fbb5e1e3ebf721ac33c95221cacda	1	\N	3916737180	\N	2019-04-08	\N
2771	\N	190005	JOSENILTON PEREIRA QUEIROZ	\N	9eee2617ca42fa172e555d4159554818a98de7a1	1	\N	3928265180	\N	2019-02-20	\N
2772	\N	190005	ED CARLOS SOARES DA SILVA	\N	4e77eb5b58161c8f58e732c73661512d567f9606	1	\N	3947158106	\N	2018-03-01	\N
2773	\N	10146	JULIO CESAR LIMA DOS SANTOS	\N	0890a699187801225932be7f68e3131ed80ba638	1	\N	3992413535	\N	2017-08-02	\N
2774	\N	10265	MARCOS SANTOS	\N	4c1ef216699c155ae0f18c343d42201d8c2b277a	1	\N	4001094177	\N	2019-06-03	\N
2775	\N	10146	ALEX DE JESUS BRITO	\N	9044a1a8cd2f0a215ab5dbf2c4eb53552946444b	1	\N	4020713529	\N	2017-11-13	\N
2776	\N	10176	JOSE CARLOS VIRGINIO DA SILVA	\N	b8daa02ba755704dc7d9e571e32a4677cf06517b	1	\N	4126446494	\N	2011-09-19	\N
2777	\N	190004	RAFAEL LIMA DE OLIVEIRA	\N	351bee15146392ba1816ca8b8d07d9ef44d780e1	1	\N	4135209513	\N	2013-12-16	\N
2778	\N	140001	WILLIAN PEREIRA DA SILVA	\N	eb50855db5f7d416ffd12ffff7c9cb4f443ae99b	1	\N	4150814163	\N	2017-02-09	\N
2779	\N	140001	LUCAS PEREIRA JORGE	\N	da85b21f8a4b1b440dc355fa59b119c672e5f261	1	\N	4167232170	\N	2017-08-21	\N
2780	\N	190005	CLEBER DE SOUZA RODRIGUES	\N	3dd2ec628a0a36ecbb1289cb86b39f46b374a147	1	\N	4170262182	\N	2017-08-01	\N
2781	\N	10121	GILMAR SANTOS OLIVEIRA	\N	f0a0d0149d2ad3a6f7b919e6629892e8b8f59f48	1	\N	4181058123	\N	2018-10-18	\N
2782	\N	190002	LUCIANO DA SILVA OTONI	\N	147e72299905fbfcb1ca3d81f62b17f3e85a00db	1	\N	4186145202	\N	2019-06-10	\N
2783	\N	180001	JOAO WOEZELI FELISMINO DE MELO	\N	f00f6722857a137876d268e92aeb4dc141ec4c46	1	\N	4198108978	\N	2013-10-07	\N
2784	\N	10121	CHARLES FARIAS BENITES 	\N	\N	1	\N	4205519133	\N	2019-11-18	\N
2785	\N	10001	RONALDO BELES DE LIMA	\N	9464ec59e9e0bf3a856cd91905704062415cd7cf	1	\N	4290998941	\N	2015-08-10	\N
2786	\N	10146	EDSON MIRANDA DE SOUZA 	\N	\N	1	\N	4374813527	\N	2020-02-20	\N
2787	\N	10121	WEDSON FANAIA MARTINS	\N	7e2590d8425acdd3a2143174eab1f6b57540a740	1	\N	4410631101	\N	2019-03-06	\N
2788	\N	190005	CELIO PEREIRA FONTANELLI	\N	592e0a06aab3c0bd631e57d5fa113499b2a64bbe	1	\N	4495815199	\N	2017-04-03	\N
2789	\N	190005	MAYCON FIGUEIREDO DOS SANTOS	\N	06bdb5f21c715c71091e7934727fea0c9a7570a2	1	\N	4513747110	\N	2017-04-03	\N
2790	\N	10265	FELIPE DA COSTA ROCHA	\N	af2d049b11835fece0271f9feab5101087831d30	1	\N	4513790121	\N	2019-04-15	\N
2791	\N	10121	DEYBSON ARIEL LIMA CAMARGO	\N	b9298cce5cd67cd6834819eb560fc49cae8416d3	1	\N	4543942175	\N	2017-09-20	\N
2792	\N	10121	HERCULES HENRIQUE RODRIGUES MENDES	\N	fef74daf87f6e8aa5ac35fee41ab17de74345ca9	1	\N	4545082122	\N	2018-10-18	\N
2793	\N	190005	GABRIEL MATOS NOGUEIRA	\N	d6751d02c5581e1439c15d0f53db8bbc1472c820	1	\N	4546888147	\N	2017-11-13	\N
2794	\N	190005	WESLEY DE SOUZA RODRIGUES	\N	b46edccada6c1448db484f2eaf997d09f87d51c0	1	\N	4557940145	\N	2018-12-03	\N
2795	\N	10121	ALEXANDRE DA SILVA XAVIER	\N	040735bc8e89850d19e48a4d4c409e2d71014549	1	\N	4564811177	\N	2012-08-01	\N
2796	\N	10121	WERICO WALLAS BORGES DA FONSCECA	\N	\N	1	\N	4582085156	\N	0020-10-01	\N
2797	\N	140001	REGINALDO PEREIRA LEITE	\N	59f6c4943c6bf579b5150accedb4a14d5da33b8b	1	\N	4607539678	\N	2017-01-20	\N
2798	\N	10146	CAIQUE JEAN BENTO DA SILVA	\N	ed157baefbcc88f5d817006f1a498063514276e9	1	\N	4669081560	\N	2016-10-20	\N
2799	\N	140001	EVANDRO CAMPOS MACIEL	\N	8b565c0753ac2ddf0c5a868367047d34aa62ddf2	1	\N	4706959195	\N	2017-11-22	\N
2800	\N	190005	JHONATAN HENRIQUE VIEIRA DA SILVA	\N	f1ae8e79f1e5b6bd82018c149864df0c7ac03890	1	\N	4708678177	\N	2018-12-03	\N
2801	\N	190004	RAFAEL DE SOUZA SILVA	\N	fd3ce7af2e89364bc933ba3080bdbad3eb31c4a0	1	\N	4726506536	\N	2017-09-11	\N
2802	\N	10146	ANTONIO CLEYTON AMORIM SANTOS	\N	26c97c9d498f9002590b71393e5efc878eafa59b	1	\N	4781421539	\N	2015-09-24	\N
2803	\N	190005	FABRICIO GOMES ALMEIDA	\N	587b8bac8d6f223e2d85d22851a28a1faa67fe25	1	\N	4930225116	\N	2017-09-20	\N
2804	\N	180001	GILBERTO GIMENEZ ANTONUCCI	\N	3742cb33a5d0e5db5b359d28e84ce2f5d5b77123	1	\N	4983620940	\N	2017-08-01	\N
2805	\N	140001	EDILSON FERREIRA LIMA	\N	328420e7a214966d88471daaa81a083cf3748573	1	\N	5051615597	\N	2018-03-05	\N
2806	\N	190005	ANDREW COSTA DE ASSUNÃÃO	\N	\N	1	\N	5085249119	\N	2019-09-20	\N
2807	\N	190005	GILIARD FERREIRA TIMOTEO	\N	\N	1	\N	5103408147	\N	2016-06-01	\N
2808	\N	10176	EDGLEY GESUINO DE SOUZA	\N	7d37d81e3374280ca6199ee72486debaa60550a5	1	\N	5149121460	\N	2018-05-11	\N
2809	\N	10121	THIAGO HENRIQUE CAMPOS DE ALMEIDA	\N	878ceb1e777d4dfd7f9ba9277a5c7ecc3cc881a7	1	\N	5181800181	\N	2017-12-11	\N
2810	\N	190004	DAVID EDSON SOUZA SANTOS	\N	c94be018e3e75609f13a735fb9d49dc7e938d704	1	\N	5221466511	\N	2019-07-10	\N
2811	\N	10146	JOSE EDSON DA SILVA	\N	b6bbbc4725a44db131f2e11affe32583b05679aa	1	\N	5386653431	\N	2017-01-09	\N
2812	\N	140001	WANDERSON SOUZA SANTOS	\N	b275421f838f45bdd99b09eccb08584273505003	1	\N	5412639194	\N	2018-10-01	\N
2813	\N	190005	SAMUEL DE SOUZA MAIA	\N	3894a3abce74dd56270e420bbe50f685872dcb06	1	\N	5440436189	\N	2018-04-05	\N
2814	\N	180001	RENATO ELOI DA SILVA	\N	32017876372e58d5c686f4441b1c086f5bf192f6	1	\N	5529499902	\N	2019-07-18	\N
2815	\N	190004	GENESIS NASCIMENTO ARAUJO	\N	c82e14603ad49986dd8e3c1560a64e2231c80023	1	\N	5570099522	\N	2014-02-24	\N
2816	\N	190005	ANDERSON DE SOUZA MONTEIRO 	\N	7293d84ab2c5f73911af2d2a442be66bedb73404	1	\N	5617802186	\N	2019-10-01	\N
2817	\N	10265	ANDRE LEANDRO DA COSTA	\N	75d2a9d29db4b0707882a7f6d2290804364ef43b	1	\N	5654163167	\N	2019-09-03	\N
2818	\N	140001	PAULO RENATO VENCAO SILVEIRA	\N	56745583607bbd237a0ab03412f9c375562d1725	1	\N	5805719126	\N	2017-11-22	\N
2819	\N	180001	VANDERSON  DE SOUZA 	\N	\N	1	\N	5954203970	\N	2017-08-21	\N
2820	\N	180001	JOAO INACIO BRIOSCHI	\N	e74fe741d5f994ca10fd5b4a1379116a73aa95be	1	\N	6056952886	\N	1997-10-01	\N
2821	\N	180001	ALEXANDRE DE CARVALHO SEREN	\N	a85ca0d04a1a074a816d4b67327ef0bc34b0b4c8	1	\N	6221926980	\N	2012-12-10	\N
2822	\N	10176	VERONILDO PEREIRA CUSTODIO	\N	c89247be41caca490f84e7fc1cdc7d213f5ebd50	1	\N	6237723455	\N	2016-04-12	\N
2823	\N	180001	ANIBAL DOS SANTOS JUNIOR 	\N	d379f49114f8dccffc32d3e5fc47eaf501a9ad28	1	\N	6355214909	\N	2019-10-14	\N
2824	\N	180001	JAKSON FERNANDES FERREIRA 	\N	\N	1	\N	6522428989	\N	2019-07-08	\N
2825	\N	180001	ODAIR ARAUJO ALVES	\N	5fb73cd8b6b62cf028ac63b6707132081807661e	1	\N	6573144554	\N	2019-10-14	\N
2826	\N	10176	JOSE CUNHA CARVALHO	\N	e1fa850b3fec093d37262826551860aee1f87656	1	\N	6639669498	\N	2017-06-02	\N
2827	\N	180001	ADRIANO SILVA DOS SANTOS	\N	f74ab7b39b4df2ab49a6adb8b960d9735f1bcf0b	1	\N	6876876918	\N	2019-05-13	\N
2828	\N	10176	MARCELO DE MELO SANTOS	\N	cb0745189d383fd065abaa119fa7818fa9b7b79a	1	\N	7004617440	\N	2017-10-09	\N
2829	\N	10146	NAILSON RODRIGUES CAETANO	\N	4750d93883c6036072a012715693d49fdf021143	1	\N	7116183566	\N	2016-05-20	\N
2830	\N	10121	JOSE CICERO DA SILVA	\N	\N	1	\N	7134082431	\N	2018-06-20	\N
2831	\N	10121	CRISTIANO ANTONIO DA SILVA	\N	\N	1	\N	7134083403	\N	2019-12-05	\N
2832	\N	180001	HERITO PEREIRA GOMES SANTOS	\N	a8a39053c81970b00e26e7ee4619864b873e9c4d	1	\N	7249672908	\N	2016-10-03	\N
2833	\N	10176	ANTONIO DOS SANTOS ARAUJO	\N	ba1f1db8560a6f944b8b8cdb378a4bfdc6b8f5fe	1	\N	7388844481	\N	2016-03-17	\N
2834	\N	180001	THIAGO MANSON FREITAS	\N	82b4624ced0f096ed32badd82b8a9d74483163d1	1	\N	7482534911	\N	2019-07-18	\N
2835	\N	190002	ELSON RODRIGUES MONCAO	\N	\N	1	\N	7867353410	\N	2012-05-14	\N
2836	\N	180001	LEANDRO APARECIDO COUVO	\N	45c807806cff76b49ad14c83b05989e9ee3722f6	1	\N	8144629957	\N	2019-07-18	\N
2837	\N	10176	VALDICK RAMOS DA SILVA	\N	c312433dc54d3b4f4976ec7569cf31531325febd	1	\N	8269529419	\N	2017-12-12	\N
2838	\N	180001	CAMILO APARECIDO DE ANDRADRE	\N	2c1a594a4ec6b9c26c0587fed1a17b17b25c4c05	1	\N	8314776955	\N	2019-04-08	\N
2839	\N	10176	JUCELIO FERREIRA DA SILVA 	\N	\N	1	\N	8529273478	\N	2013-11-14	\N
2840	\N	180001	RAFAEL MARQUES	\N	17b5ccc63329634489ca99ca8bd40a2f72b92830	1	\N	8621556901	\N	2019-01-01	\N
2841	\N	180001	HERMERSON CLEIK DA SILVA LIMA 	\N	a87f30a2b9238937f90b448641ff6f8ac3b1c4cc	1	\N	8645202980	\N	2019-04-08	\N
2842	\N	10265	ANDREYSON ROGERIO FERREIRA DA SILVA	\N	c585c5c3e1f319072a91f411756f54fe5055932f	1	\N	8650396402	\N	2019-02-04	\N
2843	\N	190005	FABRICIO FRANCALINO DA SILVA	\N	449882c082cc75a11a41d535d5afe344973df2cd	1	\N	8779890601	\N	2015-12-10	\N
2844	\N	10176	JOSE WOGAN RIBEIRO SANTOS	\N	8ebc97cd9a092228d653dd89fa265b1e0245d3f7	1	\N	8963406431	\N	2017-09-04	\N
2845	\N	10265	JOSAFA LUIS DA SILVA	\N	\N	1	\N	9141013409	\N	2019-11-04	\N
2846	\N	180001	WILLIAN DIONATHAN SOUZA	\N	ca252e217db77570ddedf012f3622676ae3f2a89	1	\N	9610558984	\N	2019-07-18	\N
2847	\N	10176	VALDIR SANTOS MARCELINO	\N	70b2a430476a86594191049cb626a3ea7efe5e92	1	\N	9810708769	\N	2017-04-03	\N
2849	\N	140001	ISAAC BRUNO MARTINS SUCUPIRA	\N	588c3dac31aa8446f494012a090193b3971ad94e	1	\N	10316926655	\N	2016-04-15	\N
2850	\N	10001	HELTON ORLANDO	\N	5a669ea147b937b783a801789bc660245fb65bf8	1	\N	10447212940	\N	2019-01-01	\N
2851	\N	10176	EDGLEY GONCALVES DA SILVA	\N	3e7dfcd8f1bba72e5973296fb69a3ee3c106bdcd	1	\N	10604161409	\N	2019-01-29	\N
2852	\N	10067	AQUILES FERREIRA DE ANDRADE	\N	0c9007e0c9f380581bc1260afed1aaeb39732bab	1	\N	11549041215	\N	2005-07-01	\N
2853	\N	140001	GILSON SOUZA	\N	6c6a94f773652b82f7737fb322617e023237106b	1	\N	11579085784	\N	2013-07-16	\N
2854	\N	10121	PAULO ROBERTO FERREIRA	\N	7d89fcd3a7eca5ab32e8d715664196f3401d0604	1	\N	12812463287	\N	2011-12-19	\N
2855	\N	180001	GEFRSON ANTONIO DE SOUZA	\N	757e3b00bf37d325f274b561dc8c2a51a5b09d23	1	\N	12955740802	\N	2003-04-14	\N
2856	\N	10265	HARY LEOPOLDO TEMPASS	\N	7d86a7f0087c8df0677d89ae8ff7abfd808e1ea3	1	\N	13713942889	\N	2019-06-03	\N
2857	\N	190003	JOSE ALVES FERREIRA	\N	cb028a1ad0440712b5c6207ff14629a60bbbb8d2	1	\N	16013698830	\N	2008-01-02	\N
2858	\N	190005	LINDOMAR GALBIATI	\N	c17644fdaa01ebe94e32f7457a05963d4d8e5a3d	1	\N	19492955830	\N	2017-06-12	\N
2859	\N	10067	SANDRO ALVES MATOS	\N	ebff41c4a062e5d6fc7185827e17823ee55263dc	1	\N	20472803204	\N	2002-12-02	\N
2860	\N	10067	JUVENCIO DE SOUZA CORREA	\N	c684f43f04f0f99485c102d12318f0ae6f223ffb	1	\N	20645031100	\N	2002-12-04	\N
2861	\N	190002	JAIR ALVES DOS SANTOS	\N	ce1b81f9cb47b02b90cc313ec292159e624ba3ce	1	\N	20667779191	\N	2013-11-28	\N
2862	\N	10115	FRANCISCO DE OLIVEIRA LIMA	\N	3b51547545f2ec57677f50deb8de2ff5f23bde8c	1	\N	21769052291	\N	2013-02-05	\N
2863	\N	190004	JHONE GONCALVES MEIRELES	\N	86ee1bfe9587d31a6d4c12137d5deed6942627f2	1	\N	22624221840	\N	2013-12-16	\N
2864	\N	190002	PEDRO FERMOU	\N	3d41103a1991621b7e07339ea385b2e4d83b9981	1	\N	23812389215	\N	2009-09-01	\N
2865	\N	10121	IRENIO DOMINGOS DA SILVA	\N	58fe1957658e869d67b4bf487ca804c47f142808	1	\N	24065684153	\N	2013-05-16	\N
2866	\N	190005	JOELCIO WINCK	\N	01d6a75664d04c85c79a6d503ed98d8480b3f0ad	1	\N	25107380204	\N	2015-07-06	\N
2867	\N	190005	PEDRO PAULO RUIZ	\N	0006e5f766f9a5470a124f63c96b551ee6485bcf	1	\N	26105570864	\N	2018-08-06	\N
2868	\N	180001	ELISANGELA LAVEZZO	\N	75bc934711ae89bccd23175f5ea706ec671f3391	1	\N	26361386848	\N	2013-03-18	\N
2869	\N	180001	WAGNER FERREIRA DE OLIVEIRA	\N	763973cd710339803ae2483b69896ba02d7e36e7	1	\N	26688253852	\N	2019-05-02	\N
2870	\N	190002	OZIEL CRUZ DE MACEDO	\N	f76cf300d0840d59c91f46b366a3a56f084fdc65	1	\N	27667558884	\N	2008-10-03	\N
2871	\N	190002	SERGIO RODRIGUES DE CARVALHO	\N	ee80192b3d6ef91f667dd2bb3658ae517ec45c13	1	\N	27683613215	\N	2013-08-05	\N
2872	\N	190004	JOSENILSON SANTOS DA SILVA 	\N	\N	1	\N	28035868861	\N	2020-02-20	\N
2873	\N	140001	JOVAIR MIGUEL VIEIRA	\N	84dabdf11e0a25bb63582f2514c6822187dd11bd	1	\N	28353013134	\N	2018-11-26	\N
2874	\N	190002	JOSE PEREIRA DA SILVA QUARTO	\N	927e0fd6b1dce2c353afa8a74226559d7f08953b	1	\N	28372824215	\N	2019-06-10	\N
2875	\N	190002	NIVALDO ALVES CHALEGRA	\N	a6335e2cee6d888240cbc1e6cb42d9ac620f412b	1	\N	28375092215	\N	2014-01-20	\N
2876	\N	190005	JOSE LAURENI DE SILVA	\N	e0a3fcd33859ea453b1ded8d91508db7a899a18f	1	\N	28397541187	\N	2014-09-10	\N
2877	\N	10121	ROBINSON DOS SANTOS	\N	\N	1	\N	28504847845	\N	2019-12-20	\N
2878	\N	190003	EVERALDO PEREIRA DA SILVA	\N	aa0a210fd4e83696b25856d0bb35f46200f136eb	1	\N	28833896838	\N	2011-12-01	\N
2879	\N	190005	CARLOS ALBERTO BORGES DA SILVA	\N	bc4a1b89f47c9fbdba595bfa6928c5fbe5b24349	1	\N	28995740272	\N	2013-08-05	\N
2880	\N	180001	ADEMAR ANTONIO DOS SANTOS	\N	c4176ee08829d94b94b311e9097ba4cd93d158ff	1	\N	29244970864	\N	2003-08-20	\N
2881	\N	190002	ANTONIO APARECIDO DIAS	\N	d6eb71519cc8ac3f564629b0ee29554a29b6ee93	1	\N	29280982249	\N	2014-01-20	\N
2882	\N	190004	RONALDO DA SILVA LIMA	\N	aecf89f77d8f0b7018011cdc74da3534ed696cde	1	\N	29363578534	\N	2013-03-01	\N
2883	\N	10265	RONALDO DOMINGOS DA SILVA	\N	\N	1	\N	29671542883	\N	2020-01-13	\N
2884	\N	140001	FRANCINALDO FIRMINO DA SILVA	\N	33f3927c4394c93311fce6feae6d49554ecefe12	1	\N	30659358808	\N	2015-01-06	\N
2885	\N	190005	RONI ALFREDO PEREIRA NUNES	\N	387b531225fc4e70c3879f040856adad98934159	1	\N	30785129839	\N	2014-12-10	\N
2886	\N	190004	JOSE CARLOS SANTOS DO VALE	\N	185d65aa28eea4d79e728c96d569c8e3921d707e	1	\N	31498752500	\N	2011-09-12	\N
2887	\N	180001	DOMICIO JOAQUIM DA SILVA	\N	4850f2aa9f41b68fd5dba16a2c143e36470c5c34	1	\N	31848095104	\N	1998-04-01	\N
2888	\N	180001	ROBSON MUNIZ DE MORAIS	\N	f9d969cb4b7ac05e3e01c7e003dac693946a28ab	1	\N	32286926808	\N	2011-03-01	\N
2889	\N	180001	CLAUDEMIR CORREA PINTO 	\N	\N	1	\N	32297909870	\N	2020-01-20	\N
2890	\N	180001	ANTONIO SERGIO PASIN	\N	7c6801dbcaa9d9f3ec2b2bb554af399e3caaadc2	1	\N	32446136915	\N	1995-01-01	\N
2891	\N	10146	VLADEMIR VIEIRA BIZERRA	\N	e213d133a9148811b7719c4ff68605065b8f466b	1	\N	32451672889	\N	2017-09-11	\N
2892	\N	10001	JOSE MARIANO DA SILVA	\N	5b2402c3b2ea5cedbf847fb0d58defbcef4258a2	1	\N	33018375904	\N	2000-04-17	\N
2893	\N	10146	LEONARDO DOS ANJOS MOURA GOMES	\N	a3583edf46bbc8fd4adff2b827d1169ffa021a6d	1	\N	33330792833	\N	2019-01-21	\N
2894	\N	10115	ELIUDO FERNANDES DA SILVA	\N	0a58226f2e564713e580ee602b3878845df9a00c	1	\N	33958696287	\N	2013-02-21	\N
2895	\N	190005	JOÃO LAURINDO MOREIRA	\N	c1a720de34fdc8422851b1e9c22bfa0b0ced8d25	1	\N	34160485472	\N	2014-12-02	\N
2896	\N	10121	ESTEVAO ALVES DE SOUZA	\N	41f97cd253eeccfc3589a3d3ef48d1a790b2e7db	1	\N	34550097191	\N	1996-05-01	\N
2897	\N	10067	GILBERTO JOSE PIMENTEL	\N	8725c5f07a8da5627c3bbf3ada8579b2ebb31591	1	\N	34825614272	\N	2017-08-01	\N
2898	\N	10067	ZENO SALDANHA DOS SANTOS	\N	f55e74adf7ff8a9824e24aa2172c6b7d3a36b1a3	1	\N	34825975291	\N	2009-07-13	\N
2899	\N	140001	SEBASTIAO SILVERIO DA SILVA	\N	ac0f348d1e1ca82bad88f797c38ded19757ff05a	1	\N	34954899168	\N	2017-12-04	\N
2900	\N	190004	JOSEMAR SILVA DE LIMA	\N	b0be4c71fedcdb4de1676008e2fdbe57a9f24f68	1	\N	35651636404	\N	2012-10-16	\N
2901	\N	190004	VILOBALDO FRANÇA	\N	d4cb06d7997ce467f1fe05d853091851a8cd1cc9	1	\N	36292729591	\N	2013-10-01	\N
2902	\N	190003	PAULO ROBERTO ORNELAS	\N	6fec071ff5486f4ffba0aa6d46f2453c4aa17d90	1	\N	38034697087	\N	2011-04-11	\N
2903	\N	180001	IVAN RICARDO GONCALES	\N	7110eda4d09e062aa5e4a390b0a572ac0d2c0220	1	\N	38365705800	\N	2020-01-20	\N
2904	\N	10121	RENATO MARCELINO DE ARAUJO	\N	9238c6279194a2526af99f93dba8a59153d5ca5b	1	\N	38369818153	\N	2019-04-08	\N
2905	\N	10121	OSEIAS MACHADO VIDAL	\N	c4fda5d77f42720137cf991206e02baebb99a871	1	\N	38621185253	\N	2018-08-06	\N
2906	\N	10067	EDILSON GOMES	\N	605ed40e4fe44d4aa73402059bb9c13dc1009b62	1	\N	38711893249	\N	2005-05-02	\N
2907	\N	190002	CUSTODIO JOSE SANTANA	\N	4ee46e48037ebe199f92f18973f6957811a0b2d5	1	\N	39043525200	\N	2019-07-22	\N
2908	\N	10067	ROSILDO DO ESPIRITO SANTO	\N	6703f563be03c8c42d15653d9eee65672aaf0ed3	1	\N	39061957249	\N	2008-05-08	\N
2909	\N	10146	JURANDI COSTA VIANA	\N	\N	1	\N	40671879553	\N	2012-09-21	\N
2910	\N	190002	MARCOS ROBERTO RIBEIRO	\N	73067f0c22c8fb4a0d8a8a92b5c6f553f7dd3dd0	1	\N	41244249904	\N	2008-09-01	\N
2911	\N	180001	JOEL LUIZ DA SILVA 	\N	a9429f13daa3e2bda0107954bb4a66fa86663f78	1	\N	41512499153	\N	2009-12-01	\N
2912	\N	10265	ANANIAS PEREIRA	\N	acf2ef7a257abf4fd1b1d5613bb622b1d4f75d7e	1	\N	42007771268	\N	2018-01-03	\N
2913	\N	140001	REGINALDO LOPES MEDINA	\N	48a90cfe298608bf485beaa9056f1575718d5ca4	1	\N	42054761320	\N	2019-03-06	\N
2914	\N	10067	SIDEMAR MANGAROTTI	\N	2f5b3c43e67e7a54df3b959e0feea05785a74d1c	1	\N	42242657291	\N	2013-08-05	\N
2915	\N	10067	CLAUDINEI RODRIGUES DA SILVA	\N	adfc84dfd6dabe24f3c4b3d7ea961e409fed596a	1	\N	42248892268	\N	2019-01-14	\N
2916	\N	10121	JUSCELINO FERREIRA DA ROCHA	\N	7cc9adc504d8419a4bc369560fc388efee9cdeb3	1	\N	42954975172	\N	2013-08-05	\N
2917	\N	10146	DOUGLAS CUNHA DE SOUZA	\N	5087f3d3a7de2d82b0c5fcf993bf1abc50aab9a5	1	\N	43359299515	\N	2015-02-02	\N
2918	\N	190004	LOURIVAL SANTOS	\N	91b1b615d90fdc007e604b20a495ea6b13bac053	1	\N	44540515500	\N	2008-02-01	\N
2919	\N	10121	WAGNER JAMES MOLINA	\N	\N	1	\N	45230480106	\N	2019-10-01	\N
2920	\N	10067	JOSE ADINALDO BATISTA FIGUEIREDO	\N	f66a0645005485a1a6ebde2b41bbc7fffe14f913	1	\N	45719535268	\N	2004-03-01	\N
2921	\N	190002	NILDO ANDRÉS JUNIOR	\N	f54e792beddb19e2704d6e1dbb9ad081a1b143c3	1	\N	45754241291	\N	2013-12-16	\N
2922	\N	10067	JULIO CESAR ZORZANELLO	\N	a054baeda440cf494814f2f07b67918b125c031a	1	\N	45763445287	\N	2008-12-01	\N
2923	\N	190002	LEOMAGNO DE OLIVEIRA	\N	1c1798fd0d6b8cd771157f8f1150c8404e98b8ae	1	\N	45772193287	\N	2013-08-26	\N
2924	\N	190002	ELIAS DA COSTA SANTANA	\N	ed9288e2cc2b14529e0d7fa1e2853702691bde3a	1	\N	46058516900	\N	2018-05-07	\N
2925	\N	190004	MATEUS FRANCISCO RIBEIRO	\N	42c5c618c00a9d4bd562cf1c7a4692c3cef61a41	1	\N	48171859534	\N	2012-10-16	\N
2926	\N	140001	VICENTE DE PAULO FERREIRA	\N	af534da7d7a4f77acb56db481bfc6b6a3a41b0bb	1	\N	48385263691	\N	2016-04-15	\N
2927	\N	180001	ALCIDES FELICIANO SILVA	\N	7d5b312c0d3a794762ccbde399106e948d5b0d64	1	\N	49604163949	\N	2014-01-16	\N
2928	\N	10121	SILVIO MEURER	\N	fd07b1fdcd3e4bdce8c04dcd82034db0b26e6df7	1	\N	49769642215	\N	2007-11-06	\N
2929	\N	10115	DENIS MACHADO DE SANTANA	\N	c91dafc416eb737bdc7bc374e3c0b5487546d332	1	\N	49801244291	\N	2012-12-14	\N
2930	\N	180001	CARLOS APARECIDO DOS SANTOS	\N	c22b33c1d865ddde4f1ab904485db845b31fe338	1	\N	50089854934	\N	2015-05-04	\N
2931	\N	180001	SIDNEI BURIAN	\N	1cc22cf28b381448506553dc05547362eda005ac	1	\N	50525816968	\N	2008-06-21	\N
2932	\N	10265	AMARO PEREIRA DA SILVA	\N	910e30d7097d8c9239cf74d97cbd3c413aa6deaa	1	\N	51140942115	\N	2016-07-01	\N
2933	\N	10265	ANTONIO FRANCISCO MEDEIROS	\N	\N	1	\N	51183455100	\N	2020-03-12	\N
2934	\N	190003	IVAN RUTSATZ	\N	e9d8b2a3b5284711a1f89a9747cddd14cd2901a8	1	\N	51662981015	\N	2011-03-28	\N
2935	\N	10001	JOAO FERREIRA LOPES	\N	669c08e15a1489beb532e32defc1c6489489f050	1	\N	51768046972	\N	1996-01-01	\N
2936	\N	10265	SILVANO BISPO DA TRINDADE	\N	8ab483248e8197f6c7386bc1b17df59fe8bf3d07	1	\N	51977630197	\N	2019-02-11	\N
2937	\N	180001	SERGIO HENRIQUE	\N	5f94b07fcfc30b758ad517d99a81e82c23bdbcf8	1	\N	52734374900	\N	1997-06-01	\N
2938	\N	10146	LUIZ  MARIO MOREIRA BASTOS 	\N	\N	1	\N	52794644572	\N	2020-02-20	\N
2939	\N	10265	CLAUDIO ANTONIO PASCOAL	\N	ad0cc9c60735b619d473e60125ce4ec4c6cd0103	1	\N	54315824100	\N	2019-03-04	\N
2940	\N	10146	CLAUDIO SANTOS BARBOSA	\N	0c637a95ca62fb565141c9d2a6956d47a678cf50	1	\N	54987881500	\N	2017-07-20	\N
2941	\N	180001	ADEMIR GUION	\N	d69a1e449e29587549bd3529e32367ff8940a719	1	\N	55183212953	\N	2008-03-01	\N
2942	\N	180001	AGENOR FRANCISCO DA SILVA	\N	f15c0f42fb0ae49091659b90577312587d598b03	1	\N	55574033968	\N	2010-01-11	\N
2943	\N	190004	JULIO NERI DA SILVA	\N	4fe3561ae212a3037ebd4d599b3ab5f77d21511d	1	\N	56324006549	\N	2014-05-20	\N
2944	\N	10067	ELIEL BALDUINO DE OLIVEIRA	\N	\N	1	\N	56776160287	\N	2003-10-01	\N
2945	\N	180001	JOSE ANTONIO JULIANI	\N	1c9ddf8fff5617e57e2821daa3e4a666aebdb465	1	\N	56798784968	\N	1996-10-01	\N
2946	\N	10121	VOLMIR MATTIONI	\N	05f6eeda65534260a46898e54a43d0800328a50b	1	\N	56950241100	\N	2005-08-08	\N
2947	\N	190005	EDMIR ALVES DOS SANTOS	\N	4709ad189c750384076177a87bcc07cc38823f5c	1	\N	56959265134	\N	2018-09-03	\N
2948	\N	190005	MARCOS ANTONIO DA COSTA	\N	f54f00eec05f4d21ebfff8a3b8e19271a0a64a71	1	\N	57154732172	\N	2013-05-02	\N
2949	\N	10067	IZAIAS DOURADO DO CARMO 	\N	\N	1	\N	57215553272	\N	2011-05-02	\N
2950	\N	180001	RINALDO BENEDITO SECO	\N	2d35ff8ed8dfd13634eadede980257b219800705	1	\N	57530068920	\N	2014-03-20	\N
2951	\N	180001	CARLOS GILBERTO BOCATTO	\N	395d77fbe7a412ffcf00915ce0077f2c837e5c40	1	\N	57553696900	\N	1996-10-01	\N
2952	\N	140001	APARECIDO FRAZAO DE MORAIS	\N	d98f9a61c6a410dca8f8ef771a955a4501eb9fe3	1	\N	57800413187	\N	2017-02-01	\N
2953	\N	190002	IDEVAN CARLOS VIANA	\N	228b92ce4288361a90c214afc19f95350a7a3a30	1	\N	57960895287	\N	2012-01-09	\N
2954	\N	180001	JONAS DO NASCIMENTO	\N	f0fb932cc45c31f806098bb61ffbd701991154e0	1	\N	58506470900	\N	2015-02-19	\N
2955	\N	190003	ALCEU LUIS SIEGERT	\N	b85d56b295b39e09ba0e9238d47f5aa279b49942	1	\N	58847448034	\N	2012-02-01	\N
2956	\N	10121	ANDRE LUIZ COUTO NETO	\N	ed4db4cac70648a9d0e55f06f46784efe8521e23	1	\N	58878114634	\N	2013-09-23	\N
2957	\N	140001	MILTON CAETANO FELIPE	\N	f4221979700546065fdba431de66b4996f48940e	1	\N	58878327115	\N	2017-08-21	\N
2958	\N	10067	JOSIMAR RONALDO DA SILVA	\N	6f1ddfde3d6cbbc332512b30d8a2068e83bb3846	1	\N	58985611291	\N	2017-07-20	\N
2959	\N	190003	SERGIO LEANDRO DA SILVA	\N	0ef77c7c5a1c3473fe58e75870ec6fe62831484c	1	\N	59055111015	\N	2008-06-09	\N
2960	\N	180001	EVANDRO PEREIRA RIBEIRO	\N	c7ea8d316f7e2662a7d43052628019610ded9eb2	1	\N	59804017172	\N	2016-11-28	\N
2961	\N	10265	EMERSON ROGERIO PORTILHO	\N	a950f03a2e9c7de447babccc3466ed0405e35cff	1	\N	60065958187	\N	2017-09-04	\N
2962	\N	190002	GESIEL ROSA FERNANDES	\N	dd25dc417a75330c37480ae60ac4a40cecd50e36	1	\N	60198559291	\N	2015-07-10	\N
2963	\N	190004	DEMILSON DE SOUZA	\N	517f2ea0e323686b928563c0b607ae0f0899a9ba	1	\N	60203927591	\N	2012-10-25	\N
2964	\N	10146	DERIVALDO DA SILVA SOUZA	\N	5908175fa3455bd86fd9ef29237b1d5edce8dd51	1	\N	60658720597	\N	2018-12-20	\N
2965	\N	190004	NILTON PINHO BRASILEIRO	\N	8967f93ab174200754a3bf606f5143a26ef6be2a	1	\N	60857773534	\N	2011-06-02	\N
2966	\N	140001	ISRAEL BEZERRA DOS SANTOS	\N	3fe1043acad83ee6c9ad4ab973ec7e2da081af02	1	\N	60872403220	\N	2017-11-01	\N
2967	\N	10146	GREGORY PRAGA DE JESUS BARRETO	\N	71041883d1ca2a079935d7e943f6986142c64b69	1	\N	61771201568	\N	2012-02-01	\N
2968	\N	190002	JUARES FERREIRA BRANCO	\N	b5a656828fbc27fffdd54c96f76bc962c10111af	1	\N	61880523272	\N	2017-01-13	\N
2969	\N	10067	RONI CESAR NAZARIO	\N	6cc5fee3e94c00157e021af2b425d10d0f65ade0	1	\N	61906840253	\N	2011-06-01	\N
2970	\N	190002	DIRCEU APARECIDO BARBOSA	\N	04abc820348a33d4489336144b40a566934d54d3	1	\N	62062662220	\N	2019-06-10	\N
2971	\N	10121	MARILDO ALVES DE OLIVEIRA	\N	191d6c18bfb0143ffa34bd5eabe2a384dc64a91b	1	\N	62112333100	\N	2016-07-20	\N
2972	\N	10067	ELIAS BARELLA	\N	4e324acd28a48a734a862ff6d080f889a28bdf08	1	\N	62654381234	\N	2019-03-04	\N
2973	\N	190004	SILVIO OLIVEIRA SANTOS	\N	b9e2beef83bb35358fc2595b4fa3c89ad2926cd5	1	\N	63083639520	\N	2006-11-20	\N
2974	\N	180001	SILVANO MOREIRA BONFIM	\N	7a625353ce24b529d1b5115f396dc36e27c37f75	1	\N	63098849991	\N	2000-08-15	\N
2975	\N	10121	VILSON BARBOSA	\N	57b7f34bf8f44edd66185041ffc3409a6af61101	1	\N	63244608949	\N	1998-10-01	\N
2976	\N	180001	ADELAIDO CARDOSO MEDEIROS	\N	90ef33b40d2edfb812671a8c68750beb299cf651	1	\N	63319411934	\N	2010-02-15	\N
2977	\N	140001	JORDANIO PAULO PEREIRA DOS SANTOS	\N	75a28539466eeb5b27d25d29325d37c199acf1a8	1	\N	63347148134	\N	2014-03-20	\N
2978	\N	190004	GIBSON FERREIRA TAVARES	\N	9f42e4628f29042710fad7ac6383908d53a743ad	1	\N	63622068515	\N	2009-02-17	\N
2979	\N	190003	JOSE CARLOS DA ROSA BELLO	\N	a2a61473d46904dfc6ca604cd2d5f5b3533e7e30	1	\N	64090531004	\N	2008-01-02	\N
2980	\N	10067	ANTONIO MARCOS SILVA	\N	\N	1	\N	64589862204	\N	2016-05-09	\N
2981	\N	10001	JOSE CARLOS ESPERANCA	\N	102c4a50555f741b7dd7e79f1989a23b20a1a8c2	1	\N	64856992953	\N	1997-11-01	\N
2982	\N	190002	ZENILTO RIBEIRO GOES	\N	fde12bc38626b9b4263ca42b1608e5a1908bf737	1	\N	65017692134	\N	2006-10-08	\N
2983	\N	190005	LEIDIMAR COSTA LIMA	\N	437e1052b00c8a7660eceed923d430376a636876	1	\N	65141300110	\N	2013-07-22	\N
2984	\N	190002	SILVIO ANTONIO HASTENREITER	\N	\N	1	\N	65190815234	\N	2008-06-25	\N
2985	\N	10265	JAIRO MAQUES MARINHO 	\N	\N	1	\N	65363590115	\N	2020-01-13	\N
2986	\N	10121	LUIZ CARLOS MORAES	\N	edcfcb97d66a807c69ea7fbc27f19740eca063d5	1	\N	65483138104	\N	2013-05-02	\N
2987	\N	190005	DONIZETE FERREIRA DE SOUZA	\N	70716d1b8d2c32cbe86451e5b96715c93e9169cd	1	\N	65587464253	\N	2016-03-15	\N
2988	\N	190002	NELSON NUNES RATES	\N	6156ff210d64dcd0845e04e33df47f437d07dfbd	1	\N	65867262200	\N	2019-06-10	\N
2989	\N	10265	MARCO ANTONIO ZANETTI COUTINHO	\N	3c857391652b9be514f5da0f90ade38247d91663	1	\N	66163757149	\N	2014-02-03	\N
2990	\N	10146	JAILTON DO NASCIMENTO PEREIRA	\N	db65ad121805b9bef99127c8af65eb1625d909fd	1	\N	66691486587	\N	2018-02-20	\N
2991	\N	180001	NILSON MARTINS BORGES	\N	4cab639b29e36a34e90ad92bb07b4986c1207b23	1	\N	67639135915	\N	2011-07-13	\N
2992	\N	180001	ROBSON HERMES DA SILVA	\N	368a7d0b293f62cb49dff051bd1e3e504f481a2e	1	\N	68149964215	\N	2013-04-22	\N
2993	\N	10067	JOSE WILSON DE SOUZA	\N	c2c3b8d40b0ea0dbac2ba3a2becbf3caab7ded0d	1	\N	68523181253	\N	2008-09-01	\N
2994	\N	10067	FABIO VERDAN 	\N	\N	1	\N	68809450230	\N	0001-01-01	\N
2995	\N	10121	WALDIR DE SOUZA NUNES	\N	21a86ad8f1d1e60ae2e8dd46545d3f936e80a00d	1	\N	68893728168	\N	2018-08-10	\N
2996	\N	10067	DJALMA COSTA DA SILVA	\N	6f30c745fb6ca1f7873cfca18a549448f1debfae	1	\N	68936320297	\N	2002-11-01	\N
2997	\N	190004	JOSE SERGIO SOARES RODRIGUES	\N	b23a7b228b661f006b8882aaa7ff219d3bdce195	1	\N	68963980430	\N	2019-07-10	\N
2998	\N	10121	JODILSON MENDES LOPES	\N	51f795c218e9ff2f688ead745a7b9f5c0760d959	1	\N	69679460134	\N	2018-07-02	\N
2999	\N	190004	JAILTON DE JESUS	\N	71e3c671d69972931455665600524fccb76407ba	1	\N	69739900534	\N	2018-03-05	\N
3000	\N	10067	CLEBER BORGES MARTINES PEDROSA	\N	46d86760aae81fabd7f03d919c97c4fc3acf14d7	1	\N	69840814249	\N	2016-04-20	\N
3001	\N	10121	JOSE BENEDITO DA SILVA	\N	56053a3a49a6695fa52b7c118eb13c8fd688a777	1	\N	70021600449	\N	2013-04-04	\N
3002	\N	190005	WAGNER SANTOS DA SILVA	\N	561308993c033cf078ce0c89047f636b53c3343f	1	\N	70340790130	\N	2018-10-22	\N
3003	\N	10146	GILVAN SANTOS CRUZ	\N	ddcae70bfdb9e6469685b389a28ae85155fa2cbc	1	\N	70565228587	\N	2019-01-09	\N
3004	\N	190004	SENIVALDO VITOR FAUSTINO	\N	13b87fe8a9b65457f0fd92d25e578153d93a1ccd	1	\N	70595003591	\N	2014-02-20	\N
3005	\N	190003	JONI GILBERTO BRAATZ	\N	f93b1f45c6a18915be6ca25c8a2f6ad439038f20	1	\N	70887659004	\N	2008-11-05	\N
3006	\N	10067	NEIMAR ANTONIO DE ABREU	\N	fd25fdaf0a8f5f950d3de3ea05fcea7b98c4e129	1	\N	71333100230	\N	2012-01-02	\N
3007	\N	190002	JOCE ANTONIO CARDOSO 	\N	\N	1	\N	71379487234	\N	2019-09-11	\N
3008	\N	140001	FLAVIO HELTON GONZAGA	\N	dd50613b30a4da2705c1bab1df9d019ba1dab8d2	1	\N	71470263149	\N	2016-11-09	\N
3009	\N	190003	FREDERICO ARNALDO ROOS	\N	\N	1	\N	71893270025	\N	2008-01-03	\N
3010	\N	180001	CELIO INOCENCIO	\N	dfe8c6d72435cfc5f4ff6538e8bdf6a547293202	1	\N	72319755934	\N	2017-11-13	\N
3011	\N	10067	LEANDRO MARCOS DA CONCEICAO	\N	0d7679c5e9a998bbdcfd1cfca2431678f3ee7494	1	\N	72324287234	\N	2016-07-01	\N
3012	\N	140001	SANDOVAL DE JESUS FERNANDES	\N	7eff0a3282b15d49914478d9c66a122f887a37f9	1	\N	72418834115	\N	2014-03-20	\N
3013	\N	10067	EDSON FERREIRA DA PENHA	\N	3a8795afa7af5820830902437eaf9772188c0d46	1	\N	72752491204	\N	2014-12-04	\N
3014	\N	140001	JAHILSON SARAIVA DIAS	\N	f7539c1d63d53cd9bf0c415f6559504c619236de	1	\N	72818360315	\N	2019-04-08	\N
3015	\N	10146	CARLOS ANDRE SIMOES DOS SANTOS	\N	9a9ccfcd9ebb7e6818a86b8b463d01e2ade67b52	1	\N	73047791520	\N	2014-03-20	\N
3016	\N	140001	ANTONIO FILHO GONCALVES DOS SANTOS	\N	4a4d6e21ec68069787bb86e5010aec620470e146	1	\N	73106410191	\N	2017-06-20	\N
3017	\N	180001	ALBERTINO SANTOS MARCAL JUNIOR 	\N	\N	1	\N	74028235987	\N	2020-02-03	\N
3018	\N	190002	ADEMIR DANELLI CEREZOLI	\N	f24e191210fd596e2e40db5f7b1a786cc53b75de	1	\N	75029359249	\N	2008-12-01	\N
3019	\N	190002	ELISMAR SILVA FREITAS	\N	703e6e9cdadc25529a6a8c290b7817b7a94da4b1	1	\N	75507706204	\N	2018-05-02	\N
3020	\N	140001	JENILSON SANTOS SILVA 	\N	\N	1	\N	75645769287	\N	2019-12-16	\N
3021	\N	190002	SIDINEI DOS SANTOS RODRIGUES 	\N	\N	1	\N	75825473220	\N	2019-08-19	\N
3022	\N	190005	DANIEL LUIS DOS SANTOS	\N	20619ba292448355e8b9ca0730b32603a96c4b30	1	\N	75871866115	\N	2012-03-19	\N
3023	\N	10067	HENRIQUE PALMIRO DE ABREU	\N	3c56ab8756840e8df80d10ea21cea9a41dbd7398	1	\N	75888190225	\N	2012-05-03	\N
3024	\N	10067	SIVANILDO RAINHA DE SOUZA	\N	cf9d8ed2e42943af2692123a69c9924b55a7082a	1	\N	76431576268	\N	2013-09-02	\N
3025	\N	190002	FABIANO KRZYWONOS	\N	8c8d720b3d6080b9ba9db9f35eb56a32323e0aac	1	\N	77416090253	\N	2010-12-07	\N
3026	\N	140001	EDUARDO DA SILVA DUARTE	\N	1d64a5f0193cb657143d5c38891187943f0a2947	1	\N	77674634191	\N	2019-03-20	\N
3027	\N	180001	MILTON MACHADO DA CRUZ	\N	35df3d08b0816c7ed1e95adfb48e13a56a97c06b	1	\N	78134277934	\N	2005-11-17	\N
3028	\N	10146	ROBERTO LIMA SERRA	\N	d06029d232e76c9688cf9a00f61cbe85963fec94	1	\N	78172055587	\N	2017-03-06	\N
3029	\N	10146	NOEL PINHEIRO DA CRUZ	\N	17962efb4a827dfbc8b3b5b10df81f04322c82ea	1	\N	78548004568	\N	2014-10-03	\N
3030	\N	190004	JORGE LUIZ DE ARAUJO SANTOS 	\N	\N	1	\N	78635586549	\N	2020-02-20	\N
3031	\N	10067	JOEL JANUARIO DA SILVA	\N	0535481c8b01f66da4aae87b9fce5995d5605ca9	1	\N	78642558253	\N	2017-01-12	\N
3032	\N	10265	RICARDO DA SILVA MARTINS	\N	7a9162625d888138ef192ffe6cd659f90adb965a	1	\N	78716411153	\N	2016-12-06	\N
3033	\N	190002	EDIVAL GROBERIO LIMA	\N	d719c07305b8903b9074616062e7bc29cd8866f3	1	\N	79420109291	\N	2011-04-19	\N
3034	\N	10121	LORISVALDO MARTINS DOS SANTOS	\N	362ac6b0f697f452a153e4e3f05de8cadffc659d	1	\N	79454380168	\N	2014-05-19	\N
3035	\N	180001	ANTONIO MARCOS CABRAL	\N	5dc9216d7ee4fe8b4968a081ff61200b324fada3	1	\N	80342353934	\N	2013-02-22	\N
3036	\N	190002	JOSE CARLOS RIBEIRO GOES	\N	82919b55d2683d3c15beb7f70e7100bc6d60d1a8	1	\N	80968686249	\N	2009-03-12	\N
3037	\N	190002	EDUARDO JOSE EUZEBIO	\N	b001caeddbf015492714e68568c7e41e2ae45aa9	1	\N	80998909220	\N	2008-07-08	\N
3038	\N	190002	EDINEI CANDIDO ZEFERINO	\N	c941ae38eb50c417bc0a7a943cea6907630f515a	1	\N	81150717220	\N	2012-05-04	\N
3039	\N	190002	PAULO CESAR DE PAULA HOLANDA	\N	0b2a3a1e6ebd09cf32275c8b9abbdd36fe8e0574	1	\N	81371519234	\N	2013-07-10	\N
3040	\N	10067	EMERSON PEDRO DOS SANTOS	\N	78adfa4581fee0015b5bb4fa9f9017c675ba8219	1	\N	81481004204	\N	2009-01-09	\N
3041	\N	180001	RICARDO FRANCISCO DE ASSIS	\N	01ff542c07379f2f9141453d69b46080906f83aa	1	\N	81879156920	\N	2006-08-23	\N
3042	\N	190003	VALDECI ANTONIO PEREIRA	\N	4951a51060addf1990f0c52c1a1a8e0abdbab8b0	1	\N	83066179087	\N	2014-02-20	\N
3043	\N	10105	ALEXANDRE CRISTOVAO WENDPAP	\N	8baf42143b5179b73b584c7a09078b7bb57b7cdd	1	\N	83100504100	\N	2019-03-06	\N
3044	\N	10265	OSVALDO ANTONIO DE SOUZA	\N	\N	1	\N	83154990178	\N	2019-11-04	\N
3045	\N	180001	NILTON RODRIGUES ALVES	\N	88bdd0ffa514397594539642848246c144c8f6b9	1	\N	83218386934	\N	2000-08-10	\N
3046	\N	10121	ROSIMAR BATISTA DA SILVA	\N	8c81c2b9a3aace3a81a1c7f463e9cd8e1064f9f9	1	\N	83292071100	\N	2012-09-01	\N
3047	\N	10146	MANOEL SILVA DE ALMEIDA JUNIOR	\N	4a926dea34e322506abd8cebe6bf3ee8bebba649	1	\N	83323589572	\N	2011-10-03	\N
3048	\N	190004	JOUMACIO SOUZA DE OLIVEIRA	\N	6a93b60f14533a1bb08bd013f9cc8da58d15481f	1	\N	83329498587	\N	2010-06-01	\N
3049	\N	140001	RICARDO PIRES BARBOSA	\N	1d918d3930f49f72cbd30f009fedfda8209f339a	1	\N	83683046104	\N	2016-10-03	\N
3050	\N	10265	ALDAIR DE SOUZA ACOSTA	\N	64f3c037be467b75fd68f2d0eac787602b655497	1	\N	84629436120	\N	2017-05-22	\N
3051	\N	10067	MARCOS SILVA DA CRUZ	\N	58c0c6d26c401786e69d87642cbac33dc0ef47f3	1	\N	84835001249	\N	2019-02-04	\N
3052	\N	140001	JOSE DIVINO SOARES DE ALMEIDA	\N	1e66e6f03dea536d809e33b5d93ef14aa8dbed12	1	\N	84882000130	\N	2016-10-20	\N
3053	\N	190002	FABIO THOMAZ DE SOUZA	\N	ba86813654ea9019ebdf4c77ddef44288a57bf76	1	\N	84948299200	\N	2017-05-03	\N
3054	\N	10121	LUIZ GOMES VIANA JUNIOR	\N	966030e88d43322d4eeb4a99305cc76cfc0bff7d	1	\N	85876380172	\N	2013-01-28	\N
3055	\N	140001	ALDO SOARES DE ABREU	\N	06749e93cf4a8844f6f5c230854216017675984d	1	\N	85949779134	\N	2016-12-05	\N
3056	\N	140001	JERONES GONCALVES PEREIRA	\N	50ac78f796925ebfd59c359299b7425bb13c46d5	1	\N	85998214153	\N	2019-04-01	\N
3057	\N	180001	GIVALDO BORGES FERREIRA	\N	28f30c1c1a07b7a802a929490c3798df1fdefa6a	1	\N	86507940925	\N	1999-10-01	\N
3058	\N	190002	WELINGTON SOARES PEREIRA	\N	55e7348409ee941a955d07d62d52933b1900cef6	1	\N	87030888200	\N	2011-01-10	\N
3059	\N	10115	CLEILSON SOUZA DO MONTE  DA SILVA	\N	416dbc2a8c65247b42b2c897eb974185e1a524ee	1	\N	87562642249	\N	2016-10-10	\N
3060	\N	140001	SANDRA ARAUJO SILVA	\N	ddd49efe8609bc5a9b0ae4ee3f80f61d78e1e780	1	\N	87863219191	\N	2017-12-04	\N
3061	\N	180001	ROLBER LUIZ BARBOSA	\N	cadc721ca261e6ce386090d7a9a562a6606d499f	1	\N	87923092915	\N	2019-10-16	\N
3062	\N	190005	DINEI GOMES DA SILVA	\N	f779719191882dcc9fe8cea0671e4afe51afef39	1	\N	89056094149	\N	2014-09-08	\N
3063	\N	190004	FRANCISCO JOAO SILVA DOS SANTOS 	\N	\N	1	\N	89340442504	\N	2020-02-20	\N
3064	\N	140001	RENATO FRANCISCO RODRIGUES	\N	911f34e42a64e953ac48979d2185b8d2f13c5b5b	1	\N	89636724172	\N	2019-02-20	\N
3065	\N	180001	MIGUEL AGUIAR RIBEIRO	\N	18c191cc608afe6020254760acd197c6af7f6511	1	\N	89709357972	\N	2007-10-24	\N
3066	\N	140001	GILSON PEREIRA DE MELO	\N	db973af0febfda0575bb58c0dc1f547506b97af3	1	\N	89823060134	\N	2017-08-14	\N
3067	\N	190005	OSIEL DE QUEIROZ MUNIZ	\N	07f5fbff0faf3b527afe88a36957b44676d70229	1	\N	89848233172	\N	2008-09-19	\N
3068	\N	10146	DAVI SERGIO DE SOUZA BRITO	\N	e564477e275dc95cbab038df28f4358a1e9bd009	1	\N	90068483520	\N	2011-01-03	\N
3069	\N	10121	ELTON SANTANA DA SILVA	\N	3e03873cb8bcd64e8afe9f144a99d36755bdad2a	1	\N	90462408191	\N	2013-03-06	\N
3070	\N	10121	ALRIVAN SANTANA DOS SANTOS	\N	fbdb9114158caf676227dc04945af16a4ca7fe3a	1	\N	90939107104	\N	2017-08-21	\N
3071	\N	10146	JOSE HEUDES BATISTA OLIVEIRA	\N	b9333200dbc3719e2f1bbcd29c29667555617ef3	1	\N	91056853549	\N	2017-07-10	\N
3072	\N	10265	ALCEU ROBERTO DE OLIVEIRA	\N	87070043a3d37b064f7e55ce1c3248e28fe639a7	1	\N	91124557768	\N	2017-09-04	\N
3073	\N	10146	DAMARIO DE SOUZA OLIVEIRA	\N	8aff84343218d6595ca2a91004fea6a709c8b1a8	1	\N	91165814587	\N	2013-01-21	\N
3074	\N	190002	DANIEL GUIMARAES SANTOS	\N	adceaf27a142cf140bb07e2d66bed44a0ddb9442	1	\N	91349168220	\N	2013-07-05	\N
3075	\N	140001	JOSE ARLESON ZACARIAS DA COSTA REIS	\N	cc5cce03231cfba6f0a21a61317c7f05289e81d6	1	\N	91616760206	\N	2018-08-01	\N
3076	\N	10001	GEVALDO GONCALVES OLIVEIRA	\N	80a7223591003e4e832cc277d7d7893b0b55f3d3	1	\N	91674140959	\N	2000-08-10	\N
3077	\N	10146	EDSON BRANDAO SANTOS	\N	4c702320356252c07ee8c9ef5d64df3aa910a243	1	\N	91724139568	\N	2016-10-20	\N
3078	\N	190005	ITAMAR MOHR	\N	ba962bd4b270630fb5355c3ab1f6e81460781311	1	\N	91959322915	\N	2016-10-20	\N
3079	\N	10146	GILMAR GOMES VITORIA	\N	786d5bbd04c9f489909223deeef0a39dd458acad	1	\N	92223419534	\N	2007-04-02	\N
3080	\N	190004	JUTAIR SANTOS SOARES	\N	0827f578562ab769dd45357c869a953f0025960d	1	\N	92615589504	\N	2013-09-03	\N
3081	\N	10146	EGLESON MOUZINHO FIGUEIREDO DE SOUSA	\N	21d93ed62a2c5819fb9bbcab77f43dd438781220	1	\N	92712290534	\N	2017-07-10	\N
3082	\N	140001	FABRICIO DE FREITAS CUNHA	\N	7560014ff4224cd24762c180cad2cc0047e75bc2	1	\N	92975313187	\N	2018-12-03	\N
3083	\N	10115	CLEMILSON BARBOZA DE SOUZA	\N	bb3a2776f37a385a254aa2c5af2dc08fdde20222	1	\N	93002769215	\N	2016-02-04	\N
3084	\N	10265	CELIO GONCALVES VIEIRA	\N	d2be40a448c2d343ba59b876d647180f740fb8f6	1	\N	93016123134	\N	2018-10-23	\N
3085	\N	10146	MARCIO FERREIRA LIMA 	\N	\N	1	\N	93290179591	\N	2020-02-20	\N
3086	\N	190004	LEUR GILVANY CARNEIRO OLIVEIRA	\N	5131c90f7769b9eaf94f2883e5d459747a052285	1	\N	93319495534	\N	2013-12-16	\N
3087	\N	140001	LUCIANO CARDOSO DA SILVA 	\N	\N	1	\N	93409923187	\N	2019-12-23	\N
3088	\N	190003	ROVANIO REDEL DE CAMARGO	\N	7c7274424e63e45e065e57fc0143e309575630c0	1	\N	93451482053	\N	2018-04-02	\N
3089	\N	190002	REGINALDO SOARES	\N	5c87d21fec8b58fb50c7913872965752a66b5534	1	\N	93554265268	\N	2013-12-19	\N
3090	\N	10146	JAKSON DE OLIVEIRA FERREIRA	\N	fed7554e597a20dadcd9abbbf36d58f0d1c5c292	1	\N	93753225568	\N	2018-08-13	\N
3091	\N	190004	JOSE NILSON TIMOTEO DA LUZ	\N	cd524f47cf724a1b4982fdf72e2e65ce6b57fc85	1	\N	93756950506	\N	2019-05-02	\N
3092	\N	10146	RAIMUNDO SENA PINTO	\N	c2e4a9b9c5b06ac4023f4582c0ca32942047aea1	1	\N	94062366568	\N	2015-10-05	\N
3093	\N	10146	ADEILTON ALMEIDA DE CARVALHO	\N	4486d2dbb6f85ff89bed060b87a76c7d72c43070	1	\N	94346780563	\N	2015-05-04	\N
3094	\N	190002	ANDERSON CLEITON METZ CUCCHI 	\N	5b97ca8d264f3bcb71309848156c9304e2fec29b	1	\N	94563853291	\N	2019-09-11	\N
3095	\N	190004	JOSEVALDO SANTANA DOS ANJOS	\N	e6a4ff45a0dd833c4da1a16b2070b3b9c6a32645	1	\N	94805750510	\N	2018-02-20	\N
3096	\N	190004	EUQUISSON GONCALVES DE PINHO	\N	ba4557ec237d1c13475248873bd6db18192ea6db	1	\N	95131949572	\N	2019-07-10	\N
3097	\N	140001	GIOVANI FILHO PERREIRA DA SILVA 	\N	8518ca23ef631223aa9f2eddfb2ee799c6205a74	1	\N	95376364100	\N	2016-04-15	\N
3098	\N	190005	RONAIR AMARAL DOS REIS	\N	69d61b042201d8e93eaec4864e1483441933d3bc	1	\N	95492399187	\N	2019-04-22	\N
3099	\N	180001	JOSE NILSON DOS SANTOS	\N	07c443b2c2b052fd371e2f673a3c3149bf286ee2	1	\N	95870660904	\N	2004-07-01	\N
3100	\N	190002	JOAO GUILHERME  DA SILVA PAULA	\N	bbbcfb69fc0e3662f6bc32149c9b043ac2f67014	1	\N	96303824234	\N	2016-12-08	\N
3101	\N	10146	JOSE NIVALDO DE OLIVEIRA FREITAS	\N	aa92ea9a2c82978ffe9503015311c2c6d9e82ecd	1	\N	96415908553	\N	2013-12-16	\N
3102	\N	190005	PAULO EDUARDO DA SILVA	\N	eae2f7e959e90eacd06dfa64bf19d074af4a6583	1	\N	97492418191	\N	2019-03-06	\N
3103	\N	180001	EMILIO VALDEMIR GUION	\N	477062b41a7f673d793020cec3cbeb022e5e1fd3	1	\N	97518158949	\N	2006-09-26	\N
3104	\N	10146	PAULO CEZAR LIMA DE SANTANA	\N	cbed6c3fddb0c1911b1d63e53d4bebd8e0431e7e	1	\N	98008064587	\N	2017-12-11	\N
3105	\N	190004	CARLOS ROBERTO FONSECA BOAVENTURA	\N	1387583538c7d271da68f1118bf04bef38f4cb4a	1	\N	98065653553	\N	2010-12-17	\N
3106	\N	10146	EURIVELTON DE JESUS SANTOS	\N	b8393e60ca9f3e8871f1dcfdc64964e06ca01ed3	1	\N	98118102572	\N	2017-11-06	\N
3107	\N	10121	SIDNEI GONCALVES DA COSTA	\N	93c5a24db88ac432247d0ead13937c0c7815e19a	1	\N	98191934191	\N	2019-02-20	\N
3108	\N	190004	LEANDRO RIBEIRO ARAUJO	\N	be4979b69a084fa1bc3de4cc5c24a17955e06f47	1	\N	98292048553	\N	2013-12-10	\N
3109	\N	10146	EVERALDO PEREIRA DA SILVA	\N	e633d328aab80353fd760dc3bc08660c31c095cc	1	\N	98558374520	\N	2018-03-05	\N
3110	\N	10067	RICARDO RODRIGUES FERNANDES	\N	9f7726fdef54fb0067491270b9ebfc6d92c6974c	1	\N	98619454234	\N	2010-07-12	\N
3111	\N	190005	SIDNEI PINHO DOS SANTOS	\N	baf2037bbf3caac75cb728cf08dd4063d782a333	1	\N	98659235134	\N	2018-08-06	\N
3112	\N	190002	ANTONIO VICTOR DA COSTA NASCIMENTO	\N	b188d19f9fea6332fd2cfc3b088235161de1d6f7	1	\N	98764241220	\N	2019-07-11	\N
3113	\N	190003	GERSON MATIAS RUTSATZ	\N	95f60d11a29146941658e464066cf321b366692e	1	\N	98766767091	\N	2008-06-02	\N
3114	\N	190004	WANDERSON PEDREIRA ESTRELA	\N	b3a2a6b084d007cf7302103c21ab2cae08558e9c	1	\N	98966146520	\N	2009-06-04	\N
3115	\N	190004	GENIVAL DE JESUS DIAS 	\N	\N	1	\N	99402270515	\N	2020-02-20	\N
3116	\N	190004	NILTON CEZAR CORDEIRO ALMEIDA	\N	126a0baa41dcdb4529f1d4a25e1fb20f5876f1bf	1	\N	99436183534	\N	2011-07-04	\N
3117	\N	10121	MANOEL SILVA DOS SANTOS 	\N	\N	1	\N	99452880406	\N	2019-09-16	\N
3118	\N	190005	MESSIAS LUIZ DOS SANTOS	\N	760449b00ceafc837fa38d7ed84a817acf0fc8f0	1	\N	99747693100	\N	2012-11-01	\N
3119	\N	190003	IVO MARIO DE SOUZA	\N	8c7fc87b166046b6a2cdf61352d4c96303132f1a	1	\N	99821869068	\N	2011-01-10	\N
3120	\N	190003	LEANDRO GUEDES	\N	f4f272e7e2fba74a38b91791da514bd6dc258afe	1	\N	99889471000	\N	2011-06-17	\N
3121	\N	10121	JULIANO OLIVEIRA PINTO	\N	3d529063d7b5fc2a18a2e2da535b7f02f53800f3	1	\N	99901021120	\N	2014-05-17	\N
\.


--
-- TOC entry 3066 (class 0 OID 32831)
-- Dependencies: 223
-- Data for Name: veiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veiculo (idveiculo, idfilial, prefixo, tipo, ano, placa, categoria, capacidade, modelo, marca) FROM stdin;
32	180001	2720	Cavalo Toco	2012	NDN5E33	CARRETA	\N	CARGO 1722	FORD
31	180001	2730	Semi-Reboque 2Eixos	2012	NDN5463	CARRETA	\N	NOMA SR3E27 BF	SR
105	180001	2740	Cavalo Toco	2017	NDN5483	TOCO	\N	1420	MERCEDES BENZ
251	10067	2750	\N	2017	AQL5759	TOCO	82.74	\N	\N
391	10265	2760	Cavalo Toco	2012	AQL7376	RODOTREM	33.86	M.BENZ	MERCEDES BENZ
155	10121	2790	\N	2016	LRK0860	TOCO	78	\N	\N
203	190005	2800	Cavalo Toco	2001	IMQ0445	CARRETA	78.78	1420	MERCEDES BENZ
137	10121	2810	\N	2011	AQN5331	TOCO	85.79	\N	\N
149	10115	2820	Semi-Reboque 2Eixos	2014	AQN5330	TOCO	82.74	FACCHINI SRF CF	SR
215	10146	2830	Semi-Reboque 2Eixos	2009	AQN7413	TOCO	77.96	NIJU NJSRFR 3E	SR
221	10146	2840	\N	2008	AQN5336	TOCO	78.08	\N	\N
218	10146	2860	\N	2012	AQN2074	TOCO	78	\N	\N
223	10146	2870	Cavalo Toco	2003	AQN2076	TOCO	78	ATEGO 1518	MERCEDES BENZ
174	140001	2890	Toco	2012	AQN2080	CARRETA	78	L 1113	MERCEDES BENZ
179	140001	2900	\N	2000	AQN2073	TOCO	75.04	\N	\N
204	190005	2910	Cavalo Toco	2013	NDN3455	TRUCK	77.25	1420	MERCEDES BENZ
514	190005	2920	Truck	\N	NDX1844	JULIETA	91.77	M.BENZ L 1113	MERCEDES BENZ
79	190002	2930	\N	2010	NDX0774	TOCO	90.86	\N	\N
185	140001	2950	Toco 3/4	2001	AQP6134	TOCO	78	F4000	FORD
158	10121	2960	\N	2013	AQO0864	TOCO	78	\N	\N
219	10146	2970	\N	2002	AQO0863	TOCO	78.31	\N	\N
106	180001	2980	Cavalo Toco	2017	IPE2395	TOCO	\N	1420	MERCEDES BENZ
410	140001	2990	\N	2011	AMX5243	TRUCK	33.85	\N	\N
205	190005	3025	Cavalo Toco	2009	NCS9802	TOCO	73.3	1420	MERCEDES BENZ
226	10146	3035	Cavalo Toco	2009	NCS9792	TOCO	78	ATEGO 1518	MERCEDES BENZ
190	140001	3045	Cavalo Toco	2017	NCS9822	TOCO	74.81	1720	MERCEDES BENZ
140	10121	3060	Semi-Reboque 2Eixos	2011	IMF1438	TOCO	81.45	SEMI REBOQUE GOYDO	GOYDO
98	180001	3120	Cavalo Toco	2017	AQQ3066	TOCO	\N	1418 R	MERCEDES BENZ
30	180001	3140	\N	2013	AQR7284	CARRETA	\N	\N	\N
396	140001	3220	Cavalo Toco	1998	ARA4017	CARRETA	33.86	VOLVO	VOLVO
389	10265	3230	Cavalo Toco	2012	ARA4018	RODOTREM	33.86	VW 7.90 S	VW
151	10067	3260	Cavalo Toco	2013	NCY2200	TOCO	74.55	F4000	FORD
242	10067	3270	\N	2018	NCO9565	TOCO	86.13	\N	\N
225	10146	3280	Cavalo Toco	2008	ARI6190	TOCO	78.67	ATEGO 1518	MERCEDES BENZ
220	10146	3290	\N	2012	ARI6189	TOCO	78	\N	\N
11	180001	3310	Truck	2004	ARL7069	TRUCK	\N	1313	MERCEDES BENZ
12	180001	3320	\N	2004	ARL7A67	TOCO	\N	\N	\N
16	180001	3330	Semi-Reboque 2Eixos	2008	ARL7076	TOCO	\N	RODOFORT SRR PL	SR
163	140001	3340	\N	2013	ARO4462	TOCO	72.1	\N	\N
184	140001	3350	\N	2011	ARO4467	TOCO	77.25	\N	\N
234	10265	3360	Semi-Reboque 2Eixos	1997	ARO4464	TRUCK	76.5	SRF3ECL	LINSHALM
246	10067	3370	\N	2011	ARP8607	TOCO	92.71	\N	\N
133	190005	3380	Truck	2004	ARP8608	TOCO	92.71	FH12 380 4X2	VOLVO
188	140001	3400	\N	2018	ARS6310	TOCO	77.63	\N	\N
134	190005	3520	Semi-Reboque 2Eixos	2004	AKY9654	TOCO	90.94	TRILHA	IDEROL
195	140001	3540	Semi-Reboque 2Eixos	2012	ATA1599	TOCO	71.72	SRF3ECL	LINSHALM
222	10146	3550	Cavalo Toco	2007	ACZ1599	TOCO	76.5	1418 R	MERCEDES BENZ
227	10146	3560	\N	2008	ASZ1599	TOCO	77.47	\N	\N
173	140001	3570	\N	2014	AGZ2050	TOCO	72.52	\N	\N
375	10176	3650	Semi-Reboque 2Eixos	1998	ANX0074	CARRETA	33	SEMI REBOQUE RANDON	RANDON
382	10176	3660	Cavalo Toco	2007	ANX0076	CARRETA	33	M.BENZ 914	MERCEDES BENZ
385	10176	3670	Semi-Reboque 2Eixos	2008	ANX0071	CARRETA	33	SEMI REBOQUE RODOVIÁRIO	REBOQUE RODOVIÁRIO
376	10176	3680	Cavalo Toco	2000	ANX0075	CARRETA	33	VW 7.110 S	VW
80	190002	3715	Semi-Reboque 2Eixos	2010	ASO1590	TOCO	86.92	SEMI REBOQUE 	SR
248	10067	3720	\N	2008	ALB5913	TOCO	92.01	\N	\N
142	10121	3725	Semi-Reboque 2Eixos	2012	AVE0096	TOCO	92.01	SAO PEDRO SRFB 3E	SR
14	180001	3730	Truck	2006	ASN1458	TRUCK	\N	L 1218	MERCEDES BENZ
15	180001	3735	Truck	2008	ATN1590	TOCO	\N	MERCEDES BENZ	MERCEDES BENZ
76	190002	3740	Cavalo Toco	2006	ASK5F89	TOCO	86.92	L 1418	MERCEDES BENZ
78	190002	3745	Semi-Reboque 2Eixos	2006	ASP1F60	TOCO	86.92	NIJU NJSRFR 3E	SR
13	180001	3750	Truck	2008	ATF1590	TOCO	\N	L 1118	MERCEDES BENZ
77	190002	3755	Cavalo Toco	2008	ABJ1590	TOCO	86.92	SCANIA	SCANIA
359	140001	3760	Motoclico	2018	AOO6619	BITREM	32.87	HONDA CG 125	HONDA
379	10176	3800	Cavalo Toco	2011	ABG1440	TANQUE	36.29	FORD F 1000	FORD
372	10146	3810	Cavalo Toco	2019	AEQ1440	BITREM	38.25	FORD F 4000	FORD
371	10146	3820	Cavalo Toco	2018	ABJ1290	BITREM	33.51	FORD F 4000	FORD
381	10176	3830	Cavalo Toco	2007	ARC1290	CARRETA	33	SCANIA / P 114 GA 4X2 NZ 340	SCANIA
392	10067	3840	Cavalo Toco	1998	ATU1130	RODOTREM	33.82	CHEVROLET D40	GM
361	140001	3850	Cavalo Toco	2018	ATA1130	BITREM	33	8140	VW
135	10121	3880	Truck	2004	AGZ0112	TOCO	90.42	L 1218	MERCEDES BENZ
86	190002	3890	\N	2013	AGZ0118	TOCO	88.65	\N	\N
83	190002	3900	Cavalo Toco	2010	AGZ0113	TOCO	86.23	IVECO DAILY 4912 C.C1	FIAT
89	190004	3910	Semi-Reboque 2Eixos	2013	AGZ0115	TOCO	88.72	FACCHINI SRF CF	SR
88	190002	3920	Cavalo Toco	2013	AGZ0114	TOCO	88.72	M.BENZ L 1518	MERCEDES BENZ
438	10121	4000	Cavalo Toco	2011	ATD0748	TOCO	32.45	IVECO / DAILY55C16	IVECO
360	140001	4010	\N	2019	ATD8971	BITREM	37.63	\N	\N
378	10176	4020	Cavalo Toco	2008	ATD5602	CARRETA	37.58	7110	GMC
374	10146	4030	Cavalo Toco	2003	ATD2714	CARRETA	37.03	FORD F 4000	FORD
527	180001	7665	Semi-Reboque 2Eixos	2020	BDW-7F35	TOCO	0	Volvo / FH 460 4x2T	Volvo
55	10121	180	Semi-Reboque 2Eixos	2010	BXI5745	TOCO	0	PASTRE SRGG	SR
471	10146	201	\N	0	JLI7454	TOCO	0	\N	\N
466	10146	202	Toco	\N	JOL4873	TOCO	\N	710	MERCEDES BENZ
469	10146	203	\N	\N	MTJ5163	TOCO	\N	\N	\N
472	10146	204	\N	\N	NYY2419	TOCO	\N	\N	\N
470	10146	205	Cavalo Toco	\N	OUR5615	TOCO	\N	LS 1935	MERCEDES BENZ
473	10146	206	\N	\N	PKJ1099	TOCO	\N	\N	\N
465	10146	207	Semi-Reboque 3Eixos	\N	OUI6385	TOCO	\N	SEMI REBOQUE RANDON	RANDON
464	10146	208	Cavalo Toco	\N	OVD9303	TOCO	\N	D20 CUSTOM	GM
467	10146	209	Toco	\N	IAJ9368	TOCO	\N	CARGO 1517 F	FORD
474	10146	210	\N	\N	KHQ7696	TOCO	\N	\N	\N
462	10146	211	\N	\N	JQH5463	TOCO	\N	\N	\N
463	10146	212	Cavalo Toco	\N	KRP5412	TOCO	\N	MB 710	MERCEDES BENZ
468	10146	213	Cavalo Toco	\N	JSD2J03	TOCO	\N	B2500 DX S CAB	MAZDA
499	10001	238	Cavalo Toco	\N	AJI7260	TOCO	\N	SCANIA L 111	SCANIA
345	10067	270	\N	2009	BTT5701	BITREM	58.52	\N	\N
63	10067	400	Semi-Reboque 2Eixos	2008	AEQ3754	TOCO	\N	NIJU NJSRFR 3E	SR
53	190005	420	\N	2011	AOH6666	TOCO	\N	\N	\N
62	10121	440	\N	2009	AET5327	TOCO	\N	\N	\N
18	10001	460	Semi-Reboque 2Eixos	2009	AFD5132	TRUCK	\N	RODOFORT SRR PL	SR
496	10001	466	\N	\N	ART0962	TOCO	\N	\N	\N
20	190005	470	Semi-Reboque 2Eixos	2003	AFN8349	TRUCK	\N	SEMI REBOQUE RANDON	RANDON
54	10001	480	Cavalo Toco	2010	AFX8521	TOCO	\N	LS 1935	MERCEDES BENZ
23	190005	510	Truck	2008	AGC2541	TRUCK	\N	L 1113	MERCEDES BENZ
22	190005	515	\N	2007	LWU8833	TOCO	\N	\N	\N
476	10265	525	\N	\N	BAB8850	RODOTREM	98.44	\N	\N
511	190003	530	Truck	\N	AAG5751	TOCO	60.08	M.BENZ L 2013	MERCEDES BENZ
26	190002	570	Semi-Reboque 2Eixos	2012	BXH9482	TOCO	\N	SEMI REBOQUE KRONE	KRONE
17	10001	620	Semi-Reboque 2Eixos	2008	AGM2932	TOCO	\N	RANDON	SR
58	10001	755	\N	2009	AHC7729	TOCO	\N	\N	\N
61	10121	760	\N	2009	JYR1428	TOCO	\N	\N	\N
60	10001	790	Toco 3/4	2010	KCV1932	TOCO	\N	8150	VW
19	190005	800	\N	2001	NBJ9482	TOCO	\N	\N	\N
145	190004	7530	Cavalo Toco	2016	BUS5682	TOCO	\N	L 1113	MERCEDES BENZ
146	190004	7535	Truck	2013	BUS5711	TOCO	\N	L 1118	MERCEDES BENZ
40	180001	7570	\N	2012	BCH2977	TOCO	\N	\N	\N
41	180001	7575	\N	2016	BCH2976	TRUCK	\N	\N	\N
448	10001	7585	Cavalo Toco	\N	BCI6779	ETIOS	\N	L 1620	MERCEDES BENZ
38	180001	7660	Cavalo Toco	2007	BCN8742	TOCO	\N	VOLVO	VOLVO
33	180001	7680	Cavalo Truck	1998	BCO5279	TRUCK	\N	VOLVO	VOLVO
47	180001	7685	Semi-Reboque 2Eixos	2016	BCO5280	TOCO	\N	SEMI REBOQUE RODOVIÁRIO	REBOQUE RODOVIÁRIO
44	180001	7690	\N	2017	BCO5277	TOCO	\N	\N	\N
42	180001	7700	Semi-Reboque 2Eixos	2017	BCO7190	TOCO	\N	SEMI REBOQUE RODOVIÁRIO	REBOQUE RODOVIÁRIO
48	180001	7715	Cavalo Toco	2008	BCO7189	TOCO	\N	L 1113	MERCEDES BENZ
43	180001	7720	Truck	2016	BCP9363	TOCO	\N	MERCEDES BENZ	MERCEDES BENZ
451	10001	7750	\N	\N	BCS9E03	ETIOS	\N	\N	\N
455	10001	7760	Semi-Reboque 3Eixos	\N	BCS9E05	ETIOS	\N	SEMI REBOQUE RODOVIÁRIO	REBOQUE RODOVIÁRIO
440	10265	7820	Cavalo Toco	2017	BCX0B32	TOCO	37.06	LS 1935	MERCEDES BENZ
475	10265	7825	Semi-Reboque 3Eixos	\N	BCW1I60	TOCO	37.06	SEMI REBOQUE RANDON	RANDON
439	10001	7830	Cavalo Toco	1996	BCX4B10	CARRETA	37.06	M.BENZ L 1113	MERCEDES BENZ
461	10146	7835	\N	\N	BCW1I58	TOCO	37.06	\N	\N
441	10265	7840	Cavalo Toco	2017	BCX4B15	TOCO	37.06	CARGO 1521	FORD
516	190005	7845	Toco	\N	DBM1D50	ONIBUS	\N	CARGO 1517 E	FORD
517	190005	7850	Toco	\N	DBM1C44	ONIBUS	\N	CARGO 1722 E	FORD
2	10067	7915	Cavalo Toco	1994	DBM1D52	CARRETA	\N	L 1218	MERCEDES BENZ
321	190004	8000	Cavalo Toco	2010	OUL4282	JULIETA	74.8	M.BENZ / LK 1218	MERCEDES BENZ
431	10146	8005	Cavalo Toco	2012	OUK8525	TOCO	35.32	M.BENZ 710	MERCEDES BENZ
312	190004	8010	Toco 3/4	2010	OUK6032	JULIETA	74.8	VW 8-150	VW
340	10146	8015	\N	2017	OUK8605	TOCO	74.8	\N	\N
324	190004	8020	Cavalo Toco	2011	OUK0433	JULIETA	74.8	M.BENZ 710	MERCEDES BENZ
306	190004	8025	Cavalo Toco	1997	OUK9922	RODOTREM	74.8	XSA BK EX2.0	CITROEN
335	10146	8030	\N	2010	OUK1468	TOCO	74.8	\N	\N
336	10146	8040	Cavalo Toco	2010	OUM0586	TOCO	78.46	SCANIA / T 113 H 4X2	SCANIA
337	10146	8045	Cavalo Toco	2011	OUM5422	TOCO	78.46	M.BENZ L 1113	MERCEDES BENZ
148	140001	8050	Cavalo Toco	2015	OUM7977	TOCO	87.11	L 1418 R	MERCEDES BENZ
144	10121	8055	\N	2014	OUM6334	TOCO	87.11	\N	\N
34	180001	8255	Cavalo Toco	2001	BDF4J82	TOCO	\N	L 1318	MERCEDES BENZ
35	180001	8275	Toco	1999	BDF4J84	TOCO	\N	L 1118	MERCEDES BENZ
39	180001	8280	\N	2009	BDF4J81	TOCO	\N	\N	\N
37	180001	8295	Toco 3/4	2004	BDF4J83	TOCO	\N	L 1113	MERCEDES BENZ
46	180001	8315	Semi-Reboque 2Eixos	2008	BDF4J80	TOCO	\N	RANDON	SR
481	180001	8435	\N	\N	BDG9A55	BITREM	\N	\N	\N
50	180001	8445	Cavalo Toco	2019	BDG9A56	TOCO	\N	F12000 L	FORD
480	180001	8470	Cavalo Toco	\N	BDG9A52	BITREM	\N	LS 1935	MERCEDES BENZ
479	180001	8475	\N	\N	BDG9A51	BITREM	\N	\N	\N
49	180001	8480	Cavalo Toco	2019	BDG9A50	TOCO	\N	VOLVO	VOLVO
518	180001	8510	CARRO	2020	DDO3J81	Chevrolet Spin	0	SPIN	CHEVROLET
519	180001	8525	Semi-Reboque 2Eixo	2020	BDV-5F98	TOCO	180	VOLVO FH 460 4X2 T	VOLVO
520	180001	8530	Semi-Reboque 2Eixo	2020	BDV-5F97	TOCO	0	VOLVO / FH 460 4X2T	Volvo
521	180001	8535	Semi-reboque 2Eixo	2020	BDV-5F36	TOCO	0	VOLVO / FH 460 4X2T	VOLVO
522	180001	8540	Semi-Reboque 2Eixos	2020	BDV-5F96	TOCO	0	Volvo / FH 460 4x2T	Volvo
523	180001	8545	Semi-Reboque 2Eixos	2020	BDV-5F38	TOCO	0	Volvo / FH 460 4x2T	Volvo
51	140001	805	Semi-Reboque 2Eixos	2009	KDL3292	TOCO	\N	FACCHINI SRF CF	SR
65	190005	810	Semi-Reboque 2Eixos	2006	AHS9704	TOCO	\N	SEMI REBOQUE 	SR
56	10121	820	\N	2010	AHV3957	TOCO	\N	\N	\N
59	10121	830	\N	2014	AIA5463	TOCO	\N	\N	\N
24	10121	850	\N	1987	AIA7368	TOCO	\N	\N	\N
501	10001	899	Automóvel	\N	AYT6267	TOCO	\N	24.250 CLC 6X2	VW
57	10121	900	Truck	2010	BTA9258	TOCO	\N	L 1113	MERCEDES BENZ
25	190002	920	\N	2010	CGR2682	TOCO	\N	\N	\N
212	10265	930	Semi-Reboque 2Eixos	2001	AIX8805	TOCO	74.46	SRF3ECL	LINSHALM
21	190005	940	\N	2008	AIY2379	TRUCK	\N	\N	\N
96	180001	970	Semi-Reboque 2Eixos	2010	AJG6204	TOCO	\N	SRF3ECL	LINSHALM
500	10001	1007	Semi-Reboque 2Eixos	\N	AVK0292	TOCO	\N	SEMI REBOQUE RANDON	RANDON
164	140001	1010	\N	2013	AJI4719	TOCO	73.86	\N	\N
192	140001	1030	Semi-Reboque 2Eixos	2017	AHN3351	TOCO	69.53	SRF3ECL	LINSHALM
189	140001	1070	\N	2018	AJS5294	TOCO	73.86	\N	\N
488	10001	1092	Toco	\N	EJX4850	TOCO	\N	8120	VW
497	10001	1109	\N	\N	AWV7065	TOCO	\N	\N	\N
247	10067	1110	\N	2010	AJT7581	TOCO	72.95	\N	\N
211	10265	1120	Cavalo Toco	2001	AJU1034	TOCO	67.16	1420	MERCEDES BENZ
169	140001	1130	\N	2016	AJU4771	TOCO	69.65	\N	\N
170	140001	1140	Semi-Reboque 2Eixos	2018	AJW1071	TOCO	66.02	SEMI REBOQUE GOYDO	GOYDO
69	10121	1150	Toco	2008	AAW7701	TOCO	\N	L 1313	MERCEDES BENZ
74	140001	1170	Cavalo Toco	2006	AJC9719	TOCO	\N	RANDON	SR
73	140001	1180	\N	2008	AJC8792	TOCO	\N	\N	\N
72	140001	1210	Cavalo Toco	2006	AKG2144	TOCO	\N	7.110 S	VW
502	10001	1213	Automóvel	\N	MBD1614	TOCO	\N	R124 LA6X2NA 420	SCANIA
95	10067	1215	Semi-Reboque 2Eixos	2010	AKG2145	TOCO	\N	SR/RODOVIA SR2E	REBOQUE RODOVIÁRIO
154	10121	1220	\N	2013	AKI6988	TOCO	62.69	\N	\N
498	10001	1257	Toco	\N	DQJ4711	TOCO	\N	CARGO 1517 E	FORD
177	140001	1285	Semi-Reboque 2Eixos	2011	AKP2741	TOCO	73.72	RANDON	SR
181	140001	1330	\N	2011	AKX7952	TOCO	73.98	\N	\N
187	140001	1340	\N	2018	AKX9332	TOCO	73.13	\N	\N
152	10121	1350	\N	2017	AKY2404	TOCO	72.8	\N	\N
52	190002	1405	Semi-Reboque 2Eixos	2009	BXF4340	TOCO	\N	SEMI REBOQUE KRONE	KRONE
71	140001	1410	Semi-Reboque 2Eixos	2008	ALH2052	TOCO	\N	NIJU NJSRFR 3E	SR
104	10121	1415	Cavalo Toco	2017	ALH2054	TOCO	0	1420	MERCEDES BENZ
64	180001	1420	Cavalo Toco	2005	ALH0523	TOCO	\N	CARGO 1215	FORD
256	190003	1440	\N	2017	CLH0477	TOCO	80.62	\N	\N
68	10121	1470	Cavalo Toco	2008	NCT1613	TOCO	\N	1420	MERCEDES BENZ
67	190005	1475	Toco 3/4	2008	NCT1713	TOCO	\N	CARGO 815	FORD
70	140001	1480	Reboque	2009	NCT1813	TOCO	\N	Reboque  Angola	ANGOLA
186	140001	1490	\N	2018	NCR3413	TOCO	73.39	\N	\N
240	10067	1500	\N	2011	NCR3515	TOCO	80.15	\N	\N
153	10121	1525	\N	2013	NCU3167	TOCO	72.1	\N	\N
232	10265	1535	Cavalo Toco	2006	NCU3177	TOCO	73.39	1215 C	MERCEDES BENZ
97	180001	1545	\N	2010	NCT1755	TOCO	\N	\N	\N
161	190004	1570	Semi-Reboque 2Eixos	2013	NCT1566	TOCO	85.02	FACCHINI SRF CF	SR
162	190004	1575	Cavalo Toco	2017	NCU2477	TOCO	80.85	1214 C	MERCEDES BENZ
159	190004	1580	Toco 3/4	2013	NCQ0976	TOCO	93.34	CARGO 1618	FORD
157	10121	1720	\N	2018	NCT2088	TOCO	67.16	\N	\N
214	10067	1855	\N	2008	NDF5580	TOCO	78.78	\N	\N
93	190005	1865	\N	2013	NCU7799	TOCO	85.02	\N	\N
90	190005	1870	Cavalo Toco	2013	NDF5570	TOCO	85.02	SCANIA	SCANIA
348	190003	1885	Cavalo Toco	2009	ABW0789	BITREM	80.06	FORD F 4000	FORD
91	190005	1995	\N	2013	NCQ0842	TOCO	85.02	\N	\N
231	10265	2005	Semi-Reboque 2Eixos	2001	NCO0882	TOCO	73.39	N10	VOLVO
119	190002	2020	Cavalo Toco	2013	NCQ0962	TOCO	81.8	M.BENZ L 1518	MERCEDES BENZ
160	190004	2025	\N	2017	NCQ0852	TOCO	85.02	\N	\N
216	10146	2030	Semi-Reboque 2Eixos	2008	NCQ0932	TOCO	73.39	SRF3ECL	LINSHALM
213	10001	2045	Semi-Reboque 2Eixos	2012	AAY6694	TOCO	73.39	SRF3ECL	LINSHALM
230	10146	2170	\N	2009	NCS0563	TOCO	73.32	\N	\N
206	190005	2180	Semi-Reboque 2Eixos	2000	NCS0543	TOCO	74.01	SRF3ECL	LINSHALM
66	190002	2220	Semi-Reboque 2Eixos	2008	AOC4359	TOCO	\N	SEMI REBOQUE 	SR
126	190002	2225	Semi-Reboque 2Eixos	2017	AOC4360	TOCO	\N	SRF3ECL	LINSHALM
175	140001	2260	Semi-Reboque 2Eixos	2012	AOL4465	CARRETA	71.65	RODOFORT SRR PL	SR
224	10146	2270	Cavalo Toco	2006	AOL4462	TOCO	71.65	ATEGO 1518	MERCEDES BENZ
182	140001	2280	\N	2011	AOL4467	TOCO	71.65	\N	\N
228	10146	2290	Cavalo Toco	2004	AOL4468	TOCO	72.1	L 1218 R	MERCEDES BENZ
217	10146	2300	Cavalo Toco	2006	AOL2105	TOCO	72.45	ATEGO 1518	MERCEDES BENZ
101	180001	2310	Cavalo Toco	2017	AON5139	TOCO	\N	1215 C	MERCEDES BENZ
103	180001	2315	Semi-Reboque 2Eixos	2017	AON5143	TOCO	\N	VM23 210 6X2R 20030718	VOLVO
239	10067	2320	\N	2008	NCJ8385	TOCO	92.04	\N	\N
27	180001	2360	Truck	2011	APG2054	TOCO	\N	L 1113	MERCEDES BENZ
102	180001	2365	Semi-Reboque 2Eixos	2011	APF2054	TOCO	\N	SRF3ECL	LINSHALM
87	190002	2370	\N	2013	APD2054	TOCO	\N	\N	\N
147	190004	2390	\N	2018	HRO1029	TOCO	\N	\N	\N
180	140001	2400	Cavalo Toco	2011	AOT5935	TOCO	72.52	LS 1935	MERCEDES BENZ
236	10067	2410	Cavalo Toco	2008	AOU2118	TOCO	74.1	R1100 RREGINO	BMW
250	10067	2420	\N	2015	AOU5680	TOCO	72.8	\N	\N
233	10265	2430	\N	2008	AOU2115	TOCO	73.51	\N	\N
156	10121	2440	Cavalo Toco	2013	AOU3266	TOCO	79.59	8.150E DELIVERY	VW
388	10265	2480	Cavalo Toco	2012	APO9699	RODOTREM	36.85	8100	VW
166	140001	2500	\N	2012	APS5203	TOCO	76.5	\N	\N
196	140001	2510	\N	2006	APW1934	ONIBUS	78	\N	\N
165	140001	2520	Cavalo Toco	2016	APX8950	TOCO	75.04	F12000 L	FORD
194	140001	2530	Cavalo Toco	2017	APU6320	TOCO	75.47	1420	MERCEDES BENZ
229	10146	2540	Semi-Reboque 2Eixos	2003	APZ1625	TOCO	77.19	NIJU NJSRFR 3E	SR
237	10067	2570	\N	2009	NEC4602	TOCO	85.44	\N	\N
249	10067	2580	\N	2017	NDT5692	TOCO	86.25	\N	\N
245	10067	2600	\N	2010	NDT8022	TOCO	75.04	\N	\N
202	190005	2620	Semi-Reboque 2Eixos	2001	NDT8132	CARRETA	75.04	SRF3ECL	LINSHALM
197	140001	2630	Cavalo Toco	2006	NDT9362	ONIBUS	72.08	ATEGO 1718	MERCEDES BENZ
172	140001	2640	\N	2017	NDU0332	TOCO	82.75	\N	\N
235	10067	2650	\N	2012	NEA0262	TOCO	75.04	\N	\N
183	140001	2660	\N	2011	NEA0252	TOCO	71.72	\N	\N
241	10067	2670	\N	2018	NEA0232	TOCO	78.26	\N	\N
244	10067	2680	\N	2010	NEA0192	TOCO	77.52	\N	\N
191	140001	2690	\N	2018	NEA0212	TOCO	76.5	\N	\N
238	10067	2700	Toco 3/4	2008	NEA0182	TOCO	87	VW 8-150	VW
243	10067	2710	\N	2006	NDU9273	TOCO	85.44	\N	\N
384	10176	4040	Cavalo Toco	2003	ATD2721	CARRETA	37.45	GM 600 / CUSTOM	CUSTOM
373	10146	4050	Cavalo Toco	2019	ATD4117	BITREM	37.45	VW 7.90 S	VW
380	10176	4060	\N	2013	ATD5630	CARRETA	37.51	\N	\N
363	140001	4070	Cavalo Toco	2018	ATD8970	BITREM	38.25	VW 6.80	VW
8	180001	4080	Semi-Reboque 2Eixos	2007	AAV7008	TOCO	\N	TANDEN GRAHL	TANDEN GRAHL
10	180001	4090	Semi-Reboque 2Eixos	2008	AAZ7005	TRUCK	\N	NOMA SR3E27 BF	SR
9	180001	4100	Semi-Reboque 2Eixos	2008	AAV7009	TOCO	\N	RANDON	SR
280	10146	4120	Truck	2011	AGZ0096	JULIETA	80.74	L 1214	MERCEDES BENZ
282	10146	4130	\N	2009	AGZ0159	TRUCK	84.48	\N	\N
279	10146	4140	Truck	2004	AGZ0119	JULIETA	82.12	1218	MERCEDES BENZ
478	10265	4165	\N	\N	AXJ2904	RODOTREM	75.2	\N	\N
281	10146	4190	Cavalo Toco	2004	AGZ0299	JULIETA	80.03	T112 H	SCANIA
200	190002	4200	Cavalo Toco	2003	AGZ0188	CARRETA	81.38	ATEGO 1518	MERCEDES BENZ
198	190002	4220	Cavalo Toco	1997	AGZ0305	CARRETA	81.38	ATEGO 1518	MERCEDES BENZ
201	190002	4230	Semi-Reboque 2Eixos	2002	AGZ0304	CARRETA	81.38	SRF3ECL	LINSHALM
278	10146	4240	Cavalo Toco	2004	AGZ0288	JULIETA	80.03	NL10 280 4X2	VOLVO
199	190002	4250	Cavalo Toco	2004	AGZ0199	CARRETA	81.38	ATEGO 1518	MERCEDES BENZ
210	10265	4300	Toco 3/4	2014	CKT5776	TOCO	69.87	8140	VW
370	10121	4345	Semi-Reboque 2Eixos	2018	ATW4394	BITREM	37.03	SEMI REBOQUE GOYDO	GOYDO
422	10146	4350	Cavalo Toco	2004	ATW6589	TOCO	37.42	FH12 380 4X2T	VOLVO
377	10176	4365	Cavalo Toco	2004	ATY5536	CARRETA	36.37	M.BENZ 608	MERCEDES BENZ
417	10146	4370	Cavalo Toco	2003	ATZ2095	TOCO	37.67	AGRALE	AGRALE
277	190004	4375	Cavalo Toco	2004	ATZ8141	CARRETA	85.96	R113 H 4X2 360	SCANIA
283	10146	4380	Cavalo Toco	2003	AUA1816	TRUCK	84.48	R113 H 4X2 360	SCANIA
139	10121	4425	Cavalo Toco	2011	AUB3551	TOCO	92.92	L 1114	MERCEDES BENZ
208	10121	4430	Semi-Reboque 2Eixos	2007	AUA8616	TOCO	86.09	SRF3ECL	LINSHALM
207	10121	4435	Cavalo Toco	2008	AUA8610	TOCO	84.48	1420	MERCEDES BENZ
254	190003	4440	\N	2017	AUA8524	TOCO	84.48	\N	\N
253	10115	4445	\N	2015	AUA8619	TOCO	84.48	\N	\N
265	190005	4450	Automóvel	2014	AUA8607	ONIBUS	83.69	NL10 280 4X2	VOLVO
257	190004	4455	\N	2000	AUA8522	TOCO	84.48	\N	\N
143	10121	4460	\N	2014	AUB3542	TOCO	90.87	\N	\N
141	10121	4465	Truck	2011	AUB3552	TOCO	89.33	MERCEDES BENZ	MERCEDES BENZ
136	10121	4470	Truck	2011	AUB3541	TOCO	90.9	L 1218 R	MERCEDES BENZ
362	140001	4480	Cavalo Toco	2019	NCI9905	BITREM	36.84	CARGO 2422 E	FORD
94	10121	4490	Cavalo Toco	2010	NCI9935	TOCO	36.84	SCANIA	SCANIA
394	10115	4495	Cavalo Toco	1996	NCI9945	CARRETA	36.84	FORD F 4000	FORD
364	190005	4500	Cavalo Toco	2018	NCI9915	BITREM	36.84	M.BENZ 710	MERCEDES BENZ
365	10067	4505	Semi-Reboque 2Eixos	2018	NDB1155	BITREM	36.84	SEMI REBOQUE RANDON	RANDON
368	10121	4510	Cavalo Toco	2018	NCO9945	BITREM	36.84	VW 6.90	VW
369	10121	4515	Cavalo Toco	2019	NCI9925	BITREM	36.84	VW 7.90	VW
258	190004	4525	\N	2017	NDB3665	TOCO	84.48	\N	\N
255	190003	4530	\N	2017	NDB3625	TOCO	84.48	\N	\N
252	140001	4535	\N	2015	NDB4395	TOCO	79.61	\N	\N
460	10121	4540	Cavalo Toco	\N	NDA8645	TOCO	79.61	LS 1935	MERCEDES BENZ
92	190005	4545	Semi-Reboque 2Eixos	2017	NCY4696	TOCO	88.92	NIJU NJSRFR 3E	SR
85	190002	4550	Semi-Reboque 2Eixos	2013	NDB3955	TOCO	88.92	40300	VW
116	190002	4560	Cavalo Toco	2013	NCW8B46	TOCO	88.92	715C	MERCEDES BENZ
121	190002	4565	Cavalo Toco	2013	NCW8206	TOCO	88.71	M.BENZ L 1518	MERCEDES BENZ
84	190002	4570	Semi-Reboque 2Eixos	2011	NCW6906	TOCO	88.71	SEMI REBOQUE RODOVIÁRIO	REBOQUE RODOVIÁRIO
114	190002	4575	\N	2012	NCW8226	TOCO	88.92	\N	\N
118	190002	4580	\N	2013	NCW6976	TOCO	88.92	\N	\N
115	190002	4585	Toco 3/4	2013	NCW8036	TOCO	88.92	N12	VOLVO
117	190002	4590	\N	2013	NCW6416	TOCO	88.92	\N	\N
120	190002	4595	\N	2014	NCW6696	TOCO	88.92	\N	\N
138	10121	4600	\N	2011	NCW7996	TOCO	89.33	\N	\N
405	140001	4635	Semi-Reboque 3Eixos	2013	LWH5409	CARRETA	31.49	SEMI REBOQUE RANDON	RANDON
99	180001	4645	Cavalo Toco	2017	AUK9987	TOCO	\N	1418 R	MERCEDES BENZ
294	190003	4665	\N	2012	AUZ3716	TOCO	84.48	\N	\N
290	190003	4670	\N	2012	AUZ3423	TOCO	79.83	\N	\N
293	190003	4675	\N	2012	AUZ5041	TOCO	84.48	\N	\N
275	190004	4680	Cavalo Toco	1996	AUZ5650	RODOTREM	83.66	LKS 140	SCANIA
292	190003	4685	\N	2011	AUZ5722	TOCO	84.48	\N	\N
274	190004	4690	Cavalo Toco	1995	AUZ8420	RODOTREM	85.06	\N	SCANIA
259	190005	4695	\N	2017	AUZ8418	TOCO	85.83	\N	\N
276	190004	4700	Cavalo Toco	1993	AUZ8422	CARRETA	85.83	T113 H 4X2 360	SCANIA
262	190005	4705	Cavalo Toco	2005	AVA3677	TOCO	84.11	FH12 380 4X2	VOLVO
291	190003	4710	\N	2012	AUZ8421	TOCO	84.48	\N	\N
209	10146	4740	Semi-Reboque 2Eixos	2012	IAO6299	TOCO	76.71	FACCHINI SRF CF	SR
442	190003	4745	Cavalo Toco	2012	AVJ7601	TOCO	\N	NL10 280 4X2	VOLVO
4	10121	4785	Cavalo Toco	2012	AWA4930	CARRETA	\N	SEMI REBOQUE GUERRA	GUERRA
6	10121	4790	Truck	2004	AWA4935	TRUCK	\N	L 1313	MERCEDES BENZ
5	10121	4795	\N	2013	AWA4718	CARRETA	\N	\N	\N
3	190002	4800	\N	2002	AWA4714	CARRETA	\N	\N	\N
7	10121	4805	Semi-Reboque 2Eixos	2008	AWB3239	TOCO	\N	GUERRA CHARGER GR	SR
358	10001	4820	Cavalo Toco	2019	AWC6648	BITREM	35.02	VW 7.90 S	VW
395	10067	4825	Semi-Reboque 2Eixos	1998	AWC1278	CARRETA	34.69	SEMI REBOQUE RANDON	RANDON
285	140001	7495	\N	2005	PRR7143	TOCO	85.15	\N	\N
176	140001	4830	Semi-Reboque 2Eixos	2012	AWB7320	CARRETA	74.25	RODOFORT SRR PL	SR
295	190004	4835	Truck	2011	AWD7621	TOCO	84.48	1418 R	MERCEDES BENZ
267	10121	4840	Automóvel	2010	AWB7318	TOCO	74.25	NL10 280 4X2	VOLVO
270	10121	4845	Toco	1995	AWC1346	RODOTREM	84.48	L 1114	MERCEDES BENZ
273	10265	4855	Cavalo Toco	1999	AWC9082	RODOTREM	84.63	T112 HS 4X2	SCANIA
171	140001	4860	Cavalo Toco	2013	AWC9135	TOCO	84.63	L 1418 E	MERCEDES BENZ
167	140001	4865	\N	2013	AWB8560	TOCO	84.48	\N	\N
393	10067	4870	Cavalo Toco	1995	AWC1282	CARRETA	34.69	VW 7.90	VW
272	10121	4910	Cavalo Toco	1995	AWD8410	RODOTREM	71.74	LK 111	SCANIA
264	190005	4915	Automóvel	2018	AWF5881	ONIBUS	76.73	FH12 380 4X2T	VOLVO
269	10121	4920	Automóvel	2007	AWF3249	ONIBUS	84.48	NL10 280 4X2	VOLVO
271	10121	4925	Cavalo Toco	1997	AWF3252	RODOTREM	85.31	R113 H 4X2 360	SCANIA
263	190005	4930	Automóvel	2015	AWF5880	TOCO	85.25	NL10 280 4X2	VOLVO
178	140001	4935	Semi-Reboque 2Eixos	2011	AWG1781	TOCO	78.46	RANDON	SR
268	10121	4940	Cavalo Toco	2006	AWG9462	ONIBUS	78.46	N10 XH	VOLVO
319	190004	4945	Cavalo Toco	2010	AWH4450	JULIETA	84	VW 7.100	VW
193	140001	4950	\N	2018	AWI3927	TOCO	84.2	\N	\N
261	190005	4955	Cavalo Toco	2015	AWI5199	TOCO	85.25	NL10 280 4X2	VOLVO
127	190002	4960	Semi-Reboque 2Eixos	2010	AWD3204	JULIETA	\N	SRF3ECL	LINSHALM
113	10265	4965	Semi-Reboque 2Eixos	2014	AWD7591	TOCO	\N	SRF3ECL	LINSHALM
131	190003	4970	Truck	2013	AWD7609	JULIETA	\N	FORD	FORD
112	10265	4975	Cavalo Toco	2013	AWE1760	TOCO	\N	LS 1634	MERCEDES BENZ
515	190005	4990	Cavalo Toco	\N	AWE1761	VOYAGE	\N	LS 1935	MERCEDES BENZ
450	10001	5025	Cavalo Toco	\N	AWE6135	VOYAGE	\N	LS 1935	MERCEDES BENZ
107	10067	5030	Cavalo Toco	2010	AWG8644	TOCO	\N	1420	MERCEDES BENZ
129	190003	5035	Semi-Reboque 2Eixos	2013	AWH6705	JULIETA	\N	SRF3ECL	LINSHALM
110	10265	5040	\N	2010	AWG8640	TOCO	\N	\N	\N
130	190003	5045	Cavalo Toco	2013	AWG8679	JULIETA	\N	M.BENZ L 1518	MERCEDES BENZ
260	190005	5050	Cavalo Toco	2017	AWJ8744	TOCO	85.25	XSA BK EX2.0	CITROEN
111	10265	5580	Semi-Reboque 2Eixos	2017	AWN1830	TOCO	\N	SEMI REBOQUE KRONE	KRONE
108	10067	5585	Cavalo Toco	2016	AWN4330	TOCO	\N	1420	MERCEDES BENZ
367	10121	5590	Cavalo Toco	2018	AWO3560	BITREM	35.42	8150	VW
123	190004	5595	Cavalo Toco	2001	OLF2163	TOCO	77.05	M.BENZ L 1518	MERCEDES BENZ
453	10001	6000	\N	\N	AWM5525	VOYAGE	\N	\N	\N
456	10001	6005	\N	\N	AWN1825	VOYAGE	\N	\N	\N
482	190001	6035	\N	\N	AWN1828	VOYAGE	\N	\N	\N
424	10146	6080	Cavalo Toco	2011	OLF8027	TOCO	36.09	NL10 280 4X2	VOLVO
128	190002	6085	Semi-Reboque 2Eixos	2009	OLF5495	JULIETA	\N	SRF3ECL	LINSHALM
459	10067	6190	\N	\N	OUK8345	VOYAGE	\N	\N	\N
508	10001	6195	\N	\N	NCE0H17	VOYAGE	\N	\N	\N
447	10001	6200	Cavalo Toco	\N	OBR5359	HILUX	\N	LS 1634	MERCEDES BENZ
307	190004	6245	Cavalo Toco	1995	OVB8860	RODOTREM	82.5	XSA BK EX2.0	CITROEN
314	190004	6250	Cavalo Toco	2008	OVB5284	JULIETA	82.5	M.BENZ L 1513	MERCEDES BENZ
304	190004	6255	\N	2011	OVB2741	TOCO	82.84	\N	\N
428	10146	6260	Cavalo Toco	2012	OVB7540	TOCO	29.78	FH12 380 4X2T	VOLVO
320	190004	6265	Truck	2007	OVB5978	CARRETA	82.5	L 1218	MERCEDES BENZ
311	190004	6270	\N	2009	OVB2617	JULIETA	82.5	\N	\N
100	180001	6275	Reboque	2017	OUY9951	TOCO	\N	Reboque  Angola	ANGOLA
109	10121	6280	Cavalo Toco	2013	OUY6854	TOCO	\N	1420	MERCEDES BENZ
433	10146	6290	Cavalo Toco	2018	OVA1273	TOCO	29.78	VW 7.90 S	VW
434	10146	6295	Truck	2018	OVB5906	TOCO	29.78	M.BENZ/ATEGO 2425	MERCEDES BENZ
449	10001	6300	Cavalo Toco	\N	AXV3296	SIENA	\N	VW 6.90	VW
435	10146	6325	Semi-Reboque 2Eixos	2013	OVB4961	TOCO	29.78	SEMI REBOQUE GRAHL	GRAHL
299	190004	6330	\N	2017	OVB7350	TOCO	82.5	\N	\N
510	190002	6335	Cavalo Toco	\N	AXY3202	VOYAGE	\N	LS 1935	MERCEDES BENZ
436	10146	6350	Cavalo Toco	2011	OVC1657	TOCO	29.78	712	MERCEDES BENZ
429	10146	6355	Automóvel	2012	OVC2786	TOCO	29.78	FH12 380 4X2	VOLVO
427	190004	6360	\N	2012	OVC2581	TOCO	29.78	\N	\N
507	10001	6365	Toco	\N	AYB3788	VOYAGE	\N	CARGO 1215	FORD
82	10146	6370	Semi-Reboque 2Eixos	2010	OZE9396	TOCO	\N	NIJU NJSRFR 3E	SR
512	190003	6385	Toco	\N	AYE0619	VOYAGE	\N	CARGO1717 E	FORD
454	10001	6390	\N	\N	AYE0621	VOYAGE	\N	\N	\N
266	10121	6430	Automóvel	2016	AYK5642	VAN	81.75	NL10 280 4X2	VOLVO
302	190004	6435	Cavalo Toco	2017	AYK5627	TOCO	82.5	R1100 RREGINO	BMW
168	140001	6455	Cavalo Toco	2013	AYR9572	TOCO	82.5	VM23 240 6X2R ATU	VOLVO
383	10176	6465	Cavalo Toco	2007	AYY6578	CARRETA	34.4	VW 7.110	VW
303	190004	6470	Cavalo Toco	2017	AYZ4107	TOCO	86.2	XSA BK EX2.0	CITROEN
296	190004	6475	Semi-Reboque 2Eixos	2017	AYZ5647	TOCO	86.2	SEMI REBOQUE RODOVIÁRIO	REBOQUE RODOVIÁRIO
327	190005	6480	Cavalo Toco	2004	AYZ4108	JULIETA	86.2	LS 1630	MERCEDES BENZ
297	190004	6485	\N	2017	AYZ8643	TOCO	86.2	\N	\N
132	180001	6490	\N	2004	AYY7260	TOCO	\N	\N	\N
398	140001	6515	Cavalo Toco	1998	AZO8477	CARRETA	34.4	MB 710	MERCEDES BENZ
411	140001	6520	Cavalo Toco	2004	AZO8479	TRUCK	34.4	M.BENZ 710	MERCEDES BENZ
400	140001	6540	Cavalo Toco	1997	AZU5059	CARRETA	33.07	LS 1935	MERCEDES BENZ
506	10001	6550	Automóvel	\N	AZU9715	VOYAGE	\N	M.BENZ/ATEGO 2425	MERCEDES BENZ
301	190004	6560	Cavalo Toco	2017	AZY2902	TOCO	86.2	XSA BK EX2.0	CITROEN
409	140001	6570	\N	2011	AZY5791	TRUCK	34.07	\N	\N
401	140001	6580	Cavalo Toco	1994	AZY5793	CARRETA	34.07	NL10 280 4X2	VOLVO
150	10121	6605	Semi-Reboque 2Eixos	2014	BAE8370	TOCO	85.5	FACCHINI SRF CF	SR
318	190004	6665	Cavalo Toco	2011	PQX0454	JULIETA	88.51	FORD CARGO 815 E	FORD
298	190004	6670	\N	2014	PQX0514	TOCO	88.51	\N	\N
308	190004	6675	Cavalo Toco	1995	PQX0794	CARRETA	88.51	XSA BK EX2.0	CITROEN
322	190004	6680	Cavalo Toco	2011	PQX0724	JULIETA	88.51	M.BENZ OF 1113	MERCEDES BENZ
509	10001	6685	\N	\N	BAQ4021	MONTANA	\N	\N	\N
443	10001	6690	\N	2019	BAT4371	TOCO	\N	\N	\N
339	10146	7005	Cavalo Toco	2017	OUG5253	TOCO	78.46	VW 7.90 S	VW
316	190004	7015	Cavalo Toco	2010	OUG7788	JULIETA	78.46	M.BENZ 710	MERCEDES BENZ
343	10146	7025	Cavalo Toco	2010	OUG0085	BITREM	78.46	F4000	FORD
124	190004	7035	Cavalo Toco	2004	OUG3320	TOCO	78.46	M.BENZ L 1518	MERCEDES BENZ
125	190004	7055	Semi-Reboque 2Eixos	2011	OUJ6448	TOCO	78.46	PASTRE SRGG	SR
317	190004	7070	Cavalo Toco	2011	OUK4212	JULIETA	74.8	VW 8-150	VW
338	10146	7075	Cavalo Toco	2018	OUK2422	TOCO	74.8	MERCEDES BENZ	MERCEDES BENZ
437	10146	7080	Cavalo Toco	2011	OUJ5418	TOCO	35.32	D20	GM
432	10146	7085	Cavalo Toco	2012	OUJ1654	TOCO	35.32	MB 710	MERCEDES BENZ
309	190004	7090	Cavalo Toco	2006	OUK2120	CARRETA	74.8	XSA BK EX2.0	CITROEN
341	10146	7095	Cavalo Toco	2010	OUL7376	BITREM	74.8	AXOR 1933	MERCEDES BENZ
122	190004	7105	\N	2008	JSY3677	TRUCK	78.08	\N	\N
425	10146	7110	Semi-Reboque 3Eixos	2011	NYS4456	TOCO	33.72	SEMI REBOQUE RODOVIÁRIO	REBOQUE RODOVIÁRIO
430	10146	7115	Cavalo Toco	2012	OKN7515	TOCO	38.05	LS 1935	MERCEDES BENZ
423	10146	7130	Cavalo Toco	2008	BBJ3905	TOCO	34.07	FH12 380 4X2T	VOLVO
386	10265	7135	Cavalo Toco	2008	BBI3135	CARRETA	34.07	M.BENZ  1710	MERCEDES BENZ
75	190002	7140	Cavalo Toco	2009	BBI4181	TOCO	86.25	710	MERCEDES BENZ
28	180001	7145	Truck	2012	BBH4430	TOCO	\N	L 1118	MERCEDES BENZ
390	10265	7150	\N	2012	BBI9759	RODOTREM	34.07	\N	\N
284	10265	7155	\N	2008	BBJ3916	TOCO	86.25	\N	\N
29	180001	7160	Semi-Reboque 2Eixos	2012	BBH5572	CARRETA	\N	SEMI REBOQUE RODOVIARIO 3 EIXOS	REBOQUE RODOVIÁRIO
344	10265	7165	Cavalo Toco	2009	BBI9838	BITREM	88.51	.BENZ313CDI SPRINTERF	MERCEDES BENZ
504	10001	7170	Automóvel	\N	BBH8857	VOYAGE	\N	M.BENZ L 1218	MERCEDES BENZ
452	10001	7175	\N	\N	BBH8859	VOYAGE	\N	\N	\N
505	10001	7180	Automóvel	\N	BBH8858	VOYAGE	\N	M.BENZ L 1313	MERCEDES BENZ
332	190005	7185	Cavalo Toco	2013	BBJ6138	CARRETA	88.51	SCANIA / R 124 GB 4X2 NZ 360	SCANIA
288	190002	7190	\N	2006	BBJ4808	TOCO	88.51	\N	\N
357	190003	7195	Cavalo Toco	2019	BBK1069	BITREM	88.51	VW 8-150	VW
342	10146	7200	Cavalo Toco	2010	BBK1065	BITREM	88.51	VW/8.120	VW
355	190003	7205	\N	2008	BBJ8583	RODOTREM	88.51	\N	\N
325	190005	7210	\N	2011	BBJ9943	JULIETA	88.51	\N	\N
353	190003	7215	Cavalo Toco	2008	BBK5705	RODOTREM	88.51	IVECO / DAILY 3510	IVECO
513	190003	7220	Cavalo Toco	\N	PKM4632	SAVEIRO	\N	FORD/CARGO 1722 E	FORD
305	190004	7240	Automóvel	2012	BBK8161	BITREM	88.51	SANTANA GL 2000	VW
313	190004	7245	\N	2009	BBK7415	JULIETA	88.51	\N	\N
315	190004	7255	\N	2010	BBL2645	JULIETA	88.51	\N	\N
326	190005	7265	Cavalo Toco	2011	BBL6637	JULIETA	88.51	SCANIA	SCANIA
289	190002	7270	\N	2011	BBL8231	TOCO	88.51	\N	\N
346	10001	7275	Cavalo Toco	2010	BBM8419	BITREM	88.51	F4000	FORD
329	190005	7280	Cavalo Toco	2011	BBN2931	JULIETA	88.51	M.BENZ LS1630	MERCEDES BENZ
328	190005	7290	Cavalo Toco	2011	BBM1326	JULIETA	88.51	AX0R 1933 S	MERCEDES BENZ
347	190002	7295	Cavalo Toco	2010	BBM8429	BITREM	88.51	FORD F 4000	FORD
330	190005	7300	\N	2006	BBM9414	CARRETA	88.51	\N	\N
331	190005	7305	Cavalo Toco	2012	BBN4853	CARRETA	88.51	IVECO/FIAT/190	IVECO
387	10265	7310	Cavalo Toco	2014	BBQ1094	CARRETA	36.3	8140	VW
419	10146	7315	Cavalo Toco	2002	BBQ6210	TOCO	36.3	VOLVO	VOLVO
426	10146	7320	Cavalo Toco	2014	BBQ6209	TOCO	36.3	FH12 380 4X2T	VOLVO
413	10146	7325	Cavalo Toco	2002	BBQ6205	TRUCK	36.3	NL10 280 4X2	VOLVO
414	10146	7330	Cavalo Toco	2011	BBQ6208	TRUCK	36.3	SCANIA	SCANIA
402	140001	7335	Cavalo Toco	2004	PRR0194	CARRETA	36.3	FH12 380 4X2T	VOLVO
408	140001	7340	Cavalo Toco	2008	PRR0204	TRUCK	36.3	18.310 TITAN	VW
407	140001	7345	Cavalo Toco	2011	PRR0264	TRUCK	36.3	M.BENZ L 1113	MERCEDES BENZ
404	140001	7350	Cavalo Toco	2011	PRR0214	TOCO	36.3	NL10 280 4X2	VOLVO
399	140001	7355	Cavalo Toco	1997	PRI2455	CARRETA	36.3	VW 7.90 S	VW
415	10146	7360	Semi-Reboque 3Eixos	2013	PRI1776	TRUCK	36.3	SEMI REBOQUE RODOVIÁRIO	REBOQUE RODOVIÁRIO
412	190004	7365	Cavalo Toco	2011	PRH9056	TRUCK	36.3	NL10 280 4X2	VOLVO
397	140001	7370	Cavalo Toco	1997	PRI1687	CARRETA	36.3	ATEGO 1728 S	MERCEDES BENZ
421	10146	7375	Cavalo Toco	2007	PRH9066	TOCO	36.3	VW/24-250 CNC 6X2	VW
406	140001	7380	Cavalo Toco	2010	PRI1677	TRUCK	36.3	VW/8.120	VW
416	10146	7385	Cavalo Toco	2015	PRI3017	TRUCK	36.3	M.BENZ 710	MERCEDES BENZ
418	10146	7390	Cavalo Toco	2004	PRI3037	TOCO	36.3	M.BENZ 710	MERCEDES BENZ
403	140001	7395	Cavalo Toco	2001	PRI1667	CARRETA	36.3	NL10 280 4X2	VOLVO
420	10146	7400	Cavalo Toco	2004	PRI3027	TOCO	36.3	LS 1935	MERCEDES BENZ
366	10115	7405	Cavalo Toco	2018	PRI2997	BITREM	36.3	F4000	FORD
45	180001	7415	Semi-Reboque 2Eixos	2007	BBW7840	TOCO	\N	SEMI REBOQUE KRONE	KRONE
458	10001	7425	\N	\N	BBX0953	ETIOS	\N	\N	\N
457	10001	7435	\N	\N	BBX0957	ETIOS	\N	\N	\N
446	10001	7440	Cavalo Toco	\N	BBX0949	ETIOS	\N	MB 710	MERCEDES BENZ
81	10146	7450	Semi-Reboque 2Eixos	2010	PRR6122	TOCO	\N	SEMI REBOQUE RODOVIÁRIO	REBOQUE RODOVIÁRIO
354	190003	7455	Cavalo Toco	2008	PRY3952	RODOTREM	85.15	IVECO/FIAT/DAILY 3510 C C	IVECO
310	190004	7460	\N	2017	PRR7053	JULIETA	85.15	\N	\N
356	190003	7465	Cavalo Toco	2018	PRV9972	BITREM	88.66	8.150E DELIVERY	VW
286	140001	7470	Cavalo Toco	2008	PRY3922	TOCO	85.15	L 1620	MERCEDES BENZ
334	10121	7475	Cavalo Toco	2010	PRU1413	TOCO	85.15	CARGO 4532 E	FORD
333	10121	7480	Cavalo Toco	2010	PRY4022	TOCO	85.15	VW 7.110 S	VW
352	190003	7485	Cavalo Toco	2017	PRY4102	BITREM	85.15	6,9	VW
287	10115	7490	\N	2006	PRW4493	TOCO	85.15	\N	\N
349	190003	7500	Cavalo Toco	2009	PRU1353	BITREM	85.15	6,9	VW
300	190004	7505	\N	2017	PRR7103	TOCO	85.15	\N	\N
323	190004	7510	Cavalo Toco	2011	PRR7163	JULIETA	85.15	VW 18310	VW
351	190003	7515	\N	2017	PRW4413	BITREM	85.15	\N	\N
350	190003	7520	Truck	2007	PRU1383	RODOTREM	85.15	L 1218	MERCEDES BENZ
524	180001	8550	Semi-Reboque 2Eixos	2020	BDV-5F37	TOCO	0	Volvo / FH 460 4x2T	Volvo
525	180001	8555	Semi-Reboque 2Eixos	2020	BDV-5F93	TOCO	0	Volvo / FH 460 4x2T	Volvo
526	180001	8560	Semi-Reboque 2Eixos	2020	BDW-0E28	TOCO	0	Volvo / FH 460 4x2T	Volvo
528	180001	8570	Semi-Reboque 2Eixos	2020	BDW-7F29	TOCO	0	Volvo / FH 460 4x2T	Volvo
529	180001	8575	Semi-Reboque 2Eixos	2020	BDW-7F36	TOCO	0	Volvo / FH 460 4x2T	Volvo
530	180001	8585	Semi-Reboque 2Eixos	2020	BDW-7F32	TOCO	0	Volvo / FH 460 4x2T	Volvo
490	10001	11284	\N	\N	ATO2402	TOCO	\N	\N	\N
483	10001	11293	\N	\N	BBQ1815	TOCO	\N	\N	\N
494	10001	11296	Cavalo Toco	\N	BWK4382	TOCO	\N	L 2013	MERCEDES BENZ
491	10001	11338	Cavalo Toco	\N	AKM3779	TOCO	\N	CARGO 1113	FORD
484	10001	11342	\N	\N	AWL7809	TOCO	\N	\N	\N
487	10001	11354	\N	\N	EPC7173	TOCO	\N	\N	\N
493	10001	11358	\N	\N	ATP0589	TOCO	\N	\N	\N
485	10001	11363	Semi-Reboque 2Eixos	\N	MMI8160	TOCO	\N	SEMI REBOQUE FACHINI	FACCHINI
489	10001	11364	\N	\N	HIG4411	TOCO	\N	\N	\N
503	10001	11368	Automóvel	\N	FEA7A56	TOCO	\N	FORD/CARGO 4331	FORD
486	10001	11376	\N	\N	AVQ2E56	TOCO	\N	\N	\N
477	10265	11383	\N	\N	AXJ2999	RODOTREM	\N	\N	\N
492	10001	11384	\N	\N	AQT0D60	TOCO	\N	\N	\N
495	10001	13386	Semi-Reboque 2Eixos	\N	ACD5004	TOCO	\N	SEMI REBOQUE GUERRA 3 EIXOS	GUERRA
\.


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 205
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: cliente; Owner: postgres
--

SELECT pg_catalog.setval('cliente.cliente_idcliente_seq', 6, true);


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 208
-- Name: abastecimento_idabastecimento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.abastecimento_idabastecimento_seq', 1, false);


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 210
-- Name: chat_idchat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_idchat_seq', 103, true);


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 225
-- Name: colaborador_idcolaborador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colaborador_idcolaborador_seq', 5, true);


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 227
-- Name: ferias_idferias_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ferias_idferias_seq', 118, true);


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 214
-- Name: multa_idmulta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multa_idmulta_seq', 6639, true);


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 216
-- Name: ocorrencia_idocorrencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ocorrencia_idocorrencia_seq', 1, false);


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 218
-- Name: situacaousuario_idsituacaousuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.situacaousuario_idsituacaousuario_seq', 1, false);


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 220
-- Name: tipoocorrencia_idtipoocorrencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipoocorrencia_idtipoocorrencia_seq', 1, false);


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 222
-- Name: usuario_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_idusuario_seq', 3126, true);


--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 224
-- Name: veiculo_idveiculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veiculo_idveiculo_seq', 1580, true);


--
-- TOC entry 2873 (class 2606 OID 32848)
-- Name: abastecimento abastecimento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abastecimento
    ADD CONSTRAINT abastecimento_pk PRIMARY KEY (idabastecimento);


--
-- TOC entry 2875 (class 2606 OID 32850)
-- Name: chat chat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pk PRIMARY KEY (idchat);


--
-- TOC entry 2907 (class 2606 OID 32945)
-- Name: colaborador colaborador_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_cpf_key UNIQUE (cpf);


--
-- TOC entry 2909 (class 2606 OID 32943)
-- Name: colaborador colaborador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_pkey PRIMARY KEY (idcolaborador);


--
-- TOC entry 2911 (class 2606 OID 32982)
-- Name: ferias ferias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ferias
    ADD CONSTRAINT ferias_pkey PRIMARY KEY (idferias);


--
-- TOC entry 2877 (class 2606 OID 32852)
-- Name: filial filial_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filial
    ADD CONSTRAINT filial_pk PRIMARY KEY (idfilial);


--
-- TOC entry 2879 (class 2606 OID 32854)
-- Name: multa multa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multa
    ADD CONSTRAINT multa_pk PRIMARY KEY (idmulta);


--
-- TOC entry 2881 (class 2606 OID 32856)
-- Name: ocorrencia ocorrencia_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_pk PRIMARY KEY (idocorrencia);


--
-- TOC entry 2883 (class 2606 OID 32858)
-- Name: situacaousuario situacaousuario_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.situacaousuario
    ADD CONSTRAINT situacaousuario_descricao_key UNIQUE (descricao);


--
-- TOC entry 2885 (class 2606 OID 32860)
-- Name: situacaousuario situacaousuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.situacaousuario
    ADD CONSTRAINT situacaousuario_pk PRIMARY KEY (idsituacaousuario);


--
-- TOC entry 2887 (class 2606 OID 32862)
-- Name: tipoocorrencia tipoocorrencia_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoocorrencia
    ADD CONSTRAINT tipoocorrencia_descricao_key UNIQUE (descricao);


--
-- TOC entry 2889 (class 2606 OID 32864)
-- Name: tipoocorrencia tipoocorrencia_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoocorrencia
    ADD CONSTRAINT tipoocorrencia_nome_key UNIQUE (nome);


--
-- TOC entry 2891 (class 2606 OID 32866)
-- Name: tipoocorrencia tipoocorrencia_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoocorrencia
    ADD CONSTRAINT tipoocorrencia_pk PRIMARY KEY (idtipoocorrencia);


--
-- TOC entry 2893 (class 2606 OID 32868)
-- Name: usuario usuario_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_cpf_key UNIQUE (cpf);


--
-- TOC entry 2895 (class 2606 OID 32870)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 2897 (class 2606 OID 32872)
-- Name: usuario usuario_foto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_foto_key UNIQUE (foto);


--
-- TOC entry 2899 (class 2606 OID 32874)
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (idusuario);


--
-- TOC entry 2901 (class 2606 OID 32876)
-- Name: veiculo veiculo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_pk PRIMARY KEY (idveiculo);


--
-- TOC entry 2903 (class 2606 OID 32878)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 2905 (class 2606 OID 32880)
-- Name: veiculo veiculo_prefixo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_prefixo_key UNIQUE (prefixo);


--
-- TOC entry 2919 (class 2606 OID 32947)
-- Name: colaborador colaborador_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_fk FOREIGN KEY (idfilial) REFERENCES public.filial(idfilial);


--
-- TOC entry 2920 (class 2606 OID 32952)
-- Name: colaborador colaborador_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_fk1 FOREIGN KEY (idsituacaousuario) REFERENCES public.situacaousuario(idsituacaousuario);


--
-- TOC entry 2921 (class 2606 OID 32983)
-- Name: ferias ferias_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ferias
    ADD CONSTRAINT ferias_fk FOREIGN KEY (idcolaborador) REFERENCES public.colaborador(idcolaborador);


--
-- TOC entry 2912 (class 2606 OID 32881)
-- Name: localizacao localizacao_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localizacao
    ADD CONSTRAINT localizacao_fk0 FOREIGN KEY (idveiculo) REFERENCES public.veiculo(idveiculo);


--
-- TOC entry 2913 (class 2606 OID 32886)
-- Name: ocorrencia ocorrencia_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_fk0 FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2914 (class 2606 OID 32891)
-- Name: ocorrencia ocorrencia_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_fk1 FOREIGN KEY (idusuarioinclusao) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2915 (class 2606 OID 32896)
-- Name: ocorrencia ocorrencia_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_fk2 FOREIGN KEY (idtipoocorrencia) REFERENCES public.tipoocorrencia(idtipoocorrencia);


--
-- TOC entry 2916 (class 2606 OID 32901)
-- Name: usuario usuario_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_fk0 FOREIGN KEY (idsituacaousuario) REFERENCES public.situacaousuario(idsituacaousuario);


--
-- TOC entry 2917 (class 2606 OID 32906)
-- Name: usuario usuario_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_fk1 FOREIGN KEY (idfilial) REFERENCES public.filial(idfilial);


--
-- TOC entry 2918 (class 2606 OID 32911)
-- Name: veiculo veiculo_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_fk0 FOREIGN KEY (idfilial) REFERENCES public.filial(idfilial);


-- Completed on 2020-04-29 17:52:52

--
-- PostgreSQL database dump complete
--

