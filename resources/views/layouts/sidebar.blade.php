<!-- wrapper -->
<div class="wrapper">
    <!--sidebar-wrapper-->
    <div class="sidebar-wrapper" data-simplebar="true">
        <div class="sidebar-header">
            <div class="">
                <a href="/"><img src="{{ asset('../assets/images/PNJ.png') }}" class="logo-icon-2"
                        alt="" /></a>
            </div>
            <div>
                <h4 class="logo-text"><a href="/" style="color: blue;">PNJ</a></h4>
            </div>
            <a href="javascript:;" class="toggle-btn ml-auto"> <i class="bx bx-menu"></i>
            </a>
        </div>
        <!--navigation-->
        <ul class="metismenu" id="menu">
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon icon-color-1"><i class="bx bx-home-alt"></i>
                    </div>
                    <div class="menu-title">Dashboard</div>
                </a>
                <ul>
                    <li> <a href="/"><i class="bx bx-right-arrow-alt"></i>Home</a>
                    </li>
                    <!-- <li> <a href="index2.html"><i class="bx bx-right-arrow-alt"></i>Sales</a>
      </li> -->
                </ul>
            </li>

            {{-- Audit Mutu --}}
            <li class="menu-label">Audit Mutu</li>
            <li>
                <a class="has-arrow" href="javascript:;">
                    <div class="parent-icon icon-color-1"> <i class="bi bi-mortarboard"></i>
                    </div>
                    <div class="menu-title ">Audit Mutu</div>
                </a>
                <ul>
                    <li> <a href="/standar"><i class="bi bi-pencil-square"></i></i>Ketercapaian Standar</a>
                    </li>


                </ul>
            </li>
            <li>
                <a class="has-arrow" href="javascript:;">
                    <div class="parent-icon icon-color-2"><i class="bx bx-grid-alt"></i>
                    </div>
                    <div class="menu-title">Test</div>
                </a>
                <ul>
                    @if (Auth::user()->role === 'admin' || Auth::user()->role === 'foreman' || Auth::user()->role === 'superadmin')
                        <li> <a href="#"><i class="bx bx-right-arrow-alt"></i>Data Standar Indikator</a>
                        </li>
                    @endif

                </ul>
            </li>

            {{-- unit --}}
            @role('superadmin')
                <li class="menu-label">Admin Section</li>
                <li>
                    <a class="has-arrow" href="javascript:;">
                        <div class="parent-icon icon-color-1"> <i class="bi bi-building-gear"></i>
                        </div>
                        <div class="menu-title ">Unit</div>
                    </a>
                    <ul>
                        <li> <a href="/unit"><i class="bi bi-pencil-square"></i></i>Daftar Unit</a>
                        </li>


                    </ul>
                </li>
            @endrole
        </ul>
        <!--end navigation-->
    </div>
</div>
