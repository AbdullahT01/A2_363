

import requests
import json

# Define your IMDb ID and OMDb API key
imdb_id = "tt0068646"  # Example IMDb ID for "Guardians of the Galaxy Vol. 2"
api_key = "193f21c7"  # Replace with your actual OMDb API key
#150 tmdb_ids 
#tmdb_id ="238"
imdb_idsList = [
    "tt0111161", "tt0068646", "tt0071562", "tt0468569", "tt0050083", "tt0108052", "tt0167260", "tt0110912", 
    "tt0120737", "tt0137523", "tt0109830", "tt0080684", "tt1375666", "tt0167261", "tt0073486", "tt0099685", 
    "tt0133093", "tt0047478", "tt0076759", "tt0114369", "tt0317248", "tt0102926", "tt0038650", "tt0118799", 
    "tt0120815", "tt0245429", "tt0120689", "tt0816692", "tt0120586", "tt0054215", "tt0110413", "tt0120338", 
    "tt0021749", "tt1675434", "tt0027977", "tt0253474", "tt0407887", "tt0088763", "tt0103064", "tt0047396", 
    "tt2582802", "tt0172495", "tt0482571", "tt0078788", "tt0209144", "tt0078748", "tt0082971", "tt0034583", 
    "tt0405094", "tt0095327", "tt0095765", "tt0032553", "tt0055630", "tt0043014", "tt0110357", "tt0075314", 
    "tt0120382", "tt0090605", "tt1745960", "tt0081505", "tt0045152", "tt0119698", "tt0057012", "tt0107290", 
    "tt0112573", "tt1345836", "tt1853728", "tt0070735", "tt0087843", "tt0091251", "tt0082096", "tt0040522", 
    "tt0033467", "tt4154756", "tt0114709", "tt0211915", "tt0022100", "tt0051201", "tt0986264", "tt0071853", 
    "tt0071315", "tt0042876", "tt0169547", "tt0050825", "tt0093058", "tt0056172", "tt0053125", "tt0042192", 
    "tt0435761", "tt0086879", "tt0105236", "tt2106476", "tt0086190", "tt0338013", "tt0040897", "tt0097576", 
    "tt0180093", "tt0036775", "tt0046438", "tt0119217", "tt0120735", "tt0025316", "tt0213338", "tt0059578", 
    "tt0986264", "tt0073195", "tt0050212", "tt0055031", "tt0041959", "tt0476735", "tt0361748", "tt2106476", 
    "tt0032138", "tt0041546", "tt0119492", "tt2096673", "tt0050976", "tt4016934", "tt0118715", "tt0074958", 
    "tt4154796", "tt0086250", "tt3011894", "tt1954470", "tt2267998", "tt0129167", "tt0050986", "tt0364569", 
    "tt0056592", "tt0042876", "tt0053291", "tt4016934", "tt4154796", "tt4154756", "tt2267998", "tt0050825", 
    "tt0198781", "tt2096673", "tt4154756", "tt0053125", "tt0364569", "tt2582802", "tt0266697", "tt0986264", 
    "tt0110413", "tt0036775", "tt4154756", "tt0082096", "tt0266543", "tt0032138", "tt0266543", "tt0086879", 
    "tt2106476", "tt0114814", "tt4154756", "tt0050986", "tt0090605", "tt0112573", "tt0361748", "tt0087843", 
    "tt0075314", "tt0045152", "tt0120382", "tt0025316", "tt0110413", "tt2278388", "tt0087843", "tt0056172", 
    "tt0047396", "tt0078788", "tt0073486", "tt0120586", "tt0060196", "tt0119217", "tt0054215", "tt1745960", 
    "tt0047396", "tt0102926", "tt0081398", "tt0095765", "tt0071853", "tt0041959", "tt0111161", "tt0133093", 
    "tt0110357", "tt0057012", "tt0112573", "tt0055630", "tt0056592", "tt0042876", "tt0036775", "tt0045152"
]

