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
                                <h4 class="text-center my-4">Daftar Indikator</h4>
                            </div>
                            <hr />

                            <a href="/indikator/create" class="btn btn-md btn-success mb-3 ml-3">Indikator Baru</a>

                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table table-striped table-bordered text-center"
                                        style="width:100%">
                                        <thead>
                                            <tr>
                                                <th scope="col">Unit</th>
                                                <th scope="col">No Indikator</th>
                                                <th scope="col">Indikator </th>
                                                <th scope="col">Aksi</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($indikators as $indikator)
                                                <tr>
                                                    <td>{{ $indikator->pernyataan->unit->nama }}</td>
                                                    <td>{{ $indikator->no }}</td>
                                                    <td class="text-left">{!! $indikator->indikator !!}</td>


                                                    <td>

                                                        <a href="/indikator/{{ $indikator->id }}/edit"
                                                            class="btn btn-warning btn-sm"><i class="bi bi-brush"></i></a>

                                                        <button class="btn btn-danger btn-sm h-full  border-0"
                                                            onclick="deleteIndikator({{ $indikator->id }})"><i
                                                                class="bi bi-trash"></i></button>
                                                        </form>

                                                    </td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="6">
                                                        <div class="alert alert-danger">Data Indikator tidak tersedia.
                                                        </div>
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
    <div class="modal fade" id="deletePernyataanModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Konfirmasi Hapus</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Apakah Anda yakin ingin menghapus indikator ini?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="button" class="btn btn-danger" id="confirmDelete">Hapus</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        let indikatorToDelete = null;

        function deleteIndikator(indikator) {
            indikatorToDelete = indikator;
            $('#deletePernyataanModal').modal('show');
        }

        document.getElementById('confirmDelete').addEventListener('click', function() {
            if (indikatorToDelete) {
                fetch(`/indikator/${indikatorToDelete}`, {
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
                        $('#deletePernyataanModal').modal('hide');
                        // Tampilkan pesan SweetAlert berhasil
                        Swal.fire({
                            icon: 'success',
                            title: 'Berhasil',
                            text: 'Indikator berhasil dihapus!',
                            timer: 1400,
                            showConfirmButton: false
                        });
                        // Refresh halaman setelah berhasil menghapus Indikator
                        location.reload();
                    })
                    .catch(error => {
                        $('#deletePernyataanModal').modal('hide');
                        // Tampilkan pesan SweetAlert gagal
                        Swal.fire({
                            icon: 'error',
                            title: 'Gagal',
                            text: 'Anda tidak bisa menghapus indikator ini!',
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
