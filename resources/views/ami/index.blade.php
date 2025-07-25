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
                            @hasrole('admin')
                                <a href="/audit/create" class="btn btn-md btn-success mb-3 ml-3">Tambah Data</a>
                            @endrole

                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table table-striped table-bordered text-center"
                                        style="width:100%">
                                        <thead>
                                            <tr>
                                                <th scope="col">Tahun Akademik</th>
                                                <th scope="col">Unit/Bagian</th>
                                                <th scope="col">Auditee</th>
                                                <th scope="col">Auditor Ketua</th>
                                                <th scope="col">Auditor Anggota 1</th>
                                                <th scope="col">Auditor Anggota 2</th>
                                                <th scope="col">Manajamen</th>
                                                <th scope="col">Tanggal Audit</th>
                                                <th scope="col">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($audits as $audit)
                                                <tr>
                                                    <td>{{ $audit->tahunAkademik->nama }}</td>
                                                    <td>{{ $audit->unit->nama }}
                                                        @if ($audit->status_audit == 'selesai')
                                                            <span class="badge text-white bg-success ">Selesai</span>
                                                        @else
                                                            <span class="badge text-white bg-sunset ">Berjalan</span>
                                                        @endif
                                                    </td>
                                                    <td>{{ $audit->auditee->name }}</td>
                                                    <td>{{ $audit->auditorKetua->name }}</td>
                                                    <td>{{ $audit->auditorAnggota1->name }}</td>
                                                    <td>{{ $audit->auditorAnggota2 ? $audit->auditorAnggota2->name : '-' }}
                                                    </td>
                                                    <td>{{ $audit->manajemen->name }}</td>
                                                    <td>
                                                        {{ \Carbon\Carbon::parse($audit->tanggal)->translatedFormat('d F Y') }}
                                                    </td>
                                                    <td><a href="{{ route('audit.edit', $audit->id) }}"
                                                            class="btn btn-primary">Edit</a></td>
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
