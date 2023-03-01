<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css"
    />
    <link rel="stylesheet" href="static/css/style.css" />
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
    <title>Registrati</title>
  </head>
  <body>
    <div
      class="columns is-centered mt-6 is-flex-mobile is-justify-content-center"
    >
      <div class="column is-5 is-half-mobile">
        <div class="box has-text-centered">
        <%
            Boolean userNotFound = (Boolean) session.getAttribute("userNotFound");
            if (userNotFound != null && userNotFound) {
              %>

              <div class="notification is-danger"><button class="delete"></button><strong>Errore:</strong> Utente non trovato.</div>
              <%
              session.removeAttribute("userNotFound");
            }
          %>
          <h1 class="is-size-2 is-size-3-mobile has-text-centered mb-4">
            Registrati
          </h1>
          <form method="post" action="save.jsp">
            <div class="field">
              <div class="control">
                <input
                  required
                  class="input is-rounded"
                  type="text"
                  name="user"
                  placeholder="Username"
                />
              </div>
            </div>
            <div class="field mb-4">
              <div class="control">
                <input
                  required
                  class="input is-rounded"
                  type="password"
                  name="pwd"
                  placeholder="Password"
                />
              </div>
            </div>
            <div class="field">
              <div class="control has-text-centered">
                <input class="button is-dark" type="submit" value="Invia" />
              </div>
            </div>
          </form>
          <div class="has-text-left">
            <a href="login.jsp">Login</a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
