--
-- PostgreSQL database dump
--

\restrict TLEtfBfHZo95mXQzvb1WyBMs5jlWe0ACYkkX8ZX2KRcBozIlgJZEhJjZE3y4rHN

-- Dumped from database version 17.6 (Ubuntu 17.6-1build1)
-- Dumped by pg_dump version 17.6 (Ubuntu 17.6-1build1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS '';


--
-- Name: UserRole; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."UserRole" AS ENUM (
    'ADMIN_PUSAT',
    'ADMIN_DAERAH',
    'VERIFIKATOR',
    'PIMPINAN',
    'PESERTA'
);


ALTER TYPE public."UserRole" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: dokumen_peserta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dokumen_peserta (
    id text NOT NULL,
    registrasi_id text NOT NULL,
    periode_id text NOT NULL,
    periode_dokumen_config_id text NOT NULL,
    file_name text NOT NULL,
    file_path text NOT NULL,
    file_size_bytes integer NOT NULL,
    mime_type text NOT NULL,
    status_verifikasi text DEFAULT 'pending'::text NOT NULL,
    verified_by text,
    verified_at timestamp(3) without time zone,
    catatan_verifikasi text,
    versi integer DEFAULT 1 NOT NULL,
    is_revised boolean DEFAULT false NOT NULL,
    parent_dokumen_id text,
    metadata jsonb,
    uploaded_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
)
PARTITION BY LIST (periode_id);


ALTER TABLE public.dokumen_peserta OWNER TO postgres;

--
-- Name: TABLE dokumen_peserta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dokumen_peserta IS 'Partitioned by periode_id - partitions created dynamically per period';


--
-- Name: COLUMN dokumen_peserta.periode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dokumen_peserta.periode_id IS 'Denormalized from registrasi for partitioning';


--
-- Name: dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b (
    id text NOT NULL,
    registrasi_id text NOT NULL,
    periode_id text NOT NULL,
    periode_dokumen_config_id text NOT NULL,
    file_name text NOT NULL,
    file_path text NOT NULL,
    file_size_bytes integer NOT NULL,
    mime_type text NOT NULL,
    status_verifikasi text DEFAULT 'pending'::text NOT NULL,
    verified_by text,
    verified_at timestamp(3) without time zone,
    catatan_verifikasi text,
    versi integer DEFAULT 1 NOT NULL,
    is_revised boolean DEFAULT false NOT NULL,
    parent_dokumen_id text,
    metadata jsonb,
    uploaded_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b OWNER TO postgres;

--
-- Name: dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 (
    id text NOT NULL,
    registrasi_id text NOT NULL,
    periode_id text NOT NULL,
    periode_dokumen_config_id text NOT NULL,
    file_name text NOT NULL,
    file_path text NOT NULL,
    file_size_bytes integer NOT NULL,
    mime_type text NOT NULL,
    status_verifikasi text DEFAULT 'pending'::text NOT NULL,
    verified_by text,
    verified_at timestamp(3) without time zone,
    catatan_verifikasi text,
    versi integer DEFAULT 1 NOT NULL,
    is_revised boolean DEFAULT false NOT NULL,
    parent_dokumen_id text,
    metadata jsonb,
    uploaded_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 OWNER TO postgres;

--
-- Name: dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e (
    id text NOT NULL,
    registrasi_id text NOT NULL,
    periode_id text NOT NULL,
    periode_dokumen_config_id text NOT NULL,
    file_name text NOT NULL,
    file_path text NOT NULL,
    file_size_bytes integer NOT NULL,
    mime_type text NOT NULL,
    status_verifikasi text DEFAULT 'pending'::text NOT NULL,
    verified_by text,
    verified_at timestamp(3) without time zone,
    catatan_verifikasi text,
    versi integer DEFAULT 1 NOT NULL,
    is_revised boolean DEFAULT false NOT NULL,
    parent_dokumen_id text,
    metadata jsonb,
    uploaded_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e OWNER TO postgres;

--
-- Name: fase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fase (
    id text NOT NULL,
    kode text NOT NULL,
    nama text NOT NULL,
    urutan integer NOT NULL,
    deskripsi text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.fase OWNER TO postgres;

--
-- Name: hasil_ujian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasil_ujian (
    id text NOT NULL,
    peserta_fase_progress_id text NOT NULL,
    periode_id text NOT NULL,
    nomor_ujian text NOT NULL,
    tipe_ujian text NOT NULL,
    detail_nilai jsonb,
    ranking_keseluruhan integer,
    ranking_formasi integer,
    status_kehadiran text DEFAULT 'hadir'::text NOT NULL,
    is_lulus boolean DEFAULT false NOT NULL,
    catatan text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
)
PARTITION BY LIST (periode_id);


ALTER TABLE public.hasil_ujian OWNER TO postgres;

--
-- Name: TABLE hasil_ujian; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.hasil_ujian IS 'Partitioned by periode_id - partitions created dynamically per period';


--
-- Name: COLUMN hasil_ujian.periode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.hasil_ujian.periode_id IS 'Denormalized from registrasi for partitioning';


--
-- Name: hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b (
    id text NOT NULL,
    peserta_fase_progress_id text NOT NULL,
    periode_id text NOT NULL,
    nomor_ujian text NOT NULL,
    tipe_ujian text NOT NULL,
    detail_nilai jsonb,
    ranking_keseluruhan integer,
    ranking_formasi integer,
    status_kehadiran text DEFAULT 'hadir'::text NOT NULL,
    is_lulus boolean DEFAULT false NOT NULL,
    catatan text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b OWNER TO postgres;

--
-- Name: hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 (
    id text NOT NULL,
    peserta_fase_progress_id text NOT NULL,
    periode_id text NOT NULL,
    nomor_ujian text NOT NULL,
    tipe_ujian text NOT NULL,
    detail_nilai jsonb,
    ranking_keseluruhan integer,
    ranking_formasi integer,
    status_kehadiran text DEFAULT 'hadir'::text NOT NULL,
    is_lulus boolean DEFAULT false NOT NULL,
    catatan text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 OWNER TO postgres;

--
-- Name: hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e (
    id text NOT NULL,
    peserta_fase_progress_id text NOT NULL,
    periode_id text NOT NULL,
    nomor_ujian text NOT NULL,
    tipe_ujian text NOT NULL,
    detail_nilai jsonb,
    ranking_keseluruhan integer,
    ranking_formasi integer,
    status_kehadiran text DEFAULT 'hadir'::text NOT NULL,
    is_lulus boolean DEFAULT false NOT NULL,
    catatan text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e OWNER TO postgres;

--
-- Name: kelulusan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kelulusan (
    id text NOT NULL,
    registrasi_id text NOT NULL,
    periode_id text NOT NULL,
    tipe_pendaftaran_id text NOT NULL,
    periode_formasi_id text NOT NULL,
    status_kelulusan text DEFAULT 'pending'::text NOT NULL,
    ranking_keseluruhan integer,
    ranking_formasi integer,
    total_nilai double precision,
    catatan text,
    tanggal_pengumuman timestamp(3) without time zone,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.kelulusan OWNER TO postgres;

--
-- Name: master_formasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_formasi (
    id text NOT NULL,
    kode text NOT NULL,
    nama text NOT NULL,
    jenjang text NOT NULL,
    prodi text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.master_formasi OWNER TO postgres;

--
-- Name: master_lokasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_lokasi (
    id text NOT NULL,
    kode text NOT NULL,
    nama text NOT NULL,
    alamat text,
    provinsi_kode text NOT NULL,
    kapasitas integer,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    jenis_lokasi text
);


ALTER TABLE public.master_lokasi OWNER TO postgres;

--
-- Name: COLUMN master_lokasi.jenis_lokasi; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.master_lokasi.jenis_lokasi IS 'Jenis Lokasi: "Kantor BPS", "Kantor BKKBN", "Rumah Sakit", dll';


--
-- Name: periode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periode (
    id text NOT NULL,
    tahun integer NOT NULL,
    nama text NOT NULL,
    deskripsi text,
    tanggal_mulai timestamp(3) without time zone NOT NULL,
    tanggal_selesai timestamp(3) without time zone NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.periode OWNER TO postgres;

--
-- Name: periode_dokumen_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periode_dokumen_config (
    id text NOT NULL,
    periode_id text NOT NULL,
    tipe_pendaftaran_id text NOT NULL,
    jenis_dokumen text NOT NULL,
    nama_dokumen text NOT NULL,
    is_required boolean DEFAULT true NOT NULL,
    max_file_size_mb integer DEFAULT 2 NOT NULL,
    allowed_mime_types jsonb NOT NULL,
    deskripsi text,
    contoh_file_url text,
    urutan integer DEFAULT 0 NOT NULL,
    konfigurasi jsonb,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.periode_dokumen_config OWNER TO postgres;

--
-- Name: periode_fase_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periode_fase_config (
    id text NOT NULL,
    periode_id text NOT NULL,
    tipe_pendaftaran_id text NOT NULL,
    fase_id text NOT NULL,
    urutan_fase integer NOT NULL,
    tanggal_mulai timestamp(3) without time zone NOT NULL,
    tanggal_selesai timestamp(3) without time zone NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    konfigurasi jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.periode_fase_config OWNER TO postgres;

--
-- Name: periode_formasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periode_formasi (
    id text NOT NULL,
    periode_id text NOT NULL,
    tipe_pendaftaran_id text NOT NULL,
    master_formasi_id text NOT NULL,
    kuota integer NOT NULL,
    is_afirmasi boolean DEFAULT false NOT NULL,
    konfigurasi jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.periode_formasi OWNER TO postgres;

--
-- Name: periode_peserta_field_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periode_peserta_field_config (
    id text NOT NULL,
    periode_id text NOT NULL,
    tipe_pendaftaran_id text NOT NULL,
    field_key text NOT NULL,
    field_label text NOT NULL,
    field_type text NOT NULL,
    is_required boolean DEFAULT false NOT NULL,
    is_readonly boolean DEFAULT false NOT NULL,
    validation_rules jsonb,
    options jsonb,
    section text,
    section_label text,
    urutan integer DEFAULT 0 NOT NULL,
    placeholder text,
    help_text text,
    depends_on jsonb,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    depends_on_logic character varying(3) DEFAULT 'AND'::character varying,
    section_order integer DEFAULT 1 NOT NULL,
    CONSTRAINT periode_peserta_field_config_depends_on_logic_check CHECK (((depends_on_logic)::text = ANY (ARRAY[('AND'::character varying)::text, ('OR'::character varying)::text])))
);


ALTER TABLE public.periode_peserta_field_config OWNER TO postgres;

--
-- Name: COLUMN periode_peserta_field_config.depends_on_logic; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.periode_peserta_field_config.depends_on_logic IS 'Logic operator for multiple depends_on conditions: AND (all must be true) or OR (at least one must be true)';


--
-- Name: peserta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peserta (
    id text NOT NULL,
    user_id text,
    nik text NOT NULL,
    nama text NOT NULL,
    email text NOT NULL,
    no_hp text,
    tanggal_lahir timestamp(3) without time zone,
    tempat_lahir text,
    jenis_kelamin text,
    alamat text,
    dikdin_data jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    data_tambahan jsonb,
    email_verification_token text,
    email_verification_token_expires timestamp(3) without time zone,
    email_verified boolean DEFAULT false NOT NULL,
    email_verified_at timestamp(3) without time zone
);


ALTER TABLE public.peserta OWNER TO postgres;

--
-- Name: peserta_fase_progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peserta_fase_progress (
    id text NOT NULL,
    registrasi_id text NOT NULL,
    periode_id text NOT NULL,
    periode_fase_config_id text NOT NULL,
    status text DEFAULT 'not_started'::text NOT NULL,
    nomor_ujian text,
    jadwal_ujian_id text,
    tanggal_mulai timestamp(3) without time zone,
    tanggal_selesai timestamp(3) without time zone,
    data_fase jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
)
PARTITION BY LIST (periode_id);


ALTER TABLE public.peserta_fase_progress OWNER TO postgres;

--
-- Name: TABLE peserta_fase_progress; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.peserta_fase_progress IS 'Partitioned by periode_id - partitions created dynamically per period';


--
-- Name: COLUMN peserta_fase_progress.periode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.peserta_fase_progress.periode_id IS 'Denormalized from registrasi for partitioning';


--
-- Name: peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b (
    id text NOT NULL,
    registrasi_id text NOT NULL,
    periode_id text NOT NULL,
    periode_fase_config_id text NOT NULL,
    status text DEFAULT 'not_started'::text NOT NULL,
    nomor_ujian text,
    jadwal_ujian_id text,
    tanggal_mulai timestamp(3) without time zone,
    tanggal_selesai timestamp(3) without time zone,
    data_fase jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b OWNER TO postgres;

--
-- Name: peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 (
    id text NOT NULL,
    registrasi_id text NOT NULL,
    periode_id text NOT NULL,
    periode_fase_config_id text NOT NULL,
    status text DEFAULT 'not_started'::text NOT NULL,
    nomor_ujian text,
    jadwal_ujian_id text,
    tanggal_mulai timestamp(3) without time zone,
    tanggal_selesai timestamp(3) without time zone,
    data_fase jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 OWNER TO postgres;

--
-- Name: peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e (
    id text NOT NULL,
    registrasi_id text NOT NULL,
    periode_id text NOT NULL,
    periode_fase_config_id text NOT NULL,
    status text DEFAULT 'not_started'::text NOT NULL,
    nomor_ujian text,
    jadwal_ujian_id text,
    tanggal_mulai timestamp(3) without time zone,
    tanggal_selesai timestamp(3) without time zone,
    data_fase jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e OWNER TO postgres;

--
-- Name: provinsi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinsi (
    kode text NOT NULL,
    nama text NOT NULL
);


ALTER TABLE public.provinsi OWNER TO postgres;

--
-- Name: registrasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registrasi (
    id text NOT NULL,
    nomor_registrasi text NOT NULL,
    periode_id text NOT NULL,
    tipe_pendaftaran_id text NOT NULL,
    peserta_id text NOT NULL,
    periode_formasi_id text NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    tanggal_registrasi timestamp(3) without time zone NOT NULL,
    verifikasi_by text,
    tanggal_verifikasi timestamp(3) without time zone,
    catatan_verifikasi text,
    data_registrasi jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
)
PARTITION BY LIST (periode_id);


ALTER TABLE public.registrasi OWNER TO postgres;

--
-- Name: TABLE registrasi; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.registrasi IS 'Partitioned by periode_id - partitions created dynamically per period';


--
-- Name: registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b (
    id text NOT NULL,
    nomor_registrasi text NOT NULL,
    periode_id text NOT NULL,
    tipe_pendaftaran_id text NOT NULL,
    peserta_id text NOT NULL,
    periode_formasi_id text NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    tanggal_registrasi timestamp(3) without time zone NOT NULL,
    verifikasi_by text,
    tanggal_verifikasi timestamp(3) without time zone,
    catatan_verifikasi text,
    data_registrasi jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b OWNER TO postgres;

--
-- Name: registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 (
    id text NOT NULL,
    nomor_registrasi text NOT NULL,
    periode_id text NOT NULL,
    tipe_pendaftaran_id text NOT NULL,
    peserta_id text NOT NULL,
    periode_formasi_id text NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    tanggal_registrasi timestamp(3) without time zone NOT NULL,
    verifikasi_by text,
    tanggal_verifikasi timestamp(3) without time zone,
    catatan_verifikasi text,
    data_registrasi jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 OWNER TO postgres;

--
-- Name: registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e (
    id text NOT NULL,
    nomor_registrasi text NOT NULL,
    periode_id text NOT NULL,
    tipe_pendaftaran_id text NOT NULL,
    peserta_id text NOT NULL,
    periode_formasi_id text NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    tanggal_registrasi timestamp(3) without time zone NOT NULL,
    verifikasi_by text,
    tanggal_verifikasi timestamp(3) without time zone,
    catatan_verifikasi text,
    data_registrasi jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e OWNER TO postgres;

--
-- Name: ruangan_ujian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruangan_ujian (
    id text NOT NULL,
    periode_id text NOT NULL,
    tipe_pendaftaran_id text,
    fase_id text,
    master_lokasi_id text NOT NULL,
    kode_ruangan text NOT NULL,
    nama_ruangan text NOT NULL,
    kapasitas integer NOT NULL,
    konfigurasi jsonb,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.ruangan_ujian OWNER TO postgres;

--
-- Name: sesi_ujian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sesi_ujian (
    id text NOT NULL,
    ruangan_ujian_id text NOT NULL,
    periode_id text NOT NULL,
    fase_id text NOT NULL,
    tipe_pendaftaran_id text,
    tanggal_ujian timestamp(3) without time zone NOT NULL,
    waktu_mulai text NOT NULL,
    waktu_selesai text NOT NULL,
    sesi integer NOT NULL,
    kuota_peserta integer NOT NULL,
    terisi integer DEFAULT 0 NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    konfigurasi jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.sesi_ujian OWNER TO postgres;

--
-- Name: tipe_pendaftaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipe_pendaftaran (
    id text NOT NULL,
    kode text NOT NULL,
    nama text NOT NULL,
    deskripsi text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.tipe_pendaftaran OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    email text,
    nik text,
    password text NOT NULL,
    role public."UserRole" NOT NULL,
    nama text NOT NULL,
    no_hp text,
    is_active boolean DEFAULT true NOT NULL,
    last_login_at timestamp(3) without time zone,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dokumen_peserta ATTACH PARTITION public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b FOR VALUES IN ('155eb51e-e934-4d9a-a256-56c0a4e4302b');


--
-- Name: dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dokumen_peserta ATTACH PARTITION public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 FOR VALUES IN ('274bb26f-6fec-42ab-a804-a7ecf4f4fa89');


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dokumen_peserta ATTACH PARTITION public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e FOR VALUES IN ('5fd10cdd-a4b8-4891-84a5-e5cf34fe469e');


--
-- Name: hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasil_ujian ATTACH PARTITION public.hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b FOR VALUES IN ('155eb51e-e934-4d9a-a256-56c0a4e4302b');


--
-- Name: hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasil_ujian ATTACH PARTITION public.hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 FOR VALUES IN ('274bb26f-6fec-42ab-a804-a7ecf4f4fa89');


--
-- Name: hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasil_ujian ATTACH PARTITION public.hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e FOR VALUES IN ('5fd10cdd-a4b8-4891-84a5-e5cf34fe469e');


--
-- Name: peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peserta_fase_progress ATTACH PARTITION public.peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b FOR VALUES IN ('155eb51e-e934-4d9a-a256-56c0a4e4302b');


--
-- Name: peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peserta_fase_progress ATTACH PARTITION public.peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 FOR VALUES IN ('274bb26f-6fec-42ab-a804-a7ecf4f4fa89');


--
-- Name: peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peserta_fase_progress ATTACH PARTITION public.peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e FOR VALUES IN ('5fd10cdd-a4b8-4891-84a5-e5cf34fe469e');


--
-- Name: registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrasi ATTACH PARTITION public.registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b FOR VALUES IN ('155eb51e-e934-4d9a-a256-56c0a4e4302b');


--
-- Name: registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrasi ATTACH PARTITION public.registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 FOR VALUES IN ('274bb26f-6fec-42ab-a804-a7ecf4f4fa89');


--
-- Name: registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrasi ATTACH PARTITION public.registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e FOR VALUES IN ('5fd10cdd-a4b8-4891-84a5-e5cf34fe469e');


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: dokumen_peserta dokumen_peserta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dokumen_peserta
    ADD CONSTRAINT dokumen_peserta_pkey PRIMARY KEY (id, periode_id);


--
-- Name: dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b
    ADD CONSTRAINT dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey PRIMARY KEY (id, periode_id);


--
-- Name: dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89
    ADD CONSTRAINT dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey PRIMARY KEY (id, periode_id);


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e
    ADD CONSTRAINT dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey PRIMARY KEY (id, periode_id);


--
-- Name: fase fase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fase
    ADD CONSTRAINT fase_pkey PRIMARY KEY (id);


--
-- Name: hasil_ujian hasil_ujian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasil_ujian
    ADD CONSTRAINT hasil_ujian_pkey PRIMARY KEY (id, periode_id);


--
-- Name: hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b
    ADD CONSTRAINT hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey PRIMARY KEY (id, periode_id);


--
-- Name: hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89
    ADD CONSTRAINT hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey PRIMARY KEY (id, periode_id);


--
-- Name: hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e
    ADD CONSTRAINT hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey PRIMARY KEY (id, periode_id);


--
-- Name: kelulusan kelulusan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kelulusan
    ADD CONSTRAINT kelulusan_pkey PRIMARY KEY (id);


--
-- Name: master_formasi master_formasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_formasi
    ADD CONSTRAINT master_formasi_pkey PRIMARY KEY (id);


--
-- Name: master_lokasi master_lokasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_lokasi
    ADD CONSTRAINT master_lokasi_pkey PRIMARY KEY (id);


--
-- Name: periode_dokumen_config periode_dokumen_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_dokumen_config
    ADD CONSTRAINT periode_dokumen_config_pkey PRIMARY KEY (id);


--
-- Name: periode_fase_config periode_fase_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_fase_config
    ADD CONSTRAINT periode_fase_config_pkey PRIMARY KEY (id);


--
-- Name: periode_formasi periode_formasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_formasi
    ADD CONSTRAINT periode_formasi_pkey PRIMARY KEY (id);


--
-- Name: periode_peserta_field_config periode_peserta_field_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_peserta_field_config
    ADD CONSTRAINT periode_peserta_field_config_pkey PRIMARY KEY (id);


--
-- Name: periode periode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode
    ADD CONSTRAINT periode_pkey PRIMARY KEY (id);


--
-- Name: peserta_fase_progress peserta_fase_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peserta_fase_progress
    ADD CONSTRAINT peserta_fase_progress_pkey PRIMARY KEY (id, periode_id);


--
-- Name: peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b
    ADD CONSTRAINT peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey PRIMARY KEY (id, periode_id);


--
-- Name: peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89
    ADD CONSTRAINT peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey PRIMARY KEY (id, periode_id);


--
-- Name: peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e
    ADD CONSTRAINT peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey PRIMARY KEY (id, periode_id);


--
-- Name: peserta peserta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peserta
    ADD CONSTRAINT peserta_pkey PRIMARY KEY (id);


--
-- Name: provinsi provinsi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinsi
    ADD CONSTRAINT provinsi_pkey PRIMARY KEY (kode);


--
-- Name: registrasi registrasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrasi
    ADD CONSTRAINT registrasi_pkey PRIMARY KEY (id, periode_id);


--
-- Name: registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b
    ADD CONSTRAINT registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey PRIMARY KEY (id, periode_id);


--
-- Name: registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89
    ADD CONSTRAINT registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey PRIMARY KEY (id, periode_id);


--
-- Name: registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e
    ADD CONSTRAINT registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey PRIMARY KEY (id, periode_id);


--
-- Name: ruangan_ujian ruangan_ujian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruangan_ujian
    ADD CONSTRAINT ruangan_ujian_pkey PRIMARY KEY (id);


--
-- Name: sesi_ujian sesi_ujian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesi_ujian
    ADD CONSTRAINT sesi_ujian_pkey PRIMARY KEY (id);


--
-- Name: tipe_pendaftaran tipe_pendaftaran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipe_pendaftaran
    ADD CONSTRAINT tipe_pendaftaran_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: dokumen_peserta_periode_dokumen_config_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_periode_dokumen_config_id_idx ON ONLY public.dokumen_peserta USING btree (periode_dokumen_config_id);


--
-- Name: dokumen_peserta_155eb51e_e934_4d9_periode_dokumen_config_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_155eb51e_e934_4d9_periode_dokumen_config_id_idx ON public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (periode_dokumen_config_id);


--
-- Name: dokumen_peserta_verified_by_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_verified_by_idx ON ONLY public.dokumen_peserta USING btree (verified_by);


--
-- Name: dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e_verified_by_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e_verified_by_idx ON public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (verified_by);


--
-- Name: dokumen_peserta_status_verifikasi_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_status_verifikasi_idx ON ONLY public.dokumen_peserta USING btree (status_verifikasi);


--
-- Name: dokumen_peserta_155eb51e_e934_4d9a_a256_5_status_verifikasi_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_155eb51e_e934_4d9a_a256_5_status_verifikasi_idx ON public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (status_verifikasi);


--
-- Name: dokumen_peserta_registrasi_id_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_registrasi_id_periode_id_idx ON ONLY public.dokumen_peserta USING btree (registrasi_id, periode_id);


--
-- Name: dokumen_peserta_155eb51e_e934_4d9a_registrasi_id_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_155eb51e_e934_4d9a_registrasi_id_periode_id_idx ON public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (registrasi_id, periode_id);


--
-- Name: dokumen_peserta_parent_dokumen_id_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_parent_dokumen_id_periode_id_idx ON ONLY public.dokumen_peserta USING btree (parent_dokumen_id, periode_id);


--
-- Name: dokumen_peserta_155eb51e_e934__parent_dokumen_id_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_155eb51e_e934__parent_dokumen_id_periode_id_idx ON public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (parent_dokumen_id, periode_id);


--
-- Name: dokumen_peserta_registrasi_id_periode_dokumen_config_id_ver_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX dokumen_peserta_registrasi_id_periode_dokumen_config_id_ver_key ON ONLY public.dokumen_peserta USING btree (registrasi_id, periode_dokumen_config_id, versi, periode_id);


--
-- Name: dokumen_peserta_155eb51e_e934_registrasi_id_periode_dokumen_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX dokumen_peserta_155eb51e_e934_registrasi_id_periode_dokumen_idx ON public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (registrasi_id, periode_dokumen_config_id, versi, periode_id);


--
-- Name: dokumen_peserta_274bb26f_6fec_42a_periode_dokumen_config_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_274bb26f_6fec_42a_periode_dokumen_config_id_idx ON public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (periode_dokumen_config_id);


--
-- Name: dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f_verified_by_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f_verified_by_idx ON public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (verified_by);


--
-- Name: dokumen_peserta_274bb26f_6fec_42ab_a804_a_status_verifikasi_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_274bb26f_6fec_42ab_a804_a_status_verifikasi_idx ON public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (status_verifikasi);


--
-- Name: dokumen_peserta_274bb26f_6fec_42ab_registrasi_id_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_274bb26f_6fec_42ab_registrasi_id_periode_id_idx ON public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (registrasi_id, periode_id);


--
-- Name: dokumen_peserta_274bb26f_6fec__parent_dokumen_id_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_274bb26f_6fec__parent_dokumen_id_periode_id_idx ON public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (parent_dokumen_id, periode_id);


--
-- Name: dokumen_peserta_274bb26f_6fec_registrasi_id_periode_dokumen_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX dokumen_peserta_274bb26f_6fec_registrasi_id_periode_dokumen_idx ON public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (registrasi_id, periode_dokumen_config_id, versi, periode_id);


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34f_verified_by_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34f_verified_by_idx ON public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (verified_by);


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e_status_verifikasi_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e_status_verifikasi_idx ON public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (status_verifikasi);


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_4891_registrasi_id_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_5fd10cdd_a4b8_4891_registrasi_id_periode_id_idx ON public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (registrasi_id, periode_id);


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_489_periode_dokumen_config_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_5fd10cdd_a4b8_489_periode_dokumen_config_id_idx ON public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (periode_dokumen_config_id);


--
-- Name: dokumen_peserta_5fd10cdd_a4b8__parent_dokumen_id_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dokumen_peserta_5fd10cdd_a4b8__parent_dokumen_id_periode_id_idx ON public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (parent_dokumen_id, periode_id);


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_registrasi_id_periode_dokumen_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX dokumen_peserta_5fd10cdd_a4b8_registrasi_id_periode_dokumen_idx ON public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (registrasi_id, periode_dokumen_config_id, versi, periode_id);


--
-- Name: fase_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX fase_kode_key ON public.fase USING btree (kode);


--
-- Name: hasil_ujian_peserta_fase_progress_id_periode_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX hasil_ujian_peserta_fase_progress_id_periode_id_key ON ONLY public.hasil_ujian USING btree (peserta_fase_progress_id, periode_id);


--
-- Name: hasil_ujian_155eb51e_e934_4d9_peserta_fase_progress_id_per_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX hasil_ujian_155eb51e_e934_4d9_peserta_fase_progress_id_per_idx1 ON public.hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (peserta_fase_progress_id, periode_id);


--
-- Name: hasil_ujian_nomor_ujian_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hasil_ujian_nomor_ujian_idx ON ONLY public.hasil_ujian USING btree (nomor_ujian);


--
-- Name: hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302_nomor_ujian_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302_nomor_ujian_idx ON public.hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (nomor_ujian);


--
-- Name: hasil_ujian_tipe_ujian_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hasil_ujian_tipe_ujian_idx ON ONLY public.hasil_ujian USING btree (tipe_ujian);


--
-- Name: hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b_tipe_ujian_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b_tipe_ujian_idx ON public.hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (tipe_ujian);


--
-- Name: hasil_ujian_274bb26f_6fec_42a_peserta_fase_progress_id_per_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX hasil_ujian_274bb26f_6fec_42a_peserta_fase_progress_id_per_idx1 ON public.hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (peserta_fase_progress_id, periode_id);


--
-- Name: hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_tipe_ujian_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_tipe_ujian_idx ON public.hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (tipe_ujian);


--
-- Name: hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa8_nomor_ujian_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa8_nomor_ujian_idx ON public.hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (nomor_ujian);


--
-- Name: hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469_nomor_ujian_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469_nomor_ujian_idx ON public.hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (nomor_ujian);


--
-- Name: hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_tipe_ujian_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_tipe_ujian_idx ON public.hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (tipe_ujian);


--
-- Name: hasil_ujian_5fd10cdd_a4b8_489_peserta_fase_progress_id_per_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX hasil_ujian_5fd10cdd_a4b8_489_peserta_fase_progress_id_per_idx1 ON public.hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (peserta_fase_progress_id, periode_id);


--
-- Name: idx_peserta_field_config_section_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_peserta_field_config_section_order ON public.periode_peserta_field_config USING btree (periode_id, tipe_pendaftaran_id, section_order);


--
-- Name: kelulusan_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kelulusan_periode_id_idx ON public.kelulusan USING btree (periode_id);


--
-- Name: kelulusan_registrasi_id_periode_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX kelulusan_registrasi_id_periode_id_key ON public.kelulusan USING btree (registrasi_id, periode_id);


--
-- Name: kelulusan_status_kelulusan_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kelulusan_status_kelulusan_idx ON public.kelulusan USING btree (status_kelulusan);


--
-- Name: master_formasi_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX master_formasi_kode_key ON public.master_formasi USING btree (kode);


--
-- Name: master_lokasi_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX master_lokasi_kode_key ON public.master_lokasi USING btree (kode);


--
-- Name: master_lokasi_provinsi_kode_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX master_lokasi_provinsi_kode_idx ON public.master_lokasi USING btree (provinsi_kode);


--
-- Name: periode_dokumen_config_jenis_dokumen_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periode_dokumen_config_jenis_dokumen_idx ON public.periode_dokumen_config USING btree (jenis_dokumen);


--
-- Name: periode_dokumen_config_periode_id_tipe_pendaftaran_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periode_dokumen_config_periode_id_tipe_pendaftaran_id_idx ON public.periode_dokumen_config USING btree (periode_id, tipe_pendaftaran_id);


--
-- Name: periode_dokumen_config_periode_id_tipe_pendaftaran_id_jenis_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX periode_dokumen_config_periode_id_tipe_pendaftaran_id_jenis_key ON public.periode_dokumen_config USING btree (periode_id, tipe_pendaftaran_id, jenis_dokumen);


--
-- Name: periode_fase_config_periode_id_tipe_pendaftaran_id_fase_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX periode_fase_config_periode_id_tipe_pendaftaran_id_fase_id_key ON public.periode_fase_config USING btree (periode_id, tipe_pendaftaran_id, fase_id);


--
-- Name: periode_fase_config_periode_id_tipe_pendaftaran_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periode_fase_config_periode_id_tipe_pendaftaran_id_idx ON public.periode_fase_config USING btree (periode_id, tipe_pendaftaran_id);


--
-- Name: periode_formasi_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periode_formasi_periode_id_idx ON public.periode_formasi USING btree (periode_id);


--
-- Name: periode_formasi_periode_id_tipe_pendaftaran_id_master_forma_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX periode_formasi_periode_id_tipe_pendaftaran_id_master_forma_key ON public.periode_formasi USING btree (periode_id, tipe_pendaftaran_id, master_formasi_id);


--
-- Name: periode_peserta_field_config_field_key_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periode_peserta_field_config_field_key_idx ON public.periode_peserta_field_config USING btree (field_key);


--
-- Name: periode_peserta_field_config_periode_id_tipe_pendaftaran_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periode_peserta_field_config_periode_id_tipe_pendaftaran_id_idx ON public.periode_peserta_field_config USING btree (periode_id, tipe_pendaftaran_id);


--
-- Name: periode_peserta_field_config_periode_id_tipe_pendaftaran_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX periode_peserta_field_config_periode_id_tipe_pendaftaran_id_key ON public.periode_peserta_field_config USING btree (periode_id, tipe_pendaftaran_id, field_key);


--
-- Name: periode_peserta_field_config_section_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periode_peserta_field_config_section_idx ON public.periode_peserta_field_config USING btree (section);


--
-- Name: periode_tahun_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX periode_tahun_key ON public.periode USING btree (tahun);


--
-- Name: peserta_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX peserta_email_idx ON public.peserta USING btree (email);


--
-- Name: peserta_email_verification_token_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX peserta_email_verification_token_idx ON public.peserta USING btree (email_verification_token);


--
-- Name: peserta_email_verification_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX peserta_email_verification_token_key ON public.peserta USING btree (email_verification_token);


--
-- Name: peserta_fase_progress_periode_fase_config_id_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX peserta_fase_progress_periode_fase_config_id_status_idx ON ONLY public.peserta_fase_progress USING btree (periode_fase_config_id, status);


--
-- Name: peserta_fase_progress_155eb51_periode_fase_config_id_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX peserta_fase_progress_155eb51_periode_fase_config_id_status_idx ON public.peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (periode_fase_config_id, status);


--
-- Name: peserta_fase_progress_registrasi_id_periode_fase_config_id__key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX peserta_fase_progress_registrasi_id_periode_fase_config_id__key ON ONLY public.peserta_fase_progress USING btree (registrasi_id, periode_fase_config_id, periode_id);


--
-- Name: peserta_fase_progress_155eb51_registrasi_id_periode_fase_co_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX peserta_fase_progress_155eb51_registrasi_id_periode_fase_co_idx ON public.peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (registrasi_id, periode_fase_config_id, periode_id);


--
-- Name: peserta_fase_progress_274bb26_periode_fase_config_id_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX peserta_fase_progress_274bb26_periode_fase_config_id_status_idx ON public.peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (periode_fase_config_id, status);


--
-- Name: peserta_fase_progress_274bb26_registrasi_id_periode_fase_co_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX peserta_fase_progress_274bb26_registrasi_id_periode_fase_co_idx ON public.peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (registrasi_id, periode_fase_config_id, periode_id);


--
-- Name: peserta_fase_progress_5fd10cd_periode_fase_config_id_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX peserta_fase_progress_5fd10cd_periode_fase_config_id_status_idx ON public.peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (periode_fase_config_id, status);


--
-- Name: peserta_fase_progress_5fd10cd_registrasi_id_periode_fase_co_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX peserta_fase_progress_5fd10cd_registrasi_id_periode_fase_co_idx ON public.peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (registrasi_id, periode_fase_config_id, periode_id);


--
-- Name: peserta_nik_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX peserta_nik_idx ON public.peserta USING btree (nik);


--
-- Name: peserta_nik_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX peserta_nik_key ON public.peserta USING btree (nik);


--
-- Name: peserta_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX peserta_user_id_idx ON public.peserta USING btree (user_id);


--
-- Name: peserta_user_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX peserta_user_id_key ON public.peserta USING btree (user_id);


--
-- Name: registrasi_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrasi_periode_id_idx ON ONLY public.registrasi USING btree (periode_id);


--
-- Name: registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_periode_id_idx ON public.registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (periode_id);


--
-- Name: registrasi_peserta_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrasi_peserta_id_idx ON ONLY public.registrasi USING btree (peserta_id);


--
-- Name: registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_peserta_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_peserta_id_idx ON public.registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (peserta_id);


--
-- Name: registrasi_nomor_registrasi_periode_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX registrasi_nomor_registrasi_periode_id_key ON ONLY public.registrasi USING btree (nomor_registrasi, periode_id);


--
-- Name: registrasi_155eb51e_e934_4d9a_a_nomor_registrasi_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX registrasi_155eb51e_e934_4d9a_a_nomor_registrasi_periode_id_idx ON public.registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b USING btree (nomor_registrasi, periode_id);


--
-- Name: registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_periode_id_idx ON public.registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (periode_id);


--
-- Name: registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_peserta_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_peserta_id_idx ON public.registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (peserta_id);


--
-- Name: registrasi_274bb26f_6fec_42ab_a_nomor_registrasi_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX registrasi_274bb26f_6fec_42ab_a_nomor_registrasi_periode_id_idx ON public.registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89 USING btree (nomor_registrasi, periode_id);


--
-- Name: registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_periode_id_idx ON public.registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (periode_id);


--
-- Name: registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_peserta_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_peserta_id_idx ON public.registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (peserta_id);


--
-- Name: registrasi_5fd10cdd_a4b8_4891_8_nomor_registrasi_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX registrasi_5fd10cdd_a4b8_4891_8_nomor_registrasi_periode_id_idx ON public.registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e USING btree (nomor_registrasi, periode_id);


--
-- Name: ruangan_ujian_fase_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ruangan_ujian_fase_id_idx ON public.ruangan_ujian USING btree (fase_id);


--
-- Name: ruangan_ujian_master_lokasi_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ruangan_ujian_master_lokasi_id_idx ON public.ruangan_ujian USING btree (master_lokasi_id);


--
-- Name: ruangan_ujian_periode_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ruangan_ujian_periode_id_idx ON public.ruangan_ujian USING btree (periode_id);


--
-- Name: ruangan_ujian_periode_id_master_lokasi_id_kode_ruangan_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ruangan_ujian_periode_id_master_lokasi_id_kode_ruangan_key ON public.ruangan_ujian USING btree (periode_id, master_lokasi_id, kode_ruangan);


--
-- Name: sesi_ujian_periode_id_fase_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sesi_ujian_periode_id_fase_id_idx ON public.sesi_ujian USING btree (periode_id, fase_id);


--
-- Name: sesi_ujian_ruangan_ujian_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sesi_ujian_ruangan_ujian_id_idx ON public.sesi_ujian USING btree (ruangan_ujian_id);


--
-- Name: sesi_ujian_tanggal_ujian_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sesi_ujian_tanggal_ujian_idx ON public.sesi_ujian USING btree (tanggal_ujian);


--
-- Name: tipe_pendaftaran_kode_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tipe_pendaftaran_kode_key ON public.tipe_pendaftaran USING btree (kode);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: users_nik_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_nik_idx ON public.users USING btree (nik);


--
-- Name: users_nik_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_nik_key ON public.users USING btree (nik);


--
-- Name: users_role_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_role_idx ON public.users USING btree (role);


--
-- Name: dokumen_peserta_155eb51e_e934_4d9_periode_dokumen_config_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_periode_dokumen_config_id_idx ATTACH PARTITION public.dokumen_peserta_155eb51e_e934_4d9_periode_dokumen_config_id_idx;


--
-- Name: dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_pkey ATTACH PARTITION public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey;


--
-- Name: dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e_verified_by_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_verified_by_idx ATTACH PARTITION public.dokumen_peserta_155eb51e_e934_4d9a_a256_56c0a4e_verified_by_idx;


--
-- Name: dokumen_peserta_155eb51e_e934_4d9a_a256_5_status_verifikasi_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_status_verifikasi_idx ATTACH PARTITION public.dokumen_peserta_155eb51e_e934_4d9a_a256_5_status_verifikasi_idx;


--
-- Name: dokumen_peserta_155eb51e_e934_4d9a_registrasi_id_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_registrasi_id_periode_id_idx ATTACH PARTITION public.dokumen_peserta_155eb51e_e934_4d9a_registrasi_id_periode_id_idx;


--
-- Name: dokumen_peserta_155eb51e_e934__parent_dokumen_id_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_parent_dokumen_id_periode_id_idx ATTACH PARTITION public.dokumen_peserta_155eb51e_e934__parent_dokumen_id_periode_id_idx;


--
-- Name: dokumen_peserta_155eb51e_e934_registrasi_id_periode_dokumen_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_registrasi_id_periode_dokumen_config_id_ver_key ATTACH PARTITION public.dokumen_peserta_155eb51e_e934_registrasi_id_periode_dokumen_idx;


--
-- Name: dokumen_peserta_274bb26f_6fec_42a_periode_dokumen_config_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_periode_dokumen_config_id_idx ATTACH PARTITION public.dokumen_peserta_274bb26f_6fec_42a_periode_dokumen_config_id_idx;


--
-- Name: dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_pkey ATTACH PARTITION public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey;


--
-- Name: dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f_verified_by_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_verified_by_idx ATTACH PARTITION public.dokumen_peserta_274bb26f_6fec_42ab_a804_a7ecf4f_verified_by_idx;


--
-- Name: dokumen_peserta_274bb26f_6fec_42ab_a804_a_status_verifikasi_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_status_verifikasi_idx ATTACH PARTITION public.dokumen_peserta_274bb26f_6fec_42ab_a804_a_status_verifikasi_idx;


--
-- Name: dokumen_peserta_274bb26f_6fec_42ab_registrasi_id_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_registrasi_id_periode_id_idx ATTACH PARTITION public.dokumen_peserta_274bb26f_6fec_42ab_registrasi_id_periode_id_idx;


--
-- Name: dokumen_peserta_274bb26f_6fec__parent_dokumen_id_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_parent_dokumen_id_periode_id_idx ATTACH PARTITION public.dokumen_peserta_274bb26f_6fec__parent_dokumen_id_periode_id_idx;


--
-- Name: dokumen_peserta_274bb26f_6fec_registrasi_id_periode_dokumen_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_registrasi_id_periode_dokumen_config_id_ver_key ATTACH PARTITION public.dokumen_peserta_274bb26f_6fec_registrasi_id_periode_dokumen_idx;


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34f_verified_by_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_verified_by_idx ATTACH PARTITION public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34f_verified_by_idx;


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_pkey ATTACH PARTITION public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey;


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e_status_verifikasi_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_status_verifikasi_idx ATTACH PARTITION public.dokumen_peserta_5fd10cdd_a4b8_4891_84a5_e_status_verifikasi_idx;


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_4891_registrasi_id_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_registrasi_id_periode_id_idx ATTACH PARTITION public.dokumen_peserta_5fd10cdd_a4b8_4891_registrasi_id_periode_id_idx;


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_489_periode_dokumen_config_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_periode_dokumen_config_id_idx ATTACH PARTITION public.dokumen_peserta_5fd10cdd_a4b8_489_periode_dokumen_config_id_idx;


--
-- Name: dokumen_peserta_5fd10cdd_a4b8__parent_dokumen_id_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_parent_dokumen_id_periode_id_idx ATTACH PARTITION public.dokumen_peserta_5fd10cdd_a4b8__parent_dokumen_id_periode_id_idx;


--
-- Name: dokumen_peserta_5fd10cdd_a4b8_registrasi_id_periode_dokumen_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.dokumen_peserta_registrasi_id_periode_dokumen_config_id_ver_key ATTACH PARTITION public.dokumen_peserta_5fd10cdd_a4b8_registrasi_id_periode_dokumen_idx;


--
-- Name: hasil_ujian_155eb51e_e934_4d9_peserta_fase_progress_id_per_idx1; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_peserta_fase_progress_id_periode_id_key ATTACH PARTITION public.hasil_ujian_155eb51e_e934_4d9_peserta_fase_progress_id_per_idx1;


--
-- Name: hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302_nomor_ujian_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_nomor_ujian_idx ATTACH PARTITION public.hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302_nomor_ujian_idx;


--
-- Name: hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_pkey ATTACH PARTITION public.hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey;


--
-- Name: hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b_tipe_ujian_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_tipe_ujian_idx ATTACH PARTITION public.hasil_ujian_155eb51e_e934_4d9a_a256_56c0a4e4302b_tipe_ujian_idx;


--
-- Name: hasil_ujian_274bb26f_6fec_42a_peserta_fase_progress_id_per_idx1; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_peserta_fase_progress_id_periode_id_key ATTACH PARTITION public.hasil_ujian_274bb26f_6fec_42a_peserta_fase_progress_id_per_idx1;


--
-- Name: hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_pkey ATTACH PARTITION public.hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey;


--
-- Name: hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_tipe_ujian_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_tipe_ujian_idx ATTACH PARTITION public.hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_tipe_ujian_idx;


--
-- Name: hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa8_nomor_ujian_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_nomor_ujian_idx ATTACH PARTITION public.hasil_ujian_274bb26f_6fec_42ab_a804_a7ecf4f4fa8_nomor_ujian_idx;


--
-- Name: hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469_nomor_ujian_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_nomor_ujian_idx ATTACH PARTITION public.hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469_nomor_ujian_idx;


--
-- Name: hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_pkey ATTACH PARTITION public.hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey;


--
-- Name: hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_tipe_ujian_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_tipe_ujian_idx ATTACH PARTITION public.hasil_ujian_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_tipe_ujian_idx;


--
-- Name: hasil_ujian_5fd10cdd_a4b8_489_peserta_fase_progress_id_per_idx1; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.hasil_ujian_peserta_fase_progress_id_periode_id_key ATTACH PARTITION public.hasil_ujian_5fd10cdd_a4b8_489_peserta_fase_progress_id_per_idx1;


--
-- Name: peserta_fase_progress_155eb51_periode_fase_config_id_status_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.peserta_fase_progress_periode_fase_config_id_status_idx ATTACH PARTITION public.peserta_fase_progress_155eb51_periode_fase_config_id_status_idx;


--
-- Name: peserta_fase_progress_155eb51_registrasi_id_periode_fase_co_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.peserta_fase_progress_registrasi_id_periode_fase_config_id__key ATTACH PARTITION public.peserta_fase_progress_155eb51_registrasi_id_periode_fase_co_idx;


--
-- Name: peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.peserta_fase_progress_pkey ATTACH PARTITION public.peserta_fase_progress_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey;


--
-- Name: peserta_fase_progress_274bb26_periode_fase_config_id_status_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.peserta_fase_progress_periode_fase_config_id_status_idx ATTACH PARTITION public.peserta_fase_progress_274bb26_periode_fase_config_id_status_idx;


--
-- Name: peserta_fase_progress_274bb26_registrasi_id_periode_fase_co_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.peserta_fase_progress_registrasi_id_periode_fase_config_id__key ATTACH PARTITION public.peserta_fase_progress_274bb26_registrasi_id_periode_fase_co_idx;


--
-- Name: peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.peserta_fase_progress_pkey ATTACH PARTITION public.peserta_fase_progress_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey;


--
-- Name: peserta_fase_progress_5fd10cd_periode_fase_config_id_status_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.peserta_fase_progress_periode_fase_config_id_status_idx ATTACH PARTITION public.peserta_fase_progress_5fd10cd_periode_fase_config_id_status_idx;


--
-- Name: peserta_fase_progress_5fd10cd_registrasi_id_periode_fase_co_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.peserta_fase_progress_registrasi_id_periode_fase_config_id__key ATTACH PARTITION public.peserta_fase_progress_5fd10cd_registrasi_id_periode_fase_co_idx;


--
-- Name: peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.peserta_fase_progress_pkey ATTACH PARTITION public.peserta_fase_progress_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey;


--
-- Name: registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_periode_id_idx ATTACH PARTITION public.registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_periode_id_idx;


--
-- Name: registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_peserta_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_peserta_id_idx ATTACH PARTITION public.registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_peserta_id_idx;


--
-- Name: registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_pkey ATTACH PARTITION public.registrasi_155eb51e_e934_4d9a_a256_56c0a4e4302b_pkey;


--
-- Name: registrasi_155eb51e_e934_4d9a_a_nomor_registrasi_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_nomor_registrasi_periode_id_key ATTACH PARTITION public.registrasi_155eb51e_e934_4d9a_a_nomor_registrasi_periode_id_idx;


--
-- Name: registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_periode_id_idx ATTACH PARTITION public.registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_periode_id_idx;


--
-- Name: registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_peserta_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_peserta_id_idx ATTACH PARTITION public.registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_peserta_id_idx;


--
-- Name: registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_pkey ATTACH PARTITION public.registrasi_274bb26f_6fec_42ab_a804_a7ecf4f4fa89_pkey;


--
-- Name: registrasi_274bb26f_6fec_42ab_a_nomor_registrasi_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_nomor_registrasi_periode_id_key ATTACH PARTITION public.registrasi_274bb26f_6fec_42ab_a_nomor_registrasi_periode_id_idx;


--
-- Name: registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_periode_id_idx ATTACH PARTITION public.registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_periode_id_idx;


--
-- Name: registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_peserta_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_peserta_id_idx ATTACH PARTITION public.registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_peserta_id_idx;


--
-- Name: registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_pkey ATTACH PARTITION public.registrasi_5fd10cdd_a4b8_4891_84a5_e5cf34fe469e_pkey;


--
-- Name: registrasi_5fd10cdd_a4b8_4891_8_nomor_registrasi_periode_id_idx; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.registrasi_nomor_registrasi_periode_id_key ATTACH PARTITION public.registrasi_5fd10cdd_a4b8_4891_8_nomor_registrasi_periode_id_idx;


--
-- Name: dokumen_peserta dokumen_peserta_parent_dokumen_id_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.dokumen_peserta
    ADD CONSTRAINT dokumen_peserta_parent_dokumen_id_periode_id_fkey FOREIGN KEY (parent_dokumen_id, periode_id) REFERENCES public.dokumen_peserta(id, periode_id);


--
-- Name: dokumen_peserta dokumen_peserta_periode_dokumen_config_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.dokumen_peserta
    ADD CONSTRAINT dokumen_peserta_periode_dokumen_config_id_fkey FOREIGN KEY (periode_dokumen_config_id) REFERENCES public.periode_dokumen_config(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: dokumen_peserta dokumen_peserta_registrasi_id_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.dokumen_peserta
    ADD CONSTRAINT dokumen_peserta_registrasi_id_periode_id_fkey FOREIGN KEY (registrasi_id, periode_id) REFERENCES public.registrasi(id, periode_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dokumen_peserta dokumen_peserta_verified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.dokumen_peserta
    ADD CONSTRAINT dokumen_peserta_verified_by_fkey FOREIGN KEY (verified_by) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: hasil_ujian hasil_ujian_peserta_fase_progress_id_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.hasil_ujian
    ADD CONSTRAINT hasil_ujian_peserta_fase_progress_id_periode_id_fkey FOREIGN KEY (peserta_fase_progress_id, periode_id) REFERENCES public.peserta_fase_progress(id, periode_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kelulusan kelulusan_registrasi_id_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kelulusan
    ADD CONSTRAINT kelulusan_registrasi_id_periode_id_fkey FOREIGN KEY (registrasi_id, periode_id) REFERENCES public.registrasi(id, periode_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: master_lokasi master_lokasi_provinsi_kode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_lokasi
    ADD CONSTRAINT master_lokasi_provinsi_kode_fkey FOREIGN KEY (provinsi_kode) REFERENCES public.provinsi(kode) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: periode_dokumen_config periode_dokumen_config_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_dokumen_config
    ADD CONSTRAINT periode_dokumen_config_periode_id_fkey FOREIGN KEY (periode_id) REFERENCES public.periode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: periode_dokumen_config periode_dokumen_config_tipe_pendaftaran_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_dokumen_config
    ADD CONSTRAINT periode_dokumen_config_tipe_pendaftaran_id_fkey FOREIGN KEY (tipe_pendaftaran_id) REFERENCES public.tipe_pendaftaran(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: periode_fase_config periode_fase_config_fase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_fase_config
    ADD CONSTRAINT periode_fase_config_fase_id_fkey FOREIGN KEY (fase_id) REFERENCES public.fase(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: periode_fase_config periode_fase_config_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_fase_config
    ADD CONSTRAINT periode_fase_config_periode_id_fkey FOREIGN KEY (periode_id) REFERENCES public.periode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: periode_fase_config periode_fase_config_tipe_pendaftaran_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_fase_config
    ADD CONSTRAINT periode_fase_config_tipe_pendaftaran_id_fkey FOREIGN KEY (tipe_pendaftaran_id) REFERENCES public.tipe_pendaftaran(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: periode_formasi periode_formasi_master_formasi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_formasi
    ADD CONSTRAINT periode_formasi_master_formasi_id_fkey FOREIGN KEY (master_formasi_id) REFERENCES public.master_formasi(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: periode_formasi periode_formasi_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_formasi
    ADD CONSTRAINT periode_formasi_periode_id_fkey FOREIGN KEY (periode_id) REFERENCES public.periode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: periode_formasi periode_formasi_tipe_pendaftaran_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_formasi
    ADD CONSTRAINT periode_formasi_tipe_pendaftaran_id_fkey FOREIGN KEY (tipe_pendaftaran_id) REFERENCES public.tipe_pendaftaran(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: periode_peserta_field_config periode_peserta_field_config_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_peserta_field_config
    ADD CONSTRAINT periode_peserta_field_config_periode_id_fkey FOREIGN KEY (periode_id) REFERENCES public.periode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: periode_peserta_field_config periode_peserta_field_config_tipe_pendaftaran_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_peserta_field_config
    ADD CONSTRAINT periode_peserta_field_config_tipe_pendaftaran_id_fkey FOREIGN KEY (tipe_pendaftaran_id) REFERENCES public.tipe_pendaftaran(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: peserta_fase_progress peserta_fase_progress_periode_fase_config_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.peserta_fase_progress
    ADD CONSTRAINT peserta_fase_progress_periode_fase_config_id_fkey FOREIGN KEY (periode_fase_config_id) REFERENCES public.periode_fase_config(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: peserta_fase_progress peserta_fase_progress_registrasi_id_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.peserta_fase_progress
    ADD CONSTRAINT peserta_fase_progress_registrasi_id_periode_id_fkey FOREIGN KEY (registrasi_id, periode_id) REFERENCES public.registrasi(id, periode_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: peserta peserta_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peserta
    ADD CONSTRAINT peserta_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: registrasi registrasi_periode_formasi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.registrasi
    ADD CONSTRAINT registrasi_periode_formasi_id_fkey FOREIGN KEY (periode_formasi_id) REFERENCES public.periode_formasi(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: registrasi registrasi_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.registrasi
    ADD CONSTRAINT registrasi_periode_id_fkey FOREIGN KEY (periode_id) REFERENCES public.periode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: registrasi registrasi_peserta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.registrasi
    ADD CONSTRAINT registrasi_peserta_id_fkey FOREIGN KEY (peserta_id) REFERENCES public.peserta(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: registrasi registrasi_tipe_pendaftaran_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.registrasi
    ADD CONSTRAINT registrasi_tipe_pendaftaran_id_fkey FOREIGN KEY (tipe_pendaftaran_id) REFERENCES public.tipe_pendaftaran(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ruangan_ujian ruangan_ujian_fase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruangan_ujian
    ADD CONSTRAINT ruangan_ujian_fase_id_fkey FOREIGN KEY (fase_id) REFERENCES public.fase(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ruangan_ujian ruangan_ujian_master_lokasi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruangan_ujian
    ADD CONSTRAINT ruangan_ujian_master_lokasi_id_fkey FOREIGN KEY (master_lokasi_id) REFERENCES public.master_lokasi(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ruangan_ujian ruangan_ujian_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruangan_ujian
    ADD CONSTRAINT ruangan_ujian_periode_id_fkey FOREIGN KEY (periode_id) REFERENCES public.periode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ruangan_ujian ruangan_ujian_tipe_pendaftaran_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruangan_ujian
    ADD CONSTRAINT ruangan_ujian_tipe_pendaftaran_id_fkey FOREIGN KEY (tipe_pendaftaran_id) REFERENCES public.tipe_pendaftaran(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: sesi_ujian sesi_ujian_fase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesi_ujian
    ADD CONSTRAINT sesi_ujian_fase_id_fkey FOREIGN KEY (fase_id) REFERENCES public.fase(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sesi_ujian sesi_ujian_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesi_ujian
    ADD CONSTRAINT sesi_ujian_periode_id_fkey FOREIGN KEY (periode_id) REFERENCES public.periode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sesi_ujian sesi_ujian_ruangan_ujian_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesi_ujian
    ADD CONSTRAINT sesi_ujian_ruangan_ujian_id_fkey FOREIGN KEY (ruangan_ujian_id) REFERENCES public.ruangan_ujian(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sesi_ujian sesi_ujian_tipe_pendaftaran_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesi_ujian
    ADD CONSTRAINT sesi_ujian_tipe_pendaftaran_id_fkey FOREIGN KEY (tipe_pendaftaran_id) REFERENCES public.tipe_pendaftaran(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict TLEtfBfHZo95mXQzvb1WyBMs5jlWe0ACYkkX8ZX2KRcBozIlgJZEhJjZE3y4rHN

