 <!-- wrapper -->
 <div class="wrapper">
     <!--header-->
     <header class="top-header">
         <nav class="navbar navbar-expand">
             <div class="left-topbar d-flex align-items-center">
                 <a href="javascript:;" class="toggle-btn"> <i class="bx bx-menu"></i>
                 </a>
             </div>
             <div class="right-topbar ml-auto">
                 <ul class="navbar-nav">
                     <?php
                     $userId = Auth::id();
                     //  Auditee
                     if (Auth::user()->hasRole('auditee')) {
                         $auditHistory = App\Models\AuditMutuInternal::where('status_audit', '=', 'selesai')->where('id_user_auditee', $userId)->get();
                     
                         $auditMutuIds = App\Models\AuditMutuInternal::where('status_audit', '=', 'belum selesai')->where('id_user_auditee', $userId)->pluck('id')->toArray();
                     
                         $instruments = App\Models\InstrumenAudit::where('id_AMI', $auditMutuIds)->whereNull('tanggapan_auditee')->whereNotNull('id_status_temuan')->get();
                     
                         $instrumentsCount = App\Models\InstrumenAudit::where('id_AMI', $auditMutuIds)->whereNull('tanggapan_auditee')->whereNotNull('id_status_temuan')->count();
                     
                         //  Auditor
                     } elseif (Auth::user()->hasRole('auditor')) {
                         $auditHistory = App\Models\AuditMutuInternal::where('status_audit', 'selesai')
                             ->where(function ($query) use ($userId) {
                                 $query->where('id_user_auditor_ketua', $userId)->orWhere('id_user_auditor_anggota1', $userId)->orWhere('id_user_auditor_anggota2', $userId);
                             })
                             ->get();
                     
                         $auditMutuIds = App\Models\AuditMutuInternal::where('status_audit', '=', 'belum selesai')->where('id_user_auditor_ketua', $userId)->orWhere('id_user_auditor_anggota1', $userId)->orWhere('id_user_auditor_anggota2', $userId)->pluck('id')->toArray();
                     
                         $instruments = App\Models\InstrumenAudit::whereIn('id_AMI', $auditMutuIds)->whereNull('id_status_temuan')->whereNotNull('id_status_tercapai')->get();
                     
                         $instrumentsCount = App\Models\InstrumenAudit::whereIn('id_AMI', $auditMutuIds)->whereNull('id_status_temuan')->whereNotNull('id_status_tercapai')->count();
                     
                         //  Manajemen
                     } elseif (Auth::user()->hasRole('manajemen')) {
                         $auditHistory = App\Models\AuditMutuInternal::where('status_audit', '=', 'belum selesai')->where('id_user_manajemen', $userId)->get();
                     
                         $auditMutuIds = App\Models\AuditMutuInternal::where('status_audit', '=', 'belum selesai')->where('id_user_manajemen', $userId)->pluck('id')->toArray();
                     
                         $instruments = App\Models\InstrumenAudit::where('id_AMI', $auditMutuIds)->whereNull('id_status_akhir')->whereNotNull('tanggapan_auditee')->get();
                     
                         $instrumentsCount = App\Models\InstrumenAudit::where('id_AMI', $auditMutuIds)->whereNull('id_status_akhir')->whereNotNull('tanggapan_auditee')->count();
                     
                         //  Admin
                     } elseif (Auth::user()->hasRole('admin')) {
                         $instruments = App\Models\User::where('forgot_password', 'ya')->get();
                     
                         $instrumentsCount = App\Models\User::where('forgot_password', 'ya')->count();
                     }
                     ?>

                     {{-- Riwayat Dropdown  --}}
                     @unlessrole('admin')
                         <li class="nav-item dropdown dropdown-lg">
                             <a class="nav-link dropdown-toggle dropdown-toggle-nocaret position-relative "
                                 href="javascript:;" data-toggle="dropdown"> <i
                                     class="bi bi-calendar3 vertical-align-middle "></i>
                             </a>
                             <div class="dropdown-menu dropdown-menu-right">
                                 <a href="javascript:;">
                                 </a>
                                 <div class="header-notifications-list mt-2">
                                     @forelse ($auditHistory as $audit)
                                         <a class="dropdown-item"
                                             href="{{ route('riwayat', ['select_unit' => $audit->unit->id, 'select_TA' => $audit->tahunAkademik->id]) }}">
                                             <div class="media align-items-center">

                                                 <div class="media-body">
                                                     <h6 class="msg-name font-weight-bold mb-1">
                                                         {{ $audit->unit->nama }}<span
                                                             class="msg-time float-right">{{ $audit->tanggal->diffForHumans() }}</span>

                                                     </h6>

                                                     <p class="msg-info">
                                                         {{ $audit->tahunAkademik->nama }}
                                                     </p>


                                                 </div>
                                             </div>
                                         </a>
                                     @empty

                                         <a class="dropdown-item" href="javascript:;">
                                             <div class="media align-items-center">
                                                 <div class="notify bg-light-danger text-danger"><i
                                                         class="bx bx-task-x"></i>
                                                 </div>
                                                 <div class="media-body">
                                                     <h6 class="msg-name font-weight-bold mb-1">Riwayat Kosong</h6>
                                                 </div>
                                             </div>
                                         </a>
                                     @endforelse
                                 </div>
                             </div>
                         </li>
                     @endunlessrole

                     {{-- Notifikasi --}}
                     <li class="nav-item dropdown dropdown-lg ">
                         <a class="nav-link dropdown-toggle dropdown-toggle-nocaret position-relative "
                             href="javascript:;" data-toggle="dropdown"> <i
                                 class="bx bx-bell vertical-align-middle "></i>
                             <span class="msg-count bg-danger"> {{ $instrumentsCount }}</span>
                         </a>
                         <div class="dropdown-menu dropdown-menu-right ">
                             <a href="javascript:;">
                                 <div class="msg-header bg-wall">
                                     <h6 class="msg-header-title"> {{ $instrumentsCount }} Pesan</h6>
                                     <p class="msg-header-subtitle">Notifikasi Aplikasi</p>
                                 </div>
                             </a>
                             <div class="header-notifications-list">
                                 @forelse ($instruments as $instrument)
                                     @if (Auth::user()->hasRole('admin'))
                                         <a class="dropdown-item" href="/admin/edit-user/{{ $instrument->id }}">
                                         @else
                                             <a class="dropdown-item" href="/instrument/{{ $instrument->id }}/edit">
                                     @endif

                                     <div class="media align-items-center">
                                         <div
                                             class="notify  {{ Auth::user()->hasRole('admin') ? 'bg-light-danger text-danger' : 'bg-light-success text-success' }}">
                                             @if (Auth::user()->hasRole('admin'))
                                                 <i class="bi bi-person-exclamation"></i>
                                             @else
                                                 <i class='bx bx-check-square'></i>
                                             @endif
                                         </div>
                                         <div class="media-body">
                                             <h6 class="msg-name font-weight-bold mb-1">Pesan Baru <span
                                                     class="msg-time float-right">{{ $instrument->updated_at->diffForHumans() }}</span>
                                             </h6>
                                             @if (Auth::user()->hasRole('auditee'))
                                                 <p class="msg-info">Tanggapan Untuk Indikator
                                                     {{ $instrument->indikator->no }}</p>
                                             @elseif (Auth::user()->hasAnyRole(['auditor', 'manajemen']))
                                                 <p class="msg-info">Silahkan Audit Indikator
                                                     {{ $instrument->indikator->no }}</p>
                                             @elseif (Auth::user()->hasRole('admin'))
                                                 <p class="msg-info">
                                                     <strong>{{ $instrument->name }}</strong> Lupa Password
                                                 </p>
                                             @endif

                                         </div>
                                     </div>
                                     </a>
                                 @empty
                                     <a class="dropdown-item" href="javascript:;">
                                         <div class="media align-items-center">
                                             <div class="notify bg-light-danger text-danger"><i
                                                     class="bx bx-task-x"></i></div>
                                             <div class="media-body">
                                                 <h6 class="msg-name font-weight-bold mb-1">Pesan Kosong</h6>
                                             </div>
                                         </div>
                                     </a>
                                 @endforelse
                             </div>

                         </div>
                     </li>


                     {{-- Akun dropdown --}}
                     <li class="nav-item dropdown dropdown-user-profile">
                         <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="javascript:;"
                             data-toggle="dropdown">
                             <div class="media user-box align-items-center">
                                 <div class="media-body user-info">
                                     <p class="user-name mb-0">
                                         {{ Auth::user()->name ? Auth::user()->name : 'Data Nama tidak ditemukan' }}

                                     </p>
                                     <p class="designattion mb-0 text-success">
                                         {{ Auth::user()->roles[0]->name ? Auth::user()->roles[0]->name : 'Data Role tidak ditemukan' }}
                                     </p>
                                 </div>
                                 <i class="fas fa-user-circle fa-fw"></i>

                                 @if (Auth::user()->foto)
                                     <img src="{{ asset('/storage/' . Auth::user()->foto) }}" class="user-img"
                                         alt="user avatar">
                                 @else
                                     <img src="{{ asset('../assets/images/user.png') }}" class="user-img"
                                         alt="user avatar">
                                 @endif
                             </div>
                         </a>
                         <div class="dropdown-menu dropdown-menu-right">
                             <a class="dropdown-item"
                                 href="{{ route('profile.edit-profile', ['id' => Auth::user()->id]) }}"><i
                                     class="bi bi-person fa-8x"></i><span>Profile</span></a>

                             <div class="dropdown-divider mb-0"></div>
                             <a class="dropdown-item" href="{{ route('logout') }}">
                                 <i class="bi bi-power text-red"></i>
                                 <span>Logout</span>
                             </a>
                         </div>
                     </li>

                 </ul>
             </div>
         </nav>
     </header>
 </div>
 <!-- end wrapper -->
