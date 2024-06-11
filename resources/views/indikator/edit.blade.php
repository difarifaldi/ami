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
                        <div class="breadcrumb-title pr-3">Forms</div>
                        <div class="pl-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="/indikator"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Edit Indikator</li>
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
                                            <h4 class="text-center my-4">Edit Indikator</h4>
                                        </div>
                                        <hr />
                                        <!-- Formulir pendaftaran -->
                                        <form id="indikator-form" action="{{ route('indikator.update', $indikator->id) }}"
                                            method="POST" enctype="multipart/form-data">
                                            @csrf
                                            @method('PATCH')

                                            <div class="form-group mt-4">
                                                <label>Unit</label>
                                                <select name="id_unit" id="id_unit" class="form-control bg-white"
                                                    onchange="fetchPernyataanByUnit()">
                                                    <option value="">Silahkan Pilih Unit</option>
                                                    @foreach ($units as $unit)
                                                        <option value="{{ $unit->id }}"
                                                            {{ old('id_unit', $indikator->pernyataan->id_unit) == $unit->id ? 'selected' : '' }}>
                                                            {{ $unit->nama }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group mt-4">
                                                <label id="pernyataan_standar_label">No Pernyataan Standar</label>
                                                <select name="id_pernyataan" id="id_pernyataan"
                                                    class="form-control bg-white" onchange="updatePernyataanStandar()">
                                                    <option value="">Silahkan Pilih Pernyataan Standar</option>
                                                    @foreach ($pernyataans as $pernyataan)
                                                        <option value="{{ $pernyataan->id }}"
                                                            data-pernyataan="{!! htmlspecialchars($pernyataan->pernyataan_standar) !!}"
                                                            {{ old('id_pernyataan', $indikator->id_pernyataan) == $pernyataan->id ? 'selected' : '' }}>
                                                            {{ $pernyataan->no_ps }}
                                                        </option>
                                                    @endforeach
                                                </select>

                                                @error('id_pernyataan')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mt-4">
                                                <label id="standar_label">Pernyataan Standar</label>
                                                <div class="border p-2" id="pernyataan_standar">
                                                    {!! $pernyataan_standar ?? '' !!}
                                                </div>
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Nomor Indikator</label>
                                                <input type="text" name="no" id="no"
                                                    value="{{ $indikator->no }}"
                                                    class="form-control bg-white @error('no')
                                                    is-invalid
                                                @enderror"
                                                    placeholder="Masukan Nomor Indikator" />
                                                <!-- error message untuk no -->
                                                @error('no')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mt-4">
                                                <label>Indikator</label>
                                                <input id="indikator" type="hidden" name="indikator"
                                                    value="{{ $indikator->indikator }}">
                                                <trix-editor
                                                    class="@error('indikator')
                                                border-danger
                                            @enderror"
                                                    input="indikator"></trix-editor>
                                                <!-- error message untuk indikator -->
                                                @error('indikator')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror

                                                <div class="btn-group mt-3 w-100">
                                                    <button type="submit" class="btn btn-primary btn-block">Simpan</button>
                                                </div>
                                        </form>
                                        <!-- End Formulir pendaftaran -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function fetchPernyataanByUnit() {
            var unitId = document.getElementById('id_unit').value;

            // Hapus opsi sebelumnya
            var pernyataanSelect = document.getElementById('id_pernyataan');
            pernyataanSelect.innerHTML = '<option value="">Silahkan Pilih Pernyataan Standar</option>';

            if (unitId) {
                fetch(`/pernyataan/by-unit/${unitId}`)
                    .then(response => response.json())
                    .then(data => {
                        data.forEach(pernyataan => {
                            var option = document.createElement('option');
                            option.value = pernyataan.id;
                            option.textContent = pernyataan.no_ps;
                            option.setAttribute('data-pernyataan', pernyataan.pernyataan_standar);
                            pernyataanSelect.appendChild(option);
                        });
                    })
                    .catch(error => console.error('Error:', error));
            }

            updatePernyataanStandar();
        }

        function updatePernyataanStandar() {
            var select = document.getElementById('id_pernyataan');
            var pernyataan = select.options[select.selectedIndex].getAttribute('data-pernyataan');
            var selectedOption = select.options[select.selectedIndex].value;

            if (selectedOption === '') {
                document.getElementById('pernyataan_standar').style.display = 'none';
                document.getElementById('standar_label').style.display = 'none';
                document.getElementById('pernyataan_standar').innerHTML = '';
            } else {
                document.getElementById('pernyataan_standar').style.display = 'block';
                document.getElementById('standar_label').style.display = 'block';
                document.getElementById('pernyataan_standar').innerHTML = pernyataan ? pernyataan : '';
            }
        }

        // Panggil fungsi ini sekali untuk mengatur nilai awal jika pilihan sudah dibuat sebelumnya.
        updatePernyataanStandar();
    </script>
@endsection
