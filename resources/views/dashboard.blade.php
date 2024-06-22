@extends('layouts.layouts')

@section('content')
    <div class="wrapper">
        <div class="page-wrapper">
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="card-deck">
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h5 class="mb-0">Grafik Status Temuan</h5>
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
                                <div class="mt-4">
                                    <canvas id="statusTemuanChart" width="400" height="400"></canvas>
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
            const selectTA = document.getElementById('select_TA');
            const statusTemuanChart = document.getElementById('statusTemuanChart');

            if (statusTemuanChart) {
                const ctx = statusTemuanChart.getContext('2d');

                const chartStatusTemuan = new Chart(ctx, {
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

                function fetchStatusTemuanData() {
                    const selectedTA = selectTA.value;
                    fetch(`/fetch-status-temuan-data?select_TA=${selectedTA}`)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok ' + response.statusText);
                            }
                            return response.json();
                        })
                        .then(data => {
                            console.log(data); // Debugging data
                            chartStatusTemuan.data.labels = data.labels;
                            chartStatusTemuan.data.datasets[0].data = data.values;
                            chartStatusTemuan.update();
                        })
                        .catch(error => {
                            console.error('Error fetching data:', error);
                        });
                }

                fetchStatusTemuanData();
                selectTA.addEventListener('change', fetchStatusTemuanData);
            } else {
                console.error('Canvas element with id statusTemuanChart not found.');
            }
        });
    </script>
@endsection
