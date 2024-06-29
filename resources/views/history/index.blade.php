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
                                    <select name="select_unit2" id="select_unit2" class="form-control mr-3"
                                        onchange="updateTable()">
                                        @foreach ($units as $unit)
                                            <option value="{{ $unit->id }}"
                                                {{ $selectedUnit2 == $unit->id ? 'selected' : '' }}>
                                                {{ $unit->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </form>
                            </div>

                            <div class="table-responsive">
                                <div class="loading-container">
                                    <div class="loading-spinner" id="loading-spinner"></div>
                                </div>
                                <table class="table table-striped table-bordered text-center" id="data-table">
                                    <thead>
                                        <tr id="data-header">
                                            <th>No Indikator</th>
                                            @if ($statusHistory->isNotEmpty())
                                                @foreach ($statusHistory->first() as $instrument)
                                                    <th>{{ \Carbon\Carbon::parse($instrument->ami->tanggal)->format('d-m-Y') }}
                                                    </th>
                                                @endforeach
                                            @endif
                                        </tr>
                                    </thead>
                                    <tbody id="data-tbody">
                                        @foreach ($statusHistory as $noIndikator => $instruments)
                                            <tr>
                                                <td>{{ $noIndikator }}</td>
                                                @foreach ($instruments as $instrument)
                                                    <td>{{ $instrument->statusTemuan ? $instrument->statusTemuan->nama : '' }}
                                                    </td>
                                                @endforeach
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function updateTable() {
            const unitId = document.getElementById('select_unit2').value;
            const loadingSpinner = document.getElementById('loading-spinner');
            const tableBody = document.getElementById('data-tbody');
            const tableHeader = document.getElementById('data-header');

            // Tampilkan spinner loading
            loadingSpinner.style.display = 'block';

            fetch(`{{ route('history.index') }}?select_unit2=${unitId}`, {
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest'
                    }
                })
                .then(response => response.json())
                .then(data => {
                    tableBody.innerHTML = ''; // Kosongkan tbody
                    tableHeader.innerHTML = '<th>No Indikator</th>'; // Kosongkan header kecuali kolom pertama

                    // Buat header berdasarkan tanggal audit
                    data.dates.forEach(date => {
                        const headerCell = document.createElement('th');
                        headerCell.textContent = new Date(date).toLocaleDateString('id-ID');
                        tableHeader.appendChild(headerCell);
                    });

                    if (data.data.length === 0) {
                        const row = document.createElement('tr');
                        const cell = document.createElement('td');
                        cell.colSpan = data.dates.length + 1; // Sesuaikan dengan jumlah kolom
                        cell.textContent = 'Tidak ada data untuk unit yang dipilih.';
                        row.appendChild(cell);
                        tableBody.appendChild(row);
                    } else {
                        data.data.forEach(item => {
                            const row = document.createElement('tr');
                            const noIndikatorCell = document.createElement('td');
                            noIndikatorCell.textContent = item.noIndikator;
                            row.appendChild(noIndikatorCell);

                            item.instruments.forEach((instrument, index) => {
                                const statusCell = document.createElement('td');
                                statusCell.textContent = instrument.statusTemuan;

                                // Check if previous and current statusTemuan are not empty before adding badge
                                if (index > 0 &&
                                    item.instruments[index - 1].statusTemuan &&
                                    instrument.statusTemuan &&
                                    item.instruments[index - 1].statusTemuan !== instrument.statusTemuan
                                ) {
                                    const daysDiff = Math.abs(new Date(data.dates[index]) - new Date(
                                        data.dates[index - 1])) / (1000 * 60 * 60 * 24);
                                    const badge = document.createElement('span');
                                    badge.className = 'ml-1 badge badge-info';
                                    badge.textContent = `${daysDiff} hari`;
                                    statusCell.appendChild(badge);
                                }

                                row.appendChild(statusCell);
                            });

                            tableBody.appendChild(row);
                        });
                    }

                    // Sembunyikan spinner loading
                    loadingSpinner.style.display = 'none';
                })
                .catch(() => {
                    // Sembunyikan spinner loading jika ada error
                    loadingSpinner.style.display = 'none';
                });
        }

        document.addEventListener('DOMContentLoaded', function() {
            updateTable(); // Memuat data pertama kali
        });
    </script>

@endsection
