-- =====================================================
-- Script d'initialisation de la base de données ProjetJEE
-- Base de données: DB_Projet
-- Version: 1.0.0
-- Date: 2025
-- =====================================================

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS DB_Projet 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE DB_Projet;

-- =====================================================
-- Table des utilisateurs
-- =====================================================
CREATE TABLE IF NOT EXISTS Utilisateurs (
    idUtilisateur BIGINT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'directeur', 'chef_projet', 'developpeur') NOT NULL DEFAULT 'developpeur',
    dateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actif BOOLEAN DEFAULT TRUE,
    INDEX idx_email (email),
    INDEX idx_role (role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- Table des projets
-- =====================================================
CREATE TABLE IF NOT EXISTS Projets (
    idProjet BIGINT PRIMARY KEY AUTO_INCREMENT,
    nomProjet VARCHAR(255) NOT NULL,
    description TEXT,
    client VARCHAR(255),
    dateDemarrage DATE,
    dateLivraison DATE,
    nbrJoursDevelop INT DEFAULT 0,
    idChefProjet BIGINT,
    statut ENUM('planifié', 'en_cours', 'en_revision', 'livré', 'annulé') DEFAULT 'planifié',
    priorite ENUM('basse', 'moyenne', 'haute', 'critique') DEFAULT 'moyenne',
    budget DECIMAL(15,2) DEFAULT 0.00,
    dateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dateModification TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idChefProjet) REFERENCES Utilisateurs(idUtilisateur) ON DELETE SET NULL,
    INDEX idx_statut (statut),
    INDEX idx_priorite (priorite),
    INDEX idx_date_demarrage (dateDemarrage)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- Table des tâches
-- =====================================================
CREATE TABLE IF NOT EXISTS Taches (
    idTache BIGINT PRIMARY KEY AUTO_INCREMENT,
    idProjet BIGINT NOT NULL,
    nomTache VARCHAR(255) NOT NULL,
    description TEXT,
    idDeveloppeur BIGINT,
    dateDebut DATE,
    dateFin DATE,
    dureeEstimee INT DEFAULT 0, -- en heures
    dureeReelle INT DEFAULT 0,  -- en heures
    statut ENUM('à_faire', 'en_cours', 'en_revision', 'terminée', 'annulée') DEFAULT 'à_faire',
    priorite ENUM('basse', 'moyenne', 'haute', 'critique') DEFAULT 'moyenne',
    dateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idProjet) REFERENCES Projets(idProjet) ON DELETE CASCADE,
    FOREIGN KEY (idDeveloppeur) REFERENCES Utilisateurs(idUtilisateur) ON DELETE SET NULL,
    INDEX idx_projet (idProjet),
    INDEX idx_developpeur (idDeveloppeur),
    INDEX idx_statut (statut)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- Table des équipes de projet
-- =====================================================
CREATE TABLE IF NOT EXISTS EquipesProjet (
    idEquipe BIGINT PRIMARY KEY AUTO_INCREMENT,
    idProjet BIGINT NOT NULL,
    idUtilisateur BIGINT NOT NULL,
    roleEquipe ENUM('chef_projet', 'developpeur', 'testeur', 'analyste', 'designer') NOT NULL,
    dateAffectation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dateFinAffectation DATE NULL,
    actif BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (idProjet) REFERENCES Projets(idProjet) ON DELETE CASCADE,
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(idUtilisateur) ON DELETE CASCADE,
    UNIQUE KEY unique_affectation (idProjet, idUtilisateur),
    INDEX idx_projet (idProjet),
    INDEX idx_utilisateur (idUtilisateur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- Table des commentaires
-- =====================================================
CREATE TABLE IF NOT EXISTS Commentaires (
    idCommentaire BIGINT PRIMARY KEY AUTO_INCREMENT,
    idProjet BIGINT NULL,
    idTache BIGINT NULL,
    idUtilisateur BIGINT NOT NULL,
    contenu TEXT NOT NULL,
    dateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idProjet) REFERENCES Projets(idProjet) ON DELETE CASCADE,
    FOREIGN KEY (idTache) REFERENCES Taches(idTache) ON DELETE CASCADE,
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(idUtilisateur) ON DELETE CASCADE,
    INDEX idx_projet (idProjet),
    INDEX idx_tache (idTache),
    INDEX idx_utilisateur (idUtilisateur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- Insertion des données de test
-- =====================================================

-- Utilisateurs de test
INSERT INTO Utilisateurs (nom, prenom, email, password, role) VALUES
('Admin', 'Système', 'admin@projetjee.com', 'admin', 'admin'),
('Dupont', 'Jean', 'directeur@projetjee.com', 'directeur123', 'directeur'),
('Martin', 'Sophie', 'chef@projetjee.com', 'chef123', 'chef_projet'),
('Bernard', 'Pierre', 'dev@projetjee.com', 'dev123', 'developpeur'),
('Dubois', 'Marie', 'marie@projetjee.com', 'dev123', 'developpeur'),
('Leroy', 'Thomas', 'thomas@projetjee.com', 'dev123', 'developpeur');

-- Projets de test
INSERT INTO Projets (nomProjet, description, client, dateDemarrage, dateLivraison, nbrJoursDevelop, idChefProjet, statut, priorite, budget) VALUES
('Site E-commerce', 'Développement d\'un site e-commerce complet avec panier et paiement', 'TechCorp', '2025-01-15', '2025-06-30', 120, 3, 'en_cours', 'haute', 50000.00),
('Application Mobile', 'Application mobile de gestion des tâches', 'StartupXYZ', '2025-02-01', '2025-08-15', 150, 3, 'planifié', 'moyenne', 35000.00),
('Système CRM', 'Système de gestion de la relation client', 'Enterprise Ltd', '2025-01-01', '2025-12-31', 300, 3, 'en_cours', 'critique', 100000.00);

-- Tâches de test
INSERT INTO Taches (idProjet, nomTache, description, idDeveloppeur, dateDebut, dateFin, dureeEstimee, statut, priorite) VALUES
(1, 'Design UI/UX', 'Création des maquettes et du design', 4, '2025-01-15', '2025-02-15', 80, 'terminée', 'haute'),
(1, 'Développement Frontend', 'Développement de l\'interface utilisateur', 4, '2025-02-16', '2025-04-30', 120, 'en_cours', 'haute'),
(1, 'Développement Backend', 'Développement de l\'API et de la logique métier', 5, '2025-02-01', '2025-05-15', 150, 'en_cours', 'haute'),
(1, 'Tests et déploiement', 'Tests d\'intégration et déploiement', 6, '2025-05-16', '2025-06-30', 60, 'à_faire', 'moyenne');

-- Équipes de projet
INSERT INTO EquipesProjet (idProjet, idUtilisateur, roleEquipe) VALUES
(1, 3, 'chef_projet'),
(1, 4, 'developpeur'),
(1, 5, 'developpeur'),
(1, 6, 'testeur'),
(2, 3, 'chef_projet'),
(2, 4, 'developpeur'),
(3, 3, 'chef_projet'),
(3, 5, 'developpeur'),
(3, 6, 'developpeur');

-- Commentaires de test
INSERT INTO Commentaires (idProjet, idUtilisateur, contenu) VALUES
(1, 3, 'Projet démarré avec succès. L\'équipe est motivée !'),
(1, 4, 'Design terminé et approuvé par le client.'),
(1, 5, 'Backend en cours de développement. API REST en place.');

-- =====================================================
-- Création des vues utiles
-- =====================================================

-- Vue des projets avec informations du chef de projet
CREATE OR REPLACE VIEW VueProjets AS
SELECT 
    p.*,
    CONCAT(u.nom, ' ', u.prenom) AS nomChefProjet,
    u.email AS emailChefProjet,
    COUNT(t.idTache) AS nombreTaches,
    COUNT(CASE WHEN t.statut = 'terminée' THEN 1 END) AS tachesTerminees
FROM Projets p
LEFT JOIN Utilisateurs u ON p.idChefProjet = u.idUtilisateur
LEFT JOIN Taches t ON p.idProjet = t.idProjet
GROUP BY p.idProjet;

-- Vue des utilisateurs avec leurs projets
CREATE OR REPLACE VIEW VueUtilisateursProjets AS
SELECT 
    u.*,
    COUNT(DISTINCT ep.idProjet) AS nombreProjets,
    GROUP_CONCAT(DISTINCT p.nomProjet SEPARATOR ', ') AS projets
FROM Utilisateurs u
LEFT JOIN EquipesProjet ep ON u.idUtilisateur = ep.idUtilisateur
LEFT JOIN Projets p ON ep.idProjet = p.idProjet
WHERE ep.actif = TRUE
GROUP BY u.idUtilisateur;

-- =====================================================
-- Procédures stockées utiles
-- =====================================================

DELIMITER //

-- Procédure pour calculer l'avancement d'un projet
CREATE PROCEDURE CalculerAvancementProjet(IN projetId BIGINT)
BEGIN
    DECLARE totalTaches INT;
    DECLARE tachesTerminees INT;
    DECLARE avancement DECIMAL(5,2);
    
    SELECT 
        COUNT(*) INTO totalTaches
    FROM Taches 
    WHERE idProjet = projetId;
    
    SELECT 
        COUNT(*) INTO tachesTerminees
    FROM Taches 
    WHERE idProjet = projetId AND statut = 'terminée';
    
    IF totalTaches > 0 THEN
        SET avancement = (tachesTerminees / totalTaches) * 100;
    ELSE
        SET avancement = 0;
    END IF;
    
    SELECT 
        p.nomProjet,
        totalTaches,
        tachesTerminees,
        avancement AS pourcentage_avancement
    FROM Projets p
    WHERE p.idProjet = projetId;
END //

-- Procédure pour obtenir les projets d'un utilisateur
CREATE PROCEDURE ObtenirProjetsUtilisateur(IN userId BIGINT)
BEGIN
    SELECT 
        p.*,
        ep.roleEquipe,
        ep.dateAffectation
    FROM Projets p
    INNER JOIN EquipesProjet ep ON p.idProjet = ep.idProjet
    WHERE ep.idUtilisateur = userId AND ep.actif = TRUE
    ORDER BY p.dateDemarrage DESC;
END //

DELIMITER ;

-- =====================================================
-- Droits d'accès (à adapter selon votre configuration)
-- =====================================================

-- Créer un utilisateur dédié pour l'application (optionnel)
-- CREATE USER 'projetjee_user'@'localhost' IDENTIFIED BY 'votre_mot_de_passe_securise';
-- GRANT SELECT, INSERT, UPDATE, DELETE ON DB_Projet.* TO 'projetjee_user'@'localhost';
-- FLUSH PRIVILEGES;

-- =====================================================
-- Fin du script d'initialisation
-- =====================================================

SELECT 'Base de données ProjetJEE initialisée avec succès !' AS message;
SELECT COUNT(*) AS nombre_utilisateurs FROM Utilisateurs;
SELECT COUNT(*) AS nombre_projets FROM Projets;
SELECT COUNT(*) AS nombre_taches FROM Taches;
