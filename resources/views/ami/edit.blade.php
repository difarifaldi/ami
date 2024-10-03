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
                                    <li class="breadcrumb-item"><a href="/audit"><i class='bx bx-home-alt'></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Identitas AMI</li>
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
                                            <h4 class="text-center my-4">Audit Mutu Internal</h4>
                                        </div>
                                        <hr />
                                        <!-- Formulir pendaftaran -->
                                        <form id="audit-form" action="{{ route('audit.update', $audit->id) }}"
                                            method="POST" enctype="multipart/form-data">
                                            @csrf
                                            @method('PATCH')
                                            {{-- <input type="hidden" name="audit_id" value="{{ $audit->id }}"> --}}
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Unit</label>
                                                        <input type="text" class="form-control bg-white"
                                                            value="{{ $audit->unit->nama }}" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Jadwal</label>
                                                        <input type="date" class="form-control" name="tanggal"
                                                            value="{{ $audit->tanggal->format('Y-m-d') }}">

                                                        @error('tanggal')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Auditee</label>
                                                        <input type="text" class="form-control bg-white"
                                                            value="{{ $audit->auditee->name }}" readonly>

                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Auditor Ketua</label>
                                                        <select name="id_user_auditor_ketua" id="id_user_auditor_ketua"
                                                            class="single-select">
                                                            <option value="">Silahkan Pilih Auditor Ketua</option>
                                                            @foreach ($auditors as $auditor)
                                                                <option value="{{ $auditor->id }}"
                                                                    {{ $audit->auditorKetua->id == $auditor->id ? 'selected' : '' }}>
                                                                    {{ $auditor->name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                        @error('id_user_auditor_ketua')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Auditor Anggota 1</label>
                                                        <select name="id_user_auditor_anggota1"
                                                            id="id_user_auditor_anggota1" class="single-select">
                                                            <option value="">Silahkan Pilih Auditor Anggota 1</option>
                                                            @foreach ($auditors as $auditor)
                                                                <option
                                                                    value="{{ $auditor->id }}"{{ $audit->auditorAnggota1->id == $auditor->id ? 'selected' : '' }}>
                                                                    {{ $auditor->name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                        @error('id_user_auditor_anggota1')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Auditor Anggota 2</label>
                                                        <select name="id_user_auditor_anggota2"
                                                            id="id_user_auditor_anggota2" class="single-select">
                                                            <option value="">Silahkan Pilih Auditor Anggota 2</option>
                                                            @foreach ($auditors as $auditor)
                                                                <option
                                                                    value="{{ $auditor->id }}"{{ !is_null($audit->auditorAnggota2) && $audit->auditorAnggota2->id == $auditor->id ? 'selected' : '' }}>
                                                                    {{ $auditor->name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                        @error('id_user_auditor_anggota2')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Manajemen</label>
                                                        <input type="text" class="form-control bg-white"
                                                            value="{{ $audit->manajemen->name }}" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Tahun Akademik</label>
                                                        <input type="text" class="form-control bg-white"
                                                            value="{{ $audit->tahunAkademik->nama }}" readonly>
                                                    </div>
                                                </div>

                                            </div>

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


    @if ($message = Session::get('error'))
        <script>
            Swal.fire({
                icon: 'error',
                title: '{{ $message }}',
                showConfirmButton: false,
                timer: 1500
            });
        </script>
    @endif
@endsection
