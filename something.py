import requests
import json

# Define your IMDb ID and OMDb API key
imdb_id = "tt3896198"  # Example IMDb ID for "Guardians of the Galaxy Vol. 2"
api_key = "193f21c7"  # Replace with your actual OMDb API key

# URL to fetch data from OMDb
url = f"http://www.omdbapi.com/?i={imdb_id}&apikey={api_key}"

# Set headers to disable caching and add User-Agent
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
    print(json.dumps(movie_data, indent=4))  # Print the movie data nicely formatted



else:
    print(f"Failed to fetch data, Status Code: {response.status_code}")