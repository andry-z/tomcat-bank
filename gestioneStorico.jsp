<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%@ page import="java.io.*,java.util.*" %>
    <%@ page import="java.text.DecimalFormat" %>
    <%
    String username = (String) session.getAttribute("username");
    String tipo = (String) session.getAttribute("tipo");
    double amount = (Double) session.getAttribute("amount");
    if (username == null) {
        response.sendRedirect("index.jsp");
    } else {
        String fileName = username + ".txt"; 
        File file = new File(fileName);

        if (!file.exists()) { 
            file.createNewFile();
        }

        if (amount > 0 && tipo != "") {
            String formattedAmount = new DecimalFormat("#.##").format(amount);
            String transaction = tipo + ";" + formattedAmount + ";" + new Date().toString() + "\n"; 
            FileWriter fileWriter = new FileWriter(file, true); 
            fileWriter.write(transaction);
            fileWriter.close();
        }
        response.sendRedirect("home.jsp");
    }
    
    %>
</body>
</html>