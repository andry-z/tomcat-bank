<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <title>Save</title>
</head>
<body>
    <%@page import="java.io.*" %>
    <%@page import="java.util.Scanner" %>

    <%
        boolean usernameTaken = false;
        String fileName="dati.txt";
        String user=request.getParameter("user");
        String pwd=request.getParameter("pwd");
        String saldo=request.getParameter("saldo");

        Scanner scanner = new Scanner(new File(fileName));
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            String[] credentials = line.split(";");
            if (credentials[0].equals(user)) {
                usernameTaken = true;
                break;
            }
        }

        scanner.close();

        if(usernameTaken){

        %>
            <div class="has-text-centered">
                <h1 class="is-size-2 has-text-danger is-size-3-mobile has-text-centered">Username gi&agrave; in uso.</h1>
                <a href=register.jsp><button class="button is-dark">Torna alla pagina di registrazione</button></a>
            </div>
        <%
        }else{
        %>
            <div class="has-text-centered">
                <h1 class="is-size-2 has-text-success is-size-3-mobile has-text-centered">Registrazione effettuata.</h1>
                <a href=index.jsp><button class="button is-dark">Vai alla pagina di login</button></a>
            </div>
           
        <%
            File strFile = new File(fileName);
            boolean fileCreated = strFile.createNewFile();
            Writer objWriter = new BufferedWriter(new FileWriter(strFile,true));
            objWriter.write("\n"+user+";"+pwd+";"+saldo+"\n");
            objWriter.flush();
            objWriter.close();
        }
    %>
</body>
</html>