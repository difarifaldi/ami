@extends('layouts.layouts')

@section('content')
    <div class="wrapper">
        <div class="page-wrapper">
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center my-4">Daftar Laporan Hasil Akhir</h4>

                            <div class="d-flex mx-3">
                                <form id="filterForm" action="{{ route('history.index') }}" method="GET" class="d-flex">
                                    <select name="select_unit" id="select_unit" class="form-control mr-3"
                                        onchange="this.form.submit()">
                                        <option value="">Pilih Unit</option>
                                        @foreach ($units as $unit)
                                            <option value="{{ $unit->id }}"
                                                {{ $selectedUnit == $unit->id ? 'selected' : '' }}>
                                                {{ $unit->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </form>
                            </div>

                            <div class="table-responsive">
                                @if ($statusInstrument->isEmpty())
                                    <p class="text-center">Tidak ada data untuk unit yang dipilih.</p>
                                @else
                                    <table class="table table-striped table-bordered text-center">
                                        <thead>
                                            <tr>
                                                <th>No Indikator</th>
                                                @foreach ($statusInstrument->first() as $instrument)
                                                    <th>{{ \Carbon\Carbon::parse($instrument->ami->tanggal)->format('d-m-Y') }}
                                                    </th>
                                                @endforeach
                                                <th>Selisih Hari</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($statusInstrument as $noIndikator => $instruments)
                                                <tr>
                                                    <td>{{ $noIndikator }}</td>
                                                    @php
                                                        $dates = [];
                                                        $statuses = [];
                                                    @endphp
                                                    @foreach ($instruments as $instrument)
                                                        @php
                                                            $dates[] = $instrument->ami->tanggal;
                                                            $statuses[] = $instrument->statusTemuan->nama;
                                                        @endphp
                                                        <td>{{ $instrument->statusTemuan->nama }}</td>
                                                    @endforeach

                                                    @php
                                                        $selisihHari = [];
                                                        for ($i = 0; $i < count($dates) - 1; $i++) {
                                                            if ($statuses[$i] != $statuses[$i + 1]) {
                                                                $selisihHari[] = \Carbon\Carbon::parse(
                                                                    $dates[$i + 1],
                                                                )->diffInDays(\Carbon\Carbon::parse($dates[$i]));
                                                            }
                                                        }
                                                    @endphp

                                                    <td>{{ implode(', ', $selisihHari) }} {{ $selisihHari ? 'hari' : '' }}
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
