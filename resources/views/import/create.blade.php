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
                        <div class="breadcrumb-title pr-3">Import Data</div>
                        <div class="pl-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="/indikator"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Import Data Pernyataan Standar &
                                        Indikator</li>
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
                                        <div>
                                            <h4 class="text-center my-4">Import Data Pernyataan Standar &
                                                Indikator</h4>
                                        </div>
                                        <hr />
                                        <h6 class="font-weight-bold">Aturan Import Data</h6>
                                        <p>Data asal unit pada file Excel harus diubah dengan aturan sebagai berikut:</p>
                                        <ul class="list-unstyled mx-auto">
                                            <li class="font-weight-normal">
                                                1. Asal unit pada file Excel harus diubah dengan aturan sebagai berikut:
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

                                        </ul>
                                        <hr>
                                        <h6 class="font-weight-bold">Contoh file Excel: <a
                                                href="{{ asset('../assets/files/contohData.xlsx') }}" target="_blank"><i
                                                    class="bi bi-file-earmark-text font-weight-normal"></i>Contoh data
                                                Import Excel</a>
                                        </h6>
                                        <hr>
                                        <form action="{{ route('importDataPernyataan') }}" method="POST"
                                            enctype="multipart/form-data">
                                            @csrf
                                            <div class="form-group mt-4">
                                                <label>Unit</label>
                                                <select name="id_unit" id="id_unit" class="single-select">
                                                    <option value="">Silahkan Pilih Unit</option>
                                                    @foreach ($units as $unit)
                                                        <option value="{{ $unit->id }}"
                                                            {{ old('id_unit') == $unit->id ? 'selected' : '' }}>
                                                            {{ $unit->nama }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Tahun Akademik</label>
                                                <select name="id_TA" id="id_TA" class="single-select">
                                                    <option value="">Silahkan Pilih Tahun Akademik</option>
                                                    @foreach ($tahunAkademiks as $ta)
                                                        <option value="{{ $ta->id }}"
                                                            {{ old('id_TA') == $ta->id ? 'selected' : '' }}>
                                                            {{ $ta->nama }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Import Data Pernyataan</label>
                                                <div class="input-group mb-3">
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="importExcel"
                                                            name="file" accept=".xls, .xlsx">
                                                        <label class="custom-file-label" for="importExcel">Masukan
                                                            Data</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-primary">Import Data</button>
                                        </form>

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

    @if ($message = Session::get('error'))
        <script>
            Swal.fire({
                icon: 'error',
                title: '{{ $message }}',
                showConfirmButton: false,
                timer: 1500
            });
        </script>
    @endif
@endsection
