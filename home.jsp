<!DOCTYPE html>
<html lang="en"> 
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', () => {
          (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
            const $notification = $delete.parentNode;
            $delete.addEventListener('click', () => {
            $notification.parentNode.removeChild($notification);
            });
          });
        });
        </script>
    <title>Homepage</title>
</head>
<body onload="checkRefresh()">
    <%@ page import="java.io.*,java.util.*" %>
    <%
        String username = (String) session.getAttribute("username");
        String saldo = "";
        Boolean insufficiente = (Boolean) session.getAttribute("insufficiente");
        if (username == null) {
            response.sendRedirect("index.jsp");
        }else{
            Scanner scanner = new Scanner(new File("dati.txt"));
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] parts = line.split(";");
                if (parts[0].equals(username)) {
                    saldo = parts[2];
                    break;
                }
            }
            scanner.close();
        }
        if(saldo.equals("null")){
            saldo = "0";
        }
        String esito = (String) session.getAttribute("esito");
    %>
    <form name="refreshForm">
      <input type="hidden" name="visited" value="" />
    </form>
    <script type="text/javascript">
      function checkRefresh(){
	        if(document.refreshForm.visited.value == ""){
		        document.refreshForm.visited.value = "1"
	        }else{
              <% 
                session.removeAttribute("esito");
                session.removeAttribute("insufficiente");
              %>
          }
        }
    </script>
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
        <div class="has-text-centered">
            <h1 class="is-size-2 is-size-3-mobile has-text-centered">Benvenuto <%= username %>!</h1>
            <% 
                if(esito != null){
            %>
            <div class="container is-flex is-justify-content-center">
                <div class="notification is-success" style="max-width: 25%;"><button class="delete"></button><span class="is-size-7-mobile"><%= esito %></span></div>
            </div>
            
            <%
                }
                if(insufficiente != null && insufficiente){
            %>
            <div class="container is-flex is-justify-content-center">
              <div class="notification is-danger" style="max-width: 25%;"><button class="delete"></button><span class="is-size-7-mobile"><strong>Errore: </strong>Saldo insufficiente</span></div>
            </div>
            <%
              insufficiente = null;
                }
              
            %>
            
            <h2 class="is-size-4 is-size-5-mobile has-text-centered">Saldo: <%= saldo %>&euro;</h2>
            <a href="versamento.jsp"><button class="button is-dark">Versamento</button></a>
            <a href="prelievo.jsp"><button class="button is-dark">Prelievo</button></a> 
        </div>
    </div>
</body>
</html>