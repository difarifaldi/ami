<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sistem Audit Mutu Internal - PNJ</title>
    <!--favicon-->
    <link rel="icon" href="{{ asset('../assets/images/PNJ.png') }}" type="image/png">
    <!-- loader-->
    <link href="{{ asset('assets/css/pace.min.css') }}" rel="stylesheet">
    <script src="{{ asset('assets/js/pace.min.js') }}"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}">

    <!-- Icons CSS -->
    <link rel="stylesheet" href="{{ asset('assets/css/icons.css') }}">
    {{-- Icons Boostrap --}}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="{{ asset('assets/css/app.css') }}">
    <!-- Sweet Alert -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


    <!-- Example using SweetAlert2 for notifications -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>

<body class="bg-forgot">
    <!-- wrapper -->
    <div class="wrapper">
        <div class="authentication-forgot d-flex align-items-center justify-content-center">
            <div class="card shadow-lg forgot-box">
                <div class="card-body p-md-5">
                    <div class="text-center">
                        <img src="assets/images/icons/forgot-2.png" width="140" alt="" />
                    </div>
                    <h4 class="mt-5 font-weight-bold">Lupa Password?</h4>

                    <p class="text-muted">Masukan email yang terdaftar di sistem SIAMI</p>
                    <form action="{{ route('forgot-password') }}" method="POST">
                        @csrf
                        <div class="form-group mt-5">
                            <label>Email</label>
                            <input type="text"
                                class="form-control form-control-lg radius-30 @error('email')
                                                    is-invalid
                                                @enderror"
                                placeholder="Masukan Email" id="email" name="email" />
                            @error('email')
                                <div class="d-block text-danger">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block radius-30">Kirim</button>
                    </form> <a href="/login" class="btn btn-link btn-block"><i
                            class='bx bx-arrow-back mr-1'></i>Kembali</a>
                </div>
            </div>
        </div>
    </div>
    <!-- end wrapper -->

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
</body>

</html>
