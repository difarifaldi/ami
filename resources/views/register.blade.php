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
                                    <li class="breadcrumb-item"><a href="/admin"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Form Pembuatan Akun Baru</li>
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
                                            <h4 class="text-center my-4">Form Pembuatan Akun Baru</h4>
                                        </div>
                                        <hr />
                                        <!-- Formulir pendaftaran -->
                                        <form id="register-form" action="{{ route('register.store') }}" method="POST">
                                            @csrf

                                            <div class="form-group mt-4">
                                                <label>Nama <span class="text-danger">*</span></label>
                                                <input type="text" name="name" id="name"
                                                    class="form-control @error('name') is-invalid @enderror"
                                                    value="{{ old('name') }}" placeholder="Masukan Nama" />
                                                <!-- error message untuk name -->
                                                @error('name')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Email <span class="text-danger">*</span></label>
                                                <input type="email" name="email" id="email"
                                                    class="form-control @error('email') is-invalid @enderror"
                                                    placeholder="Masukan email" value="{{ old('email') }}" />
                                                <!-- error message untuk email -->
                                                @error('email')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>NIP</label>
                                                <input type="number" name="nip" id="nip"
                                                    class="form-control @error('nip') is-invalid @enderror"
                                                    value="{{ old('nip') }}" placeholder="Masukan NIP" />
                                                <!-- error message untuk nip -->
                                                @error('nip')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Password <span class="text-danger">*</span></label>
                                                <div class="input-group" id="show_hide_password">
                                                    <input
                                                        class="form-control border-right-0 @error('password') is-invalid @enderror"
                                                        type="password" name="password" id="password"
                                                        placeholder="Masukan Password">
                                                    <div class="input-group-append">
                                                        <a href="javascript:;"
                                                            class="input-group-text bg-transparent border-left-0 @error('password') border-danger @enderror"
                                                            onclick="togglePasswordVisibility()">
                                                            <i class='bx bx-hide' id="password-icon"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <!-- error message untuk password -->
                                                @error('password')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Role <span class="text-danger">*</span></label>
                                                <select class="form-control" name="roles" id="roles">
                                                    @foreach ($roles as $role)
                                                        <option value="{{ $role->name }}">{{ $role->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Unit <span class="text-danger">*</span></label>
                                                <select class="form-control" name="id_unit" id="id_unit">
                                                    @foreach ($units as $unit)
                                                        <option value="{{ $unit->id }}">{{ $unit->nama }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Status <span class="text-danger">*</span></label>
                                                <select class="form-control" name="status" id="status">
                                                    <option value="active">Aktif</option>
                                                    <option value="inactive">Tidak Aktif</option>
                                                </select>
                                            </div>
                                            <div class="form-group mt-4">
                                                <label class="d-block">Tanda Tangan</label>
                                                <img class="img-preview img-fluid col-md-3 mb-3">
                                                <input type="file" name="ttd" id="ttd" class=" form-control"
                                                    onchange="previewImage()">
                                            </div>
                                            <div class="btn-group mt-3 w-100">
                                                <button type="submit" class="btn btn-primary btn-block">Register</button>
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
        function togglePasswordVisibility() {
            const passwordField = document.getElementById('password');
            const passwordIcon = document.getElementById('password-icon');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                passwordIcon.classList.remove('bx-hide');
                passwordIcon.classList.add('bx-show');
            } else {
                passwordField.type = 'password';
                passwordIcon.classList.remove('bx-show');
                passwordIcon.classList.add('bx-hide');
            }
        }
    </script>
    <script>
        function previewImage() {
            const image = document.querySelector("#ttd");
            const imgPreview = document.querySelector(".img-preview");

            imgPreview.style.display = 'block';

            const lihatgambar = URL.createObjectURL(image.files[0]);
            imgPreview.src = lihatgambar;
        }
    </script>
@endsection
