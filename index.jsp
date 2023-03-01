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
    <title>Login page</title>
</head>
<body>
<%@ page import="java.io.*, java.util.*, java.nio.file.*" %>
    <div class="columns is-centered mt-6 is-flex-mobile is-justify-content-center">
        <div class="column is-5 is-half-mobile">
          <div class="box has-text-centered">
          <%
            Boolean loginSuccesful = (Boolean) session.getAttribute("mismatch");
            if (loginSuccesful != null && loginSuccesful) {
              %>
              <div class="notification is-danger"><button class="delete"></button><strong>Errore:</strong> Password errata</div>
              <%
              session.removeAttribute("mismatch");
            }
          %>
            <img src="static/images/Apache_Tomcat_logo.svg" style="max-width: 15vw; height: auto;">
            <h1 class="is-size-2 is-size-3-mobile has-text-centered">Benvenuto, effettua il Login</h1>
            <form method="get" action="controllo.jsp">
              <div class="field">
                <div class="control">
                  <input required class="input is-rounded" type="text" name="user" placeholder="Username">
                </div>
              </div>
              <div class="field">
                <div class="control">
                  <input required class="input is-rounded" type="password" name="pwd" placeholder="Password">
                </div>
              </div>
              <div class="field">
                <div class="control has-text-centered">
                  <button class="button is-dark" type="submit">Login</button>
                </div>
              </div>
            </form>
            <div class="has-text-left">
              <a href="register.jsp">Registrati</a>
            </div>
          </div>
        </div>
      </div>
</body>
</html>