tmdb_idsList =["278", 
"238", 
"240", 
"155", 
"11", 
"106", 
"120", 
"818", 
"1198", 
"680", 
"13", 
"156", 
"27205", 
"121", 
"116", 
"119", 
"603", 
"260", 
"140", 
"110", 
"620", 
"40", 
"23", 
"574", 
"536", 
"172", 
"180", 
"74", 
"223", 
"401", 
"18004", 
"436", 
"557", 
"1539", 
"877", 
"300", 
"636", 
"1211", 
"1081", 
"1047", 
"2201", 
"1942", 
"326", 
"288", 
"2156", 
"1397", 
"1830", 
"2011", 
"2268", 
"1928",
"4016934", 
"4154796", 
"3011894", 
"1954470", 
"2267998", 
"0129167", 
"0050986", 
"0364569", 
"0056592", 
"0042876", 
"0053291", 
"4016934", 
"4154796", 
"4154756", 
"2267998", 
"0050825", 
"0198781", 
"2096673", 
"4154756", 
"0053125", 
"0364569", 
"2582802", 
"0266697", 
"0986264", 
"0110413", 
"0036775", 
"4154756", 
"0082096", 
"0266543", 
"0032138", 
"0266543", 
"0086879", 
"2106476", 
"0114814", 
"4154756", 
"0050986", 
"0090605", 
"0112573", 
"0361748", 
"0087843", 
"0075314", 
"0045152", 
"0120382", 
"0025316", 
"0110413", 
"2278388", 
"0087843", 
"0056172", 
"0047396", 
"0078788", 
"0073486", 
"0120586","0060196", 
"0119217", 
"0054215", 
"1745960", 
"0047396", 
"0102926", 
"0081398", 
"0095765", 
"0071853", 
"0041959", 
"0111161", 
"0133093", 
"0110357", 
"0057012", 
"0112573", 
"0055630", 
"0056592", 
"0042876", 
"0036775", 
"0045152", 
"0054215", 
"0120382", 
"0090605", 
"0112573", 
"0140479", 
"0160462", 
"0116788", 
"0126852", 
"0075194", 
"0182702", 
"0085574", 
"0157221", 
"0072690", 
"0123614", 
"0099052", 
"0031244", 
"0086204", 
"0107414", 
"0056367", 
"0098836", 
"0045734", 
"0070912", 
"0065070", 
"0047572", 
"0062905", 
"0059079", 
"0065781", 
"0097015"]
#api_keytmdb ="db70b73908eae1aff117991c8ef4bff2"
api_readtoken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYjcwYjczOTA4ZWFlMWFmZjExNzk5MWM4ZWY0YmZmMiIsIm5iZiI6MTczMTcxNTY4Ny44ODgwMTc0LCJzdWIiOiI2NzM3ZGI0NjRkNDc3MTQwY2UzYWNmMjkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0._Ravm1ROdk8xmuW-uhvDKvJVzbGxzhcH4viKL_OqB2c"
# URL to fetch data from OMDb
url = f"http://www.omdbapi.com/?i={imdb_id}&apikey={api_key}"

# Set headers to disable caching and add User-Agent
print("IMDB_ID ------------------------------------------")
headers = {
    "Cache-Control": "no-cache",
    "Pragma": "no-cache",
    "User-Agent": "Mozilla/5.0"
}

# Make the request with headers
response = requests.get(url, headers=headers)

# Check if request was successful
if response.status_code == 200:
    movie_data = response.json()
    #print(json.dumps(movie_data, indent=4))  # Print the movie data nicely formatted
    if movie_data.get("Response") == "True":
        # Extract required information
        title = movie_data.get("Title", "N/A")
        description = movie_data.get("Plot", "N/A")
        rating = movie_data.get("imdbRating", "N/A")
        release_year = movie_data.get("Year", "N/A")
        imdb_id = movie_data.get("imdbID", "N/A")
        actors = movie_data.get("Actors", "N/A")
        director = movie_data.get("Director", "N/A")
        content_rating = movie_data.get("Rated", "N/A")
        
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
        print(f"Error: {movie_data.get('Error', 'Unknown error occurred')}")


else:
    print(f"Failed to fetch data, Status Code: {response.status_code}")

print("IMDB_ID ------------------------------------------")
print("TMDB_ID ------------------------------------------")
api_keytmdb = "db70b73908eae1aff117991c8ef4bff2"
movie_id = 238 # The Godfather 238

# TMDB API Endpoint
url_tmdb = f"https://api.themoviedb.org/3/movie/{movie_id}"
url_keywords = f"https://api.themoviedb.org/3/movie/{movie_id}/keywords"
params = {"api_key": api_keytmdb}

# Fetch movie details
response_tmdb = requests.get(url_tmdb, params=params)
response_keywords = requests.get(url_keywords, params=params)

if response_tmdb.status_code == 200 and response_keywords.status_code == 200:
    movie_data = response_tmdb.json()
    keywords_data = response_keywords.json()
    # keywords = [keyword['name'] for keyword in keywords_data.get("keywords", [])]
    keywords = keywords_data.get("keywords", [])
    tmdb_id = movie_data.get("id")
    aka1 = movie_data.get("title",[] )
    aka2= movie_data.get("tagline" ,[])
    aka = [aka1,aka2]
   # keywords = keywords_data.get("keywords", [])
    production_countries = movie_data.get("production_countries", [])
    
    # Print country name and code
    # for country in production_countries:
    #     print(f"Country: {country['name']}, Code: {country['iso_3166_1']}")

    spoken_languages = movie_data.get("spoken_languages", [])
    genres = movie_data.get("genres", [])
    print(f"Keywords: {keywords}")
    print(f"Production Countries: {production_countries}")
    # Print the genres
    print(f"Genres: {genres}")
    print(f"Language Spoken: {spoken_languages}")
    # for genre in genres:
    #     print(f" - {genre['name']}")
    # if spoken_languages:
    #     print("Spoken Languages:")
    #     for language in spoken_languages:
    #         print(f" - {language['name']} (Code: {language['iso_639_1']})")
    print(f"TMDB ID: {tmdb_id}")
    print(f"AKAs: {aka}")
    print(f"Keywords: {keywords}")
else:
    print(f"Failed to retrieve data: {response_tmdb.status_code} or {response_keywords.status_code}")

print("TMDB_ID ------------------------------------------")
# url = f"https://api.themoviedb.org/3/movie/{movie_id}"
# params = {
#     "api_key": api_keytmdb,
#     "language": "en-US"
# }

# response = requests.get(url, params=params)

# if response.status_code == 200:
#     movie_data = response.json()
#     print(movie_data)
# else:
#     print(f"Failed to retrieve data: {response.status_code} - {response.text}")