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
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
                                <!-- Isi judul card -->
                                <h4 class="text-center my-4">Audit Mutu Internal</h4>
                            </div>
                            <hr />

                            <a href="/audit/create" class="btn btn-md btn-success mb-3 ml-3">Tambah Data</a>

                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table table-striped table-bordered text-center"
                                        style="width:100%">
                                        <thead>
                                            <tr>
                                                <th scope="col">Unit</th>
                                                <th scope="col">Admin</th>
                                                <th scope="col">Auditee</th>
                                                <th scope="col">Auditor Ketua</th>
                                                <th scope="col">Auditor Anggota 1</th>
                                                <th scope="col">Auditor Anggota 2</th>
                                                <th scope="col">Manajamen</th>
                                                <th scope="col">tanggal</th>
                                                <th scope="col">Aksi</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($audits as $audit)
                                                <tr>

                                                    <td>{{ $audit->unit->nama }}</td>
                                                    <td>{{ $audit->admin->name }}</td>
                                                    <td>{{ $audit->auditee->name }}</td>
                                                    <td>{{ $audit->auditorKetua->name }}</td>
                                                    <td>{{ $audit->auditorAnggota1->name }}</td>
                                                    <td>{{ $audit->auditorAnggota2->name }}</td>
                                                    <td>{{ $audit->manajemen->name }}</td>
                                                    <td> {{ \Carbon\Carbon::parse($audit->tanggal)->format('d, M Y') }}
                                                    </td>

                                                    <td>
                                                        <a href="/audit/{{ $audit->id }}/edit"
                                                            class="btn btn-warning btn-sm"><i class="bi bi-brush"></i></a>


                                                        <form action="/audit/{{ $audit->id }}" method="post"
                                                            class="d-inline">
                                                            @method('delete')
                                                            @csrf
                                                            <button class="btn btn-danger btn-sm h-full  border-0"
                                                                onclick="return confirm('Apakah yakin ingin menghapus audit?')"><i
                                                                    class="bi bi-trash"></i></button>
                                                        </form>

                                                    </td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="9">
                                                        <div class="alert alert-danger">
                                                            Belum
                                                            ada data AMI.</div>
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





    @if ($message = Session::get('success'))
        <script>
            Swal.fire({
                icon: 'success',
                title: '{{ $message }}',
                showConfirmButton: false,
                timer: 1500
            });
        </script>
    @endif
@endsection
