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
                                    <li class="breadcrumb-item"><a href="/instrument"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Form Instrument</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!--end breadcrumb-->
                    <div class="container mt-5 mb-5">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="card border-0 shadow-sm rounded">
                                    <div class="card-body">
                                        <div>
                                            <h4 class="text-center my-4">Form Instrument</h4>
                                        </div>
                                        <hr />
                                        <!-- Formulir pendaftaran -->
                                        <form id="instrument-form" action="{{ route('instrument.store') }}" method="POST">
                                            @csrf

                                            <div class="form-group mt-4">
                                                <label>No Indikator</label>
                                                <select name="id_indikator" id="id_indikator" class="form-control bg-white"
                                                    onchange="updateIndikator()">
                                                    <option value="">Silahkan Pilih Indikator</option>
                                                    @foreach ($indikators as $indikator)
                                                        <option value="{{ $indikator->id }}"
                                                            data-indikator="{!! htmlspecialchars($indikator->indikator) !!}"
                                                            data-pernyataan-standar="{!! htmlspecialchars($indikator->pernyataan->pernyataan_standar) !!}"
                                                            data-no-ps="{{ $indikator->pernyataan->no_ps }}"
                                                            {{ old('id_indikator') == $indikator->id ? 'selected' : '' }}>
                                                            {{ $indikator->no }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                @error('id_indikator')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <div class="form-group mt-4">
                                                <label id="indikator_label">Indikator</label>
                                                <div class="border py-3 px-1" id="indikator">
                                                    {!! $indikator->indikator ?? '' !!}
                                                </div>
                                            </div>


                                            <div class="form-group mt-4">
                                                <label id="no_ps_label">No Pernyataan</label>
                                                <input type="text" class="form-control bg-white" disabled id="no_ps"
                                                    value="{{ $indikator->pernyataan->no_ps ?? '' }}" />
                                            </div>

                                            <div class="form-group mt-4">
                                                <label id="pernyataan_standar_label">Pernyataan Standar</label>
                                                <div class="border py-3 px-1" id="pernyataan_standar">
                                                    {!! $indikator->pernyataan->pernyataan_standar ?? '' !!}
                                                </div>
                                            </div>



                                            <div class="form-group mt-4">
                                                <label>Deskripsi Temuan</label>
                                                <input type="text" name="deskripsi_temuan" id="deskripsi_temuan"
                                                    class="form-control bg-white @error('deskripsi_temuan')
                                                    is-invalid
                                                @enderror"
                                                    value="{{ old('deskripsi_temuan') }}" placeholder="Masukan Keadaan">
                                                <!-- error message untuk deskripsi_temuan -->
                                                @error('deskripsi_temuan')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <!--  Akar Penyebab -->
                                            <div class="form-group mt-4">
                                                <label>Akar Penyebab</label>
                                                <input type="text" name="akar_penyebab" id="akar_penyebab"
                                                    class="form-control bg-white @error('akar_penyebab')
                                                    is-invalid
                                                @enderror"
                                                    value="{{ old('akar_penyebab') }}" placeholder="Masukan Akar Penyebab">
                                                <!-- error message untuk akar_penyebab -->
                                                @error('akar_penyebab')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <!--  Akibat -->
                                            <div class="form-group mt-4">
                                                <label>Akibat</label>
                                                <input type="text" name="akibat" id="akibat"
                                                    class="form-control bg-white @error('akibat')
                                                    is-invalid
                                                @enderror"
                                                    value="{{ old('akibat') }}" placeholder="Masukan Akibat">
                                                <!-- error message untuk akibat -->
                                                @error('akibat')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>



                                            <!--  Bukti -->
                                            <div class="form-group mt-4">
                                                <label>Bukti</label>
                                                <input type="text" name="bukti" id="bukti"
                                                    class="form-control bg-white @error('bukti')
                                                    is-invalid
                                                @enderror"
                                                    value="{{ old('bukti') }}" placeholder="Masukan Bukti Berupa Link">
                                                <!-- error message untuk bukti -->
                                                @error('bukti')
                                                    <div class="d-block text-danger">{{ $message }}</div>
                                                @enderror


                                            </div>

                                            <!--  Status Tercapai -->
                                            <div class="form-group mt-4">
                                                <label>Status Tercapai</label>
                                                <select name="id_status_tercapai" id="id_status_tercapai"
                                                    class="form-control bg-white">
                                                    @foreach ($status_tercapai as $trcapai)
                                                        <option value="{{ $trcapai->id }}"
                                                            {{ old('id_status_tercapai') == $trcapai->id ? 'selected' : '' }}>
                                                            {{ $trcapai->nama }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="btn-group mt-3 w-100">
                                                <button type="submit" class="btn btn-primary btn-block">Simpan</button>
                                            </div>
                                        </form>
                                        <!-- End Formulir pendaftaran -->
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body">
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet unde iste neque
                                            quasi doloribus et reiciendis maiores aperiam, sint mollitia. </p>
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
        function updateIndikator() {
            var select = document.getElementById('id_indikator');
            var indikator = select.options[select.selectedIndex].getAttribute('data-indikator');
            var pernyataan_standar = select.options[select.selectedIndex].getAttribute('data-pernyataan-standar');
            var no_ps = select.options[select.selectedIndex].getAttribute('data-no-ps');
            var selectedOption = select.options[select.selectedIndex].value;


            if (selectedOption === '') {
                document.getElementById('indikator').style.display = 'none';
                document.getElementById('indikator_label').style.display = 'none'; // 
                document.getElementById('no_ps').style.display = 'none';
                document.getElementById('no_ps_label').style.display = 'none'; // 
                document.getElementById('pernyataan_standar').style.display = 'none';
                document.getElementById('pernyataan_standar_label').style.display = 'none'; // 
            } else {
                document.getElementById('indikator').style.display =
                    'block';
                document.getElementById('indikator_label').style.display = 'block';
                document.getElementById('no_ps').style.display = 'block';
                document.getElementById('no_ps_label').style.display = 'block';
                document.getElementById('pernyataan_standar').style.display = 'block';
                document.getElementById('pernyataan_standar_label').style.display = 'block';
            }

            document.getElementById('indikator').innerHTML = indikator ? indikator : '';
            document.getElementById('no_ps').value = no_ps ? no_ps : '';
            document.getElementById('pernyataan_standar').innerHTML = pernyataan_standar ? pernyataan_standar : '';
        }

        updateIndikator();
    </script>
@endsection
