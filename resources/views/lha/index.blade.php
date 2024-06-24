@extends('layouts.layouts')

@section('content')
    <!-- wrapper -->
    <div class="wrapper">
        <!--page-wrapper-->
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <h4 class="font-weight-bold text-center mb-5">Daftar LHA</h4>
                    <div class="row justify-content-center">
                        @foreach ($audits as $audit)
                            <div class="col-lg-4 d-flex">
                                <div class="card radius-15 shadow shadow-sm position-relative flex-fill">
                                    <div class="card-body">
                                        <div class="media align-items-center">
                                            <div class="media-body ml-3">
                                                <h5 class="mb-0 text-success">{{ $audit->unit->nama ?? 'No Unit Name' }}
                                                </h5>
                                                <p class="mb-0 text-success">
                                                    {{ $audit->tahunAkademik->nama ?? 'No Tahun Akademik' }}</p>
                                            </div>
                                            <div class="list-inline contacts-social mt-4">
                                                <a href="{{ route('lha.export-pdf', ['id_ami' => $audit->id]) }}"
                                                    class="list-inline-item text-white bg-wall"><i
                                                        class="bx bx-download"></i></a>
                                                @role('manajemen')
                                                    <a href="{{ route('instrument.index', ['unit_id' => $audit->id_unit]) }}"
                                                        class="list-inline-item text-white bg-wall"><i
                                                            class="bx bx-show"></i></a>
                                                @endrole
                                            </div>
                                        </div>
                                    </div>
                                    <div class="position-absolute mt-2 mr-3" style="right: 0; font-size: 18px">
                                        @if ($audit->instrument->whereNull('id_status_temuan')->isNotEmpty())
                                            <i class="bi bi-hourglass-split text-warning"></i>
                                        @elseif ($audit->instrument->isEmpty())
                                            <i class="bi bi-hourglass-split text-warning"></i>
                                        @else
                                            <i class="bi bi-flag-fill text-success"></i>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endforeach




                    </div>
                </div>
            </div>
        </div>
        <!--end page-wrapper-->
    </div>
    @if ($message = Session::get('error'))
        <script>
            const Toast = Swal.mixin({
                toast: true,
                position: "top-end",
                showConfirmButton: false,
                timer: 1400,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.onmouseenter = Swal.stopTimer;
                    toast.onmouseleave = Swal.resumeTimer;
                }
            });
            Toast.fire({
                icon: "error",
                title: '{{ $message }}'
            });
        </script>
    @endif
@endsection
