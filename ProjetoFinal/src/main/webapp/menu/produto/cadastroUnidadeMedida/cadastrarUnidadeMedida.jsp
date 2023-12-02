<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar Unidade de Medida</title>
</head>
<body>
		<nav>
			<%@include file="/menu/menu.jsp"%>
		</nav>
		
		<main class="container">
		
			<h1 style="margin: 1.5rem 0">Cadastrar Unidade de Medida</h1>
			<form action="processarUnidadeMedida.jsp" method="POST">
				<div class="form-row">
					<div class="form-group col-md-6" style="margin: 1rem 0">
						<label for="id" style="font-weight: bolder">Descrição</label> 
						<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Descrição">
					</div>
					<div class="form-group col-md-1" style="margin: 1rem 0">
						<label for="id" style="font-weight: bolder">Sigla</label> 
						<input type="text" class="form-control" id="descricao" name="sigla" placeholder="Sigla">
					</div>
				</div>
				<button class="btn btn-primary">Salvar</button>
			</form>
		</main>
</body>
</html>