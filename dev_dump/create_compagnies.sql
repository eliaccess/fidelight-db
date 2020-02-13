USE fidelight;

#Creation of a company
INSERT INTO company VALUES (1, "otacos", "O'Tacos", "Les meilleurs Tacos de France ! Ouvert chaque jour de 11 heure à 23 heures !", "695657481", 33, "2020-05-08", "/img/otacos.png", 2);

INSERT INTO company_location VALUES (1, 1, "654987152", 33, "La53.5179843°Lo97.7575979", 15, "Rue Saint Émilien", "Paris", "France");
INSERT INTO company_location VALUES (2, 1, "669987152", 33, "La41.9778543°Lo9.874979", 15, "Boulevard du Grossophobe", "Compiègne", "France");

INSERT INTO company_location_picture VALUES (null, 1, "/img/otacos-1-deventure.png");
INSERT INTO company_location_picture VALUES (null, 1, "/img/otacos-1-interieur.png");
INSERT INTO company_location_picture VALUES (null, 1, "/img/otacos-1-interieur2.png");
INSERT INTO company_location_picture VALUES (null, 2, "/img/otacos-2-deventure.png");
INSERT INTO company_location_picture VALUES (null, 2, "/img/otacos-2-tacos-fromage.png");

#Creation of a company
INSERT INTO company VALUES (2, "pharmacieclosdesroses", "Pharmacie du Clos des Roses", "Vente de médicaments, ouvert 24 heures sur 24h.", "684975612", 33, "2020-11-21", "/img/pharmacieclosdesroses.png", 7);

INSERT INTO company_location VALUES (3, 2, "654987152", 33, "La41.9856743°Lo1.5698743", 42, "Place du Clos des Roses", "Compiègne", "France");

INSERT INTO company_location_picture VALUES (null, 3, "/img/pharmacieclosdesroses-deventure.png");
INSERT INTO company_location_picture VALUES (null, 3, "/img/pharmacieclosdesroses-interieur.png");

SELECT * FROM company;