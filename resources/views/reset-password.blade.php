<!-- resources/views/reset-password.blade.php -->
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
                                <li class="breadcrumb-item"><a href="/"><i class='bx bx-home-alt'></i></a></li>
                                <li class="breadcrumb-item active" aria-current="page">Reset Password</li>
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
                                    <h4 class="text-center my-4">Reset Password</h4>
                                    <hr />
                                    <!-- Formulir reset password -->
                                    <form action="{{ route('user.reset-password') }}" method="POST">
                                        @csrf
                                        <div class="form-group mt-4">
                                            <label>Password Baru</label>
                                            <input type="password" name="password" id="password" class="form-control"
                                                placeholder="Masukan password baru" required />
                                        </div>
                                        <div class="form-group mt-4">
                                            <label>Konfirmasi Password Baru</label>
                                            <input type="password" name="password_confirmation" id="password_confirmation"
                                                class="form-control" placeholder="Masukan ulang password baru" required />
                                        </div>
                                        <div class="btn-group mt-3 d-flex">
                                            <button type="submit" class="btn btn-primary btn-sm mr-2">Reset Password</button>
                                            <a href="/" class="btn btn-primary btn-sm">Kembali</a>
                                        </div>
                                    </form>
                                    <!-- End Formulir reset password -->
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
