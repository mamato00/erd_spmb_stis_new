-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('ADMIN_PUSAT', 'ADMIN_DAERAH', 'VERIFIKATOR', 'PESERTA');

-- CreateEnum
CREATE TYPE "StatusSmpbActivity" AS ENUM ('AKTIF', 'TIDAK_AKTIF', 'DRAFT');

-- CreateEnum
CREATE TYPE "JenisKelamin" AS ENUM ('P', 'L');

-- CreateEnum
CREATE TYPE "StatusPesertaRegistrasi" AS ENUM ('DRAFT', 'FINAL');

-- CreateEnum
CREATE TYPE "PesertaRegistrasiFieldType" AS ENUM ('TEXT', 'NUMBER', 'DATE', 'EMAIL', 'TELEPHONE', 'SELECT', 'TEXTAREA', 'CHECKBOX', 'RADIO', 'CONFIRMATION');

-- CreateEnum
CREATE TYPE "PesertaRegistrasiFieldRuleType" AS ENUM ('MAX_LENGTH', 'MIN_LENGTH', 'PATTERN_REGEX', 'MIN_VALUE', 'MAX_VALUE', 'PREFIX', 'MIN_DATE', 'MAX_DATE');

-- CreateEnum
CREATE TYPE "PesertaRegistrasiDependsOnOperator" AS ENUM ('EQUAL', 'NOT_EQUAL', 'GREATER_OR_EQUAL', 'GREATER', 'LESS_OR_EQUAL', 'LESS');

-- CreateEnum
CREATE TYPE "PesertaRegistrasiDokumenStatusVerifikasi" AS ENUM ('PENDING', 'DISETUJUI', 'DITOLAK', 'REVISED');

-- CreateEnum
CREATE TYPE "StatusCmsPage" AS ENUM ('DRAFT', 'PUBLISHED');

