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

CREATE TABLE IF NOT EXISTS review (
    review_id SERIAL PRIMARY KEY ,
    review TEXT NOT NULL  
);
CREATE TABLE IF NOT EXISTS movie_review (
    movie_id INTEGER,
    review_id INTEGER,
    PRIMARY KEY (movie_id , review_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (review_id) REFERENCES review(review_id)
);           


""")
conn.commit()

api_keyOMDb  = "193f21c7"  
api_keytmdb = "db70b73908eae1aff117991c8ef4bff2"


def get_reviews(movie_id):
    url = f'https://api.themoviedb.org/3/movie/{movie_id}/reviews?api_key={api_keytmdb}'
    response = requests.get(url)
    
    if response.status_code == 200:
        reviews = response.json()['results']
        return reviews
    else:
        print(f"Error fetching reviews for movie ID {movie_id}: {response.status_code}")
        return []

def insert_review(review_content):
    
    cur.execute("INSERT INTO review (review) VALUES (%s) RETURNING review_id", (review_content,))
    review_id = cur.fetchone()[0]
    conn.commit()
    
    return review_id

# Function to associate a review with a movie
def associate_movie_review(movie_id, review_id):
    
    cur.execute(
        "INSERT INTO movie_review (movie_id, review_id) VALUES (%s, %s) ON CONFLICT DO NOTHING",
        (movie_id, review_id)
    )
    conn.commit()
    


#, "tt0111161", "tt0108052", "tt0081398", "tt0144084" 
#  ids for both 107
imdb_idsList = [
   "tt0111161", "tt0068646", "tt0468569", "tt0110912", "tt0109830", "tt0133093", "tt0167260", "tt0080684", "tt0137523", "tt1375666", "tt0110357", "tt0099685", "tt0172495", "tt0071562", "tt1345836", "tt0088763", "tt0108052", "tt0076759", "tt0407887", "tt0120689", "tt0482571", "tt0114814", "tt0102926", "tt0816692", "tt1285016", "tt0034583", "tt0033467", "tt0050083", "tt0066921", "tt0081505", "tt2582802", "tt1663202", "tt0120586", "tt0114369", "tt0120737", "tt0234215", "tt0242653", "tt0120338", "tt4154796", "tt2313197", "tt0107290", "tt0317705", "tt4633694", "tt10872600", "tt0993846", "tt0264464", "tt0167261", "tt0118715", "tt0043014", "tt0268978", "tt0120382", "tt2278388", "tt0032138", "tt0361748", "tt1596363", "tt0031381", "tt0099674", "tt0088847", "tt0964517", "tt0070047", "tt0075314", "tt0088247", "tt0083658", "tt1431045", "tt4154756", "tt3659388", "tt1392190", "tt0093779", "tt0110413", "tt0086250", "tt2015381", "tt0078748", "tt1130884", "tt0209144", "tt0060196", "tt0359950", "tt0477348", "tt0129167", "tt0073195", "tt0829482", "tt0357413", "tt1119646", "tt0071853", "tt0107048", "tt0109686", "tt0443453", "tt0091042", "tt0365748", "tt0838283", "tt1232829", "tt0910936", "tt0942385", "tt0396269", "tt0425112", "tt1478338", "tt0247745", "tt0405422", "tt0265666", "tt0080339", "tt0109040", "tt0071230", "tt0080487", "tt0087332", "tt0094012", "tt0095705", "tt0109445", "tt0079367"
]
#, "278", "424", "1578", "1359" 
# TMDb movie IDs 107
tmdb_idsList = [
    "278", "238", "155", "680", "13", "603", "122", "1891", "550", "27205", "420818", "769", "98", "240", "49026", "105", "424", "11", "1422", "497", "1124", "629", "274", "157336", "37799", "289", "15", "389", "185", "694", "244786", "281957", "73", "807", "120", "604", "605", "597", "299534", "123025", "329", "9806", "324857", "634649", "106646", "640", "121", "115", "599", "453", "37165", "120467", "630", "16869", "318846", "770", "242", "2108", "45317", "9552", "103", "218", "78", "293660", "299536", "286217", "76341", "2493", "101", "111", "447365", "348", "11324", "77", "429", "116745", "6977", "10386", "578", "8363", "8699", "18785", "762", "137", "8467", "740985", "9377", "747", "12133", "64688", "10189", "7446", "9522", "4638", "55721", "39939", "6957", "9428", "813", "3049", "11072", "11977", "620", "957", "37136", "2292", "6471"
    
]

if len(imdb_idsList) != len(tmdb_idsList):
    print(len(imdb_idsList))
    print(len(tmdb_idsList))
    print("Error: IMDb and TMDB ID lists have different lengths.")
else:
    
    for i in range(len(imdb_idsList)):
        imdb_id = imdb_idsList[i]
        tmdb_id = tmdb_idsList[i]
        print("\n-----------------------------------\n")
        print("\n-----------------------------------\n")
      
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
        reviews=None
        if response_omdb.status_code == 200:
            movie_data_omdb = response_omdb.json()
            if movie_data_omdb.get("Response") == "True":
                
                title = movie_data_omdb.get("Title", "N/A")
                description = movie_data_omdb.get("Plot", "N/A")
                rating = movie_data_omdb.get("imdbRating", "N/A")
                release_year = movie_data_omdb.get("Year", "N/A")
                imdb_id = movie_data_omdb.get("imdbID", "N/A")
                actors = movie_data_omdb.get("Actors", "N/A")
                director = movie_data_omdb.get("Director", "N/A")
                content_rating = movie_data_omdb.get("Rated", "N/A")
                runtime = movie_data_omdb.get("Runtime", "N/A")
         
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
        
       
        url_tmdb = f"https://api.themoviedb.org/3/movie/{tmdb_id}"
        params = {"api_key": api_keytmdb}
        response_tmdb = requests.get(url_tmdb, params=params)
        print("\n-----------------------------------\n")
        url_keywords = f"https://api.themoviedb.org/3/movie/{tmdb_id}/keywords"

        if response_tmdb.status_code == 200:
            movie_data_tmdb = response_tmdb.json()
            response_keywords = requests.get(url_keywords, params=params)

            if movie_data_tmdb.get("status_code") != 34:  
               
                keywords_data = response_keywords.json()
    
                keywords = keywords_data.get("keywords", [])
                tmdb_id = movie_data_tmdb.get("id")
                aka1 = movie_data_tmdb.get("title",[] )
                aka2= movie_data_tmdb.get("tagline" ,[])
                aka = [aka1,aka2]
   
                production_countries = movie_data_tmdb.get("production_countries", [])
    
   
                print("Production Countries:")
                for country in production_countries:
                    print(f"Country: {country['name']}, Code: {country['iso_3166_1']}")

                spoken_languages = movie_data_tmdb.get("spoken_languages", [])
                genres = movie_data_tmdb.get("genres", [])
               
                print("Keywords:")
                for key in keywords:
                    print(f"Keyword: {key['name']}")
                
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
        actor_list = actors.split(',')
        for actor in actor_list:
            actor_name = actor
            
            insert_actor_query = """
            INSERT INTO actor (actor_name)
            VALUES (%s)
            ON CONFLICT (actor_name) DO NOTHING; """
            cur.execute(insert_actor_query, (actor_name,))


        for actor in actor_list:
            cur.execute("SELECT actor_id FROM actor WHERE actor_name = %s", (actor,))
            actor_id = cur.fetchone()[0]
    
    
            insert_movie_actor_query = """
            INSERT INTO movie_actor(movie_id, actor_id)
            VALUES (%s, %s) ON CONFLICT (movie_id, actor_id) DO NOTHING;"""
            cur.execute(insert_movie_actor_query, (movie_id, actor_id))
        
        #here director
        director_list = director.split(',')
        for director_ in director_list:
            director_name = director_
            
            insert_director_query = """
            INSERT INTO director (director_name)
            VALUES (%s)
            ON CONFLICT (director_name) DO NOTHING; """
            cur.execute(insert_director_query, (director_name,))


        for director_ in director_list:
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

        #reviews




        reviews = get_reviews(movie_id)
        for review in reviews:
            
            review_content = review['content']
        
        
            review_id = insert_review(review_content)
        
       
            associate_movie_review(movie_id, review_id)





        print("\n-----------------------------------\n")
        print("\n-----------------------------------\n")
        conn.commit()

conn.commit()
cur.close()
conn.close()
