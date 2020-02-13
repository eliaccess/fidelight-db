/*Recreates the useful user_types*/
USE fidelight;

INSERT INTO company_type(id, name, description) VALUES
	(null, "Restauration traditionnelle", "Établissement proposant de la nourriture classique."),
	(null, "Fast-Food", "Établissement proposant un service de restauration rapide."),
    (null, "Épicerie", "Petit établissement proposant des produits de première nécessité."),
    (null, "Boulangerie", "Établissement produisant et vendant du pain."),
    (null, "Salon de coiffure", "Établissement proposant des services de coiffure."),
    (null, "Boucherie", "Établissement vendant de la viande et de la charcuterie."),
    (null, "Pharmacie", "Établissement vendant des médicaments."),
    (null, "Bar", "Établissement proposant des débits de boissons."),
    (null, "Hôtel", "Établissement des chambres à louer, pour une nuit ou plus."),
    (null, "Transports privés", "Services de transports privés (taxis etc.)."),
    (null, "Piscine", "Établissement proposant des services de natation.");