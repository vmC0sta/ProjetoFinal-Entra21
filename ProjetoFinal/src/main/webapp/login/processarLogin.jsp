<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>


<%
	
	String usuario = request.getParameter("usuario");
	String senha = request.getParameter("senha");
	
	System.out.println("Usuario: " + usuario);
	System.out.println("Senha: " + senha);
	
    MySQL dbConnection = new MySQL();
    
    try{
		Connection connection = dbConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM usuario WHERE nome = ? and senha = ?");
		preparedStatement.setString(1, usuario);
		preparedStatement.setString(2,senha);
		ResultSet resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()){
			response.sendRedirect("menu.jsp");
		}else{
			response.sendRedirect("erroLogin.jsp");
		}
    	
    }catch(SQLException e){
    	e.printStackTrace();
		response.sendRedirect("erroLogin.jsp");
    }
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
				ou
</body>
</html>