--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.1
-- Started on 2015-02-10 14:44:45 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 200 (class 3079 OID 12018)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 200
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 58933)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp with time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20)
);


ALTER TABLE public.databasechangelog OWNER TO bikeman;

--
-- TOC entry 170 (class 1259 OID 58928)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp with time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO bikeman;

--
-- TOC entry 176 (class 1259 OID 58962)
-- Name: hibernate_sequences; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE hibernate_sequences (
    sequence_name character varying(255),
    sequence_next_hi_value integer
);


ALTER TABLE public.hibernate_sequences OWNER TO bikeman;

--
-- TOC entry 195 (class 1259 OID 59214)
-- Name: ixsi_client_system; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE ixsi_client_system (
    system_id character varying(255) NOT NULL,
    ip_address character varying(255) NOT NULL
);


ALTER TABLE public.ixsi_client_system OWNER TO bikeman;

--
-- TOC entry 194 (class 1259 OID 59196)
-- Name: ixsi_token; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE ixsi_token (
    token_id bigint NOT NULL,
    token_value character varying(255),
    created timestamp with time zone,
    last_used timestamp with time zone,
    card_account_id bigint
);


ALTER TABLE public.ixsi_token OWNER TO bikeman;

--
-- TOC entry 181 (class 1259 OID 59012)
-- Name: oauth_access_token; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE oauth_access_token (
    token_id character varying(256),
    token bytea,
    authentication_id character varying(256),
    user_name character varying(256),
    client_id character varying(256),
    authentication bytea,
    refresh_token character varying(256)
);


ALTER TABLE public.oauth_access_token OWNER TO bikeman;

--
-- TOC entry 184 (class 1259 OID 59027)
-- Name: oauth_approvals; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE oauth_approvals (
    "userId" character varying(256),
    "clientId" character varying(256),
    scope character varying(256),
    status character varying(256),
    "expiresAt" timestamp with time zone,
    "lastModifiedAt" timestamp with time zone
);


ALTER TABLE public.oauth_approvals OWNER TO bikeman;

--
-- TOC entry 179 (class 1259 OID 58998)
-- Name: oauth_client_details; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE oauth_client_details (
    client_id character varying(256) NOT NULL,
    resource_ids character varying(256),
    client_secret character varying(256),
    scope character varying(256),
    authorized_grant_types character varying(256),
    web_server_redirect_uri character varying(256),
    authorities character varying(256),
    access_token_validity integer,
    refresh_token_validity integer,
    additional_information character varying(4096),
    autoapprove character varying(4096)
);


ALTER TABLE public.oauth_client_details OWNER TO bikeman;

--
-- TOC entry 180 (class 1259 OID 59006)
-- Name: oauth_client_token; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE oauth_client_token (
    token_id character varying(256),
    token bytea,
    authentication_id character varying(256),
    user_name character varying(256),
    client_id character varying(256)
);


ALTER TABLE public.oauth_client_token OWNER TO bikeman;

--
-- TOC entry 183 (class 1259 OID 59024)
-- Name: oauth_code; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE oauth_code (
    code character varying(256)
);


ALTER TABLE public.oauth_code OWNER TO bikeman;

--
-- TOC entry 182 (class 1259 OID 59018)
-- Name: oauth_refresh_token; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE oauth_refresh_token (
    token_id character varying(256),
    token bytea,
    authentication bytea
);


ALTER TABLE public.oauth_refresh_token OWNER TO bikeman;

--
-- TOC entry 185 (class 1259 OID 59033)
-- Name: t_address; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_address (
    address_id bigint NOT NULL,
    city character varying(255),
    country character varying(255),
    street_and_housenumber character varying(255),
    zip character varying(255)
);


ALTER TABLE public.t_address OWNER TO bikeman;

--
-- TOC entry 173 (class 1259 OID 58944)
-- Name: t_authority; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_authority (
    name character varying(255) NOT NULL
);


ALTER TABLE public.t_authority OWNER TO bikeman;

--
-- TOC entry 199 (class 1259 OID 70404)
-- Name: t_booked_tariff; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_booked_tariff (
    booked_tariff_id bigint NOT NULL,
    tariff_id bigint,
    booked_from timestamp with time zone,
    booked_until timestamp with time zone,
    created timestamp with time zone,
    updated timestamp with time zone,
    card_account_id bigint,
    used_card_account_id bigint
);


ALTER TABLE public.t_booked_tariff OWNER TO bikeman;

--
-- TOC entry 197 (class 1259 OID 59239)
-- Name: t_booking; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_booking (
    booking_id bigint NOT NULL,
    reservation_id bigint,
    transaction_id bigint
);


ALTER TABLE public.t_booking OWNER TO bikeman;

--
-- TOC entry 192 (class 1259 OID 59148)
-- Name: t_card_account; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_card_account (
    card_account_id bigint NOT NULL,
    card_id character varying(255),
    card_pin character varying(255),
    in_transaction boolean,
    user_id bigint,
    owner_type character varying(255),
    operation_state character varying(255),
    created timestamp with time zone,
    updated timestamp with time zone,
    authentication_trial_count integer,
    activation_key character varying(255)
);


ALTER TABLE public.t_card_account OWNER TO bikeman;

--
-- TOC entry 186 (class 1259 OID 59039)
-- Name: t_customer; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_customer (
    birthday date,
    customer_id character varying(255),
    first_name character varying(255),
    in_transaction boolean,
    is_activated boolean,
    last_name character varying(255),
    user_id bigint NOT NULL,
    address_id bigint
);


ALTER TABLE public.t_customer OWNER TO bikeman;

