<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Acceuil Directeur</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-info text-white text-center">
                    <h1>Bienvenue, Directeur!</h1>
                </div>
                <div class="card-body">
                    <form action="DirecteurServlet" method="post">
                           <div class="form-check">
                            <input class="form-check-input" type="radio" name="choix" id="nouveau" value="nouveau" required>
                            <label class="form-check-label" for="nouveau">
                                Créer un nouveau projet
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="choix" id="consulter" value="consulter" required>
                            <label class="form-check-label" for="consulter">
                                Consulter un projet existant
                            </label>
                        </div>
                        <div class="text-center mt-3">
                            <button type="submit" class="btn btn-primary">Confirmer</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>