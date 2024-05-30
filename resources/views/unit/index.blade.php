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
                                <h4 class="text-center my-4">Daftar Unit</h4>
                            </div>
                            <hr />

                            <a href="/unit/create" class="btn btn-md btn-success mb-3 ml-3">Unit Baru</a>

                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table table-striped table-bordered text-center"
                                        style="width:100%">
                                        <thead>
                                            <tr>
                                                <th scope="col">No</th>
                                                <th scope="col">Nama</th>
                                                <th scope="col">Logo</th>
                                                <th scope="col">Aksi</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($units as $unit)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $unit->nama }}</td>

                                                    <td> <img src="{{ asset('storage/' . $unit->gambar) }}"
                                                            class="img-fluid" style="width: 65px"></td>

                                                    <td>

                                                        <a href="/unit/{{ $unit->id }}/edit"
                                                            class="btn btn-warning btn-sm"><i class="bi bi-brush"></i></a>


                                                        <form action="/unit/{{ $unit->id }}" method="post"
                                                            class="d-inline">
                                                            @method('delete')
                                                            @csrf
                                                            <button class="btn btn-danger btn-sm h-full  border-0"
                                                                onclick="return confirm('Apakah yakin ingin menghapus unit?')"><i
                                                                    class="bi bi-trash"></i></button>
                                                        </form>

                                                    </td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="6">
                                                        <div class="alert alert-danger">Data Unit tidak tersedia.</div>
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
