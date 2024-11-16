import requests
import json
import psycopg2

# def insert(title,description,rating ,release_year ,imdb_id ,actors ,director ,content_rating ,runtime ,keywords ,tmdb_id ,aka ,production_countries ,spoken_languages ,genres ):
#     conn.commit()


hostname = "localhost"
database = "Assignment 2 SOEN 363"
username = "postgres"
pwd = "mac1"
port_id = 5432

conn = psycopg2.connect(
    host=hostname,  # Corrected: added commas
    dbname=database,
    user=username,
    password=pwd,
    port=port_id
)
cur = conn.cursor()

# Create a new table
cur.execute("""
CREATE TABLE IF NOT EXISTS movie (
    movie_id SERIAL PRIMARY KEY ,
    title TEXT NOT NULL,
    description TEXT,
    rating REAL CHECK(  rating >=0 AND rating <=10 ),
    release_year INTEGER,
    imdb_id TEXT UNIQUE,
    tmdb_id TEXT UNIQUE NOT NULL,
    content_rating TEXT NOT NULL,
    watchmode_id TEXT UNIQUE,
    AKAs TEXT[],
    runtime TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS genre (
    genre_id SERIAL PRIMARY KEY ,
    genre TEXT UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS movie_genre (
    movie_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (movie_id , genre_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);
CREATE TABLE IF NOT EXISTS country (
    country_id SERIAL PRIMARY KEY ,
    country_name TEXT UNIQUE NOT NULL,
    country_code TEXT UNIQUE NOT NULL CHECK(LENGTH(country_code)=2)
);
CREATE TABLE IF NOT EXISTS movie_country (
    movie_id INTEGER,
    country_id INTEGER,
    PRIMARY KEY (movie_id , country_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
            
CREATE TABLE IF NOT EXISTS keyword (
    keyword_id SERIAL PRIMARY KEY,
    keyword TEXT UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS movie_keyword (
    movie_id INTEGER,
    keyword_id INTEGER,
    PRIMARY KEY (movie_id , keyword_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(keyword_id)
);
CREATE TABLE IF NOT EXISTS actor (
    actor_id SERIAL PRIMARY KEY ,
    actor_name TEXT UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS movie_actor (
    movie_id INTEGER,
    actor_id INTEGER,
    PRIMARY KEY (movie_id , actor_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);
CREATE TABLE IF NOT EXISTS director (
    director_id SERIAL PRIMARY KEY,
    director_name TEXT UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS movie_director (
    movie_id INTEGER,
    director_id INTEGER,
    PRIMARY KEY (movie_id , director_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (director_id) REFERENCES director(director_id)
);
            
CREATE TABLE IF NOT EXISTS language (
    language_id SERIAL PRIMARY KEY ,
    language_name TEXT UNIQUE NOT NULL,
    language_code TEXT UNIQUE NOT NULL CHECK(LENGTH(language_code)=2)
);
CREATE TABLE IF NOT EXISTS movie_language (
    movie_id INTEGER,
    language_id INTEGER,
    PRIMARY KEY (movie_id , language_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (language_id) REFERENCES language(language_id)
);

""")
conn.commit()

api_keyOMDb  = "193f21c7"  # Replace with your actual OMDb API key
api_keytmdb = "db70b73908eae1aff117991c8ef4bff2"

#, "tt0111161", "tt0108052", "tt0081398", "tt0144084" 
# 50 ids for both
imdb_idsList = [
    "tt0068646", "tt0111161", "tt0108052", "tt0081398", "tt0144084" 
    
]
#, "278", "424", "1578", "1359" 
# TMDb movie IDs
tmdb_idsList = [
    "238", "278", "424", "1578", "1359" 
    
]
# Ensure that both lists have the same length
if len(imdb_idsList) != len(tmdb_idsList):
    print(len(imdb_idsList))
    print(len(tmdb_idsList))
    print("Error: IMDb and TMDB ID lists have different lengths.")
