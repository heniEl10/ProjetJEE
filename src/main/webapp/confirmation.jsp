<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-success text-white text-center">
                    <h1>Projet ajouté avec succès</h1>
                </div>
                <div class="card-body">
                    <div class="alert alert-success" role="alert">
                        Le projet <strong>${param.nomProjet}</strong> a été ajouté avec succès.
                    </div>
                    <p><a href="AcceuilDirecteur.jsp" class="btn btn-primary">Retour à l'accueil du directeur</a></p>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>