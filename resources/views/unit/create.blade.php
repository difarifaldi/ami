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
                                    <li class="breadcrumb-item"><a href="/unit"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Form Unit</li>
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
                                            <h4 class="text-center my-4">Form Unit</h4>
                                        </div>
                                        <hr />
                                        <!-- Formulir pendaftaran -->
                                        <form id="unit-form" action="{{ route('unit.store') }}" method="POST"
                                            enctype="multipart/form-data">
                                            @csrf

                                            <div class="form-group mt-4">
                                                <label>Nama Unit</label>
                                                <input type="text" name="nama" id="nama"
                                                    class="form-control @error('nama')
                                                    is-invalid
                                                @enderror"
                                                    value="{{ old('nama') }}" placeholder="Masukan Nama Unit" />
                                                <!-- error message untuk nama -->
                                                @error('nama')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="form-group mt-4">
                                                <label for="gambar" class="form-label">Logo</label>
                                                <img class="img-preview img-fluid mb-3 col-sm-3">
                                                <div class="custom-file">
                                                    <input type="file"
                                                        class="custom-file-input @error('gambar')is-invalid @enderror"
                                                        name="gambar" id="gambar"
                                                        aria-describedby="inputGroupFileAddon01" onchange="previewImage()">
                                                    <label class="custom-file-label" for="gambar">Choose
                                                        File</label>
                                                </div>
                                                @error('gambar')
                                                    <div class="d-block text-danger">
                                                        {{ $message }}
                                                    </div>
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
    <script>
        function previewImage() {
            const image = document.querySelector("#gambar");
            const imgPreview = document.querySelector(".img-preview");

            imgPreview.style.display = 'block';

            const lihatgambar = URL.createObjectURL(image.files[0]);
            imgPreview.src = lihatgambar;

        }
    </script>
@endsection
