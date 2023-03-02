<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%@ page import="java.io.*, java.util.*, java.nio.file.*" %>
    <%@ page import="java.util.Scanner" %>
    <%
        String username = (String) session.getAttribute("username");
        String saldo = "";
        String importo = request.getParameter("importo");
        String tipo = request.getParameter("tipo");
        session.setAttribute("tipo", tipo);
        String esito = "";
        Boolean completato = false;
        if (username == null) {
            response.sendRedirect("login.jsp");
        }else{
            if (tipo != null && importo != null) {
                session.setAttribute("esito", null);
                double amount = Double.parseDouble(importo);
                session.setAttribute("amount", amount);
                String data = new String(Files.readAllBytes(Paths.get("dati.txt")));
                String[] lines = data.split("\n");
                for (int i = 0; i < lines.length; i++) {
                    String[] parts = lines[i].split(";");
                    if (parts[0].equals(username)) {
                        if (tipo.equals("Versamento")) {
                            if(parts[2].equals("null")){
                                parts[2] = "0";
                            }
                            esito = "Versamento effettuato con successo.";
                            session.setAttribute("esito", esito);
                            completato = true;
                            parts[2] = String.valueOf(Double.parseDouble(parts[2]) + amount);
                        } else {
                            if(amount <= Double.parseDouble(parts[2])){
                                esito = "Prelievo effettuato con successo.";
                                session.setAttribute("esito", esito);
                                completato = true;
                                parts[2] = String.valueOf(Double.parseDouble(parts[2]) - amount);
                            }else{
                                boolean insufficiente = true;
                                session.setAttribute("insufficiente", insufficiente);
                                response.sendRedirect("home.jsp");
                            }
                            
                        }
                        lines[i] = String.join(";", parts);
                        break;
                    }
                }
                Files.write(Paths.get("dati.txt"), String.join("\n", lines).getBytes());

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
            
            if(completato){
                response.sendRedirect("gestioneStorico.jsp");
            }
        }
    
    %>
    
</body>
</html>