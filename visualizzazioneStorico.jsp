<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <title>Document</title>
</head>
<body>
    <%@ page import="java.io.*,java.util.*" %>
    <% String user = (String) session.getAttribute("username"); %>

    <div class="container">
        <div class="navbar">
            <div class="navbar-brand">
                <a class="navbar-item" href="home.jsp">
                    <img src="static/images/Apache_Tomcat_logo.svg" alt="Logo" style="width: 100%">
                </a>
            </div>
            <div id="navbarBasicExample" class="navbar-menu">
                <div class="navbar-start">
                    <a href="home.jsp" class="navbar-item">
                        Home
                    </a>
                    <a class="navbar-item">
                        Account
                    </a>
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">
                          Operazioni
                        </a>
                        <div class="navbar-dropdown">
                          <a href="prelievo.jsp" class="navbar-item">
                            Prelievo
                          </a>
                          <a href="versamento.jsp" class="navbar-item">
                            Versamento
                          </a>
                          <hr class="navbar-divider">
                          <a href="visualizzazioneStorico.jsp" class="navbar-item">
                            Lista movimenti
                          </a>
                        </div>
                    </div>
                </div>
                <div class="navbar-end">
                  <div class="navbar-item">
                    <div class="buttons">
                      <a href="logout.jsp" class="button is-danger">
                        Logout
                      </a>
                    </div>
                  </div>
                </div>
              </div>
        </div>
        <div class="container is-flex is-justify-content-center">
            <table class="table">
                <thead>
                    <tr>
                        <th>Operazione</th>
                        <th>Importo</th>
                        <th>Data</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    if (user == null) {
                        response.sendRedirect("index.jsp");
                    }else{
                        String fileName= user + ".txt";
                        File file = new File(fileName);
                        Scanner scanner = new Scanner(file);
                        
                        while (scanner.hasNextLine()) {
                            String line = scanner.nextLine();
                            String[] data = line.split(";");
                            out.println("<tr>"); 
                            out.println("<td>" + data[0] + "</td>");
                            out.println("<td>" + data[1] + "&euro;" +"</td>");
                            out.println("<td>" + data[2] + "</td>");
                            out.println("</tr>");
                        }
                        scanner.close();
                    }
                    %>
                </tbody>
            </table>
        </div>
        
    </div>

    
    
</body>
</html>