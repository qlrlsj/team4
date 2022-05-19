<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="resources/css/bootstrap.css" rel="stylesheet">
<!-- <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->

<script src="resources/js/jquery-3.6.0.js"></script>
<script src="resources/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
	<button type="button" class="btn btn-primary">Primary</button>
	<button type="button" class="btn btn-secondary">Secondary</button>
	<button type="button" class="btn btn-success">Success</button>
	<button type="button" class="btn btn-danger">Danger</button>
	<button type="button" class="btn btn-warning">Warning</button>
	<button type="button" class="btn btn-info">Info</button>
	<button type="button" class="btn btn-light">Light</button>
	<button type="butt	on" class="btn btn-dark">Dark</button>
	<button type="button" class="btn btn-link">Link</button>
	<br>
	<hr>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	 모달버튼
	</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        	ㅇㅇㅇ
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	<br>
	<hr>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">Email
			address</label> <input type="email" class="form-control"
			id="exampleFormControlInput1" placeholder="name@example.com">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">Example
			textarea</label>
		<textarea class="form-control" id="exampleFormControlTextarea1"
			rows="3"></textarea>
	</div>
	<div class="p-3 mb-2 bg-primary text-white">.bg-primary</div>
	<div class="p-3 mb-2 bg-secondary text-white">.bg-secondary</div>
	<div class="p-3 mb-2 bg-success text-white">.bg-success</div>
	<div class="p-3 mb-2 bg-danger text-white">.bg-danger</div>
	<div class="p-3 mb-2 bg-warning text-dark">.bg-warning</div>
	<div class="p-3 mb-2 bg-info text-dark">.bg-info</div>
	<div class="p-3 mb-2 bg-light text-dark">.bg-light</div>
	<div class="p-3 mb-2 bg-dark text-white">.bg-dark</div>
	<div class="p-3 mb-2 bg-body text-dark">.bg-body</div>
	<div class="p-3 mb-2 bg-white text-dark">.bg-white</div>
	<div class="p-3 mb-2 bg-transparent text-dark">.bg-transparent</div>
	<p>.bg-success</p>
	<br>
	<hr>
	<div class="bd-example bd-example-border-utils">
		<span class="border border-primary">내용</span>
		<span class="border border-secondary"></span>
		<span class="border border-success"></span>
		<span class="border border-danger"></span>
		<span class="border border-warning"></span>
		<span class="border border-info"></span>
		<span class="border border-light"></span>
		<span class="border border-dark"></span>
		<span class="border border-white"></span>
	</div>
	<br>
	<hr>
	<div class="bd-example bd-example-border-utils">
		<span class="border border-1"></span>
		<span class="border border-2"></span>
		<span class="border border-3"></span>
		<span class="border border-4"></span>
		<span class="border border-5"></span>
	</div>
	
	<br><hr>
	<div class="container">
		<div class="row">
			<div class="col">Column</div>
			<div class="col">Column</div>
			<div class="col">Column</div>
		</div>
	</div>
</body>
<script type="text/javascript"></script>
</html>