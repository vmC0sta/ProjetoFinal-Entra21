<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastrar Categoria</title>
</head>
<body>
		<nav>
			<%@include file="/menu/menu.jsp"%>
		</nav>
		
		<main class="container">
		
			<h1 style="margin: 1.5rem 0">Cadastrar Categoria</h1>
			<form action="processarCategoria.jsp" method="POST">
				<div class="form-row">
					<div class="form-group col-md-6" style="margin: 1rem 0">
						<label for="id" style="font-weight: bolder">Descri��o</label> 
						<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Descri��o">
					</div>
				</div>
				<button class="btn btn-primary">Salvar</button>
			</form>
		</main>
</body>
</html>