-- CreateTable
CREATE TABLE "user" (
    "id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "no_hp" TEXT,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "last_login_at" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "provinsi_admin_daerah" TEXT,
    "role" "UserRole" NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TahunAjaran" (
    "id" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "deskripsi" TEXT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "TahunAjaran_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "spmb_activity" (
    "id" UUID NOT NULL,
    "tahun_ajaran_id" TEXT NOT NULL,
    "nama_spmb_activity" TEXT NOT NULL,
    "deskripsi" TEXT,
    "tanggal_mulai" TIMESTAMPTZ(6) NOT NULL,
    "tanggal_selesai" TIMESTAMPTZ(6) NOT NULL,
    "status" "StatusSmpbActivity" NOT NULL DEFAULT 'DRAFT',
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "spmb_activity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "spmb_activity_config" (
    "id" UUID NOT NULL,
    "spmb_activity_id" UUID NOT NULL,
    "coming_soon_published_at" TIMESTAMPTZ(6),
    "open_registration_published_at" TIMESTAMPTZ(6),
    "close_registration_published_at" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "spmb_activity_config_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "spmb_activity_tipe_pendaftaran" (
    "id" UUID NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "deskripsi" TEXT,
    "spmb_activity_id" UUID NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "spmb_activity_tipe_pendaftaran_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "prodi" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "kode" CHAR(5) NOT NULL,
    "nama" VARCHAR NOT NULL,
    "status" VARCHAR NOT NULL,
    "jenjang_pendidikan_id" INTEGER NOT NULL,
    "nama_jenjang_pendidikan" VARCHAR NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "prodi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_formasi" (
    "id" UUID NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "jenjang" TEXT NOT NULL,
    "prodi" TEXT,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "master_formasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_provinsi" (
    "kode_provinsi" TEXT NOT NULL,
    "nama_provinsi" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "admin_daerah_user_id" UUID,

    CONSTRAINT "master_provinsi_pkey" PRIMARY KEY ("kode_provinsi")
);

-- CreateTable
CREATE TABLE "master_kabupaten" (
    "kode_kabupaten" TEXT NOT NULL,
    "nama_kabupaten" TEXT NOT NULL,
    "master_provinsi_id" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "admin_daerah_user_id" UUID,

    CONSTRAINT "master_kabupaten_pkey" PRIMARY KEY ("kode_kabupaten")
);

-- CreateTable
CREATE TABLE "dokumen_provinsi" (
    "id" UUID NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "deskripsi_dokumen" TEXT NOT NULL,
    "kode_provinsi" TEXT NOT NULL,
    "path_dokumen" TEXT NOT NULL,
    "uploaded_by_user_id" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "dokumen_provinsi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "spmb_activity_formasi" (
    "id" UUID NOT NULL,
    "spmb_activity_id" UUID NOT NULL,
    "kode_formasi" TEXT NOT NULL,
    "nama_formasi" TEXT NOT NULL,
    "kode_provinsi" TEXT NOT NULL,
    "kode_kabupaten" TEXT,
    "jenjang" TEXT NOT NULL,
    "prodi" TEXT,
    "kuota" INTEGER NOT NULL,
    "is_afirmasi" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "tipe_pendaftaran_id" UUID NOT NULL,

    CONSTRAINT "spmb_activity_formasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "spmb_activity_id" UUID NOT NULL,
    "nik" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "no_hp" TEXT,
    "tanggal_lahir" DATE,
    "tempat_lahir" TEXT,
    "jenis_kelamin" "JenisKelamin",
    "alamat" TEXT,
    "dikdin_data" JSONB,
    "is_lulus" BOOLEAN,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "email_verification_token" TEXT,
    "email_verification_token_expires" TIMESTAMPTZ(6),
    "is_email_verified" BOOLEAN NOT NULL DEFAULT false,
    "email_verified_at" TIMESTAMPTZ(6),

    CONSTRAINT "peserta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta_registrasi" (
    "id" UUID NOT NULL,
    "nomor_peserta_registrasi" TEXT NOT NULL,
    "tipe_pendaftaran_id" UUID NOT NULL,
    "peserta_id" UUID NOT NULL,
    "spmb_activity_formasi_id" UUID NOT NULL,
    "status_peserta_registrasi" TEXT NOT NULL DEFAULT 'draft',
    "registration_at" TIMESTAMPTZ(6),
    "verified_by_user_id" UUID,
    "verified_at" TIMESTAMPTZ(6),
    "catatan_verifikasi" TEXT,
    "is_pembayaran_lunas" BOOLEAN,
    "tanggal_pembayaran" TIMESTAMP(3),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "peserta_registrasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta_pembayaran" (
    "id" UUID NOT NULL,
    "peserta_registrasi_id" UUID NOT NULL,
    "metode_pembayaran" TEXT NOT NULL,
    "kode_unik" TEXT NOT NULL,
    "kode_billing" TEXT NOT NULL,
    "bank_persepsi" TEXT NOT NULL,
    "ntb" TEXT NOT NULL,
    "ntpn" TEXT NOT NULL,
    "tanggal_jam_pembayaran" TEXT NOT NULL,
    "tanggal_buku" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "peserta_pembayaran_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta_registrasi_field_config" (
    "id" UUID NOT NULL,
    "spmb_activity_id" UUID NOT NULL,
    "tipe_pendaftaran_id" UUID,
    "field_key" TEXT NOT NULL,
    "field_label" TEXT NOT NULL,
    "field_type" "PesertaRegistrasiFieldType" NOT NULL,
    "is_required" BOOLEAN NOT NULL DEFAULT false,
    "is_readonly" BOOLEAN NOT NULL DEFAULT false,
    "section" TEXT,
    "section_label" TEXT,
    "section_order" INTEGER NOT NULL DEFAULT 1,
    "urutan" INTEGER NOT NULL DEFAULT 0,
    "placeholder" TEXT,
    "description" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "peserta_registrasi_field_config_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta_registrasi_field_config_validation_rule" (
    "id" UUID NOT NULL,
    "peserta_registrasi_field_config_id" UUID NOT NULL,
    "rule_type" "PesertaRegistrasiFieldRuleType" NOT NULL,
    "rule_value" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "peserta_registrasi_field_config_validation_rule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta_registrasi_field_config_option" (
    "id" UUID NOT NULL,
    "peserta_registrasi_field_config_id" UUID NOT NULL,
    "option_value" TEXT NOT NULL,
    "option_label" TEXT NOT NULL,
    "urutan" INTEGER,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "peserta_registrasi_field_config_option_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta_registrasi_field_config_depends_on" (
    "id" UUID NOT NULL,
    "peserta_registrasi_field_config_id" UUID NOT NULL,
    "depends_on_field_id" UUID NOT NULL,
    "depends_on_operator" "PesertaRegistrasiDependsOnOperator" NOT NULL,
    "depends_on_value" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "peserta_registrasi_field_config_depends_on_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta_registrasi_field_value" (
    "id" UUID NOT NULL,
    "peserta_registrasi_id" UUID NOT NULL,
    "peserta_registrasi_field_config_id" UUID NOT NULL,
    "value" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "peserta_registrasi_field_value_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta_registrasi_dokumen_config" (
    "id" UUID NOT NULL,
    "tipe_pendaftaran_id" UUID NOT NULL,
    "jenis_dokumen" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "is_required" BOOLEAN NOT NULL DEFAULT true,
    "max_file_size_mb" INTEGER NOT NULL DEFAULT 2,
    "allowed_file_types" TEXT[],
    "deskripsi" TEXT,
    "contoh_file_url" TEXT,
    "urutan" INTEGER NOT NULL DEFAULT 0,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "peserta_registrasi_dokumen_config_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta_registrasi_dokumen_value" (
    "id" UUID NOT NULL,
    "peserta_registrasi_id" UUID NOT NULL,
    "peserta_registrasi_dokumen_config_id" UUID NOT NULL,
    "file_name" TEXT NOT NULL,
    "file_path" TEXT NOT NULL,
    "status_verifikasi" "PesertaRegistrasiDokumenStatusVerifikasi" NOT NULL DEFAULT 'PENDING',
    "verified_at" TIMESTAMPTZ(6),
    "catatan_verifikasi" TEXT,
    "is_revised" TEXT,
    "verified_by_user_id" UUID,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "peserta_registrasi_dokumen_value_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_tahapan" (
    "id" UUID NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "lulus_message" TEXT NOT NULL,
    "tidak_lulus_message" TEXT NOT NULL,

    CONSTRAINT "master_tahapan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan" (
    "id" UUID NOT NULL,
    "spmb_activity_id" UUID NOT NULL,
    "tipe_pendaftaran_id" UUID,
    "kode_tahapan" TEXT NOT NULL,
    "nama_tahapan" TEXT NOT NULL,
    "deskripsi_tahapan" TEXT NOT NULL,
    "master_tahapan_id" UUID NOT NULL,
    "urutan_tahapan" INTEGER NOT NULL,
    "tanggal_mulai" TIMESTAMPTZ(6) NOT NULL,
    "tanggal_selesai" TIMESTAMPTZ(6) NOT NULL,
    "lulus_message" TEXT NOT NULL,
    "tidak_lulus_message" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_ujian" (
    "id" UUID NOT NULL,
    "tahapan_id" UUID NOT NULL,
    "nama_tahapan_ujian" TEXT NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "urutanTahapanUjian" INTEGER,
    "tanggalMulai" TIMESTAMP(3),
    "tanggalSelesai" TIMESTAMP(3),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_ujian_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_lokasi" (
    "id" UUID NOT NULL,
    "namaLokasi" TEXT NOT NULL,
    "alamatLokasi" TEXT,
    "kode_provinsi" TEXT NOT NULL,
    "kapasitas" INTEGER,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "master_lokasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_ujian_lokasi" (
    "id" UUID NOT NULL,
    "nama_lokasi" TEXT NOT NULL,
    "alamat_lokasi" TEXT,
    "kode_provinsi" TEXT NOT NULL,
    "kapasitas" INTEGER,
    "tahapan_ujian_id" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_ujian_lokasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_ujian_lokasi_tanggal_sesi" (
    "id" UUID NOT NULL,
    "tanggal_ujian" TIMESTAMPTZ(6),
    "waktu_mulai" TEXT NOT NULL,
    "waktu_selesai" TEXT NOT NULL,
    "tahapan_ujian_lokasi_id" UUID NOT NULL,
    "status" TEXT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_ujian_lokasi_tanggal_sesi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_ujian_lokasi_ruangan" (
    "id" UUID NOT NULL,
    "kode_ruangan" TEXT NOT NULL,
    "nama_ruangan" TEXT NOT NULL,
    "kapasitas" INTEGER NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "tahapan_ujian_lokasi_id" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_ujian_lokasi_ruangan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_ujian_lokasi_ruangan_sesi" (
    "id" UUID NOT NULL,
    "tahapan_ujian_lokasi_ruangan_id" UUID,
    "tahapan_ujian_lokasi_sesi_id" UUID,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_ujian_lokasi_ruangan_sesi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_komponen_nilai_config" (
    "id" UUID NOT NULL,
    "tahapan_id" UUID NOT NULL,
    "nama_komponen" TEXT NOT NULL,
    "deskripsi_komponen" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_komponen_nilai_config_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_komponen_nilai_value" (
    "id" UUID NOT NULL,
    "tahapan_komponen_nilai_config_id" UUID NOT NULL,
    "tahapan_peserta_id" UUID NOT NULL,
    "value" TEXT NOT NULL,
    "is_lulus" BOOLEAN NOT NULL,
    "catatan" TEXT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_komponen_nilai_value_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_status_kelulusan" (
    "id" TEXT NOT NULL,
    "tahapan_id" UUID NOT NULL,
    "nama_status_kelulusan" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_status_kelulusan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_peserta" (
    "id" UUID NOT NULL,
    "peserta_id" UUID NOT NULL,
    "tahapan_id" UUID NOT NULL,
    "tahapan_status_kelulusan_id" TEXT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_peserta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_ujian_peserta" (
    "id" UUID NOT NULL,
    "peserta_id" UUID NOT NULL,
    "tahapan_ujian_id" UUID NOT NULL,
    "tahapan_ujian_lokasi_ruang_sesi_id" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "tahapan_ujian_peserta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kelulusan" (
    "id" UUID NOT NULL,
    "peserta_id" UUID NOT NULL,
    "spmb_activity_id" UUID NOT NULL,
    "tipe_pendaftaran_id" UUID NOT NULL,
    "spmb_activity_formasi_id" UUID NOT NULL,
    "status_kelulusan" TEXT,
    "catatan" TEXT,
    "tanggal_pengumuman" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "kelulusan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "spmb_activity_faq" (
    "id" UUID NOT NULL,
    "spmb_activity_id" UUID NOT NULL,
    "urutan" INTEGER NOT NULL,
    "pertanyaan" TEXT NOT NULL,
    "jawaban" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "spmb_activity_faq_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cms_page" (
    "id" UUID NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "description" TEXT,
    "components" JSONB NOT NULL,
    "status" "StatusCmsPage" NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_by" UUID NOT NULL,
    "updated_by" UUID,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "cms_page_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cms_component" (
    "id" UUID NOT NULL,
    "type" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "icon" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "fields" JSONB NOT NULL,
    "default_props" JSONB NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_by" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "cms_component_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "spmb_activity_tipe_pendaftaran_kode_key" ON "spmb_activity_tipe_pendaftaran"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "master_formasi_kode_key" ON "master_formasi"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "master_provinsi_admin_daerah_user_id_key" ON "master_provinsi"("admin_daerah_user_id");

-- CreateIndex
CREATE UNIQUE INDEX "master_kabupaten_admin_daerah_user_id_key" ON "master_kabupaten"("admin_daerah_user_id");

-- CreateIndex
CREATE UNIQUE INDEX "peserta_user_id_key" ON "peserta"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "peserta_nik_key" ON "peserta"("nik");

-- CreateIndex
CREATE UNIQUE INDEX "peserta_email_verification_token_key" ON "peserta"("email_verification_token");

-- CreateIndex
CREATE UNIQUE INDEX "peserta_registrasi_nomor_peserta_registrasi_key" ON "peserta_registrasi"("nomor_peserta_registrasi");

-- CreateIndex
CREATE UNIQUE INDEX "peserta_pembayaran_peserta_registrasi_id_key" ON "peserta_pembayaran"("peserta_registrasi_id");

-- CreateIndex
CREATE UNIQUE INDEX "peserta_registrasi_field_config_spmb_activity_id_tipe_penda_key" ON "peserta_registrasi_field_config"("spmb_activity_id", "tipe_pendaftaran_id", "field_key");

-- CreateIndex
CREATE UNIQUE INDEX "peserta_registrasi_dokumen_config_tipe_pendaftaran_id_jenis_key" ON "peserta_registrasi_dokumen_config"("tipe_pendaftaran_id", "jenis_dokumen");

-- CreateIndex
CREATE UNIQUE INDEX "tahapan_spmb_activity_id_tipe_pendaftaran_id_master_tahapan_key" ON "tahapan"("spmb_activity_id", "tipe_pendaftaran_id", "master_tahapan_id");

-- CreateIndex
CREATE UNIQUE INDEX "tahapan_peserta_peserta_id_tahapan_id_key" ON "tahapan_peserta"("peserta_id", "tahapan_id");

-- CreateIndex
CREATE UNIQUE INDEX "kelulusan_peserta_id_key" ON "kelulusan"("peserta_id");

-- CreateIndex
CREATE UNIQUE INDEX "cms_page_slug_key" ON "cms_page"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "cms_component_type_key" ON "cms_component"("type");

-- AddForeignKey
ALTER TABLE "spmb_activity" ADD CONSTRAINT "spmb_activity_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "TahunAjaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spmb_activity_config" ADD CONSTRAINT "spmb_activity_config_spmb_activity_id_fkey" FOREIGN KEY ("spmb_activity_id") REFERENCES "spmb_activity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spmb_activity_tipe_pendaftaran" ADD CONSTRAINT "spmb_activity_tipe_pendaftaran_spmb_activity_id_fkey" FOREIGN KEY ("spmb_activity_id") REFERENCES "spmb_activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "master_provinsi" ADD CONSTRAINT "master_provinsi_admin_daerah_user_id_fkey" FOREIGN KEY ("admin_daerah_user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "master_kabupaten" ADD CONSTRAINT "master_kabupaten_master_provinsi_id_fkey" FOREIGN KEY ("master_provinsi_id") REFERENCES "master_provinsi"("kode_provinsi") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dokumen_provinsi" ADD CONSTRAINT "dokumen_provinsi_uploaded_by_user_id_fkey" FOREIGN KEY ("uploaded_by_user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dokumen_provinsi" ADD CONSTRAINT "dokumen_provinsi_kode_provinsi_fkey" FOREIGN KEY ("kode_provinsi") REFERENCES "master_provinsi"("kode_provinsi") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spmb_activity_formasi" ADD CONSTRAINT "spmb_activity_formasi_tipe_pendaftaran_id_fkey" FOREIGN KEY ("tipe_pendaftaran_id") REFERENCES "spmb_activity_tipe_pendaftaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spmb_activity_formasi" ADD CONSTRAINT "spmb_activity_formasi_spmb_activity_id_fkey" FOREIGN KEY ("spmb_activity_id") REFERENCES "spmb_activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spmb_activity_formasi" ADD CONSTRAINT "spmb_activity_formasi_kode_provinsi_fkey" FOREIGN KEY ("kode_provinsi") REFERENCES "master_provinsi"("kode_provinsi") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spmb_activity_formasi" ADD CONSTRAINT "spmb_activity_formasi_kode_kabupaten_fkey" FOREIGN KEY ("kode_kabupaten") REFERENCES "master_kabupaten"("kode_kabupaten") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta" ADD CONSTRAINT "peserta_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta" ADD CONSTRAINT "peserta_spmb_activity_id_fkey" FOREIGN KEY ("spmb_activity_id") REFERENCES "spmb_activity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi" ADD CONSTRAINT "peserta_registrasi_spmb_activity_formasi_id_fkey" FOREIGN KEY ("spmb_activity_formasi_id") REFERENCES "spmb_activity_formasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi" ADD CONSTRAINT "peserta_registrasi_peserta_id_fkey" FOREIGN KEY ("peserta_id") REFERENCES "peserta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi" ADD CONSTRAINT "peserta_registrasi_tipe_pendaftaran_id_fkey" FOREIGN KEY ("tipe_pendaftaran_id") REFERENCES "spmb_activity_tipe_pendaftaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi" ADD CONSTRAINT "peserta_registrasi_verified_by_user_id_fkey" FOREIGN KEY ("verified_by_user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_pembayaran" ADD CONSTRAINT "peserta_pembayaran_peserta_registrasi_id_fkey" FOREIGN KEY ("peserta_registrasi_id") REFERENCES "peserta_registrasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_field_config" ADD CONSTRAINT "peserta_registrasi_field_config_spmb_activity_id_fkey" FOREIGN KEY ("spmb_activity_id") REFERENCES "spmb_activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_field_config" ADD CONSTRAINT "peserta_registrasi_field_config_tipe_pendaftaran_id_fkey" FOREIGN KEY ("tipe_pendaftaran_id") REFERENCES "spmb_activity_tipe_pendaftaran"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_field_config_validation_rule" ADD CONSTRAINT "peserta_registrasi_field_config_validation_rule_peserta_re_fkey" FOREIGN KEY ("peserta_registrasi_field_config_id") REFERENCES "peserta_registrasi_field_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_field_config_option" ADD CONSTRAINT "peserta_registrasi_field_config_option_peserta_registrasi__fkey" FOREIGN KEY ("peserta_registrasi_field_config_id") REFERENCES "peserta_registrasi_field_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_field_config_depends_on" ADD CONSTRAINT "peserta_registrasi_field_config_depends_on_peserta_registr_fkey" FOREIGN KEY ("peserta_registrasi_field_config_id") REFERENCES "peserta_registrasi_field_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_field_config_depends_on" ADD CONSTRAINT "peserta_registrasi_field_config_depends_on_depends_on_fiel_fkey" FOREIGN KEY ("depends_on_field_id") REFERENCES "peserta_registrasi_field_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_field_value" ADD CONSTRAINT "peserta_registrasi_field_value_peserta_registrasi_field_co_fkey" FOREIGN KEY ("peserta_registrasi_field_config_id") REFERENCES "peserta_registrasi_field_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_field_value" ADD CONSTRAINT "peserta_registrasi_field_value_peserta_registrasi_id_fkey" FOREIGN KEY ("peserta_registrasi_id") REFERENCES "peserta_registrasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_dokumen_config" ADD CONSTRAINT "peserta_registrasi_dokumen_config_tipe_pendaftaran_id_fkey" FOREIGN KEY ("tipe_pendaftaran_id") REFERENCES "spmb_activity_tipe_pendaftaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_dokumen_value" ADD CONSTRAINT "peserta_registrasi_dokumen_value_peserta_registrasi_dokume_fkey" FOREIGN KEY ("peserta_registrasi_dokumen_config_id") REFERENCES "peserta_registrasi_dokumen_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_dokumen_value" ADD CONSTRAINT "peserta_registrasi_dokumen_value_peserta_registrasi_id_fkey" FOREIGN KEY ("peserta_registrasi_id") REFERENCES "peserta_registrasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta_registrasi_dokumen_value" ADD CONSTRAINT "peserta_registrasi_dokumen_value_verified_by_user_id_fkey" FOREIGN KEY ("verified_by_user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan" ADD CONSTRAINT "tahapan_master_tahapan_id_fkey" FOREIGN KEY ("master_tahapan_id") REFERENCES "master_tahapan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan" ADD CONSTRAINT "tahapan_spmb_activity_id_fkey" FOREIGN KEY ("spmb_activity_id") REFERENCES "spmb_activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan" ADD CONSTRAINT "tahapan_tipe_pendaftaran_id_fkey" FOREIGN KEY ("tipe_pendaftaran_id") REFERENCES "spmb_activity_tipe_pendaftaran"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "master_lokasi" ADD CONSTRAINT "master_lokasi_kode_provinsi_fkey" FOREIGN KEY ("kode_provinsi") REFERENCES "master_provinsi"("kode_provinsi") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_ujian_lokasi" ADD CONSTRAINT "tahapan_ujian_lokasi_tahapan_ujian_id_fkey" FOREIGN KEY ("tahapan_ujian_id") REFERENCES "tahapan_ujian"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_ujian_lokasi_tanggal_sesi" ADD CONSTRAINT "tahapan_ujian_lokasi_tanggal_sesi_tahapan_ujian_lokasi_id_fkey" FOREIGN KEY ("tahapan_ujian_lokasi_id") REFERENCES "tahapan_ujian_lokasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_ujian_lokasi_ruangan" ADD CONSTRAINT "tahapan_ujian_lokasi_ruangan_tahapan_ujian_lokasi_id_fkey" FOREIGN KEY ("tahapan_ujian_lokasi_id") REFERENCES "tahapan_ujian_lokasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_ujian_lokasi_ruangan_sesi" ADD CONSTRAINT "tahapan_ujian_lokasi_ruangan_sesi_tahapan_ujian_lokasi_rua_fkey" FOREIGN KEY ("tahapan_ujian_lokasi_ruangan_id") REFERENCES "tahapan_ujian_lokasi_ruangan"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_ujian_lokasi_ruangan_sesi" ADD CONSTRAINT "tahapan_ujian_lokasi_ruangan_sesi_tahapan_ujian_lokasi_ses_fkey" FOREIGN KEY ("tahapan_ujian_lokasi_sesi_id") REFERENCES "tahapan_ujian_lokasi_tanggal_sesi"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_komponen_nilai_config" ADD CONSTRAINT "tahapan_komponen_nilai_config_tahapan_id_fkey" FOREIGN KEY ("tahapan_id") REFERENCES "tahapan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_komponen_nilai_value" ADD CONSTRAINT "tahapan_komponen_nilai_value_tahapan_komponen_nilai_config_fkey" FOREIGN KEY ("tahapan_komponen_nilai_config_id") REFERENCES "tahapan_komponen_nilai_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_komponen_nilai_value" ADD CONSTRAINT "tahapan_komponen_nilai_value_tahapan_peserta_id_fkey" FOREIGN KEY ("tahapan_peserta_id") REFERENCES "tahapan_peserta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_status_kelulusan" ADD CONSTRAINT "tahapan_status_kelulusan_tahapan_id_fkey" FOREIGN KEY ("tahapan_id") REFERENCES "tahapan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_peserta" ADD CONSTRAINT "tahapan_peserta_tahapan_id_fkey" FOREIGN KEY ("tahapan_id") REFERENCES "tahapan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_peserta" ADD CONSTRAINT "tahapan_peserta_peserta_id_fkey" FOREIGN KEY ("peserta_id") REFERENCES "peserta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_peserta" ADD CONSTRAINT "tahapan_peserta_tahapan_status_kelulusan_id_fkey" FOREIGN KEY ("tahapan_status_kelulusan_id") REFERENCES "tahapan_status_kelulusan"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_ujian_peserta" ADD CONSTRAINT "tahapan_ujian_peserta_tahapan_ujian_id_fkey" FOREIGN KEY ("tahapan_ujian_id") REFERENCES "tahapan_ujian"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_ujian_peserta" ADD CONSTRAINT "tahapan_ujian_peserta_peserta_id_fkey" FOREIGN KEY ("peserta_id") REFERENCES "peserta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_ujian_peserta" ADD CONSTRAINT "tahapan_ujian_peserta_tahapan_ujian_lokasi_ruang_sesi_id_fkey" FOREIGN KEY ("tahapan_ujian_lokasi_ruang_sesi_id") REFERENCES "tahapan_ujian_lokasi_ruangan_sesi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kelulusan" ADD CONSTRAINT "kelulusan_peserta_id_fkey" FOREIGN KEY ("peserta_id") REFERENCES "peserta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spmb_activity_faq" ADD CONSTRAINT "spmb_activity_faq_spmb_activity_id_fkey" FOREIGN KEY ("spmb_activity_id") REFERENCES "spmb_activity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cms_page" ADD CONSTRAINT "cms_page_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cms_page" ADD CONSTRAINT "cms_page_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cms_component" ADD CONSTRAINT "cms_component_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

