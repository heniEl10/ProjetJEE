<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ProjetJEE - Gestion de Projets</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .description {
            color: #666;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        .login-form {
            background: #f8f9fa;
            padding: 30px;
            border-radius: 8px;
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        .btn {
            background: #667eea;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #5a6fd8;
        }
        .error {
            color: #dc3545;
            margin-top: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏢 ProjetJEE</h1>
        <p class="description">
            Système de gestion de projets d'entreprise<br>
            Gérez vos projets, équipes et ressources efficacement
        </p>
        
        <div class="login-form">
            <h2>🔐 Connexion</h2>
            <form action="AuthentifServlet" method="post">
                <div class="form-group">
                    <label for="username">Nom d'utilisateur:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Mot de passe:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <button type="submit" class="btn">Se connecter</button>
                
                <% if (request.getParameter("error") != null) { %>
                    <div class="error">
                        Identifiants incorrects. Veuillez réessayer.
                    </div>
                <% } %>
            </form>
        </div>
        
        <div style="margin-top: 30px; color: #666; font-size: 14px;">
            <p>💡 <strong>Compte de test:</strong></p>
            <p>Utilisateur: <code>admin</code></p>
            <p>Mot de passe: <code>admin</code></p>
        </div>
    </div>
</body>
</html>
