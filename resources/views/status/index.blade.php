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
                                <h4 class="text-center my-4">Daftar Status</h4>
                            </div>
                            <hr />

                            <div class="d-flex mx-3">
                                <form id="filterForm" action="{{ route('statusAudit.index') }}" method="GET"
                                    class="d-flex">
                                    <select name="select_unit" id="select_unit" class="form-control  mr-3">
                                        <option value="">Semua Unit</option>
                                        @foreach ($units as $unit)
                                            <option value="{{ $unit->nama }}"
                                                {{ $selectedUnit == $unit->nama ? 'selected' : '' }}>{{ $unit->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                    <select name="select_TA" id="select_TA" class="form-control ">
                                        <option value="">Semua Tahun Akademik</option>
                                        @foreach ($tahuns as $tahun)
                                            <option value="{{ $tahun->nama }}"
                                                {{ $selectedTA == $tahun->nama ? 'selected' : '' }}>{{ $tahun->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </form>
                            </div>

                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table table-striped table-bordered text-center"
                                        style="width:100%">
                                        <thead>
                                            <tr>
                                                <th scope="col">No</th>
                                                <th scope="col">Status Temuan</th>
                                                <th scope="col">Bidang</th>
                                                <th scope="col">Unit</th>
                                                <th scope="col">Tahun Akademik</th>
                                                <th scope="col">Persentase</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($status as $st)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $st->nama }}</td>
                                                    <td>
                                                        @foreach ($st->instrument as $instrument)
                                                            <li class="border-bottom list-unstyled font-weight-bolder fs-1">
                                                                {{ $instrument->indikator->no ?? '-' }}
                                                            </li>
                                                        @endforeach
                                                    </td>
                                                    <td>
                                                        @foreach ($st->instrument as $instrument)
                                                            <li class="border-bottom list-unstyled ">
                                                                {{ $instrument->ami->unit->nama ?? '-' }}
                                                            </li>
                                                        @endforeach
                                                    </td>
                                                    <td>
                                                        @foreach ($st->instrument as $instrument)
                                                            <li class="border-bottom list-unstyled ">
                                                                {{ $instrument->ami->tahunAkademik->nama ?? '-' }}
                                                            </li>
                                                        @endforeach
                                                    </td>
                                                    <td>
                                                        {{ $totalInstruments > 0 ? round(($st->instrument->count() / $totalInstruments) * 100, 0) : 0 }}%
                                                    </td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="6">
                                                        <div class="alert alert-danger">Data Status tidak tersedia.</div>
                                                    </td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <script>
                                document.getElementById('select_unit').addEventListener('change', function() {
                                    document.getElementById('filterForm').submit();
                                });
                                document.getElementById('select_TA').addEventListener('change', function() {
                                    document.getElementById('filterForm').submit();
                                });
                            </script>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end page-wrapper-->
    </div>
@endsection
