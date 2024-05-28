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
                                <h4 class="text-center my-4">User Management</h4>
                            </div>
                            <hr />

                            <a href="/register" class="btn btn-md btn-success mb-3 ml-3">Buat Akun</a>

                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table table-striped table-bordered text-center"
                                        style="width:100%">
                                        <thead>
                                            <tr>
                                                <th scope="col">Nama</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">NIP</th>
                                                <th scope="col">Role</th>
                                                <th scope="col">Unit</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($users as $user)
                                                <tr>
                                                    <td>{{ $user->name }}</td>
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
                                                        <div class="custom-control custom-switch">
                                                            <input type="checkbox" class="custom-control-input"
                                                                id="status_{{ $user->id }}"
                                                                onchange="toggleUserStatus({{ $user->id }})"
                                                                {{ $user->status === 'active' ? 'checked' : '' }}>
                                                            <label class="custom-control-label"
                                                                for="status_{{ $user->id }}">{{ ucfirst($user->status) }}</label>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="{{ route('admin.edit-user', ['id' => $user->id]) }}"
                                                            class="btn btn-primary">Edit</a>
                                                        <button class="btn btn-danger"
                                                            onclick="deleteUser({{ $user->id }})">Delete</button>
                                                    </td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="6">
                                                        <div class="alert alert-danger">Data Pengguna tidak tersedia.</div>
                                                    </td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                    {{ $users->links() }}
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
                    alert('Status pengguna berhasil diperbarui!');
                    // Refresh halaman setelah berhasil memperbarui status pengguna
                    location.reload();
                })
                .catch(error => {
                    console.error('There was an error!', error);
                });
        }
    </script>

    <script>
        function deleteUser(userId) {
            if (confirm("Apakah Anda yakin ingin menghapus akun pengguna ini?")) {
                fetch(`/admin/delete-user/${userId}`, {
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
                        alert('Akun pengguna berhasil dihapus!');
                        // Refresh halaman setelah berhasil menghapus akun pengguna
                        location.reload();
                    })
                    .catch(error => {
                        console.error('There was an error!', error);
                    });
            }
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
