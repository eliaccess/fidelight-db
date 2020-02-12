/*Recreates the useful user_types*/
USE fidelight;

INSERT INTO user_type(id, name, description) VALUES
	(null, "Normal", "Utilisateur sans avantages de plus que les autres."),
	(null, "Jeune", "Utilisateur de moins de 25 ans."),
    (null, "Senior", "Utilisateur de plus de 65 ans.");