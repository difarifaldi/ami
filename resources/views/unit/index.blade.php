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
                                <h4 class="text-center my-4">Daftar Unit</h4>
                            </div>
                            <hr />

                            <a href="/unit/create" class="btn btn-md btn-success mb-3 ml-3">Unit Baru</a>

                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table  text-center" style="width:100%">
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

                                                        <button class="btn btn-danger btn-sm h-full  border-0"
                                                            onclick="deleteUnit({{ $unit->id }})"><i
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
    <div class="modal fade" id="deleteUnitModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Konfirmasi Hapus</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Apakah Anda yakin ingin menghapus unit ini?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="button" class="btn btn-danger" id="confirmDelete">Hapus</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        let unitToDelete = null;

        function deleteUnit(unit) {
            unitToDelete = unit;
            $('#deleteUnitModal').modal('show');
        }

        document.getElementById('confirmDelete').addEventListener('click', function() {
            if (unitToDelete) {
                fetch(`/unit/${unitToDelete}`, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        }
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json();
                    })
                    .then(data => {
                        $('#deleteUnitModal').modal('hide');
                        // Tampilkan pesan SweetAlert berhasil
                        Swal.fire({
                            icon: 'success',
                            title: 'Berhasil',
                            text: 'Unit berhasil dihapus!',
                            timer: 1400,
                            showConfirmButton: false
                        });
                        // Refresh halaman setelah berhasil menghapus Unit
                        location.reload();
                    })
                    .catch(error => {
                        $('#deleteUnitModal').modal('hide');
                        // Tampilkan pesan SweetAlert gagal
                        Swal.fire({
                            icon: 'error',
                            title: 'Gagal',
                            text: 'Anda tidak bisa menghapus unit ini!',
                            timer: 1400,
                            showConfirmButton: false
                        });
                        console.error('There was an error!', error);
                    });
            }
        });
    </script>






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
