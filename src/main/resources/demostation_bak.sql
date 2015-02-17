--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.1
-- Started on 2015-02-10 14:45:04 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 176 (class 3079 OID 12018)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 176
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 72639)
-- Name: battery; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE battery (
    battery_id bigint NOT NULL,
    current double precision,
    cycle_count bigint,
    soc double precision,
    temperature double precision,
    voltage double precision
);


ALTER TABLE public.battery OWNER TO bikeman;

--
-- TOC entry 175 (class 1259 OID 72701)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: bikeman
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO bikeman;

--
-- TOC entry 171 (class 1259 OID 72644)
-- Name: pedelec; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE pedelec (
    pedelec_manufacturer_id character varying(255) NOT NULL,
    charging_state character varying(255),
    max_battery_level double precision,
    max_current_value double precision,
    meter_value double precision,
    owner character varying(255),
    pedelec_error_code character varying(255),
    pedelec_error_info character varying(255),
    pedelec_state character varying(255),
    battery_batteryid bigint,
    slot_slotmanufacturerid character varying(255)
);


ALTER TABLE public.pedelec OWNER TO bikeman;

--
-- TOC entry 172 (class 1259 OID 72652)
-- Name: slot; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE slot (
    slot_manufacturer_id character varying(255) NOT NULL,
    slot_error_code character varying(255),
    slot_error_info character varying(255),
    slot_position integer,
    slot_state character varying(255),
    station_stationmanufacturerid character varying(255)
);


ALTER TABLE public.slot OWNER TO bikeman;

--
-- TOC entry 173 (class 1259 OID 72660)
-- Name: station; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE station (
    station_manufacturer_id character varying(255) NOT NULL,
    charging_status_inform_interval integer,
    cmsuri character varying(255),
    firmware_version character varying(255),
    heartbeat_interval integer,
    open_slot_timeout integer,
    reboot_retries integer,
    station_error_code character varying(255),
    station_error_info character varying(255),
    station_state character varying(255)
);


ALTER TABLE public.station OWNER TO bikeman;

--
-- TOC entry 174 (class 1259 OID 72668)
-- Name: station_slots; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE station_slots (
    station_stationmanufacturerid character varying(255) NOT NULL,
    slots_slotmanufacturerid character varying(255) NOT NULL
);


ALTER TABLE public.station_slots OWNER TO bikeman;

--
-- TOC entry 2231 (class 0 OID 72639)
-- Dependencies: 170
-- Data for Name: battery; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY battery (battery_id, current, cycle_count, soc, temperature, voltage) FROM stdin;
1	1	118	0.387684561515405091	18.6209573646337851	12
2	1	143	0.291968549941884925	24.7819535250398886	12
3	1	154	0.927859891072026932	20.3951164134745078	12
4	1	168	0.498980774398225413	24.0680520405354095	12
5	1	97	0.70486989754788032	24.1983530668785356	12
6	1	1	0.657940848082246288	16.1097655408685299	12
7	1	56	0.714412526147676585	17.1334069233896287	12
8	1	4	0.557560540245456981	18.2348293124172045	12
9	1	127	0.236404567614362127	22.3133372685449984	12
10	1	122	0.0513798291267942853	23.5039614500679477	12
11	1	83	0.753531362460816312	17.9492258581261375	12
12	1	139	0.162884965151142369	17.9320064472415339	12
13	1	47	0.170606258776390018	23.6315296591099511	12
14	1	57	0.323611028198303674	21.1563976949854471	12
15	1	130	0.928226826845240272	23.4114768235595463	12
16	1	164	0.884590921518824125	15.9353152266853915	12
17	1	74	0.330961073950085338	17.7910441837245443	12
18	1	141	0.304112756449796851	23.4155263411937185	12
19	1	84	0.734497315106499515	23.9679093209720513	12
20	1	123	0.166578363077750313	19.5991811394135098	12
21	1	54	0.209522351247569349	16.2515985309924496	12
22	1	127	0.982844643768791881	22.6138507030513338	12
23	1	11	0.220902469704162607	20.4536618256465026	12
24	1	199	0.97329249523813921	20.2519723724746683	12
25	1	109	0.794664993066012904	16.668520336210694	12
26	1	71	0.570424826423580389	23.0319787025919034	12
27	1	154	0.636626792193489166	16.1331532128907398	12
28	1	193	0.192588706967847467	23.0038350771423623	12
29	1	9	0.507198244625893913	21.5062746756878767	12
30	1	51	0.681221731514477624	19.4704039428298827	12
31	1	20	0.218788229515090249	15.2123330849063105	12
32	1	162	0.0693812156386344192	17.4380517658961409	12
33	1	41	0.0389260314462926971	16.9240113270146821	12
34	1	5	0.313947647178678735	19.1024936408020629	12
35	1	85	0.916278834729170488	22.2278203189805978	12
36	1	150	0.643451762508821523	22.5408561949844852	12
37	1	189	0.27294881720268227	16.7241650101311876	12
38	1	199	0.83145556554286737	18.7570951536233395	12
39	1	177	0.248296556372981314	23.9805566391177507	12
40	1	54	0.897134744807441376	19.8099907604472563	12
41	1	58	0.864524929939631814	15.3494662922998906	12
42	1	197	0.845803548013555284	24.0796363615518771	12
43	1	149	0.860886332926406594	21.8989211030008235	12
44	1	163	0.153354964210624001	19.3530906747919147	12
45	1	85	0.591550668210217845	15.8705630207035355	12
46	1	3	0.479617218927441136	24.8284309800058942	12
47	1	113	0.33269780724301834	22.5957607327925203	12
48	1	41	0.316457477715093582	16.3154353783274182	12
49	1	188	0.409103394464403025	21.6555872699265848	12
50	1	51	0.409752185994710083	20.5951015713290566	12
51	1	121	0.554332056453168631	15.4733529573564592	12
52	1	176	0.0298728803602832382	20.8223257571386249	12
53	1	65	0.908303484417060547	22.1631967701445767	12
54	1	132	0.57987308939980664	17.1650119616642698	12
55	1	73	0.161496579832541731	17.038166394041756	12
56	1	111	0.848878579961704571	23.1493539167515614	12
57	1	81	0.900838182239809271	24.70462467629266	12
58	1	93	0.907815536987158778	22.8500461041962026	12
59	1	165	0.152884417249887994	21.1325954037454729	12
60	1	98	0.78553233645471543	20.1236209270718334	12
61	1	110	0.382045377203070524	22.0200927048634369	12
62	1	110	0.972880566059922569	19.7017193005912361	12
\.


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 175
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: bikeman
--

