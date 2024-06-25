<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Login - SIAMI PNJ</title>
    <!--favicon-->
    <link rel="icon" href="assets/images/PNJ.png" type="image/png" />
    <!-- loader-->
    <link href="assets/css/pace.min.css" rel="stylesheet" />
    <script src="assets/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <!-- Icons CSS -->
    <link rel="stylesheet" href="assets/css/icons.css" />
    <!-- App CSS -->
    <link rel="stylesheet" href="assets/css/app.css" />

</head>

<body class="bg-login">
    <!-- wrapper -->
    <div class="wrapper">
        <div class="section-authentication-login d-flex align-items-center justify-content-center">
            <div class="row">
                <div class="col-12 col-lg-10 mx-auto">
                    <div class="card radius-15">
                        <div class="row no-gutters">
                            <div class="col-lg-6">
                                <div class="card-body p-md-5">
                                    <div class="text-center">
                                        <img style="margin-right: 150px" src="assets/images/PNJ.png" width="80"
                                            alt="">
                                        <h3 style="margin-right: 150px" class="mt-4 font-weight-bold">Welcome Back</h3>
                                    </div>
                                    <form style="width: 23rem;" action="{{ route('login') }}" method="POST">
                                        @csrf
                                        <div class="form-group mt-4">
                                            <label>Email</label>
                                            <input type="text" class="form-control" name="email" id="email"
                                                placeholder="Masukan Email" />
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <div class="input-group" id="show_hide_password">
                                                <input
                                                    class="form-control border-right-0 @error('password') is-invalid @enderror"
                                                    type="password" name="password" id="password"
                                                    placeholder="Masukan Password">
                                                <div class="input-group-append">
                                                    <a href="javascript:;"
                                                        class="input-group-text bg-transparent border-left-0 @error('password') border-danger @enderror"
                                                        onclick="togglePasswordVisibility()">
                                                        <i class='bx bx-hide' id="password-icon"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- error message untuk password -->
                                            @error('password')
                                                <div class="d-block text-danger">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col text-right">
                                                <a href="#" data-toggle="modal"
                                                    data-target="#forgotPasswordModal"><i
                                                        class='bx bxs-key mr-2'></i>Lupa Password?</a>
                                            </div>
                                        </div>
                                        <div class="btn-group mt-3 w-100">
                                            <button type="submit" class="btn btn-primary btn-block">Log In</button>
                                            <button type="submit" class="btn btn-primary"><i
                                                    class="lni lni-arrow-right"></i></button>
                                        </div>
                                    </form>
                                    <hr>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <img src="assets/images/login-images/login-img.jpg" class="card-img login-img h-100"
                                    alt="...">
                            </div>
                        </div>
                        <!--end row-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="text-center">
        <p class="mb-0">&copy;2024 | Developed By : <a href="#" target="_blank" style="color: blue;">POLITEKNIK
                NEGERI JAKARTA</a></p>
    </footer>
    <!-- end wrapper -->

    <!-- Modal -->
    <div class="modal fade" id="forgotPasswordModal" tabindex="-1" role="dialog"
        aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="forgotPasswordModalLabel">Lupa Password</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{ route('forgot-password') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="forgot-email">Email</label>
                            <input type="email" class="form-control" id="forgot-email" name="email" required
                                placeholder="Masukan Email Anda">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                        <button type="submit" class="btn btn-primary">Kirim</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    @if ($message = Session::get('failed'))
        <script>
            $(document).ready(function() {
                alert('{{ $message }}');
            });
        </script>
    @endif

    @if ($message = Session::get('success'))
        <script>
            $(document).ready(function() {
                alert('{{ $message }}');
            });
        </script>
    @endif

    <script>
        function togglePasswordVisibility() {
            const passwordField = document.getElementById('password');
            const passwordIcon = document.getElementById('password-icon');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                passwordIcon.classList.remove('bx-hide');
                passwordIcon.classList.add('bx-show');
            } else {
                passwordField.type = 'password';
                passwordIcon.classList.remove('bx-show');
                passwordIcon.classList.add('bx-hide');
            }
        }
        $(document).ready(function() {
            $('form').on('submit', function(event) {
                event.preventDefault(); // Prevent default form submission

                // Collect form data
                var formData = {
                    email: $('#email').val(),
                    _token: $('meta[name="csrf-token"]').attr('content') // Include CSRF token
                };

                // Perform AJAX request
                $.ajax({
                    url: '{{ route('forgot-password') }}',
                    method: 'POST',
                    data: formData,
                    success: function(response) {
                        if (response.success) {
                            alert(response.message); // Show success message
                        } else {
                            alert(response.message); // Show error message
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error(error); // Log any errors to console
                        alert(
                        'Terjadi kesalahan saat mengirim permintaan.'); // Show generic error message
                    }
                });
            });
        });
    </script>
</body>

</html>
