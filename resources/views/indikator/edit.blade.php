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
                                    <li class="breadcrumb-item"><a href="/indikator"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Edit Indikator</li>
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
                                            <h4 class="text-center my-4">Edit Indikator</h4>
                                        </div>
                                        <hr />
                                        <!-- Formulir pendaftaran -->
                                        <form id="indikator-form" action="{{ route('indikator.update', $indikator->id) }}"
                                            method="POST" enctype="multipart/form-data">
                                            @csrf
                                            @method('PATCH')

                                            <div class="form-group mt-4">
                                                <label>No Pernyataan Standar</label>
                                                <select name="id_pernyataan" id="id_pernyataan"
                                                    class="form-control bg-white" onchange="updatePernyataanStandar()">
                                                    <option value="">Silahkan Pilih Pernyataan Standar</option>
                                                    @foreach ($pernyataans as $pernyataan)
                                                        <option value="{{ $pernyataan->id }}"
                                                            data-pernyataan="{!! htmlspecialchars($pernyataan->pernyataan_standar) !!}"
                                                            {{ old('id_pernyataan', $indikator->id_pernyataan) == $pernyataan->id ? 'selected' : '' }}>
                                                            {{ $pernyataan->no_ps }}
                                                        </option>
                                                    @endforeach
                                                </select>

                                                @error('id_pernyataan')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Pernyataan Standar</label>
                                                <div class="border p-2" id="pernyataan_standar">
                                                    {!! $pernyataan_standar ?? '' !!}
                                                </div>
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Nomor Indikator</label>
                                                <input type="text" name="no" id="no"
                                                    value="{{ $indikator->no }}"
                                                    class="form-control bg-white @error('no')
                                                    is-invalid
                                                @enderror"
                                                    placeholder="Masukan Nomor Indikator" />
                                                <!-- error message untuk no -->
                                                @error('no')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Indikator</label>
                                                <input id="indikator" type="hidden" name="indikator"
                                                    value="{{ $indikator->indikator }}">
                                                <trix-editor
                                                    class="@error('indikator')
                                                border-danger
                                            @enderror"
                                                    input="indikator"></trix-editor>
                                                <!-- error message untuk indikator -->
                                                @error('indikator')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror



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
    <script>
        function updatePernyataanStandar() {
            var select = document.getElementById('id_pernyataan');
            var pernyataan = select.options[select.selectedIndex].getAttribute('data-pernyataan');
            document.getElementById('pernyataan_standar').innerHTML = pernyataan ? pernyataan : '';
        }

        // Optionally, call the function once to set the initial value if a selection is already made.
        updatePernyataanStandar();
    </script>
@endsection
