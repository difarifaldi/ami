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
                    @if ($errors->any())
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span
                                    aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    @endif

                    <div class="card">

                        <div class="card-body">
                            <div class="card-title">
                                <!-- Isi judul card -->
                                <h4 class="text-center my-4">Manajemen Akun</h4>
                            </div>
                            <hr />
                            <div class="d-flex justify-content-between ">

                                <a href="/register" class="btn btn-md btn-success mb-3 ml-3">Buat Akun</a>

                                <button data-toggle="modal" data-target="#importData"
                                    class="btn btn-md btn-warning mb-3 mr-3 text-white">Import
                                    Data</button>
                            </div>


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
                                                                {{ $user->status === 'aktif' ? 'checked' : '' }}>
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

    <!-- Modal -->
    <div class="modal fade" id="importData" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Import Data Pengguna SIAMI</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h6 class="font-weight-bold">Aturan Import Data</h6>
                    <p>Data pada file Excel harus sesuai dengan aturan sebagai berikut:</p>
                    <ul class="list-unstyled mx-auto">
                        <li class="font-weight-normal">
                            1. Baris pertama pada file Excel terdiri dari header
                        </li>
                        <li class="font-weight-normal">
                            2. Asal unit pada file Excel harus diubah dengan aturan sebagai berikut:
                            <ul class="font-weight-normal">
                                <li>1 = UPT Urusan Internasional (KUI) </li>
                                <li>2 = UPA Perpustakaan </li>
                                <li>3 = UPA Rekaya Teknologi dan Produk Unggulan</li>
                                <li>4 = UPA Layanan Uji Kompetensi</li>
                                <li>5 = UPA Perawatan dan Perbaikan</li>
                                <li>6 = UPA Pengembangan Karier dan Kewirausahaan</li>
                                <li>7 = UPA Teknologi Informasi dan Komunikasi</li>
                            </ul>
                        </li>
                        <li class="font-weight-normal">
                            3. Status pengguna <span class="font-weight-bolder">(Wajib Menggunakan Huruf Kecil)</span>
                            terdiri dari:
                            <ul class="font-weight-normal">
                                <li>aktif </li>
                                <li>tidak Aktif</li>

                            </ul>
                        </li>

                        <li class="font-weight-normal">
                            4. Peran pengguna terdiri dari:
                            <ul class="font-weight-normal">
                                <li>admin</li>
                                <li>auditee</li>
                                <li>auditor</li>
                                <li>manajemen</li>

                            </ul>
                        </li>

                        <li class="font-weight-normal">
                            5. Wajib untuk menyertakan password untuk setiap data pengguna
                        </li>

                        <li class="font-weight-normal">
                            6. NIP pengguna bersifat optional sehingga dapat dikosongkan
                        </li>
                    </ul>
                    <hr>
                    <h6 class="font-weight-bold">Contoh file Excel: <a
                            href="{{ asset('../assets/files/contohData.xlsx') }}" target="_blank"><i
                                class="bi bi-file-earmark-text font-weight-normal"></i>Contoh data Import Excel</a>
                    </h6>
                    <hr>
                    <form action="{{ route('import-excel') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <label>Import Data User</label>
                        <div class="input-group mb-3">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="importExcel"
                                    aria-describedby="importExcel" accept=".xls, .xlsx" name="file">
                                <label class="custom-file-label" for="importExcel">Masukan Data</label>
                            </div>
                        </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Import Data</button> <!-- Ubah ke type="submit" -->
                </div>
                </form>
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
                            timer: 2400,
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
