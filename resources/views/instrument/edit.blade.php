@extends('layouts.layouts')

@section('content')
    <!-- wrapper -->
    <div class="wrapper">
        <!--page-wrapper-->
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <!--breadcrumb-->
                    <div class="page-breadcrumb d-none d-md-flex align-items-center mb-3">
                        <div class="breadcrumb-title pr-3">Forms</div>
                        <div class="pl-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="/instrument"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Form Instrument</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!--end breadcrumb-->
                    <div class="container mt-5 mb-5">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card border-0 shadow-sm rounded">
                                    <div class="card-body">
                                        <div>
                                            <h4 class="text-center my-4">Edit Instrument</h4>
                                        </div>
                                        <hr />
                                        <!-- Formulir pendaftaran -->
                                        <form id="instrument-form"
                                            action="{{ route('instrument.update', $instrument->id) }}" method="POST"
                                            enctype="multipart/form-data">
                                            @csrf
                                            @method('patch')
                                            <h3>Diisi Admin</h3>

                                            <!--  selain admin -->
                                            <div class="form-group mt-4">
                                                <label>pernyataan Standar</label>
                                                <div class="border p-2">
                                                    {!! $instrument->pernyataan_standar !!}
                                                </div>
                                            </div>


                                            <!--  selain admin -->
                                            <div class="form-group mt-4">
                                                <label>Indikator</label>
                                                <div class="border p-2">
                                                    {!! $instrument->indikator !!}
                                                </div>
                                            </div>

                                            @hasanyrole('auditee|auditor|manajemen')
                                                <h3 class="mt-4">Diisi Auditee</h3>
                                                <!--  Deskripsi Temuan -->
                                                <div class="form-group mt-4">
                                                    <label>Deskripsi Temuan</label>
                                                    <input type="text" name="deskripsi_temuan" id="deskripsi_temuan"
                                                        class="form-control bg-white @error('deskripsi_temuan')
                                                        is-invalid
                                                    @enderror"
                                                        value="{{ old('deskripsi_temuan', $instrument->deskripsi_temuan) }}"
                                                        placeholder="Masukan Keadaan"
                                                        @hasanyrole('auditor|manajemen') readonly @endhasanyrole>
                                                    <!-- error message untuk deskripsi_temuan -->
                                                    @error('deskripsi_temuan')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>

                                                <!--  Akar Penyebab -->
                                                <div class="form-group mt-4">
                                                    <label>Akar Penyebab</label>
                                                    <input type="text" name="akar_penyebab" id="akar_penyebab"
                                                        class="form-control bg-white @error('akar_penyebab')
                                                        is-invalid
                                                    @enderror"
                                                        value="{{ old('akar_penyebab', $instrument->akar_penyebab) }}"
                                                        placeholder="Masukan Akar Penyebab"
                                                        @hasanyrole('auditor|manajemen') readonly @endhasanyrole>
                                                    <!-- error message untuk akar_penyebab -->
                                                    @error('akar_penyebab')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>

                                                <!--  Akibat -->
                                                <div class="form-group mt-4">
                                                    <label>Akibat</label>
                                                    <input type="text" name="akibat" id="akibat"
                                                        class="form-control bg-white @error('akibat')
                                                        is-invalid
                                                    @enderror"
                                                        value="{{ old('akibat', $instrument->akibat) }}"
                                                        placeholder="Masukan Akibat"
                                                        @hasanyrole('auditor|manajemen') readonly @endhasanyrole>
                                                    <!-- error message untuk akibat -->
                                                    @error('akibat')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>



                                                <!--  Bukti -->
                                                <div class="form-group mt-4">
                                                    <label>Bukti</label>
                                                    <input type="text" name="bukti" id="bukti"
                                                        class="form-control bg-white @error('bukti')
                                                        is-invalid
                                                    @enderror"
                                                        value="{{ old('bukti', $instrument->bukti) }}"
                                                        placeholder="Masukan Bukti Berupa Link"
                                                        @hasanyrole('auditor|manajemen') readonly @endhasanyrole>
                                                    <!-- error message untuk bukti -->
                                                    @error('bukti')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror

                                                    <a href="{{ $instrument->bukti }}" target="_blank"
                                                        class="btn btn-sm btn-primary mt-2 {{ !$instrument->bukti ? 'd-none' : '' }}">Buka
                                                        Tautan</a>
                                                </div>

                                                <!--  Status Tercapai -->
                                                <div class="form-group mt-4">
                                                    <label>Status Tercapai</label>
                                                    <select name="id_status_tercapai" id="id_status_tercapai"
                                                        class="form-control bg-white"
                                                        @hasanyrole('auditor|manajemen') disabled @endhasanyrole>
                                                        @foreach ($status_tercapai as $trcapai)
                                                            <option value="{{ $trcapai->id }}"
                                                                {{ old('id_status_tercapai', $instrument->id_status_tercapai) == $trcapai->id ? 'selected' : '' }}>
                                                                {{ $trcapai->nama }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            @endhasanyrole

                                            @hasanyrole('auditor|manajemen')
                                                <h3 class="mt-4">Diisi Auditor</h3>
                                                <!--  Temuan -->
                                                <div class="form-group mt-4">
                                                    <label>Temuan Audit</label>
                                                    <input type="text" name="temuan_audit" id="temuan_audit"
                                                        class="form-control bg-white @error('temuan_audit')
                                                            is-invalid
                                                            @enderror"
                                                        value="{{ old('temuan_audit', $instrument->temuan_audit) }}"
                                                        placeholder="Masukan Temuan " @role('manajemen') readonly @endrole>
                                                    <!-- error message untuk temuan_audit -->
                                                    @error('temuan_audit')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>

                                                <!--  Rekomendasi -->
                                                <div class="form-group mt-4">
                                                    <label>Rekomendasi Auditor</label>
                                                    <input type="text" name="rekomendasi_auditor" id="rekomendasi_auditor"
                                                        class="form-control bg-white @error('rekomendasi_auditor')
                                                    is-invalid
                                                @enderror"
                                                        value="{{ old('rekomendasi_auditor', $instrument->rekomendasi_auditor) }}"
                                                        placeholder="Masukan Rekomendasi "
                                                        @role('manajemen') readonly @endrole>
                                                    <!-- error message untuk rekomendasi_auditor -->
                                                    @error('rekomendasi_auditor')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>

                                                <!--  Tanggapan Auditee -->
                                                <div class="form-group mt-4">
                                                    <label>Tanggapan Auditee</label>
                                                    <input type="text" name="tanggapan_auditee" id="tanggapan_auditee"
                                                        class="form-control bg-white @error('tanggapan_auditee')is-invalid
                                                                        @enderror"
                                                        value="{{ old('tanggapan_auditee', $instrument->tanggapan_auditee) }}"
                                                        placeholder="Masukan Tanggapan Auditee "
                                                        @role('manajemen') readonly @endrole>
                                                    <!-- error message untuk tanggapan_auditee -->
                                                    @error('tanggapan_auditee')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>

                                                <!--  Penanggung Jawab -->
                                                <div class="form-group mt-4">
                                                    <label>Penanggung Jawab</label>
                                                    <input type="text" name="penanggung_jawab" id="penanggung_jawab"
                                                        class="form-control bg-white @error('penanggung_jawab')is-invalid
                                                            @enderror"
                                                        value="{{ old('penanggung_jawab', $instrument->penanggung_jawab) }}"
                                                        placeholder="Masukan Penanggung Jawab "
                                                        @role('manajemen') readonly @endrole>
                                                    <!-- error message untuk penanggung_jawab -->
                                                    @error('penanggung_jawab')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>

                                                <!--  Link -->
                                                <div class="form-group mt-4">
                                                    <label>Link</label>
                                                    <input type="text" name="link" id="link"
                                                        class="form-control bg-white @error('link')is-invalid
                                                            @enderror"
                                                        value="{{ old('link', $instrument->link) }}"
                                                        placeholder="Masukan Link " @role('manajemen') readonly @endrole>
                                                    <!-- error message untuk link -->
                                                    @error('link')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror

                                                    <a href="{{ $instrument->link }}" target="_blank"
                                                        class="btn btn-sm btn-primary mt-2 {{ !$instrument->link ? 'd-none' : '' }}">Buka
                                                        Tautan</a>
                                                </div>

                                                <!--  Status Temuan -->
                                                <div class="form-group mt-4">
                                                    <label>Status Temuan</label>
                                                    <select name="id_status_temuan" id="id_status_temuan"
                                                        class="form-control bg-white" @role('manajemen') disabled @endrole>
                                                        @foreach ($status_temuan as $temuan_audit)
                                                            <option value="{{ $temuan_audit->id }}"
                                                                {{ old('id_status_temuan', $instrument->id_status_temuan) == $temuan_audit->id ? 'selected' : '' }}>
                                                                {{ $temuan_audit->nama }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            @endhasanyrole
                                            @role('manajemen')
                                                <h3 class="mt-4">Diisi Manajemen</h3>

                                                <!-- Rencana Tindak Lanjut -->
                                                <div class="form-group mt-4">
                                                    <label>Rencana Tindak Lanjut</label>
                                                    <input type="text" name="rencana_perbaikan" id="rencana_perbaikan"
                                                        class="form-control bg-white @error('rencana_perbaikan')is-invalid
                                                        @enderror"
                                                        value="{{ old('rencana_perbaikan', $instrument->rencana_perbaikan) }}"
                                                        placeholder="Masukan Rencana Tindak Lanjut ">
                                                    <!-- error message untuk rencana_perbaikan -->
                                                    @error('rencana_perbaikan')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>


                                                <!--  Jadwal Perbaikan -->
                                                <div class="form-group mt-4">
                                                    <label>Jadwal Perbaikan</label>
                                                    <input type="datetime-local" class="form-control"
                                                        name="jadwal_penyelesaian"
                                                        value="{{ old('jadwal_penyelesaian', $instrument->jadwal_penyelesaian) }}">

                                                    <!-- error message untuk jadwal_penyelesaian -->
                                                    @error('jadwal_penyelesaian')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>


                                                <!--  Status Akhir -->
                                                <div class="form-group mt-4">
                                                    <label>Status Akhir</label>
                                                    <select name="id_status_akhir" id="id_status_akhir"
                                                        class="form-control bg-white">
                                                        @foreach ($status_akhir as $akhir)
                                                            <option value="{{ $akhir->id }}"
                                                                {{ old('id_status_akhir', $instrument->id_status_akhir) == $akhir->id ? 'selected' : '' }}>
                                                                {{ $akhir->nama }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            @endrole
                                            <!--  kirim -->
                                            <div class="btn-group mt-3 w-100">
                                                <button type="submit" class="btn btn-primary btn-block">Kirim</button>
                                            </div>
                                        </form>
                                        <!-- End Formulir pendaftaran -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
