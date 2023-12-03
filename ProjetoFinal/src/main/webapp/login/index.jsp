<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<section class="vh-100 gradient-custom">	
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
          
            <form action="processarLogin.jsp" method="post"class="mb-md-5 mt-md-4 pb-5">
              <h2 class="fw-bold mb-5 text-uppercase">Lorem</h2>
              <div class="form-outline form-white mb-4">
                <input type="text" id="usuario" name="usuario" placeholder="Usuário" class="form-control form-control-lg" />
              </div>
              <div class="form-outline form-white mb-4">
                <input type="password" id="senha" placeholder="Senha" name="senha" class="form-control form-control-lg" />
              </div>
              <button class="btn btn-primary btn-lg" type="submit">Entrar</button>
            </form>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>