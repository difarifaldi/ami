@extends('layouts.layouts')

@section('content')
    <div class="wrapper">
        <div class="page-wrapper">
            <div class="page-content-wrapper">
                <div class="page-content">

                    <!--statistik Status Start-->
                    <div class="row justify-content-center">
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
                            <div class="card radius-15 bg-sunset">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">
                                                {{ $statusInstrument->where('id_status_temuan', 1)->count() }} </h2>
                                        </div>
                                        <div class="ml-auto font-35 text-white"><i class="bi bi-exclamation-triangle"></i>
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
                    </div>
                    <!--statistik Status End-->

                    {{-- Bar Chart --}}
                    {{-- <div class="card radius-15">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h5 class="mb-0 font-weight-bold">Grafik Data</h5>
                                </div>
                            </div>
                            <div class="row mt-3 m-0">
                                <select name="select_unit" id="select_unit" class="form-control w-50">
                                    @foreach ($units as $unit)
                                        <option value="{{ $unit->id }}"
                                            {{ $selectedUnit == $unit->id ? 'selected' : '' }}>{{ $unit->nama }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="mt-4">
                                <canvas id="chartData" width="400" height="400"></canvas>
                            </div>
                        </div>
                    </div> --}}

                    <div class="row">
                        @foreach ($units as $unit)
                            @hasrole('auditee')
                                <div class="col-lg-12">
                                @else
                                    <div class="col-lg-6">
                                    @endhasrole

                                    <div class="card radius-15">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center">
                                                <div>
                                                    <h5 class="mb-0 font-weight-bold">{{ $unit->nama }}</h5>
                                                </div>
                                            </div>
                                            <div class="row mt-3 m-0">
                                                <select name="select_TA_{{ $unit->id }}"
                                                    id="select_TA_{{ $unit->id }}" class="form-control w-50">
                                                    @foreach ($tahuns as $tahun)
                                                        <option value="{{ $tahun->id }}"
                                                            {{ $selectedTA == $tahun->id ? 'selected' : '' }}>
                                                            {{ $tahun->nama }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="mt-4">
                                                <canvas id="statusTemuanChart{{ $unit->id }}" width="400"
                                                    height="400"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                        @endforeach
                    </div>


                    {{-- History --}}
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center my-4">Riwayat Status Temuan Audit</h4>

                            <div class="d-flex mx-3">
                                <form id="filterForm" action="{{ route('dashboard.index') }}" method="GET"
                                    class="d-flex">
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

                    {{-- History --}}
                    <script>
                        function updateTable() {
                            const unitId = document.getElementById('select_unit2').value;
                            const loadingSpinner = document.getElementById('loading-spinner');
                            const tableBody = document.getElementById('data-tbody');
                            const tableHeader = document.getElementById('data-header');

                            // Tampilkan spinner loading
                            loadingSpinner.style.display = 'block';

                            fetch(`{{ route('dashboard.index') }}?select_unit2=${unitId}`, {
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

                @section('scripts')
                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>


                    {{-- Doughnut Chart --}}
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            // Daftarkan plugin ChartDataLabels
                            Chart.register(ChartDataLabels);

                            function createChart(chartId) {
                                const ctx = document.getElementById(chartId).getContext('2d');
                                return new Chart(ctx, {
                                    type: 'doughnut', // Ubah tipe menjadi doughnut
                                    data: {
                                        labels: [],
                                        datasets: [{
                                            label: 'Jumlah Status Temuan',
                                            data: [],
                                            // backgroundColor: [
                                            //     'rgba(255, 204, 0, 0.6)', // Belum Mencapai (Kuning Cerah)
                                            //     'rgba(102, 179, 255, 0.6)', // Mencapai (Biru Terang)
                                            //     'rgba(255, 161, 181, 0.6)', // Melampaui (Merah Muda)
                                            // ],
                                            // borderColor: [
                                            //     'rgba(255, 204, 0, 1)', // Border Belum Mencapai
                                            //     'rgba(102, 179, 255, 1)', // Border Mencapai
                                            //     'rgba(255, 161, 181, 1)', // Border Melampaui
                                            // ],
                                            borderWidth: 1
                                        }]
                                    },
                                    options: {
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        plugins: {
                                            title: {
                                                display: true,
                                                text: 'Grafik Status Temuan'
                                            },
                                            datalabels: {
                                                color: '#000', // Warna label
                                                font: {
                                                    size: 12
                                                },
                                                formatter: (value, context) => {
                                                    const dataset = context.chart.data.datasets[0];
                                                    const total = dataset.data.reduce((acc, curr) => acc + curr, 0);
                                                    const percentage = ((value / total) * 100).toFixed(
                                                        2); // Hitung persentase
                                                    return `${percentage}%`; // Tampilkan persentase
                                                }
                                            }
                                        }
                                    },
                                    plugins: [ChartDataLabels] // Tambahkan plugin ChartDataLabels
                                });
                            }

                            const units = @json($units); // Kirim data unit dari Laravel ke JavaScript
                            const charts = {};

                            units.forEach(unit => {
                                const chartId = `statusTemuanChart${unit.id}`;
                                const selectId = `select_TA_${unit.id}`;
                                charts[unit.id] = createChart(chartId);

                                // Fetch data for each unit
                                fetchStatusTemuanData(selectId, charts[unit.id], unit.id);

                                // Add event listener for each select element
                                document.getElementById(selectId).addEventListener('change', function() {
                                    fetchStatusTemuanData(selectId, charts[unit.id], unit.id);
                                });
                            });

                            function fetchStatusTemuanData(selectElementId, chart, unitId) {
                                const selectTA = document.getElementById(selectElementId);
                                const selectedTA = selectTA.value;
                                fetch(`/fetch-status-temuan-data?select_TA=${selectedTA}&unit_id=${unitId}`)
                                    .then(response => {
                                        if (!response.ok) {
                                            throw new Error('Network response was not ok ' + response.statusText);
                                        }
                                        return response.json();
                                    })
                                    .then(data => {
                                        const labelColorMap = {
                                            'belum mencapai': {
                                                backgroundColor: 'rgba(255, 0, 0, 0.7)', // 🔴 Merah terang
                                                borderColor: 'rgba(255, 0, 0, 1)'
                                            },
                                            'tercapai': {
                                                backgroundColor: 'rgba(0, 123, 255, 0.7)', // 🔵 Biru tegas (Bootstrap blue)
                                                borderColor: 'rgba(0, 123, 255, 1)'
                                            },
                                            'melampaui': {
                                                backgroundColor: 'rgba(40, 167, 69, 0.7)', // 🟢 Hijau tegas (Bootstrap success)
                                                borderColor: 'rgba(40, 167, 69, 1)'
                                            }
                                        };


                                        // Buat array warna sesuai urutan label dari response
                                        const backgroundColors = data.labels.map(label => labelColorMap[label]
                                            ?.backgroundColor || 'rgba(201, 203, 207, 0.6)');
                                        const borderColors = data.labels.map(label => labelColorMap[label]?.borderColor ||
                                            'rgba(201, 203, 207, 1)');

                                        chart.data.labels = data.labels;
                                        chart.data.datasets[0].data = data.values;
                                        chart.data.datasets[0].backgroundColor = backgroundColors;
                                        chart.data.datasets[0].borderColor = borderColors;
                                        chart.update();
                                    })

                                    .catch(error => {
                                        console.error('Error fetching data:', error);
                                    });
                            }
                        });
                    </script>


                    {{-- Line Chart --}}
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            function createBarChart(chartId) {
                                const ctx = document.getElementById(chartId).getContext('2d');
                                return new Chart(ctx, {
                                    type: 'bar', // Ubah tipe menjadi bar
                                    data: {
                                        labels: [], // Label akan diisi dari server
                                        datasets: [], // Dataset akan diisi dari server
                                    },
                                    options: {
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        plugins: {
                                            title: {
                                                display: true,
                                                text: 'Grafik Data Status Temuan Berdasarkan Tanggal'
                                            }
                                        },
                                        scales: {
                                            x: {
                                                beginAtZero: true
                                            },
                                            y: {
                                                beginAtZero: true,
                                                ticks: {
                                                    precision: 0 // Menampilkan angka tanpa desimal
                                                }
                                            }
                                        }
                                    }
                                });
                            }

                            const chartData = createBarChart('chartData');

                            function fetchBarChartData(selectElementId, chart) {
                                const selectUnit = document.getElementById(selectElementId);
                                const selectedUnit = selectUnit.value;
                                fetch(`/fetch-line-chart-data?unit_id=${selectedUnit}`)
                                    .then(response => {
                                        if (!response.ok) {
                                            throw new Error('Network response was not ok ' + response.statusText);
                                        }
                                        return response.json();
                                    })
                                    .then(data => {
                                        console.log(data); // Debugging data
                                        chart.data.labels = data.labels; // Set label
                                        chart.data.datasets = data.datasets.map(dataset => ({
                                            ...dataset,
                                            backgroundColor: dataset
                                                .borderColor // Gunakan warna border sebagai warna batang
                                        }));
                                        chart.update();
                                    })
                                    .catch(error => {
                                        console.error('Error fetching data:', error);
                                        alert('Error fetching data: ' + error.message);
                                    });
                            }

                            // Initial data fetch
                            fetchBarChartData('select_unit', chartData);

                            document.getElementById('select_unit').addEventListener('change', function() {
                                fetchBarChartData('select_unit', chartData);
                            });
                        });
                    </script>
                @endsection
