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
                                @if (auth()->user()->hasRole('admin'))
                                    <h4 class="text-center my-4">Riwayat Audit Mutu Internal</h4>
                                @else
                                    <h4 class="text-center mt-4">Riwayat AMI {{ $instruments->first()->ami->unit->nama }}
                                    </h4>
                                    <p class="text-center mb-4">{{ $instruments->first()->ami->tahunAkademik->nama }}</p>
                                @endif
                            </div>
                            <hr />

                            @hasanyrole('admin')
                                <div class="d-flex mx-3">
                                    <form id="filterForm" action="{{ route('riwayat') }}" method="GET" class="d-flex">
                                        <select name="select_unit" id="select_unit" class="form-control  mr-3">
                                            <option value="">Semua Unit</option>
                                            @foreach ($units as $unit)
                                                <option value="{{ $unit->id }}"
                                                    {{ $selectedUnit == $unit->id ? 'selected' : '' }}>{{ $unit->nama }}
                                                </option>
                                            @endforeach
                                        </select>
                                        <select name="select_TA" id="select_TA" class="form-control ">
                                            <option value="">Semua Tahun Akademik</option>
                                            @foreach ($tahuns as $tahun)
                                                <option value="{{ $tahun->id }}"
                                                    {{ $selectedTA == $tahun->id ? 'selected' : '' }}>{{ $tahun->nama }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </form>
                                </div>
                            @endhasanyrole

                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table table-striped table-bordered text-center"
                                        style="width:100%">
                                        <thead>
                                            <tr>
                                                <th scope="col">Unit</th>
                                                <th scope="col">No PS</th>
                                                <th scope="col">No Indikator</th>
                                                <th scope="col">Bukti</th>
                                                <th scope="col">Status Ketercapaian</th>
                                                <th scope="col">Temuan</th>
                                                <th scope="col">Rekomendasi Auditor</th>
                                                <th scope="col">Link tindak Lanjut</th>
                                                <th scope="col">Status Temuan</th>
                                                <th scope="col">Jadwal</th>
                                                <th scope="col">Status Akhir</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($instruments as $instrument)
                                                <tr>
                                                    <td class="text-justify">{{ $instrument->ami->unit->nama }}</td>
                                                    <td class="text-justify">
                                                        {{ $instrument->indikator->pernyataan->no_ps }}</td>
                                                    <td class="text-justify">{{ $instrument->indikator->no }}</td>
                                                    <td class="text-justify">{{ $instrument->bukti }}</td>
                                                    <td class="text-justify">{{ $instrument->statusTercapai->nama }}</td>
                                                    <td class="text-justify">{{ $instrument->temuan_audit }}</td>
                                                    <td class="text-justify">{{ $instrument->rekomendasi_auditor }}</td>
                                                    <td class="text-justify">{{ $instrument->link }}</td>
                                                    <td class="text-justify">{{ $instrument->statusTemuan->nama }}</td>
                                                    <td class="text-justify">
                                                        {{ $instrument->jadwal_penyelesaian ? \Carbon\Carbon::parse($instrument->jadwal_penyelesaian)->format('d, M Y') : '-' }}
                                                    </td>
                                                    <td class="text-justify">{{ $instrument->statusAkhir->nama }}</td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <div class="text-right mr-4 mt-2">
                                    <a href="{{ route('lha.export-pdf', ['select_unit' => $selectedUnit, 'select_TA' => $selectedTA]) }}"
                                        class="btn btn-outline-primary"><i class="bi bi-file-earmark-pdf"></i> <span>Export
                                            LHA</span> </a>
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
