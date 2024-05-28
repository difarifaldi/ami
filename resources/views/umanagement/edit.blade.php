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
                                    <li class="breadcrumb-item"><a href="/admin"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Form Edit Akun</li>
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
                                        <h4 class="text-center my-4">Form Edit Akun</h4>
                                        <hr />
                                        <!-- Formulir edit akun -->
                                        <form action="{{ route('admin.update-user') }}" method="POST">
                                            @csrf
                                            <input type="hidden" name="user_id" value="{{ $user->id }}">
                                            <div class="form-group mt-4">
                                                <label>Nama</label>
                                                <input type="text" class="form-control" id="name" name="name"
                                                    value="{{ $user->name }}">
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Email</label>
                                                <input type="text" class="form-control" id="email" name="email"
                                                    value="{{ $user->email }}">
                                            </div>
                                            <div class="form-group mt-4">
                                                <label>Password Baru</label>
                                                <input type="password" name="password" id="password" class="form-control"
                                                    placeholder="Masukan password baru" />
                                                <small class="form-text text-muted">*Biarkan kosong jika tidak ingin
                                                    mengubah password.</small>
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>NIP</label>
                                                <input type="number" name="nip" id="nip"
                                                    class="form-control @error('nip') is-invalid @enderror"
                                                    value="{{ $user->nip }}"
                                                    placeholder="{{ $user->nip ? '' : 'masukan NIP' }}" />
                                                <!-- error message untuk nama -->
                                                @error('nip')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Role</label>
                                                <select class="form-control" name="roles" id="roles">
                                                    @foreach ($roles as $role)
                                                        @if ($user->roles->isEmpty())
                                                            belum ada role
                                                        @elseif ($user->getRoleNames()[0] == $role->name)
                                                            <option value="{{ $role->name }}" selected>{{ $role->name }}
                                                            </option>
                                                        @else
                                                            <option value="{{ $role->name }}">{{ $role->name }}
                                                            </option>
                                                        @endif
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Units</label>
                                                <select class="form-control" name="id_unit" id="id_unit">
                                                    @foreach ($units as $unit)
                                                        @if ($user->id_unit === $unit->id)
                                                            <option value="{{ $unit->id }}" selected>
                                                                {{ $unit->nama }}
                                                            </option>
                                                        @else
                                                            <option value="{{ $unit->id }}">
                                                                {{ $unit->nama }}
                                                            </option>
                                                        @endif
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="btn-group mt-3 d-flex">
                                                <button type="submit" class="btn btn-primary btn-sm mr-2">Simpan</button>
                                                <a href="/admin" class="btn btn-primary btn-sm">Kembali</a>
                                            </div>
                                        </form>
                                        <!-- End Formulir edit akun -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @if ($message = Session::get('failed'))
        <script>
            Swal.fire({
                icon: 'error',
                title: '{{ $message }}',
                showConfirmButton: false,
                timer: 700000
            });
        </script>
    @endif
@endsection