SELECT pg_catalog.setval('hibernate_sequence', 62, true);


--
-- TOC entry 2232 (class 0 OID 72644)
-- Dependencies: 171
-- Data for Name: pedelec; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY pedelec (pedelec_manufacturer_id, charging_state, max_battery_level, max_current_value, meter_value, owner, pedelec_error_code, pedelec_error_info, pedelec_state, battery_batteryid, slot_slotmanufacturerid) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	OPERATIVE	1	1
3	\N	\N	\N	\N	\N	\N	\N	OPERATIVE	4	3
4	\N	\N	\N	\N	\N	\N	\N	OPERATIVE	5	4
5	\N	\N	\N	\N	\N	\N	\N	OPERATIVE	6	5
8	\N	\N	\N	\N	\N	\N	\N	OPERATIVE	9	13
10	\N	\N	\N	\N	\N	\N	\N	OPERATIVE	2	25
9	\N	\N	\N	\N	\N	\N	\N	OPERATIVE	10	11
7	\N	\N	\N	\N	\N	\N	\N	OPERATIVE	8	25
2	\N	\N	\N	\N	\N	\N	\N	OPERATIVE	3	2
6	\N	\N	\N	\N	\N	\N	\N	OPERATIVE	7	21
\.


--
-- TOC entry 2233 (class 0 OID 72652)
-- Dependencies: 172
-- Data for Name: slot; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY slot (slot_manufacturer_id, slot_error_code, slot_error_info, slot_position, slot_state, station_stationmanufacturerid) FROM stdin;
1	\N	\N	1	OPERATIVE	afgahdfa
3	\N	\N	3	OPERATIVE	afgahdfa
4	\N	\N	4	OPERATIVE	afgahdfa
5	\N	\N	5	OPERATIVE	afgahdfa
2	\N	\N	2	OPERATIVE	afgahdfa
6	\N	\N	1	OPERATIVE	aghglujdag
10	\N	\N	5	OPERATIVE	aghglujdag
7	\N	\N	2	OPERATIVE	aghglujdag
8	\N	\N	3	OPERATIVE	aghglujdag
9	\N	\N	4	OPERATIVE	aghglujdag
11	\N	\N	1	OPERATIVE	agljhadg
12	\N	\N	2	OPERATIVE	agljhadg
13	\N	\N	3	OPERATIVE	agljhadg
14	\N	\N	4	OPERATIVE	agljhadg
15	\N	\N	5	OPERATIVE	agljhadg
16	\N	\N	1	OPERATIVE	agokjaglad
21	\N	\N	1	OPERATIVE	akdghlaj
17	\N	\N	2	OPERATIVE	agokjaglad
18	\N	\N	3	OPERATIVE	agokjaglad
19	\N	\N	4	OPERATIVE	agokjaglad
20	\N	\N	5	OPERATIVE	agokjaglad
22	\N	\N	2	OPERATIVE	akdghlaj
23	\N	\N	3	OPERATIVE	akdghlaj
24	\N	\N	4	OPERATIVE	akdghlaj
25	\N	\N	5	OPERATIVE	akdghlaj
\.


