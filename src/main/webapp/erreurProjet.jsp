<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        .erreur {
            border: 1px solid red;
        }
    </style>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-info text-white text-center">
                    <h1>Création du Nouveau Projet</h1>
                </div>
                <div class="card-body">
                    <%-- Affichage de l'alerte si le paramètre "erreur" est présent --%>
                    <% if (request.getAttribute("erreur") != null) { %>
                        <div class="alert alert-danger" role="alert">
                            <%= request.getAttribute("erreur") %>
                        </div>
                    <% } %>

                    <form action="CreationServlet" method="post">
                        <div class="form-group">
                            <label for="nomProjet">Nom du Projet</label>
                            <input type="text" class="form-control <% if (request.getAttribute("erreur") != null) { %>erreur<% } %>" id="nomProjet" name="nomProjet" value="<%= request.getParameter("nomProjet") %>" required>
                        </div>
						<div class="form-group">
                            <label for="descriptionProjet">Description du Projet</label>
                            <textarea class="form-control" id="descriptionProjet" name="descriptionProjet" rows="3" required><%= request.getParameter("descriptionProjet") %></textarea>
                        </div>
                        <div class="form-group">
                            <label for="clientProjet">Client du Projet</label>
                            <input type="text" class="form-control" id="clientProjet" name="clientProjet" value="<%= request.getParameter("clientProjet") %>" required>
                        </div>
                        <div class="form-group">
                            <label for="dateDebut">Date de Démarrage</label>
                            <input type="text" class="form-control" id="datepickerDebut" name="dateDebut" value="<%= request.getParameter("dateDebut") %>" required>
                        </div>
                        <div class="form-group">
                            <label for="dateLivraison">Date de Livraison</label>
                            <input type="text" class="form-control" id="datepickerLivraison" name="dateLivraison" value="<%= request.getParameter("dateLivraison") %>" required>
                        </div>
                        <div class="form-group">
                            <label for="joursDeveloppement">Nombre de Jours de Développement</label>
                            <input type="number" class="form-control" id="joursDeveloppement" name="joursDeveloppement" value="<%= request.getParameter("joursDeveloppement") %>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="chefProjet">Chef de Projet</label>
                            <select class="form-control" id="chefProjet" name="chefProjet" required>
                                <!-- Options du sélecteur avec la valeur par défaut depuis la requête... -->
                            </select>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Enregistrer le Projet</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/bootstrap.bundle.min.js"></script>

<%-- Code JavaScript pour afficher l'alerte --%>
<script>
    // Vérifier si le champ du nom a la classe d'erreur et afficher l'alerte correspondante
    if (document.getElementById("nomProjet").classList.contains("erreur")) {
        alert("Ce projet existe déjà. Veuillez choisir un nom unique.");
    }
</script>

</body>
</html>