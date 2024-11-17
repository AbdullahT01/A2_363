import requests

# Your API keys
TMDB_API_KEY= 'db70b73908eae1aff117991c8ef4bff2'
IMDB_API_KEY= '193f21c7'  # Not directly used in this case, since we are querying TMDB




movie_titles = [
    "The Shawshank Redemption", "The Godfather", "The Dark Knight", "Pulp Fiction", "Forrest Gump",
    "The Matrix", "The Lord of the Rings: The Return of the King", "The Empire Strikes Back", "Fight Club", "Inception",
    "The Lion King", "Goodfellas", "Gladiator", "The Godfather: Part II", "The Dark Knight Rises",
    "Back to the Future", "Schindler's List", "Star Wars", "The Departed", "The Green Mile",
    "The Prestige", "The Usual Suspects", "The Silence of the Lambs", "Interstellar", "The Social Network",
    "Casablanca", "Citizen Kane", "12 Angry Men", "A Clockwork Orange", "The Shining",
    "Whiplash", "The Revenant", "American History X", "Se7en", "The Lord of the Rings: The Fellowship of the Ring",
    "The Matrix Reloaded", "The Matrix Revolutions", "Titanic", "Avengers: Endgame", "The Dark Knight Returns",
    "Jurassic Park", "The Incredibles", "Spider-Man: Into the Spider-Verse", "WALL-E", "Spider-Man: No Way Home",
    "The Wolf of Wall Street", "Catch Me If You Can", "The Lord of the Rings: The Two Towers", "The Big Lebowski",
    "Sunset Boulevard", "A Beautiful Mind", "The Truman Show", "The Grand Budapest Hotel", "The Wizard of Oz",
    "Inglourious Basterds", "The Big Short", "Gone with the Wind", "The Godfather: Part III", "The Breakfast Club",
    "The Fighter", "The Exorcist", "Taxi Driver", "The Terminator", "Blade Runner",
    "The Revenant", "The Dark Knight Rises", "Deadpool", "Avengers: Infinity War", "The Martian",
    "Mad Max: Fury Road", "The Princess Bride", "Léon: The Professional", "Scarface", "The Godfather Part II",
    "The Incredibles 2", "Guardians of the Galaxy", "Pulp Fiction", "Alien", "The Lion King",
    "The Prestige", "Shutter Island", "Memento", "The Good, the Bad, and the Ugly", "Fight Club",
    "The Secret Life of Walter Mitty", "Interstellar", "No Country for Old Men", "The Iron Giant", "The Departed",
    "The Big Lebowski", "A Clockwork Orange", "The Silence of the Lambs", "Schindler's List", "The Revenant",
    "Inception", "Gladiator", "A Beautiful Mind", "Star Wars: A New Hope", "The Fellowship of the Ring",
    "The Incredibles", "The Matrix", "Citizen Kane", "Gone with the Wind", "The Wizard of Oz",
    "The Dark Knight", "The Social Network", "Back to the Future", "Jaws", "The Lion King",
    "The Godfather", "Forrest Gump", "Memento", "Jurassic Park", "The Prestige",
    "Superbad", "Anchorman: The Legend of Ron Burgundy", "The Hangover", "Monty Python and the Holy Grail", "Groundhog Day",
    "The Big Lebowski", "Dumb and Dumber", "Borat", "Ferris Bueller's Day Off", "Shaun of the Dead",
    "Step Brothers", "21 Jump Street", "Pineapple Express", "The Grand Budapest Hotel", "Tropic Thunder",
    "Wedding Crashers", "Hot Fuzz", "Bridesmaids", "Super Troopers", "The 40-Year-Old Virgin",
    "The Royal Tenenbaums", "Airplane!", "Ace Ventura: Pet Detective", "Blazing Saddles", "Caddyshack",
    "Ghostbusters", "Spaceballs", "The Naked Gun: From the Files of Police Squad!", "Clerks", "The Jerk"
] # Add or remove movies as you wish
 # Function to get TMDB and IMDb IDs
def remove_duplicates(movie_titles):
    # Use a set to track seen movie titles
    seen = set()
    unique_titles = []
    
    for title in movie_titles:
        if title not in seen:
            unique_titles.append(title)
            seen.add(title)
    
    return unique_titles

def get_tmdb_id(movie_title):
    url = f"https://api.themoviedb.org/3/search/movie?api_key={TMDB_API_KEY}&query={movie_title}"
    response = requests.get(url).json()
    if response['results']:
        return str(response['results'][0]['id'])  # TMDB ID
    return None

def get_imdb_id(movie_title):
    url = f"https://www.omdbapi.com/?t={movie_title}&apikey={IMDB_API_KEY}"
    response = requests.get(url).json()
    if response.get('imdbID'):
        return response['imdbID']  # IMDb ID
    return None

movie_titles= remove_duplicates(movie_titles)
# Lists to store TMDB and IMDb IDs
tmdb_ids = []
imdb_ids = []

# Iterate over the movie titles
for title in movie_titles:
    tmdb_id = get_tmdb_id(title)
    imdb_id = get_imdb_id(title)
    
    if tmdb_id and imdb_id:
        tmdb_ids.append(tmdb_id)
        imdb_ids.append(imdb_id)

# Print the results
print("TMDB IDs:")
print(", ".join([f'"{tmdb_id}"' for tmdb_id in tmdb_ids])) 
print(f"Total TMDB IDs found: {len(tmdb_ids)}")

print("\nIMDb IDs:")
print(", ".join([f'"{imdb_id}"' for imdb_id in imdb_ids]))  # Print all IMDb IDs separated by commas
print(f"Total IMDb IDs found: {len(imdb_ids)}")