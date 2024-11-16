import requests
import json
import time

imdb_ids = [
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

# Define your IMDb ID and OMDb API key

api_key = "193f21c7"  # Replace with your actual OMDb API key

# URL to fetch data from OMDb
#url = f"http://www.omdbapi.com/?i={imdb_ids}&apikey={api_key}"
# Initialize list to store movie data
movies_data = []

# Loop through each IMDb ID and fetch data
for imdb_id in imdb_ids:
    url = f"http://www.omdbapi.com/?i={imdb_id}&apikey={api_key}"
    response = requests.get(url)
    
    # Check if request was successful
    if response.status_code == 200:
        movie_data = response.json()
        
        # Parse data
        title = movie_data.get("short", {}).get("name", "N/A")
        plot = movie_data.get("short", {}).get("description", "N/A")
        content_rating = movie_data.get("short", {}).get("contentRating", "N/A")
        genres = movie_data.get("short", {}).get("genre", [])
        rating = movie_data.get("short", {}).get("aggregateRating", {}).get("ratingValue", "N/A")
        
        # Actors and directors
        actors = [actor["name"] for actor in movie_data.get("short", {}).get("actor", [])]
        directors = [director["name"] for director in movie_data.get("short", {}).get("director", [])]
        
        # Release year and keywords
        release_year = movie_data.get("top", {}).get("releaseYear", {}).get("year", "N/A")
        keywords = [keyword["node"]["text"] for keyword in movie_data.get("top", {}).get("keywords", {}).get("edges", [])]


        
        # Store the data in a dictionary
        movie_info = {
            "IMDb ID": imdb_id,
            "Title": title,
            "Plot": plot,
            "Content Rating": content_rating,
            "Genres": genres,
            "Rating": rating,
            "Actors": actors,
            "Directors": directors,
            "Release Year": release_year,
            "Keywords": keywords
        }
        
        # Append movie information to the list
        movies_data.append(movie_info)
        
        # Optional: Wait for a short period to avoid rate limiting
        time.sleep(2)  # Waits 1 second before the next request

    else:
        print(f"Failed to fetch data for {imdb_id}, Status Code: {response.status_code}")

# Save data to a JSON file
with open("movies.json", "w") as f:
    json.dump(movies_data, f, indent=4)
print("Collected movies data:", movies_data)

print("Data collection complete! Saved to movies.json")
