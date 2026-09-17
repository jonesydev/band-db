--
-- PostgreSQL database dump
--

\restrict lUHiSHw3GEqbbVwiMB0swnM2AY9BZBsPRrqWGcDObYK7awYWgWqeAkJQz0cCV04

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

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
-- Name: pg_jsonschema; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_jsonschema WITH SCHEMA public;


--
-- Name: EXTENSION pg_jsonschema; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_jsonschema IS 'pg_jsonschema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    album_id bigint NOT NULL,
    album_name text,
    release_date date,
    label text,
    personnel jsonb,
    artist_id bigint NOT NULL,
    CONSTRAINT check_column_schema CHECK (public.jsonb_matches_schema('{
      "name": "string",
      "role": "string"     
   }'::json, personnel))
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: albums_album_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.albums ALTER COLUMN album_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.albums_album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    artist_id bigint NOT NULL,
    artist_name text,
    albums jsonb,
    styles text[],
    influences text[],
    CONSTRAINT check_column_schema CHECK (public.jsonb_matches_schema('{
      "name": "string",
      "year": "int"     
   }'::json, albums))
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- Name: artists_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.artists ALTER COLUMN artist_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.artists_artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.labels (
    label_id bigint NOT NULL,
    label_name text,
    year_founded integer,
    founder text[],
    artists text[],
    is_active boolean,
    year_ended integer,
    origin text,
    albums text[]
);


ALTER TABLE public.labels OWNER TO postgres;

--
-- Name: labels_label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.labels ALTER COLUMN label_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.labels_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    member_id bigint NOT NULL,
    first_name text,
    middle_name text,
    last_name text,
    known_as text,
    date_of_birth date,
    date_of_death date,
    age integer,
    origin text,
    other_projects jsonb,
    influences text[],
    years_with_artist text,
    role text[]
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Name: members_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.members ALTER COLUMN member_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.members_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- Name: labels labels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT labels_pkey PRIMARY KEY (label_id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (member_id);


--
-- Name: albums fk_albums_artists; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT fk_albums_artists FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO jonesy;


--
-- Name: TABLE albums; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.albums TO jonesy;


--
-- Name: TABLE artists; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.artists TO jonesy;


--
-- Name: TABLE labels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.labels TO jonesy;


--
-- Name: TABLE members; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.members TO jonesy;


--
-- PostgreSQL database dump complete
--

\unrestrict lUHiSHw3GEqbbVwiMB0swnM2AY9BZBsPRrqWGcDObYK7awYWgWqeAkJQz0cCV04

