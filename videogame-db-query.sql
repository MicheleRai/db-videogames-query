-- join

-- 1- Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
select [name], lastname, nickname, city, COUNT(players.id) as n_recensioni
from players
join reviews
on players.id = reviews.player_id
group by players.[name], players.lastname, players.nickname, players.city

-- 2- Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226) ??????
select videogames.id,videogames.[name],tournaments.[name], COUNT(videogames.id) as n_volte
from tournaments
join tournament_videogame
on tournaments.id = tournament_videogame.tournament_id
join videogames
on videogames.id = tournament_videogame.videogame_id
where tournaments.year = 2016
group by videogames.id, videogames.[name],tournaments.[name]

-- 3- Mostrare le categorie di ogni videogioco (1718)
select videogames.[name], categories.[name]
from videogames
join category_videogame
on videogames.id = category_videogame.videogame_id
join categories
on category_videogame.category_id = categories.id

-- 4- Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)
select distinct software_houses.[name]
from software_houses
join videogames
on software_houses.id = videogames.software_house_id
where year(videogames.release_date) > 2020

-- 5- Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)
select awards.[name],software_houses.[name]
from software_houses
join videogames
on software_houses.id = videogames.software_house_id
join award_videogame
on videogames.id = award_videogame.videogame_id
join awards
on award_videogame.award_id = awards.id

-- 6- Selezionare categorie e classificazioni PEGI dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)
select categories.[name],pegi_labels.[name],videogames.[name]
from videogames
join category_videogame
on videogames.id = category_videogame.videogame_id
join categories
on category_videogame.category_id = categories.id
join pegi_label_videogame
on videogames.id = pegi_label_videogame.videogame_id
join pegi_labels
on pegi_label_videogame.pegi_label_id = pegi_labels.id
join reviews
on videogames.id = reviews.videogame_id
where reviews.rating > 3
group by categories.[name],pegi_labels.[name],videogames.[name]

-- 7- Selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 'S' (474)
select distinct videogames.id, videogames.name
from videogames
join tournament_videogame 
on videogames.id = tournament_videogame.videogame_id
join tournaments 
on tournament_videogame.tournament_id = tournaments.id
join player_tournament 
on tournaments.id = player_tournament.tournament_id
join players 
on player_tournament.player_id = players.id
where players.name LIKE 'S%'

-- 8- Selezionare le città in cui è stato giocato il gioco dell'anno del 2018 (36)
select distinct tournaments.city
from tournaments
join tournament_videogame 
on tournaments.id = tournament_videogame.tournament_id
join videogames 
on tournament_videogame.videogame_id = videogames.id
join award_videogame 
on videogames.id = award_videogame.videogame_id
where award_videogame.year = '2018'

-- 9- Selezionare i giocatori che hanno giocato al gioco più atteso del 2018 in un torneo del 2019 (3306)
select distinct players.nickname, tournaments.id
from players
join player_tournament 
on players.id = player_tournament.player_id
join tournaments 
on player_tournament.tournament_id = tournaments.id
join tournament_videogame 
on tournaments.id = tournament_videogame.tournament_id
join videogames 
on tournament_videogame.videogame_id = videogames.id
join award_videogame 
on videogames.id = award_videogame.videogame_id
where tournaments.year = '2019'
and award_videogame.year = '2018'