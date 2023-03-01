<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
	<link rel="stylesheet" href="static/css/style.css">
	<title>Open</title>
</head>
<body>
	<%@page import="java.io.*" %>
	<%@page import="java.util.Scanner" %>

	<%
		String fileName="dati.txt";

		File file = new File(fileName);
		Scanner scanner = new Scanner(file);
		out.println("<table border=1>");
		out.println("<tr><th>Nome</th><th>Pwd</th></tr>");	        
					
		while (scanner.hasNextLine()) 
		{
			String line=scanner.nextLine();
			String[] dati=line.split(";");
			out.println("<tr><td>"+dati[0]+"</td><td>"+dati[1]+"</td></tr>");	
		}
		scanner.close();
		out.println("</table>");	        
	%>
</body>
</html>