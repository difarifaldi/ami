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
                        <!-- Isi breadcrumb -->
                    </div>
                    <!--end breadcrumb-->
                    <div class="card  radius-15">
                        <div class="card-body">
                            <div class="card-title">
                                <!-- Isi judul card -->
                                <h4 class="text-center my-4">Aktivitas Pengguna</h4>
                            </div>
                            <hr />

                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table  text-center" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th scope="col">No</th>
                                                <th scope="col">Nama</th>
                                                <th scope="col">Waktu Login</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($records as $record)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $record->user->name }}</td>
                                                    <td>{{ \Carbon\Carbon::parse($record->waktu_login)->translatedFormat('d F Y H:i') }}
                                                    </td>

                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="3">
                                                        <div class="alert alert-danger">Data Aktivitas Pengguna tidak
                                                            tersedia.</div>
                                                    </td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>


                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end page-wrapper-->
    </div>
    <!-- end wrapper -->
@endsection
