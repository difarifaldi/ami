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
                        <div class="breadcrumb-title pr-3">Ketercapaian Standar</div>
                        <div class="pl-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="#"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Data Instrumen</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!--end breadcrumb-->

                    @unlessrole('auditee')
                        @if ($uniqueUnits->count() > 1)
                            <ul class="nav nav-tabs">
                                @foreach ($uniqueUnits as $unit)
                                    @php
                                        $pendingAuditCount = $allInstruments
                                            ->filter(function ($instrument) use ($unit) {
                                                $condition =
                                                    $instrument->ami &&
                                                    $instrument->ami->id_unit == $unit->id &&
                                                    $instrument->ami->status_audit == 'belum selesai';
                                                if (Auth::user()->hasRole('auditor')) {
                                                    $condition = $condition && is_null($instrument->id_status_temuan);
                                                }
                                                if (Auth::user()->hasRole('manajemen')) {
                                                    $condition =
                                                        $condition &&
                                                        is_null($instrument->id_status_akhir) &&
                                                        !is_null($instrument->id_status_tercapai) &&
                                                        !is_null($instrument->id_status_temuan);
                                                }
                                                return $condition;
                                            })
                                            ->count();
                                    @endphp
                                    <li class="nav-item">
                                        <a class="nav-link {{ $selectedUnitId == $unit->id ? 'active bg-primary text-white' : 'bg-white' }}"
                                            href="{{ route('instrument.index', ['unit_id' => $unit->id]) }}">
                                            {{ $unit->nama }}
                                            <span class="rounded bg-success badge text-white ml-1">
                                                {{ $pendingAuditCount }}
                                            </span>
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        @endif

                    @endunlessrole





                    @php
                        $instrument = $instruments->first();
                    @endphp

                    <div class="card">
                        @unlesshasanyrole('auditee')
                            {{-- <div class="card-header">{{ __('Instrumen') }}</div> --}}
                        @endunlessrole
                        <div class="card-body">
                            <div class="card-title">
                                <h4 class="text-center my-4">Instrumen Audit
                                    {{ $instrument ? $instrument->ami->unit->nama : '' }}</h4>


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
                                            <th scope="col">No Indikator</th>
                                            {{-- <th scope="col">unit</th> --}}

                                            @hasanyrole('auditee|auditor|manajemen')
                                                <th scope="col">Bukti</th>
                                                <th scope="col">Status Ketercapaian</th>
                                                @hasanyrole('auditor|manajemen')
                                                    <th scope="col">Temuan Audit</th>
                                                    <th scope="col">Link tindak Lanjut</th>
                                                    <th scope="col">Status Temuan</th>
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
                                                // logic icons & bg
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
                                                $colorAkhir = '';
                                                
                                                // Array status nama
                                                $statusNames = ['statusTemuan' => 'colorTemuan', 'statusTercapai' => 'colorTercapai', 'statusAkhir' => 'colorAkhir'];
                                                
                                                foreach ($statusNames as $statusName => $colorVar) {
                                                    if (isset($instrument->$statusName->nama)) {
                                                        switch ($instrument->$statusName->nama) {
                                                            case 'menyimpang':
                                                                $$colorVar = 'text-danger';
                                                                break;
                                                            case 'belum mencapai':
                                                                $$colorVar = 'text-warning';
                                                                break;
                                                            case 'tercapai':
                                                                $$colorVar = 'text-success';
                                                                break;
                                                            case 'melampaui':
                                                                $$colorVar = 'text-info';
                                                                break;
                                                            case 'belum selesai':
                                                                $$colorVar = 'text-danger';
                                                                break;
                                                            case 'selesai':
                                                                $$colorVar = 'text-success';
                                                                break;
                                                        }
                                                    }
                                                }
                                                
                                                // logic badge auditee
                                                $bgBadge = '';
                                                $text = '';
                                                if (auth()->user()->hasRole('auditee') && is_null($instrument->statusTemuan)) {
                                                    $bgBadge = 'bg-danger ';
                                                    $text = 'Menunggu';
                                                } elseif (auth()->user()->hasRole('auditee') && is_null($instrument->tanggapan_auditee) && isset($instrument->statusTemuan)) {
                                                    $bgBadge = 'bg-info ';
                                                    $text = 'Tanggapi';
                                                } elseif (auth()->user()->hasRole('auditee') && isset($instrument->tanggapan_auditee) && isset($instrument->statusTemuan)) {
                                                    $bgBadge = 'bg-success ';
                                                    $text = 'Selesai';
                                                }
                                                
                                                ?>

                                                <tr>
                                                    <td class="{{ $bg }}">
                                                        {{ $instrument->indikator->pernyataan->no_ps }}

                                                    </td>

                                                    <td class="{{ $bg }}">{{ $instrument->indikator->no }}
                                                        <span
                                                            class="badge text-white {{ $bgBadge }} ">{{ $text }}</span>
                                                    </td>


                                                    @hasanyrole('auditee|auditor|manajemen')
                                                        <td class="{{ $bg }}">
                                                            <a target="_blank"
                                                                href="{{ $instrument->bukti ? $instrument->bukti : '' }}">{{ $instrument->bukti ? $instrument->bukti : '-' }}</a>
                                                        </td>
                                                        <td class="{{ $bg }} {{ $colorTercapai }}">
                                                            {{ $instrument->statusTercapai ? $instrument->statusTercapai->nama : '-' }}
                                                        </td>


                                                        @hasanyrole('auditor|manajemen')
                                                            <td class="{{ $bg }}">
                                                                {{ $instrument->temuan_audit ? $instrument->temuan_audit : '-' }}
                                                            </td>
                                                            <td class="{{ $bg }}">
                                                                <a href="{{ $instrument->link }}" target="_blank">
                                                                    {{ $instrument->link ? $instrument->link : '-' }}</a>

                                                            </td>
                                                            <td class="{{ $bg }} {{ $colorTemuan }}">
                                                                {{ $instrument->statusTemuan ? $instrument->statusTemuan->nama : '-' }}
                                                            </td>
                                                        @endhasanyrole
                                                    @endhasanyrole
                                                    @role('manajemen')
                                                        <td class="{{ $bg }} ">
                                                            {{ $instrument->jadwal_penyelesaian ? \Carbon\Carbon::parse($instrument->jadwal_penyelesaian)->format('d, M Y') : '-' }}
                                                        </td>
                                                        <td class="{{ $bg }} {{ $colorAkhir }}">
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
                                    @role('manajemen')
                                        <div class="mt-4 text-right">
                                            <button type="button" class="btn btn-success p-2" data-toggle="modal"
                                                data-target="#confirmationModal">
                                                Selesaikan Audit
                                            </button>
                                        </div>
                                    @endrole
                                    <!-- Modal HTML -->
                                    <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog"
                                        aria-labelledby="confirmationModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="confirmationModalLabel">Konfirmasi
                                                        Selesaikan Audit</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Apakah Anda yakin ingin menyelesaikan audit ini?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Batal</button>
                                                    <button type="button" class="btn btn-success" id="confirmButton">Ya,
                                                        Selesaikan</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Form HTML (hidden) -->
                                    <form action="{{ route('instrument.selesaikan-audit') }}" method="POST"
                                        id="auditForm">
                                        @csrf
                                        <input type="hidden" name="unit_id" value="{{ $selectedUnitId }}">
                                    </form>

                                    <!-- JavaScript -->
                                    <script>
                                        document.getElementById('confirmButton').addEventListener('click', function() {
                                            document.getElementById('auditForm').submit();
                                        });
                                    </script>


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

@endsection
