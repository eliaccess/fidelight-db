USE fidelight;

#Creation of a complete company
INSERT INTO company VALUES (1, "otacos", "O'Tacos", "Les meilleurs Tacos de France ! Ouvert chaque jour de 11 heure à 23 heures !", 33, "695657481", "2020-05-08", "/img/otacos.png", "/img/otacos-logo.png", 2);

INSERT INTO company_location VALUES (1, 1, 33, "654987152", "La53.5179843°Lo97.7575979", 15, "Rue Saint Émilien", "Paris", "France");
INSERT INTO company_location VALUES (2, 1, 33, "669987152", "La41.9778543°Lo9.874979", 15, "Boulevard du Grossophobe", "Compiègne", "France");

INSERT INTO company_location_picture VALUES (null, 1, "/img/otacos-1-deventure.png");
INSERT INTO company_location_picture VALUES (null, 1, "/img/otacos-1-interieur.png");
INSERT INTO company_location_picture VALUES (null, 1, "/img/otacos-1-interieur2.png");
INSERT INTO company_location_picture VALUES (null, 2, "/img/otacos-2-deventure.png");
INSERT INTO company_location_picture VALUES (null, 2, "/img/otacos-2-tacos-fromage.png");

#Creation of a complete company
INSERT INTO company VALUES (2, "pharmacieclosdesroses", "Pharmacie du Clos des Roses", "Vente de médicaments, ouvert 24 heures sur 24h.", 33, "684975612", "2020-11-21", "/img/pharmacieclosdesroses.png", "/img/pharmacieclosdesroses-logo.png", 7);

INSERT INTO company_location VALUES (3, 2, 33, "654987152", "La41.9856743°Lo1.5698743", 42, "Place du Clos des Roses", "Compiègne", "France");

INSERT INTO company_location_picture VALUES (null, 3, "/img/pharmacieclosdesroses-deventure.png");
INSERT INTO company_location_picture VALUES (null, 3, "/img/pharmacieclosdesroses-interieur.png");

#Creation of a company with no location pictures
INSERT INTO company VALUES (3, "sunburger", "Sun Burger", "De bons tacos chauds, ouvert 24/7 !", 33, "658741236", "2020-06-18", "/img/sunburger.png", "/img/sunburger-logo.png", 2);

INSERT INTO company_location VALUES (4, 3, 33,"689745612", "La3.5179843°Lo65.7575789", 65, "Square de la Faim", "Paris", "France");
INSERT INTO company_location VALUES (5, 3, 33, "696532145", "La18.9852563°Lo17.874549", 18, "Boulevard de la Tuile", "Grenoble", "France");

#Creation of a company with no location
INSERT INTO company VALUES (4, "laboutiquedetiti", "La boutique de Titi", "Vente de tout et rien à la fois, 24h sur 24 et 7 jours sur 7 !", 33, "698784512", "2020-06-13", "/img/laboutiquedetiti.png", "/img/laboutiquedetiti-logo.png", 3);