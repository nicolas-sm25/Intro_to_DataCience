# Proyecto Base de Datos - Copa Mundial de Fútbol

## Descripción del Proyecto
Este proyecto implementa una base de datos relacional normalizada diseñada para gestionar la información histórica de la Copa Mundial de Fútbol. El esquema cumple con los requisitos académicos establecidos, abarcando 15 tablas interconectadas con sus respectivas claves primarias, claves foráneas y tipos de datos adecuados para garantizar la integridad referencial.

---

## Estructura del Esquema (15 Tablas)

El modelo relacional se compone de las siguientes tablas, ordenadas jerárquicamente:

1. **`region`**: Zonas geográficas y continentales globales.
2. **`confederations`**: Entidades rectoras del fútbol a nivel continental.
3. **`awards`**: Catálogo oficial de premios otorgados en los torneos.
4. **`position`**: Demarcaciones y posiciones de los jugadores en el terreno de juego.
5. **`tournament`**: Ediciones históricas de la Copa Mundial.
6. **`players`**: Información biográfica y deportiva de los futbolistas.
7. **`country`**: Países vinculados a sus respectivas regiones (FK: `region_id`).
8. **`city`**: Ciudades sede vinculadas a sus países (FK: `country_id`).
9. **`federation`**: Federaciones nacionales asociadas a países y confederaciones (FK: `confederation_id`, `country_id`).
10. **`stadiums`**: Estadios deportivos vinculados a sus ciudades (FK: `city_id`).
11. **`teams`**: Selecciones nacionales vinculadas a países, federaciones y confederaciones (FK: `country_id`, `federation_id`, `confederation_id`).
12. **`matches`**: Partidos disputados en cada torneo y estadio (FK: `tournament_id`).
13. **`goals`**: Registro detallado de anotaciones por partido y jugador (FK: `match_id`, `player_id`).
14. **`player_appearances`**: Participación y alineaciones de los jugadores en los encuentros (FK: `tournament_id`, `match_id`, `player_id`, `team_id`, `position_id`).
15. **`award_winners`**: Relación histórica de jugadores premiados por edición de torneo (FK: `tournament_id`, `award_id`, `player_id`, `team_id`).

---

## Instrucciones de Ejecución

1. Crear una base de datos en su gestor MySQL (por ejemplo, phpMyAdmin o terminal):
   ```sql
   CREATE DATABASE copa_mundial_db;
   USE copa_mundial_db;


## Repo GitHub

   https://github.com/nicolas-sm25/Intro_to_DataCience.git


## Autor

   Nicolás Soriano Medina
   20251020110