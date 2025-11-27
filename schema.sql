-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('ADMIN_PUSAT', 'ADMIN_DAERAH', 'VERIFIKATOR', 'PIMPINAN', 'PESERTA');

-- CreateTable
CREATE TABLE "tahun_ajaran" (
    "id" TEXT NOT NULL,
    "tahun" INTEGER NOT NULL,
    "nama_ta" TEXT NOT NULL,
    "deskripsi" TEXT,
    "tanggal_mulai" TIMESTAMP(3) NOT NULL,
    "tanggal_selesai" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahun_ajaran_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_fase" (
    "id" TEXT NOT NULL,
    "nama_fase" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "deskripsi" TEXT NOT NULL,

    CONSTRAINT "master_fase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahun_ajaran_fase" (
    "id" TEXT NOT NULL,
    "tahun_ajaran_id" TEXT NOT NULL,
    "master_fase_id" TEXT NOT NULL,
    "tanggal_mulai" TIMESTAMP(3) NOT NULL,
    "tanggal_selesai" TIMESTAMP(3) NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahun_ajaran_fase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahun_ajaran_tipe_pendaftaran" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "deskripsi" TEXT,
    "tahun_ajaran_id" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahun_ajaran_tipe_pendaftaran_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_formasi" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "jenjang" TEXT NOT NULL,
    "prodi" TEXT,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "master_formasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_provinsi" (
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,

    CONSTRAINT "master_provinsi_pkey" PRIMARY KEY ("kode")
);

-- CreateTable
CREATE TABLE "master_lokasi" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "alamat" TEXT,
    "provinsi_kode" TEXT NOT NULL,
    "kapasitas" INTEGER,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "master_lokasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahun_ajaran_lokasi" (
    "id" TEXT NOT NULL,
    "master_lokasi_id" TEXT NOT NULL,
    "tahun_ajaran_id" TEXT NOT NULL,
    "kapasitas" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahun_ajaran_lokasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dokumen_lokasi" (
    "id" TEXT NOT NULL,
    "tahun_ajaran_lokasi_id" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "deskripsi_dokumen" TEXT NOT NULL,
    "path_dokumen" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dokumen_lokasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahun_ajaran_formasi" (
    "id" TEXT NOT NULL,
    "tahun_ajaran_id" TEXT NOT NULL,
    "master_formasi_id" TEXT NOT NULL,
    "kuota" INTEGER NOT NULL,
    "is_afirmasi" BOOLEAN NOT NULL DEFAULT false,
    "konfigurasi" JSONB,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahun_ajaran_formasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "email" TEXT,
    "password" TEXT NOT NULL,
    "role" "UserRole" NOT NULL,
    "nama" TEXT NOT NULL,
    "no_hp" TEXT,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "last_login_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "peserta" (
    "id" TEXT NOT NULL,
    "user_id" TEXT,
    "tahun_ajaran_id" TEXT NOT NULL,
    "nik" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "no_hp" TEXT,
    "tanggal_lahir" TIMESTAMP(3),
    "tempat_lahir" TEXT,
    "jenis_kelamin" TEXT,
    "alamat" TEXT,
    "dikdin_data" JSONB,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "email_verification_token" TEXT,
    "email_verification_token_expires" TIMESTAMP(3),
    "email_verified" BOOLEAN NOT NULL DEFAULT false,
    "email_verified_at" TIMESTAMP(3),

    CONSTRAINT "peserta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_tahapan" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "deskripsi" TEXT NOT NULL,

    CONSTRAINT "master_tahapan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan" (
    "id" TEXT NOT NULL,
    "tahun_ajaran_id" TEXT NOT NULL,
    "tipe_pendaftaran_id" TEXT NOT NULL,
    "tahun_ajaran_formasi_id" TEXT NOT NULL,
    "master_tahapan_id" TEXT NOT NULL,
    "urutan_tahapan" INTEGER NOT NULL,
    "tanggal_mulai" TIMESTAMP(3) NOT NULL,
    "tanggal_selesai" TIMESTAMP(3) NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahapan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "registrasi_field_config" (
    "id" TEXT NOT NULL,
    "tahun_ajaran_id" TEXT NOT NULL,
    "tipe_pendaftaran_id" TEXT NOT NULL,
    "field_key" TEXT NOT NULL,
    "field_label" TEXT NOT NULL,
    "field_type" TEXT NOT NULL,
    "is_required" BOOLEAN NOT NULL DEFAULT false,
    "is_readonly" BOOLEAN NOT NULL DEFAULT false,
    "section" TEXT,
    "section_label" TEXT,
    "section_order" INTEGER NOT NULL DEFAULT 1,
    "urutan" INTEGER NOT NULL DEFAULT 0,
    "placeholder" TEXT,
    "help_text" TEXT,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "registrasi_field_config_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "field_config_validation_rule" (
    "id" TEXT NOT NULL,
    "registrasi_field_config_id" TEXT NOT NULL,
    "rule_type" TEXT NOT NULL,
    "rule_value" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "field_config_validation_rule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "field_config_option" (
    "id" TEXT NOT NULL,
    "registrasi_field_config_id" TEXT NOT NULL,
    "option_value" TEXT NOT NULL,
    "option_label" TEXT NOT NULL,
    "urutan" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "field_config_option_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "field_config_depends_on" (
    "id" TEXT NOT NULL,
    "registrasi_field_config_id" TEXT NOT NULL,
    "depend_on_field_id" TEXT NOT NULL,
    "depends_on_operator" TEXT NOT NULL,
    "depends_on_value" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "field_config_depends_on_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "registrasi" (
    "id" TEXT NOT NULL,
    "nomor_registrasi" TEXT NOT NULL,
    "tahun_ajaran_id" TEXT NOT NULL,
    "tipe_pendaftaran_id" TEXT NOT NULL,
    "peserta_id" TEXT NOT NULL,
    "tahun_ajaran_formasi_id" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "tanggal_registrasi" TIMESTAMP(3) NOT NULL,
    "verifikasi_by" TEXT,
    "tanggal_verifikasi" TIMESTAMP(3),
    "catatan_verifikasi" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "registrasi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "registrasi_field_value" (
    "id" TEXT NOT NULL,
    "registrasi_id" TEXT NOT NULL,
    "registrasi_field_config_id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "registrasi_field_value_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahun_ajaran_dokumen_config" (
    "id" TEXT NOT NULL,
    "tahun_ajaran_id" TEXT NOT NULL,
    "tipe_pendaftaran_id" TEXT NOT NULL,
    "jenis_dokumen" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "is_required" BOOLEAN NOT NULL DEFAULT true,
    "max_file_size_mb" INTEGER NOT NULL DEFAULT 2,
    "allowed_file_types" TEXT NOT NULL,
    "deskripsi" TEXT,
    "contoh_file_url" TEXT,
    "urutan" INTEGER NOT NULL DEFAULT 0,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahun_ajaran_dokumen_config_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "registrasi_dokumen_value" (
    "id" TEXT NOT NULL,
    "registrasi_id" TEXT NOT NULL,
    "registrasi_dokumen_config_id" TEXT NOT NULL,
    "file_name" TEXT NOT NULL,
    "file_path" TEXT NOT NULL,
    "status_verifikasi" TEXT NOT NULL DEFAULT 'pending',
    "verified_at" TIMESTAMP(3),
    "catatan_verifikasi" TEXT,
    "is_revised" TEXT,
    "verified_by_user_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "registrasi_dokumen_value_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_peserta" (
    "id" TEXT NOT NULL,
    "registrasi_id" TEXT NOT NULL,
    "tahapan_id" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'not_started',
    "nomor_ujian" TEXT,
    "jadwal_ujian_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahapan_peserta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_alokasi_ujian" (
    "id" TEXT NOT NULL,
    "tahun_ajaran_lokasi_id" TEXT NOT NULL,
    "tahapan_peserta_id" TEXT,
    "kode_ruangan" TEXT NOT NULL,
    "nama_ruangan" TEXT NOT NULL,
    "kapasitas" INTEGER NOT NULL,
    "konfigurasi" JSONB,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahapan_alokasi_ujian_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_komponen_nilai_config" (
    "id" TEXT NOT NULL,
    "tahapan_id" TEXT NOT NULL,
    "nama_komponen" TEXT NOT NULL,
    "deskripsi_komponen" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahapan_komponen_nilai_config_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_komponen_nilai_value" (
    "id" TEXT NOT NULL,
    "tahapan_komponen_nilai_config_id" TEXT NOT NULL,
    "tahapan_peserta_id" TEXT NOT NULL,
    "nomor_ujian" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "is_lulus" BOOLEAN NOT NULL,
    "catatan" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahapan_komponen_nilai_value_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahun_ajaran_sesi_ujian" (
    "id" TEXT NOT NULL,
    "tahun_ajaran_id" TEXT NOT NULL,
    "waktu_mulai" TEXT NOT NULL,
    "waktu_selesai" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahun_ajaran_sesi_ujian_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_sesi_ujian" (
    "id" TEXT NOT NULL,
    "tahun_ajaran_sesi_ujian_id" TEXT NOT NULL,
    "tahapan_alokasi_ujian_id" TEXT NOT NULL,
    "tanggal_ujian" TIMESTAMP(3) NOT NULL,
    "status" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahapan_sesi_ujian_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahapan_kelulusan" (
    "id" TEXT NOT NULL,
    "registrasi_id" TEXT NOT NULL,
    "peserta_id" TEXT NOT NULL,
    "tahun_ajaran_id" TEXT NOT NULL,
    "tipe_pendaftaran_id" TEXT NOT NULL,
    "tahun_ajaran_formasi_id" TEXT NOT NULL,
    "status_kelulusan" TEXT,
    "catatan" TEXT,
    "tanggal_pengumuman" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tahapan_kelulusan_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "tahun_ajaran_tahun_key" ON "tahun_ajaran"("tahun");

-- CreateIndex
CREATE UNIQUE INDEX "tahun_ajaran_tipe_pendaftaran_kode_key" ON "tahun_ajaran_tipe_pendaftaran"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "master_formasi_kode_key" ON "master_formasi"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "master_lokasi_kode_key" ON "master_lokasi"("kode");

-- CreateIndex
CREATE INDEX "master_lokasi_provinsi_kode_idx" ON "master_lokasi"("provinsi_kode");

-- CreateIndex
CREATE INDEX "tahun_ajaran_formasi_tahun_ajaran_id_idx" ON "tahun_ajaran_formasi"("tahun_ajaran_id");

-- CreateIndex
CREATE UNIQUE INDEX "tahun_ajaran_formasi_tahun_ajaran_id_master_formasi_id_key" ON "tahun_ajaran_formasi"("tahun_ajaran_id", "master_formasi_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE INDEX "users_email_idx" ON "users"("email");

-- CreateIndex
CREATE INDEX "users_role_idx" ON "users"("role");

-- CreateIndex
CREATE UNIQUE INDEX "peserta_user_id_key" ON "peserta"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "peserta_nik_key" ON "peserta"("nik");

-- CreateIndex
CREATE UNIQUE INDEX "peserta_email_verification_token_key" ON "peserta"("email_verification_token");

-- CreateIndex
CREATE INDEX "peserta_nik_idx" ON "peserta"("nik");

-- CreateIndex
CREATE INDEX "peserta_email_idx" ON "peserta"("email");

-- CreateIndex
CREATE INDEX "peserta_user_id_idx" ON "peserta"("user_id");

-- CreateIndex
CREATE INDEX "peserta_email_verification_token_idx" ON "peserta"("email_verification_token");

-- CreateIndex
CREATE INDEX "tahapan_tahun_ajaran_id_tahun_ajaran_formasi_id_idx" ON "tahapan"("tahun_ajaran_id", "tahun_ajaran_formasi_id");

-- CreateIndex
CREATE UNIQUE INDEX "tahapan_tahun_ajaran_id_tipe_pendaftaran_id_tahun_ajaran_fo_key" ON "tahapan"("tahun_ajaran_id", "tipe_pendaftaran_id", "tahun_ajaran_formasi_id", "master_tahapan_id");

-- CreateIndex
CREATE INDEX "registrasi_field_config_tahun_ajaran_id_tipe_pendaftaran_id_idx" ON "registrasi_field_config"("tahun_ajaran_id", "tipe_pendaftaran_id");

-- CreateIndex
CREATE INDEX "registrasi_field_config_field_key_idx" ON "registrasi_field_config"("field_key");

-- CreateIndex
CREATE INDEX "registrasi_field_config_section_idx" ON "registrasi_field_config"("section");

-- CreateIndex
CREATE UNIQUE INDEX "registrasi_field_config_tahun_ajaran_id_tipe_pendaftaran_id_key" ON "registrasi_field_config"("tahun_ajaran_id", "tipe_pendaftaran_id", "field_key");

-- CreateIndex
CREATE INDEX "registrasi_tahun_ajaran_id_idx" ON "registrasi"("tahun_ajaran_id");

-- CreateIndex
CREATE INDEX "registrasi_peserta_id_idx" ON "registrasi"("peserta_id");

-- CreateIndex
CREATE UNIQUE INDEX "registrasi_nomor_registrasi_tahun_ajaran_id_key" ON "registrasi"("nomor_registrasi", "tahun_ajaran_id");

-- CreateIndex
CREATE INDEX "registrasi_field_value_registrasi_id_idx" ON "registrasi_field_value"("registrasi_id");

-- CreateIndex
CREATE INDEX "tahun_ajaran_dokumen_config_tahun_ajaran_id_tipe_pendaftara_idx" ON "tahun_ajaran_dokumen_config"("tahun_ajaran_id", "tipe_pendaftaran_id");

-- CreateIndex
CREATE INDEX "tahun_ajaran_dokumen_config_jenis_dokumen_idx" ON "tahun_ajaran_dokumen_config"("jenis_dokumen");

-- CreateIndex
CREATE UNIQUE INDEX "tahun_ajaran_dokumen_config_tahun_ajaran_id_tipe_pendaftara_key" ON "tahun_ajaran_dokumen_config"("tahun_ajaran_id", "tipe_pendaftaran_id", "jenis_dokumen");

-- CreateIndex
CREATE INDEX "registrasi_dokumen_value_registrasi_id_idx" ON "registrasi_dokumen_value"("registrasi_id");

-- CreateIndex
CREATE INDEX "tahapan_peserta_registrasi_id_status_idx" ON "tahapan_peserta"("registrasi_id", "status");

-- CreateIndex
CREATE UNIQUE INDEX "tahapan_peserta_registrasi_id_tahapan_id_nomor_ujian_key" ON "tahapan_peserta"("registrasi_id", "tahapan_id", "nomor_ujian");

-- CreateIndex
CREATE INDEX "tahapan_alokasi_ujian_tahapan_peserta_id_idx" ON "tahapan_alokasi_ujian"("tahapan_peserta_id");

-- CreateIndex
CREATE INDEX "tahapan_komponen_nilai_value_tahapan_peserta_id_nomor_ujian_idx" ON "tahapan_komponen_nilai_value"("tahapan_peserta_id", "nomor_ujian");

-- CreateIndex
CREATE INDEX "tahapan_sesi_ujian_tahapan_alokasi_ujian_id_idx" ON "tahapan_sesi_ujian"("tahapan_alokasi_ujian_id");

-- CreateIndex
CREATE INDEX "tahapan_kelulusan_status_kelulusan_idx" ON "tahapan_kelulusan"("status_kelulusan");

-- CreateIndex
CREATE UNIQUE INDEX "tahapan_kelulusan_registrasi_id_key" ON "tahapan_kelulusan"("registrasi_id");

-- AddForeignKey
ALTER TABLE "tahun_ajaran_fase" ADD CONSTRAINT "tahun_ajaran_fase_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "tahun_ajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahun_ajaran_fase" ADD CONSTRAINT "tahun_ajaran_fase_master_fase_id_fkey" FOREIGN KEY ("master_fase_id") REFERENCES "master_fase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahun_ajaran_tipe_pendaftaran" ADD CONSTRAINT "tahun_ajaran_tipe_pendaftaran_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "tahun_ajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "master_lokasi" ADD CONSTRAINT "master_lokasi_provinsi_kode_fkey" FOREIGN KEY ("provinsi_kode") REFERENCES "master_provinsi"("kode") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahun_ajaran_lokasi" ADD CONSTRAINT "tahun_ajaran_lokasi_master_lokasi_id_fkey" FOREIGN KEY ("master_lokasi_id") REFERENCES "master_lokasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahun_ajaran_lokasi" ADD CONSTRAINT "tahun_ajaran_lokasi_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "tahun_ajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dokumen_lokasi" ADD CONSTRAINT "dokumen_lokasi_tahun_ajaran_lokasi_id_fkey" FOREIGN KEY ("tahun_ajaran_lokasi_id") REFERENCES "tahun_ajaran_lokasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahun_ajaran_formasi" ADD CONSTRAINT "tahun_ajaran_formasi_master_formasi_id_fkey" FOREIGN KEY ("master_formasi_id") REFERENCES "master_formasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahun_ajaran_formasi" ADD CONSTRAINT "tahun_ajaran_formasi_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "tahun_ajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta" ADD CONSTRAINT "peserta_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peserta" ADD CONSTRAINT "peserta_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "tahun_ajaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan" ADD CONSTRAINT "tahapan_master_tahapan_id_fkey" FOREIGN KEY ("master_tahapan_id") REFERENCES "master_tahapan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan" ADD CONSTRAINT "tahapan_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "tahun_ajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan" ADD CONSTRAINT "tahapan_tipe_pendaftaran_id_fkey" FOREIGN KEY ("tipe_pendaftaran_id") REFERENCES "tahun_ajaran_tipe_pendaftaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan" ADD CONSTRAINT "tahapan_tahun_ajaran_formasi_id_fkey" FOREIGN KEY ("tahun_ajaran_formasi_id") REFERENCES "tahun_ajaran_formasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi_field_config" ADD CONSTRAINT "registrasi_field_config_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "tahun_ajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi_field_config" ADD CONSTRAINT "registrasi_field_config_tipe_pendaftaran_id_fkey" FOREIGN KEY ("tipe_pendaftaran_id") REFERENCES "tahun_ajaran_tipe_pendaftaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "field_config_validation_rule" ADD CONSTRAINT "field_config_validation_rule_registrasi_field_config_id_fkey" FOREIGN KEY ("registrasi_field_config_id") REFERENCES "registrasi_field_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "field_config_option" ADD CONSTRAINT "field_config_option_registrasi_field_config_id_fkey" FOREIGN KEY ("registrasi_field_config_id") REFERENCES "registrasi_field_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "field_config_depends_on" ADD CONSTRAINT "field_config_depends_on_registrasi_field_config_id_fkey" FOREIGN KEY ("registrasi_field_config_id") REFERENCES "registrasi_field_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi" ADD CONSTRAINT "registrasi_tahun_ajaran_formasi_id_fkey" FOREIGN KEY ("tahun_ajaran_formasi_id") REFERENCES "tahun_ajaran_formasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi" ADD CONSTRAINT "registrasi_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "tahun_ajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi" ADD CONSTRAINT "registrasi_peserta_id_fkey" FOREIGN KEY ("peserta_id") REFERENCES "peserta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi" ADD CONSTRAINT "registrasi_tipe_pendaftaran_id_fkey" FOREIGN KEY ("tipe_pendaftaran_id") REFERENCES "tahun_ajaran_tipe_pendaftaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi_field_value" ADD CONSTRAINT "registrasi_field_value_registrasi_field_config_id_fkey" FOREIGN KEY ("registrasi_field_config_id") REFERENCES "registrasi_field_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi_field_value" ADD CONSTRAINT "registrasi_field_value_registrasi_id_fkey" FOREIGN KEY ("registrasi_id") REFERENCES "registrasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahun_ajaran_dokumen_config" ADD CONSTRAINT "tahun_ajaran_dokumen_config_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "tahun_ajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahun_ajaran_dokumen_config" ADD CONSTRAINT "tahun_ajaran_dokumen_config_tipe_pendaftaran_id_fkey" FOREIGN KEY ("tipe_pendaftaran_id") REFERENCES "tahun_ajaran_tipe_pendaftaran"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi_dokumen_value" ADD CONSTRAINT "registrasi_dokumen_value_registrasi_dokumen_config_id_fkey" FOREIGN KEY ("registrasi_dokumen_config_id") REFERENCES "tahun_ajaran_dokumen_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi_dokumen_value" ADD CONSTRAINT "registrasi_dokumen_value_registrasi_id_fkey" FOREIGN KEY ("registrasi_id") REFERENCES "registrasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registrasi_dokumen_value" ADD CONSTRAINT "registrasi_dokumen_value_verified_by_user_id_fkey" FOREIGN KEY ("verified_by_user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_peserta" ADD CONSTRAINT "tahapan_peserta_tahapan_id_fkey" FOREIGN KEY ("tahapan_id") REFERENCES "tahapan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_peserta" ADD CONSTRAINT "tahapan_peserta_registrasi_id_fkey" FOREIGN KEY ("registrasi_id") REFERENCES "registrasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_alokasi_ujian" ADD CONSTRAINT "tahapan_alokasi_ujian_tahapan_peserta_id_fkey" FOREIGN KEY ("tahapan_peserta_id") REFERENCES "tahapan_peserta"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_alokasi_ujian" ADD CONSTRAINT "tahapan_alokasi_ujian_tahun_ajaran_lokasi_id_fkey" FOREIGN KEY ("tahun_ajaran_lokasi_id") REFERENCES "tahun_ajaran_lokasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_komponen_nilai_config" ADD CONSTRAINT "tahapan_komponen_nilai_config_tahapan_id_fkey" FOREIGN KEY ("tahapan_id") REFERENCES "tahapan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_komponen_nilai_value" ADD CONSTRAINT "tahapan_komponen_nilai_value_tahapan_komponen_nilai_config_fkey" FOREIGN KEY ("tahapan_komponen_nilai_config_id") REFERENCES "tahapan_komponen_nilai_config"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_komponen_nilai_value" ADD CONSTRAINT "tahapan_komponen_nilai_value_tahapan_peserta_id_fkey" FOREIGN KEY ("tahapan_peserta_id") REFERENCES "tahapan_peserta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahun_ajaran_sesi_ujian" ADD CONSTRAINT "tahun_ajaran_sesi_ujian_tahun_ajaran_id_fkey" FOREIGN KEY ("tahun_ajaran_id") REFERENCES "tahun_ajaran"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_sesi_ujian" ADD CONSTRAINT "tahapan_sesi_ujian_tahun_ajaran_sesi_ujian_id_fkey" FOREIGN KEY ("tahun_ajaran_sesi_ujian_id") REFERENCES "tahun_ajaran_sesi_ujian"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_sesi_ujian" ADD CONSTRAINT "tahapan_sesi_ujian_tahapan_alokasi_ujian_id_fkey" FOREIGN KEY ("tahapan_alokasi_ujian_id") REFERENCES "tahapan_alokasi_ujian"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tahapan_kelulusan" ADD CONSTRAINT "tahapan_kelulusan_registrasi_id_fkey" FOREIGN KEY ("registrasi_id") REFERENCES "registrasi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

