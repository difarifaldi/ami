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
                                    <li class="breadcrumb-item"><a href="/standar"><i class='bx bx-home-alt'></i></a>
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
                                                value="{{ $standar->no_ps }}" readonly />
                                        </div>

                                        <div class="form-group mt-4">
                                            <label>pernyataan Standar</label>
                                            <div class="border p-2">
                                                {!! $standar->pernyataan_standar !!}
                                            </div>
                                        </div>
                                        <div class="form-group mt-4">
                                            <label>Nomor Indikator</label>
                                            <input type="text" class="form-control bg-white" value="{{ $standar->no }}"
                                                readonly />
                                        </div>

                                        <div class="form-group mt-4">
                                            <label>Indikator</label>
                                            <div class="border p-2">
                                                {!! $standar->indikator !!}
                                            </div>
                                        </div>


                                        @hasanyrole('auditee|auditor')
                                            <!-- Bagian Auditee -->
                                            <h3>Bagian Auditee</h3>
                                            <div class="form-group mt-4">
                                                <label>Keadaan</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $standar->keadaan ? $standar->keadaan : '-' }}" readonly />
                                            </div>

                                            <div class="form-group mt-4">
                                                <label for="bukti">Bukti</label>
                                                <input type="text" class="form-control bg-white" id="bukti"
                                                    value="{{ $standar->bukti ? $standar->bukti : '-' }}" readonly />

                                                <a href="{{ $standar->bukti }}" target="_blank"
                                                    class="btn btn-sm btn-primary mt-2 {{ !$standar->bukti ? 'd-none' : '' }}">Buka
                                                    Tautan</a>
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Status Ketercapaian</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $standar->statusTercapai ? $standar->statusTercapai->nama : '-' }}"
                                                    readonly />
                                            </div>
                                        @endhasanyrole
                                        <!-- Bagian Auditor -->
                                        @role('auditor')
                                            <h3>Bagian Auditor</h3>
                                            <div class="form-group mt-4">
                                                <label>Temuan</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $standar->temuan }}" readonly />
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Rekomendasi</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $standar->rekomendasi }}" readonly />
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Penanggung Jawab</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $standar->penanggung_jawab }}" readonly />
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Link</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $standar->link }}" readonly />
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Status Temuan</label>
                                                <input type="text" class="form-control bg-white"
                                                    value="{{ $standar->statusTemuan ? $standar->statusTemuan->nama : '-' }}"
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
