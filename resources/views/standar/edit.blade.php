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
                                    <li class="breadcrumb-item"><a href="/standar"><i class='bx bx-home-alt'></i></a>
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
                                        <form id="standar-form" action="{{ route('standar.update', $standar->id) }}"
                                            method="POST" enctype="multipart/form-data">
                                            @csrf
                                            @method('patch')
                                            <h3>Diisi Admin</h3>
                                            <!--  no_ps -->
                                            <div class="form-group mt-4">
                                                <label>No Pernyataan Standar</label>
                                                <input type="text" name="no_ps" id="no_ps"
                                                    class="form-control bg-white @error('no_ps')
                                                    is-invalid
                                                @enderror"
                                                    value="{{ $standar->no_ps }}"
                                                    placeholder="Masukan Nomor Peryataan Standar"
                                                    @hasanyrole('auditee|auditor|manajemen') readonly @endhasanyrole>
                                                <!-- error message untuk no_ps -->
                                                @error('no_ps')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <!--  pernyataan standar -->

                                            <!--  bagian admin -->
                                            @role('superadmin')
                                                <div class="form-group mt-4">
                                                    <label>pernyataan Standar</label>
                                                    <input id="pernyataan_standar" type="hidden" name="pernyataan_standar"
                                                        value="{{ $standar->pernyataan_standar }}">
                                                    <trix-editor
                                                        class="@error('pernyataan_standar')
                                                    border-danger
                                                @enderror"
                                                        input="pernyataan_standar"></trix-editor>
                                                    <!-- error message untuk pernyataan_standar -->
                                                    @error('pernyataan_standar')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            @endrole

                                            <!--  selain admin -->
                                            <div class="form-group mt-4">
                                                <label>pernyataan Standar</label>
                                                <div class="border p-2">
                                                    {!! $standar->pernyataan_standar !!}
                                                </div>
                                            </div>

                                            <!--  no indikator -->
                                            <div class="form-group mt-4">
                                                <label>Nomor Indikator</label>
                                                <input type="text" name="no" id="no"
                                                    value="{{ $standar->no }}"
                                                    class="form-control bg-white @error('no')
                                                    is-invalid
                                                @enderror"
                                                    placeholder="Masukan Nomor Indikator"
                                                    @hasanyrole('auditee|auditor|manajemen') readonly @endhasanyrole />
                                                <!-- error message untuk no -->
                                                @error('no')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>


                                            <!--  indikator -->
                                            <!--  bagian admin -->
                                            @role('superadmin')
                                                <div class="form-group mt-4">
                                                    <label>Indikator</label>
                                                    <input id="indikator" type="hidden" name="indikator"
                                                        value="{{ $standar->indikator }}">
                                                    <trix-editor
                                                        class="@error('indikator')
                                                    border-danger
                                                @enderror"
                                                        input="indikator"></trix-editor>
                                                    <!-- error message untuk indikator -->
                                                    @error('indikator')
                                                        <div class="d-block text-danger">{{ $message }}</div>
                                                    @enderror
                                                @endrole

                                                <!--  selain admin -->
                                                <div class="form-group mt-4">
                                                    <label>Indikator</label>
                                                    <div class="border p-2">
                                                        {!! $standar->indikator !!}
                                                    </div>
                                                </div>

                                                @hasanyrole('auditee|auditor|manajemen')
                                                    <h3 class="mt-4">Diisi Auditee</h3>
                                                    <!--  Keadaan -->
                                                    <div class="form-group mt-4">
                                                        <label>Keadaan</label>
                                                        <input type="text" name="keadaan" id="keadaan"
                                                            class="form-control bg-white @error('keadaan')
                                                        is-invalid
                                                    @enderror"
                                                            value="{{ old('keadaan', $standar->keadaan) }}"
                                                            placeholder="Masukan Keadaan"
                                                            @hasanyrole('auditor|manajemen') readonly @endhasanyrole>
                                                        <!-- error message untuk keadaan -->
                                                        @error('keadaan')
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
                                                            value="{{ old('bukti', $standar->bukti) }}"
                                                            placeholder="Masukan Bukti Berupa Link"
                                                            @hasanyrole('auditor|manajemen') readonly @endhasanyrole>
                                                        <!-- error message untuk bukti -->
                                                        @error('bukti')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror

                                                        <a href="{{ $standar->bukti }}" target="_blank"
                                                            class="btn btn-sm btn-primary mt-2 {{ !$standar->bukti ? 'd-none' : '' }}">Buka
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
                                                                    {{ old('id_status_tercapai', $standar->id_status_tercapai) == $trcapai->id ? 'selected' : '' }}>
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
                                                        <label>Temuan</label>
                                                        <input type="text" name="temuan" id="temuan"
                                                            class="form-control bg-white @error('temuan')
                                                            is-invalid
                                                            @enderror"
                                                            value="{{ old('temuan', $standar->temuan) }}"
                                                            placeholder="Masukan Temuan " @role('manajemen') readonly @endrole>
                                                        <!-- error message untuk temuan -->
                                                        @error('temuan')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>

                                                    <!--  Rekomendasi -->
                                                    <div class="form-group mt-4">
                                                        <label>Rekomendasi</label>
                                                        <input type="text" name="rekomendasi" id="rekomendasi"
                                                            class="form-control bg-white @error('rekomendasi')
                                                    is-invalid
                                                @enderror"
                                                            value="{{ old('rekomendasi', $standar->rekomendasi) }}"
                                                            placeholder="Masukan Rekomendasi "
                                                            @role('manajemen') readonly @endrole>
                                                        <!-- error message untuk rekomendasi -->
                                                        @error('rekomendasi')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>

                                                    <!--  Penanggung Jawab -->
                                                    <div class="form-group mt-4">
                                                        <label>Penanggung Jawab</label>
                                                        <input type="text" name="penanggung_jawab" id="penanggung_jawab"
                                                            class="form-control bg-white @error('penanggung_jawab')is-invalid
                                                            @enderror"
                                                            value="{{ old('penanggung_jawab', $standar->penanggung_jawab) }}"
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
                                                            value="{{ old('link', $standar->link) }}"
                                                            placeholder="Masukan Link " @role('manajemen') readonly @endrole>
                                                        <!-- error message untuk link -->
                                                        @error('link')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror

                                                        <a href="{{ $standar->link }}" target="_blank"
                                                            class="btn btn-sm btn-primary mt-2 {{ !$standar->link ? 'd-none' : '' }}">Buka
                                                            Tautan</a>
                                                    </div>

                                                    <!--  Status Temuan -->
                                                    <div class="form-group mt-4">
                                                        <label>Status Temuan</label>
                                                        <select name="id_status_temuan" id="id_status_temuan"
                                                            class="form-control bg-white"
                                                            @role('manajemen') disabled @endrole>
                                                            @foreach ($status_temuan as $temuan)
                                                                <option value="{{ $temuan->id }}"
                                                                    {{ old('id_status_temuan', $standar->id_status_temuan) == $temuan->id ? 'selected' : '' }}>
                                                                    {{ $temuan->nama }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                @endhasanyrole
                                                @role('manajemen')
                                                    <h3 class="mt-4">Diisi Manajemen</h3>
                                                    <!-- Important -->
                                                    <div class="form-group mt-4">
                                                        <label>Important</label>
                                                        <input type="text" name="important" id="important"
                                                            class="form-control bg-white @error('important')is-invalid
                                                        @enderror"
                                                            value="{{ old('important', $standar->important) }}"
                                                            placeholder="Masukan Important ">
                                                        <!-- error message untuk important -->
                                                        @error('important')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>

                                                    <!-- Urgensi -->
                                                    <div class="form-group mt-4">
                                                        <label>Urgensi</label>
                                                        <input type="text" name="urgen" id="urgen"
                                                            class="form-control bg-white @error('urgen')is-invalid
                                                        @enderror"
                                                            value="{{ old('urgen', $standar->urgen) }}"
                                                            placeholder="Masukan Urgensi ">
                                                        <!-- error message untuk urgen -->
                                                        @error('urgen')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>

                                                    <!-- Rencana Tindak Lanjut -->
                                                    <div class="form-group mt-4">
                                                        <label>Rencana Tindak Lanjut</label>
                                                        <input type="text" name="rencana" id="rencana"
                                                            class="form-control bg-white @error('rencana')is-invalid
                                                        @enderror"
                                                            value="{{ old('rencana', $standar->rencana) }}"
                                                            placeholder="Masukan Rencana Tindak Lanjut ">
                                                        <!-- error message untuk rencana -->
                                                        @error('rencana')
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
                                                                    {{ old('id_status_akhir', $standar->id_status_akhir) == $akhir->id ? 'selected' : '' }}>
                                                                    {{ $akhir->nama }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                @endrole
                                                <!--  kirim -->
                                                <div class="btn-group mt-3 w-100">
                                                    <button type="submit"
                                                        class="btn btn-primary btn-block">Kirim</button>
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
