INSERT INTO public.artists(
	artist_name, styles, influences, artist_albums)
	VALUES 
	  ('Black Sabbath', ARRAY['Heavy Metal', 'Rock'], ARRAY['Cream', 'The Beatles', 'Fleetwood Mac'], ARRAY[1, 2]),
      ('Metallica', ARRAY['Heavy Metal', 'Rock'], ARRAY['Diamond Head', 'Iron Maiden', 'Black Sabbath'], ARRAY[1, 2]),
	  ('Judas Priest', ARRAY['Heavy Metal', 'Rock'], ARRAY['Led Zeppelin', 'Deep Purple', 'Black Sabbath'], ARRAY[1, 2]);

INSERT INTO public.albums(
  album_name, release_date, artist_id, members, label_id)
  VALUES
    ('Black Sabbath', '1970-02-13', 1, ARRAY['Ozzy Osbourne', 'Tony Iommi', 'Geezer Butler', 'Bill Ward'], ARRAY[1, 2]),
	('Paranoid', '1970-09-18', 1, ARRAY['Ozzy Osbourne', 'Tony Iommi', 'Geezer Butler', 'Bill Ward'], ARRAY[1, 2]),
	('Kill ''Em All', '1983-07-25', 2, ARRAY['James Hetfield', 'Lars Ulrich', 'Cliff Burton', 'Kirk Hammett'], ARRAY[3]),
	('Ride the Lightning', '1984-07-27', 2, ARRAY['James Hetfield', 'Lars Ulrich', 'Cliff Burton', 'Kirk Hammett'], ARRAY[3]),
	('Rocka Rolla', '1974-09-06', 3, ARRAY['Rob Halford', 'Glenn Tipton', 'K. K. Downing', 'Ian Hill', 'John Hinch', 'Alan Moore'], ARRAY[4]),
	('Sad Wings of Destiny', '1976-03-26', 3, ARRAY['Rob Halford', 'Glenn Tipton', 'K. K. Downing', 'Ian Hill', 'Alan Moore'], ARRAY[4]);

INSERT INTO public.labels(
  label_name, year_founded, is_active, year_ended, origin, founders, current_artists, past_artists, label_albums)
  VALUES
  ('Vertigo Records', 1969, true, null, 'UK', ARRAY['Olav Wyper'], null, null, ARRAY[1, 2]),
  ('Warner Records', 1958, true, null, 'Los Angeles, CA, US', ARRAY['Warner Bros.'], null, null, ARRAY[1, 2]),
  ('Megaforce Records', 1982, true, null, 'New York, NY, US', ARRAY['Jon Zazula', 'Marsha Zazula'], null, null, ARRAY[3, 4]),
  ('Gull', 1974, false, 1984, 'UK', ARRAY['Gull Entertainments Ltd.'], null, null, ARRAY[5, 6]);

INSERT INTO public.members(
  first_name, middle_name, last_name, suffix, known_as, date_of_birth, date_of_death, age, origin, projects, influences, roles)
  VALUES
  ('John', 'Michael', 'Osbourne', null, 'Ozzy Osbourne', '1948-12-03', '2025-07-22', 76, 'Aston, Birmingham, West Midlands, England', ARRAY['Black Sabbath', 'Ozzy Osbourne'], ARRAY['the Beatles', 'John Lennon', 'David Bowie'], ARRAY['vocals', 'harmonica']),
  ('Anthony', 'Frank', 'Iommi', 'Jr.', 'Tony Iommi', '1948-02-29', null, 78, 'Handsworth, Birmingham, West Midlands, England', ARRAY['Black Sabath', 'Heaven and Hell', 'Tony Iommi'], ARRAY['Hank Marvin', 'Chuck Berry', 'Buddy Holly', 'Eric Clapton'], ARRAY['guitars']),
  ('William', 'Thomas', 'Ward', null, 'Bill Ward', '1948-05-05', null, 78, 'Aston, Birmingham, West Midlands, England', ARRAY['Black Sabbath', 'Tony Iommi', 'Bill Ward', 'Bill Ward Band', 'Day of Errors', 'Mesmerist'], ARRAY['Gene Krupa', 'Buddy Rich', 'Louie Bellson'], ARRAY['drums', 'vocals']),
  ('Terrence', 'Michael Joseph', 'Butler', null, 'Geezer Butler', '1949-07-17', null, 77, 'Aston, Birmingham, West Midlands, England', ARRAY['Black Sabath', 'GZR', 'Ozzy Osbourne', 'Heaven and Hell'], ARRAY['Jack Bruce', 'Aleister Ceowley'], ARRAY['bass'])