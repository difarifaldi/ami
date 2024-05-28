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
                                    <li class="breadcrumb-item active" aria-current="page">Data Instrument</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!--end breadcrumb-->
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
                                <h4 class="text-center my-4">Instrument</h4>
                            </div>
                            @role('superadmin')
                                <hr />
                                <a href="standar/create" class="btn btn-primary">Tambah Instrument</a>
                            @endrole
                            <hr />

                            <div class="table-responsive">
                                <div class="card-body">
                                    <table id="example" class="table table-bordered text-center " style="width:100%">
                                        <thead>
                                            <th scope="col">No PS</th>
                                            {{-- <th scope="col">Pernyataan Standar</th> --}}
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
                                                @endhasanyrole
                                            @endhasanyrole
                                            @role('manajemen')
                                                {{-- <th scope="col">Keadaan</th> --}}
                                                <th scope="col">important</th>
                                                <th scope="col">Status Akhir</th>
                                            @endrole
                                            <th scope="col">Aksi</th>

                                        </thead>
                                        <tbody>
                                            @foreach ($standars as $standar)
                                                <?php
                                                // logic icons
                                                $class = 'bi-check-lg';
                                                $bg = '';
                                                $color = '';
                                                
                                                if (auth()->user()->hasRole('auditee') && isset($standar->statusTercapai)) {
                                                    $class = 'bi-brush';
                                                    $bg = 'bg-light-success';
                                                } elseif (auth()->user()->hasRole('auditor') && isset($standar->statusTemuan)) {
                                                    $class = 'bi-brush';
                                                    $bg = 'bg-light-success';
                                                } elseif (auth()->user()->hasRole('manajemen') && isset($standar->statusAkhir)) {
                                                    $class = 'bi-brush';
                                                    $bg = 'bg-light-success';
                                                } elseif (auth()->user()->hasRole('superadmin')) {
                                                    $class = 'bi-brush';
                                                }
                                                
                                                if (isset($standar->statusTemuan->nama)) {
                                                    if ($standar->statusTemuan->nama == 'belum mencapai') {
                                                        $color = 'text-danger';
                                                    } elseif ($standar->statusTemuan->nama == 'Tercapai') {
                                                        $color = 'text-success';
                                                    } elseif ($standar->statusTemuan->nama == 'Melampaui') {
                                                        $color = 'text-primary';
                                                    }
                                                }
                                                ?>

                                                <tr>
                                                    <td class="{{ $bg }}">
                                                        {{ $standar->no_ps }}</td>
                                                    {{-- <td class="{{ $bg }}">
                                                        {{ Str::limit(strip_tags($standar->pernyataan_standar), 5, '...') }}
                                                    </td> --}}
                                                    <td class="{{ $bg }}">{{ $standar->no }}</td>
                                                    {{-- <td class="{{ $bg }}">
                                                        {{ Str::limit(strip_tags($standar->indikator), 5, '...') }}
                                                    </td> --}}

                                                    @hasanyrole('auditee|auditor|manajemen')
                                                        {{-- <td class="{{ $bg }}">
                                                        {{ Str::limit(strip_tags($standar->keadaan ? $standar->keadaan : '-'), 5, '...') }}
                                                    </td> --}}
                                                        <td class="{{ $bg }}">
                                                            <a target="_blank"
                                                                href="{{ $standar->bukti ? $standar->bukti : '' }}">{{ $standar->bukti ? $standar->bukti : '-' }}</a>
                                                        </td>
                                                        <td class="{{ $bg }}">
                                                            {{ $standar->statusTercapai ? $standar->statusTercapai->nama : '-' }}
                                                        </td>
                                                        @hasanyrole('auditor|manajemen')
                                                            <td class="{{ $bg }}">
                                                                {{ $standar->temuan ? $standar->temuan : '-' }}
                                                            </td>
                                                            <td class="{{ $bg }}">
                                                                <a href="{{ $standar->link }}" target="_blank">
                                                                    {{ $standar->link ? $standar->link : '-' }}</a>

                                                            </td>
                                                            <td class="{{ $bg }} {{ $color }}">
                                                                {{ $standar->statusTemuan ? $standar->statusTemuan->nama : '-' }}
                                                            </td>
                                                        @endhasanyrole
                                                    @endhasanyrole
                                                    @role('manajemen')
                                                        <td class="{{ $bg }}">
                                                            {{ $standar->important ? $standar->important : '-' }}
                                                        </td>
                                                        <td class="{{ $bg }}">
                                                            {{ $standar->statusAkhir ? $standar->statusAkhir->nama : '-' }}
                                                        </td>
                                                    @endrole
                                                    <td class="{{ $bg }}">

                                                        <a href="/standar/{{ $standar->id }}"
                                                            class="btn btn-warning btn-sm"><i class="bi bi-eye"></i></a>
                                                        <a href="/standar/{{ $standar->id }}/edit"
                                                            class="btn btn-success btn-sm">
                                                            <i class="{{ $class }}"></i>
                                                        </a>

                                                        @role('superadmin')
                                                            <form action="/standar/{{ $standar->id }}" method="post"
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
