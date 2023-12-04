<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<title>Página inicial</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="javascript:void(0)">Lorem</a>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
				
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8080/ProjetoFinal/menu/usuario/usuarios.jsp">Usuário</a>
					</li>
					
					<li class="nav-item"><a class="nav-link" href="">Pessoa</a></li>
					
					<li class="nav-item">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"aria-expanded="false"> Produto</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="http://localhost:8080/ProjetoFinal/menu/produto/produtos.jsp">Produto</a> <a
										class="dropdown-item" href="http://localhost:8080/ProjetoFinal/menu/produto/categorias.jsp">Categoria</a> <a
										class="dropdown-item" href="#">Unidade de Medida</a>
								</div>
							</li>
						</ul>
					</li>
					
				</ul>
				<div class="d-flex">
					<button class="btn btn-primary" type="button">Perfil</button>
				</div>
			</div>
		</div>
	</nav>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>