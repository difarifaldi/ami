@extends('layouts.layouts')

@section('content')
    <div class="wrapper">
        <!--page-wrapper-->
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <!--breadcrumb-->
                    <div class="page-breadcrumb d-none d-md-flex align-items-center mb-3">
                        <div class="breadcrumb-title pr-3">Ketercapaian instrument</div>
                        <div class="pl-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="#"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Data Instrument</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!--end breadcrumb-->
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
                                @foreach ($instruments as $instrument)
                                    <h4 class="text-center my-4">Instrument Audit {{ $instrument->ami->unit->nama }}</h4>
                                @endforeach

                            </div>
                            @role('auditee')
                                <hr />
                                <a href="instrument/create" class="btn btn-primary mb-3">Audit Instrumen</a>
                            @endrole


                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table table-bordered text-center " style="width:100%">
                                        <thead>
                                            <th scope="col">No PS</th>
                                            {{-- <th scope="col">Pernyataan instrument</th> --}}
                                            <th scope="col">No Indikator</th>

                                            {{-- <th scope="col">Indikator</th> --}}

                                            @hasanyrole('auditee|auditor|manajemen')
                                                {{-- <th scope="col">Keadaan</th> --}}
                                                <th scope="col">Bukti</th>
                                                <th scope="col">Status Ketercapaian</th>
                                                @hasanyrole('auditor|manajemen')
                                                    <th scope="col">Temuan</th>
                                                    <th scope="col">Link tindak Lanjut</th>
                                                    <th scope="col">Status Temuan</th>
                                                    <th scope="col">Unit</th>
                                                    <th scope="col">Auditee</th>
                                                    <th scope="col">Auditor</th>
                                                @endhasanyrole
                                            @endhasanyrole
                                            @role('manajemen')
                                                {{-- <th scope="col">Keadaan</th> --}}
                                                <th scope="col">Jadwal</th>
                                                <th scope="col">Status Akhir</th>
                                            @endrole
                                            <th scope="col">Aksi</th>

                                        </thead>

                                        <tbody>
                                            @foreach ($instruments as $instrument)
                                                <?php
                                                // logic icons
                                                $class = 'bi-check-lg';
                                                $bg = '';
                                                
                                                if (auth()->user()->hasRole('auditee') && isset($instrument->statusTercapai)) {
                                                    $class = 'bi-brush';
                                                } elseif (auth()->user()->hasRole('auditor') && isset($instrument->statusTemuan)) {
                                                    $class = 'bi-brush';
                                                    $bg = 'bg-light-success';
                                                } elseif (auth()->user()->hasRole('manajemen') && isset($instrument->statusAkhir)) {
                                                    $class = 'bi-brush';
                                                    $bg = 'bg-light-success';
                                                } elseif (auth()->user()->hasRole('admin')) {
                                                    $class = 'bi-brush';
                                                }
                                                
                                                $colorTemuan = '';
                                                $colorTercapai = '';
                                                
                                                // Array of status names
                                                $statusNames = ['statusTemuan' => 'colorTemuan', 'statusTercapai' => 'colorTercapai'];
                                                
                                                foreach ($statusNames as $statusName => $colorVar) {
                                                    if (isset($instrument->$statusName->nama)) {
                                                        switch ($instrument->$statusName->nama) {
                                                            case 'belum mencapai':
                                                                $$colorVar = 'text-danger';
                                                                break;
                                                            case 'tercapai':
                                                                $$colorVar = 'text-success';
                                                                break;
                                                            case 'melampaui':
                                                                $$colorVar = 'text-info';
                                                                break;
                                                        }
                                                    }
                                                }
                                                ?>

                                                <tr>
                                                    <td class="{{ $bg }}">
                                                        {{ $instrument->indikator->pernyataan->no_ps }}</td>
                                                    {{-- <td class="{{ $bg }}">
                                                        {{ Str::limit(strip_tags($instrument->pernyataan_instrument), 5, '...') }}
                                                    </td> --}}
                                                    <td class="{{ $bg }}">{{ $instrument->indikator->no }}</td>

                                                    {{-- <td class="{{ $bg }}">
                                                        {{ Str::limit(strip_tags($instrument->indikator), 5, '...') }}
                                                    </td> --}}

                                                    @hasanyrole('auditee|auditor|manajemen')
                                                        {{-- <td class="{{ $bg }}">
                                                        {{ Str::limit(strip_tags($instrument->keadaan ? $instrument->keadaan : '-'), 5, '...') }}
                                                    </td> --}}
                                                        <td class="{{ $bg }}">
                                                            <a target="_blank"
                                                                href="{{ $instrument->bukti ? $instrument->bukti : '' }}">{{ $instrument->bukti ? $instrument->bukti : '-' }}</a>
                                                        </td>
                                                        <td class="{{ $bg }} {{ $colorTercapai }}">
                                                            {{ $instrument->statusTercapai ? $instrument->statusTercapai->nama : '-' }}
                                                        </td>


                                                        @hasanyrole('auditor|manajemen')
                                                            <td class="{{ $bg }}">
                                                                {{ $instrument->temuan ? $instrument->temuan : '-' }}
                                                            </td>
                                                            <td class="{{ $bg }}">
                                                                <a href="{{ $instrument->link }}" target="_blank">
                                                                    {{ $instrument->link ? $instrument->link : '-' }}</a>

                                                            </td>
                                                            <td class="{{ $bg }} {{ $colorTemuan }}">
                                                                {{ $instrument->statusTemuan ? $instrument->statusTemuan->nama : '-' }}
                                                            </td>
                                                            <td class="{{ $bg }}">
                                                                {{ optional($instrument->ami->unit)->nama }}
                                                            </td>
                                                            <td class="{{ $bg }}">
                                                                {{ optional($instrument->ami->auditee)->name }}
                                                            </td>
                                                            <td class="{{ $bg }}">
                                                                {{ optional($instrument->ami->auditorKetua)->name }}
                                                            </td>
                                                        @endhasanyrole
                                                    @endhasanyrole
                                                    @role('manajemen')
                                                        <td class="{{ $bg }}">
                                                            {{ $instrument->jadwal_penyelesaian ? \Carbon\Carbon::parse($instrument->jadwal_penyelesaian)->format('d, M Y') : '-' }}
                                                        </td>
                                                        <td class="{{ $bg }}">
                                                            {{ $instrument->statusAkhir ? $instrument->statusAkhir->nama : '-' }}
                                                        </td>
                                                    @endrole
                                                    <td class="{{ $bg }}">

                                                        <a href="/instrument/{{ $instrument->id }}"
                                                            class="btn btn-warning btn-sm"><i class="bi bi-eye"></i></a>
                                                        <a href="/instrument/{{ $instrument->id }}/edit"
                                                            class="btn btn-success btn-sm">
                                                            <i class="{{ $class }}"></i>
                                                        </a>

                                                        @role('admin')
                                                            <form action="/instrument/{{ $instrument->id }}" method="post"
                                                                class="d-inline">
                                                                @method('delete')
                                                                @csrf
                                                                <button class="btn btn-danger btn-sm h-full  border-0"
                                                                    onclick="return confirm('Apakah yakin ingin menghapus instrument?')"><i
                                                                        class="bi bi-trash"></i></button>
                                                            </form>
                                                        @endrole
                                                    </td>
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
@endsection
