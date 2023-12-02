<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

</head>
<body>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-info text-white text-center">
                    <h1>Consulter les Projets</h1>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Nom du Projet</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%-- Utilisation de la bibliothèque JSTL pour la boucle --%>
                        <c:forEach String="nom" items="${projetNoms}">
                            <tr>
                                <td>${projet.getNomProjet()}</td>
                                <td>
                                    <a href="modifierProjet.jsp?nomProjet=${nom}" class="btn btn-warning btn-sm">Modifier</a>
                                    <a href="supprimerProjet.jsp?nomProjet=${nom}" class="btn btn-danger btn-sm">Supprimer</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/bootstrap.bundle.min.js"></script>


	
</body>
</html>