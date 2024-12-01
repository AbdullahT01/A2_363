
#eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Ii4rQC4rIiwibWl4cGFuZWxJZCI6IiRkZXZpY2U6MTkzNjY3MDI5MTI0NTEtMDM1OGNlYjI0ZWI4OTItMWU1MjU2MzYtMWNlMjZhLTE5MzY2NzAyOTEzNDUxIiwibWl4cGFuZWxQcm9qZWN0SWQiOiI0YmZiMjQxNGFiOTczYzc0MWI2ZjA2N2JmMDZkNTU3NSIsIm9yZyI6Ii4qIiwicHViIjoibmVvNGouY29tIiwicmVnIjoiICIsInN1YiI6Im5lbzRqLWRlc2t0b3AiLCJleHAiOjE3NjQyNTg5NTksInZlciI6IioiLCJpc3MiOiJuZW80ai5jb20iLCJuYmYiOjE3MzI3MjI5NTksImlhdCI6MTczMjcyMjk1OSwianRpIjoiN2VZdV9qQUVUIn0.dFxiDGFgjQEff3rc57ysvHrVT-FEVUUuyfRvDpqtKeIKEEDYqumpEurYEtFu24_aGG7ut7ujj7qrQCkE7eURJdBb6W4qSzZt6MW0jnj-mk-JEECgcVCSoqzyPKHpFnZ5vqJJFOL9-WQIInWiFp6zzptvF36WanDrteOAOhiGqYLKiRpp5nNQkFgNvqqCTDSOFa-waoNHn59ymxtu-WkkPFqIWFQpriDUIbGodrhedCmDz-jsirPm8UsEiJ9sy2W6TheQq1dbvO7zYiHxthVg_-3GYodKrCtHuWHIy60Hdgrk3gvDc3WD8J-fV1x8Rzfbq5eC2_hQAC7u1cc0Lz4RnA
from neo4j import GraphDatabase
import json
# -- select title, genre from movie m, genre g, movie_genre mg
# -- where m.movie_id = mg.movie_id and  mg.genre_id = g.genre_id 

# select * from country;
# to look: MATCH (n) RETURN n
# a)
# MATCH (a:Actor)-[:ACTOR_MOVIE]->(m:Movie)
# WHERE a.first_name ='Morgan' AND a.last_name = 'Freeman'
# RETURN m.title AS MovieTitle, m.release_year AS ReleaseYear, a.first_name AS firstname, a.last_name AS lastname

#b) 
# MATCH (m:Movie)
# RETURN 
#     COUNT(CASE WHEN m.watchmode_id IS NOT NULL THEN 1 END) AS with_watchmode,
#     COUNT(CASE WHEN m.watchmode_id IS NULL THEN 1 END) AS without_watchmode

#c) Note in our db there does not exist a movie above 5 release in 2023
# MATCH (m:Movie)
# WHERE m.release_year > 2023 AND m.rating >= 5
# RETURN m.title AS MovieTitle, m.release_year AS Release_Year, m.rating AS Rating
#
# MATCH (m:Movie)-[:MOVIE_COUNTRY]->(c:Country)
# WHERE c.country_name = "Germany" OR c.country_name = "United States of America"
# RETURN m
#


URI = "bolt://localhost:7687"  
USERNAME = "neo4j"             
PASSWORD = "mac88soen363"     

drive = GraphDatabase.driver(URI, auth=(USERNAME, PASSWORD))

with drive.session() as session:
    result = session.run("RETURN 'Connection works'").single()[0]
    print(result)

while True:
    

    print("Assignment 3 SOEN 363")
    print("Abdullah Taha - Alessandro Tiseo")
    print("Select an option:")

    print("1. Populate DB")
    print("2. Reset")
    print("3. Exit")

   
    choice = input("Enter your choice: ")

   
    if choice == '1':
        print("it works ")
        with open("movies.json", "r", encoding="utf-8") as file:
            data = json.load(file)


        with drive.session() as session:
    
            for movie_id, movie in data.items():
                #movie

                title = movie["title"].replace("'", "\\'") 
                description = movie["description"].replace("'", "\\'")
                rating = movie["rating"]
                release_year = movie["release_year"]
                content_rating = movie["content_rating"]
                watchmode_id = movie["watchmode_id"]
                akas = ", ".join(movie["akas"]).replace("'", "\\'")
                genres = ", ".join(movie["genre"]).replace("'", "\\'")
                languages = ""
                for language in movie["language"]:
                    language_str = f"{language['language_name']} ({language['language_code']})"
                    if languages:  
                        languages += ", "
                    languages += language_str
                
       
                query = f"""
                        CREATE (m:Movie {{
                        title: '{title}',
                        description: '{description}',
                        rating: {rating},
                        release_year: {release_year},
                        content_rating: '{content_rating}',
                        watchmode_id: '{watchmode_id}',
                        akas: '{akas}',
                        genres: '{genres}',
                        languages: '{languages}'
                        }})
                        """
        
      
                session.run(query)

            # actor
                for actor in movie["actor"]:
                    actor_first_name = actor["first_name"]
                    actor_last_name = actor["last_name"]
                    actor_id = actor["actor_id"]

    
                    session.run(
                    "MERGE (a:Actor {actor_id: $actor_id}) "
                    "ON CREATE SET a.first_name = $first_name, a.last_name = $last_name",
                    actor_id=actor_id, first_name=actor_first_name, last_name=actor_last_name
                    )
    
                    session.run(
                    "MATCH (m:Movie {title: $title}), (a:Actor {actor_id: $actor_id}) "
                    "MERGE (m)-[:MOVIE_ACTOR]->(a) "
                    "MERGE (a)-[:ACTOR_MOVIE]->(m)",
                    title=title, actor_id=actor_id
                    )

            #countries
            # "country_id"
            #     "country_name"
            #     "country_code"
                for country in movie["country"]:
                    country_code = country["country_code"]
                    country_name = country["country_name"]
                    country_id = country["country_id"]

    
                    session.run(
                    "MERGE (c:Country {country_id: $country_id}) "
                    "ON CREATE SET c.country_name  = $country_name , c.country_code = $country_code",
                    country_id =country_id , country_name=country_name, country_code=country_code
                    )
    
                    session.run(
                    "MATCH (m:Movie {title: $title}), (c:Country{country_id: $country_id}) "
                    "MERGE (m)-[:MOVIE_COUNTRY]->(c) "
                    "MERGE (c)-[:COUNTRY_MOVIE]->(m)",
                    title=title, country_id=country_id
                    )

            #keyword 
            # 
            # "keyword_id": 1,
            # "keyword_name": "prison"
            # 

                for keyword in movie["keyword"]:
                    keyword_word = keyword["keyword_name"]
                    keyword_id = keyword["keyword_id"]

    
                    session.run(
                    "MERGE (k:Keyword {keyword_id: $keyword_id}) "
                    "ON CREATE SET k.keyword  = $keyword_word  ",
                    keyword_id =keyword_id, keyword_word=keyword_word
                    )
    
                    session.run(
                    "MATCH (m:Movie {title: $title}), (k:Keyword{keyword_id: $keyword_id}) "
                    "MERGE (m)-[:MOVIE_KEYWORD]->(k) "
                    "MERGE (k)-[:KEYWORD_MOVIE]->(m)",
                    title=title, keyword_id=keyword_id
                    )

                print(f"Created Movie Node: {title}")

    elif choice == '2':
        print("Reset.")
        drive.session().run("MATCH (n) DETACH DELETE n")
        
    elif choice == '3':
        print("Exiting the program.")
        break  

    else:
        print("Invalid option.")






drive.close()