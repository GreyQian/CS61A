.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = 'blue' and pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = 'blue' and pet = 'dog';


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students GROUP BY smallest HAVING COUNT(smallest) = 1;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students AS a, students AS b WHERE a.time < b.time AND a.pet = b.pet AND a.song = b.song;


CREATE TABLE sevens AS
  SELECT seven From students AS a, numbers AS b
  WHERE a.time = b.time AND a.number = 7 AND b."7" = "True";


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) as average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT  store,item, MIN(price) FROM inventory GROUP BY item;


CREATE TABLE shopping_list AS
  SELECT item, store FROM lowest_prices AS i, products AS p WHERE i.item = p.name
  GROUP BY p.category HAVING MIN(p.MSRP / p.rating);


CREATE TABLE total_bandwidth AS
  SELECT SUM(a.Mbs) FROM stores AS a, shopping_list AS b WHERE a.store = b.store;

