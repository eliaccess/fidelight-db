USE fidelight;

#Creation of some users

INSERT INTO user(id, surname, name, login, hash_pwd, salt, mail, registration_date, birthdate, user_type) VALUES
	(1,'Jean-Michel','Lagrue','jeanmichel','20be99eb704e104b9f972820cd4aec2b028e47bd88800d283bf29af747d4ec59546827a66b3c8d33339e4cf11b8a01f5ef6acbcb8e011a6fb3afac476897e691','a7bb0ec08fdebd2b0c0772185086e8','jm_256256@gmail.com','2020-03-02','1949-05-25',3),
	(2,'Elias','Limouni','elimouni','c6d83b81b3185925c37c4f9263684d873d0e3d9d88a9c989046a7426ae6407fe96ed646a438836c534d34bc7ab2be451dd62ba7645ac083b3b8047cb8ea7d310','107890c5da6c29c67263ef06e52775','elias.limouni@gmail.com','2020-03-02','1999-06-26',2),
	(3,'Noé','Morvillers','nmorvillers','8b7266fb30f56fdac6c408a4301c9d59cc74c48e9c98cd7ec974b3ad97b99ede7ececfd1e7f98978cd9337f96377545a655ac2cd98d27507535a780caa7dd211','fd3c5e7ac071fb819f6a6d0723a105','noemorvillers@gmail.com','2020-03-02','2001-10-21',2),
	(4,'Thomas',NULL,'totolacastagne75','d7b3a530b63c642e5c5f6d199a80465cfad05ce58055c9cd36646ad56b5163a2da0855170e3ca684105d75259e90a2606dc468990938960d692cd24373010ae9','9153083c6c4cc8444d092b37345775',NULL,'2020-03-02','1900-01-01',3);

#Adding paying methods for two ceos

INSERT INTO paying_method(id, user, iban, bic, card_number, card_expiration, card_crypto) VALUES
	(1, 2, NULL, NULL, '1111 2222 3333 4444', '12/20', 123),
    (2, 3, 'FR7630001007941234567890185', 'DAAEFRPPCCT', NULL, NULL, NULL);