
import requests
import json
import psycopg2


hostname = "localhost"
database = "Assignment 2 SOEN 363"
username = "postgres"
pwd = "mac1"
port_id = 5432

conn = psycopg2.connect(
    host=hostname,  
    dbname=database,
    user=username,
    password=pwd,
    port=port_id
)
cur = conn.cursor()

while True:
    
    print("Select an option:")
    print("1. Create JSON")
    print("2. Exit")

   
    choice = input("Enter your choice: ")

   
    if choice == '1':
        
        #movie
        cur.execute("SELECT movie_id, title, description, rating, release_year, content_rating, watchmode_id, akas FROM movie")
        movie = cur.fetchall()
        # print(movie)
        
        # genre
        cur.execute("SELECT genre_id, genre FROM genre")
        genre = cur.fetchall()

        # movie_genre
        cur.execute("SELECT movie_id, genre_id FROM movie_genre")
        movie_genre = cur.fetchall()

        # language
        cur.execute("SELECT language_id, language_name, language_code FROM language")
        langauge = cur.fetchall()

        # movie_language
        cur.execute("SELECT movie_id, language_id FROM movie_language")
        movie_language = cur.fetchall()

        # country separate
        cur.execute("SELECT country_id, country_name, country_code FROM country")
        country = cur.fetchall()

        # movie_country separate
        cur.execute("SELECT movie_id, country_id FROM movie_country")
        movie_country = cur.fetchall()

        # actor separate
        cur.execute("SELECT actor_id, actor_name FROM actor")
        actor = cur.fetchall()

        # movie_actor separate
        cur.execute("SELECT movie_id, actor_id FROM movie_actor")
        movie_actor = cur.fetchall()

        #keyword separate
        cur.execute("SELECT keyword_id, keyword FROM keyword")
        keyword = cur.fetchall()
        # print(keyword)

        #movie_keyword separate
        cur.execute("SELECT movie_id, keyword_id FROM movie_keyword")
        movie_keyword = cur.fetchall()
        # print(movie_keyword)

        movie_dict = {}
        genre_dict = {}
        language_dict = {}
        actor_dict = {}
        
        country_dict = {}
        
        keyword_dict = {}
        




#movie_id, title, description, rating, release_year, content_rating, watchmode_id, akas
        for movie_single in movie:
            movie_id = movie_single[0]  
            title = movie_single[1]  
            description = movie_single[2]
            rating= movie_single[3]  
            release_year = movie_single[4]  
            content_rating= movie_single[5]  
            watchmode_id = movie_single[6]  
            akas = movie_single[7]  
       
            movie_dict[movie_id] = {
            "title": title,
            "description": description,
            "rating": rating,
            "release_year": release_year,
            "content_rating": content_rating,
            "watchmode_id": watchmode_id,
            "akas": akas,
            "genre": [] ,
            "language": [],

            "actor": [] ,
            "country": [],
            
            "keyword": [] 


            }

    #genre_id, genre
        for genre_single in genre:
            genre_id = genre_single[0]  
            genreName = genre_single[1]  
            genre_dict[genre_id] = genreName

    
        for movie_id, genre_id in movie_genre:
   
            genre_name = genre_dict.get(genre_id)
            
            movie_dict[movie_id]["genre"].append(genre_name)

    # lanaguage_id, langauge_name, langauge_code 
        for langauge_single in langauge:
            language_id = langauge_single[0]  
            language_name = langauge_single[1]
            language_code = langauge_single[2]   
            language_dict[language_id] = {
                    "language_name": language_name,
                    "language_code": language_code
                        }
            
    
        for movie_id, language_id in movie_language:
   
            language_name_code = language_dict.get(language_id)
           
            movie_dict[movie_id]["language"].append(language_name_code)


     #actor
        for actor_single in actor:
            actor_id = actor_single[0]  
            fullName = actor_single[1]  
              

            
            name = fullName.split()

            first_name = name[0]


            if len(name) > 1:
                last_name = " ".join(name[1:]) 
            else:
                last_name = ""  

            actor_dict[actor_id] = {
            "actor_id":actor_id,
            "first_name": first_name,
            "last_name": last_name
                        }
    

        for movie_id, actor_id in movie_actor:
   
            actor_id_fn_ls = actor_dict.get(actor_id)
           
            movie_dict[movie_id]["actor"].append(actor_id_fn_ls )
        




    #country
        for country_single in country:
            country_id = country_single[0]  
            country_name= country_single[1]  
            country_code= country_single[2] 

            
            
            country_dict[country_id] = {
            "country_id":country_id,
            "country_name": country_name,
            "country_code": country_code
                        }
    

        for movie_id, country_id in movie_country:
   
            country_id_name_code = country_dict.get(country_id)
           
            movie_dict[movie_id]["country"].append(country_id_name_code )
    

    #keyword
        for keyword_single in keyword:
            keyword_id = keyword_single[0]  
            keyword_name= keyword_single[1]  
            

            
            
            keyword_dict[keyword_id] = {
            "keyword_id":keyword_id,
            "keyword_name": keyword_name,
            
                        }
    

        for movie_id, keyword_id in movie_keyword:
   
            keyword_id_name = keyword_dict.get(keyword_id)
           
            movie_dict[movie_id]["keyword"].append(keyword_id_name )
        
        
        
        
        
        file = "movies.json"

        # Write the dictionary to a JSON file
        with open(file, "w", encoding="utf-8") as json_file:
            json.dump(movie_dict, json_file, indent=4, ensure_ascii=False)

        print(f"Data successfully written to {file}")   
    
    elif choice == '2':
        print("Exiting the program.")
        break  
    else:
        print("Invalid option.")












conn.commit()
cur.close()
conn.close()
