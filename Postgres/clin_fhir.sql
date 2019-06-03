--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 11.2

-- Started on 2019-05-31 14:41:18 EDT
SET client_encoding = 'UTF8';

--
-- TOC entry 5393 (class 1262 OID 16384)
-- Name: fhirbase; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE clin_fhir WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE clin_fhir OWNER TO postgres;

\connect clin_fhir

--
-- TOC entry 829 (class 1247 OID 16423)
-- Name: resource_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.resource_status AS ENUM (
    'created',
    'updated',
    'deleted',
    'recreated'
);


ALTER TYPE public.resource_status OWNER TO postgres;

--
-- ClinicalImpression
--
CREATE TABLE public.clinicalimpression (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'ClinicalImpression'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.clinicalimpression OWNER TO postgres;

CREATE TABLE public.clinicalimpression_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'ClinicalImpression'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.clinicalimpression_history OWNER TO postgres;

ALTER TABLE ONLY public.clinicalimpression_history
    ADD CONSTRAINT clinicalimpression_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.clinicalimpression
    ADD CONSTRAINT clinicalimpression_pkey PRIMARY KEY (id);
--
-- FamilyMemberHistory
--
CREATE TABLE public.familymemberhistory (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'FamilyMemberHistory'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.familymemberhistory OWNER TO postgres;

CREATE TABLE public.familymemberhistory_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'FamilyMemberHistory'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.familymemberhistory_history OWNER TO postgres;

ALTER TABLE ONLY public.familymemberhistory_history
    ADD CONSTRAINT familymemberhistory_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.familymemberhistory
    ADD CONSTRAINT familymemberhistory_pkey PRIMARY KEY (id);
--
-- Group
--
CREATE TABLE public."group" (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Group'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public."group" OWNER TO postgres;

CREATE TABLE public.group_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Group'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);

ALTER TABLE public.group_history OWNER TO postgres;

ALTER TABLE ONLY public.group_history
    ADD CONSTRAINT group_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.group
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);

--
-- Observation
--
CREATE TABLE public.observation (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Observation'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);

ALTER TABLE public.observation OWNER TO postgres;

CREATE TABLE public.observation_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Observation'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);

ALTER TABLE public.observation_history OWNER TO postgres;

ALTER TABLE ONLY public.observation_history
    ADD CONSTRAINT observation_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (id);

--
-- Organization
--
CREATE TABLE public.organization (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Organization'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);

ALTER TABLE public.organization OWNER TO postgres;


CREATE TABLE public.organization_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Organization'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.organization_history OWNER TO postgres;

ALTER TABLE ONLY public.organization_history
    ADD CONSTRAINT organization_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);
--
-- Patient
--
CREATE TABLE public.patient (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Patient'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.patient OWNER TO postgres;

CREATE TABLE public.patient_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Patient'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);

ALTER TABLE public.patient_history OWNER TO postgres;

ALTER TABLE ONLY public.patient_history
    ADD CONSTRAINT patient_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);

--
-- Practitioner
--
CREATE TABLE public.practitioner (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Practitioner'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.practitioner OWNER TO postgres;

CREATE TABLE public.practitioner_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Practitioner'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.practitioner_history OWNER TO postgres;

ALTER TABLE ONLY public.practitioner_history
    ADD CONSTRAINT practitioner_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.practitioner
    ADD CONSTRAINT practitioner_pkey PRIMARY KEY (id);

--
-- PractitionerRole
--
CREATE TABLE public.practitionerrole (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'PractitionerRole'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.practitionerrole OWNER TO postgres;

CREATE TABLE public.practitionerrole_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'PractitionerRole'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);

ALTER TABLE public.practitionerrole_history OWNER TO postgres;

ALTER TABLE ONLY public.practitionerrole_history
    ADD CONSTRAINT practitionerrole_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.practitionerrole
    ADD CONSTRAINT practitionerrole_pkey PRIMARY KEY (id);

--
-- ResearchStudy
--
CREATE TABLE public.researchstudy (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'ResearchStudy'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.researchstudy OWNER TO postgres;

CREATE TABLE public.researchstudy_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'ResearchStudy'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.researchstudy_history OWNER TO postgres;

ALTER TABLE ONLY public.researchstudy_history
    ADD CONSTRAINT researchstudy_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.researchstudy
    ADD CONSTRAINT researchstudy_pkey PRIMARY KEY (id);

--
-- ServiceRequest
--
CREATE TABLE public.servicerequest (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'ServiceRequest'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.servicerequest OWNER TO postgres;

CREATE TABLE public.servicerequest_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'ServiceRequest'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);

ALTER TABLE public.servicerequest_history OWNER TO postgres;

ALTER TABLE ONLY public.servicerequest_history
    ADD CONSTRAINT servicerequest_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.servicerequest
    ADD CONSTRAINT servicerequest_pkey PRIMARY KEY (id);

--
-- Specimen
--
CREATE TABLE public.specimen (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Specimen'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.specimen OWNER TO postgres;

CREATE TABLE public.specimen_history (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Specimen'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


ALTER TABLE public.specimen_history OWNER TO postgres;

ALTER TABLE ONLY public.specimen_history
    ADD CONSTRAINT specimen_history_pkey PRIMARY KEY (id, txid);

ALTER TABLE ONLY public.specimen
    ADD CONSTRAINT specimen_pkey PRIMARY KEY (id);