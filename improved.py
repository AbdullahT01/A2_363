import requests
import json

api_keyOMDb  = "193f21c7"  # Replace with your actual OMDb API key
api_keytmdb = "db70b73908eae1aff117991c8ef4bff2"


# 50 ids for both
imdb_idsList = [
    "tt0068646", "tt0111161", "tt0108052", "tt0081398", "tt0144084" 
    
]

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
        
            # Print the extracted details
                print(f"Title: {title}")
                print(f"Description: {description}")
                print(f"Rating: {rating}")
                print(f"Release Year: {release_year}")
                print(f"IMDb ID: {imdb_id}")
                print(f"Actors: {actors}")
                print(f"Director: {director}")
                print(f"Content Rating: {content_rating}")
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
        
        print("\n-----------------------------------\n")
        print("\n-----------------------------------\n")