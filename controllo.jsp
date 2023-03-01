<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <title>Controllo user</title>
</head>
<body>
    <%@page import="java.io.*" %>
    <%@page import="java.util.Scanner" %>

    <% 
        String fileName="dati.txt";
        String user=request.getParameter("user");
        String pwd=request.getParameter("pwd");

        File file = new File(fileName);
        Scanner scanner = new Scanner(file);
        Boolean userTrovato = false;
        Boolean pwdTrovata = false;

        while (scanner.hasNextLine()) 
        {
            String line=scanner.nextLine();
            String[] dati=line.split(";");

            if(user.equals(dati[0])){
                if(pwd.equals(dati[1])){
                    userTrovato = true;
                    pwdTrovata = true;
                    break;
                }else if(!pwd.equals(dati[1])){
                    userTrovato = true;
                }
            }
        }

        scanner.close();

        if(userTrovato && pwdTrovata)
            {
                session.setAttribute("username", user);
                response.sendRedirect("home.jsp");
            }else if(userTrovato && !pwdTrovata){
                Boolean mismatch = true;
                session.setAttribute("mismatch", mismatch);
                response.sendRedirect("index.jsp");
            }else{
                Boolean userNotFound = true;
                session.setAttribute("userNotFound", userNotFound);
                response.sendRedirect("register.jsp"); 
            }
                %>
</body>
</html>
