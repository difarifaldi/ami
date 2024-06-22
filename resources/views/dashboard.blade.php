@extends('layouts.layouts')

@section('content')
    <div class="wrapper">
        <div class="page-wrapper">
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

                    <div class="card radius-15">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h5 class="mb-0">Grafik Data</h5>
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
                    </div>

                    <div class="card-deck">
                        <!-- UPT Urusan Internasional (KUI) -->
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h5 class="mb-0">UPT Urusan Internasional (KUI)</h5>
                                    </div>
                                </div>
                                <div class="row mt-3 m-0">
                                    <select name="select_TA_KUI" id="select_TA_KUI" class="form-control w-50">
                                        @foreach ($tahuns as $tahun)
                                            <option value="{{ $tahun->id }}"
                                                {{ $selectedTA == $tahun->id ? 'selected' : '' }}>{{ $tahun->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mt-4">
                                    <canvas id="statusTemuanChartKUI" width="400" height="400"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- UPA Perpustakaan -->
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h5 class="mb-0">UPA Perpustakaan</h5>
                                    </div>
                                </div>
                                <div class="row mt-3 m-0">
                                    <select name="select_TA_Perpus" id="select_TA_Perpus" class="form-control w-50">
                                        @foreach ($tahuns as $tahun)
                                            <option value="{{ $tahun->id }}"
                                                {{ $selectedTA == $tahun->id ? 'selected' : '' }}>{{ $tahun->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mt-4">
                                    <canvas id="statusTemuanChartPerpus" width="400" height="400"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-deck">
                        <!-- UPA Rekaya Teknologi dan Produk Unggulan -->
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h5 class="mb-0">UPA Rekaya Teknologi dan Produk Unggulan</h5>
                                    </div>
                                </div>
                                <div class="row mt-3 m-0">
                                    <select name="select_TA_Rekayasa" id="select_TA_Rekayasa" class="form-control w-50">
                                        @foreach ($tahuns as $tahun)
                                            <option value="{{ $tahun->id }}"
                                                {{ $selectedTA == $tahun->id ? 'selected' : '' }}>{{ $tahun->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mt-4">
                                    <canvas id="statusTemuanChartRekayasa" width="400" height="400"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- UPA Layanan Uji Kompetensi -->
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h5 class="mb-0">UPA Layanan Uji Kompetensi</h5>
                                    </div>
                                </div>
                                <div class="row mt-3 m-0">
                                    <select name="select_TA_Layanan" id="select_TA_Layanan" class="form-control w-50">
                                        @foreach ($tahuns as $tahun)
                                            <option value="{{ $tahun->id }}"
                                                {{ $selectedTA == $tahun->id ? 'selected' : '' }}>{{ $tahun->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mt-4">
                                    <canvas id="statusTemuanChartLayanan" width="400" height="400"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-deck">
                        <!-- UPA Perawatan dan Perbaikan -->
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h5 class="mb-0">UPA Perawatan dan Perbaikan</h5>
                                    </div>
                                </div>
                                <div class="row mt-3 m-0">
                                    <select name="select_TA_Perawatan" id="select_TA_Perawatan"
                                        class="form-control w-50">
                                        @foreach ($tahuns as $tahun)
                                            <option value="{{ $tahun->id }}"
                                                {{ $selectedTA == $tahun->id ? 'selected' : '' }}>{{ $tahun->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mt-4">
                                    <canvas id="statusTemuanChartPerawatan" width="400" height="400"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- UPA Teknologi Informasi dan Komunikasi -->
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h5 class="mb-0">UPA Teknologi Informasi dan Komunikasi</h5>
                                    </div>
                                </div>
                                <div class="row mt-3 m-0">
                                    <select name="select_TA_TIK" id="select_TA_TIK" class="form-control w-50">
                                        @foreach ($tahuns as $tahun)
                                            <option value="{{ $tahun->id }}"
                                                {{ $selectedTA == $tahun->id ? 'selected' : '' }}>{{ $tahun->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mt-4">
                                    <canvas id="statusTemuanChartTIK" width="400" height="400"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            function createChart(chartId) {
                const ctx = document.getElementById(chartId).getContext('2d');
                return new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: [],
                        datasets: [{
                            label: 'Jumlah Status Temuan',
                            data: [],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 205, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 0, 0, 0.2)',
                                'rgba(0, 255, 0, 0.2)',
                                'rgba(0, 0, 255, 0.2)',
                                'rgba(255, 255, 0, 0.2)',
                                'rgba(0, 255, 255, 0.2)',
                                'rgba(128, 0, 128, 0.2)',
                                'rgba(128, 128, 0, 0.2)',
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 205, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(255, 0, 0, 1)',
                                'rgba(0, 255, 0, 1)',
                                'rgba(0, 0, 255, 1)',
                                'rgba(255, 255, 0, 1)',
                                'rgba(0, 255, 255, 1)',
                                'rgba(128, 0, 128, 1)',
                                'rgba(128, 128, 0, 1)',
                            ],
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
                            }
                        }
                    }
                });
            }

            const chartStatusTemuanKUI = createChart('statusTemuanChartKUI');
            const chartStatusTemuanPerpus = createChart('statusTemuanChartPerpus');
            const chartStatusTemuanRekayasa = createChart('statusTemuanChartRekayasa');
            const chartStatusTemuanLayanan = createChart('statusTemuanChartLayanan');
            const chartStatusTemuanPerawatan = createChart('statusTemuanChartPerawatan');
            const chartStatusTemuanTIK = createChart('statusTemuanChartTIK');

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
                        console.log(data); // Debugging data
                        chart.data.labels = data.labels;
                        chart.data.datasets[0].data = data.values;
                        chart.update();
                    })
                    .catch(error => {
                        console.error('Error fetching data:', error);
                    });
            }

            // Initial data fetch
            fetchStatusTemuanData('select_TA_KUI', chartStatusTemuanKUI, 1);
            fetchStatusTemuanData('select_TA_Perpus', chartStatusTemuanPerpus, 2);
            fetchStatusTemuanData('select_TA_Rekayasa', chartStatusTemuanRekayasa, 3);
            fetchStatusTemuanData('select_TA_Layanan', chartStatusTemuanLayanan, 4);
            fetchStatusTemuanData('select_TA_Perawatan', chartStatusTemuanPerawatan, 5);
            fetchStatusTemuanData('select_TA_TIK', chartStatusTemuanTIK, 6);

            // Add event listeners
            document.getElementById('select_TA_KUI').addEventListener('change', function() {
                fetchStatusTemuanData('select_TA_KUI', chartStatusTemuanKUI, 1);
            });
            document.getElementById('select_TA_Perpus').addEventListener('change', function() {
                fetchStatusTemuanData('select_TA_Perpus', chartStatusTemuanPerpus, 2);
            });
            document.getElementById('select_TA_Rekayasa').addEventListener('change', function() {
                fetchStatusTemuanData('select_TA_Rekayasa', chartStatusTemuanRekayasa, 3);
            });
            document.getElementById('select_TA_Layanan').addEventListener('change', function() {
                fetchStatusTemuanData('select_TA_Layanan', chartStatusTemuanLayanan, 4);
            });
            document.getElementById('select_TA_Perawatan').addEventListener('change', function() {
                fetchStatusTemuanData('select_TA_Perawatan', chartStatusTemuanPerawatan, 5);
            });
            document.getElementById('select_TA_TIK').addEventListener('change', function() {
                fetchStatusTemuanData('select_TA_TIK', chartStatusTemuanTIK, 6);
            });

        });
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            function createLineChart(chartId) {
                const ctx = document.getElementById(chartId).getContext('2d');
                return new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: [],
                        datasets: []
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            title: {
                                display: true,
                                text: 'Grafik Data Status Temuan Berdasarkan Tahun Akademik'
                            }
                        }
                    }
                });
            }

            const chartData = createLineChart('chartData');

            function fetchLineChartData(selectElementId, chart) {
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
                        chart.data.labels = data.labels;
                        chart.data.datasets = data.datasets;
                        chart.update();
                    })
                    .catch(error => {
                        console.error('Error fetching data:', error);
                    });
            }

            // Initial data fetch
            fetchLineChartData('select_unit', chartData);

            document.getElementById('select_unit').addEventListener('change', function() {
                fetchLineChartData('select_unit', chartData);
            });
        });
    </script>
@endsection
