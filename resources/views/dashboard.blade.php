@extends('layouts.layouts')

@section('content')
	<div class="wrapper">
    <!--page-wrapper-->
		<div class="page-wrapper">
			<!--page-content-wrapper-->
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="text-right">
						<p id="clock" style="font-size: 20px;"></p>
					</div>
					<!--end row-->
					<!-- <div class="card-deck">
						<div class="card radius-15">
							<div class="card-body">
								<div class="d-flex align-items-center">
									<div>
										<h5 class="mb-0">Traffic</h5>
									</div>
									<div class="dropdown ml-auto">
										<div class="cursor-pointer font-24 dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown"><i class="bx bx-dots-horizontal-rounded"></i>
										</div>
										<div class="dropdown-menu dropdown-menu-right">	<a class="dropdown-item" href="javascript:;">Action</a>
											<a class="dropdown-item" href="javascript:;">Another action</a>
											<div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Something else here</a>
										</div>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-12 col-lg-6">
										<div class="card radius-15 mx-0">
											<div class="card-body">
												<div class="d-flex align-items-center">
													<div>
														<p class="mb-0">Store Visits</p>
													</div>
													<div class="ml-auto text-success"><span>+22%</span>
													</div>
												</div>
												<h4 class="mb-0">8950</h4>
											</div>
										</div>
									</div>
									<div class="col-12 col-lg-6">
										<div class="card radius-15 mx-0">
											<div class="card-body">
												<div class="d-flex align-items-center">
													<div>
														<p class="mb-0">Visitors</p>
													</div>
													<div class="ml-auto text-purple"><span>-24%</span>
													</div>
												</div>
												<h4 class="mb-0">1520</h4>
											</div>
										</div>
									</div>
								</div>
								<div id="chart3"></div>
							</div>
						</div>
					</div> -->
					<!--end row-->
					<!-- <div class="card radius-15">
						<div class="card-header border-bottom-0">
							<div class="d-flex align-items-center">
								<div>
									<h5 class="mb-0">Recent Orders</h5>
								</div>
								<div class="ml-auto">
									<button type="button" class="btn btn-white radius-15">View More</button>
								</div>
							</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table mb-0">
									<thead>
										<tr>
											<th>Photo</th>
											<th>Product Name</th>
											<th>Customer</th>
											<th>Product id</th>
											<th>Price</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<div class="product-img bg-transparent border">
													<img src="assets/images/icons/smartphone.png" width="35" alt="">
												</div>
											</td>
											<td>Honor Mobile 7x</td>
											<td>Mitchell Daniel</td>
											<td>#835478</td>
											<td>$54.68</td>
											<td><a href="javascript:;" class="btn btn-sm btn-light-success btn-block radius-30">Delivered</a>
											</td>
										</tr>
										<tr>
											<td>
												<div class="product-img bg-transparent border">
													<img src="assets/images/icons/watch.png" width="35" alt="">
												</div>
											</td>
											<td>Hand Watch</td>
											<td>Milona Burke</td>
											<td>#987546</td>
											<td>$43.78</td>
											<td><a href="javascript:;" class="btn btn-sm btn-light-warning btn-block radius-30">Pending</a>
											</td>
										</tr>
										<tr>
											<td>
												<div class="product-img bg-transparent border">
													<img src="assets/images/icons/laptop.png" width="35" alt="">
												</div>
											</td>
											<td>Mini Laptop</td>
											<td>Craig Clayton</td>
											<td>#325687</td>
											<td>$62.21</td>
											<td><a href="javascript:;" class="btn btn-sm btn-light-success btn-block radius-30">Delivered</a>
											</td>
										</tr>
										<tr>
											<td>
												<div class="product-img bg-transparent border">
													<img src="assets/images/icons/shirt.png" width="35" alt="">
												</div>
											</td>
											<td>Slim-T-Shirt</td>
											<td>Clark Andola</td>
											<td>#658972</td>
											<td>$75.68</td>
											<td><a href="javascript:;" class="btn btn-sm btn-light-danger btn-block radius-30">Cancelled</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div> -->
				</div>
			</div>
			<!--end page-content-wrapper-->
		</div>
		<!--end page-wrapper-->
	</div>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

		@if ($message = Session::get('warning'))
		<script>
				Swal.fire({
					icon: 'warning',
					title: '{{ $message }}',
					showConfirmButton: false,
					timer: 2500
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

		<script>
			function updateClock() {
				var now = new Date();
				var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
				var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
				var dayOfWeek = days[now.getDay()];
				var dayOfMonth = now.getDate();
				var month = months[now.getMonth()];
				var year = now.getFullYear();
				var hours = now.getHours();
				var minutes = now.getMinutes();
				var seconds = now.getSeconds();
				var timeString = dayOfWeek + ', ' + dayOfMonth + ' ' + month + ' ' + year + ' ' + hours.toString().padStart(2, '0') + ':' + minutes.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0');
				document.getElementById('clock').textContent = timeString;
			}

			// Update clock every second
			setInterval(updateClock, 1000);

			// Initial call to update clock
			updateClock();
		</script>
@endsection