--
-- PostgreSQL database dump
--

\restrict chcfDGiWlDm93W2GkhhBlT9Dxn3Tv2CZa6bumo7ZazzxrdPzppvWHHdAgB4I8rr

-- Dumped from database version 14.24
-- Dumped by pg_dump version 14.24

-- Started on 2026-10-08 11:57:14

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
-- TOC entry 5 (class 2615 OID 24577)
-- Name: staging; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA staging;


ALTER SCHEMA staging OWNER TO postgres;

--
-- TOC entry 4 (class 2615 OID 24578)
-- Name: warehouse; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA warehouse;


ALTER SCHEMA warehouse OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 24579)
-- Name: ventes_brutes; Type: TABLE; Schema: staging; Owner: postgres
--

CREATE TABLE staging.ventes_brutes (
    id_commande character varying(50),
    date_commande character varying(50),
    produit character varying(100),
    categorie character varying(100),
    quantite character varying(50),
    prix_unitaire character varying(50),
    ville character varying(100)
);


ALTER TABLE staging.ventes_brutes OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24598)
-- Name: dim_date; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.dim_date (
    id_date date NOT NULL,
    annee integer,
    mois integer,
    jour integer
);


ALTER TABLE warehouse.dim_date OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24590)
-- Name: dim_produit; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.dim_produit (
    id_produit integer NOT NULL,
    produit character varying(100),
    categorie character varying(100)
);


ALTER TABLE warehouse.dim_produit OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24589)
-- Name: dim_produit_id_produit_seq; Type: SEQUENCE; Schema: warehouse; Owner: postgres
--

CREATE SEQUENCE warehouse.dim_produit_id_produit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE warehouse.dim_produit_id_produit_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 213
-- Name: dim_produit_id_produit_seq; Type: SEQUENCE OWNED BY; Schema: warehouse; Owner: postgres
--

ALTER SEQUENCE warehouse.dim_produit_id_produit_seq OWNED BY warehouse.dim_produit.id_produit;


--
-- TOC entry 217 (class 1259 OID 24604)
-- Name: dim_ville; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.dim_ville (
    id_ville integer NOT NULL,
    ville character varying(100)
);


ALTER TABLE warehouse.dim_ville OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24603)
-- Name: dim_ville_id_ville_seq; Type: SEQUENCE; Schema: warehouse; Owner: postgres
--

CREATE SEQUENCE warehouse.dim_ville_id_ville_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE warehouse.dim_ville_id_ville_seq OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 216
-- Name: dim_ville_id_ville_seq; Type: SEQUENCE OWNED BY; Schema: warehouse; Owner: postgres
--

ALTER SEQUENCE warehouse.dim_ville_id_ville_seq OWNED BY warehouse.dim_ville.id_ville;


--
-- TOC entry 218 (class 1259 OID 24612)
-- Name: fait_ventes; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.fait_ventes (
    id_commande character varying(50) NOT NULL,
    id_produit integer,
    id_date date,
    id_ville integer,
    quantite integer,
    prix_unitaire numeric(12,2),
    chiffre_affaires numeric(14,2)
);


ALTER TABLE warehouse.fait_ventes OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24584)
-- Name: ventes; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.ventes (
    id_commande character varying(50) NOT NULL,
    date_commande date,
    produit character varying(100),
    categorie character varying(100),
    quantite integer,
    prix_unitaire numeric(12,2),
    ville character varying(100),
    chiffre_affaires numeric(14,2)
);


ALTER TABLE warehouse.ventes OWNER TO postgres;

--
-- TOC entry 3187 (class 2604 OID 24593)
-- Name: dim_produit id_produit; Type: DEFAULT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.dim_produit ALTER COLUMN id_produit SET DEFAULT nextval('warehouse.dim_produit_id_produit_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 24607)
-- Name: dim_ville id_ville; Type: DEFAULT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.dim_ville ALTER COLUMN id_ville SET DEFAULT nextval('warehouse.dim_ville_id_ville_seq'::regclass);


--
-- TOC entry 3196 (class 2606 OID 24602)
-- Name: dim_date dim_date_pkey; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.dim_date
    ADD CONSTRAINT dim_date_pkey PRIMARY KEY (id_date);


--
-- TOC entry 3192 (class 2606 OID 24595)
-- Name: dim_produit dim_produit_pkey; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.dim_produit
    ADD CONSTRAINT dim_produit_pkey PRIMARY KEY (id_produit);


--
-- TOC entry 3194 (class 2606 OID 24597)
-- Name: dim_produit dim_produit_produit_categorie_key; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.dim_produit
    ADD CONSTRAINT dim_produit_produit_categorie_key UNIQUE (produit, categorie);


--
-- TOC entry 3198 (class 2606 OID 24609)
-- Name: dim_ville dim_ville_pkey; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.dim_ville
    ADD CONSTRAINT dim_ville_pkey PRIMARY KEY (id_ville);


--
-- TOC entry 3200 (class 2606 OID 24611)
-- Name: dim_ville dim_ville_ville_key; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.dim_ville
    ADD CONSTRAINT dim_ville_ville_key UNIQUE (ville);


--
-- TOC entry 3202 (class 2606 OID 24616)
-- Name: fait_ventes fait_ventes_pkey; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.fait_ventes
    ADD CONSTRAINT fait_ventes_pkey PRIMARY KEY (id_commande);


--
-- TOC entry 3190 (class 2606 OID 24588)
-- Name: ventes ventes_pkey; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.ventes
    ADD CONSTRAINT ventes_pkey PRIMARY KEY (id_commande);


--
-- TOC entry 3204 (class 2606 OID 24622)
-- Name: fait_ventes fait_ventes_id_date_fkey; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.fait_ventes
    ADD CONSTRAINT fait_ventes_id_date_fkey FOREIGN KEY (id_date) REFERENCES warehouse.dim_date(id_date);


--
-- TOC entry 3203 (class 2606 OID 24617)
-- Name: fait_ventes fait_ventes_id_produit_fkey; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.fait_ventes
    ADD CONSTRAINT fait_ventes_id_produit_fkey FOREIGN KEY (id_produit) REFERENCES warehouse.dim_produit(id_produit);


--
-- TOC entry 3205 (class 2606 OID 24627)
-- Name: fait_ventes fait_ventes_id_ville_fkey; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.fait_ventes
    ADD CONSTRAINT fait_ventes_id_ville_fkey FOREIGN KEY (id_ville) REFERENCES warehouse.dim_ville(id_ville);


-- Completed on 2026-10-08 11:57:15

--
-- PostgreSQL database dump complete
--

\unrestrict chcfDGiWlDm93W2GkhhBlT9Dxn3Tv2CZa6bumo7ZazzxrdPzppvWHHdAgB4I8rr