--
-- TOC entry 2234 (class 0 OID 72660)
-- Dependencies: 173
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY station (station_manufacturer_id, charging_status_inform_interval, cmsuri, firmware_version, heartbeat_interval, open_slot_timeout, reboot_retries, station_error_code, station_error_info, station_state) FROM stdin;
agokjaglad	50	http://localhost:8080	\N	\N	\N	\N	\N	\N	OPERATIVE
afgahdfa	50	http://localhost:8080	\N	\N	\N	\N	\N	\N	OPERATIVE
akdghlaj	50	http://localhost:8080	\N	\N	\N	\N	\N	\N	OPERATIVE
agljhadg	50	http://localhost:8080	\N	\N	\N	\N	\N	\N	OPERATIVE
aghglujdag	50	http://localhost:8080	\N	\N	\N	\N	\N	\N	OPERATIVE
\.


--
-- TOC entry 2235 (class 0 OID 72668)
-- Dependencies: 174
-- Data for Name: station_slots; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY station_slots (station_stationmanufacturerid, slots_slotmanufacturerid) FROM stdin;
afgahdfa	1
afgahdfa	2
afgahdfa	3
afgahdfa	4
afgahdfa	5
aghglujdag	6
aghglujdag	7
aghglujdag	8
aghglujdag	9
aghglujdag	10
agljhadg	11
agljhadg	12
agljhadg	13
agljhadg	14
agljhadg	15
agokjaglad	16
agokjaglad	17
agokjaglad	18
agokjaglad	19
agokjaglad	20
akdghlaj	21
akdghlaj	22
akdghlaj	23
akdghlaj	24
\.


--
-- TOC entry 2110 (class 2606 OID 72643)
-- Name: battery_pkey; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY battery
    ADD CONSTRAINT battery_pkey PRIMARY KEY (battery_id);


--
-- TOC entry 2112 (class 2606 OID 72651)
-- Name: pedelec_pkey; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY pedelec
    ADD CONSTRAINT pedelec_pkey PRIMARY KEY (pedelec_manufacturer_id);


--
-- TOC entry 2114 (class 2606 OID 72659)
-- Name: slot_pkey; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY slot
    ADD CONSTRAINT slot_pkey PRIMARY KEY (slot_manufacturer_id);


--
-- TOC entry 2116 (class 2606 OID 72667)
-- Name: station_pkey; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY station
    ADD CONSTRAINT station_pkey PRIMARY KEY (station_manufacturer_id);


--
-- TOC entry 2118 (class 2606 OID 72675)
-- Name: uk_po6my99ryuxvpkmajdshwx11; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY station_slots
    ADD CONSTRAINT uk_po6my99ryuxvpkmajdshwx11 UNIQUE (slots_slotmanufacturerid);


--
-- TOC entry 2121 (class 2606 OID 72686)
-- Name: fk_6oj9cprv61s5uoohjyf7e2ddr; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY slot
    ADD CONSTRAINT fk_6oj9cprv61s5uoohjyf7e2ddr FOREIGN KEY (station_stationmanufacturerid) REFERENCES station(station_manufacturer_id);


--
-- TOC entry 2120 (class 2606 OID 72681)
-- Name: fk_c9jr8i8ulf10o7jhyur5nmt9k; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY pedelec
    ADD CONSTRAINT fk_c9jr8i8ulf10o7jhyur5nmt9k FOREIGN KEY (slot_slotmanufacturerid) REFERENCES slot(slot_manufacturer_id);


--
-- TOC entry 2123 (class 2606 OID 72696)
-- Name: fk_nnyb2ekujfjpnf6g1yncpi7wc; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY station_slots
    ADD CONSTRAINT fk_nnyb2ekujfjpnf6g1yncpi7wc FOREIGN KEY (station_stationmanufacturerid) REFERENCES station(station_manufacturer_id);


--
-- TOC entry 2119 (class 2606 OID 72676)
-- Name: fk_pkwstooc88kp0d7wglus9rrjh; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY pedelec
    ADD CONSTRAINT fk_pkwstooc88kp0d7wglus9rrjh FOREIGN KEY (battery_batteryid) REFERENCES battery(battery_id);


--
-- TOC entry 2122 (class 2606 OID 72691)
-- Name: fk_po6my99ryuxvpkmajdshwx11; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY station_slots
    ADD CONSTRAINT fk_po6my99ryuxvpkmajdshwx11 FOREIGN KEY (slots_slotmanufacturerid) REFERENCES slot(slot_manufacturer_id);


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: max
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM max;
GRANT ALL ON SCHEMA public TO max;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-02-10 14:45:04 CET

--
-- PostgreSQL database dump complete
--

