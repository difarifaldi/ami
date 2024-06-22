@extends('layouts.layouts')

@section('content')
    <div class="wrapper">
        <!--page-wrapper-->
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">

                    <!--statistik Status Start-->
                    <div class="row">
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-wall">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">
                                                {{ $statusInstrument->where('id_status_temuan', 3)->count() }}
                                            </h2>
                                        </div>
                                        <div class="ml-auto font-35 text-white"><i class="bi bi-trophy"></i></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Melampaui</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-info">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">
                                                {{ $statusInstrument->where('id_status_temuan', 2)->count() }} </h2>
                                        </div>
                                        <div class="ml-auto font-35 text-white"><i class="bx bx-target-lock"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Tecapai</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-rose">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">
                                                {{ $statusInstrument->where('id_status_temuan', 1)->count() }} </h2>
                                        </div>
                                        <div class="ml-auto font-35 text-white"><i class="bx bx-tachometer"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Belum Mencapai</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-sunset">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">
                                                {{ $statusInstrument->where('id_status_temuan', 4)->count() }} </h2>
                                        </div>
                                        <div class="ml-auto font-35 text-white"><i class="bi bi-exclamation-triangle"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Menyimpang</p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--statistik Status End-->

                    <!--Grafik Status Start-->
                    <div class="card-deck">

                        <!--Grafik KUI-->
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h5 class="mb-0">UPT Urusan Internasional (KUI)</h5>
                                    </div>
                                </div>
                                <div class="row mt-3 m-0">
                                    <select name="select_TA" id="select_TA" class="form-control w-50">
                                        <option value="">Pilih Tahun Akademik</option>
                                        @foreach ($tahuns as $tahun)
                                            <option value="{{ $tahun->id }}"
                                                {{ $selectedTA == $tahun->id ? 'selected' : '' }}>{{ $tahun->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!--Grafik Perpustakaan-->
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h5 class="mb-0">UPA Perpustakaan</h5>
                                    </div>
                                    <div class="dropdown ml-auto">
                                        <div class="cursor-pointer font-24 dropdown-toggle dropdown-toggle-nocaret"
                                            data-toggle="dropdown"><i class="bx bx-dots-horizontal-rounded"></i>
                                        </div>
                                        <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item"
                                                href="javascript:;">Action</a>
                                            <a class="dropdown-item" href="javascript:;">Another action</a>
                                            <div class="dropdown-divider"></div> <a class="dropdown-item"
                                                href="javascript:;">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Grafik Status End-->

                </div>
            </div>
            <!--end page-content-wrapper-->
        </div>
        <!--end page-wrapper-->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

    @if ($message = Session::get('warning'))
        <script>
            Swal.fire({
                icon: 'warning',
                title: '{{ $message }}',
                showConfirmButton: false,
                timer: 2500
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
@endsection
