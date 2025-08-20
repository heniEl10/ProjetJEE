# 🏢 ProjetJEE - Système de Gestion de Projets

Un système complet de gestion de projets d'entreprise développé en Java Enterprise Edition (JEE) avec une architecture MVC moderne.

## 🚀 Fonctionnalités

- **🔐 Authentification sécurisée** avec gestion des rôles utilisateur
- **👥 Gestion des utilisateurs** (Admin, Directeur, Chef de Projet, Développeur)
- **📋 Gestion des projets** avec suivi complet du cycle de vie
- **👨‍💼 Gestion des équipes** et affectation des ressources
- **📊 Tableaux de bord** personnalisés selon le rôle
- **🗄️ Base de données MySQL** avec architecture robuste
- **🌐 Interface web moderne** avec JSP et CSS responsive

## 🛠️ Technologies Utilisées

- **Backend**: Java EE (Jakarta EE)
- **Base de données**: MySQL 8.0+
- **Serveur**: Apache Tomcat 10+
- **Frontend**: JSP, HTML5, CSS3, JavaScript
- **Architecture**: MVC (Model-View-Controller)
- **Build**: Maven (configuration recommandée)

## 📋 Prérequis

- **Java**: JDK 17 ou supérieur
- **Serveur d'application**: Apache Tomcat 10+
- **Base de données**: MySQL 8.0+
- **IDE**: Eclipse IDE for Enterprise Java Developers (recommandé)
- **Navigateur**: Chrome, Firefox, Safari, Edge

## 🚀 Installation et Configuration

### 1. Cloner le projet
```bash
git clone https://github.com/heniEl10/ProjetJEE.git
cd ProjetJEE
```

### 2. Configuration de la base de données
1. **Créer la base de données MySQL**:
```sql
CREATE DATABASE DB_Projet CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE DB_Projet;
```

2. **Exécuter le script SQL** (voir `database/init.sql`)

3. **Configurer la connexion** dans `database.properties`:
```properties
db.url=jdbc:mysql://localhost:3306/DB_Projet
db.user=votre_utilisateur
db.password=votre_mot_de_passe
```

### 3. Configuration du serveur Tomcat
1. **Déployer l'application** dans Tomcat
2. **Configurer le contexte** dans `conf/server.xml`
3. **Redémarrer Tomcat**

### 4. Accès à l'application
- **URL**: `http://localhost:8080/ProjetJEE`
- **Compte admin**: `admin` / `admin`

## 👥 Rôles Utilisateurs

### 🔑 Administrateur
- Gestion complète du système
- Gestion des utilisateurs
- Accès à tous les modules

### 👨‍💼 Directeur
- Vue d'ensemble des projets
- Gestion des chefs de projet
- Rapports et statistiques

### 👨‍💻 Chef de Projet
- Gestion des projets assignés
- Gestion de l'équipe
- Suivi des tâches

### 👨‍💻 Développeur
- Consultation des projets
- Mise à jour des tâches
- Profil personnel

## 📁 Structure du Projet

```
ProjetJEE/
├── src/
│   └── main/
│       ├── java/
│       │   ├── businessLayer/     # Logique métier
│       │   ├── controllers/       # Servlets (contrôleurs)
│       │   ├── dataLayer/         # Accès aux données
│       │   └── models/            # Modèles de données
│       └── webapp/
│           ├── WEB-INF/           # Configuration web
│           ├── css/               # Styles CSS
│           └── *.jsp              # Pages JSP
├── database.properties            # Configuration BDD
├── .classpath                    # Configuration Eclipse
├── .project                      # Configuration projet
└── README.md                     # Ce fichier
```

## 🔌 API Endpoints

### Authentification
- `POST /AuthentifServlet` - Connexion utilisateur
- `GET /AuthentifServlet` - Redirection vers login

### Gestion des Projets
- `POST /CreationServlet` - Création de projet
- `GET /DirecteurServlet` - Gestion directeur

## 🗄️ Base de Données

### Tables principales
- **Utilisateurs**: Gestion des comptes et rôles
- **Projets**: Informations des projets
- **Tâches**: Suivi des tâches par projet
- **Équipes**: Affectation des ressources

### Schéma de base
```sql
-- Exemple de création des tables
CREATE TABLE Utilisateurs (
    idUtilisateur BIGINT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'directeur', 'chef_projet', 'developpeur') NOT NULL
);

CREATE TABLE Projets (
    idProjet BIGINT PRIMARY KEY AUTO_INCREMENT,
    nomProjet VARCHAR(255) NOT NULL,
    description TEXT,
    client VARCHAR(255),
    dateDemarrage DATE,
    dateLivraison DATE,
    idChefProjet BIGINT,
    FOREIGN KEY (idChefProjet) REFERENCES Utilisateurs(idUtilisateur)
);
```

## 🚀 Déploiement

### Développement
1. **Importer dans Eclipse** comme projet Java EE
2. **Configurer Tomcat** dans Eclipse
3. **Démarrer en mode debug**

### Production
1. **Build du WAR**:
```bash
mvn clean package
```

2. **Déploiement sur Tomcat**:
```bash
cp target/ProjetJEE.war $TOMCAT_HOME/webapps/
```

3. **Configuration de la base de données**:
- Utiliser une base de données dédiée
- Configurer les permissions appropriées
- Activer les logs et monitoring

## 🧪 Tests

### Tests unitaires
```bash
# Exécuter les tests
mvn test

# Tests avec couverture
mvn jacoco:report
```

### Tests d'intégration
- Tests des servlets
- Tests de la couche données
- Tests de l'authentification

## 🔒 Sécurité

- **Authentification** par session JWT
- **Validation des entrées** utilisateur
- **Protection CSRF** activée
- **Gestion des rôles** et permissions
- **Logs de sécurité** complets

## 📊 Monitoring et Logs

- **Logs d'application** détaillés
- **Monitoring des performances** BDD
- **Alertes de sécurité** automatiques
- **Métriques d'utilisation** utilisateur

## 🐛 Dépannage

### Problèmes courants

1. **Erreur de connexion BDD**:
   - Vérifier les paramètres dans `database.properties`
   - Vérifier que MySQL est démarré
   - Vérifier les permissions utilisateur

2. **Erreur Tomcat**:
   - Vérifier la version Java (JDK 17+)
   - Vérifier la configuration Tomcat
   - Consulter les logs Tomcat

3. **Erreur de compilation**:
   - Vérifier la configuration Eclipse
   - Vérifier les dépendances Maven
   - Nettoyer et reconstruire le projet

## 🤝 Contribution

1. **Fork** le projet
2. **Créer** une branche feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** vos changements (`git commit -m 'Add AmazingFeature'`)
4. **Push** vers la branche (`git push origin feature/AmazingFeature`)
5. **Ouvrir** une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 📞 Support

- **Issues GitHub**: [ProjetJEE Issues](https://github.com/heniEl10/ProjetJEE/issues)
- **Documentation**: Consultez ce README et les commentaires du code
- **Contact**: Ouvrez une issue pour toute question

## 🔄 Mises à jour

### Version 1.0.0
- ✅ Authentification complète
- ✅ Gestion des projets
- ✅ Interface utilisateur responsive
- ✅ Architecture MVC robuste
- ✅ Base de données optimisée

---

**Développé avec ❤️ en Java Enterprise Edition**

*ProjetJEE - Simplifiez la gestion de vos projets d'entreprise*