--
-- TOC entry 193 (class 1259 OID 59176)
-- Name: t_major_customer; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_major_customer (
    user_id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.t_major_customer OWNER TO bikeman;

--
-- TOC entry 187 (class 1259 OID 59045)
-- Name: t_manager; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_manager (
    user_id bigint NOT NULL
);


ALTER TABLE public.t_manager OWNER TO bikeman;

--
-- TOC entry 188 (class 1259 OID 59048)
-- Name: t_pedelec; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_pedelec (
    pedelec_id bigint NOT NULL,
    in_transaction boolean,
    manufacturer_id character varying(255),
    state character varying(255),
    state_of_charge real,
    error_code character varying(255),
    error_info character varying(255),
    created timestamp with time zone,
    updated timestamp with time zone
);


ALTER TABLE public.t_pedelec OWNER TO bikeman;

--
-- TOC entry 177 (class 1259 OID 58981)
-- Name: t_persistent_audit_event; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_persistent_audit_event (
    event_id bigint NOT NULL,
    principal character varying(50),
    event_date date,
    event_type character varying(50)
);


ALTER TABLE public.t_persistent_audit_event OWNER TO bikeman;

--
-- TOC entry 178 (class 1259 OID 58986)
-- Name: t_persistent_audit_event_data; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_persistent_audit_event_data (
    event_id bigint NOT NULL,
    name character varying(50) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.t_persistent_audit_event_data OWNER TO bikeman;

--
-- TOC entry 175 (class 1259 OID 58954)
-- Name: t_persistent_token; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_persistent_token (
    series character varying(255) NOT NULL,
    user_id bigint,
    token_value character varying(255),
    token_date date,
    ip_address character varying(39),
    user_agent character varying(255)
);


ALTER TABLE public.t_persistent_token OWNER TO bikeman;

--
-- TOC entry 196 (class 1259 OID 59224)
-- Name: t_reservation; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_reservation (
    reservation_id bigint NOT NULL,
    card_account_id bigint,
    start_datetime timestamp with time zone,
    end_datetime timestamp with time zone,
    pedelec_id bigint
);


ALTER TABLE public.t_reservation OWNER TO bikeman;

--
-- TOC entry 189 (class 1259 OID 59054)
-- Name: t_station; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_station (
    station_id bigint NOT NULL,
    location_latitude numeric(24,18),
    location_longitude numeric(24,18),
    manufacturer_id character varying(255),
    name character varying(255),
    note text,
    state character varying(255),
    address_id bigint,
    firmware_version character varying(255),
    error_code character varying(255),
    error_info character varying(255),
    endpoint_address character varying(255),
    created timestamp with time zone,
    updated timestamp with time zone
);


ALTER TABLE public.t_station OWNER TO bikeman;

--
-- TOC entry 190 (class 1259 OID 59060)
-- Name: t_station_slot; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_station_slot (
    station_slot_id bigint NOT NULL,
    is_occupied boolean,
    manufacturer_id character varying(255),
    state character varying(255),
    station_slot_position integer,
    pedelec_id bigint,
    station_id bigint,
    error_code character varying(255),
    error_info character varying(255)
);


ALTER TABLE public.t_station_slot OWNER TO bikeman;

--
-- TOC entry 198 (class 1259 OID 70399)
-- Name: t_tariff; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_tariff (
    tariff_id bigint NOT NULL,
    tariff_type character varying(255),
    active boolean,
    mounthly_rate real
);


ALTER TABLE public.t_tariff OWNER TO bikeman;

--
-- TOC entry 191 (class 1259 OID 59066)
-- Name: t_transaction; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_transaction (
    transaction_id bigint NOT NULL,
    end_datetime timestamp with time zone,
    start_datetime timestamp with time zone,
    from_slot_id bigint,
    pedelec_id bigint,
    to_slot_id bigint,
    card_account_id bigint,
    booked_tariff_id bigint
);


ALTER TABLE public.t_transaction OWNER TO bikeman;

--
-- TOC entry 172 (class 1259 OID 58939)
-- Name: t_user; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_user (
    user_id bigint NOT NULL,
    login character varying(100),
    password character varying(100),
    user_type character varying(31) NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone
);


ALTER TABLE public.t_user OWNER TO bikeman;

--
-- TOC entry 174 (class 1259 OID 58949)
-- Name: t_user_authority; Type: TABLE; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE TABLE t_user_authority (
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.t_user_authority OWNER TO bikeman;

--
-- TOC entry 2419 (class 0 OID 58933)
-- Dependencies: 171
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase) FROM stdin;
1	jhipster	classpath:config/liquibase/changelog/db-changelog-001.xml	2014-11-20 14:33:14.532622+01	1	EXECUTED	7:0f3bb19fd23e7c040d33b70afeb3f38e	createTable (x3), addPrimaryKey, createTable (x2), createIndex, addForeignKeyConstraint (x3)		\N	3.0.8
2	jhipster	classpath:config/liquibase/changelog/db-changelog-001.xml	2014-11-20 14:33:14.602397+01	2	EXECUTED	7:9aa8d2fb10a973c2eb73426937ab6c06	createTable (x2), addPrimaryKey, createIndex (x2), addForeignKeyConstraint		\N	3.0.8
3	jhipster	classpath:config/liquibase/changelog/db-changelog-001.xml	2014-11-20 14:33:14.701284+01	3	EXECUTED	7:4c29180cddab3ecac55103701f09c6de	createTable (x6)		\N	3.0.8
1402484105134-30	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.74046+01	4	EXECUTED	7:6695d6e7eb51b8f3d0ac0c9268a033ca	createTable		\N	3.0.8
1402484105134-31	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.779185+01	5	EXECUTED	7:3ee749f9b0556a0ccd170e762e88d299	createTable		\N	3.0.8
1402484105134-32	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.795549+01	6	EXECUTED	7:f344a1d77d6ec2472a626b497b5b413f	createTable		\N	3.0.8
1402484105134-33	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.810889+01	7	EXECUTED	7:6a584ec6eb81961e2625aac79acadc4f	createTable		\N	3.0.8
1402484105134-34	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.834379+01	8	EXECUTED	7:ba4b757536a59cadee4b7ef331454d2b	createTable		\N	3.0.8
1402484105134-35	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.856384+01	9	EXECUTED	7:260f76fa6c43396499cf3be899605cdf	createTable		\N	3.0.8
1402484105134-36	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.874933+01	10	EXECUTED	7:38be4900c87f969367da56ecf5c67f67	createTable		\N	3.0.8
1402484105134-37	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.89138+01	11	EXECUTED	7:cb11f02ac2dee3b6913a8565e94e185e	addColumn		\N	3.0.8
1402484105134-38	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.900385+01	12	EXECUTED	7:0cc3774ce13cd5a6712d7c7bd576400a	addPrimaryKey		\N	3.0.8
1402484105134-39	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.908643+01	13	EXECUTED	7:1ed343d879d74b575ad2870a3223a605	addPrimaryKey		\N	3.0.8
1402484105134-40	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.916499+01	14	EXECUTED	7:bffd7a203723c52b0c756113e24bed56	addPrimaryKey		\N	3.0.8
1402484105134-41	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.923143+01	15	EXECUTED	7:7e6b7d0ba2d8355289c570ca7dcf6925	addPrimaryKey		\N	3.0.8
1402484105134-42	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.929879+01	16	EXECUTED	7:59f9cde6b15b60902a28d098268b6ae0	addPrimaryKey		\N	3.0.8
1402484105134-43	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.940231+01	17	EXECUTED	7:97a0e1aebe5b953c1966f60b0773f7aa	addPrimaryKey		\N	3.0.8
1402484105134-44	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.947681+01	18	EXECUTED	7:9e534fe06415c35c389facb3900420e5	addPrimaryKey		\N	3.0.8
1402484105134-45	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.954805+01	19	EXECUTED	7:dad47762e46f07ae9cc4efb2892f0222	addForeignKeyConstraint		\N	3.0.8
1402484105134-46	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.963033+01	20	EXECUTED	7:167a92659a0cbaba21c10195303284a5	addForeignKeyConstraint		\N	3.0.8
1402484105134-47	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.970133+01	21	EXECUTED	7:52ffe9888432ca6d164aa5bda2116b45	addForeignKeyConstraint		\N	3.0.8
1402484105134-48	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.978957+01	22	EXECUTED	7:d893b384d28863458b4f2b7fbf052846	addForeignKeyConstraint		\N	3.0.8
1402484105134-49	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.989774+01	23	EXECUTED	7:9cfa63fbef6adb2cab6c6760eacbf856	addForeignKeyConstraint		\N	3.0.8
1402484105134-50	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:14.99671+01	24	EXECUTED	7:80da33ea2b522a1c1dcfe66f417f5dff	addForeignKeyConstraint		\N	3.0.8
1402484105134-51	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:15.002737+01	25	EXECUTED	7:e1d1d6659f54d741a3396f8327e43bbb	addForeignKeyConstraint		\N	3.0.8
1402484105134-52	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:15.009133+01	26	EXECUTED	7:42f4e27fa6a8eb4bdd6d347dafa77e66	addForeignKeyConstraint		\N	3.0.8
1402484105134-53	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:15.014749+01	27	EXECUTED	7:7b546ad6390a083cfef6d6fff4c65f21	addForeignKeyConstraint		\N	3.0.8
1402484105134-54	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:15.020032+01	28	EXECUTED	7:afb672fa6193884b9891b3672932a760	addForeignKeyConstraint		\N	3.0.8
1402484105134-55	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:15.02528+01	29	EXECUTED	7:1585a8590eeefc820e95d861ef7f3640	addUniqueConstraint		\N	3.0.8
1402484105134-56	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:15.03039+01	30	EXECUTED	7:2c92b7d930e4702bcbd25b3800232625	addUniqueConstraint		\N	3.0.8
1402484105134-57	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:15.037899+01	31	EXECUTED	7:6d886db649eb97071abb1cd010d5fdc4	addUniqueConstraint		\N	3.0.8
1402484105134-58	jhipster	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:15.056429+01	32	EXECUTED	7:ffddfc608a60f22981c8bcaadb501f39	createIndex (x5)		\N	3.0.8
1399570790463-55	wollo	classpath:config/liquibase/changelog/db-changelog-002.xml	2014-11-20 14:33:15.08508+01	33	EXECUTED	7:176117326adb5d0e056f9216657c026e	loadData (x4)		\N	3.0.8
1402497091113-3	jhipster	classpath:config/liquibase/changelog/db-changelog-003.xml	2014-11-20 14:33:15.094047+01	34	EXECUTED	7:ca6c7ef30e498ec8a7d6e236c39e9f02	addUniqueConstraint		\N	3.0.8
1402497091113-4	jhipster	classpath:config/liquibase/changelog/db-changelog-003.xml	2014-11-20 14:33:15.099006+01	35	EXECUTED	7:97e463b4b9dc9cd510d422b64a74e01b	dropNotNullConstraint		\N	3.0.8
1402497091113-5	jhipster	classpath:config/liquibase/changelog/db-changelog-003.xml	2014-11-20 14:33:15.105664+01	36	EXECUTED	7:0c7f7acc267c93f3579942db22e5c3c8	addUniqueConstraint		\N	3.0.8
1409564974607-8	jhipster	none	2014-11-20 14:33:15.111146+01	37	EXECUTED	7:72c4f9f14a44da0b6da7260dd3cc3bb3	addColumn		\N	3.0.8
1409564974607-9	jhipster	none	2014-11-20 14:33:15.116515+01	38	EXECUTED	7:c3bf507d6562e9949145978dffa1e3f1	addColumn		\N	3.0.8
1409564974607-10	jhipster	none	2014-11-20 14:33:15.121589+01	39	EXECUTED	7:8ef7057209c13e9d4373c9863b230afb	addColumn		\N	3.0.8
1409564974607-11	jhipster	none	2014-11-20 14:33:15.12709+01	40	EXECUTED	7:8800519e2baf81912c5cf648ad60057d	addColumn		\N	3.0.8
1409564974607-12	jhipster	none	2014-11-20 14:33:15.13283+01	41	EXECUTED	7:bcc161811f1ef5ec006b37618426c0e5	addColumn		\N	3.0.8
1409564974607-13	jhipster	none	2014-11-20 14:33:15.138228+01	42	EXECUTED	7:2fe8aaf73a6835f39273cf1ffd7c00fe	addColumn		\N	3.0.8
1409564974607-14	jhipster	none	2014-11-20 14:33:15.143442+01	43	EXECUTED	7:8ff98260e24425bb6b52e7ca56616e06	addColumn		\N	3.0.8
1409564974607-15	wkluth	none	2014-11-20 14:33:15.161621+01	44	EXECUTED	7:595dd36c53dbdf99101c18377bfacd26	createTable, addColumn, addPrimaryKey, addForeignKeyConstraint (x2)		\N	3.0.8
1409564974607-16	wkluth	none	2014-11-20 14:33:15.176559+01	45	EXECUTED	7:5780baa583552c80140b3f48d19a7e3f	addColumn, createTable, addPrimaryKey, addForeignKeyConstraint		\N	3.0.8
1409564974607-17	jhipster	none	2014-11-20 14:33:15.185428+01	46	EXECUTED	7:13293d1db5f0aed1cb26ee74e29ec80a	addColumn (x2)		\N	3.0.8
1409564974607-18	jhipster	none	2014-11-20 14:33:15.190053+01	47	EXECUTED	7:65276c74cbea71c015cfab7dfe6b68e9	addColumn (x2)		\N	3.0.8
1409564974607-19	jhipster	none	2014-11-20 14:33:15.194287+01	48	EXECUTED	7:4dcbfc06ac74b8ea0338c3282122af6f	addColumn (x2)		\N	3.0.8
1409564974607-20	wkluth	none	2014-11-20 14:33:15.207095+01	49	EXECUTED	7:81ed81330bdc5eed5c9d731038e4decf	addColumn, dropTable, createTable, addPrimaryKey, addForeignKeyConstraint		\N	3.0.8
1409564974607-21	wkluth	none	2014-11-20 14:33:15.214165+01	50	EXECUTED	7:2562a35ed059c95f97105c47bd6c6316	addColumn		\N	3.0.8
1409564974607-22	wkluth	none	2014-11-20 14:33:15.225086+01	51	EXECUTED	7:f98b002ab4a4356e26617184347d3d0a	modifyDataType		\N	3.0.8
1409564974607-23	wkluth	none	2014-11-20 14:33:15.232031+01	52	EXECUTED	7:adca07cd40ef1a73def1da9456d5a7a2	addUniqueConstraint		\N	3.0.8
1409564974607-25	wkluth	none	2014-11-20 14:33:15.238051+01	53	EXECUTED	7:a9fa041b1ef55e461ced604e66439547	addColumn (x2)		\N	3.0.8
1409564974607-26	wkluth	none	2014-11-20 14:33:15.244397+01	54	EXECUTED	7:d745ec47b1a9cb9f771e21eeeef97d4b	createIndex		\N	3.0.8
1409564974607-27	sgoekay	none	2014-11-20 14:33:15.25491+01	55	EXECUTED	7:304ef377cc367b04315179578f8d85d3	createTable, addForeignKeyConstraint		\N	3.0.8
1409564974607-28	wkluth	none	2014-11-20 14:33:15.261735+01	56	EXECUTED	7:ca2912ec0f080c5e47917b80cf18fd1a	dropColumn (x2)		\N	3.0.8
1409564974607-29	sgoekay	none	2014-11-20 14:33:15.268824+01	57	EXECUTED	7:da97310a79ab8cdd67fae40bd604ce64	dropColumn, addColumn, addForeignKeyConstraint		\N	3.0.8
1409564974607-30	sgoekay	none	2014-11-20 14:33:15.276964+01	58	EXECUTED	7:a0e46965b62cf4ea1765c7ac6d9da7d3	createTable		\N	3.0.8
1409564974607-31	wkluth	none	2014-11-20 14:33:15.282657+01	59	EXECUTED	7:e875e1ebba8b0bc70ee181565edfed97	dropForeignKeyConstraint, dropIndex, dropColumn		\N	3.0.8
1409564974607-32	mwiederhold	none	2014-11-20 14:33:15.296816+01	60	EXECUTED	7:35283ebe32fc856c9137780dcb32e405	createTable, addForeignKeyConstraint (x2)		\N	3.0.8
1409564974607-33	mwiederhold	none	2014-11-20 14:33:15.310826+01	61	EXECUTED	7:9492118868d972dd89c9bdbb26b306b7	createTable, addForeignKeyConstraint (x2)		\N	3.0.8
1409564974607-34	goekay	none	2014-11-26 10:38:02.727341+01	62	EXECUTED	7:9623abac1c114f8992784e6040b0a258	dropColumn, addColumn, addForeignKeyConstraint, createIndex		\N	3.0.8
1409564974607-35	mwiederhold	none	2014-11-26 11:37:08.783275+01	63	EXECUTED	7:01e9649a8f973a887edf93eab585374d	dropColumn, addColumn, addForeignKeyConstraint		\N	3.0.8
1409564974607-35	goekay	none	2014-11-26 12:30:49.287021+01	64	EXECUTED	7:5dd6831ca783787abf0549c67c2eb665	dropColumn, addColumn, addForeignKeyConstraint, dropIndex		\N	3.0.8
1409564974607-36	wkluth	none	2015-01-26 13:31:18.914672+01	65	EXECUTED	7:35e29f9a7f7830b257efd5005db66227	addColumn, createTable		\N	3.0.8
1409564974607-37	wkluth	none	2015-01-26 13:31:18.954531+01	66	EXECUTED	7:52cfeec148e9247f8b64d076eb91f061	createTable, addForeignKeyConstraint		\N	3.0.8
1409564974607-38	wkluth	none	2015-01-26 13:31:18.966297+01	67	EXECUTED	7:39c36c457a34bf48758d6d34d1d88424	addColumn, addForeignKeyConstraint		\N	3.0.8
1409564974607-39	wkluth	none	2015-01-26 13:31:18.974512+01	68	EXECUTED	7:c692fa586dba5ec26a2554e2b55bb088	addColumn, addForeignKeyConstraint		\N	3.0.8
1409564974607-40	wkluth	none	2015-01-26 13:31:18.989039+01	69	EXECUTED	7:815def28a9f63d0d49beb8cf6e6a1477	addColumn, addForeignKeyConstraint		\N	3.0.8
1409564974607-41	wkluth	none	2015-01-26 13:31:18.994135+01	70	EXECUTED	7:a36b5177b8abb68cb96bb14780cacb0b	addColumn		\N	3.0.8
\.


--
-- TOC entry 2418 (class 0 OID 58928)
-- Dependencies: 170
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 2424 (class 0 OID 58962)
-- Dependencies: 176
-- Data for Name: hibernate_sequences; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY hibernate_sequences (sequence_name, sequence_next_hi_value) FROM stdin;
T_PERSISTENT_AUDIT_EVENT	2
T_TRANSACTION	6
T_USER	13
T_CARD_ACCOUNT	8
T_BOOKED_TARIFF	2
T_STATION	10
T_ADDRESS	16
T_RESERVATION	17
T_BOOKING	13
T_PEDELEC	23
\.


--
-- TOC entry 2443 (class 0 OID 59214)
-- Dependencies: 195
-- Data for Name: ixsi_client_system; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY ixsi_client_system (system_id, ip_address) FROM stdin;
MobilityBroker	127.0.0.1
Local	0:0:0:0:0:0:0:1
\.


--
-- TOC entry 2442 (class 0 OID 59196)
-- Dependencies: 194
-- Data for Name: ixsi_token; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY ixsi_token (token_id, token_value, created, last_used, card_account_id) FROM stdin;
1	$2a$10$/qUH714aSb.gpoDGx4sYvOnbaOdLx54bRt0fKVYR53SgzTZ0JU5AK	2014-11-25 14:12:22.285+01	2014-12-03 12:58:01.526+01	1
\.


--
-- TOC entry 2429 (class 0 OID 59012)
-- Dependencies: 181
-- Data for Name: oauth_access_token; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY oauth_access_token (token_id, token, authentication_id, user_name, client_id, authentication, refresh_token) FROM stdin;
ef4e45350e1d7e7aff5d45ecc57c421e	\\xaced0005737200436f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f4175746832416363657373546f6b656e0cb29e361b24face0200064c00156164646974696f6e616c496e666f726d6174696f6e74000f4c6a6176612f7574696c2f4d61703b4c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b4c000c72656672657368546f6b656e74003f4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f636f6d6d6f6e2f4f417574683252656672657368546f6b656e3b4c000573636f706574000f4c6a6176612f7574696c2f5365743b4c0009746f6b656e547970657400124c6a6176612f6c616e672f537472696e673b4c000576616c756571007e000578707372001e6a6176612e7574696c2e436f6c6c656374696f6e7324456d7074794d6170593614855adce7d002000078707372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000014b7e1e7c48787372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e71007e0002787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c756571007e0005787074002465656138613237612d303433622d346366352d393230342d6666373230383237633964307371007e000977080000014bd54f66fe78737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c0001637400164c6a6176612f7574696c2f436f6c6c656374696f6e3b7870737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000027400047265616474000577726974657874000662656172657274002433623066343933312d373664662d343465642d613166372d633930333935633131396538	150482c69ff151431f4aee10367245b4	admin@bikeman.com	bikeManApp	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000004770400000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001400200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7371007e000d74000d524f4c455f435553544f4d45527371007e000d740013524f4c455f4d414a4f525f435553544f4d45527371007e000d74000c524f4c455f4d414e414745527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200065a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0019787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00184c000573636f706571007e0019787074000a62696b654d616e417070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00187870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000005740008757365726e616d6574001161646d696e4062696b656d616e2e636f6d74000d636c69656e745f7365637265747400136d795365637265744f4175746853656372657474000573636f706574000a7265616420777269746574000a6772616e745f7479706574000870617373776f7264740009636c69656e745f696474000a62696b654d616e41707078737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e002e770c000000103f400000000000037371007e000d74000a524f4c455f41444d494e7371007e000d74000c524f4c455f4d414e414745527371007e000d74000d524f4c455f435553544f4d4552787371007e001f3f400000000000107708000000100000000078707371007e002d770c000000003f40000000000000787371007e002e770c000000003f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001400200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000477040000000471007e000f71007e001171007e001371007e00157871007e003f737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e001f3f4000000000000c7708000000100000000571007e002171007e002271007e002771007e002871007e002571007e002671007e002371007e002471007e002971007e002a780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000001400200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00194c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e002b737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000140020000787077040000000471007e000f71007e001171007e001371007e0015787071007e0022	11c18911006e187e9e4a2fd1c4010a30
\.


--
-- TOC entry 2432 (class 0 OID 59027)
-- Dependencies: 184
-- Data for Name: oauth_approvals; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY oauth_approvals ("userId", "clientId", scope, status, "expiresAt", "lastModifiedAt") FROM stdin;
\.


--
-- TOC entry 2427 (class 0 OID 58998)
-- Dependencies: 179
-- Data for Name: oauth_client_details; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity, additional_information, autoapprove) FROM stdin;
\.


--
-- TOC entry 2428 (class 0 OID 59006)
-- Dependencies: 180
-- Data for Name: oauth_client_token; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY oauth_client_token (token_id, token, authentication_id, user_name, client_id) FROM stdin;
\.


--
-- TOC entry 2431 (class 0 OID 59024)
-- Dependencies: 183
-- Data for Name: oauth_code; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY oauth_code (code) FROM stdin;
\.


--
-- TOC entry 2430 (class 0 OID 59018)
-- Dependencies: 182
-- Data for Name: oauth_refresh_token; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY oauth_refresh_token (token_id, token, authentication) FROM stdin;
c536f3854c3be451240047ff0d782337	\\xaced00057372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b787074002464646336303930622d623365372d343239382d623833322d3438613334633633616364397372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000014a67f2760378	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000004770400000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001400200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7371007e000d74000d524f4c455f435553544f4d45527371007e000d740013524f4c455f4d414a4f525f435553544f4d45527371007e000d74000c524f4c455f4d414e414745527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200065a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0019787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00184c000573636f706571007e0019787074000a62696b654d616e417070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00187870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000005740008757365726e616d6574001161646d696e4062696b656d616e2e636f6d74000d636c69656e745f7365637265747400136d795365637265744f4175746853656372657474000573636f706574000a7265616420777269746574000a6772616e745f7479706574000870617373776f7264740009636c69656e745f696474000a62696b654d616e41707078737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e002e770c000000103f400000000000037371007e000d74000a524f4c455f41444d494e7371007e000d74000c524f4c455f4d414e414745527371007e000d74000d524f4c455f435553544f4d4552787371007e001f3f40000000000010770800000010000000007870707371007e002e770c000000003f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001400200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000477040000000471007e000f71007e001171007e001371007e00157871007e003e7070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000001400200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00194c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e002b737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000140020000787077040000000471007e000f71007e001171007e001371007e0015787071007e0022
8ccbd05f38c4ced161fa08d91a281f25	\\xaced00057372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b787074002463333736653661362d373963612d346635652d623039612d3863613939363237636530627372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000014b59ef49bc78	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000004770400000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001400200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7371007e000d74000d524f4c455f435553544f4d45527371007e000d740013524f4c455f4d414a4f525f435553544f4d45527371007e000d74000c524f4c455f4d414e414745527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200065a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0019787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00184c000573636f706571007e0019787074000a62696b654d616e417070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00187870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000005740008757365726e616d6574001161646d696e4062696b656d616e2e636f6d74000d636c69656e745f7365637265747400136d795365637265744f4175746853656372657474000573636f706574000a7265616420777269746574000a6772616e745f7479706574000870617373776f7264740009636c69656e745f696474000a62696b654d616e41707078737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e002e770c000000103f400000000000037371007e000d74000a524f4c455f41444d494e7371007e000d74000c524f4c455f4d414e414745527371007e000d74000d524f4c455f435553544f4d4552787371007e001f3f400000000000107708000000100000000078707371007e002d770c000000003f40000000000000787371007e002e770c000000003f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001400200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000477040000000471007e000f71007e001171007e001371007e00157871007e003f737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e001f3f4000000000000c7708000000100000000571007e002171007e002271007e002771007e002871007e002571007e002671007e002371007e002471007e002971007e002a780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000001400200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00194c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e002b737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000140020000787077040000000471007e000f71007e001171007e001371007e0015787071007e0022
3222384714806c710b11c4ea98b2bad3	\\xaced00057372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b787074002465613339313963652d393432372d343935342d626239322d6437376532306134623135387372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000014b59fe874478	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000004770400000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001400200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7371007e000d74000d524f4c455f435553544f4d45527371007e000d740013524f4c455f4d414a4f525f435553544f4d45527371007e000d74000c524f4c455f4d414e414745527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200065a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0019787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00184c000573636f706571007e0019787074000a62696b654d616e417070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00187870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000005740008757365726e616d6574001161646d696e4062696b656d616e2e636f6d74000d636c69656e745f7365637265747400136d795365637265744f4175746853656372657474000573636f706574000a7265616420777269746574000a6772616e745f7479706574000870617373776f7264740009636c69656e745f696474000a62696b654d616e41707078737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e002e770c000000103f400000000000037371007e000d74000a524f4c455f41444d494e7371007e000d74000c524f4c455f4d414e414745527371007e000d74000d524f4c455f435553544f4d4552787371007e001f3f400000000000107708000000100000000078707371007e002d770c000000003f40000000000000787371007e002e770c000000003f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001400200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000477040000000471007e000f71007e001171007e001371007e00157871007e003f737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e001f3f4000000000000c7708000000100000000571007e002171007e002271007e002771007e002871007e002571007e002671007e002371007e002471007e002971007e002a780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000001400200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00194c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e002b737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000140020000787077040000000471007e000f71007e001171007e001371007e0015787071007e0022
690af99ddd161169db9e3a7e427c06d5	\\xaced00057372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b787074002462613335366139362d323136342d343464352d383939362d3833366234623832353139377372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000014b59fead5978	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000004770400000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001400200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7371007e000d74000d524f4c455f435553544f4d45527371007e000d740013524f4c455f4d414a4f525f435553544f4d45527371007e000d74000c524f4c455f4d414e414745527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200065a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0019787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00184c000573636f706571007e0019787074000a62696b654d616e417070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00187870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000005740008757365726e616d6574001161646d696e4062696b656d616e2e636f6d74000d636c69656e745f7365637265747400136d795365637265744f4175746853656372657474000573636f706574000a7265616420777269746574000a6772616e745f7479706574000870617373776f7264740009636c69656e745f696474000a62696b654d616e41707078737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e002e770c000000103f400000000000037371007e000d74000a524f4c455f41444d494e7371007e000d74000c524f4c455f4d414e414745527371007e000d74000d524f4c455f435553544f4d4552787371007e001f3f400000000000107708000000100000000078707371007e002d770c000000003f40000000000000787371007e002e770c000000003f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001400200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000477040000000471007e000f71007e001171007e001371007e00157871007e003f737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e001f3f4000000000000c7708000000100000000571007e002171007e002271007e002771007e002871007e002571007e002671007e002371007e002471007e002971007e002a780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000001400200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00194c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e002b737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000140020000787077040000000471007e000f71007e001171007e001371007e0015787071007e0022
97e15eb743ed5acd66be6139a11bdde0	\\xaced00057372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b787074002437303434353832352d303430612d346465362d383233612d3061393635653138313433307372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000014b59fffd9e78	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000004770400000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001400200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7371007e000d74000d524f4c455f435553544f4d45527371007e000d740013524f4c455f4d414a4f525f435553544f4d45527371007e000d74000c524f4c455f4d414e414745527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200065a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0019787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00184c000573636f706571007e0019787074000a62696b654d616e417070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00187870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000005740008757365726e616d6574001161646d696e4062696b656d616e2e636f6d74000d636c69656e745f7365637265747400136d795365637265744f4175746853656372657474000573636f706574000a7265616420777269746574000a6772616e745f7479706574000870617373776f7264740009636c69656e745f696474000a62696b654d616e41707078737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e002e770c000000103f400000000000037371007e000d74000a524f4c455f41444d494e7371007e000d74000c524f4c455f4d414e414745527371007e000d74000d524f4c455f435553544f4d4552787371007e001f3f400000000000107708000000100000000078707371007e002d770c000000003f40000000000000787371007e002e770c000000003f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001400200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000477040000000471007e000f71007e001171007e001371007e00157871007e003f737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e001f3f4000000000000c7708000000100000000571007e002171007e002271007e002771007e002871007e002571007e002671007e002371007e002471007e002971007e002a780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000001400200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00194c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e002b737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000140020000787077040000000471007e000f71007e001171007e001371007e0015787071007e0022
9b04c2ddaec373abb1bdcb4db6902f18	\\xaced00057372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b787074002432376639343930352d396462322d346464352d393334362d6638326133353666386162667372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000014b640d9ce678	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000004770400000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001400200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7371007e000d74000d524f4c455f435553544f4d45527371007e000d740013524f4c455f4d414a4f525f435553544f4d45527371007e000d74000c524f4c455f4d414e414745527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200065a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0019787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00184c000573636f706571007e0019787074000a62696b654d616e417070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00187870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000005740008757365726e616d6574001161646d696e4062696b656d616e2e636f6d74000d636c69656e745f7365637265747400136d795365637265744f4175746853656372657474000573636f706574000a7265616420777269746574000a6772616e745f7479706574000870617373776f7264740009636c69656e745f696474000a62696b654d616e41707078737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e002e770c000000103f400000000000037371007e000d74000a524f4c455f41444d494e7371007e000d74000c524f4c455f4d414e414745527371007e000d74000d524f4c455f435553544f4d4552787371007e001f3f400000000000107708000000100000000078707371007e002d770c000000003f40000000000000787371007e002e770c000000003f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001400200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000477040000000471007e000f71007e001171007e001371007e00157871007e003f737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e001f3f4000000000000c7708000000100000000571007e002171007e002271007e002771007e002871007e002571007e002671007e002371007e002471007e002971007e002a780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000001400200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00194c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e002b737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000140020000787077040000000471007e000f71007e001171007e001371007e0015787071007e0022
ad34aeba757038afb806d35284975d4b	\\xaced00057372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b787074002436616635323966372d646530322d343266352d383264662d6466346465613934626331657372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000014b640e049b78	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000004770400000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001400200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7371007e000d74000d524f4c455f435553544f4d45527371007e000d740013524f4c455f4d414a4f525f435553544f4d45527371007e000d74000c524f4c455f4d414e414745527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200065a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0019787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00184c000573636f706571007e0019787074000a62696b654d616e417070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00187870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000005740008757365726e616d6574001161646d696e4062696b656d616e2e636f6d74000d636c69656e745f7365637265747400136d795365637265744f4175746853656372657474000573636f706574000a7265616420777269746574000a6772616e745f7479706574000870617373776f7264740009636c69656e745f696474000a62696b654d616e41707078737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e002e770c000000103f400000000000037371007e000d74000a524f4c455f41444d494e7371007e000d74000c524f4c455f4d414e414745527371007e000d74000d524f4c455f435553544f4d4552787371007e001f3f400000000000107708000000100000000078707371007e002d770c000000003f40000000000000787371007e002e770c000000003f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001400200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000477040000000471007e000f71007e001171007e001371007e00157871007e003f737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e001f3f4000000000000c7708000000100000000571007e002171007e002271007e002771007e002871007e002571007e002671007e002371007e002471007e002971007e002a780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000001400200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00194c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e002b737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000140020000787077040000000471007e000f71007e001171007e001371007e0015787071007e0022
11c18911006e187e9e4a2fd1c4010a30	\\xaced00057372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b787074002465656138613237612d303433622d346366352d393230342d6666373230383237633964307372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000014bd54f66fe78	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000004770400000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001400200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7371007e000d74000d524f4c455f435553544f4d45527371007e000d740013524f4c455f4d414a4f525f435553544f4d45527371007e000d74000c524f4c455f4d414e414745527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200065a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0019787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00184c000573636f706571007e0019787074000a62696b654d616e417070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00187870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000005740008757365726e616d6574001161646d696e4062696b656d616e2e636f6d74000d636c69656e745f7365637265747400136d795365637265744f4175746853656372657474000573636f706574000a7265616420777269746574000a6772616e745f7479706574000870617373776f7264740009636c69656e745f696474000a62696b654d616e41707078737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e002e770c000000103f400000000000037371007e000d74000a524f4c455f41444d494e7371007e000d74000c524f4c455f4d414e414745527371007e000d74000d524f4c455f435553544f4d4552787371007e001f3f400000000000107708000000100000000078707371007e002d770c000000003f40000000000000787371007e002e770c000000003f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001400200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000477040000000471007e000f71007e001171007e001371007e00157871007e003f737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e001f3f4000000000000c7708000000100000000571007e002171007e002271007e002771007e002871007e002571007e002671007e002371007e002471007e002971007e002a780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000001400200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00194c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e002b737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000140020000787077040000000471007e000f71007e001171007e001371007e0015787071007e0022
\.


--
-- TOC entry 2433 (class 0 OID 59033)
-- Dependencies: 185
-- Data for Name: t_address; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_address (address_id, city, country, street_and_housenumber, zip) FROM stdin;
1	agiua	pgjag	aogijagdhj	54787
2	aldhjk	galjkh	kajhf	27644
3	kjb	kjbg	ohfa	234
9	aldkgj	dvlkjg	lfkaj	dlvk
5	aojdhgfl	ljkdvsn	Test1	54245
11	Aachen	Germany	aslgh	2425
12	Aachen	Germany	asoghag	24825
13	Aachen	Germany	agsoijadf	3459
14	Aachen	Germany	fojhladlg	23846
15	Aachen	Germany	oajfhglga	7462
\.


--
-- TOC entry 2421 (class 0 OID 58944)
-- Dependencies: 173
-- Data for Name: t_authority; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_authority (name) FROM stdin;
ROLE_ADMIN
ROLE_MANAGER
ROLE_CUSTOMER
ROLE_MAJOR_CUSTOMER
\.


--
-- TOC entry 2447 (class 0 OID 70404)
-- Dependencies: 199
-- Data for Name: t_booked_tariff; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_booked_tariff (booked_tariff_id, tariff_id, booked_from, booked_until, created, updated, card_account_id, used_card_account_id) FROM stdin;
1	1	2015-02-10 13:11:07.816+01	2016-02-10 13:11:07.816+01	2015-02-10 13:11:07.857+01	2015-02-10 13:11:07.857+01	\N	7
\.


--
-- TOC entry 2445 (class 0 OID 59239)
-- Dependencies: 197
-- Data for Name: t_booking; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_booking (booking_id, reservation_id, transaction_id) FROM stdin;
1	5	\N
3	7	\N
4	8	\N
5	9	\N
6	10	\N
7	11	\N
\.


--
-- TOC entry 2440 (class 0 OID 59148)
-- Dependencies: 192
-- Data for Name: t_card_account; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_card_account (card_account_id, card_id, card_pin, in_transaction, user_id, owner_type, operation_state, created, updated, authentication_trial_count, activation_key) FROM stdin;
1	abc	1234	f	3	MAJOR_CUSTOMER	OPERATIVE	2014-11-26 08:49:19.066+01	2014-11-26 08:51:22.993+01	\N	\N
2	cardid	1234	f	8	CUSTOMER	OPERATIVE	2015-01-08 11:47:08.151+01	2015-01-08 11:47:08.151+01	\N	\N
6	ajlhfd	1344	f	12	CUSTOMER	OPERATIVE	2015-01-08 11:59:07.313+01	2015-01-08 11:59:07.313+01	\N	\N
7	c6717560-c69c-4915-b628-598cfc8b1e19	1234	f	3	MAJOR_CUSTOMER	OPERATIVE	2015-02-10 13:11:07.829+01	2015-02-10 14:43:32.276+01	\N	863871806275
\.


--
-- TOC entry 2434 (class 0 OID 59039)
-- Dependencies: 186
-- Data for Name: t_customer; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_customer (birthday, customer_id, first_name, in_transaction, is_activated, last_name, user_id, address_id) FROM stdin;
\N	\N	Sevket	\N	\N	Gokay	1	\N
\N	\N	Wollo	\N	\N	Kluth	2	\N
1959-04-08	TestId	Test1	f	f	Customer	8	5
1999-07-08	aldjghl	lakdfh	f	t	lajkhv	12	9
\.


--
-- TOC entry 2441 (class 0 OID 59176)
-- Dependencies: 193
-- Data for Name: t_major_customer; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_major_customer (user_id, name) FROM stdin;
3	major tom
\.


--
-- TOC entry 2435 (class 0 OID 59045)
-- Dependencies: 187
-- Data for Name: t_manager; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_manager (user_id) FROM stdin;
6
\.


--
-- TOC entry 2436 (class 0 OID 59048)
-- Dependencies: 188
-- Data for Name: t_pedelec; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_pedelec (pedelec_id, in_transaction, manufacturer_id, state, state_of_charge, error_code, error_info, created, updated) FROM stdin;
1	f	agfg	OPERATIVE	0	\N	\N	2014-11-24 15:46:08.723+01	2014-11-24 15:46:08.723+01
2	f	iksgFSf	OPERATIVE	0	\N	\N	2014-11-24 15:46:17.875+01	2014-11-24 15:46:17.875+01
3	f	agdgadg	OPERATIVE	0	\N	\N	2014-11-24 15:46:23.163+01	2014-11-24 15:46:23.163+01
13	f	1	OPERATIVE	0	\N	\N	2015-02-10 13:27:44.73+01	2015-02-10 13:27:44.73+01
15	f	3	OPERATIVE	0	\N	\N	2015-02-10 13:27:51.628+01	2015-02-10 13:27:51.628+01
16	f	4	OPERATIVE	0	\N	\N	2015-02-10 13:27:53.552+01	2015-02-10 13:27:53.552+01
17	f	5	OPERATIVE	0	\N	\N	2015-02-10 13:27:55.826+01	2015-02-10 13:27:55.826+01
20	f	8	OPERATIVE	0	\N	\N	2015-02-10 13:28:03.094+01	2015-02-10 13:28:03.094+01
22	f	10	OPERATIVE	0	\N	\N	2015-02-10 13:28:08.706+01	2015-02-10 14:05:32.318+01
21	f	9	OPERATIVE	0	\N	\N	2015-02-10 13:28:05.103+01	2015-02-10 14:28:27.526+01
19	f	7	OPERATIVE	0	\N	\N	2015-02-10 13:28:01.071+01	2015-02-10 14:38:51.862+01
14	f	2	OPERATIVE	0	\N	\N	2015-02-10 13:27:47.205+01	2015-02-10 14:40:00.038+01
18	f	6	OPERATIVE	0	\N	\N	2015-02-10 13:27:57.654+01	2015-02-10 14:43:32.277+01
\.


--
-- TOC entry 2425 (class 0 OID 58981)
-- Dependencies: 177
-- Data for Name: t_persistent_audit_event; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_persistent_audit_event (event_id, principal, event_date, event_type) FROM stdin;
1	admin@bikeman.com	2014-11-20	AUTHENTICATION_SUCCESS
32768	admin@bikeman.com	2014-11-24	AUTHENTICATION_SUCCESS
\.


--
-- TOC entry 2426 (class 0 OID 58986)
-- Dependencies: 178
-- Data for Name: t_persistent_audit_event_data; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_persistent_audit_event_data (event_id, name, value) FROM stdin;
\.


--
-- TOC entry 2423 (class 0 OID 58954)
-- Dependencies: 175
-- Data for Name: t_persistent_token; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_persistent_token (series, user_id, token_value, token_date, ip_address, user_agent) FROM stdin;
\.


--
-- TOC entry 2444 (class 0 OID 59224)
-- Dependencies: 196
-- Data for Name: t_reservation; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_reservation (reservation_id, card_account_id, start_datetime, end_datetime, pedelec_id) FROM stdin;
5	1	2014-11-26 13:08:17.054+01	2014-11-26 13:28:17.054+01	2
7	1	2014-11-26 13:32:05.551+01	2014-11-26 13:32:05.551+01	2
8	1	2014-11-26 13:32:34.465+01	2014-11-26 13:32:34.465+01	2
9	1	2014-11-26 13:32:50.897+01	2014-11-26 13:43:50.897+01	2
10	1	2014-11-26 14:41:38.831+01	2014-11-26 15:52:38.831+01	2
11	1	2014-11-26 14:56:05.39+01	2014-11-26 16:07:05.39+01	1
14	1	2014-12-03 12:52:24.274+01	2014-12-03 13:12:24.274+01	3
15	1	2014-12-03 12:55:01.126+01	2014-12-03 13:15:01.126+01	2
\.


--
-- TOC entry 2437 (class 0 OID 59054)
-- Dependencies: 189
-- Data for Name: t_station; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_station (station_id, location_latitude, location_longitude, manufacturer_id, name, note, state, address_id, firmware_version, error_code, error_info, endpoint_address, created, updated) FROM stdin;
5	23.240000000000000000	25.230000000000000000	afgahdfa	teststation1	note	OPERATIVE	11	\N	\N	\N	\N	2015-02-10 13:19:23.772+01	2015-02-10 13:19:23.772+01
6	23.490000000000000000	24.200000000000000000	aghglujdag	teststation2	\N	OPERATIVE	12	\N	\N	\N	\N	2015-02-10 13:19:46.986+01	2015-02-10 13:19:46.986+01
7	45.200000000000000000	6.700000000000000000	agljhadg	teststation3	\N	OPERATIVE	13	\N	\N	\N	\N	2015-02-10 13:20:11.952+01	2015-02-10 13:20:11.952+01
8	24.540000000000000000	7.600000000000000000	agokjaglad	teststation4	\N	OPERATIVE	14	\N	\N	\N	\N	2015-02-10 13:20:34.592+01	2015-02-10 13:20:34.592+01
9	67.200000000000000000	7.500000000000000000	akdghlaj	teststation5	\N	OPERATIVE	15	\N	\N	\N	\N	2015-02-10 13:20:53.328+01	2015-02-10 13:20:53.328+01
\.


--
-- TOC entry 2438 (class 0 OID 59060)
-- Dependencies: 190
-- Data for Name: t_station_slot; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_station_slot (station_slot_id, is_occupied, manufacturer_id, state, station_slot_position, pedelec_id, station_id, error_code, error_info) FROM stdin;
21	f	16	OPERATIVE	1	\N	8	\N	\N
18	f	13	OPERATIVE	3	20	7	\N	\N
19	f	14	OPERATIVE	4	\N	7	\N	\N
6	f	1	OPERATIVE	1	13	5	\N	\N
8	f	3	OPERATIVE	3	15	5	\N	\N
10	f	5	OPERATIVE	5	17	5	\N	\N
9	f	4	OPERATIVE	4	16	5	\N	\N
12	f	7	OPERATIVE	2	\N	6	\N	\N
14	f	9	OPERATIVE	4	\N	6	\N	\N
11	f	6	OPERATIVE	1	\N	6	\N	\N
13	f	8	OPERATIVE	3	\N	6	\N	\N
17	f	12	OPERATIVE	2	\N	7	\N	\N
29	f	24	OPERATIVE	4	\N	9	\N	\N
27	f	22	OPERATIVE	2	\N	9	\N	\N
23	f	18	OPERATIVE	3	\N	8	\N	\N
24	f	19	OPERATIVE	4	\N	8	\N	\N
15	f	10	OPERATIVE	5	\N	6	\N	\N
16	f	11	OPERATIVE	1	21	7	\N	\N
20	f	15	OPERATIVE	5	\N	7	\N	\N
30	f	25	OPERATIVE	5	22	9	\N	\N
22	f	17	OPERATIVE	2	\N	8	\N	\N
25	t	20	OPERATIVE	5	19	8	\N	\N
7	t	2	OPERATIVE	2	14	5	\N	\N
28	f	23	OPERATIVE	3	\N	9	\N	\N
26	t	21	OPERATIVE	1	18	9	\N	\N
\.


--
-- TOC entry 2446 (class 0 OID 70399)
-- Dependencies: 198
-- Data for Name: t_tariff; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_tariff (tariff_id, tariff_type, active, mounthly_rate) FROM stdin;
1	Ticket3000	t	35
\.


--
-- TOC entry 2439 (class 0 OID 59066)
-- Dependencies: 191
-- Data for Name: t_transaction; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_transaction (transaction_id, end_datetime, start_datetime, from_slot_id, pedelec_id, to_slot_id, card_account_id, booked_tariff_id) FROM stdin;
1	2015-02-10 14:05:31.966+01	2015-02-10 14:02:12.882+01	19	22	20	7	1
2	2015-02-10 14:28:27.13+01	2015-02-10 14:28:01.329+01	26	21	16	7	1
3	2015-02-10 14:38:51.572+01	2015-02-10 14:38:33.541+01	22	19	25	7	1
4	2015-02-10 14:39:59.674+01	2015-02-10 14:39:50.722+01	7	14	7	7	1
5	2015-02-10 14:43:32.206+01	2015-02-10 14:43:30.261+01	28	18	26	7	1
\.


--
-- TOC entry 2420 (class 0 OID 58939)
-- Dependencies: 172
-- Data for Name: t_user; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_user (user_id, login, password, user_type, created, updated) FROM stdin;
1	admin@bikeman.com	$2a$10$lr6q.osI1q/VbKbN8kQmBehz1T5pAZedp.Ad/6QAq4eQdbJeJj.eO	customer	\N	\N
2	user@bikeman.com	$2a$10$D26/I7XY5.QNQfTRB7PWcuVohzV8Z80wd8PtTbuGkTogzQ3wvF8V.	customer	\N	\N
3	major1@bikeman.de	$2a$10$Hl/ohfVmIIeOX8XAIROXFu6j4SFYbeMCLb./QurTEZXo2yUXs4ysG	majorCustomer	2014-11-24 15:47:28.607+01	2014-11-24 15:47:28.607+01
6	test@tes-t.d.ea	$2a$10$DaYpCbgABx06ZEdFLvbd3.obyahFEwpEhT7X9XE8kEXF9FQqTmLBG	manager	2015-01-06 15:08:55.723+01	2015-01-06 15:08:55.723+01
8	customer@bikeman.de	$2a$10$bZg7uys7kM2RGZ7DoR9le.ifC5.IuLcskIJLNi0JKg.SbpWbbbZKy	customer	2015-01-08 11:47:08.145+01	2015-01-08 12:07:15.499+01
12	faigja@agijhf.com	$2a$10$75TXSR4XtKrnp/CbMQd.d.gMMCvvocB.jAYa4br/UzTce4HHW2ybS	customer	2015-01-08 11:59:07.307+01	2015-01-08 12:08:10.057+01
\.


--
-- TOC entry 2422 (class 0 OID 58949)
-- Dependencies: 174
-- Data for Name: t_user_authority; Type: TABLE DATA; Schema: public; Owner: bikeman
--

COPY t_user_authority (user_id, name) FROM stdin;
1	ROLE_ADMIN
1	ROLE_MANAGER
1	ROLE_MAJOR_CUSTOMER
1	ROLE_CUSTOMER
2	ROLE_CUSTOMER
3	ROLE_MAJOR_CUSTOMER
6	ROLE_MANAGER
8	ROLE_CUSTOMER
12	ROLE_CUSTOMER
\.


--
-- TOC entry 2275 (class 2606 OID 59223)
-- Name: ixsi_client_system_ip_address_key; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY ixsi_client_system
    ADD CONSTRAINT ixsi_client_system_ip_address_key UNIQUE (ip_address);


--
-- TOC entry 2219 (class 2606 OID 58932)
-- Name: pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- TOC entry 2277 (class 2606 OID 59221)
-- Name: pk_ixsi_client_system; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY ixsi_client_system
    ADD CONSTRAINT pk_ixsi_client_system PRIMARY KEY (system_id);


--
-- TOC entry 2273 (class 2606 OID 59203)
-- Name: pk_ixsi_token; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY ixsi_token
    ADD CONSTRAINT pk_ixsi_token PRIMARY KEY (token_id);


--
-- TOC entry 2239 (class 2606 OID 59005)
-- Name: pk_oauth_client_details; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY oauth_client_details
    ADD CONSTRAINT pk_oauth_client_details PRIMARY KEY (client_id);


--
-- TOC entry 2226 (class 2606 OID 58948)
-- Name: pk_t_authority; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_authority
    ADD CONSTRAINT pk_t_authority PRIMARY KEY (name);


--
-- TOC entry 2285 (class 2606 OID 70408)
-- Name: pk_t_booked_tariff; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_booked_tariff
    ADD CONSTRAINT pk_t_booked_tariff PRIMARY KEY (booked_tariff_id);


--
-- TOC entry 2281 (class 2606 OID 59243)
-- Name: pk_t_booking; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_booking
    ADD CONSTRAINT pk_t_booking PRIMARY KEY (booking_id);


--
-- TOC entry 2234 (class 2606 OID 58985)
-- Name: pk_t_persistent_audit_event; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_persistent_audit_event
    ADD CONSTRAINT pk_t_persistent_audit_event PRIMARY KEY (event_id);


--
-- TOC entry 2231 (class 2606 OID 58961)
-- Name: pk_t_persistent_token; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_persistent_token
    ADD CONSTRAINT pk_t_persistent_token PRIMARY KEY (series);


--
-- TOC entry 2279 (class 2606 OID 59228)
-- Name: pk_t_reservation; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_reservation
    ADD CONSTRAINT pk_t_reservation PRIMARY KEY (reservation_id);


--
-- TOC entry 2283 (class 2606 OID 70403)
-- Name: pk_t_tariff; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_tariff
    ADD CONSTRAINT pk_t_tariff PRIMARY KEY (tariff_id);


--
-- TOC entry 2222 (class 2606 OID 58943)
-- Name: pk_t_user; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_user
    ADD CONSTRAINT pk_t_user PRIMARY KEY (user_id);


--
-- TOC entry 2241 (class 2606 OID 59070)
-- Name: t_addresspk; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_address
    ADD CONSTRAINT t_addresspk PRIMARY KEY (address_id);


--
-- TOC entry 2267 (class 2606 OID 59194)
-- Name: t_card_account_card_id_key; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_card_account
    ADD CONSTRAINT t_card_account_card_id_key UNIQUE (card_id);


--
-- TOC entry 2269 (class 2606 OID 59152)
-- Name: t_cardaccpk; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_card_account
    ADD CONSTRAINT t_cardaccpk PRIMARY KEY (card_account_id);


--
-- TOC entry 2243 (class 2606 OID 59072)
-- Name: t_customerpk; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_customer
    ADD CONSTRAINT t_customerpk PRIMARY KEY (user_id);


--
-- TOC entry 2271 (class 2606 OID 59180)
-- Name: t_majorcustomerpk; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_major_customer
    ADD CONSTRAINT t_majorcustomerpk PRIMARY KEY (user_id);


--
-- TOC entry 2249 (class 2606 OID 59074)
-- Name: t_managerpk; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_manager
    ADD CONSTRAINT t_managerpk PRIMARY KEY (user_id);


--
-- TOC entry 2251 (class 2606 OID 59076)
-- Name: t_pedelecpk; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_pedelec
    ADD CONSTRAINT t_pedelecpk PRIMARY KEY (pedelec_id);


--
-- TOC entry 2237 (class 2606 OID 58990)
-- Name: t_persistent_audit_event_data_pkey; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_persistent_audit_event_data
    ADD CONSTRAINT t_persistent_audit_event_data_pkey PRIMARY KEY (event_id, name);


--
-- TOC entry 2258 (class 2606 OID 59080)
-- Name: t_station_slopk; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_station_slot
    ADD CONSTRAINT t_station_slopk PRIMARY KEY (station_slot_id);


--
-- TOC entry 2253 (class 2606 OID 59078)
-- Name: t_stationpk; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_station
    ADD CONSTRAINT t_stationpk PRIMARY KEY (station_id);


--
-- TOC entry 2265 (class 2606 OID 59082)
-- Name: t_transactionpk; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_transaction
    ADD CONSTRAINT t_transactionpk PRIMARY KEY (transaction_id);


--
-- TOC entry 2229 (class 2606 OID 58953)
-- Name: t_user_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_user_authority
    ADD CONSTRAINT t_user_authority_pkey PRIMARY KEY (user_id, name);


--
-- TOC entry 2245 (class 2606 OID 59134)
-- Name: uc_t_customer_address_id; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_customer
    ADD CONSTRAINT uc_t_customer_address_id UNIQUE (address_id);


--
-- TOC entry 2247 (class 2606 OID 59145)
-- Name: uc_t_customer_customer_id; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_customer
    ADD CONSTRAINT uc_t_customer_customer_id UNIQUE (customer_id);


--
-- TOC entry 2255 (class 2606 OID 59136)
-- Name: uc_t_station_address_id; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_station
    ADD CONSTRAINT uc_t_station_address_id UNIQUE (address_id);


--
-- TOC entry 2260 (class 2606 OID 59138)
-- Name: uc_t_station_slot_pedelec_id; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_station_slot
    ADD CONSTRAINT uc_t_station_slot_pedelec_id UNIQUE (pedelec_id);


--
-- TOC entry 2224 (class 2606 OID 59147)
-- Name: uc_t_user_login; Type: CONSTRAINT; Schema: public; Owner: bikeman; Tablespace: 
--

ALTER TABLE ONLY t_user
    ADD CONSTRAINT uc_t_user_login UNIQUE (login);


--
-- TOC entry 2232 (class 1259 OID 58991)
-- Name: idx_persistent_audit_event; Type: INDEX; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE INDEX idx_persistent_audit_event ON t_persistent_audit_event USING btree (principal, event_date);


--
-- TOC entry 2235 (class 1259 OID 58992)
-- Name: idx_persistent_audit_event_data; Type: INDEX; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE INDEX idx_persistent_audit_event_data ON t_persistent_audit_event_data USING btree (event_id);


--
-- TOC entry 2256 (class 1259 OID 59139)
-- Name: idx_t_station_slot_station_id; Type: INDEX; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE INDEX idx_t_station_slot_station_id ON t_station_slot USING btree (station_id);


--
-- TOC entry 2261 (class 1259 OID 59142)
-- Name: idx_t_transaction_from_slot_id; Type: INDEX; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE INDEX idx_t_transaction_from_slot_id ON t_transaction USING btree (from_slot_id);


--
-- TOC entry 2262 (class 1259 OID 59141)
-- Name: idx_t_transaction_pedelec_id; Type: INDEX; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE INDEX idx_t_transaction_pedelec_id ON t_transaction USING btree (pedelec_id);


--
-- TOC entry 2263 (class 1259 OID 59143)
-- Name: idx_t_transaction_to_slot_id; Type: INDEX; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE INDEX idx_t_transaction_to_slot_id ON t_transaction USING btree (to_slot_id);


--
-- TOC entry 2227 (class 1259 OID 58965)
-- Name: idx_user_authority; Type: INDEX; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE UNIQUE INDEX idx_user_authority ON t_user_authority USING btree (user_id, name);


--
-- TOC entry 2220 (class 1259 OID 59195)
-- Name: idx_user_login; Type: INDEX; Schema: public; Owner: bikeman; Tablespace: 
--

CREATE INDEX idx_user_login ON t_user USING btree (login);


--
-- TOC entry 2296 (class 2606 OID 59083)
-- Name: FK_3vlrj8gl76aiikbebu8jjjil8; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_transaction
    ADD CONSTRAINT "FK_3vlrj8gl76aiikbebu8jjjil8" FOREIGN KEY (pedelec_id) REFERENCES t_pedelec(pedelec_id);


--
-- TOC entry 2290 (class 2606 OID 59088)
-- Name: FK_9ibfn58xursjfsdei415t5j0r; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_customer
    ADD CONSTRAINT "FK_9ibfn58xursjfsdei415t5j0r" FOREIGN KEY (user_id) REFERENCES t_user(user_id);


--
-- TOC entry 2289 (class 2606 OID 58993)
-- Name: FK_event_persistent_audit_event_data; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_persistent_audit_event_data
    ADD CONSTRAINT "FK_event_persistent_audit_event_data" FOREIGN KEY (event_id) REFERENCES t_persistent_audit_event(event_id);


--
-- TOC entry 2297 (class 2606 OID 59098)
-- Name: FK_fm9359xne09h8exlrn83rquk1; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_transaction
    ADD CONSTRAINT "FK_fm9359xne09h8exlrn83rquk1" FOREIGN KEY (to_slot_id) REFERENCES t_station_slot(station_slot_id);


--
-- TOC entry 2291 (class 2606 OID 59103)
-- Name: FK_lcbxy0yb275b9urru0eqpxb5h; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_customer
    ADD CONSTRAINT "FK_lcbxy0yb275b9urru0eqpxb5h" FOREIGN KEY (address_id) REFERENCES t_address(address_id);


--
-- TOC entry 2294 (class 2606 OID 59108)
-- Name: FK_m461pdudqjo52j1pdk0n041nc; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_station_slot
    ADD CONSTRAINT "FK_m461pdudqjo52j1pdk0n041nc" FOREIGN KEY (pedelec_id) REFERENCES t_pedelec(pedelec_id);


--
-- TOC entry 2295 (class 2606 OID 59113)
-- Name: FK_ontswc3cendmxvcpsopeeu2an; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_station_slot
    ADD CONSTRAINT "FK_ontswc3cendmxvcpsopeeu2an" FOREIGN KEY (station_id) REFERENCES t_station(station_id);


--
-- TOC entry 2298 (class 2606 OID 59118)
-- Name: FK_p9nwsp1g2e4m2vrrs5lr7wym4; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_transaction
    ADD CONSTRAINT "FK_p9nwsp1g2e4m2vrrs5lr7wym4" FOREIGN KEY (from_slot_id) REFERENCES t_station_slot(station_slot_id);


--
-- TOC entry 2292 (class 2606 OID 59123)
-- Name: FK_s9nqaht6e92xx2qwij4w6cbx6; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_manager
    ADD CONSTRAINT "FK_s9nqaht6e92xx2qwij4w6cbx6" FOREIGN KEY (user_id) REFERENCES t_user(user_id);


--
-- TOC entry 2293 (class 2606 OID 59128)
-- Name: FK_ssq9hlkby7cdmaqt6dr0evxcu; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_station
    ADD CONSTRAINT "FK_ssq9hlkby7cdmaqt6dr0evxcu" FOREIGN KEY (address_id) REFERENCES t_address(address_id);


--
-- TOC entry 2286 (class 2606 OID 58966)
-- Name: fk_authority_name; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_user_authority
    ADD CONSTRAINT fk_authority_name FOREIGN KEY (name) REFERENCES t_authority(name);


--
-- TOC entry 2309 (class 2606 OID 70414)
-- Name: fk_booked_tariff_card_account; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_booked_tariff
    ADD CONSTRAINT fk_booked_tariff_card_account FOREIGN KEY (card_account_id) REFERENCES t_card_account(card_account_id);


--
-- TOC entry 2308 (class 2606 OID 70409)
-- Name: fk_booked_tariff_tariff; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_booked_tariff
    ADD CONSTRAINT fk_booked_tariff_tariff FOREIGN KEY (tariff_id) REFERENCES t_tariff(tariff_id);


--
-- TOC entry 2310 (class 2606 OID 70419)
-- Name: fk_booked_tariff_used_card_account; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_booked_tariff
    ADD CONSTRAINT fk_booked_tariff_used_card_account FOREIGN KEY (used_card_account_id) REFERENCES t_card_account(card_account_id);


--
-- TOC entry 2304 (class 2606 OID 59229)
-- Name: fk_cardacc_reservation; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_reservation
    ADD CONSTRAINT fk_cardacc_reservation FOREIGN KEY (card_account_id) REFERENCES t_card_account(card_account_id);


--
-- TOC entry 2299 (class 2606 OID 59158)
-- Name: fk_cardacc_transaction; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_transaction
    ADD CONSTRAINT fk_cardacc_transaction FOREIGN KEY (card_account_id) REFERENCES t_card_account(card_account_id);


--
-- TOC entry 2303 (class 2606 OID 59269)
-- Name: fk_ixsi_token_card_acc_id; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY ixsi_token
    ADD CONSTRAINT fk_ixsi_token_card_acc_id FOREIGN KEY (card_account_id) REFERENCES t_card_account(card_account_id);


--
-- TOC entry 2302 (class 2606 OID 59181)
-- Name: fk_majorcustomer_user; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_major_customer
    ADD CONSTRAINT fk_majorcustomer_user FOREIGN KEY (user_id) REFERENCES t_user(user_id);


--
-- TOC entry 2305 (class 2606 OID 59234)
-- Name: fk_pedelec_reservation; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_reservation
    ADD CONSTRAINT fk_pedelec_reservation FOREIGN KEY (pedelec_id) REFERENCES t_pedelec(pedelec_id);


--
-- TOC entry 2306 (class 2606 OID 59244)
-- Name: fk_reservation_booking; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_booking
    ADD CONSTRAINT fk_reservation_booking FOREIGN KEY (reservation_id) REFERENCES t_reservation(reservation_id);


--
-- TOC entry 2300 (class 2606 OID 70424)
-- Name: fk_transaction_booked_tariff; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_transaction
    ADD CONSTRAINT fk_transaction_booked_tariff FOREIGN KEY (booked_tariff_id) REFERENCES t_booked_tariff(booked_tariff_id);


--
-- TOC entry 2307 (class 2606 OID 59249)
-- Name: fk_transaction_booking; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_booking
    ADD CONSTRAINT fk_transaction_booking FOREIGN KEY (transaction_id) REFERENCES t_transaction(transaction_id);


--
-- TOC entry 2301 (class 2606 OID 59153)
-- Name: fk_user_cardacc; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_card_account
    ADD CONSTRAINT fk_user_cardacc FOREIGN KEY (user_id) REFERENCES t_user(user_id);


--
-- TOC entry 2288 (class 2606 OID 58976)
-- Name: fk_user_persistent_token; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_persistent_token
    ADD CONSTRAINT fk_user_persistent_token FOREIGN KEY (user_id) REFERENCES t_user(user_id);


--
-- TOC entry 2287 (class 2606 OID 58971)
-- Name: fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bikeman
--

ALTER TABLE ONLY t_user_authority
    ADD CONSTRAINT fk_user_user_id FOREIGN KEY (user_id) REFERENCES t_user(user_id);


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: max
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM max;
GRANT ALL ON SCHEMA public TO max;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-02-10 14:44:45 CET

--
-- PostgreSQL database dump complete
--

