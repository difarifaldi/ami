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
                        <div class="breadcrumb-title pr-3">Detail</div>
                        <div class="pl-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="/instrument"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Detail Instrumen</li>
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
                                            <h4 class="text-center my-4">Detail Instrumen</h4>
                                        </div>
                                        <hr />
                                        <!-- Instrumen -->
                                        <!-- Bagian Admin -->
                                        <h3>Bagian Admin</h3>
                                        <div class="form-group mt-4">
                                            <label>No Pernyataan Standar</label>
                                            <input type="text" class="form-control bg-white"
                                                value="{{ $instrument->indikator->pernyataan->no_ps }}" readonly />
                                        </div>

                                        <div class="form-group mt-4">
                                            <label>pernyataan Standar</label>
                                            <div class="border p-2">
                                                {!! $instrument->indikator->pernyataan->pernyataan_standar !!}
                                            </div>
                                        </div>
                                        <div class="form-group mt-4">
                                            <label>Nomor Indikator</label>
                                            <input type="text" class="form-control bg-white"
                                                value="{{ $instrument->indikator->no }}" readonly />
                                        </div>

                                        <div class="form-group mt-4 mb-5">
                                            <label>Indikator</label>
                                            <div class="border p-2">
                                                {!! $instrument->indikator->indikator !!}
                                            </div>
                                        </div>


                                        @hasanyrole('auditee|auditor|manajemen')
                                            <!-- Bagian Auditee -->

                                            <h3>Bagian Auditee</h3>
                                            <div class="form-group mt-4">
                                                <label>Deskripsi Temuan</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->deskripsi_temuan ? $instrument->deskripsi_temuan : '-' }}"
                                                    readonly />
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Akar Penyebab</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->akar_penyebab ? $instrument->akar_penyebab : '-' }}"
                                                    readonly />
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Akibat</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->akibat ? $instrument->akibat : '-' }}" readonly />
                                            </div>

                                            <div class="form-group mt-4">
                                                <label for="bukti">Bukti Temuan</label>
                                                <input type="text" class="form-control bg-white" id="bukti"
                                                    value="{{ $instrument->bukti ? $instrument->bukti : '-' }}" readonly />

                                                <a href="{{ $instrument->bukti }}" target="_blank"
                                                    class="btn btn-sm btn-primary mt-2 {{ !$instrument->bukti ? 'd-none' : '' }}">Buka
                                                    Tautan</a>
                                            </div>

                                            <div class="form-group mt-4 mb-5">
                                                <label>Status Ketercapaian</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->statusTercapai ? $instrument->statusTercapai->nama : '-' }}"
                                                    readonly />
                                            </div>
                                        @endhasanyrole
                                        <!-- Bagian Auditor -->
                                        @hasanyrole('auditor|manajemen')
                                            <h3>Bagian Auditor</h3>
                                            <div class="form-group mt-4">
                                                <label>Temuan Audit</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->temuan_audit ? $instrument->temuan_audit : '-' }}"
                                                    readonly />
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Rekomendasi Auditor</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->rekomendasi_auditor ? $instrument->rekomendasi_auditor : '-' }}"
                                                    readonly />
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Penanggung Jawab Perbaikan</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->penanggung_jawab ? $instrument->penanggung_jawab : '-' }}"
                                                    readonly />
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Link Bukti Tindak Lanjut</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->link ? $instrument->link : '-' }}" readonly />

                                                <a href="{{ $instrument->link }}" target="_blank"
                                                    class="btn btn-sm btn-primary mt-2 {{ !$instrument->link ? 'd-none' : '' }}">Buka
                                                    Tautan</a>
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Status Temuan</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->statusTemuan ? $instrument->statusTemuan->nama : '-' }}"
                                                    readonly />
                                            </div>
                                            <div class="form-group mt-4  mb-5">
                                                <label>Tanggapan Auditee</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->tanggapan_auditee ? $instrument->tanggapan_auditee : '-' }}"
                                                    readonly />
                                            </div>
                                        @endhasanyrole

                                        @role('manajemen')
                                            <h3>Bagian Manajemen</h3>

                                            <div class="form-group mt-4">
                                                <label>Rencana Tindak Lanjut</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->rencana_perbaikan ? $instrument->rencana_perbaikan : '-' }}"
                                                    readonly />
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Jadwal Penyelesaian</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->jadwal_penyelesaian ? \Carbon\Carbon::parse($instrument->jadwal_penyelesaian)->format('d, M Y') : '-' }}"
                                                    readonly />
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Status Akhir</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $instrument->statusAkhir ? $instrument->statusAkhir->nama : '-' }}"
                                                    readonly />
                                            </div>
                                        @endrole
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endsection
