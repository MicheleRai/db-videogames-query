-- join

-- 1- Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
select [name], lastname, nickname, city, COUNT(players.id) as n_recensioni
from players
join reviews
on players.id = reviews.player_id
group by players.[name], players.lastname, players.nickname, players.city
-- 2- Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)
select 
-- 3- Mostrare le categorie di ogni videogioco (1718)

-- 4- Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)

-- 5- Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)

-- 6- Selezionare categorie e classificazioni PEGI dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)

-- 7- Selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 'S' (474)

-- 8- Selezionare le città in cui è stato giocato il gioco dell'anno del 2018 (36)

-- 9- Selezionare i giocatori che hanno giocato al gioco più atteso del 2018 in un torneo del 2019 (3306)