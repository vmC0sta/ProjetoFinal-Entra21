<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar Categoria</title>
</head>
<body>
		<nav>
			<%@include file="/menu/menu.jsp"%>
		</nav>
		
		<main class="container">
		
			<h1 style="margin: 1.5rem 0">Cadastrar País</h1>
			<form action="processarPais.jsp" method="POST">
				<div class="form-row">
					<div class="form-group col-md-6" style="margin: 1rem 0">
						<label for="id" style="font-weight: bolder">Descrição</label> 
						<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Descrição">
					</div>
				</div>
				<button class="btn btn-primary">Salvar</button>
			</form>
		</main>
</body>
</html>