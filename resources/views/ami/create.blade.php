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
                                        <form id="audit-form" action="{{ route('audit.store') }}" method="POST"
                                            enctype="multipart/form-data">
                                            @csrf
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Unit</label>
                                                        <select name="id_unit" id="id_unit" class="form-control bg-white"
                                                            onchange="fetchAuditeeByUnit()">
                                                            <option value="">Silahkan Pilih Unit</option>
                                                            @foreach ($units as $unit)
                                                                <option value="{{ $unit->id }}"
                                                                    {{ old('id_unit') == $unit->id ? 'selected' : '' }}>
                                                                    {{ $unit->nama }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Jadwal</label>
                                                        <input type="date" class="form-control" name="tanggal"
                                                            value="{{ old('tanggal', now()->format('Y-m-d')) }}">

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
                                                        <select name="id_user_auditee" id="id_user_auditee"
                                                            class="form-control bg-white">
                                                            <option value="">Silahkan Pilih Auditee</option>
                                                            @foreach ($auditees as $auditee)
                                                                <option value="{{ $auditee->id }}"
                                                                    {{ old('id_user_auditee') == $auditee->id ? 'selected' : '' }}>
                                                                    {{ $auditee->name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                        @error('id_user_auditee')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Auditor Ketua</label>
                                                        <select name="id_user_auditor_ketua" id="id_user_auditor_ketua"
                                                            class="form-control bg-white">
                                                            <option value="">Silahkan Pilih Auditor Ketua</option>
                                                            @foreach ($auditors as $auditor)
                                                                <option value="{{ $auditor->id }}"
                                                                    {{ old('id_user_auditor_ketua') == $auditor->id ? 'selected' : '' }}>
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
                                                            id="id_user_auditor_anggota1" class="form-control bg-white">
                                                            <option value="">Silahkan Pilih Auditor Anggota 1</option>
                                                            @foreach ($auditors as $auditor)
                                                                <option
                                                                    value="{{ $auditor->id }}"{{ old('id_user_auditor_anggota1') == $auditor->id ? 'selected' : '' }}>
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
                                                            id="id_user_auditor_anggota2" class="form-control bg-white">
                                                            <option value="">Silahkan Pilih Auditor Anggota 2</option>
                                                            @foreach ($auditors as $auditor)
                                                                <option
                                                                    value="{{ $auditor->id }}"{{ old('id_user_auditor_anggota2') == $auditor->id ? 'selected' : '' }}>
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
                                                        <select name="id_user_manajemen" id="id_user_manajemen"
                                                            class="form-control bg-white">
                                                            <option value="">Silahkan Pilih Manajemen</option>
                                                            @foreach ($manajemens as $manajemen)
                                                                <option
                                                                    value="{{ $manajemen->id }}"{{ old('id_user_manajemen') == $manajemen->id ? 'selected' : '' }}>
                                                                    {{ $manajemen->name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                        @error('id_user_manajemen')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-group mt-4">
                                                        <label>Tahun Akademik</label>
                                                        <select name="id_TA" id="id_TA" class="form-control bg-white">
                                                            <option value="">Silahkan Pilih Tahun Akademik</option>
                                                            @foreach ($tahuns as $tahun)
                                                                <option
                                                                    value="{{ $tahun->id }}"{{ old('id_TA') == $tahun->id ? 'selected' : '' }}>
                                                                    {{ $tahun->nama }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                        @error('id_TA')
                                                            <div class="d-block text-danger">{{ $message }}</div>
                                                        @enderror
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
    <script>
        function fetchAuditeeByUnit() {
            var unitId = document.getElementById('id_unit').value;

            // Hapus opsi sebelumnya
            var auditeeSelect = document.getElementById('id_user_auditee');
            auditeeSelect.innerHTML = '<option value="">Silahkan Pilih Auditee</option>';

            if (unitId) {
                fetch(`/auditee/by-unit/${unitId}`)
                    .then(response => response.json())
                    .then(data => {
                        data.forEach(user => {
                            var option = document.createElement('option');
                            option.value = user.id;
                            option.textContent = user.name;
                            auditeeSelect.appendChild(option);
                        });
                    })
                    .catch(error => console.error('Error:', error));
            }
        }
    </script>

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
