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
                                    <li class="breadcrumb-item"><a href="/pernyataan"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Form Pernyataan Standar</li>
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
                                            <h4 class="text-center my-4">Edit Pernyataan Standar</h4>
                                        </div>
                                        <hr />
                                        <!-- Formulir pendaftaran -->
                                        <form id="pernyataan-form"
                                            action="{{ route('pernyataan.update', $pernyataan->id) }}" method="POST"
                                            enctype="multipart/form-data">
                                            @csrf
                                            @method('PATCH')
                                            <!--  no_ps -->
                                            <div class="form-group mt-4">
                                                <label>No Pernyataan Standar</label>
                                                <input type="text" name="no_ps" id="no_ps"
                                                    class="form-control bg-white @error('no_ps')
                                                    is-invalid
                                                @enderror"
                                                    value="{{ $pernyataan->no_ps }}"
                                                    placeholder="Masukan Nomor Peryataan Standar"
                                                    @hasanyrole('auditee|auditor|manajemen') readonly @endhasanyrole>
                                                <!-- error message untuk no_ps -->
                                                @error('no_ps')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Pernyataan Standar</label>
                                                <input id="pernyataan_standar" type="hidden" name="pernyataan_standar"
                                                    value="{{ $pernyataan->pernyataan_standar }}">
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

                                            <div class="form-group mt-4">
                                                <label>Unit</label>
                                                <select class="form-control" name="id_unit" id="id_unit">
                                                    <option value="">Silahkan pilih unit</option>
                                                    @foreach ($units as $unit)
                                                        @if ($pernyataan->id_unit === $unit->id)
                                                            <option value="{{ $unit->id }}" selected>
                                                                {{ $unit->nama }}
                                                            </option>
                                                        @else
                                                            <option value="{{ $unit->id }}">
                                                                {{ $unit->nama }}
                                                            </option>
                                                        @endif
                                                    @endforeach
                                                </select>
                                                @error('id_unit')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>



                                            <div class="btn-group mt-3 w-100">
                                                <button type="submit" class="btn btn-primary btn-block">Simpan</button>
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
