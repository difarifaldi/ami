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
                                <h4 class="text-center my-4">Manajemen Akun</h4>
                            </div>
                            <hr />

                            <a href="/register" class="btn btn-md btn-success mb-3 ml-3">Buat Akun</a>


                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table table-striped table-bordered text-center"
                                        style="width:100%">
                                        <thead>
                                            <tr>
                                                <th scope="col">No</th>
                                                <th scope="col">Nama</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">NIP</th>
                                                <th scope="col">Peran</th>
                                                <th scope="col">Unit</th>
                                                <th scope="col">Tanda Tangan</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">foto</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($users as $user)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $user->name }} @if ($user->forgot_password == 'ya')
                                                            <span class="badge bg-danger text-white">Lupa
                                                                Password</span>
                                                        @endif
                                                    </td>
                                                    <td>{{ $user->email }}</td>
                                                    <td>{{ $user->nip ? $user->nip : '-' }}</td>
                                                    <td>
                                                        @if ($user->roles->isNotEmpty())
                                                            {{ $user->roles[0]->name }}
                                                        @else
                                                            Belum ada role
                                                        @endif
                                                    </td>
                                                    <td>{{ $user->unit ? $user->unit->nama : 'tidak memiliki unit' }}</td>

                                                    <td>
                                                        @if ($user->ttd)
                                                            <img src="{{ asset('storage/' . $user->ttd) }}"
                                                                class="img-fluid" style="width: 65px">
                                                        @else
                                                            <i class="bi bi-x-octagon-fill text-red"
                                                                style="font-size: 1.4rem;"></i> <br>
                                                            kosong
                                                        @endif
                                                    </td>

                                                    <td>
                                                        <div class="custom-control custom-switch">
                                                            <input type="checkbox" class="custom-control-input"
                                                                id="status_{{ $user->id }}"
                                                                onchange="toggleUserStatus({{ $user->id }})"
                                                                {{ $user->status === 'active' ? 'checked' : '' }}>
                                                            <label class="custom-control-label"
                                                                for="status_{{ $user->id }}">{{ ucfirst($user->status) }}</label>
                                                        </div>
                                                    </td>

                                                    <td>
                                                        @if ($user->foto)
                                                            <img src="{{ asset('storage/' . $user->foto) }}"
                                                                class="img-fluid" style="width: 65px">
                                                        @else
                                                            <i class="bi bi-x-octagon-fill text-red"
                                                                style="font-size: 1.4rem;"></i> <br>
                                                            kosong
                                                        @endif
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="{{ route('admin.edit-user', ['id' => $user->id]) }}"
                                                            class="btn btn-primary">Edit</a>
                                                        <button class="btn btn-danger"
                                                            onclick="deleteUser({{ $user->id }})">Hapus</button>
                                                    </td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="8">
                                                        <div class="alert alert-danger">Data Pengguna tidak tersedia.</div>
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
    <!-- Modal -->
    <div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Konfirmasi Hapus</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Apakah Anda yakin ingin menghapus akun pengguna ini?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="button" class="btn btn-danger" id="confirmDelete">Hapus</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        let userToDelete = null;

        function deleteUser(userId) {
            userToDelete = userId;
            $('#deleteUserModal').modal('show');
        }
        document.getElementById('confirmDelete').addEventListener('click', function() {
            if (userToDelete) {

                fetch(`/admin/delete-user/${userToDelete}`, {
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
                        $('#deleteUserModal').modal('hide');
                        // Tampilkan pesan SweetAlert berhasil
                        Swal.fire({
                            icon: 'success',
                            title: 'Berhasil',
                            text: 'Akun pengguna berhasil dihapus!',
                            timer: 1400,
                            showConfirmButton: false
                        });
                        // Refresh halaman setelah berhasil menghapus akun pengguna
                        location.reload();
                    })
                    .catch(error => {
                        $('#deleteUserModal').modal('hide');
                        // Tampilkan pesan SweetAlert gagal
                        Swal.fire({
                            icon: 'error',
                            title: 'Gagal',
                            text: 'Anda tidak bisa menghapus pengguna ini!',
                            timer: 1400,
                            showConfirmButton: false
                        });
                        console.error('There was an error!', error);
                    });
            };
        });
    </script>

    <script>
        function toggleUserStatus(userId) {
            fetch(`/admin/toggle-user-status`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    body: JSON.stringify({
                        userId: userId
                    })
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    Swal.fire({
                        icon: 'success',
                        title: 'Status pengguna berhasil diperbarui!',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(() => {
                        // Refresh halaman setelah berhasil memperbarui status pengguna
                        location.reload();
                    });
                })
                .catch(error => {
                    Swal.fire({
                        icon: 'error',
                        title: 'Terjadi kesalahan!',
                        text: 'Tidak dapat memperbarui status pengguna.',
                    });
                    console.error('There was an error!', error);
                });
        }
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