else:
    # Loop through the lists using index to fetch data for both IMDb and TMDB IDs
    for i in range(len(imdb_idsList)):
        imdb_id = imdb_idsList[i]
        tmdb_id = tmdb_idsList[i]
        print("\n-----------------------------------\n")
        print("\n-----------------------------------\n")
        # Fetching IMDb data
        url_omdb = f"http://www.omdbapi.com/?i={imdb_id}&apikey={api_keyOMDb}"
        response_omdb = requests.get(url_omdb)

        title = None
        description = None
        rating = None
        release_year = None
        
        actors = None
        director = None
        content_rating = None
        runtime = None
        keywords = None
        
        aka1 = None
        aka2= None
        aka = None
        production_countries = None
        spoken_languages = None
        genres = None

        if response_omdb.status_code == 200:
            movie_data_omdb = response_omdb.json()
            if movie_data_omdb.get("Response") == "True":
                # Save or print the required information for IMDB
                title = movie_data_omdb.get("Title", "N/A")
                description = movie_data_omdb.get("Plot", "N/A")
                rating = movie_data_omdb.get("imdbRating", "N/A")
                release_year = movie_data_omdb.get("Year", "N/A")
                imdb_id = movie_data_omdb.get("imdbID", "N/A")
                actors = movie_data_omdb.get("Actors", "N/A")
                director = movie_data_omdb.get("Director", "N/A")
                content_rating = movie_data_omdb.get("Rated", "N/A")
                runtime = movie_data_omdb.get("Runtime", "N/A")
            # Print the extracted details
                print(f"Title: {title}")
                print(f"Description: {description}")
                print(f"Rating: {rating}")
                print(f"Release Year: {release_year}")
                print(f"IMDb ID: {imdb_id}")
                print(f"Actors: {actors}")
                print(f"Director: {director}")
                print(f"Content Rating: {content_rating}")
                print(f"Runtime: {runtime}")
            else:
                print(f"Error fetching IMDb data for {imdb_id}: {movie_data_omdb.get('Error', 'Unknown error occurred')}")
        else:
            print(f"Failed to fetch IMDb data for {imdb_id}, Status Code: {response_omdb.status_code}")
        
        # Fetching TMDB data
        url_tmdb = f"https://api.themoviedb.org/3/movie/{tmdb_id}"
        params = {"api_key": api_keytmdb}
        response_tmdb = requests.get(url_tmdb, params=params)
        print("\n-----------------------------------\n")
        url_keywords = f"https://api.themoviedb.org/3/movie/{tmdb_id}/keywords"
        if response_tmdb.status_code == 200:
            movie_data_tmdb = response_tmdb.json()
            response_keywords = requests.get(url_keywords, params=params)
            if movie_data_tmdb.get("status_code") != 34:  # Check for a valid response
                # Save or print the required information for TMDB
                keywords_data = response_keywords.json()
    # keywords = [keyword['name'] for keyword in keywords_data.get("keywords", [])]
                keywords = keywords_data.get("keywords", [])
                tmdb_id = movie_data_tmdb.get("id")
                aka1 = movie_data_tmdb.get("title",[] )
                aka2= movie_data_tmdb.get("tagline" ,[])
                aka = [aka1,aka2]
   # keywords = keywords_data.get("keywords", [])
                production_countries = movie_data_tmdb.get("production_countries", [])
    
    # Print country name and code
                print("Production Countries:")
                for country in production_countries:
                    print(f"Country: {country['name']}, Code: {country['iso_3166_1']}")

                spoken_languages = movie_data_tmdb.get("spoken_languages", [])
                genres = movie_data_tmdb.get("genres", [])
                #print(f"Keywords: {keywords}")
                print("Keywords:")
                for key in keywords:
                    print(f"Keyword: {key['name']}")
                #print(f"Production Countries: {production_countries}")
    # Print the genres
                #print(f"Genres: {genres}")
                #print(f"Language Spoken: {spoken_languages}")
                print("Genres:")
                for genre in genres:
                    print(f" - {genre['name']}")
    
                print("Spoken Languages:")
                for language in spoken_languages:
                    print(f" Language  {language['name']} (Code: {language['iso_639_1']})")
                print(f"TMDB ID: {tmdb_id}")
                print(f"AKAs: {aka}")
            else:
                print(f"Error fetching TMDB data for {tmdb_id}")
        else:
            print(f"Failed to fetch TMDB data for {tmdb_id}, Status Code: {response_tmdb.status_code}")
        #insert(title,description,rating ,release_year ,imdb_id ,actors ,director ,content_rating ,runtime ,keywords ,tmdb_id ,aka ,production_countries ,spoken_languages ,genres )
        sql = """INSERT INTO movie (title, description, rating, release_year, imdb_id, 
                content_rating, runtime, tmdb_id, AKAs)
                 VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);"""
        data = (
        title, description, rating, release_year, imdb_id, 
        content_rating, runtime, tmdb_id, aka
        )


        cur.execute(sql, data)
        print(f"tmdb_id before query: {tmdb_id}")
        cur.execute("SELECT movie_id FROM movie WHERE tmdb_id = %s", (str(tmdb_id),))
        movie_id = cur.fetchone()[0]
    # Execute the query
        conn.commit()


      #here genre  
        for genre in genres:
            genre_name = genre["name"]
            insert_genre_query = """
            INSERT INTO genre (genre)
            VALUES (%s)
            ON CONFLICT (genre) DO NOTHING; """
            cur.execute(insert_genre_query, (genre_name,))


        for genre in genres:
            cur.execute("SELECT genre_id FROM genre WHERE genre = %s", (genre["name"],))
            genre_id = cur.fetchone()[0]
    
    
            insert_movie_genre_query = """
            INSERT INTO movie_genre (movie_id, genre_id)
            VALUES (%s, %s);"""
            cur.execute(insert_movie_genre_query, (movie_id, genre_id))


        

