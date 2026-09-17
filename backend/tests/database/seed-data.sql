INSERT INTO public.artists(
	artist_name, styles, influences, artist_albums)
	VALUES 
	  ('Black Sabbath', ARRAY['Heavy Metal', 'Rock'], ARRAY['Cream', 'The Beatles', 'Fleetwood Mac'], ARRAY[1, 2]),
      ('Metallica', ARRAY['Heavy Metal', 'Rock'], ARRAY['Diamond Head', 'Iron Maiden', 'Black Sabbath'], ARRAY[1, 2]),
	  ('Judas Priest', ARRAY['Heavy Metal', 'Rock'], ARRAY['Led Zeppelin', 'Deep Purple', 'Black Sabbath'], ARRAY[1, 2]);