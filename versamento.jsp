<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <title>Versamento</title>
</head>
<body>
  <%@ page import="java.io.*,java.util.*" %>
    <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="container">
        <div class="navbar  ">
            <div class="navbar-brand">
                <a class="navbar-item" href="home.jsp">
                    <img src="static/images/Apache_Tomcat_logo.svg" alt="Logo" style="width: 100%">
                </a>
                <a role="button" class="navbar-burger">
                    <span></span>
                    <span></span>
                    <span></span>
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
        <h1 class="is-size-2 is-size-3-mobile has-text-centered">Versamento</h1>
        <form action="gestioneTransazioni.jsp" method="post">
            <div class="field">
                <div class="control">
                    <label class="label" for="importo">Inserisci l'importo da versare: </label>
                    <div class="columns is-mobile is-centered">
                        <div class="column is-one-third-mobile is-one-third-desktop">
                          <input class="input is-rounded" type="number" step="any" placeholder="Importo in &euro;" name="importo">
                          <input type="hidden" name="tipo" value="Versamento">
                        </div>
                    </div>
                    <button class="button is-dark">Deposita</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
