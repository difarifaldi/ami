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
                        <div class="breadcrumb-title pr-3">Profile</div>
                        <div class="pl-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="/"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Profil Akun</li>
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
                                        <h4 class="text-center my-4">Edit Akun</h4>
                                        <hr />
                                        <!-- Formulir edit akun -->

                                        <form action="{{ route('profile.update-profile') }}" method="POST"
                                            enctype="multipart/form-data">
                                            @csrf
                                            <input type="hidden" name="user_id" value="{{ $user->id }}">
                                            <div class="row">
                                                <div class="col-md-7 ml-5 mr-1 border-right"
                                                    style="border-width: 2px !important">
                                                    <div class="form-group mt-4">
                                                        <label class="font-weight-bold">Nama</label>
                                                        <input type="text" readonly class="form-control-plaintext"
                                                            id="name" name="name" value="{{ $user->name }}">
                                                    </div>
                                                    <div class="form-group mt-4">
                                                        <label class="font-weight-bold">Email</label>
                                                        <input type="text" readonly class="form-control-plaintext"
                                                            id="email" name="email" value="{{ $user->email }}">
                                                    </div>
                                                    <div class="form-group mt-4">
                                                        <label class="font-weight-bold">Password</label> <br>
                                                        <button type="button" class="btn btn-sm btn-primary"
                                                            id="change-password-btn">Ubah Password</button>
                                                    </div>

                                                    <div class="form-group mt-4">
                                                        <label class="font-weight-bold">NIP</label>
                                                        <input type="text" readonly name="nip" id="nip"
                                                            class="form-control-plaintext"
                                                            value="{{ $user->nip ? $user->nip : '-' }}" />
                                                    </div>

                                                    <div class="form-group mt-4">
                                                        <label class="font-weight-bold">Peran</label>
                                                        <input type="text" readonly class="form-control-plaintext"
                                                            id="role" name="role"
                                                            value="{{ $user->roles[0]->name }}">
                                                    </div>

                                                    <div class="form-group mt-4">
                                                        <label class="font-weight-bold">Asal Unit</label>
                                                        <input type="text" readonly class="form-control-plaintext"
                                                            id="id_unit" name="id_unit" value="{{ $user->unit->nama }}">
                                                    </div>

                                                    <div class="form-group mt-4">
                                                        <label for="ttd"
                                                            class="form-label d-block font-weight-bold">Tanda Tangan</label>
                                                        @if ($user->ttd)
                                                            <img src="{{ asset('/storage/' . $user->ttd) }}"
                                                                class="img-preview-ttd img-fluid mb-3 col-sm-3">
                                                        @else
                                                            <img src="{{ asset('../assets/images/user.png') }}"
                                                                class="img-preview-ttd img-fluid mb-3 col-sm-3">
                                                        @endif

                                                        <div class="custom-file">
                                                            <input type="file"
                                                                class="custom-file-input @error('ttd')is-invalid @enderror"
                                                                name="ttd" id="ttd"
                                                                aria-describedby="inputGroupFileAddon01"
                                                                onchange="previewImage('ttd', 'img-preview-ttd')">
                                                            <label class="custom-file-label" for="ttd">Choose
                                                                File</label>
                                                        </div>
                                                        @error('ttd')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>

                                                    <div class="btn-group mt-3 d-flex">
                                                        <button type="submit"
                                                            class="btn btn-primary btn-sm mr-2">Simpan</button>
                                                        <a href="/admin" class="btn btn-primary btn-sm">Kembali</a>
                                                    </div>
                                                </div>

                                                <div class="col-md-4 border-left d-flex justify-content-center"
                                                    style="border-width: 2px !important;">
                                                    <div class="form-group d-flex flex-column align-items-center"
                                                        style="text-align: center;">
                                                        @if ($user->foto)
                                                            <img src="{{ asset('/storage/' . $user->foto) }}"
                                                                width="140" height="140"
                                                                class="img-preview-foto rounded" alt="" />
                                                        @else
                                                            <img src="{{ asset('../assets/images/user.png') }}"
                                                                width="140" height="140"
                                                                class="img-preview-foto rounded" alt="" />
                                                        @endif

                                                        <input type="file"
                                                            class="custom-file-input @error('foto')is-invalid @enderror"
                                                            name="foto" id="foto"
                                                            style="opacity: 0; position: absolute; top: 0; left: 0; cursor: pointer;"
                                                            aria-describedby="inputGroupFileAddon01"
                                                            onchange="previewImage('foto', 'img-preview-foto')">

                                                        @error('foto')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror

                                                        <!-- Button to Upload Photo -->
                                                        <button type="button" class="btn btn-primary mt-3"
                                                            onclick="document.getElementById('foto').click();">
                                                            {{ $user->foto ? 'Ubah Foto Profil' : 'Upload Foto Profil' }}
                                                        </button>
                                                    </div>
                                                </div>
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

    @if ($message = Session::get('failed'))
        <script>
            Swal.fire({
                icon: 'error',
                title: '{{ $message }}',
                showConfirmButton: true,
                timer: null
            });
        </script>
    @endif
    <script>
        // resources/js/profile.js

        function previewImage(inputId, imgClass) {
            const input = document.getElementById(inputId);
            const file = input.files[0];
            const reader = new FileReader();

            reader.onload = function(e) {
                document.querySelector('.' + imgClass).src = e.target.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            }
        }

        document.getElementById('change-password-btn').addEventListener('click', function() {
            Swal.fire({
                title: 'Ubah Password',
                html: `
            <input type="password" id="old-password" class="swal2-input" placeholder="Password Lama">
            <input type="password" id="new-password" class="swal2-input" placeholder="Password Baru">
            <input type="password" id="confirm-password" class="swal2-input" placeholder="Konfirmasi Password Baru">
        `,
                focusConfirm: false,
                preConfirm: () => {
                    const oldPassword = Swal.getPopup().querySelector('#old-password').value
                    const newPassword = Swal.getPopup().querySelector('#new-password').value
                    const confirmPassword = Swal.getPopup().querySelector('#confirm-password').value

                    if (!oldPassword || !newPassword || !confirmPassword) {
                        Swal.showValidationMessage(`Silakan isi semua bidang`)
                    }

                    if (newPassword !== confirmPassword) {
                        Swal.showValidationMessage(`Password baru dan konfirmasi password tidak cocok`)
                    }

                    return {
                        oldPassword: oldPassword,
                        newPassword: newPassword,
                        confirmPassword: confirmPassword
                    }
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    const data = result.value
                    axios.post('{{ route('profile.change-password') }}', {
                        old_password: data.oldPassword,
                        new_password: data.newPassword,
                        new_password_confirmation: data.confirmPassword,
                        user_id: {{ $user->id }},
                        _token: '{{ csrf_token() }}'
                    }).then(response => {
                        Swal.fire('Sukses', response.data.message, 'success')
                    }).catch(error => {
                        Swal.fire('Error', error.response.data.message, 'error')
                    })
                }
            })
        });
    </script>
@endsection
