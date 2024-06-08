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
                     <li class="nav-item dropdown dropdown-user-profile">
                         <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="javascript:;"
                             data-toggle="dropdown">
                             <div class="media user-box align-items-center">
                                 <i class="bi bi-bell text-primary"></i>
                             </div>
                         </a>
                         <div class="dropdown-menu dropdown-menu-right">
                             <a class="dropdown-item">
                                 <i class="bi bi-info-circle"> Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                     In magni
                                     velit sunt incidunt aliquam <span>
                                     </span></i>
                                 .</a>

                             <div class="dropdown-divider mb-0"></div>
                             <a class="dropdown-item">Lorem ipsum dolor sit amet, consectetur adipisicing elit. In magni
                                 velit sunt incidunt aliquam.</a>
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
                                 <img src="{{ asset('../assets/images/user.png') }}" class="user-img" alt="user avatar">
                             </div>
                         </a>
                         <div class="dropdown-menu dropdown-menu-right">
                             <a class="dropdown-item"
                                 href="{{ route('profile.edit-user', ['id' => Auth::user()->id]) }}"><i
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
