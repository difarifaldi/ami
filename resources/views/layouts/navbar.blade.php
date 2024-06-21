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
                     $auditMutuIds = App\Models\AuditMutuInternal::where('id_user_auditee', $userId)->pluck('id')->toArray();
                     $instruments = App\Models\InstrumenAudit::where('id_AMI', $auditMutuIds)->whereNull('tanggapan_auditee')->whereNotNull('id_status_temuan')->where('status_audit', '=', 'belum selesai')->get();
                     $instrumentsCount = App\Models\InstrumenAudit::where('id_AMI', $auditMutuIds)->whereNull('tanggapan_auditee')->whereNotNull('id_status_temuan')->where('status_audit', '=', 'belum selesai')->count();
                     
                     ?>


                     <li class="nav-item dropdown dropdown-lg">
                         <a class="nav-link dropdown-toggle dropdown-toggle-nocaret position-relative"
                             href="javascript:;" data-toggle="dropdown"> <i
                                 class="bx bx-bell vertical-align-middle"></i>
                             <span class="msg-count"> {{ $instrumentsCount }}</span>
                         </a>
                         <div class="dropdown-menu dropdown-menu-right">
                             <a href="javascript:;">
                                 <div class="msg-header">
                                     <h6 class="msg-header-title"> {{ $instrumentsCount }} Pesan</h6>
                                     <p class="msg-header-subtitle">Notifikasi Aplikasi</p>
                                 </div>
                             </a>
                             <div class="header-notifications-list">
                                 @forelse ($instruments as $instrument)
                                     <a class="dropdown-item" href="/instrument/{{ $instrument->id }}/edit">
                                         <div class="media align-items-center">
                                             <div class="notify bg-light-success text-success"><i
                                                     class='bx bx-check-square'></i>
                                             </div>
                                             <div class="media-body">
                                                 <h6 class="msg-name font-weight-bold mb-1">Pesan Baru <span
                                                         class="msg-time float-right">{{ $instrument->updated_at->diffForHumans() }}</span>
                                                 </h6>
                                                 <p class="msg-info">Tanggapan Untuk Indikator
                                                     {{ $instrument->indikator->no }}</p>
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
                                                 <p class="msg-info">Auditor Belum Mengisi Data</p>
                                             </div>
                                         </div>
                                     </a>
                                 @endforelse
                             </div>

                         </div>
                     </li>



                     <li class="nav-item dropdown dropdown-user-profile">
                         <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="javascript:;"
                             data-toggle="dropdown">
                             <div class="media user-box align-items-center">
                                 <div class="media-body user-info">
                                     <p class="user-name mb-0">
                                         {{ Auth::user()->name ? Auth::user()->name : 'Data Nama tidak ditemukan' }} -
                                         {{ Auth::user()->roles[0]->name ? Auth::user()->roles[0]->name : 'Data Role tidak ditemukan' }}
                                     </p>
                                     <p class="designattion mb-0 text-success">
                                         {{ Auth::user() ? Auth::user()->status : 'Data Nama tidak ditemukan' }}</p>
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
