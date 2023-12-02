<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
                    <form action="CreationServlet" method="post">
                        <div class="form-group">
                            <label for="nomProjet">Nom du Projet</label>
                            <input type="text" class="form-control" id="nomProjet" name="nomProjet" required>
                        </div>
                        <div class="form-group">
                            <label for="descriptionProjet">Description du Projet</label>
                            <textarea class="form-control" id="descriptionProjet" name="descriptionProjet" rows="3" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="clientProjet">Client du Projet</label>
                            <input type="text" class="form-control" id="clientProjet" name="clientProjet" required>
                        </div>
                        <div class="form-group">
                            <label for="dateDebut">Date de Démarrage</label>
                            <input type="text" class="form-control" id="datepickerDebut" name="dateDebut" required>
                        </div>
                        <div class="form-group">
                            <label for="dateLivraison">Date de Livraison</label>
                            <input type="text" class="form-control" id="datepickerLivraison" name="dateLivraison" required>
                        </div>
                        <div class="form-group">
                            <label for="joursDeveloppement">Nombre de Jours de Développement</label>
                            <input type="number" class="form-control" id="joursDeveloppement" name="joursDeveloppement" readonly>
                        </div>
                        <div class="form-group">
                            <label for="chefProjet">Chef de Projet</label>
                            <select class="form-control" id="chefProjet" name="chefProjet" required>
                            	<option></option>
                                <option value="chef1">Chef de Projet 1</option>
                                <option value="chef2">Chef de Projet 2</option>
                            </select>
                        </div>
                        <br><br>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Enregistrer le Projet</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function() {
    $("#datepickerDebut").datepicker();
    $("#datepickerLivraison").datepicker();

    $("#datepickerLivraison").on("change", function () {
        var dateDebut = $("#datepickerDebut").datepicker("getDate");
        var dateLivraison = $("#datepickerLivraison").datepicker("getDate");


        if (dateDebut && dateLivraison) {
            var differenceEnJours = Math.ceil((dateLivraison - dateDebut) / (1000 * 60 * 60 * 24));

            if (differenceEnJours >= 0) {
                $("#joursDeveloppement").val(differenceEnJours);
            } else {
                alert("La date de livraison doit être postérieure à la date de début.");
                $("#datepickerLivraison").val(""); 
                $("#joursDeveloppement").val(""); 
            }
        }
    });

    // Sélectionner la date d'aujourd'hui pour le champ de date de démarrage
    var today = new Date();
    $("#datepickerDebut").datepicker("setDate", today);
});
</script>


</body>
</html>