#here country
        for country in production_countries:
            country_name = country["name"]
            country_code = country['iso_3166_1']
            insert_country_query = """
            INSERT INTO country (country_name, country_code)
            VALUES (%s,%s)
            ON CONFLICT (country_name) DO NOTHING; """
            cur.execute(insert_country_query, (country_name, country_code))


        for country in production_countries:
            cur.execute("SELECT country_id FROM country WHERE country_name = %s", (country["name"],))
            country_id = cur.fetchone()[0]
    
    
            insert_movie_country_query = """
            INSERT INTO movie_country (movie_id, country_id)
            VALUES (%s, %s);"""
            cur.execute(insert_movie_country_query, (movie_id, country_id))
        #here keyword
        for keyword in keywords:
            keyword_name = keyword["name"]
            
            insert_keyword_query = """
            INSERT INTO keyword (keyword)
            VALUES (%s)
            ON CONFLICT (keyword) DO NOTHING; """
            cur.execute(insert_keyword_query, (keyword_name,))


        for keyword in keywords:
            cur.execute("SELECT keyword_id FROM keyword WHERE keyword = %s", (keyword["name"],))
            keyword_id = cur.fetchone()[0]
    
    
            insert_movie_keyword_query = """
            INSERT INTO movie_keyword (movie_id, keyword_id)
            VALUES (%s, %s);"""
            cur.execute(insert_movie_keyword_query, (movie_id, keyword_id))

        #here actor
        for actor in actors:
            actor_name = actor
            
            insert_actor_query = """
            INSERT INTO actor (actor_name)
            VALUES (%s)
            ON CONFLICT (actor_name) DO NOTHING; """
            cur.execute(insert_actor_query, (actor_name,))


        for actor in actors:
            cur.execute("SELECT actor_id FROM actor WHERE actor_name = %s", (actor,))
            actor_id = cur.fetchone()[0]
    
    
            insert_movie_actor_query = """
            INSERT INTO movie_actor(movie_id, actor_id)
            VALUES (%s, %s) ON CONFLICT (movie_id, actor_id) DO NOTHING;"""
            cur.execute(insert_movie_actor_query, (movie_id, actor_id))
        
        #here director
        for director_ in director:
            director_name = director_
            
            insert_director_query = """
            INSERT INTO director (director_name)
            VALUES (%s)
            ON CONFLICT (director_name) DO NOTHING; """
            cur.execute(insert_director_query, (director_name,))


        for director_ in director:
            cur.execute("SELECT director_id FROM director WHERE director_name = %s", (director_,))
            director_id = cur.fetchone()[0]
    
    
            insert_movie_director_query = """
            INSERT INTO movie_director(movie_id, director_id)
            VALUES (%s, %s)ON CONFLICT (movie_id, director_id) DO NOTHING;"""
            cur.execute(insert_movie_director_query, (movie_id, director_id))
        #here language
        for language in spoken_languages:
            language_name = language["name"]
            language_code = language['iso_639_1']
            insert_language_query = """
            INSERT INTO language (language_name, language_code)
            VALUES (%s,%s)
            ON CONFLICT (language_name) DO NOTHING; """
            cur.execute(insert_language_query, (language_name, language_code))


        for language in spoken_languages:
            cur.execute("SELECT language_id FROM language WHERE language_name = %s", (language["name"],))
            language_id = cur.fetchone()[0]
    
    
            insert_movie_language_query = """
            INSERT INTO movie_language (movie_id, language_id)
            VALUES (%s, %s)ON CONFLICT (movie_id, language_id) DO NOTHING;"""
            cur.execute(insert_movie_language_query, (movie_id, language_id))
        conn.commit()


    # Commit the changes to the database
        
        print("\n-----------------------------------\n")
        print("\n-----------------------------------\n")
cur.close()
conn.close()