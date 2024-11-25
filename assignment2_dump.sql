--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    actor_id integer NOT NULL,
    actor_name text NOT NULL
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actor_actor_id_seq OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actor_actor_id_seq OWNED BY public.actor.actor_id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id integer NOT NULL,
    country_name text NOT NULL,
    country_code text NOT NULL,
    CONSTRAINT country_country_code_check CHECK ((length(country_code) = 2))
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_country_id_seq OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_country_id_seq OWNED BY public.country.country_id;


--
-- Name: director; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.director (
    director_id integer NOT NULL,
    director_name text NOT NULL
);


ALTER TABLE public.director OWNER TO postgres;

--
-- Name: director_director_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.director_director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.director_director_id_seq OWNER TO postgres;

--
-- Name: director_director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.director_director_id_seq OWNED BY public.director.director_id;


--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    genre text NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genre_genre_id_seq OWNER TO postgres;

--
-- Name: genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_genre_id_seq OWNED BY public.genre.genre_id;


--
-- Name: keyword; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keyword (
    keyword_id integer NOT NULL,
    keyword text NOT NULL
);


ALTER TABLE public.keyword OWNER TO postgres;

--
-- Name: keyword_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.keyword_keyword_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.keyword_keyword_id_seq OWNER TO postgres;

--
-- Name: keyword_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.keyword_keyword_id_seq OWNED BY public.keyword.keyword_id;


--
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    language_id integer NOT NULL,
    language_name text NOT NULL,
    language_code text NOT NULL,
    CONSTRAINT language_language_code_check CHECK ((length(language_code) = 2))
);


ALTER TABLE public.language OWNER TO postgres;

--
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.language_language_id_seq OWNER TO postgres;

--
-- Name: language_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.language_language_id_seq OWNED BY public.language.language_id;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie (
    movie_id integer NOT NULL,
    title text NOT NULL,
    description text,
    rating real,
    release_year integer,
    imdb_id text,
    tmdb_id text NOT NULL,
    content_rating text NOT NULL,
    watchmode_id text,
    akas text[],
    runtime text NOT NULL,
    CONSTRAINT movie_rating_check CHECK (((rating >= (0)::double precision) AND (rating <= (10)::double precision)))
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- Name: movie_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_actor (
    movie_id integer NOT NULL,
    actor_id integer NOT NULL
);


ALTER TABLE public.movie_actor OWNER TO postgres;

--
-- Name: movie_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_country (
    movie_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.movie_country OWNER TO postgres;

--
-- Name: movie_director; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_director (
    movie_id integer NOT NULL,
    director_id integer NOT NULL
);


ALTER TABLE public.movie_director OWNER TO postgres;

--
-- Name: movie_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_genre (
    movie_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.movie_genre OWNER TO postgres;

--
-- Name: movie_keyword; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_keyword (
    movie_id integer NOT NULL,
    keyword_id integer NOT NULL
);


ALTER TABLE public.movie_keyword OWNER TO postgres;

--
-- Name: movie_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_language (
    movie_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE public.movie_language OWNER TO postgres;

--
-- Name: movie_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_movie_id_seq OWNER TO postgres;

--
-- Name: movie_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_movie_id_seq OWNED BY public.movie.movie_id;


--
-- Name: movie_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_review (
    movie_id integer NOT NULL,
    review_id integer NOT NULL
);


ALTER TABLE public.movie_review OWNER TO postgres;

--
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    review_id integer NOT NULL,
    review text NOT NULL
);


ALTER TABLE public.review OWNER TO postgres;

--
-- Name: review_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_review_id_seq OWNER TO postgres;

--
-- Name: review_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_review_id_seq OWNED BY public.review.review_id;


--
-- Name: actor actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor ALTER COLUMN actor_id SET DEFAULT nextval('public.actor_actor_id_seq'::regclass);


--
-- Name: country country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_country_id_seq'::regclass);


--
-- Name: director director_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director ALTER COLUMN director_id SET DEFAULT nextval('public.director_director_id_seq'::regclass);


--
-- Name: genre genre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN genre_id SET DEFAULT nextval('public.genre_genre_id_seq'::regclass);


--
-- Name: keyword keyword_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyword ALTER COLUMN keyword_id SET DEFAULT nextval('public.keyword_keyword_id_seq'::regclass);


--
-- Name: language language_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language ALTER COLUMN language_id SET DEFAULT nextval('public.language_language_id_seq'::regclass);


--
-- Name: movie movie_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie ALTER COLUMN movie_id SET DEFAULT nextval('public.movie_movie_id_seq'::regclass);


--
-- Name: review review_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review ALTER COLUMN review_id SET DEFAULT nextval('public.review_review_id_seq'::regclass);


--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (actor_id, actor_name) FROM stdin;
1	Tim Robbins
2	 Morgan Freeman
3	 Bob Gunton
4	Marlon Brando
5	 Al Pacino
6	 James Caan
7	Christian Bale
8	 Heath Ledger
9	 Aaron Eckhart
10	John Travolta
11	 Uma Thurman
12	 Samuel L. Jackson
13	Tom Hanks
14	 Robin Wright
15	 Gary Sinise
16	Keanu Reeves
17	 Laurence Fishburne
18	 Carrie-Anne Moss
19	Elijah Wood
20	 Viggo Mortensen
21	 Ian McKellen
22	Mark Hamill
23	 Harrison Ford
24	 Carrie Fisher
25	Brad Pitt
26	 Edward Norton
27	 Meat Loaf
28	Leonardo DiCaprio
29	 Joseph Gordon-Levitt
30	 Elliot Page
31	Matthew Broderick
32	 Jeremy Irons
33	 James Earl Jones
34	Robert De Niro
35	 Ray Liotta
36	 Joe Pesci
37	Russell Crowe
38	 Joaquin Phoenix
39	 Connie Nielsen
40	Al Pacino
41	 Robert De Niro
42	 Robert Duvall
44	 Tom Hardy
45	 Anne Hathaway
46	Michael J. Fox
47	 Christopher Lloyd
48	 Lea Thompson
49	Liam Neeson
50	 Ralph Fiennes
51	 Ben Kingsley
56	 Matt Damon
57	 Jack Nicholson
59	 Michael Clarke Duncan
60	 David Morse
62	 Hugh Jackman
63	 Scarlett Johansson
64	Kevin Spacey
65	 Gabriel Byrne
66	 Chazz Palminteri
67	Jodie Foster
68	 Anthony Hopkins
69	 Scott Glenn
70	Matthew McConaughey
72	 Jessica Chastain
73	Jesse Eisenberg
74	 Andrew Garfield
75	 Justin Timberlake
76	Humphrey Bogart
77	 Ingrid Bergman
78	 Paul Henreid
79	Orson Welles
80	 Joseph Cotten
81	 Dorothy Comingore
82	Henry Fonda
83	 Lee J. Cobb
84	 Martin Balsam
85	Malcolm McDowell
86	 Patrick Magee
87	 Michael Bates
88	Jack Nicholson
89	 Shelley Duvall
90	 Danny Lloyd
91	Miles Teller
92	 J.K. Simmons
93	 Melissa Benoist
96	 Will Poulter
97	Edward Norton
98	 Edward Furlong
99	 Beverly D'Angelo
100	Morgan Freeman
101	 Brad Pitt
102	 Kevin Spacey
105	 Orlando Bloom
113	 Kate Winslet
114	 Billy Zane
115	Robert Downey Jr.
116	 Chris Evans
117	 Mark Ruffalo
118	Peter Weller
119	 Ariel Winter
120	 David Selby
121	 Wade Williams
122	Sam Neill
123	 Laura Dern
124	 Jeff Goldblum
125	Craig T. Nelson
127	 Holly Hunter
128	Shameik Moore
129	 Jake Johnson
130	 Hailee Steinfeld
131	Tom Holland
132	 Zendaya
133	 Benedict Cumberbatch
135	 Jonah Hill
136	 Margot Robbie
138	 Tom Hanks
139	 Christopher Walken
143	Jeff Bridges
144	 John Goodman
145	 Julianne Moore
146	William Holden
147	 Gloria Swanson
148	 Erich von Stroheim
150	 Ed Harris
151	 Jennifer Connelly
152	Jim Carrey
154	 Laura Linney
155	Ralph Fiennes
156	 F. Murray Abraham
157	 Mathieu Amalric
158	Judy Garland
159	 Frank Morgan
160	 Ray Bolger
162	 Diane Kruger
163	 Eli Roth
165	 Steve Carell
166	 Ryan Gosling
167	Clark Gable
168	 Vivien Leigh
169	 Thomas Mitchell
171	 Diane Keaton
172	 Andy Garcia
173	Emilio Estevez
174	 Judd Nelson
175	 Molly Ringwald
176	Mark Wahlberg
177	 Christian Bale
178	 Amy Adams
179	Ellen Burstyn
180	 Max von Sydow
181	 Linda Blair
183	 Jodie Foster
184	 Cybill Shepherd
185	Arnold Schwarzenegger
186	 Linda Hamilton
187	 Michael Biehn
188	Harrison Ford
189	 Rutger Hauer
190	 Sean Young
191	Ryan Reynolds
192	 Morena Baccarin
193	 T.J. Miller
195	 Chris Hemsworth
197	Matt Damon
199	 Kristen Wiig
200	Tom Hardy
201	 Charlize Theron
202	 Nicholas Hoult
203	Cary Elwes
204	 Mandy Patinkin
206	Jean Reno
207	 Gary Oldman
208	 Natalie Portman
210	 Michelle Pfeiffer
211	 Steven Bauer
212	Chris Pratt
213	 Vin Diesel
214	 Bradley Cooper
215	Sigourney Weaver
216	 Tom Skerritt
217	 John Hurt
219	 Emily Mortimer
221	Guy Pearce
223	 Joe Pantoliano
224	Clint Eastwood
225	 Eli Wallach
226	 Lee Van Cleef
227	Ben Stiller
229	 Jon Daly
230	Tommy Lee Jones
231	 Javier Bardem
232	 Josh Brolin
233	Eli Marienthal
234	 Harry Connick Jr.
235	 Jennifer Aniston
236	Roy Scheider
237	 Robert Shaw
238	 Richard Dreyfuss
239	Michael Cera
241	 Christopher Mintz-Plasse
242	Will Ferrell
243	 Christina Applegate
245	Zach Galifianakis
247	 Justin Bartha
248	Graham Chapman
249	 John Cleese
250	 Eric Idle
251	Bill Murray
252	 Andie MacDowell
253	 Chris Elliott
255	 Jeff Daniels
256	 Lauren Holly
257	Sacha Baron Cohen
258	 Ken Davitian
259	 Luenell
261	 Alan Ruck
262	 Mia Sara
263	Simon Pegg
264	 Nick Frost
265	 Kate Ashfield
267	 John C. Reilly
268	 Mary Steenburgen
269	Jonah Hill
270	 Channing Tatum
271	 Ice Cube
272	Seth Rogen
273	 James Franco
274	 Gary Cole
276	 Jack Black
277	 Robert Downey Jr.
278	Owen Wilson
279	 Vince Vaughn
280	 Rachel McAdams
283	 Martin Freeman
284	Kristen Wiig
285	 Maya Rudolph
286	 Rose Byrne
287	Jay Chandrasekhar
288	 Kevin Heffernan
289	 André Vippolis
290	Steve Carell
291	 Catherine Keener
292	 Paul Rudd
293	Gene Hackman
294	 Gwyneth Paltrow
295	 Anjelica Huston
296	Robert Hays
297	 Julie Hagerty
298	 Leslie Nielsen
300	 Courteney Cox
302	Cleavon Little
303	 Gene Wilder
304	 Slim Pickens
305	Chevy Chase
306	 Rodney Dangerfield
307	 Bill Murray
309	 Dan Aykroyd
310	 Sigourney Weaver
311	Mel Brooks
312	 John Candy
313	 Rick Moranis
314	Leslie Nielsen
315	 Priscilla Presley
316	 O.J. Simpson
317	Brian O'Halloran
318	 Jeff Anderson
319	 Marilyn Ghigliotti
320	Steve Martin
321	 Bernadette Peters
322	 Catlin Adams
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (country_id, country_name, country_code) FROM stdin;
1	United States of America	US
3	United Kingdom	GB
8	New Zealand	NZ
11	Germany	DE
25	Hong Kong	HK
42	Canada	CA
44	Taiwan	TW
88	Australia	AU
92	France	FR
99	Italy	IT
100	Spain	ES
\.


--
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.director (director_id, director_name) FROM stdin;
1	Frank Darabont
2	Francis Ford Coppola
3	Christopher Nolan
4	Quentin Tarantino
5	Robert Zemeckis
6	Lana Wachowski
7	 Lilly Wachowski
8	Peter Jackson
9	Irvin Kershner
10	David Fincher
12	Roger Allers
13	 Rob Minkoff
14	Martin Scorsese
15	Ridley Scott
19	Steven Spielberg
20	George Lucas
24	Bryan Singer
25	Jonathan Demme
28	Michael Curtiz
29	Orson Welles
30	Sidney Lumet
31	Stanley Kubrick
33	Damien Chazelle
34	Alejandro G. Iñárritu
35	Tony Kaye
42	James Cameron
43	Anthony Russo
44	 Joe Russo
45	Jay Oliva
47	Brad Bird
48	Bob Persichetti
49	 Peter Ramsey
50	 Rodney Rothman
51	Jon Watts
55	Joel Coen
56	 Ethan Coen
57	Billy Wilder
58	Ron Howard
59	Peter Weir
60	Wes Anderson
61	Victor Fleming
62	 King Vidor
64	Adam McKay
66	 George Cukor
67	 Sam Wood
69	John Hughes
70	David O. Russell
71	William Friedkin
75	Tim Miller
79	George Miller
80	Rob Reiner
81	Luc Besson
82	Brian De Palma
83	James Gunn
87	Sergio Leone
88	Ben Stiller
89	Ethan Coen
90	 Joel Coen
93	Greg Mottola
95	Todd Phillips
96	Terry Gilliam
97	 Terry Jones
98	Harold Ramis
99	Peter Farrelly
100	 Bobby Farrelly
101	Larry Charles
103	Edgar Wright
105	Phil Lord
106	 Christopher Miller
107	David Gordon Green
109	David Dobkin
111	Paul Feig
112	Jay Chandrasekhar
113	Judd Apatow
115	Jim Abrahams
116	 David Zucker
117	 Jerry Zucker
118	Tom Shadyac
119	Mel Brooks
121	Ivan Reitman
123	David Zucker
124	Kevin Smith
125	Carl Reiner
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (genre_id, genre) FROM stdin;
1	Drama
2	Crime
6	Action
8	Thriller
11	Comedy
13	Romance
15	Science Fiction
16	Adventure
17	Fantasy
28	Family
44	History
45	War
56	Mystery
75	Horror
78	Music
79	Western
104	Animation
\.


--
-- Data for Name: keyword; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keyword (keyword_id, keyword) FROM stdin;
1	prison
2	friendship
3	police brutality
4	corruption
5	based on novel or book
6	hope
7	prison cell
8	delinquent
9	redemption
10	parole board
11	prison escape
12	wrongful imprisonment
13	interracial friendship
14	framed for murder
15	1940s
16	voiceover
18	loss of loved one
19	love at first sight
20	italy
21	symbolism
22	patriarch
23	europe
24	organized crime
25	mafia
26	religion
27	lawyer
28	revenge motive
29	crime family
30	sicilian mafia
31	religious hypocrisy
32	gun violence
33	rise to power
34	dead horse
35	gang violence
37	1950s
38	wonder
39	mafia war
40	joker
41	sadism
42	chaos
43	secret identity
44	crime fighter
45	superhero
46	anti hero
47	scarecrow
48	based on comic
49	vigilante
51	tragic hero
52	anti villain
53	criminal mastermind
54	district attorney
55	super power
56	super villain
57	neo-noir
58	sexy man in fury costume
59	drug dealer
60	boxer
61	massage
62	stolen money
63	briefcase
64	crime boss
66	heirloom
67	dance competition
68	los angeles, california
69	theft
70	nonlinear timeline
71	multiple storylines
72	speculative
73	domineering
75	melodramatic
76	ominous
77	film in chapters
78	vietnam war
79	vietnam veteran
80	mentally disabled
82	usa president
83	washington dc, usa
84	post-traumatic stress disorder (ptsd)
85	waitress
87	hippie
88	single parent
89	parent child relationship
90	optimism
91	1970s
92	drug addiction
93	autism
94	alabama
95	black panther party
96	bus stop
97	family relationships
98	chameleon
99	single mother
100	military
101	anti war protest
102	1960s
103	college american football
104	mother son relationship
105	reminiscent
106	amused
107	enthusiastic
108	feel-good
109	man vs machine
110	martial arts
111	dream
112	artificial intelligence (a.i.)
113	saving the world
114	hacker
115	self sacrifice
116	virtual reality
117	fight
118	prophecy
119	truth
120	philosophy
121	dystopia
122	insurgence
123	simulated reality 
124	cyberpunk
125	dream world
126	messiah
127	action hero
128	gnosticism
129	allegory of the cave
130	army
132	orcs
133	elves
134	dwarf
135	magic
136	kingdom
137	obsession
138	bravery
139	castle
140	volcano
141	giant spider
142	sequel
143	honor
144	king
145	brutality
146	madness
147	split personality
148	fantasy world
149	wizard
150	epic battle
151	journey
152	ring
153	quest
154	live action and animation
155	hero's journey
156	high fantasy
157	wraith
158	sword and sorcery
159	power madness
160	great war
161	trekking
162	good versus evil
163	sword making
164	war
165	backstory
166	creatures
167	epic quest
168	winged creatures
169	hobbits
170	armies
171	spirits
172	army of the dead
173	rebellion
174	android
175	spacecraft
176	asteroid
177	rebel
178	space battle
179	snowstorm
180	space colony
181	swamp
182	space opera
183	nostalgic
184	artic
185	dual identity
186	rage and hate
188	nihilism
190	support group
192	insomnia
193	alter ego
194	breaking the fourth wall
196	quitting a job
197	dissociative identity disorder
198	self destructiveness
199	rescue
200	mission
202	airplane
203	paris, france
205	kidnapping
207	spy
208	allegory
209	manipulation
210	car crash
211	heist
212	memory
213	architecture
216	subconscious
217	africa
218	lion
219	prince
221	musical
222	uncle
223	remake
224	grief
226	family
227	sidekick
229	father son relationship
230	live action remake
232	florida
233	new york city
235	gangster
236	mass murder
237	drug trafficking
239	irish-american
240	gore
241	biography
242	based on true story
243	murder
246	brooklyn, new york city
247	crime epic
248	tampa, florida
249	epic
250	gladiator
251	rome, italy
252	arena
253	senate
254	roman empire
256	emperor
257	slavery
258	ancient rome
259	revenge
260	battlefield
261	slave auction
262	historical fiction
263	ancient world
264	combat
265	chariot
266	philosopher
267	barbarian horde
268	2nd century
269	successor
270	commodus
271	maximus
272	grand
273	italian american
274	cuba
277	praise
283	suburb
284	corrupt politician
285	aggressive
286	malicious
288	inflammatory
289	informative
291	burglar
292	hostage
296	villainess
297	time bomb
299	cover-up
302	mobile
303	terrorism
304	destruction
305	fighting
306	criminal underworld
307	cat burglar
308	flood
309	flying car
310	race against time
311	clock tower
312	car race
313	lightning
314	guitar
315	plutonium
316	inventor
317	journey in the past
318	invention
319	time travel
320	bullying
321	mad scientist
322	love
323	fish out of water
325	teenage love
326	destiny
328	hidden identity
329	teenage life
330	changing the past or future
332	playful
333	suspenseful
335	optimistic
336	cientifico loco
337	factory
338	hero
339	nazi
340	concentration camp
341	ss (nazi schutzstaffel)
342	holocaust (shoah)
343	world war ii
344	ghetto
345	jew persecution
346	kraków, poland
347	defense industry
348	auschwitz-birkenau concentration camp
351	industrialist
353	black and white
354	train
355	poland
356	weapons manufacturer
357	earnest
358	empire
359	galaxy
362	hermit
363	smuggling (contraband)
364	freedom
366	rescue mission
367	space
368	planet
369	desert
371	oppression
374	totalitarianism
375	police
376	undercover
377	boston, massachusetts
381	friends
383	mobster
386	undercover cop
387	mole
388	biting
389	state police
390	police training
391	realtor
392	angry
393	desperate
394	frightened
397	southern usa
398	psychopath
399	death row
400	jail guard
401	supernatural
402	great depression
403	prison guard
404	jail
405	electric chair
406	torture
407	magic realism
408	healing
409	shocking
410	hopeless
411	grim
412	1930s
413	abuse of power
414	inspirational
415	authoritarian
416	demeaning
417	pessimistic
418	dying and death
419	suicide
420	class society
421	london, england
423	competition
425	hostility
426	class
427	diary
428	twist
429	tricks
430	illusion
431	rivalry
432	partner
433	steampunk
434	cruelty
435	hanging
436	jail cell
437	19th century
438	nikola tesla
439	magician
440	tesla coil
441	bittersweet
442	secret
443	absurd
444	mind-blowing
446	robbery
447	affectation
448	relatives
450	flashback
451	police corruption
452	whodunit
455	criminal
457	cargo ship
458	mind game
461	mystery villain
463	incredulous
467	fbi
468	scientific study
470	serial killer
471	psychological thriller
473	cannibal
474	psychiatrist
475	cynical
476	moth
477	virginia
479	twisted
480	skinning
481	past history
483	horrified
484	psychological profiling
486	future
490	nasa
491	time warp
493	expedition
494	space travel
495	wormhole
496	famine
497	black hole
498	quantum mechanics
501	robot
502	astronaut
503	scientist
504	single father
505	farmer
506	space station
507	space adventure
508	time paradox
509	time-manipulation
510	father daughter relationship
511	2060s
512	cornfield
513	time manipulation
517	ex-girlfriend
518	harvard university
519	narcissism
521	hacking
523	twins
524	double cross
525	creator
526	frat party
527	social network
528	deposition
529	intellectual property
530	entrepreneur
531	arrogance
532	social media
533	young entrepreneur
534	facebook
535	legal drama
538	escape
539	love triangle
540	resistance
542	patriotism
543	casablanca, morocco
544	vichy regime
545	visa
546	nationalism
548	morocco
549	film noir
551	media tycoon
553	art collector
554	newspaper
555	capitalist
556	journalist
557	sleigh
558	banker
559	american dream
560	failure
561	money
562	snowglobes
563	child
564	pretentious
565	based on real person
566	death penalty
567	anonymity
568	court case
569	court
570	judge
571	jurors
572	father murder
574	heat
575	innocence
576	puerto rico
577	based on play or musical
578	courtroom
579	hostile
580	courtroom drama
581	cautionary
582	antagonistic
583	callous
584	doubtful
585	skeptical
588	street gang
589	great britain
593	society
594	sexuality
595	social worker
598	dark comedy
599	satire
600	beating
601	juvenile delinquent
602	home invasion
603	sex crime
604	futuristic society
605	ultraviolence
606	social decay
607	powerful
608	hotel
609	child abuse
611	isolation
612	telepathy
613	delusion
614	grave
615	halloween
617	colorado
618	seclusion
619	surrealism
620	alcoholism
621	premonition
622	psychic power
623	caretaker
624	loneliness
625	vision
626	domestic violence
627	postmodern
629	writer
631	labyrinth
632	alcoholic
633	blizzard
634	mutilation
635	bloody body of child
636	extrasensory perception
637	uxoricide
638	motherhood
639	filicide
640	snowed in
641	burial ground
642	hypothermia
643	haunted hotel
644	psychological disintegration
645	paranoid
646	vexed
647	afi
648	frantic
649	pediatrician
650	repetition
653	supernatural power
654	supernatural horror
655	ghost child
656	psychotronic film
657	writers-block
658	cabin fever
659	psychological horror
660	negative
661	deal with the devil
662	nuclear family
663	avant garde
664	yosemite national park
665	twin sisters
666	identical twins
667	arrogant
668	assertive
670	enraged
671	frustrated
672	harsh
673	mean spirited
674	sardonic
676	concert
677	jazz
678	musician
680	music teacher
681	conservatory
682	drums
683	montage
684	perfectionist
685	perfection
686	public humiliation
687	jazz band
688	young adult
689	music school
690	based on short
691	drummer
692	rape
695	winter
696	child murder
697	mountain
698	grizzly bear
699	animal attack
700	wilderness
702	native american
703	forest
705	liar
706	fur trapping
707	frontier
710	survival
712	bear
713	snow
714	scalping
715	animals
716	nature
717	wild west
718	bear attack
719	indian attack
721	starvation
723	wolves
724	ice
726	neo-nazism
728	skinhead
729	sibling relationship
730	swastika
731	brother
732	fascism
734	school
737	xenophobia
739	nazism
742	s.w.a.t.
744	self-fulfilling prophecy
746	detective
747	investigation
752	seven deadly sins
753	depravity
762	fireworks
763	mine
764	maze
767	birthday party
768	battle
769	demon
771	uncle nephew relationship
775	invisibility
783	awestruck
784	excited
787	trolls
792	underground world
794	kung fu
798	computer
800	computer virus
804	faith
806	key
808	plato
809	precognition
810	rave
815	oracle
823	machine town
828	fortune teller
832	flying
833	temple
841	killer robot
842	subway
844	sun
845	sunlight
847	super computer
848	ying yang
854	ship
855	drowning
856	panic
857	shipwreck
858	evacuation
859	iceberg
860	titanic
861	forbidden love
862	ocean liner
864	rich woman poor man
866	tragedy
867	tragic love
868	disaster
870	class differences
871	love affair
872	historical event
873	lifeboat
874	star crossed lovers
875	sinking ship
876	steerage
877	rich snob
878	disaster movie
879	1910s
880	sunken ship
881	intimate
882	intense
886	time machine
889	alien invasion
890	superhero team
891	marvel cinematic universe (mcu)
892	alternate timeline
894	sister sister relationship
897	baffled
899	vibrant
902	based on graphic novel
904	dreary
905	exotic island
906	island
907	triceratops
908	brontosaurus
909	electric fence
910	dna
911	tyrannosaurus rex
912	paleontology
913	dinosaur
914	amusement park
915	theme park
919	villain
922	supervillain
925	superhero family
928	aftercreditsstinger
929	alternate universe
932	showdown
938	portal
942	masked vigilante
943	spider web
944	alternative reality
946	duringcreditsstinger
948	fight for justice
949	teen superhero
950	superhero teamup
951	returning hero
952	crossover
953	teamwork
958	con man
959	fraud
960	wall street
962	rise and fall
963	con artist
965	stockbroker
966	wealthy
967	drugs
969	stripping
970	hedonism
971	decadence
972	taunting
973	corrupt
975	1980s
976	sharemarket fraud
977	desire for fame
978	financial market
979	fame-seeking
980	black monday
982	hilarious
984	disrespectful
991	attempted jailbreak
992	engagement party
993	mislaid trust
994	christmas
995	bank fraud
997	irreverent
998	dramatic
1011	reincarnation
1015	guide
1017	marsh
1027	complex
1029	evil spell
1032	trees
1036	white russian
1037	bowling
1038	carpet
1040	heart attack
1042	lsd
1043	marijuana
1045	millionaire
1046	cowboy
1047	ashes
1048	impregnation
1049	bowling team
1050	unemployed
1051	bowling ball
1053	weeds
1054	new year's eve
1055	jealousy
1056	loss of sense of reality
1057	screenwriter
1058	butler
1060	diva
1062	hollywood
1066	aging actor
1067	has been
1068	silent film star
1069	grandiose  behavior
1070	kept man
1071	movie studio
1072	bitter
1073	schizophrenia
1075	love of one's life
1076	professor
1077	intelligence
1078	paranoia
1079	mathematics
1080	massachusetts
1081	mathematician
1082	market economy
1083	economic theory
1084	princeton university
1085	nobel prize
1086	mathematical theorem
1088	genius
1091	teacher
1092	conspiracy
1093	code breaking
1094	university
1095	math genius
1096	savant
1097	biopic
1101	suspicion
1102	video surveillance
1103	deception
1104	hidden camera
1106	television producer
1107	tv show in film
1108	questioning
1109	make believe
1110	reflective
1111	tv show
1112	actor
1113	dignified
1116	painting
1117	wartime
1118	eastern europe
1119	author
1120	gunfight
1122	bellboy
1123	mentor protégé relationship
1124	european
1125	hotel lobby
1126	renaissance painting
1129	admiring
1130	cheerful
1132	witch
1133	adolescence
1138	tornado
1139	twister
1143	kansas, usa
1144	imaginary land
1145	cowardliness
1146	monkey
1147	female villain
1150	sepia color
1151	hourglass
1152	red shoes
1153	based on young adult novel
1154	tin man
1155	wicked
1156	whimsical
1157	adoring
1158	bold
1160	exuberant
1161	oz
1162	wizard of oz
1163	wonderful wizard of oz
1164	guerrilla warfare
1170	dynamite
1171	mexican standoff
1174	masochism
1175	anti-semitism
1176	german occupation of france
1177	british politics
1178	revisionist history
1180	adolf hitler
1183	bank
1188	finances
1189	animated scene
1191	loan
1192	financial crisis
1193	real estate
1194	mortgage
1195	civil war
1197	marriage crisis
1199	widow
1200	atlanta
1202	plantation
1203	typhus
1204	romance
1205	casualty of war
1206	second marriage
1207	american civil war
1208	technicolor
1209	reconstruction era
1210	businesswoman
1211	1860s
1212	1870s
1213	antebellum south
1214	compassionate
1216	daughter
1218	helicopter
1219	assassination
1223	christianity
1224	vatican
1225	pope
1226	confession
1232	catholic church
1233	depressing
1234	high school
1235	coming of age
1236	teen angst
1237	detention
1238	teenage rebellion
1239	stereotype
1241	teenager
1242	wry
1243	sports
1247	family business 
1248	dysfunctional family
1249	family conflict
1250	hometown
1251	boxing trainer
1252	crack addict
1253	lowell massachusetts
1254	jumping rope
1255	shadow boxing
1256	boxing
1257	boxer hero
1258	professional athlete
1259	black sheep
1260	devoted girlfriend
1261	local hero
1263	religion and supernatural
1264	exorcism
1265	holy water
1266	paranormal phenomena
1267	possession
1268	vomit
1269	satan
1270	priest
1271	ouija board
1273	strong language
1275	demonic possession
1276	disturbed child
1277	crisis of faith
1278	sfx
1279	religious horror
1284	taxi
1285	pornography
1287	taxi driver
1288	pimp
1289	firearm
1290	politician
1291	alienation
1292	junk food
1293	misanthrophy
1295	illegal prostitution
1296	character study
1297	loner
1298	manhattan, new york city
1300	child prostitution
1301	new hollywood
1302	drives
1306	laser gun
1307	cyborg
1309	shotgun
1314	slasher
1316	urban setting
1317	future war
1318	savior
1319	tech noir
1322	griffith observatory
1326	bounty hunter
1328	genetics
1331	melancholy
1332	futuristic
1333	fugitive
1338	meditative
1340	blade runner
1341	2010s
1342	introspective
1345	mercenary
1349	sacrifice
1355	genocide
1356	magical object
1360	cosmic
1362	planet mars
1366	botanist
1367	alone
1370	engineering
1371	stranded
1373	struggle for survival
1375	deep space
1376	thoughtful
1377	potatoes
1378	2030s
1381	australia
1382	chase
1384	post-apocalyptic future
1386	on the run
1387	on the road
1388	convoy
1389	peak oil
1390	dark future
1391	post-apocalyptic
1394	narration
1395	wrestling
1396	miracle
1397	sword fight
1399	boat chase
1400	pirate
1401	wedding
1402	swashbuckler
1403	evil prince
1404	screwball
1405	impersonation
1406	giant man
1407	story within the story
1409	fictitious country
1410	grandfather grandson relationship
1411	battle of wits
1413	romantic
1414	hotel room
1416	immigrant
1417	assassin
1421	hitman
1423	training
1427	neighbor
1429	city life
1431	complex relationship
1435	miami, florida
1439	cocaine
1442	drug cartel
1444	drug lord
1445	bitterness
1447	miami beach
1448	cuban refugees
1449	drug war
1459	raccoon
1464	outer space
1465	chosen family
1468	space marine
1469	biology
1471	countdown
1472	space suit
1473	beheading
1475	cowardice
1476	alien
1478	female protagonist
1479	parasite
1481	cosmos
1482	xenomorph
1485	hurricane
1487	u.s. marshal
1488	conspiracy theory
1489	psychiatric hospital
1496	amnesia
1497	insulin
1498	tattoo
1500	insurance salesman
1501	motel
1504	confusion
1507	memory loss
1511	polaroid
1512	based on short story
1514	individuality
1515	phone call
1517	reverse chronology
1518	gold
1522	refugee
1524	moral ambiguity
1525	gallows
1526	outlaw
1527	shootout
1528	spaghetti western
1530	tense
1531	himalaya mountain range
1532	photographer
1533	iceland
1534	daydream
1535	magazine
1536	photograph
1537	shark
1538	fired from the job
1539	dreamer
1540	online dating
1541	daydreaming
1543	sheriff
1544	trailer park
1549	texas
1551	usa–mexico border
1553	fate
1555	modern-day western
1556	neo-western
1557	tracking device
1558	cold blooded killer
1559	motel room
1561	cartel
1564	mexican cartel
1565	drug deal
1566	coin toss
1567	human nature
1568	captive bolt gun
1569	western noir
1570	horror western
1571	faithful adaptation
1573	cruel
1574	foreboding
1576	small town
1579	cold war
1581	meteorite
1582	giant robot
1583	autumn
1584	fear of unknown
1588	beach
1590	bathing
1592	fishing
1593	atlantic ocean
1594	shark attack
1595	police chief
1596	ferry boat
1598	long island, new york
1599	dead child
1600	creature
1601	skinny dipping
1603	great white shark
1604	dead dog
1605	child killed by animal
1606	fourth of july
1607	severed leg
1608	fishing boat
1609	animal horror
1610	shark cage
1614	alcohol
1616	nerd
1621	buddy
1622	one night
1623	fake id
1624	serene
1627	journalism
1628	sexism
1629	ladder
1630	panda
1632	mustache
1633	screwball comedy
1634	battle of the sexes
1635	misogynist
1636	teleprompter
1637	gang warfare
1640	news spoof
1641	blackjack
1642	stag night
1643	lost weekend
1644	chapel
1645	hit with tire iron
1647	las vegas
1654	celebratory
1655	farcical
1656	宿醉
1657	holy grail
1658	swordplay
1659	england
1660	monk
1661	wedding reception
1662	scotland yard
1663	midnight movie
1665	camelot
1666	round table
1667	chapter
1669	parody
1671	knight
1672	king arthur
1673	knights of the round table
1674	10th century
1675	anarchic comedy
1677	deja vu
1678	groundhog
1679	weather forecast
1680	telecaster
1681	pennsylvania, usa
1682	alarm clock
1685	holiday
1686	time loop
1688	existentialism
1689	groundhog day
1691	gas station
1692	utah
1694	stupidity
1695	cigar smoking
1696	road trip
1697	pill
1698	prank
1702	clumsiness
1703	stepparent stepchild relationship
1704	aspen colorado
1705	parakeet
1706	defecation
1707	scooter
1708	endangered species
1709	foolish
1710	laxative
1711	presidential election
1713	mockery
1714	kazakhstan
1718	mockumentary
1720	social satire
1721	disguise
1722	covid-19
1723	chicago, illinois
1725	independence
1727	caper
1729	teen movie
1730	fantasy sequence
1731	car theft
1732	skipping school
1736	truancy
1737	day in a life
1742	witty
1747	surrey
1749	slacker
1752	zombie
1754	survival horror
1755	british pub
1756	boyfriend girlfriend relationship
1758	zombie apocalypse
1760	satirical
1762	anxious
1768	defiant
1771	becoming an adult
1773	autonomy
1774	childhood trauma
1775	stepbrother
1777	man child
1787	male friendship
1789	jock
1790	crude humor
1792	high school student
1793	police academy
1794	buddy cop
1795	buddy comedy
1797	high school rivalry
1798	bicycle cop
1799	based on tv series
1801	cops
1802	party drugs
1803	high school classmates
1804	smoking
1805	witness
1806	cannabis
1808	stoner
1809	roach
1810	painting toenails
1811	radio call in show
1812	seed
1813	stoner movie
1814	vietnam
1815	movie business
1818	jungle
1819	movie star
1820	southeast asia
1821	land mine
1822	shackles
1824	blackface
1825	method acting
1827	cake
1828	sailing
1829	fake identity
1831	lying
1832	countryside
1834	village
1835	arrest
1839	rural area
1843	police force
1845	accident
1850	materialism
1851	bridesmaid
1852	female friendship
1853	sexual humor
1854	wealth
1855	fear of commitment
1856	wedding party
1857	best friend
1858	maid of honor
1859	drunk
1860	wedding dress
1861	group of friends
1862	missing person
1863	casual sex
1864	vanity
1865	girl fight
1866	out of control
1869	highway
1870	radio
1871	cop
1872	broken lizard
1873	drug humor
1876	vermont
1877	state trooper
1880	shenanigans
1881	first time
1882	virgin
1884	co-workers relationship
1885	poker game
1886	sex comedy
1887	virginity
1888	sex
1889	forgiveness
1890	cigarette
1891	child prodigy
1892	terminal illness
1894	incest
1899	cataclysm
1902	stewardess
1904	passenger
1905	fear of flying
1906	pilot
1907	medicine
1908	air controller
1909	landing
1910	saxophone
1911	autopilot
1913	spoof
1914	food poisoning
1916	alcohol abuse
1918	inflatable life raft
1921	dolphin
1923	human animal relationship
1925	mascot
1926	slapstick comedy
1928	private detective
1929	pets
1930	governor
1931	saloon
1932	gun
1934	marching band
1937	racism
1938	railroad
1939	interrupted hanging
1941	western town
1942	western spoof
1943	ceremony
1944	frontier town
1945	saloon girl
1946	coot
1947	self-referential
1949	anachronistic
1950	farting
1954	underwear
1955	golf
1958	explosion
1959	country club
1961	environmental protection agency
1962	library
1965	loser
1966	slime
1967	gatekeeper
1969	giant monster
1970	haunting
1971	hybrid
1973	mythology
1974	horror spoof
1975	paranormal investigation
1978	receptionist
1979	world trade center
1980	ghost
1982	ghostbusters
1993	space mission
1995	altar
1996	magnet beam
1997	speed of light
1998	plastic surgery
1999	password
2002	gross out comedy
2005	aquarium
2006	baseball
2011	illegal drugs
2012	criminal investigation
2014	hypnotize
2018	salesclerk
2019	work
2026	workplace comedy
2028	blow
2029	neominstrelsy
2030	phone book
2031	sharecropper
2032	tennis court
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.language (language_id, language_name, language_code) FROM stdin;
1	English	en
3	Italiano	it
4	Latin	la
6	普通话	zh
8	Español	es
9	Français	fr
17	日本語	ja
18	Kiswahili	sw
29	Deutsch	de
30	Polski	pl
31	עִבְרִית	he
35	广州话 / 廣州話	cn
42	Magyar	hu
67	svenska	sv
69	Pусский	ru
72		xh
75	Português	pt
116	العربية	ar
117	ελληνικά	el
148	Íslenska	is
164	български език	bg
165	Hrvatski	hr
169	Română	ro
177	한국어/조선말	ko
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie (movie_id, title, description, rating, release_year, imdb_id, tmdb_id, content_rating, watchmode_id, akas, runtime) FROM stdin;
1	The Shawshank Redemption	A banker convicted of uxoricide forms a friendship over a quarter century with a hardened convict, while maintaining his innocence and trying to remain hopeful through simple compassion.	9.3	1994	tt0111161	278	R	\N	{"The Shawshank Redemption","Fear can hold you prisoner. Hope can set you free."}	142 min
2	The Godfather	The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.	9.2	1972	tt0068646	238	R	\N	{"The Godfather","An offer you can't refuse."}	175 min
3	The Dark Knight	When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.	9	2008	tt0468569	155	PG-13	\N	{"The Dark Knight","Welcome to a world without rules."}	152 min
4	Pulp Fiction	The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.	8.9	1994	tt0110912	680	R	\N	{"Pulp Fiction","You won't know the facts until you've seen the fiction."}	154 min
5	Forrest Gump	The history of the United States from the 1950s to the '70s unfolds from the perspective of an Alabama man with an IQ of 75, who yearns to be reunited with his childhood sweetheart.	8.8	1994	tt0109830	13	PG-13	\N	{"Forrest Gump","The world will never be the same once you've seen it through the eyes of Forrest Gump."}	142 min
6	The Matrix	When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.	8.7	1999	tt0133093	603	R	\N	{"The Matrix","The fight for the future begins."}	136 min
7	The Lord of the Rings: The Return of the King	Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.	9	2003	tt0167260	122	PG-13	\N	{"The Lord of the Rings: The Return of the King","There can be no triumph without loss. No victory without suffering. No freedom without sacrifice."}	201 min
8	Star Wars: Episode V - The Empire Strikes Back	After the Empire overpowers the Rebel Alliance, Luke Skywalker begins his Jedi training with Yoda. At the same time, Darth Vader and bounty hunter Boba Fett pursue his friends across the galaxy.	8.7	1980	tt0080684	1891	PG	\N	{"The Empire Strikes Back","The Star Wars saga continues."}	124 min
9	Fight Club	An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.	8.8	1999	null	550	R	\N	{"Fight Club","Mischief. Mayhem. Soap."}	139 min
10	Inception	A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.	8.8	2010	tt1375666	27205	PG-13	\N	{Inception,"Your mind is the scene of the crime."}	148 min
11	The Lion King	Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.	8.5	1994	tt0110357	420818	G	\N	{"The Lion King","The king has returned."}	88 min
12	Goodfellas	The story of Henry Hill and his life in the mafia, covering his relationship with his wife Karen and his mob partners Jimmy Conway and Tommy DeVito.	8.7	1990	tt0099685	769	R	\N	{GoodFellas,"Three decades of life in the mafia."}	145 min
13	Gladiator	A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.	8.5	2000	null	98	R	\N	{Gladiator,"What we do in life echoes in eternity."}	155 min
14	The Godfather Part II	The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.	9	1974	tt0071562	240	R	\N	{"The Godfather Part II","The rise and fall of the Corleone empire."}	202 min
15	The Dark Knight Rises	Bane, an imposing terrorist, attacks Gotham City and disrupts its eight-year-long period of peace. This forces Bruce Wayne to come out of hiding and don the cape and cowl of Batman again.	8.4	2012	tt1345836	49026	PG-13	\N	{"The Dark Knight Rises","A fire will rise."}	164 min
16	Back to the Future	Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, the maverick scientist Doc Brown.	8.5	1985	tt0088763	105	PG	\N	{"Back to the Future","He was never in time for his classes. He wasn't in time for his dinner. Then one day...he wasn't in his time at all."}	116 min
17	Schindler's List	In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.	9	1993	tt0108052	424	R	\N	{"Schindler's List","Whoever saves one life, saves the world entire."}	195 min
18	Star Wars: Episode IV - A New Hope	Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire's world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth ...	8.6	1977	tt0076759	11	PG	\N	{"Star Wars","A long time ago in a galaxy far, far away..."}	121 min
19	The Departed	An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.	8.5	2006	tt0407887	1422	R	\N	{"The Departed","Cops or criminals. When you’re facing a loaded gun, what’s the difference?"}	151 min
20	The Green Mile	A tale set on death row, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the lead guard, Paul Edgecombe, recognizes John's gift, he tries to help stave off the condemned man's execution.	8.6	1999	tt0120689	497	R	\N	{"The Green Mile","Paul Edgecomb didn't believe in miracles. Until the day he met one."}	189 min
21	The Prestige	After a tragic accident, two stage magicians in 1890s London engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.	8.5	2006	tt0482571	1124	PG-13	\N	{"The Prestige","Are You Watching Closely?"}	130 min
22	The Usual Suspects	The sole survivor of a pier shoot-out tells the story of how a notorious criminal influenced the events that began with five criminals meeting in a seemingly random police lineup.	8.5	1995	tt0114814	629	R	\N	{"The Usual Suspects","Five criminals. One line up. No coincidence."}	106 min
23	The Silence of the Lambs	A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.	8.6	1991	tt0102926	274	R	\N	{"The Silence of the Lambs","To enter the mind of a killer she must challenge the mind of a madman."}	118 min
24	Interstellar	When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.	8.7	2014	tt0816692	157336	PG-13	\N	{Interstellar,"Mankind was born on Earth. It was never meant to die here."}	169 min
25	The Social Network	As Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, he is sued by the twins who claimed he stole their idea and by the co-founder who was later squeezed out of the business.	7.8	2010	tt1285016	37799	PG-13	\N	{"The Social Network","You don't get to 500 million friends without making a few enemies."}	120 min
26	Casablanca	A cynical expatriate American cafe owner struggles to decide whether or not to help his former lover and her fugitive husband escape the Nazis in French Morocco.	8.5	1942	tt0034583	289	PG	\N	{Casablanca,"They had a date with fate in Casablanca!"}	102 min
27	Citizen Kane	Following the death of publishing tycoon Charles Foster Kane, reporters scramble to uncover the meaning of his final utterance: 'Rosebud.'	8.3	1941	tt0033467	15	PG	\N	{"Citizen Kane","Some called him a hero...others called him a heel."}	119 min
28	12 Angry Men	The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.	9	1957	tt0050083	389	Approved	\N	{"12 Angry Men","Life is in their hands — Death is on their minds!"}	96 min
29	A Clockwork Orange	Alex DeLarge and his droogs barbarize a decaying near-future.	8.2	1971	tt0066921	185	R	\N	{"A Clockwork Orange","Being the adventures of a young man whose principal interests are rape, ultra-violence and Beethoven."}	136 min
30	The Shining	A family heads to an isolated hotel for the winter, where a sinister presence influences the father into violence. At the same time, his psychic son sees horrifying forebodings from both the past and the future.	8.4	1980	tt0081505	694	R	\N	{"The Shining","A masterpiece of modern horror."}	146 min
31	Whiplash	A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student's potential.	8.5	2014	tt2582802	244786	R	\N	{Whiplash,"The road to greatness can take you to the edge."}	106 min
32	The Revenant	A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.	8	2015	tt1663202	281957	R	\N	{"The Revenant","Blood lost. Life found."}	156 min
33	American History X	Living a life marked by violence, neo-Nazi Derek finally goes to prison after killing two black youths. Upon his release, Derek vows to change; he hopes to prevent his brother, Danny, who idolizes Derek, from following in his foot...	8.5	1998	tt0120586	73	R	\N	{"American History X","Some Legacies Must End."}	119 min
34	Se7en	Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.	8.6	1995	tt0114369	807	R	\N	{Se7en,"Seven deadly sins. Seven ways to die."}	127 min
35	The Lord of the Rings: The Fellowship of the Ring	A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.	8.9	2001	tt0120737	120	PG-13	\N	{"The Lord of the Rings: The Fellowship of the Ring","One ring to rule them all."}	178 min
36	The Matrix Reloaded	Freedom fighters Neo, Trinity and Morpheus continue to lead the revolt against the Machine Army, unleashing their arsenal of extraordinary skills and weaponry against the systematic forces of repression and exploitation.	7.2	2003	tt0234215	604	R	\N	{"The Matrix Reloaded","Free your mind."}	138 min
37	The Matrix Revolutions	The human city of Zion defends itself against the massive invasion of the machines as Neo fights to end the war at another front while also opposing the rogue Agent Smith.	6.7	2003	tt0242653	605	R	\N	{"The Matrix Revolutions","Everything that has a beginning has an end."}	129 min
38	Titanic	A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.	7.9	1997	tt0120338	597	PG-13	\N	{Titanic,"Nothing on Earth could come between them."}	194 min
39	Avengers: Endgame	After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.	8.4	2019	tt4154796	299534	PG-13	\N	{"Avengers: Endgame","Avenge the fallen."}	181 min
40	Batman: The Dark Knight Returns, Part 1	Batman has not been seen for ten years. A new breed of criminal ravages Gotham City, forcing 55-year-old Bruce Wayne back into the cape and cowl. But, does he still have what it takes to fight crime in a new era?	8	2012	tt2313197	123025	PG-13	\N	{"Batman: The Dark Knight Returns, Part 1","Old heroes never die. They just get darker."}	76 min
41	Jurassic Park	An industrialist invites some experts to visit his theme park of cloned dinosaurs. After a power failure, the creatures run loose, putting everyone's lives, including his grandchildren's, in danger.	8.2	1993	tt0107290	329	PG-13	\N	{"Jurassic Park","An adventure 65 million years in the making."}	127 min
42	The Incredibles	While trying to lead a quiet suburban life, a family of undercover superheroes are forced into action to save the world.	8	2004	tt0317705	9806	PG	\N	{"The Incredibles","No gut, no glory."}	115 min
43	Spider-Man: Into the Spider-Verse	Teen Miles Morales becomes the Spider-Man of his universe and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.	8.4	2018	tt4633694	324857	PG	\N	{"Spider-Man: Into the Spider-Verse","More than one wears the mask."}	117 min
44	Spider-Man: No Way Home	With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear.	8.2	2021	tt10872600	634649	PG-13	\N	{"Spider-Man: No Way Home","The Multiverse unleashed."}	148 min
45	The Wolf of Wall Street	Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.	8.2	2013	tt0993846	106646	R	\N	{"The Wolf of Wall Street","Earn. Spend. Party."}	180 min
46	Catch Me If You Can	Barely 17 yet, Frank is a skilled forger who has passed as a doctor, lawyer and pilot. FBI agent Carl becomes obsessed with tracking down the con man, who only revels in the pursuit.	8.1	2002	tt0264464	640	PG-13	\N	{"Catch Me If You Can","The true story of a real fake."}	141 min
47	The Lord of the Rings: The Two Towers	While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron's new ally, Saruman, and his hordes of Isengard.	8.8	2002	tt0167261	121	PG-13	\N	{"The Lord of the Rings: The Two Towers","The fellowship is broken. The power of darkness grows..."}	179 min
48	The Big Lebowski	Jeff "The Dude" Lebowski, mistaken for a millionaire of the same name, seeks restitution for his ruined rug and enlists his bowling buddies to help get it.	8.1	1998	tt0118715	115	R	\N	{"The Big Lebowski","They figured he was a lazy, time-wasting slacker. They were right."}	117 min
49	Sunset Boulevard	A screenwriter develops a dangerous relationship with a faded film star determined to make a triumphant return.	8.4	1950	tt0043014	599	Approved	\N	{"Sunset Boulevard","A Hollywood Story."}	110 min
50	A Beautiful Mind	A mathematical genius, John Nash made an astonishing discovery early in his career and stood on the brink of international acclaim. But the handsome and arrogant Nash soon found himself on a harrowing journey of self-discovery.	8.2	2001	tt0268978	453	PG-13	\N	{"A Beautiful Mind","He saw the world in a way no one could have imagined."}	135 min
51	The Truman Show	An insurance salesman discovers his whole life is actually a reality TV show.	8.2	1998	tt0120382	37165	PG	\N	{"The Truman Show","On the air. Unaware."}	103 min
52	The Grand Budapest Hotel	A writer encounters the owner of an aging high-class hotel, who tells him of his early years serving as a lobby boy in the hotel's glorious years under an exceptional concierge.	8.1	2014	tt2278388	120467	R	\N	{"The Grand Budapest Hotel","A murder case of Madam D. with enormous wealth and the most outrageous events surrounding her sudden death!"}	99 min
53	The Wizard of Oz	Young Dorothy Gale and her dog Toto are swept away by a tornado from their Kansas farm to the magical Land of Oz and embark on a quest with three new friends to see the Wizard, who can return her to her home and fulfill the others...	8.1	1939	tt0032138	630	G	\N	{"The Wizard of Oz","We're off to see the Wizard, the wonderful Wizard of Oz!"}	102 min
54	Inglourious Basterds	In Nazi-occupied France during World War II, a plan to assassinate Nazi leaders by a group of Jewish U.S. soldiers coincides with a theatre owner's vengeful plans for the same.	8.4	2009	tt0361748	16869	R	\N	{"Inglourious Basterds","A basterd's work is never done."}	153 min
55	The Big Short	In 2006-2007 a group of investors bet against the United States mortgage market. In their research, they discover how flawed and corrupt the market is.	7.8	2015	tt1596363	318846	R	\N	{"The Big Short","This is a true story."}	130 min
56	Gone with the Wind	A sheltered and manipulative Southern belle and a roguish profiteer face off in a turbulent romance as the society around them crumbles with the end of slavery and is rebuilt during the Civil War and Reconstruction periods.	8.2	1939	tt0031381	770	G	\N	{"Gone with the Wind","The greatest romance of all time!"}	238 min
57	The Godfather Part III	Follows Michael Corleone, now in his 60s, as he seeks to free his family from crime and find a suitable successor to his empire.	7.6	1990	tt0099674	242	R	\N	{"The Godfather Part III","All the power on earth can't change destiny."}	162 min
58	The Breakfast Club	Five high school students meet in Saturday detention and discover how they have a great deal more in common than they thought.	7.8	1985	tt0088847	2108	R	\N	{"The Breakfast Club","They only met once, but it changed their lives forever."}	97 min
59	The Fighter	Based on the story of Micky Ward, a fledgling boxer who tries to escape the shadow of his more famous but troubled older boxing brother and get his own shot at greatness.	7.8	2010	tt0964517	45317	R	\N	{"The Fighter","Every dream deserves a fighting chance."}	116 min
60	The Exorcist	When a mysterious entity possesses a young girl, her mother seeks the help of two Catholic priests to save her life.	8.1	1973	tt0070047	9552	R	\N	{"The Exorcist","Something almost beyond comprehension is happening to a girl on this street, in this house… and a man has been sent for as a last resort. This man is The Exorcist."}	122 min
61	Taxi Driver	A mentally unstable veteran works as a nighttime taxi driver in New York City, where the perceived decadence and sleaze fuels his urge for violent action.	8.2	1976	tt0075314	103	R	\N	{"Taxi Driver","On every street in every city, there's a nobody who dreams of being a somebody."}	114 min
62	The Terminator	A cyborg assassin from the future attempts to find and kill a young woman who is destined to give birth to a warrior who will lead a resistance to save humankind from extinction.	8.1	1984	tt0088247	218	R	\N	{"The Terminator","Your future is in its hands."}	107 min
63	Blade Runner	A blade runner must pursue and terminate four replicants who stole a ship in space and have returned to Earth to find their creator.	8.1	1982	tt0083658	78	R	\N	{"Blade Runner","Man has made his match...now it's his problem."}	117 min
64	Deadpool	A wisecracking mercenary gets experimented on and becomes immortal yet hideously scarred, and sets out to track down the man who ruined his looks.	8	2016	tt1431045	293660	R	\N	{Deadpool,"Feel the love."}	108 min
65	Avengers: Infinity War	The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.	8.4	2018	tt4154756	299536	PG-13	\N	{"Avengers: Infinity War","An entire universe. Once and for all."}	149 min
66	The Martian	An astronaut becomes stranded on Mars after his team assume him dead, and must rely on his ingenuity to find a way to signal to Earth that he is alive and can survive until a potential rescue.	8	2015	tt3659388	286217	PG-13	\N	{"The Martian","Bring him home"}	144 min
67	Mad Max: Fury Road	In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search for her homeland with the aid of a group of female prisoners, a psychotic worshipper and a drifter named Max.	8.1	2015	tt1392190	76341	R	\N	{"Mad Max: Fury Road","The future belongs to the mad."}	120 min
68	The Princess Bride	A bedridden boy's grandfather reads him the story of a farmboy-turned-pirate who encounters numerous obstacles, enemies and allies in his quest to be reunited with his true love.	8	1987	tt0093779	2493	PG	\N	{"The Princess Bride","It's as real as the feelings you feel."}	98 min
69	Léon: The Professional	12-year-old Mathilda is reluctantly taken in by Léon, a professional assassin, after her family is murdered. An unusual relationship forms as she becomes his protégée and learns the assassin's trade.	8.5	1994	tt0110413	101	R	\N	{"Léon: The Professional","If you want the job done right, hire a professional."}	110 min
70	Scarface	Miami in the 1980s: a determined criminal-minded Cuban immigrant becomes the biggest drug smuggler in Florida, and is eventually undone by his own drug addiction.	8.3	1983	tt0086250	111	R	\N	{Scarface,"The world is yours."}	170 min
71	Guardians of the Galaxy	A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.	8	2014	tt2015381	447365	PG-13	\N	{"Guardians of the Galaxy Vol. 3","Once more with feeling."}	121 min
72	Alien	After investigating a mysterious transmission of unknown origin, the crew of a commercial spacecraft encounters a deadly lifeform.	8.5	1979	tt0078748	348	R	\N	{Alien,"In space, no one can hear you scream."}	117 min
73	Shutter Island	Two US marshals are sent to a mental institution on an inhospitable island in order to investigate the disappearance of a patient.	8.2	2010	tt1130884	11324	R	\N	{"Shutter Island","Some places never let you go."}	138 min
74	Memento	Leonard Shelby, an insurance investigator, suffers from anterograde amnesia and uses notes and tattoos to hunt for the man he thinks killed his wife, which is the last thing he remembers.	8.4	2000	tt0209144	77	R	\N	{Memento,"Some memories are best forgotten."}	113 min
75	The Good, the Bad and the Ugly	A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.	8.8	1966	tt0060196	429	R	\N	{"The Good, the Bad and the Ugly","For three men the Civil War wasn't hell. It was practice."}	178 min
76	The Secret Life of Walter Mitty	When both he and a colleague are about to lose their job, Walter takes action by embarking on an adventure more extraordinary than anything he ever imagined.	7.3	2013	tt0359950	116745	PG	\N	{"The Secret Life of Walter Mitty","Stop dreaming. Start living."}	114 min
77	No Country for Old Men	Violence and mayhem ensue after a hunter stumbles upon the aftermath of a drug deal gone wrong and over two million dollars in cash near the Rio Grande.	8.2	2007	tt0477348	6977	R	\N	{"No Country for Old Men","There are no clean getaways."}	122 min
78	The Iron Giant	A young boy befriends a giant robot from outer space that a paranoid government agent wants to destroy.	8.1	1999	tt0129167	10386	PG	\N	{"The Iron Giant","It came from outer space!"}	86 min
79	Jaws	When a massive killer shark unleashes chaos on a beach community off Long Island, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.	8.1	1975	tt0073195	578	PG	\N	{Jaws,"The terrifying motion picture from the terrifying No.1 best seller."}	124 min
80	Superbad	Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry.	7.6	2007	tt0829482	8363	R	\N	{Superbad,"Come and get some!"}	113 min
81	Anchorman: The Legend of Ron Burgundy	In the 1970s, an anchorman's stint as San Diego's top-rated newsreader is challenged when an ambitious newswoman becomes his co-anchor.	7.1	2004	tt0357413	8699	PG-13	\N	{"Anchorman: The Legend of Ron Burgundy","They bring you the news so you don't have to get it yourself."}	94 min
82	The Hangover	Three buddies wake up from a bachelor party in Las Vegas, with no memory of the previous night and the bachelor missing. They make their way around the city in order to find their friend before his wedding.	7.7	2009	tt1119646	18785	R	\N	{"The Hangover","Some guys just can't handle Vegas"}	100 min
83	Monty Python and the Holy Grail	King Arthur and his Knights of the Round Table embark on a surreal, low-budget search for the Holy Grail, encountering many, very silly obstacles.	8.2	1975	tt0071853	762	PG	\N	{"Monty Python and the Holy Grail","And now! At Last! Another film completely different from some of the other films which aren't quite the same as this one is."}	91 min
84	Groundhog Day	A narcissistic, self-centered weatherman finds himself in a time loop on Groundhog Day.	8	1993	tt0107048	137	PG	\N	{"Groundhog Day","He’s having the worst day of his life… Over and over again."}	101 min
85	Dumb and Dumber	After a woman leaves a briefcase at the airport terminal, a dumb limo driver and his dumber friend set out on a hilarious cross-country road trip to Aspen to return it.	7.3	1994	tt0109686	8467	PG-13	\N	{"Dumb and Dumber","For Harry and Lloyd, every day is a no-brainer."}	107 min
86	Borat	Kazakh TV talking head Borat is dispatched to the United States to report on the greatest country in the world.	7.4	2006	tt0443453	740985	R	\N	{"Borat Subsequent Moviefilm","Delivery of prodigious bribe to American regime for make benefit once glorious nation of Kazakhstan."}	84 min
87	Ferris Bueller's Day Off	A high school wise guy is determined to have a day off from school, despite what the Principal thinks of that.	7.8	1986	tt0091042	9377	PG-13	\N	{"Ferris Bueller's Day Off","One man's struggle to take it easy."}	103 min
88	Shaun of the Dead	The uneventful, aimless lives of a London electronics salesman and his layabout roommate are disrupted by the zombie apocalypse.	7.9	2004	tt0365748	747	R	\N	{"Shaun of the Dead","A romantic comedy. With zombies."}	99 min
89	Step Brothers	Two aimless middle-aged losers still living at home are forced against their will to become roommates when their parents marry.	6.9	2008	tt0838283	12133	R	\N	{"Step Brothers","They grow up so fast."}	98 min
90	21 Jump Street	A pair of underachieving cops are sent back to a local high school to blend in and bring down a synthetic drug ring.	7.2	2012	tt1232829	64688	R	\N	{"21 Jump Street","The only thing getting blown tonight is their cover."}	109 min
91	Pineapple Express	A process server and his marijuana dealer wind up on the run from hitmen and a corrupt police officer after he witnesses his dealer's boss murder a competitor while trying to serve papers on him.	6.9	2008	tt0910936	10189	R	\N	{"Pineapple Express","Put this in your pipe and smoke it."}	111 min
92	Tropic Thunder	Through a series of freak occurrences, a group of actors shooting a big-budget war movie are forced to become the soldiers they are portraying.	7.1	2008	tt0942385	7446	R	\N	{"Tropic Thunder","Get Some."}	107 min
93	Wedding Crashers	John Beckwith and Jeremy Grey, a pair of committed womanizers who sneak into weddings to take advantage of the romantic tinge in the air, find themselves at odds with one another when John meets and falls for Claire Cleary.	7	2005	tt0396269	9522	R	\N	{"Wedding Crashers","Life's a Party. Crash It."}	119 min
94	Hot Fuzz	An overachieving London police sergeant is transferred to a village where the easygoing officers object to his fervor for regulations, all while a string of grisly murders strikes the town.	7.8	2007	tt0425112	4638	R	\N	{"Hot Fuzz","Big cops. Small town. Moderate violence."}	121 min
95	Bridesmaids	Competition between the maid of honor and a bridesmaid, over who is the bride's best friend, threatens to upend the life of an out-of-work pastry chef.	6.8	2011	tt1478338	55721	R	\N	{Bridesmaids,"Save the date."}	125 min
96	Super Troopers	Five Vermont state troopers, avid pranksters with a knack for screwing up, try to save their jobs and out-do the local police department by solving a crime.	7	2001	tt0247745	39939	R	\N	{"Super Troopers","In their town, you don't screw with the law, the law screws with you."}	100 min
97	The 40-Year-Old Virgin	Goaded by his buddies, a nerdy guy who's never "done the deed" only finds the pressure mounting when he meets a single mother.	7.1	2005	tt0405422	6957	R	\N	{"The 40 Year Old Virgin","Better late than never."}	116 min
98	The Royal Tenenbaums	The eccentric members of a dysfunctional family reluctantly gather under the same roof for various reasons.	7.6	2001	tt0265666	9428	R	\N	{"The Royal Tenenbaums","Family isn't a word ... It's a sentence."}	110 min
99	Airplane!	After the crew becomes sick with food poisoning, a neurotic ex-fighter pilot must safely land a commercial airplane full of passengers.	7.7	1980	tt0080339	813	PG	\N	{Airplane!,"What's slower than a speeding bullet, and able to hit tall buildings at a single bound?"}	88 min
100	Ace Ventura: Pet Detective	A goofy detective specializing in animals goes in search of the missing mascot of the Miami Dolphins.	6.9	1994	tt0109040	3049	PG-13	\N	{"Ace Ventura: Pet Detective","He's the best there is! (Actually, he's the only one there is.)"}	86 min
101	Blazing Saddles	In order to ruin a western town and steal their land, a corrupt politician appoints a black sheriff, who promptly becomes his most formidable adversary.	7.7	1974	tt0071230	11072	R	\N	{"Blazing Saddles","...or never give a saga an even break!"}	93 min
102	Caddyshack	An exclusive golf course has to deal with a flatulent new member and a destructive dancing gopher.	7.2	1980	tt0080487	11977	R	\N	{Caddyshack,"Some people just don't belong."}	98 min
103	Ghostbusters	Three parapsychologists forced out of their university funding set up shop as a unique ghost removal service in New York City, attracting frightened yet skeptical customers.	7.8	1984	tt0087332	620	PG	\N	{Ghostbusters,"They're here to save the world."}	105 min
104	Spaceballs	A star-pilot for hire and his trusty sidekick must come to the rescue of a princess and save Planet Druidia from the clutches of the evil Spaceballs.	7.1	1987	tt0094012	957	PG	\N	{Spaceballs,"May the farce be with you."}	96 min
105	The Naked Gun: From the Files of Police Squad!	Incompetent police Detective Frank Drebin must foil an attempt to assassinate Queen Elizabeth II.	7.6	1988	tt0095705	37136	PG-13	\N	{"The Naked Gun: From the Files of Police Squad!","You've read the ad, now see the movie!"}	85 min
106	Clerks	A day in the lives of two convenience clerks named Dante and Randal as they annoy customers, discuss movies, and play hockey on the store roof.	7.7	1994	tt0109445	2292	R	\N	{Clerks,"Just because they serve you doesn't mean they like you."}	92 min
107	The Jerk	A simpleminded, sheltered country boy suddenly decides to leave his family home to experience life in the big city, where his naivete is both his best friend and his worst enemy.	7.1	1979	tt0079367	6471	R	\N	{"The Jerk","A rags to riches to rags story."}	94 min
\.


--
-- Data for Name: movie_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_actor (movie_id, actor_id) FROM stdin;
1	1
1	2
1	3
2	4
2	5
2	6
3	7
3	8
3	9
4	10
4	11
4	12
5	13
5	14
5	15
6	16
6	17
6	18
7	19
7	20
7	21
8	22
8	23
8	24
9	25
9	26
9	27
10	28
10	29
10	30
11	31
11	32
11	33
12	34
12	35
12	36
13	37
13	38
13	39
14	40
14	41
14	42
15	7
15	44
15	45
16	46
16	47
16	48
17	49
17	50
17	51
18	22
18	23
18	24
19	28
19	56
19	57
20	13
20	59
20	60
21	7
21	62
21	63
22	64
22	65
22	66
23	67
23	68
23	69
24	70
24	45
24	72
25	73
25	74
25	75
26	76
26	77
26	78
27	79
27	80
27	81
28	82
28	83
28	84
29	85
29	86
29	87
30	88
30	89
30	90
31	91
31	92
31	93
32	28
32	44
32	96
33	97
33	98
33	99
34	100
34	101
34	102
35	19
35	21
35	105
36	16
36	17
36	18
37	16
37	17
37	18
38	28
38	113
38	114
39	115
39	116
39	117
40	118
40	119
40	120
40	121
41	122
41	123
41	124
42	125
42	12
42	127
43	128
43	129
43	130
44	131
44	132
44	133
45	28
45	135
45	136
46	28
46	138
46	139
47	19
47	21
47	20
48	143
48	144
48	145
49	146
49	147
49	148
50	37
50	150
50	151
51	152
51	150
51	154
52	155
52	156
52	157
53	158
53	159
53	160
54	25
54	162
54	163
55	7
55	165
55	166
56	167
56	168
56	169
57	40
57	171
57	172
58	173
58	174
58	175
59	176
59	177
59	178
60	179
60	180
60	181
61	34
61	183
61	184
62	185
62	186
62	187
63	188
63	189
63	190
64	191
64	192
64	193
65	115
65	195
65	117
66	197
66	72
66	199
67	200
67	201
67	202
68	203
68	204
68	14
69	206
69	207
69	208
70	40
70	210
70	211
71	212
71	213
71	214
72	215
72	216
72	217
73	28
73	219
73	117
74	221
74	18
74	223
75	224
75	225
75	226
76	227
76	199
76	229
77	230
77	231
77	232
78	233
78	234
78	235
79	236
79	237
79	238
80	239
80	135
80	241
81	242
81	243
81	165
82	245
82	214
82	247
83	248
83	249
83	250
84	251
84	252
84	253
85	152
85	255
85	256
86	257
86	258
86	259
87	31
87	261
87	262
88	263
88	264
88	265
89	242
89	267
89	268
90	269
90	270
90	271
91	272
91	273
91	274
92	227
92	276
92	277
93	278
93	279
93	280
94	263
94	264
94	283
95	284
95	285
95	286
96	287
96	288
96	289
97	290
97	291
97	292
98	293
98	294
98	295
99	296
99	297
99	298
100	152
100	300
100	190
101	302
101	303
101	304
102	305
102	306
102	307
103	251
103	309
103	310
104	311
104	312
104	313
105	314
105	315
105	316
106	317
106	318
106	319
107	320
107	321
107	322
\.


--
-- Data for Name: movie_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_country (movie_id, country_id) FROM stdin;
1	1
2	1
3	3
3	1
4	1
5	1
6	1
7	8
7	1
8	1
9	11
9	1
10	3
10	1
11	1
12	1
13	3
13	1
14	1
15	3
15	1
16	1
17	1
18	1
19	25
19	1
20	1
21	3
21	1
22	1
23	1
24	3
24	1
25	1
26	1
27	1
28	1
29	3
30	3
30	1
31	1
32	42
32	25
32	44
32	1
33	1
34	1
35	8
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	8
47	1
48	3
48	1
49	1
50	1
51	1
52	11
52	1
53	1
54	11
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	3
62	1
63	1
63	25
63	3
64	1
65	1
66	1
67	88
67	1
68	1
69	1
69	92
70	1
71	1
72	1
73	1
74	1
75	1
75	99
75	100
75	11
76	3
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	3
84	1
85	1
86	1
87	1
88	3
89	1
90	1
91	1
92	11
92	3
92	1
93	1
94	92
94	3
94	1
95	1
96	1
97	1
98	1
99	1
100	1
101	1
102	1
103	1
104	1
105	1
106	1
107	1
\.


--
-- Data for Name: movie_director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_director (movie_id, director_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
6	7
7	8
8	9
9	10
10	3
11	12
11	13
12	14
13	15
14	2
15	3
16	5
17	19
18	20
19	14
20	1
21	3
22	24
23	25
24	3
25	10
26	28
27	29
28	30
29	31
30	31
31	33
32	34
33	35
34	10
35	8
36	6
36	7
37	6
37	7
38	42
39	43
39	44
40	45
41	19
42	47
43	48
43	49
43	50
44	51
45	14
46	19
47	8
48	55
48	56
49	57
50	58
51	59
52	60
53	61
53	62
54	4
55	64
56	61
56	66
56	67
57	2
58	69
59	70
60	71
61	14
62	42
63	15
64	75
65	43
65	44
66	15
67	79
68	80
69	81
70	82
71	83
72	15
73	14
74	3
75	87
76	88
77	89
77	90
78	47
79	19
80	93
81	64
82	95
83	96
83	97
84	98
85	99
85	100
86	101
87	69
88	103
89	64
90	105
90	106
91	107
92	88
93	109
94	103
95	111
96	112
97	113
98	60
99	115
99	116
99	117
100	118
101	119
102	98
103	121
104	119
105	123
106	124
107	125
\.


--
-- Data for Name: movie_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_genre (movie_id, genre_id) FROM stdin;
1	1
1	2
2	1
2	2
3	1
3	6
3	2
3	8
4	8
4	2
5	11
5	1
5	13
6	6
6	15
7	16
7	17
7	6
8	16
8	6
8	15
9	1
10	6
10	15
10	16
11	16
11	1
11	28
12	1
12	2
13	6
13	1
13	16
14	1
14	2
15	6
15	2
15	1
15	8
16	16
16	11
16	15
17	1
17	44
17	45
18	16
18	6
18	15
19	1
19	8
19	2
20	17
20	1
20	2
21	1
21	56
21	15
22	1
22	2
22	8
23	2
23	1
23	8
24	16
24	1
24	15
25	1
26	1
26	13
27	56
27	1
28	1
29	15
29	2
30	75
30	8
31	1
31	78
32	79
32	1
32	16
33	1
34	2
34	56
34	8
35	16
35	17
35	6
36	16
36	6
36	8
36	15
37	16
37	6
37	8
37	15
38	1
38	13
39	16
39	15
39	6
40	15
40	6
40	104
40	56
41	16
41	15
42	6
42	16
42	104
42	28
43	104
43	6
43	16
43	15
44	6
44	16
44	15
45	2
45	1
45	11
46	1
46	2
47	16
47	17
47	6
48	11
48	2
49	1
50	1
50	13
51	11
51	1
52	11
52	1
53	16
53	17
53	28
54	1
54	8
54	45
55	11
55	1
56	1
56	45
56	13
57	2
57	1
57	8
58	11
58	1
59	1
60	75
60	1
61	2
61	1
62	6
62	8
62	15
63	15
63	1
63	8
64	6
64	16
64	11
65	16
65	6
65	15
66	1
66	16
66	15
67	6
67	16
67	15
68	16
68	28
68	17
68	11
68	13
69	2
69	1
69	6
70	6
70	2
70	1
71	15
71	16
71	6
72	75
72	15
73	1
73	8
73	56
74	56
74	8
75	79
76	16
76	11
76	1
76	17
77	2
77	1
77	8
78	28
78	104
78	15
78	16
79	75
79	8
79	16
80	11
81	11
82	11
83	16
83	11
83	17
84	13
84	17
84	1
84	11
85	11
86	11
87	11
88	75
88	11
89	11
90	6
90	11
90	2
91	6
91	11
91	2
92	6
92	11
92	16
92	45
93	11
93	13
94	2
94	6
94	11
95	11
95	13
96	11
96	2
96	56
97	11
97	13
98	11
98	1
99	11
100	11
100	56
101	79
101	11
102	11
103	11
103	17
104	11
104	15
105	11
105	2
106	11
107	11
\.


--
-- Data for Name: movie_keyword; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_keyword (movie_id, keyword_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
2	5
2	18
2	19
2	20
2	21
2	22
2	23
2	24
2	25
2	26
2	27
2	28
2	29
2	30
2	31
2	32
2	33
2	34
2	35
2	15
2	37
2	38
2	39
3	40
3	41
3	42
3	43
3	44
3	45
3	46
3	47
3	48
3	49
3	24
3	51
3	52
3	53
3	54
3	55
3	56
3	57
3	58
4	59
4	60
4	61
4	62
4	63
4	64
4	9
4	66
4	67
4	68
4	69
4	70
4	71
4	72
4	73
4	57
4	75
4	76
4	77
5	78
5	79
5	80
5	2
5	82
5	83
5	84
5	85
5	5
5	87
5	88
5	89
5	90
5	91
5	92
5	93
5	94
5	95
5	96
5	97
5	98
5	99
5	100
5	101
5	102
5	103
5	104
5	105
5	106
5	107
5	108
6	109
6	110
6	111
6	112
6	113
6	114
6	115
6	116
6	117
6	118
6	119
6	120
6	121
6	122
6	123
6	124
6	125
6	126
6	127
6	128
6	129
7	130
7	5
7	132
7	133
7	134
7	135
7	136
7	137
7	138
7	139
7	140
7	141
7	142
7	143
7	144
7	145
7	146
7	147
7	148
7	149
7	150
7	151
7	152
7	153
7	154
7	155
7	156
7	157
7	158
7	159
7	160
7	161
7	162
7	163
7	164
7	165
7	166
7	167
7	168
7	169
7	170
7	171
7	172
8	173
8	174
8	175
8	176
8	177
8	178
8	179
8	180
8	181
8	182
8	183
8	184
9	185
9	186
9	5
9	188
9	117
9	190
9	121
9	192
9	193
9	194
9	147
9	196
9	197
9	198
10	199
10	200
10	111
10	202
10	203
10	116
10	205
10	120
10	207
10	208
10	209
10	210
10	211
10	212
10	213
10	68
10	125
10	216
11	217
11	218
11	219
11	9
11	221
11	222
11	223
11	224
11	144
11	226
11	227
11	154
11	229
11	230
12	1
12	232
12	233
12	5
12	235
12	236
12	237
12	91
12	239
12	240
12	241
12	242
12	243
12	24
12	25
12	246
12	247
12	248
13	249
13	250
13	251
13	252
13	253
13	254
13	89
13	256
13	257
13	258
13	259
13	260
13	261
13	262
13	263
13	264
13	265
13	266
13	267
13	268
13	269
13	270
13	271
13	272
14	273
14	274
14	20
14	235
14	277
14	21
14	259
14	24
14	25
14	27
14	283
14	284
14	285
14	286
14	106
14	288
14	289
15	117
15	291
15	292
15	43
15	44
15	45
15	296
15	297
15	48
15	299
15	49
15	51
15	302
15	303
15	304
15	305
15	306
15	307
15	308
16	309
16	310
16	311
16	312
16	313
16	314
16	315
16	316
16	317
16	318
16	319
16	320
16	321
16	322
16	323
16	303
16	325
16	326
16	183
16	328
16	329
16	330
16	37
16	332
16	333
16	107
16	335
16	336
17	337
17	338
17	339
17	340
17	341
17	342
17	343
17	344
17	345
17	346
17	347
17	348
17	241
17	242
17	351
17	262
17	353
17	354
17	355
17	356
17	357
18	358
18	359
18	173
18	174
18	362
18	363
18	364
18	177
18	366
18	367
18	368
18	369
18	55
18	371
18	182
18	149
18	374
19	375
19	376
19	377
19	235
19	239
19	64
19	381
19	223
19	383
19	24
19	25
19	386
19	387
19	388
19	389
19	390
19	391
19	392
19	393
19	394
20	80
20	5
20	397
20	398
20	399
20	400
20	401
20	402
20	403
20	404
20	405
20	406
20	407
20	408
20	409
20	410
20	411
20	412
20	413
20	414
20	415
20	416
20	417
21	418
21	419
21	420
21	421
21	135
21	423
21	137
21	425
21	426
21	427
21	428
21	429
21	430
21	431
21	432
21	433
21	434
21	435
21	436
21	437
21	438
21	439
21	440
21	441
21	442
21	443
21	444
22	233
22	446
22	447
22	448
22	211
22	450
22	451
22	452
22	68
22	69
22	455
22	53
22	457
22	458
22	409
22	57
22	461
22	333
22	463
23	5
23	205
23	398
23	467
23	468
23	243
23	470
23	471
23	145
23	473
23	474
23	475
23	476
23	477
23	57
23	479
23	480
23	481
23	333
23	483
23	484
24	199
24	486
24	175
24	310
24	112
24	490
24	491
24	121
24	493
24	494
24	495
24	496
24	497
24	498
24	97
24	367
24	501
24	502
24	503
24	504
24	505
24	506
24	507
24	508
24	509
24	510
24	511
24	512
24	513
25	114
25	5
25	377
25	517
25	518
25	519
25	242
25	521
25	262
25	523
25	524
25	525
25	526
25	527
25	528
25	529
25	530
25	531
25	532
25	533
25	534
25	535
26	4
26	339
26	538
26	539
26	540
26	207
26	542
26	543
26	544
26	545
26	546
26	343
26	548
26	549
26	164
27	551
27	232
27	553
27	554
27	555
27	556
27	557
27	558
27	559
27	560
27	561
27	562
27	563
27	564
27	565
28	566
28	567
28	568
28	569
28	570
28	571
28	572
28	426
28	574
28	575
28	576
28	577
28	578
28	579
28	580
28	581
28	582
28	583
28	584
28	585
29	421
29	446
29	588
29	589
29	5
29	188
29	89
29	593
29	594
29	595
29	398
29	121
29	598
29	599
29	600
29	601
29	602
29	603
29	604
29	605
29	606
29	607
30	608
30	609
30	5
30	611
30	612
30	613
30	614
30	615
30	179
30	617
30	618
30	619
30	620
30	621
30	622
30	623
30	624
30	625
30	626
30	627
30	471
30	629
30	523
30	631
30	632
30	633
30	634
30	635
30	636
30	637
30	638
30	639
30	640
30	641
30	642
30	643
30	644
30	645
30	646
30	647
30	648
30	649
30	650
30	104
30	286
30	653
30	654
30	655
30	656
30	657
30	658
30	659
30	660
30	661
30	662
30	663
30	664
30	665
30	666
30	667
30	668
30	416
30	670
30	671
30	672
30	673
30	674
31	233
31	676
31	677
31	678
31	137
31	680
31	681
31	682
31	683
31	684
31	685
31	686
31	687
31	688
31	689
31	690
31	691
32	692
32	5
32	89
32	695
32	696
32	697
32	698
32	699
32	700
32	240
32	702
32	703
32	242
32	705
32	706
32	707
32	223
32	259
32	710
32	243
32	712
32	713
32	714
32	715
32	716
32	717
32	718
32	719
32	34
32	721
32	437
32	723
32	724
33	1
33	726
33	692
33	728
33	729
33	730
33	731
33	732
33	404
33	734
33	68
33	226
33	737
33	13
33	739
34	186
34	375
34	742
34	41
34	744
34	398
34	746
34	747
34	192
34	243
34	470
34	26
34	752
34	753
34	57
35	5
35	132
35	133
35	134
35	135
35	137
35	138
35	762
35	763
35	764
35	697
35	139
35	767
35	768
35	769
35	633
35	771
35	148
35	151
35	152
35	775
35	154
35	155
35	157
35	158
35	161
35	162
35	166
35	783
35	784
35	167
35	169
35	787
36	418
36	486
36	200
36	109
36	792
36	110
36	794
36	338
36	111
36	112
36	798
36	113
36	800
36	116
36	117
36	118
36	804
36	119
36	806
36	121
36	808
36	809
36	810
36	210
36	124
36	127
36	128
36	815
36	674
37	418
37	199
37	486
37	200
37	109
37	792
37	823
37	110
37	794
37	338
37	111
37	828
37	112
37	798
37	113
37	832
37	833
37	800
37	116
37	117
37	804
37	119
37	120
37	806
37	841
37	842
37	121
37	844
37	845
37	809
37	847
37	848
37	124
37	127
37	128
37	272
38	249
38	854
38	855
38	856
38	857
38	858
38	859
38	860
38	861
38	862
38	242
38	864
38	322
38	866
38	867
38	868
38	262
38	870
38	871
38	872
38	873
38	874
38	875
38	876
38	877
38	878
38	879
38	880
38	881
38	882
39	45
39	319
39	494
39	886
39	48
39	142
39	889
39	890
39	891
39	892
39	510
39	894
39	272
39	783
39	897
39	607
39	899
40	486
40	121
40	902
40	55
40	904
41	905
41	906
41	907
41	908
41	909
41	910
41	911
41	912
41	913
41	914
41	915
42	338
42	43
42	45
42	919
42	97
42	55
42	922
42	37
42	102
42	925
43	45
43	48
43	928
43	929
44	233
44	338
44	932
44	135
44	18
44	43
44	45
44	919
44	938
44	142
44	49
44	890
44	942
44	943
44	944
44	928
44	946
44	891
44	948
44	949
44	950
44	951
44	952
44	953
45	4
45	5
45	92
45	46
45	958
45	959
45	960
45	242
45	962
45	963
45	561
45	965
45	966
45	967
45	475
45	969
45	970
45	971
45	972
45	973
45	409
45	975
45	976
45	977
45	978
45	979
45	980
45	581
45	982
45	583
45	984
45	565
46	467
46	958
46	241
46	242
46	972
46	991
46	992
46	993
46	994
46	995
46	581
46	997
46	998
46	106
46	107
47	200
47	130
47	5
47	132
47	133
47	134
47	135
47	137
47	138
47	139
47	1011
47	142
47	768
47	145
47	1015
47	147
47	1017
47	148
47	149
47	151
47	152
47	154
47	155
47	156
47	157
47	158
47	1027
47	161
47	1029
47	162
47	166
47	1032
47	168
47	169
48	79
48	1036
48	1037
48	1038
48	188
48	1040
48	205
48	1042
48	1043
48	68
48	1045
48	1046
48	1047
48	1048
48	1049
48	1050
48	1051
48	57
48	1053
49	1054
49	1055
49	1056
49	1057
49	1058
49	613
49	1060
49	549
49	1062
49	68
49	353
49	146
49	1066
49	1067
49	1068
49	1069
49	1070
49	1071
49	1072
50	1073
50	5
50	1075
50	1076
50	1077
50	1078
50	1079
50	1080
50	1081
50	1082
50	1083
50	1084
50	1085
50	1086
50	613
50	1088
50	241
50	242
50	1091
50	1092
50	1093
50	1094
50	1095
50	1096
50	1097
51	538
51	1078
51	121
51	1101
51	1102
51	1103
51	1104
51	123
51	1106
51	1107
51	1108
51	1109
51	1110
51	1111
51	1112
51	1113
51	129
52	608
52	1116
52	1117
52	1118
52	1119
52	1120
52	69
52	1122
52	1123
52	1124
52	1125
52	1126
52	102
52	412
52	1129
52	1130
52	77
53	1132
53	1133
53	111
53	5
53	43
53	218
53	1138
53	1139
53	47
53	919
53	221
53	1143
53	1144
53	1145
53	1146
53	1147
53	148
53	149
53	1150
53	1151
53	1152
53	1153
53	1154
53	1155
53	1156
53	1157
53	1158
53	1130
53	1160
53	1161
53	1162
53	1163
54	1164
54	730
54	203
54	339
54	115
54	41
54	1170
54	1171
54	343
54	345
54	1174
54	1175
54	1176
54	1177
54	1178
54	1027
54	1180
54	443
55	5
55	1183
55	959
55	960
55	241
55	242
55	1188
55	1189
55	262
55	1191
55	1192
55	1193
55	1194
56	1195
56	5
56	1197
56	18
56	1199
56	1200
56	257
56	1202
56	1203
56	1204
56	1205
56	1206
56	1207
56	1208
56	1209
56	1210
56	1211
56	1212
56	1213
56	1214
56	607
57	1216
57	233
57	1218
57	1219
57	273
57	20
57	235
57	1223
57	1224
57	1225
57	1226
57	21
57	259
57	24
57	25
57	27
57	1232
57	1233
58	1234
58	1235
58	1236
58	1237
58	1238
58	1239
58	975
58	1241
58	1242
59	1243
59	239
59	60
59	241
59	1247
59	1248
59	1249
59	1250
59	1251
59	1252
59	1253
59	1254
59	1255
59	1256
59	1257
59	1258
59	1259
59	1260
59	1261
59	1097
60	1263
60	1264
60	1265
60	1266
60	1267
60	1268
60	1269
60	1270
60	1271
60	769
60	1273
60	1232
60	1275
60	1276
60	1277
60	1278
60	1279
60	654
61	59
61	79
61	233
61	1284
61	1285
61	137
61	1287
61	1288
61	1289
61	1290
61	1291
61	1292
61	1293
61	49
61	1295
61	1296
61	1297
61	1298
61	57
61	1300
61	1301
61	1302
62	109
62	112
62	113
62	1306
62	1307
62	841
62	1309
62	177
62	121
62	919
62	319
62	1314
62	68
62	1316
62	1317
62	1318
62	1319
62	508
62	127
62	1322
62	162
63	174
63	309
63	1326
63	112
63	1328
63	5
63	121
63	1331
63	1332
63	1333
63	124
63	68
63	632
63	1319
63	1338
63	57
63	1340
63	1341
63	1342
64	45
64	46
64	1345
64	48
64	928
64	946
65	1349
65	135
65	45
65	48
65	367
65	260
65	1355
65	1356
65	55
65	928
65	891
65	1360
66	175
66	1362
66	5
66	490
66	611
66	1366
66	1367
66	710
66	367
66	1370
66	1371
66	502
66	1373
66	946
66	1375
66	1376
66	1377
66	1378
67	199
67	486
67	1381
67	1382
67	121
67	1384
67	710
67	1386
67	1387
67	1388
67	1389
67	1390
67	1391
68	111
68	5
68	1394
68	1395
68	1396
68	1397
68	259
68	1399
68	1400
68	1401
68	1402
68	1403
68	1404
68	1405
68	1406
68	1407
68	328
68	1409
68	1410
68	1411
68	982
68	1413
69	1414
69	233
69	1416
69	1417
69	3
69	4
69	742
69	1421
69	18
69	1423
69	259
69	243
69	624
69	1427
69	867
69	1429
69	57
69	1431
69	333
70	4
70	729
70	1435
70	274
70	18
70	235
70	1439
70	962
70	223
70	1442
70	25
70	1444
70	1445
70	33
70	1447
70	1448
70	1449
70	394
70	288
71	338
71	45
71	321
71	48
71	142
71	890
71	182
71	1459
71	928
71	946
71	891
71	1360
71	1464
71	1465
72	174
72	175
72	1468
72	1469
72	121
72	1471
72	1472
72	1473
72	494
72	1475
72	1476
72	367
72	1478
72	1479
72	182
72	1481
72	1482
73	906
73	5
73	1485
73	747
73	1487
73	1488
73	1489
73	471
73	452
73	57
73	37
73	1129
74	59
74	1496
74	1497
74	1498
74	85
74	1500
74	1501
74	209
74	450
74	1504
74	259
74	243
74	1507
74	471
74	452
74	68
74	1511
74	1512
74	70
74	1514
74	1515
74	57
74	1517
75	1518
75	130
75	1326
75	1421
75	1522
75	46
75	1524
75	1525
75	1526
75	1527
75	1528
75	1207
75	1530
76	1531
76	1532
76	1533
76	1534
76	1535
76	1536
76	1537
76	1538
76	1539
76	1540
76	1541
77	79
77	1543
77	1544
77	5
77	1421
77	398
77	237
77	1549
77	1501
77	1551
77	1442
77	1553
77	369
77	1555
77	1556
77	1557
77	1558
77	1559
77	285
77	1561
77	57
77	975
77	1564
77	1565
77	1566
77	1567
77	1568
77	1569
77	1570
77	1571
77	882
77	1573
77	1574
78	2
78	1576
78	5
78	115
78	1579
78	1476
78	1581
78	1582
78	1583
78	1584
78	37
78	104
79	418
79	1588
79	5
79	1590
79	857
79	1592
79	1593
79	1594
79	1595
79	1596
79	699
79	1598
79	1599
79	1600
79	1601
79	1537
79	1603
79	1604
79	1605
79	1606
79	1607
79	1608
79	1609
79	1610
79	1530
80	1234
80	375
80	1614
80	42
80	1616
80	1235
80	734
80	68
80	967
80	1621
80	1622
80	1623
80	1624
80	982
81	91
81	1627
81	1628
81	1629
81	1630
81	1107
81	1632
81	1633
81	1634
81	1635
81	1636
81	1637
81	928
81	946
81	1640
82	1641
82	1642
82	1643
82	1644
82	1645
82	1507
82	1647
82	967
82	997
82	443
82	998
82	982
82	106
82	1654
82	1655
82	1656
83	1657
83	1658
83	1659
83	1660
83	1661
83	1662
83	1663
83	699
83	1665
83	1666
83	1667
83	599
83	1669
83	194
83	1671
83	1672
83	1673
83	1674
83	1675
83	982
84	1677
84	1678
84	1679
84	1680
84	1681
84	1682
84	695
84	491
84	1685
84	1686
84	407
84	1688
84	1689
84	1156
85	1691
85	1692
85	1501
85	1694
85	1695
85	1696
85	1697
85	1698
85	455
85	1621
85	1538
85	1702
85	1703
85	1704
85	1705
85	1706
85	1707
85	1708
85	1709
85	1710
86	1711
86	542
86	1713
86	1714
86	599
86	1104
86	142
86	1718
86	1698
86	1720
86	1721
86	1722
87	1723
87	1234
87	1725
87	1235
87	1727
87	194
87	1729
87	1730
87	1731
87	1732
87	972
87	928
87	946
87	1736
87	1737
87	975
87	1342
87	1241
87	105
87	1742
87	106
88	421
88	598
88	599
88	1747
88	1669
88	1749
88	381
88	710
88	1752
88	475
88	1754
88	1755
88	1756
88	972
88	1758
88	648
88	1760
88	393
88	1762
88	332
88	998
88	333
88	1742
88	106
88	1768
88	1160
88	1655
89	1771
89	425
89	1773
89	1774
89	1775
89	1749
89	1777
89	1621
89	928
89	946
89	443
89	982
90	59
90	1234
90	747
90	1616
90	1787
90	1669
90	1789
90	1790
90	386
90	1792
90	1793
90	1794
90	1795
90	946
90	1797
90	1798
90	1799
90	165
90	1801
90	1802
90	1803
91	1804
91	1805
91	1806
91	1043
91	1808
91	1809
91	1810
91	1811
91	1812
91	1813
92	1814
92	1815
92	599
92	1669
92	1818
92	1819
92	1820
92	1821
92	1822
92	946
92	1824
92	1825
92	106
93	1827
93	1828
93	1829
93	1401
93	1831
94	1832
94	375
94	1834
94	1835
94	1669
94	432
94	243
94	1839
94	1092
94	470
94	1120
94	1843
94	1794
94	1845
95	1055
95	89
95	117
95	423
95	1850
95	1851
95	1852
95	1853
95	1854
95	1855
95	1856
95	1857
95	1858
95	1859
95	1860
95	1861
95	1862
95	1863
95	1864
95	1865
95	1866
96	1614
96	1595
96	1869
96	1870
96	1871
96	1872
96	1873
96	1043
96	451
96	1876
96	1877
96	928
96	946
96	1880
97	1881
97	1882
97	1787
97	1884
97	1885
97	1886
97	1887
97	1888
98	1889
98	1890
98	1891
98	1892
98	1248
98	1894
98	1249
99	1723
99	84
99	202
99	1899
99	314
99	1614
99	1902
99	1287
99	1904
99	1905
99	1906
99	1907
99	1908
99	1909
99	1910
99	1911
99	1669
99	1913
99	1914
99	68
99	1916
99	928
99	1918
99	1675
100	1435
100	1921
100	746
100	1923
100	1694
100	1925
100	1926
100	715
100	1928
100	1929
101	1930
101	1931
101	1932
101	1669
101	1934
101	194
101	1913
101	1937
101	1938
101	1939
101	1046
101	1941
101	1942
101	1943
101	1944
101	1945
101	1946
101	1947
101	1675
101	1949
101	1950
102	313
102	1243
102	423
102	1954
102	1955
102	1235
102	870
102	1958
102	1959
103	233
103	1961
103	1962
103	401
103	1266
103	1965
103	1966
103	1967
103	1616
103	1969
103	1970
103	1971
103	1267
103	1973
103	1974
103	1975
103	1316
103	55
103	1978
103	1979
103	1980
103	946
103	1982
103	982
103	1129
104	359
104	174
104	1468
104	1306
104	833
104	1658
104	178
104	494
104	1993
104	599
104	1995
104	1996
104	1997
104	1998
104	1999
104	1669
104	1913
104	2002
105	1219
105	375
105	2005
105	2006
105	1669
105	1926
105	68
105	303
105	2011
105	2012
105	1794
105	2014
105	1675
105	162
105	1799
106	2018
106	2019
106	1965
106	1787
106	1292
106	353
106	928
106	1737
106	2026
106	1242
107	2028
107	2029
107	2030
107	2031
107	2032
\.


--
-- Data for Name: movie_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_language (movie_id, language_id) FROM stdin;
1	1
2	1
2	3
2	4
3	1
3	6
4	1
4	8
4	9
5	1
6	1
7	1
8	1
9	1
10	1
10	9
10	17
10	18
11	1
12	3
12	1
13	1
14	1
14	3
14	4
14	8
15	1
16	1
17	29
17	30
17	31
17	1
18	1
19	1
19	35
20	9
20	1
21	1
22	8
22	1
22	9
22	42
23	1
24	1
25	1
26	29
26	9
26	3
26	1
27	1
28	1
29	1
30	1
31	1
32	1
32	9
33	1
34	1
35	1
36	1
36	9
37	1
37	9
38	1
38	9
38	29
38	67
38	3
38	69
39	1
39	17
39	72
40	1
40	9
40	75
41	1
41	8
42	9
42	1
43	1
43	17
43	8
44	1
44	72
45	1
45	9
46	1
46	9
47	1
48	1
48	31
48	8
48	29
49	1
50	1
51	1
51	8
52	1
52	9
53	1
54	29
54	1
54	9
54	3
55	1
56	1
57	1
57	3
57	29
57	4
58	1
59	1
60	29
60	9
60	4
60	116
60	117
60	1
61	1
61	8
62	1
62	8
63	1
63	29
63	35
63	17
63	42
64	1
65	1
65	72
66	1
66	6
67	1
68	1
69	1
69	9
69	3
70	1
70	8
71	1
72	1
72	8
73	1
73	29
74	1
75	3
76	1
76	148
76	8
77	1
77	8
78	1
79	1
80	1
81	1
82	1
83	9
83	4
83	1
84	1
84	9
84	3
85	1
86	164
86	165
86	31
86	1
86	42
86	169
87	1
88	1
89	1
89	8
90	1
91	1
91	35
91	177
92	6
92	1
93	1
94	1
95	1
96	1
97	1
97	8
98	1
98	3
99	1
100	1
101	72
101	29
101	1
102	1
103	1
104	1
105	1
106	1
107	1
\.


--
-- Data for Name: movie_review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_review (movie_id, review_id) FROM stdin;
3	1
11	2
11	3
11	4
11	5
11	6
11	7
12	8
12	9
12	10
12	11
13	12
13	13
13	14
14	15
14	16
14	17
15	18
15	19
15	20
15	21
15	22
15	23
15	24
15	25
15	26
15	27
16	28
18	29
18	30
18	31
18	32
18	33
18	34
19	35
19	36
20	37
22	38
22	39
22	40
24	41
24	42
24	43
24	44
24	45
27	46
28	47
28	48
28	49
28	50
28	51
33	52
33	53
33	54
33	55
33	56
33	57
35	58
35	59
38	60
38	61
38	62
38	63
38	64
58	65
58	66
59	67
59	68
62	69
62	70
62	71
62	72
62	73
62	74
62	75
62	76
62	77
62	78
62	79
62	80
63	81
63	82
63	83
63	84
64	85
64	86
65	87
68	88
68	89
69	90
69	91
69	92
70	93
70	94
70	95
71	96
73	97
73	98
74	99
74	100
74	101
74	102
75	103
75	104
76	105
76	106
77	107
77	108
77	109
77	110
77	111
77	112
77	113
78	114
78	115
78	116
78	117
78	118
78	119
78	120
78	121
78	122
78	123
81	124
82	125
83	126
83	127
85	128
85	129
85	130
85	131
85	132
87	133
87	134
87	135
87	136
87	137
88	138
88	139
88	140
88	141
88	142
89	143
89	144
89	145
89	146
89	147
90	148
90	149
95	150
95	151
95	152
95	153
95	154
95	155
95	156
96	157
96	158
97	159
97	160
97	161
98	162
98	163
98	164
98	165
98	166
99	167
99	168
100	169
100	170
100	171
100	172
101	173
101	174
102	175
103	176
103	177
103	178
103	179
104	180
105	181
105	182
105	183
105	184
105	185
105	186
105	187
106	188
106	189
106	190
106	191
106	192
107	193
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review (review_id, review) FROM stdin;
1	Released in 1986, Aki Kaurismaki's <i>Varjoja paratiisissa</i> (Shadows in Paradise) is one of the Finnish filmmaker's earliest efforts, and it stands as one of the most idiosyncratic romantic comedies of all time. The painfully shy Nikander (Matti Pellonpää), a garbage man, means the moody Ilona, a supermarket checkout girl. The film tracks their bumbling attempt to establish a lasting relationship: dates that end as soon as they've begun, a romantic getaway where they each retreat to separate hotel rooms, and rare conversations which employ the absolute bare minimum of words. Nikander's best and only friend Melartin (Sakari Kuosmanen), whom the garbage man only recently met through a spell in jail, gives some needed encouragement.\r\n\r\nThe film's soundtrack is rooted in early rock-and-roll, though unlike later Kaurismaki films where the characters seem to be living in a 1950s bubble, all the action takes place in contemporary Helsinki. I've criticized Kaurismaki's vision of Finland in other films, but <i>Varjoja paratiisissa</i> does, in my opinion, accurately depict the collection of gloomy, taciturn binge drinkers that are the Finns.\r\n\r\n<i>Varjoja paratiisissa</i> is an early work and doesn't show the confidence of later efforts, but it's still quite entertaining, its leads and their struggles extremely charming, and I would recommend the film. Certainly the performances of Pellonpää (in a typical Pellonpää role) and Outinen (who seemingly reinvents herself in every film) will prove quite memorable.
2	(As I'm writing this review, Darth Vader's theme music begins to build in my mind...)\r\n\r\nWell, it actually has a title, what the Darth Vader theme. And that title is "The Imperial March", composed by the great John Williams, whom, as many of you may already know, also composed the theme music for "Jaws" - that legendary score simply titled, "Main Title (Theme From Jaws)".\r\n\r\nNow, with that lil' bit of trivia aside, let us procede with the fabled film currently under review: Star Wars. It had been at a drive-in theater in some small Illinois town or other where my mother, my older brother, and I had spent our weekly "Movie Date Night" watching this George Lucas directed cult masterpiece from our car in the parking lot. On the huge outdoor screen, the film appeared to be a silent one, but thanks to an old wire-attached speaker, we were able to hear both the character dialogue and soundtrack loud and clear. We even had ourselves a carful of vittles and snacks - walked back to our vehicle, of course, from the wide-opened cinema's briefly distant concession stand. Indeed, it had been a lovely summer evening that July.\r\n\r\nFrom the time the film started, with my brother and I following along as our mother sped-read the opening crawl, I began to feel rather antsy, thinking that this movie, the first in a franchise that would soon be world-renowned, was going to be boring, due to its genre being Science Fiction: A respectably likable, but not a passionately lovable genre of mine DURING THAT TIME. I just didn't believe I was going to like Star Wars all that much ... But I soon found myself intrigued ... And awed.\r\n\r\nGeorge Lucas is a man with a phenomenal, and I do mean phenomenal imagination. Apart from his human characters (Han, Luke, Leia, and Obi-Wan Kenobi, among others), the droids: C-3P0, R2-D2, R2-series, and IG-88, not to mention those unusual characters like Jabba the Hutt, Yoda, and Chewbacca, just to name a few, are all creations of Lucas's phenomenal imagination. And I was completely in awe of each one of these strange beings. Then there was Vader ... And the evil Emperor ... And the Stormtroopers ... And the Spacecraft ... And the galaxies (I'll admit that I am a huge lover of the Universe in all its Celestial glory) ... And the magnificent planets ... The Lightsabers ... And so on. Star Wars is a gorgeously shot space opera; it is truly an epic masterpiece. We enjoyed this film tremendously. And my brother was a die-hard fan from that night onward. He, my brother, had even received for Christmas that year, nearly every Star Wars action figure that my mother could find, including two of the spacecraft: The Millennium Falcon and Star Destroyer. The Death Star space station had too been wrapped beneath our Christmas tree - tagged with his name. It was totally crazy, what the new Star Wars era. Frenzied! But it was great ... Even still, to this day.\r\n\r\nI don't personally know anyone whom has yet to see Star Wars, but that certainly doesn't suggest there are still a few people out there who haven't. And if you're one of the latter, then you should know that this classic space opera comes highly recommended. The entire series is told backwards, so you'll definitely want to see Star Wars first, followed by its two sequels: The Empire Strikes Back and Return of the Jedi ... In that order. I trust that you'll too discover yourself to be a lifelong cult fan in the wake. 😊
3	A long time ago in a childhood not too far away...\r\n\r\nPrincess Leia is captured and held hostage by the Imperial Army as it seeks to rule the Galactic Empire. An old Jedi Knight by the name of Ben "Obi-Wan" Kenobi may just be hers, and the rebels only hope. Teaming up with farm boy Luke Skywalker, scoundrel Captain Han Solo, and a couple of quirky droids, Kenobi sets off on a mission that could well shape the destiny of the Galaxy, and all who dwell within it.\r\n\r\nBack in 1977 I was but a wee 11 year old boy, weened on films from all genres by my movie loving parents, I had no idea that Star Wars was to have the same impact on me as Jaws had two summers previously, where yet again I found myself queueing around the block for two whole hours to see a film in a one screen theatre. My love of cinema firmly cemented, Star Wars was the start of a love affair that lasts to this very day.\r\n\r\nAs the years have rolled by and my love of cinema has taken on more in-depth and serious tones, I have come to realise that Star Wars proves to be a far from flawless picture. Certainly its detractors do point to some frayed acting and call the plot structure a jazzed up good versus evil axis, while the charge of George Lucas referencing many prior pictures most assuredly stands, but really do those things matter? No they do not, because Star Wars opened up a new world of cinema, something of a portal to youngsters such as I, it got people talking and debating about the merits of model work in films (which is of an extraordinary high standard here), it nudged film makers to explore being bigger and bolder in their approach, and crucially, above all else, it got film goers hungry again, a hankering for more please if you may. Now it has to be said that all that followed 20th Century Fox's historic blockbuster didn't run with the baton, in fact most pale into comparison on impact value, but for better or worse (depending on the discerning viewers peccadilloes), Star Wars stands as a bastion of adventure laden entertainment.\r\n\r\nIt is by definition one of the most successful films in history, George Lucas perhaps didn't know it at the time, but in what was to become an almost operatic anthology, he didn't just make a movie, he created a whole new world seeping with style and rich texture. Almost as amazing as the success of the series, is how it has become part of modern day pop culture, anything from religion to everyday speak has at some time or another referenced Lucas' baby. Ultimately, though, it's one single thing that made (and still does make) Star Wars so great, it's that it has the ability to lift the audience into a rousing united feel good cheer; and that is something that few films can ever lay claim too. In 1977 it was an awe inspiring event to watch in the theatre, now here in my middle age it's an event that is like hugging a dear old friend, a friend that I know will never ever let me down no matter how many times I turn to it. 10/10
4	Star Wars (1977) is a true masterpiece of cinema, and is \r\n  definitely one of the best films ever made.\r\n\r\nFor me Star Wars (1977) is the best movie of all time,tied with The Lord of the Rings trilogy. Star Wars (1977) it is for sure the most iconic film of all time everything in it is iconic. The direction, the script, the performances in this film are brilliant, all the characters are captivating and well developed. \r\n\r\nAnyway, this is a totally perfect film, I only have praise for it, it is certainly a masterpiece of cinema, and my grade for it is 10\\10.
5	A quality start to the franchise.\r\n\r\nI say start, I guess that depends on the (seemingly) controversial way of watching these films - I've decided on release order, so it's the beginning for me anyway. I've heard a lot about <em>'Star Wars'</em> so I am expecting big things, this didn't disappoint whatsoever.\r\n\r\nI unquestionably enjoyed this! If I didn't know this was released in 1977 I would never have guessed, it still holds up astonishingly well. The special effects are spectacular for the vast, vast majority; even the stuff that perhaps hasn't aged as supremely still looks superb.\r\n\r\nThe cast are a joy. I actually wouldn't say any performance sensationally stood out, but all the actors and all the characters are so much fun to watch together. Mark Hamill is impressive as Luke, Harrison Ford is entertaining as Han and Carrie Fisher is super as Leia. Credit also to James Earl Jones and Alec Guinness, among others. Despite not watching until now, I literally already knew all of the character names - shows how timeless these are.\r\n\r\nThe plot makes for top notch viewing, I found the pacing to be particularly spot on. And how about that score? Stupendous! I really have no negatives for this, I'm sure it isn't perfect but I had a very fun time with it.
6	Everyone and their mother is going to write reviews about the Star Wars movies...and this one, this one actually came out before I was born.\r\n\r\nIt breaks the heart. I had to wait until the re-release before I got to see this one on the big screen. This is the one that ruined my Star Wars opening night streak...\r\n\r\n...Well The Force Awakens ALMOST ruined it further. I had to drive out to my parents house just to see it, for the sake of tradition, and when I got there they had already gone without me...twice.\r\n\r\nSome angry words later and I guilted my mom, pointing out the drive, to force her into a third go.\r\n\r\nBut that is neither here nor there.\r\n\r\nThis was the movie that started it all. And the first time I saw it, it was on Beta. Once upon a time my family had the movie in Beta. And then I had the trilogy in VHS. And then I had it on DVD. And it is going to repeat like that as the mediums change.\r\n\r\nIts one of those movies that you have to own, even as technology changes. It is actually one of those movies you want to buy right away when the technology changes, just to see it in better and better quality.\r\n\r\nThat should be saying something right there. But for a lot of you its not.\r\n\r\nFor the rest of you, it is a fairy tale in space, complete with knights and old wizards and a princess. Only its a fairy tale in space made for, well, made for nerds like me.\r\n\r\nIt is a legend and the type of legend that stays with people and makes old Gen-Xers like me, cynical and grumpy, feel like little kids again.\r\n\r\nIt, along with the Godfather, is the type of movie that breeds mental spousal abuse as generations of men force their wives at gunpoint to watch them...and then get confused and a little depressed when most of them don't see the fascination with them.\r\n\r\nUnlike the Godfather, however, its the movie that fathers force their children to watch and, then, their children carry the love for it into the next generation.\r\n\r\nStar Wars is an endless cycle, even the bad ones are good. And the fans create endless theories about them. They buy the t-shirts, the buy the toys, they do everything they can to preserve that love and pass it on.\r\n\r\nA New Hope, this is the film that started all of that, and though there are better installments, this will always be the first.
7	Thinking back to the films that define my generation; I recall queuing round the cinema as an excited 10 year old for two hours waiting to see this film. I wonder how many people could say that they have done that in the last 20 years? This film is a truly groundbreaking piece of formative cinema. Leaving aside the magnificent special effects; this is a film about good and evil; empire, freedom and democracy and of their true characterisations. It has a slightly stilted script (particularly from Sir Alec Guinness) but that is more than offset by a fabulous John Williams' score and the hugely engaging performances of Hamill, Fisher and Ford with undoubtedly the best baddie cinema has ever seen in "Darth Vader". Truly a wonderful watch.
8	One of the best animated films I have ever seen. Great characters, amusing animation, and laugh-out-loud humor. Also, watch for the little skit shown after the credits. It's all great stuff that simply must be seen.
9	Utterly stunning.\r\n\r\nThere isn't anything to dislike about <em>'Finding Nemo'</em>, it sets the tone perfectly and expertly tells the tale of Nemo, Marlin and Dory. Considering how the story goes, the film does an outstanding job at seamlessly switching between Nemo's adventure and his father's - it's truly terrifically done.\r\n\r\nThis also includes a whole bunch of memorable characters and voices. Alexander Gould, Albert Brooks and Ellen DeGeneres are the obvious stars as the early mentioned trio. There's a load of others though, with Willem Dafoe (Gill), Geoffrey Rush (Nigel) and Barry Humphries (Bruce) all giving excellent performances.\r\n\r\nThe animation is superb, a few moments haven't aged as greatly but the absolute vast majority still looks unbelievable. The premise is funny, cute and heartwarming - as it keeps one's attention from start-to-finish. The score is fantastic, too.\r\n\r\nHighly recommended.
10	Awesome ocean visuals and fun story do a good job glossing over dark themes of loss, addiction, hopelessness and despair.
62	This was one of the first movies I really loved. Some moments are especially beautiful and I appreciate the folks who put in the labor to make this. Thank you
102	An intense, serious and harrowing portrayal of the H.G. Wells classic. Tom Cruise doing an excellent job of not being Tom Cruise and Dakota Fanning out acting everyone. It's hard to call this film an enjoyable watch as it's actually emotionally affecting at times, with some very raw realism concerning human nature. This movie manages to keep a constantly high pace without being exhausting to watch. Well worth a place in your collection.
11	"Nemo" is your typically adventurous and curious offspring. Living amidst the wonders of the Barrier Reef has began to wear on the young clownfish, though, and he yearns for the open ocean. His dad knows best and has forbidden him from leaving the safety of their home waters but one day his nose gets the better of him as he espies a fishing boat and next thing he is caught by a diver who whisks him off to the surgery of a dentist where he is deposited in a tank with some fellow prisoners - awaiting the arrival of the man's daughter who is to be the new owner of "Nemo". Now young as he is, he's not without nouse and is soon working on a plan to return to the open sea - which they can all see from the window! Meantime, pop "Marlin" is in a panic and in his search for his wayward son encounters "Dory" - a forgetful fish who thinks she's seen a boat, but then again... Loads of colourful and enjoyable escapades follow as the pair use ingenuity and take quite a few risks to become reunited. First things first - "Dory" just annoyed me. Right from the start I was hoping that she would become shark fodder. She has short term memory loss - but how does she remember that? Anyway, apart from that there are loads of endearing characters here from the vegetarian sharks, the loveable "Peach" and the characterisation of "Nemo" imbues him with an innocence and mischievousness that has to raise a smile - and even engender a bit of concern - as he seems destined for transit in the same plastic bags we all used to use for our goldfish back in the day. The animation is gorgeous and the clever soundtrack (there's even a bit of Herrmann's "Psycho" in here) adds loads to enrich this classy and charming adventure. It's really a big screen experience, if you can.
12	Best movie ever.
13	This is the best movie ever!
14	"Forrest" (Tom Hanks) isn't the sharpest tool in the box, but he has an heart of gold and an unparalleled sense of human decency. These laudable characteristics are the result of an upbringing by his mother (Sally Field) which has seen him grow from the bullied young boy from Alabama who discovers that he can run a little faster than your average bear, to a sort of national hero. We learn all this from him as he sits at a bus stop chatting to an initially disinterested nurse, and then to a collection of fellow travellers who learn of his drafting to Vietnam. That's where he meets "Lt. Dan" (Gary Sinese) and his new best friend "Bubba" (Mykelti Williamson) and where his innate sense of what's right saves lives and earns him the plaudits of a grateful nation (and gets his butt-ox on television too!). His army days taught him much, but nothing so useful as a skill at table tennis. Soon on the American ping-pong squad in China, he manages to get an endorsement that allows him to reunite with the hippified, now paraplegic and disillusioned "Lt. Dan" and make a mint shrimp fishing, before returning home to face some fairly predicable family trauma. All of this has been happening against a story of a longing for his one true love. "Jenny" (Robin Wright). They've been friends since childhood, but she has a wandering spirit and though his love was requited, it wasn't what he needed. Might there be a future for them, ever? Robert Zemeckis uses a chronology of events in the USA, starting in the 1950s, to create a template for the story of a man who lived through racial tension, war, bullying and emerged the stronger; the more honourable and despite his low IQ was quite capable of putting those more intellectual around him to shame. The photography that cleverly superimposes him into television broadcasts works entertainingly as he gazes bemusedly out onto a audience that is increasingly warming to him. I will admit, I struggled a bit with the running segment towards the end, but Hanks epitomises determination and integrity with Eric Roth's adaptation of the Groom novel allowing plenty of philosophical food for thought whilst having a laugh at scenarios both serious and ridiculous. Like life itself, this film is like a box of chocolates and though I didn't love them all, there were plenty to enjoy and reflect upon.
15	The film American Beauty to me is a film about purpose. What is your purpose in life? The film teaches that there is such great beauty in the small things in life and that sometimes you need to take a step back to allow yourself to take in the unfiltered beauty in the small things like a plastic bag dancing in the wind, playing with the leaves. The film tells it's audience that the beauty in the small details is much greater than society's typical image of beauty. The prominent rose in the film is a symbol of false, surface beauty; the expensive and romantic flower is amongst almost every single shot in the film reminding us that we need to look beyond the surface beauty of an entity and see the beauty within. This message surrounding beauty is empathised with the inclusion of the rose on the films poster and the tagline, 'look closer' indicating that to see real beauty one must 'look closer', a task that typically requires more thoughtfulness and less immediate facial value judgements that make up the typical image of beauty.
16	I first saw this film in my teen years. I didn't understand the plot of the movie back then but found the erotic scenes interesting. I think I was also impressed by Lesters change in attitude back then. \r\nRewatching it in my early thirties the movie really catches me. The story of every character is catching, because everyone is struggling with different ordinary problems, some of them probably known by every adult. \r\n\r\n* Lester is fighting with his midlifecrisis and wants to break the devils-wheel of his boring everyday life. He also hates his job and the responsibility he has to carry because of it. \r\n* His wife Annette is frustrated by her job, because she isn't as successful as she wants to be. To bring more joy in her life she starts an affair with another (more successful) real estate salesman.\r\n* Their daughter Jane has a lack of self-confidence. She wants to be more like her more attention-getting friend Angela. \r\n* The neighbor Colonel Frank is militant, conservative and wants to give his values to his son. As he thinks his son is gay, he thinks it is his failure because of himself feeling attracted by men.\r\n* The neighbors son Ricky is a survivor. He tries to mimic to be a good son to his dad to stay out of trouble with him. Because he wants the newest technology (TVs, Camcorders, etc.) he is dealing with drugs.\r\n* Angela lies that she is sleeping with a lot of boys just to feel more self-confident when her friends geht jealous. She wants to become a model and tries to avoid to be ordinary in any way.
17	It was a ok movie. I didn't like Kevin Spacey creeping on a young teenager, but other then that it was a good movie.
18	"The Greatest Movie of All Time!" That's the general opinion of this movie, and I agree that it is a great movie, but I have seen better movies. \r\n\r\nThe story of Citizen Kane is simple, a newspaper tycoon named Charles Foster Kane (Orson Welles) dies, and his last word is "Rosebud". No one knows what it means, and a reporter starts interviewing people Kane knew, to see if they know the meaning of "Rosebud". Through flash-backs we get to see Kane's life.\r\n\r\nNow, as I said, I don't agree that it's the greatest movie of all time, however it's great. I love this movie. It's a daring and controversial movie of its time, and it introduced alot of new technices in filmmaking. The acting is superb! Orson Welles as Kane is breathtaking, Joseph Cotten as Jed Leland is great. There's one performance I can hardly stand though and that's Dorothy Comingore's performance as Susan Alexander. Hideous performance to say the least! The writing is amazing, and Welles' directing is out-of-this-world!\r\n\r\nIn conclusion, great movie (however not the greatest ever made). It's definitly a movie you need to watch!\r\n\r\nI give it a 9/10
19	I fondly recollect, growing up in Canada in the 70's and 80's, my mom taking my older sister and I to the cinema (my dad was more interested in watching bowling, hockey, or either crime shows, British sitcoms or hockey on TV). Despite all of his TV appearances over the years, and films he acted in to fund his own productions, the first time I was aware of Orson Welles was one of those startling and bizarrely professional yet unmistakably charismatic 'Paul Masson' wine commercials that they tend to make fun of on The Simpsons in these decades gone by. My first thought was 'that voice is amazing', then 'he looks like he'd be a fine grandfather or Santa Claus', and I instantly wanted to know who he was: Just the way he carried himself, I knew he must be both brilliant and someone who was really important.\r\n\r\nAs you can tell, I'm not going to unnecessarily repeat all the endless accolades this film has gotten over the years. If you're any type of film lover, you have either seen this or will eventually--unless you're hit by a bus tomorrow (Heaven forbid) or something else drastic. It's a hallmark of what is possible in cinema. I waited until I was 46 to see this, because of its stellar reputation. It's not my favourite Welles--either acting or directing, and not by a long shot in either regard--but I'm very glad that I finally saw it, and I'll probably revisit it every couple of years for the rest of my life. There's just something really special about it that's hardly ever seen any more--and I think of that just as wistfully as Charles Foster Kane did about his beloved 'Rosebud'. That a 25-year-old could be so gleefully and breathtakingly experimental and innovative, yet still endlessly entertain, is nothing short of miraculous.
20	If you enjoy reading my Spoiler-Free reviews, please follow my blog @\r\nhttps://www.msbreviews.com\r\n\r\nThe "greatest film of all-time", everyone declares. I've been revisiting David Fincher's career this last week since he's in charge of directing the upcoming Mank, which premise approaches the story behind Citizen Kane's screenplay credit controversy back in 1941. Herman J. Mankiewicz unquestionably helped Orson Welles writing the script for this movie, but if that contribution was enough to warrant his name on the film's credits, well... Apparently, it was settled that Mankiewicz (known as Mank) did indeed deserve that recognition since I just had to write his name on the "written by" section above. Nevertheless, this review doesn't concern that external issue, but yes, the most globally acclaimed movie in cinema's history.\r\n\r\nI always defend that someone's opinion about a film is as valid as everyone else's. Unless the arguments used are disrespectful, reductive comments such as the cliche "it's just boring" or the externally influenced "I don't like that actor in real life, hence the movie is awful", I'm always ready to discuss a film with anyone who shows respect for the respective flick. There's an interesting question people keep asking me: "should I watch this old movie that everyone talks about? It's just that..." and usually they linger around here. Probably, afraid of saying something like "it's still in black-and-white" or "its visuals are so old-fashioned". This is a pretty common behavior in the entertainment realm that is film watching.\r\n\r\nI always reply back with another question: "if you love movies, why wouldn't you want to watch such a highly acclaimed film, no matter how old it is?" And, again, people hesitate because they've never asked themselves this. They're afraid that their "discrimination" against old movies might affect their overall opinion about them, and then be in that complicated position that is being in a very small minority. If there's something time didn't change is that people still don't know how to behave when they're part of a little group with an unpopular opinion. Some follow the offense route, attacking anyone who disagrees with them. Others create conspiracy theories, saying that most people think otherwise because they followed the herd, not possessing a genuine, personal opinion.\r\n\r\nIf you love the art of filmmaking, if you enjoy going to the film theater, then watching older movies will only improve upon that passion. However, there's a certain responsibility that the viewer should always have. As a spectator, we must always be able to place ourselves in the adequate period. We can't watch a 1941's film with the cultural, technological, social rules, and mentality of 2020. It would be extremely unfair to these movies since our enjoyment will be affected by modern political views, religious perspectives, and historical differences. We will look at a film like Citizen Kane, and deceivingly think: "I don't see anything remotely new or innovative in any shape or form".\r\n\r\nThis leads me to a suggestion I always give every movie lover like me. It doesn't matter too much if you do this before or after the actual viewing of an "old film", but do a quick research on its impact on filmmaking and our culture. Understand why or what makes the movie so special. Learn what to look out for when watching the film, and adjust your knowledge of everything to the year of release. Try imagining yourself as a person living in that year, leaving home to go to the closest movie theater, and sitting in your favorite spot to watch a new motion picture. If you're able to do all of this, then there's absolutely no way of not acknowledging the unprecedented, groundbreaking, historically impactful Citizen Kane.\r\n\r\nStill to this day, film critics get that childish, ignorant judgment of "critics don't know how to have fun, they only value artsy stuff that no one cares about". I'm not going to enter a debate about this, otherwise, I'd have to write an essay, but I will address that last part. The "artsy stuff" is what movies are made of. Without the artists behind each technical component, we wouldn't evolve to the point of getting the visually mind-blowing films we receive every month. Well, Citizen Kane impacted every single piece of cinema and shaped the filmmaking industry. People complain about directors not being able to share their original vision in 2020? Try making a movie 80 years ago, where studios were always responsible for the final cut.\r\n\r\nOrson Welles changed that process, and much, much more. From the original marketing campaign (it was the first time a trailer didn't contain a single shot from the actual film) to the inventive storytelling structure, there's no denying that the groundbreaking technical aspects transformed filmmaking forever. At the time, ceilings weren't shown, hand-held cameras were unheard of, the lighting had strict rules, and unconventional angles weren't used. Gregg Toland's cinematography changed all of that and tremendously influenced how movies are made today. His experimental methods gave rise to the imaginative use of "deep focus", where the camera shows the foreground, background, and everything in between, all in sharp focus.\r\n\r\nToland was so crucial for the success of Citizen Kane that Welles decided to share the credits spotlight with him. Vernon L. Walker, as the VFX supervisor, employed techniques so impressive that just a few months ago, we had the famous Corridor Crew VFX team breakdown a particular sequence, and most of them didn't know how Walker did it. The latter was a pioneer in shooting massive crowds and wide interior places. Robert Wise's editing is the main component in the famous breakfast montage, by creating a sequence in the exact same location while the actors change their clothes and make-up between cuts, giving the feel of time passing by even though the set design is still the same\r\n\r\nIn every other technical component, innovation is the keyword. Bailey Fesler and James G. Stewart employed rarely used radio techniques to simulate crowd noise and singing. Bernard Herrmann composed an unconventional score due to its pauses and short bits of soundtrack, something utterly different from the typical non-stop music of Hollywood films. Finally, Mankiewicz and Welles' screenplay. Its structure based on flashbacks and a nonlinear timeline was unique at the time. It's probably why the movie doesn't feel as old as other films when watching it today. Citizen Kane is decades ahead of its time, technically and story-wise. And its ending... still as powerful and jaw-dropping as in the first time I saw it.\r\n\r\nIt became the most influential movie in the history of cinema. It's constantly at the top of many "best films of all-time" lists, and it's still the number one movie for several critics. Orson Welles' film is probably the movie with the most amount of hype one ever got, to the point of making people afraid of even saying that "it's fine", let alone dislike it. If you think Citizen Kane is a bit boring or that the actors aren't that good or even if you weren't surprised by anything... you're far from being alone. People talk about this film like it's a once-in-a-lifetime experience, a movie that will take people to Mars or to another galaxy. It's understandable if many viewers simply don't find any of the phenomenal qualities that everyone talks about.\r\n\r\nThe fact that most of the film is astonishingly innovative doesn't take away the other fact that it's still a movie from 1941. If it was released today (with all the natural modifications), most people would find it a very well-directed film, technically exceptional, and possessing a quite remarkable character-study. It doesn't mean it has to resonate with everyone. There's no movie in history loved or hated by everyone, and there will never be one. I don't ask you to learn to love Citizen Kane. I ask you to comprehend its legacy, background, and undeniable impact on filmmaking and our culture. Almost every film we see on massive IMAXs today, we owe that to Orson Welles and his visionary production.\r\n\r\n80 years after its release, Citizen Kane continues to be addressed by many as "the greatest movie ever made". It became the most popular film of all-time, one that went through decades of in-depth essays. Everything that needed to be said about it has already been stated, recorded, and written. No movie warrants higher expectations from its viewers, but this massive hype makes it a dangerous film. People fear being judged for not understanding the worldwide acclaim or simply disliking it. Is it a tad boring? Are some actors flat? Is the story not as mesmerizing and memorable as you'd expect? Don't be afraid to say "yes" because all of these opinions are entirely reasonable. None of this contradicts the indisputable influence it had on filmmaking and in the history of cinema. Everything about this movie's production and origin, the precedent-setting technical aspects, and the innovative storytelling all prove that Orson Welles was a perfectionist filmmaker far ahead of its time. Is it the best film ever? That's a never-ending debate I don't wish to be a part of. But it's undeniably one of the most magnificent masterpieces of cinema, one that every movie lover must watch.\r\n\r\nRating: A+
98	There's really no point to the movie. Just a lot of violence. That's pretty much it.
126	If you like Extreme EXTREME Close Ups filmed on an iPod Shuffle, then oo boy do I have the film for you.\r\n\r\n_Final rating:★½: - Boring/disappointing. Avoid where possible._
21	Outstanding film, no question.\r\n\r\n<em>'Citizen Kane'</em>, at least to me, feels like such a unique film in terms of how it is brought to life - I don't recall seeing anything that exactly matches it in that regard. It's thoroughly entertaining, I do love how it is crafted together. The score is terrific and the performances from the cast are excellent.\r\n\r\nOrson Welles, the director too of course, is perfect for the titular role. He is sensational, it must be said. He makes Charles Foster Kane absolutely fascinating, despite the questionable nature of the character. I basically enjoyed everyone else who came onscreen, the more memorable ones being Joseph Cotten (Jedediah) and Dorothy Comingore (Susan) - George Coulouris (Thatcher) has a few amusing moments, also.\r\n\r\nThe editing and pacing are two other things that impressed me, as did the fantastic <em>News on the March</em> opening. This is one of those films that I've heard about for as long as I can remember, so I'm glad to finally get it watched - added to the fact it didn't disappoint.
22	_**Not the greatest film of all time, but has its points of interest**_\r\n\r\nAfter the death of an American newspaper tycoon with political aspirations (Orson Welles), his relatives and associates are interviewed with one reporter trying to figure out the meaning of his last word, “Rosebud.” \r\n\r\n"Citizen Kane" (1941) was Welles’ first feature film, which he co-wrote & directed when he was only 25 with a cast of theretofore unknowns (e.g. Joseph Cotton). It’s regarded as “the greatest movie ever made” by many respectable people and was, for instance, Roger Ebert’s favorite film.\r\n\r\nCharles Foster Kane and his magnificent homestead Xanadu were inspired by media barons like William Randolph Hearst and his never-completed Hearst Castle. The concept naturally brings to mind Elvis and Graceland, Michael Jackson and Neverland, and Donald Trump and Trump Tower (or whatever).\r\n\r\nOn a filmmaking level there’s a lot to appreciate, including techniques that were fresh at the time of its release, such as unusual camera angles, lens distortion and the creative use of flashbacks. Up to that point in film history, for instance, ceilings were never shown because that’s where the mics were located, but Welles included myriad scenes from low angles with the ceiling obvious in the background.\r\n\r\nThen there are the interesting interpretations, including the two main ones, which seemingly contradict: The enigma view suggests that the nature of a person is ultimately a mystery based on numerous subjective truths of different people’s perspectives whereas the rosebud interpretation proposes that a person’s life can ultimately be figured out based on a key clue. In Kane’s case, the clue is linked to lost innocence, the comfort of childhood, a mother’s love and the lack of responsibilities thereof.\r\n\r\nAs far as entertainment goes, the flick starts with vigor and features some highlights (e.g. the lively dancing sequence, Kane’s political ambitions and the hollow halls of Xanadu) and human interest (e.g. Kane’s relationship with the amateur opera singer), but I found it unengaging too often. I simply didn’t find Kane a fascinating enough character and therefore didn’t ‘get’ the obsession with interpreting his life. Still, I wouldn't call this "Citizen Suck." \r\n\r\nFor greatest movies ever made I’ll go with flicks like “Apocalypse Now,” “Runaway Train,” “Raiders of the Lost Ark,” “Dead Poets Society,” “The Mothman Prophecies,” “Watchmen,” “The Green Mile,” “Star Trek IV: The Voyage Home,” “Dances with Wolves,” “The Horse Whisperer,” “Lucy,” “Troy,” “One-Eyed Jacks,” “Mutiny on the Bounty” (1962), “Tarzan and His Mate” and “One Flew Over the Cuckoo’s Nest.”    \r\n\r\nThe film runs 1 hour, 59 minutes, and was shot in SoCal and New York.\r\n\r\nGRADE: B-/C+
23	If ever there was a film epitomising the best and worst of the "American Dream" then this has to be the one.... Orson Welles has mastered the role of the playboy millionaire who decides to have a go at running a small provincial newspaper - ostensibly to empower the common people and give them a voice... Shortly his combination of wealth, determination and deftness has created a monster with tentacles into almost every aspect of American life; and with that, as they say about absolute power - a good dose of personal ambition and corruption. Gradually losing those around him who debate and challenge, he becomes an intellectual brute; a tyrant - and an emotionally unfulfilled one at that. Joseph Cotton is also superb as his best friend who suffers with his own internal turmoils as he watches the rise and rise of "Kane"; Everett Sloane as his long-suffering sidekick and Dorothy Comingore as his second wife "Susan" plays her role almost exactly as an immature child, in the care of a stern but equally immature guardian. It is as much a social commentary of 1940s aspirational America as it is a powerful depiction of megalomania - and although it has certainly lost some of it's bite over the last 80 years it still delivers a powerful analysis of the concentration of wealth, power, and influence that could easily be applied (to social media domination) today. As with so many Hitchcock films, Bernard Hermann delivers an enveloping score in which this all floats nicely - and technically, it wants for nothing - the eeriness and sterility of "Xanadu" contributing wonderfully to the last half hour of this enigmatic story.
24	ctually every bit as good as it supposed to be. To anyone who likes to think they're being edgy by calling it overrated or whatever, I know you're just saying it because you think it makes you cool and counter-cultural or whatever, so I probably can't change your mind whatever I say here, but one thing anyone should try is watching all the Academy Award nominees, or at least the Best Picture nominees, from the 14th Academy Awards, in sucession, perhaps one a day. Despite only winning one award, and famously losing out on Best Picture, this film makes all the others look embarrassingly dated. Even the ones that are also very good look like Roundhay Garden Scene compared to this. It truly is a revolution of a film. Welles could have gone exclusively into gore porn after this and he would still be a good candidate for the greatest talent in American cinema. This film has already been rightfully praised so much it's hard to find anything new to say about it, so mostly all I can do is heap on more praise to the pile, but this film deserves it.\r\n\r\nA few things are slightly less talked about from this film that I do wanna bring up though;\r\n1. This is a lot funnier than people give it credit for. Welles himself called it a comedy, I believe, and honestly I can see that. There's some very witty dialogue. My favourite gag might be the "FRAUD AT POLLS" headline.\r\n2. Weird how Welles' obvious self-deprecating joke about how he inserted the screeching cockatoo to wake up any audience members falling asleep has been taken out of context and treated as serious by so many people. It seems obvious to me that it was as a sort of bookend to his relationship with Susan, referring back to the shadow puppet scene where Kane makes a bird\r\n3. The speech about the girl in the white dress is actually one of my favourite monologues in any film. The "frame story" actually has a lot of great moments that people often forget because they spend all their time praising the scenes with Kane in them (and fair enough, they are incredible).\r\n4. Susan's bad singing is some impressive work. It's hard to sing purposefully poorly without falling into cartoonist shrieking, but actress Dorothy Comingore is very good at sound just bad enough to be believable.\r\n6. I like how, unlike most films about "corrupt rich people", this doesn't moralise or turn its character into a Bond villain, but condemns what he represents far more strongly than if it did, because systemic critiques always hit harder than "rich people are mean :(", which is one of the most helpful to the status quo statements you can make, implying as it does that it would be fine if the ruling class could throw us a bone with a few more scraps of meat on it.\r\n7. The opening and final shots might be the best one-two punch of those two things in... certainly a major release American film, if not any film ever. We begin with death, and end with youth. All sounds pretty simple when you say it out loud like this but as I say it's already been analysed in so much depth all I can say is either redundant or just feels like explaining why a funny joke is funny.\r\n8. It's hard to review this without sounding silly. "Masterpiece" is hilariously understating it. Like, of course Citizen Kane is good. What do you want me to say?
25	I watched it because it keeps getting mentioned as one of the best films ever made. I was disappointed. For me it is just average, the hype is unjustified in my opinion. There are much better films from that time and later on.
26	Now I know why I'm stingy with 10/10 ratings. This .. Is the film.by which all others should be judged. It has it all. From the captivating storyline to the exceptional performances, this film truly sets the bar high for cinematic excellence. Its seamless blend of creative framing, music, and narrative pacing tells a story that can never be dated because it's universal and creates an unforgettable movie-watching experience. It resonates on multiple levels.\r\n\r\n\r\nI knew Orsen Welles was great, but this film displays his genius. Welles and Mankiewicz have truly created a masterpiece.\r\n\r\n\r\nFew of us escape our childhood slights and insults, but childhood trauma can create a lifetime prison. It is a complicated psychology that can resist the strongest attempts at fixing it. Few can even begin to explain the lifetime impact, let alone create a film that exposes this very subject. It's a monument to Welles artistry and craftsmanship.
27	This is great but if it is actually the  greatest of all time then I’ll eat my socks.
28	Dazzling Björk in this indictment against the death sentence, in tight close-ups. This film is a UFO, musical without being.
29	This movie is one of the best movies of all time! It has a great story lines and graphics of it's time and even to today's standards it is brilliant. The world is well though out and well demonstrated. Zorg is a great bad guy, played by Gary Oldman and Bruce Willis plays his role very well. All in all a excellent movie.
30	A simple enough concept: Guy must save a World (in the Future!) from Evil! by protecting a Magical Macguffin, only in this case it’s a Girl! instead of a Thing.\r\n\r\nThere’s really not a lot of story here. Not a lot of character either. Why waste valuable screen time with such paltry concerns when you can instead have Chris Tucker prancing around as a flamboyant radio host in the most annoying cinematic sci-fi supporting character not created by George Lucas? Instead, the film casts actors who do a fair job of acting simply by being themselves: Bruce Wills is Korben Dallas, a brawny, shoot-first hero who, when the chips are down, is brawny and shoot-firsty. The Magical Girlfriend MacGuffin, Leeloo, is played by Mila Jovovich (in her breakout performance) and some strategically-placed wrappings (the wrappings have had a harder time breaking into more mainstream roles). Ian Holm turns up as the Old Mentor, and filling out the cast is Gary Oldman as the antagonist Zord (in his hammiest role ever).\r\n\r\nThe film seriously rises to the level of made-for-SciFi Channel-original and no higher. The plot is nonsensical, the acting committed but laughable, and the dialogue so stiff you’d think the script pages had been starched.\r\n\r\nSo where does the film go legitimately wrong? Two main places: first, Besson carries on the proud tradition of French filmmakers doing weird things solely for the sake of being weird. The entire film is filled to the brim with the kind of idiosyncratic touches that I’ve come to expect from that region. Most of the bits don’t work, but I’ll give them credit for keeping things interesting.\r\n\r\nThe second, more serious issue is another that seems to plague genre French directors, and that’s the whole matter being played (largely) for farce. The most successful (creatively) American (sci-fi/)action films are defined in very large part by their villain. This film, like so many other sci-fi/action films I’ve seen from French directors, never establish or maintain an element of power for the villains over the heroes. The villains are painted as clueless, moronic, out of their depth, or outright incompetent. That tradition continues here. What would Star Wars be without Darth Vader? Die Hard without Hans Gruber? Aliens without…uh, aliens?\r\n\r\nLacking a strong (or even memorable) central villain (we have two: a Gary Oldman so hammy I’m pretty sure Muslims couldn’t work on the film, and the other being a giant planet-size ball of…Pure!Evil! No joke.), the film sacrifices the one shot it had at having some kind of weight or dimension. There’s no sense of danger or peril, no chance that the Hero won’t triumph, and [spoilers!] the day is essentially saved by a Care Bear stare.\r\n\r\nSo, does what I’ve just said make it bad? Well, yes. Let’s try again. Does that made it unenjoyable? No, and it’s an important distinction to make. The film is an interesting curiosity. After a half-hour of the bizarre, if you can let yourself be swept into its idiosyncratic world you’ll find a perfectly watchable B (or C)-movie. It rankles a bit to think about how much was wasted making dreck this dreck-y, but it’s entertaining dreck.
31	Ever since I first watched The Fifth Element in the late 90s, I've been inspired by Gary Oldman's Jean-Baptiste Emanuel Zorg.\r\n\r\n_Final rating:★★★½ - I strongly recommend you make the time._
32	Negative, I am a meat Popsicle.  \r\n\r\nIt's 2259 and the Earth is in mortal danger from pure evil. The only hope Earth has is something called the fifth element, which comes in the form of the newly cloned Leeloo. Along with an ex forces cab driver and a priest called Cornellius, Leeloo must piece it together before the end of mankind arrives.\r\n\r\nDepending on which side of the fence you sit on, The Fifth Element is either a child fantasy made by an adult, or an adult fantasy made by a child! Here in lies the problem that many critics and movie watchers can't agree on. Just what does Luc Besson's film want to be? Having conceived the concept for his film at a very early age, Besson I think waited until he was comfortable with his adult eyes, and armed with the technological advancements in the late 90s, to realise his vision. With the result being a beautiful piece of science fiction that is, yes- cartoonish in every other frame.\r\n\r\nCrucial though is that Besson's futuristic vision of New York dominates proceedings, not even a villain overdrive from Gary Oldman can detract from the colourful vistas that Besson has crafted. The sea has dropped and New York is awash with flying cars, there are no take aways anymore, the Chinese junks fly to your front door to serve you food, how cool is that? Shape shifting aliens are amongst us, who in the context of this Jean-Paul Gautier clothed universe, blend in effortlessly, and opera divas are strangely beautiful and blue creatures. In short, the film is an art direction treat, a feast for the eyes, even as the comedy and action take control in the final third.\r\n\r\nBruce Willis quickly leaves behind his successful trip to harder edged roles (Twelve Monkeys) to play super cabbie Korben Dallas. Gun toting and with a quip at every turn, this is the Willis that the MTV generation loves and adores. Oldman, for better or worse as Zorg, gives a memorable performance (oh my, is that a Southern American accent?), but it's with Mila Jovovich (Leeloo) that the film gets its acting spurs. A pure revelation, it begs the question on why Jovovich has failed to progress in the acting world? (stop doing tripe like Resident "will work for food" Evil films would be a good start).\r\n\r\nSci-fi fans will obviously get the point that the support cast features Ian Holm (Alien) and Brion James (Blade Runner), which off sets the annoying and painful turn from Chris Tucker as zany, insecure DJ Ruby Rhod (is Besson having a pop at world DJs here I wonder?). To leave us with what? A film that mildly suffers from its director giving way to his heart over his head, but hey baby, it's one groovy and enjoyable romp from start to finish regardless. 8/10
33	"The Fifth Element" is like a journey down memory lane for me, brimming with nostalgia. I've lost count of how many times I've caught it on TV. The cast was on point, the makeup and costumes were seriously cool, and those futuristic locations were quite intriguing.\r\n\r\nIn the grand scheme of things, "The Fifth Element" is a certified classic. It possesses that timeless quality that's hard to find. I'd easily give it a solid 9 out of 10. But if you're a fan of this movie, you should definitely check out the animated film "Heavy Metal" (1981), which served as inspiration for many animation and science fiction films, including this one.
34	I wonder how many taxi drivers get a fare they wish they's just driven past! Well I think poor "Dallas" (Bruce Willis) might have wished he had done that with the almost mannequin-esque "Leeloo" (Milla Jovovich) as he finds himself embroiled in a plot to conquer the planet. She speaks in syllables that wouldn't have been out of place in an edition of "The Clangers" but still manages to convey the sense of peril to mankind well enough for him to try to track down the priest "Cornelius" (Ian Holm) who might be able to locate some sacred stones that belong to the benign "Fifth Element" in time to save us from "Mangalores" and his evil henchman "Mr. Zorg" (Gary Oldman). of course, we soon learn that "Dallas" is no ordinary, pie-eating, cabbie. He is a former special forces ninja who is no stranger to an Uzi 9mm or to some nimble fisticuffs. Luc Besson manages to integrate some engaging comedy threat into a decent sci-fi adventure that raises a smile. Willis offers his usual style of charismatic, slightly sarcastic, delivery and Oldman (well, more his hairdo, really) camps up nicely as the baddie in charge of an army of alien soldiers who couldn't hit a cow on the tit with a tin cup. There's loads of action pretty much from the start as somehow we just know that Bruce is going to come through for us. It's a parody fo loads of other sci-fi concepts, but it does work.
103	Good watch, could watch again, but it's hard to honestly recommend.\r\n\r\nThis is one of those movies that is good because it is bad, whether or not that is done on purpose, for the purposes of parody.  Otherwise it's just a good old jump in "The Way Back Machine" to see a litany of cameos or cheap parts by almost anyone who was famous in the mid-1990s.  Though I do feel like most of the actors I liked were essentially wasted, but it is possible that was by design so the Martians could keep the focus for the majority of the movie.\r\n\r\nRethinking on the movie almost makes me want a modernization, it has so many little quirks and nuances that really brings it to a special experience.  Even if you think it looks terrible, throw this on your queque and slot it in for a Bad Movie Night.
104	**A film full of black humor, and for that very reason difficult to digest for many people.**\r\n\r\nBlack humor is doomed to be understood by very few, and this film, which is drenched in black humor from beginning to end, paid the price, becoming a minor failure. I believe that, even today, it is one of the less well-appreciated films of director Tim Burton's career, who made films considerably worse than this one.\r\n\r\nThe action takes place in the 90s and portrays a hostile Martian invasion of our planet. The US government (obviously, the other countries have virtually disappeared from the map and only France is mentioned lightly to show the total destruction of the country) is understandably tense: there are military personnel sexually aroused by the idea of using nuclear weapons against the invaders, there are scientists absolutely convinced that Martian technological superiority is reason enough to believe strongly in the good intentions of the visitors, there are politicians worried about the elections. Of course, when it comes time to showdown, the visitors get the upper hand.\r\n\r\nPerhaps the best thing about this film is the strength and talent of its cast, filled with good actors who wanted to work under Burton's guidance. Jack Nicholson stands out naturally in the role of the president and does an interesting job, being well assisted by a discreet Glenn Close and a young Natalie Portman. Lisa Marie plays an unforgettable role where she doesn't have to say a single word, while Danny DeVito seems to revisit some previous characters to do his job here, which is little (but it's also true that he wasn't given much to do) . Tom Jones makes an interesting appearance. Pierce Brosnan looks like he's having fun while parodying himself. We also have good contributions from Sarah Jessica Parker, Annette Bening, Martin Short, Michael J. Fox, Rod Steiger and Jack Black.\r\n\r\nBesides, the film is a gigantic satire on the sci-fi B cinema of the 50s and 60s, where it was common to see martian invaders and visitors. The cinematography is colorful, light, and the environment is light, funny. You can feel that the film doesn't take itself too seriously and doesn't want to be taken too seriously. So it works reasonably well, at least for those who accept dark humor well.
35	Metropolis is one of the greatest films ever made. It's amazing set design, brilliant cinematography, groundbreaking special effects and futuristic story truly makes it one of the must-sees in cinema! \r\n\r\nIt is set in the future, in a city called Metropolis where the citizens are divided into two groups: workers (who live under the ground and are working 10 hour shifts by enormous machines that keeps Metropolis working) and the royals (living in luxury in the great city on the surfice). And over them all, is the creator of Metropolis: Joh Fredersen (Alfred Abel). His son Freder (Gustav Fröhlich) falls in love with a woman of the working-class called Maria (Brigitte Helm) who preaches that a mediator will come and create peace and equality for both workers and royals. Joh Fredersen sees Maria as a big threat agains his "order", so he and the inventor Rotwang (Rudolf Klein-Rogge) kidnaps her and copies her appearence onto a robot, which will destroy the workers faith in Maria. However, Rotwang secretly plans to programme the robot to make the workers destroy the city and crush Joh Fredersen, as an act of vengeance against Fredersen for a sin he committed in the past...\r\n\r\nLang made this film in 1927, and it was a huge blockbuster event of that year. However, after the premiere, the US distributor heavily cut down the film, and thereafter the original version was considered lost for almost a decade. In 2008 they found the original version in Argentina (very damaged, but watchable), which became the basis for the most recent reconstruction (2010). If you are going to watch this movie (as I highly recommend that you do!) that's the version to watch!\r\n\r\nOverall, Metropolis is a REALLY REALLY great movie, that you, once again, MUST watch!\r\n\r\nI give it a 10/10
36	This has got to be the ultimate cinematic illustration of the strata of human existence. Whether it be a story of the survival of the fittest; the cleverest; the most devious; most beautiful - or a hybrid of some/all - it reflects poignantly how humanity always seeks to exist within a hierarchical structure (merited or otherwise, but perfectly epitomised here by the matriarchal, deific robot), but how much more effectively mankind can succeed if it accepts and values everyone and works together. It also clearly identifies the perennial problem of those with the brain always ending up far more successful, comfortable - and powerful than those who do the labour. Hence, this wonderful tale from Fritz Lang takes us to "Metropolis" - a totalitarian - though not necessarily intentionally malevolent - society, in which everyone has their place and role. Except, that is - for the son of the "Master". Like many a fickle youth; he has little to occupy his time and his meaningless existence leaves him ripe for new ideas. When he takes pity on a recently sacked employee of his father and shortly afterwards is exposed to a lifestyle he couldn't even have imagined, the story starts to gain a thought-provoking and unstoppable pace. The score magnificently guides us from the drudgery of day-to-day-life through the emancipating revolution that inevitably follows, with all of the ill-foreseen, largely devastating consequences - like a bottle of champagne that has been shaken, sooner or later the cork pops! It is also a story of love between the son and a woman way, way, way beneath his station. Yes, there is light on the sunlit uplands - and much like a forest fire that destroys all in it's path; this film clearly suggests at the end that hope and optimism will triumph and a green shoots of recovery starts to grow again... It also, as a piece of cinema, is clearly the inspiration for so many directors, cinematographers and story tellers that followed...
37	As a narrative, it's a bit weak. But on other levels, this film is fascinating. The cast, especially Sarah Polley, does a bang up job. Every character real and believable - even the kids.\r\n\r\nFirst and foremost, the film is a strong advocate for "viva la vida" (Frida Kahlo before Cold Play!). There is an old Buddhist parable about a man running from a tiger and suddenly faced with a cliff. In one direction, the tiger; in the other, the cliff. He looks down and sees a branch growing out of the rock. Somehow, he casts himself down and grabs that branch. The tiger looks over the edge at him. He doesn't think either he or the branch can hold on too long. Then he spies a wild strawberry near the branch. He grabs it and eats it. It is the very best strawberry he ever ate in his soon-to-be-over life. And so it is with our protagonist. Having the harshness of mortality shoved in her face at a young age, she begins to live each day with full attention. Something humans hardly ever practice.\r\n\r\nSecond, the interesting, but perhaps unrealistic, decision to withhold her diagnosis and prognosis from everyone, creates an entirely unexpected space. She takes her cue from Dr. Thompson (Julian Richings), who can't look someone in the eye and tell them they're going to die. From there, she decides not to put anyone else in Dr. Thompson's situation. This frees us from the overly maudlin watching someone die thread.
38	Ah, but you have heard of me.\r\n\r\nThe crew of the Black Pearl are cursed by something most unimaginable, the only way to lift the curse is to return a lost Aztec coin to its treasure chest home. In the way of them achieving their goal is the British Governor's daughter, the son of Bootstrap Turner, oh and a former comrade by the name of Captain Jack Sparrow who the crew had left to die on an island some time ago.\r\n\r\nIt's now common knowledge that Pirates Of The Caribbean is a film based upon a theme park ride of the same name, thoughg that ride is not actually a roller-coaster, it's fair to say that this film most assuredly is. A swashbuckling ripper of an adventure yarn cramming in every pirate film staple it can and pouring on layers of charm at every turn. Into the broth goes romance, comedy and striking adventure, and director Gore Verbinski even manages to give the children watching little slices of horror, not enough to keep them up at night, but enough to bring on an uneasy grin.\r\n\r\nIt's unashamedly commercial, produced by that purveyor of OTT entertainment values, Jerry Bruckheimer, it was to be expected, but few blockbusting movies of the new age can lay claim to being such an out and out reason for having fun. This is the reason why Pirates had few peers at the time of its release, for it knows its reason for being, it's not taking itself seriously. The audience is not being hoodwinked in any way, they are having fun because so is the film and so is, crucially, the impressive cast. Johnny Depp as Sparrow is having the time of his life, basing the character around the dubious mannerisms of Rolling Stone icon, Keith Richards, it works to its highest potential and Depp is simply wonderful in the role. Keira Knightley (perfectly cast), Orlando Bloom, Geoffrey Rush, Jack Davenport, Jonathan Pryce and Mackenzie Crook all do what was asked, which is essentially say your lines right and have a blast with it, it really is that sort of picture.\r\n\r\nThe subsequent sequels would forget what made this first offering so enjoyable, foregoing the outrageous sense of fun for a dark sheen and character development. That is a shame, but at the very least we still have this wonderful picture to go back to time and time again, to lift you up when one is down or to keep one happy when one is already in that happy place. The Curse Of The Black Pearl is a joy from start to finish. 9/10
39	My favorite out of the series. In my opinion none of them has been as good as the first. Him just trying to get his ship back the Black Pearl.
40	Having been deposed by his crew, "Capt. Jack Sparrow" (Johnny Depp) arrives in Port Royal with little but the clothes he stands up in. He turns up just as the governor's daughter "Elizabeth" (Keira Knightley) is having to fend off the rather unwanted matrimonial intentions of "Norrington" (Jack Davenport). She has designs on the blacksmith's apprentice - "Turner" (a handsome but insipid, sorry, Orlando Bloom) whom she rescued from a pirate raid many years earlier. "Sparrow" would prove an excellent catch for "Norrington" but thanks to an hot poker, a donkey and some legerdemain at sea, he and "Turner" are soon abroad on the trail of his old crew and of the legendary pirates who sail the seas in the "Black Pearl" seeking an odd sort of salvation! What now ensues are some pacily directed escapades with loads of attitude, swash and buckle. Some pithy dialogue and a rousing (if slightly repetitive) score from Klaus Badelt take us criss-crossing the Caribbean constantly jumping from frying pan to fire. The star for me here is certainly Geoffrey Rush. A man who rarely disappoints, and on this occasion brings a comically potent degree of menace as his "Barbossa" character ensures that the plot thickens and the story gathers momentum. It's a bit on the long side - there are a few sagging moments now and again, but a solid supporting cast led by Kevin McNally provide some borderline slapstick humour, occasionally tempered by the dignified persona of an underused Jonathan Pryce's "Gov. Swann" and an whole suite of powdered wigs. The visual effects are top drawer and the story well worth a watch on a big screen to do justice to the imagery and the best traditions of seafaring yarns.
105	Box office $ 5.5 million\r\n\r\nThis was the first time I saw a movie that had nothing close to a human antagonist, yet it kept me glued to the screen. Sure I've read a few novels of the kind but surely they weren't "oh I'm glued" stuff. Everybody at least once in their life dreams of something like this and this movie makes it believable. After watching the movie I really thought that Ethan & Julie must have dated 'cause their conversations were just flowing. Definitely a must see.
168	Of course, it's an Almodovar, so it's already a great film. But this one - the artistic shots, the characters, the story, the humanity - all top notch. I think this film might be his best.
169	I just plain love this movie!
41	This is the movie he made after Jackie Brown. I thought I might just point that out. A big budget, larger scale action blockbuster. This is the one that would change the direction of Tarantino's films. And honestly, it might be my favorite besides Pulp Fiction.\r\n\r\nThis movie oozes with style and beautifully choreographed action. This movie has an anime section akin to Japanese anime. That's some cool stuff. Even the non-action parts are some really good stuff. Like the guy from the old Street Fighter movies as Hatori Hanzo and making the Bride's sword. And the fantastic soundtrack. The great opening scene where the Bride gets shot and then the somber "Bang Bang" by Nancy Sinatra plays. \r\n\r\nBut of course, the amazingly choreographed action makes this movie. A lot of it is showcased in the Crazy 88 fight and the few fights before it. It has some brilliant uses of the style. Of course, there's black and white which was actually used to avoid an NC-17, but works very effectively. And the beautifully shot battle between the Bride and O-Ren. No music really adds a lot to it. It's quiet and oh so effective compared to the loud blood fest of the Crazy 88. \r\n\r\nBut there's also the opening hand to hand fight scene with Vernita Green which is also very well edited. Very surprising scene as it is interrupted by Green's daughter coming home and then they talk. And it starts back again as quickly as it began and then ends once again with a knife to Vernita's chest. What a brilliant tension filled scene.\r\n\r\nThe movie also never takes itself too seriously. That's for the sequel. But the fun action and style leads the whole way. Also along with Buck, and other fun scenes. Lest we forget other great scenes like the whistle scene as Elle Driver comes to kill the Bride in her sleep. Or interrogating Sophie. "These will be things you will miss." I love it.\r\n\r\nHonestly, it might be the best action movie of the 2000s, at least for me. And Tarantino has a lot of my favorite movies. Maybe I enjoy his movies a bit too much. But even with that, it's one of the my favorites. Kill Bill Vol 1 gets a 10/10
42	Not so hush hush but very much on the QT.\r\n\r\nAfter being gunned down on her wedding day by her former colleagues, assassin Black Mamba (Uma Thurman) rouses from a four year coma with only one thing on her mind, revenge! Striking up a death list of five, she sets off for bloody retribution.\r\n\r\nQuentin Tarrantino writes and directs what is in all truth, a homage to all the cinema conventions close to his heart. Think an amalgamation of chop-socky, sexploitation, samurai, spaghetti Westerns, anime and cop shows of years past, and you get the heart of Kill Bill. A film that was so epic in scope it had to be cut into two films. What it lacks in Tarrantino dialogue dynamite it more than makes up for with action and astute visual flair. And it's bloody, very bloody. Thurman is great as the avenging Mamba/The Bride, while the inclusion of Sonny Chiba & Lucy Liu adds a touch of class as QT revels in his East meets West berserker narrative. It could have been trimmed down, particularly in the middle section where Tarrantino deals in a calm before the storm ideal, but Volume 1 was one of the most exciting movies of 2003, and most notably it shows Tarrantino to be adept at action directing. His action skills perhaps explains why the script doesn't crackle with the wit and panache of his previous offerings? You sense he wants more than the words "fine writer" engraved on his granite mined Curriculum Vitae.\r\n\r\nHugely enjoyable with a neat end of film cliffhanger, roll on part 2... 8/10
43	Uma Thurman as an anti-superheroine  \r\n\r\nRELEASED IN 2003 and written/directed by Quentin Tarantino, "Kill Bill: Vol. 1" is an action/thriller/fantasy starring Uma Thurman as The Bride who seeks vengeance on the team of assassins who betrayed her, a group of which she once belonged. Her journey takes her from El Paso to Pasadena to Okinawa. Vivica A. Fox, Lucy Liu, ravishing Julie Dreyfus and Michael Madsen appear as various assassins or accomplices.\r\n\r\n"Kill Bill” is a creative mish-mash of 60s-70's Bond-isms, Spaghetti Westerns and martial arts flicks, but with modern production values. It sometimes plays like a superhero movie in that The Bride is essentially an anti-superheroine who mows down literally armies of skilled fighters, e.g. the overly drawn-out B&W fight with the Crazy 88s. I loved the inclusion of Ennio Morricone's "Death Rides a Horse."\r\n\r\nOn the downside, there’s an overlong lame anime sequence and the characters lack substance and realism, but who can deny the film’s pizzazz? Sure, it’s style over substance, but it’s entertaining in a voguish, quirky way. Since both parts were meant to be ONE MOVIE, it’s mandatory to see “Vol. 2” to properly appreciate and appraise “Kill Bill.” The second part fills in the holes.\r\n\r\nTHE MOVIE RUNS 111 minutes and was shot in Texas, California, Mexico, Tokyo, Beijing and Hong Kong.\r\n\r\nGRADE: B/B- (6.5/10)
44	Interesting usage of anime to tell O-Ren's back-story, but I wasn't really a fan of the cartoonish blood splattering and gratuitous fight scenes.
45	Awakening from a lengthy coma, the expecting "Bride" (Uma Thurman) embarks on a lethal killing spree to avenge herself on those responsible for killing her fiancée and to find out just what happened to her unborn baby. She has a past - formerly a soldier in the "Deadly Viper Assassination Squad" - she formerly dated it's leader "Bill" (David Carradine) - and so in theory has her work cut out for her as she seeks her revenge. Well, except that is, that the aforementioned "DVAA" could not hit a barn door with an Howitzer. Despite their overwhelming numbers, their supposedly expert training and resilience, "Bride" mows through them as if they were wheat to her combine harvester. This film has no jeopardy whatsoever. Thurman looks great and packs quite some charisma into her performance, and Tarantino presents a quirky style to the story, but that story is hackneyed and unremarkable. The characterisations are undercooked and frankly nondescript and the fact that we know there is to be a part two, only robs this all too quickly of any sense of menace. Gory and bloody, yes but so what? A strong and feisty woman lead? Yes, but again - so what? The action scenes are well enough choreographed, but the whole thing has a relentlessness to it that really underwhelms. This director usually makes good use of his soundtrack, and the strong and powerful tones of Nancy Sinatra do tee this up well, but afterwards I'm afraid it just descends into mediocrity and I really struggled to appreciate anything different or innovative about this. Disappointing.
46	Lisa is an exchange student in London. Her affair with Matt has the urgency of the ephemeral. They are enjoying an extended, unofficial honeymoon; we see them dancing, drinking beer, doing drugs, hanging out, having irrelevant conversations and, above all, going to rock shows (all nine of the titular songs are performed live) and having sex (Matt and Lisa have intercourse the same way they talk; ie, like real human beings as opposed to movie characters).\r\n\r\nThere is generous nudity, and the sex is sometimes tentative and sometimes vigorous, and often uninhibited and experimental – as well as explicit and unsimulated (and, might I add, safe). At the same time, the songs, all except one by indie, garage, and punk rock bands (Black Rebel Motorcycle Club, Elbow, Primal Scream, among others), are raw and stark, as befits a live performance (the film’s short length, a little over an hour, likewise adheres to a minimalist punk ethos).\r\n\r\nThe sex scenes follow the musical numbers, in at least one case overlapping until they merge into an audiovisual orgasm, in which the sexual act and the musical act become one, fleshing out the intangible bond that has always existed between sex and rock 'n' roll. By making Matt and Lisa the only characters with dialogue and individuality, director Michael Winterbottom makes it clear that their relationship is not just about sex; as it happens when two people fall in love (or like each other a lot), the lovers feel like the only two people on the planet, a feeling that the rest of concert-goers, a nameless and faceless mass, does nothing but emphasize.\r\n\r\nMatt is a glaciologist, and the immediacy of his passion for Lisa is contrasted with the timelessness of Antarctica (“the memory of the planet”), from where he looks back on their romance. After a year, Lisa returns to the US, and the two part without long goodbyes. This is the most realistically happy ending for a relationship, since, as we all know, the honeymoon phase is untenable and, with the passage of time, even sex becomes a chore – something like playing the same song every night.\r\n\r\nAnd sure enough, after a while, despite the musical and sexual variety – the latter of which includes cunnilingus, masturbation, blindfolds, hand tying, and manual, pedal (for lack of a better term), and vaginal sex –, the film’s structure becomes repetitive towards the end, although, once again, the brief running time keeps the tedium from becoming unbearable.
47	**Ponderous, meandering epic with a few bright spots.**\r\n\r\nThis film is about a soldiers quest to find a renegade and insane Colonel (a bald Brando in an extended cameo)  who has hidden himself away in the depths of the jungle and is causing all manner of commotion.  Quite what it was - I can't remember, but it _was_ important enough to go down stream in search of him.\r\n\r\nSheen's character decides to head down river with his fellow soldiers and seek out the bald lunatic before its too late. Robert Duvall is hilarious as a war immune soldier - especially when a shell explodes near him and he merely gives it a disinterested glance. Amusing!\r\n\r\nOn the whole, though, this is a ponderous trip - the film seems to meander aimlessly with little to keep this viewer interested.\r\n\r\n\r\n- Ian Beale
48	I think a lot of people who think this film is a classic are deranged, the only memorable scene in the film is when they drop exploding napalm and the guy in the hat says "I love the smell of napalm in the morning", the rest of the film is a completely boring bombshell and it's like the film was high on drugs as there's this one part where people are butchering a cow in the most grotesque way possible... poor cow, now I'm offended by this film.\r\n\r\nThis film is just weird, the characters are not memorable at all not even Marlon Brando's character, the story is non-existent and the ending just sucks. Overall this film is absolutely terrible and I don't care what others think, I did not enjoy this film at all.
49	***One of the greatest films ever made***\r\n\r\nThe original "Apocalypse Now" is an awe-inspiring masterpiece and is my all-time favorite film. Memorable scenes abound, starting with the mind-blowing opening with Willard (Martin Sheen) having a mental breakdown in his sweltering Saigon hotel room to the tune of The Doors' "The End."\r\n\r\nSpeaking of Sheen, people overlook the fact that he expertly carries the film. His haunting commentary is one of the most effective narrations in cinematic history and hooks the viewer into the nightmare-adventure.\r\n\r\nI could go on and on about the noteworthy scenes, but I'll resist, except to comment on Col. Kurtz: Was he really insane or actually a bold genius? General Corman informs Willard: "He's out there operating without any decent restraint, totally beyond the pale of any acceptable human conduct. And he is still in the field commanding troops." And, yet, Kurtz was accomplishing what the US military couldn't or wouldn't do because of political complications and niceties. I bring this up because, as I've aged, I've come to see that I'M Kurtz in some ways -- operating "out there" beyond the parameters and restrictions typically linked to my work.\r\n\r\nThe script was written by John Milius with alterations by Coppola as he shot the film whilst the narration was written by Michael Herr. The meaning of the story is obvious: The trip up the river led by Capt. Willard exposes him to two extreme viewpoints of war represented by the two colonels he encounters on his long journey, both of whose names start with 'K,' which is no accident:\r\n\r\nLt. COL. KILGORE (Duvall) is a romantic who embraces war as a lifestyle and even feeds off it, i.e. glorifies it. The fact that he's a romantic can be observed in the air-raid on the village where he literally plays Wagner as a prologue. He feeds off the war to the extent that he "loves the smell of napalm in the morning." War is just another day to him so why not go surfing? Since he lives off of the war there's no way it can kill him or even give him a scratch. Kilgore naturally has the support of the top brass because he's part of the system and plays the game of war. \r\n\r\nCOL. KURTZ (Brando), by contrast, sees through this hypocrisy. He realizes that being in a state of war is humanity gone mad. It's living horror and therefore must be ended through the quickest means possible at whatever cost. He refuses to play the game of war as he expertly takes out double agents, etc. Of course the brass can't have this so they put out a hit on Kurtz via Willard. The existential Kurtz becomes increasingly disillusioned -- even crazy -- after jumping ship from the system and now has no sanctuary. Death is the only way out. His consolation is that Willard will tell his son the truth. \r\n\r\nThe "Redux" version was put together by Coppola and released in 2001 with the addition of 49 minutes of material that he originally cut, not to mention placing Clean's surfing scene later in the story.\r\n\r\nCoppola made the right decisions with his original 1979 edit of the film (2 hours, 33 minutes) since the extra footage of "Redux" tends to drag the film down with 1 or 2 scenes being dubiously scripted, e.g. the theft of Kilgore's surf board. Not every idea that is birthed during the creative process is worthy of the final product and "Redux" illustrates this. Thus the new footage of "Redux" should've arguably been relegated to the "deleted scenes" section.\r\n\r\nThat said, I've warmed up to "Redux" and feel it's a worthy version of the film, but only _if_ you've watched the Theatrical Cut and **want more**. "Redux" successfully fleshes out the characters and gives them more dimension, especially Willard and Kurtz. Plus the sequence involving Kurtz reading a couple of TIME magazine articles illustrates beyond any shadow of doubt that he _wasn't_ insane and that the brass simply slandered him as crazy in order to justify the assassination of a decorated American officer.\r\n\r\nCoppola's preferred cut of the film is the "Final Cut," released in 2019, which runs a half hour longer than the Theatrical Cut. In other words, it trims the fat off of "Redux." There's also a "First Assembly" version, a bootleg, that runs 4 hours, 49 minutes.\r\n\r\nThe film was shot in the Philippines. \r\n\r\nGRADE: A+
50	It wasn't just insanity and murder, there was enough of that to go around for everyone.\r\n\r\nApocalypse Now is directed by Francis Ford Coppola who also co-adapts the screenplay with John Milius from Heart of Darkness written by Joseph Conrad. It stars Martin Sheen, Marlon Brando, Robert Duvall, Laurence Fishburne, Dennis Hopper, Harrison Ford, Frederic Forrest, Sam Bottoms and Albert Hall. Cinematography is by Vittorio Storaro and the music is primarily arranged by Carmine Coppola.\r\n\r\nThe Vietnam War and Captain Benjamin L. Willard (Sheen) is approached by American intelligence to go on a secret assignment: he's to follow the Nung River into the remote Cambodian jungle to find and assassinate Colonel Walter E. Kurtz (Marlon Brando), a member of the US Army Special Forces who has gone insane.\r\n\r\nOne of the most talked and written about films of all time, Apocalypse Now remains to this day a harrowing and haunting experience to first time viewers. With a production shoot that has in itself become legendary, Coppola's flawed masterpiece has been dissected and argued over to within an inch of its magnificent life. People will continue to write about it for ever more it seems, perhaps there might even be the odd new confrontational spin on what resides within? But ultimately it's what the individual takes away from the film that matters, our own interpretations key to the enjoyment of such a disturbing vision of war and violence.\r\n\r\nMany of the set-pieces, dialogue and characters have long since passed into folklore, and rightly so. The Ride of the Valkyries helicopter assault, Kurtz's surreal death camp, the boat people massacre, purple haze, the playmates, Kilgore, and of course the horror, the horror..indeed. The performances match the quality of Storaro's sumptuous Philippines photography, Sheen is fiercely committed and Duvall and Hopper in turn are powerhouse and edgy. While Brando, doing his own bizzaro thing in the last third, brings a little chaos unintentionally in keeping with the madness at the heart of this particular darkness.\r\n\r\nPersonally that last draggy third does stop it from being a complete genius type whole, but everything up to it is so damn good it's arguably churlish to expect perfection? But as near perfection movies go, Apocalypse Now proudly sits with the best of them, sitting there with a harrowed look upon its face. 9/10
51	This is, I think, the definitive Vietnam war movie. Martin Sheen is "Capt. Willard", a war weary veteran who is sent on a top secret mission to track down and stop the rogue Colonel 'Kurtz" (Marlon Brando) who is operating independently from Cambodia. With only a small crew of rookie squaddies, he sets off along the treacherous Nung River where, along the way, they alight on "Kilgore" (Robert Duvall) and face all sorts of dangers against both man and nature as they seek their quarry. The sheer intensity of the journey, and of the challenges it throws up cause "Willard" to re-evaluate his whole perspective, and not just on the war, as the horrors of this conflict manifest before him. It's a stunningly strong depiction of war; the humanity and vulnerability of the characters - even those who are outwardly strong - and the casting is inspired. It's bloody and gory at times, but never gratuitously and the closely shorn Brando is in a class of his own as the megalomaniac "Kurtz". Though fictional in fact, it doesn't pull it's punches and leaves us all with a bitter taste in our mouth and some seriously thought-provoking questions.
52	Quite easily the finest western ever made and very close to the greatest film ever made. It won loads of Oscars and other film awards in 1993, but it still should have won more. \r\nTalk about a man at his peak ? This has Clint Eastwood, Gene Hackman, Richard Harris, Morgan Freeman and virtual rookie, Jaimz Woolvett as The Schofield Kid, all putting in magnificent, career defining performances. Not to mention the bit players who all add to this stunningly captivating film.\r\n\r\nWeak points ? There are none. Every frame is a gem. It has plenty of dark humour. A few touching moments where you would think it wasn't possible. Sadistic and brutal fight scenes and then it has Clint Eastwood riding into town for the final terrifying, yet totally satisfying, showdown.\r\n \r\nHow Al Pacino (The Scent of a Woman) beat Clint to Best Actor in 1993 is a mystery of modern times. Right up there with how The Shawshank Redemption didn't win anything of note in '95 but is now regarded as possibly the greatest film of all time by many people.
53	That's right. I'm just a fella now. I ain't no different than anyone else no more.\r\n\r\nWilliam Munny (Clint Eastwood taking the lead and directing the piece) is an old and retired gunman whose past misdemeanours would make the devil himself seem tame. Widowed and struggling to raise his two children on a paltry farm, he's tempted out of retirement for one last pay dirt job, the consequence of which provides violence - both physically and of the soul.\r\n\r\nClint Eastwood signed off from the Western genre with this magnificent 1992 picture, the appropriation and irony of which is in itself a majestic point of reference. After the script had been knocking around for nigh on twenty years (written by Blade Runner scribe David Webb Peoples), Eastwood seized the opportunity to play William Munney and lay bare the mythologies of the Wild West. What is most amazing about Unforgiven's screenplay is how we the audience are firmly on Munney's side, we are, incredibly, influenced by Eastwood's part in the history of the Western. In spite of Munney's obvious murky past (despicable crimes they be), we wait (and hope) for Munney to make a quip and way-lay the bad guys - actually, salivating at the prospect is probably closer to the truth. So it's with enormous credit that Eastwood, and his magnificent cast and crew, manage to fuddle all our respective perceptions of the West and the characters we ourselves have aged with. It's not for nothing that W.W. Beauchamp (Saul Rubinek) is the critical character that nobody expected. Beauchamp is a writer of penny pulpy novels that tell of derring-do heroics, gunslingers with a glint in their eye and death dealt like an heroic encore, this gives Unforgiven an excellent sleight of hand, for this West is grim and a destroyer of all illusions.\r\n\r\nEastwood is greatly served by the actors around him, Morgan Freeman, Gene Hackman (winning the Best Supporting Actor Oscar for a script he turned down many years before!), Rubinek, Frances Fisher, Anna Thomson, Jaimz Woolvett and an incredible cameo from Richard Harris. Along with Hackman's win for his brutally tough portrayal of Sheriff "Little Bill" Daggett, Unforgiven also won Oscars for Eastwood for his clinically tight direction, Best Picture, Best Editing and it was nominated for in another five categories. One of those nominations was for Jack Green's cinematography, which now, in this age of High Definition enhanced cinema, can be seen in all its wonderful glory. The Alberta location is magically transformed into the Western frontier, with the orange and brown hues a real treat for the eyes. Ultimately, though, Unforgiven is a lesson in brilliant film making, across the board it works so well, why? Well because the man at the helm knows this genre so well, having been its sole flag bearer for practically 25 years, and learning from his peers, Eastwood has crafted a thematically complex piece that for all its violence, debunking and melancholy pulse beats, is a film that is as beautiful as it is most assuredly stark, an incredible and true highlight of modern day cinema. 10/10
54	That's right. I'm just a fella now. I ain't no different than anyone else no more.\r\n\r\nWilliam Munny (Clint Eastwood taking the lead and directing the piece) is an old and retired gunman whose past misdemeanours would make the devil himself seem tame. Widowed and struggling to raise his two children on a paltry farm, he's tempted out of retirement for one last pay dirt job, the consequence of which provides violence - both physically and of the soul.\r\n\r\nClint Eastwood signed off from the Western genre with this magnificent 1992 picture, the appropriation and irony of which is in itself a majestic point of reference. After the script had been knocking around for nigh on twenty years (written by Blade Runner scribe David Webb Peoples), Eastwood seized the opportunity to play William Munney and lay bare the mythologies of the Wild West.\r\n\r\nIt's striking that the makers here have lured us in to being firmly on Munney's side, we are, incredibly, influenced by Eastwood's part in the history of the Western. In spite of Munney's obvious murky past (despicable crimes they be), we wait (and hope) for Munney to make a quip and way lay the bad guys - in fact salivating at the prospect is probably closer to the truth. So it's with enormous credit that Eastwood, and his magnificent cast and crew, manage to fuddle all our respective perceptions of the West and the characters we ourselves have aged with. \r\n\r\nIt's not for nothing that W.W. Beauchamp (Saul Rubinek) is one of the critical characters on show, this even though we didn't expect that to be the case. Beauchamp is a writer of penny pulpy novels that tell of derring-do heroics, gunslingers with a glint in their eye who deal death as some sort of heroic encore. This gives Unforgiven an excellent sleight of hand, for this West is grim and a destroyer of all illusions and it's not controversial to say that this is indeed a good thing.\r\n\r\nEastwood is greatly served by the actors around him, Morgan Freeman, Gene Hackman (winning the Best Supporting Actor Oscar for a script he turned down many years before!), Rubinek, Frances Fisher, Anna Thomson, Jaimz Woolvett and an incredible cameo from Richard Harris. Along with Hackman's win for his brutally tough portrayal of Sheriff "Little Bill" Daggett, Unforgiven also won Oscars for Eastwood for his clinically tight direction, Best Picture, Best Editing and it was nominated in another five categories. One of those nominations was for Jack Green's cinematography, which now, in this age of High Definition enhanced cinema, can be seen in all its wonderful glory. The Alberta location is magically transformed into the Western frontier, with the orange and brown hues a real treat for the eyes.\r\n\r\nUltimately though, Unforgiven is a lesson in adroit film making, where across the board it works so well. Why? Well because the man at the helm knows this genre inside out, he was after all the sole flag bearer for practically 25 years. He learnt from his peers, and thus Eastwood has crafted a thematically complex piece that for all its violence, debunking and melancholy pulse beats, is a film that is as beautiful as it is most assuredly stark. An incredible and true highlight of modern day cinema, regardless of being a genre fan or not. 10/10
55	This movie directed by Clint Eastward is one of my big three. Three westerns I am willing to watch multiple times when the opportunity arises. (The other two are Once Upon a a Time in the West and The Good the Bad and the Ugly.) All three of those movies are gritty, but not necessarily realistic. The Wild West didn’t see many Gun fights where a gunman  outshoots four or five guys facing  him. And yet, if we saw a movie gunfight where they are shooting pistols at each other and missing all over the place, that might seem unrealistic to us. Movie magic.\r\n\r\nSo Eastwood plays a former ruthless bad guy who we root for now, and Gene Hackman plays a good guy lawman who is cruel and easy to root against. The dialogue is excellent, such as what Bill Munny says after her shoots a bar owner. There is some humor, as usual for his movies, especially concerning the bragging Schofield. I could go on and on, but you may be one of those lucky ones who hasn’t seen it and still has it to look forward to.
56	_**“It’s a hell of a thing, killing a man”**_\r\n\r\nIn 1880-81, Big Whiskey, Wyoming, a prostitute’s face is cut up by an offended patron. When the big, tough sheriff (Gene Hackman) goes soft on the two cowboys responsible, the vengeful women collect their assets for a “whore’s gold” reward to attract a hit man. Clint Eastwood and Morgan Freeman play old pardners who are interested in teaming up with a young kid (Jaimz Woolvett) to earn the money. Saul Rubinek plays a maker of Western legends while Richard Harris is on hand as the deadly English Bob.       \r\n\r\nDirected by Eastwood, "Unforgiven" (1992) is a downbeat Western with a bit o’low-key humor. It’s marred by a pall of ugliness and darkness, but it has grim realism in its favor. It’s all about what it takes to kill/abuse people and the ramifications thereof. Munny (Eastwood) is haunted by it, the hardened Sheriff leads by it, Ned (Morgan) discovers he just can’t do it anymore, English Bob relishes it for celebrity status while the ‘Schofield Kid’ is just testing his mettle. \r\n \r\nFrances Fisher and Anna Thomson lead the female cast with the latter playing the scarred prostitute. Liisa Repo-Martell stands out as the young blonde. There are a few more.\r\n\r\nThere are several iconic scenes, but two moving ones come to mind: When the 'Schofield Kid' experiences an unexpected breakdown. And when the scarred girl shows honor for Munny's faithfulness to his beloved wife (even though she finds out later the wife had passed away; nevertheless Munny was still faithful to her). It's almost as if she marvels at the nobility of a man who refuses to be a faithless adulterer. Munny was really rehabilitated by his beloved and it was only a certain person's death that brings back the cold killer, albeit this time an agent of fearsome vengeance.  \r\n\r\nThe film runs 2 hours, 7 minutes, and was shot in Longview, Alberta, Canada (the town of Big Whiskey) and other areas of Alberta, as well as Red Hills Ranch, Sonora, California, for the train sequence.\r\n\r\nGRADE: B+
57	It's good!\r\n\r\nI have to say I'm a little surprised to see just how highly regarded this is, given I had - somehow, evidently - never even heard of it until scheduling this Clint Eastwood watchathon of mine - all of the latter's other well received I had/have heard of, but not this. I don't check reviews etc. until after I view films and my jaw kinda dropped when I saw the 4.1 average rating, I won't lie.\r\n\r\nThat makes it sound like I think <em>'Unforgiven'</em> is bad, which I absolutely, most definitely do not. I honestly just found it to be a solid but unspectacular western flick from 1992. I really enjoy Eastwood, Morgan Freeman and Gene Hackman as actors and they are all good value in this. There is also some neat cinematography, while the production is well paced.\r\n\r\nHappy for all involved that this did do bits with awards et al., even if it is a tad unexpected for me - what do I know!
58	I've never been particularly invested in _The Simpsons_. This movie didn't turn me around on that. I could stand watching it, Hell, this was actually the **second** time I've seen it, but I assure you, it was not for my own enjoyment I did so.\r\n\r\n_Final rating:★★ - Definitely not for me, but I sort of get the appeal._
59	Forgive this forward, but I literally watched all 31 seasons because I was sick and have never understood what the fuss was about the Simpsons.\r\n\r\nI really have to conclude that the appeal of the Simpsons was a simple lack of options when it first came out, and then it just grew in power by simply existing for so long.\r\n\r\nFor this movie:\r\nUninspired watch, probably won't watch again, and can't recommend, unless you're already a Simpsons fan.\r\n\r\nIt's really just a lot of the Simpsons being Simpsons, but that also means that the overall story writing is actually pretty good, even if the character writing is rather repetitive.\r\n\r\nI did enjoy the introduction of Ploppers, Spider-Pig, but it doesn't really even out everything else.\r\n\r\nThe big adversity is an "under the dome" scenario, which is actually interesting enough to explore, but because it's the Simpsons, we know that nothing ultimately interesting is going to happen, and that everything is going to resolve like its TV counterpart.  Now, that said, the TV show does drop unexpected, unexplainable shifts, like the death of characters.  I don't think Fox was brave enough to put such a thing in the movie, which would have completely changed the gravity of the movie.\r\n\r\nIt's fine, it's well produced, it's just not very interesting, and I don't think I'd ever watch it again unless I was binging the Simpsons again, and wanted to watch it in order.
60	Fresh and surprising with great script, dialogues and cut. The cast is also fantastic.
61	***Inventive drama/romance with Jim Carrey, Kate Winslet and so much more***\r\n\r\nA man (Jim Carrey) discovers that his babe (Kate Winslet) had her memory of their relationship removed via the medical procedures of an innovative company. He decides to get the surgery as well, but as the technicians (Mark Ruffalo & Elijah Wood) conduct the procedure he changes his mind! Can he escape with his memory intact and possibly save the relationship? Tom Wilkinson plays the doctor and Kirsten Dunst the secretary.    \r\n\r\n“Eternal Sunshine of the Spotless Mind” (2004) is a drama/sci-fi/romance hybrid that’s so confusing during its first half that it fails to captivate (and is even annoying) but, if you persevere, everything starts making sense by the midpoint, ushering in an entertaining and insightful second half. The movie’s depth naturally makes it improve on repeat viewings wherein it’s more understandable as you put the pieces together.  \r\n\r\nViewers who complain that a certain person is too dramatic, selfish and high maintenance to put up with for more than a month didn’t get the closing moral, which is both true and profound: Couples can (and should) realize the flaws of their mate, which they genuinely don't like, but it's "Okay." That's true love.\r\n\r\nThere are also unexpected peripheral gems on unethical behavior in a supposedly professional environment, secret relationships, discarding unwanted skeletons, and more. Lastly, curvy, vivacious Winslet shines and it’s nice to see Carrey in a serious role.\r\n\r\nThe film runs 1 hour, 48 minutes, and was shot in the New York City area (Yonkers, Montauk, Mount Vernon, Manhattan and Brooklyn).\r\n\r\nGRADE: A-
63	“Eternal Sunshine of the Spotless Mind” is a movie that uses the fragility of memory and hurt of love to show the desperate measures taken by a couple who decide to break up. After two years of living together, Introverted Joel Barrish ( Jim Carey ) and extrovert Clementine Kruczynski ( Kate Winslet ) undertake extreme procedures to erase any memory of each other. \r\n\r\nWhat director Michel Gondry and Writer Charlie Kaufman have created is a movie designed to slowly release forgotten incidents and emotions as the audience discover the film is running in reverse. Bearing witness to love’s decay the audience are thrown sidelines with the introduction of Patrick ( Elijah Wood ) and Stan ( Mark Ruffalo ). Both Patrick and Stan work for Lacuna a private medical company with some rather dodgy practices regarding memory erasure. Along with Patrick and Stan, Mary ( Kirsten Dunst ) Stan’s girlfriend is also a work colleague and joins the other two when they are tasked with erasing any memory of Clementine from Joel’s mind. Patrick however uses information provided to Lacuna by both Joel and Clementine to manipulate Clementine in an attempt to get her to fall in love with him.\r\n\r\nWhat ensues is a battle of the mind to try and save their relationship after discovering that all was not as bad as the couple believed. But with each recalled memory there is a doomed ending that ends up being erased. The only hope is to try and hide Clementine in an earlier non related memory in Joel’s mind as Lacuna remove all traces of each other. The climax of the film comes with a surprise that complicates any post mind erasing procedures. \r\n\r\n“Eternal Sunshine of the Spotless Mind” evokes real devastation in lost love and tells a fantasy tale of how we all try to erase those hurtful memories. However, after everything, our memories are all we really have, they make us who we are, once they are gone, we ourselves are surely gone.
64	This is a really weird movie. I had to watch it about 3 or 4 times before you really figure it out. It's a good concept but a bit confusing sometimes.
65	Part 2 introduces Davy Jones. Jack Sparrow has owed Davy a debt. Now Davy intends to make Jack make good on that debt. One way or another. Really awesome sequel.
66	I usually think that a good spell of time between an original and a sequel is a good thing. It gives everyone space to refresh the ideas and develop the characterisations. That's pretty much what Gore Verbinsky has done with this superior follow-up to the 2003 story. This time, we don't really need to spend much time on the who's who bits, so can head straight to the action which for the next 2½ hours follows "Jack Sparrow" (Johnny Depp) double-dealing as only he can trying to stay one step ahead of the vengeful "Davy Jones" (Bill Nighy) with whom he made a deal that means it's now his turn to enter hell. Meantime, "Will" (Orlando Bloom) and "Elizabeth" (Keira Knightley) are having problems of their own, and when he has to try to kidnap "Jack" with his compass for the dastardly "Lord Beckett" (Tom Hollander) in return for her safety he, en route, becomes reunited with his rather curmudgeonly (and barnacled) father (Stellan Skarsgård). It seems that both "Will" and "Jack" cannot both get what they need - but can they find a solution? It's end-to-end stuff this, with loads of mythical creatures from the depths, a tiny bit of romance and a Johnny Depp very much at the top of his game. The story is solid and entertaining, as is much of the quickly paced dialogue and David Schofield turns in a good effort as the malevolent "Mercer". I could have done with Geoffrey Rush but otherwise this is a fun fantasy adventure with some cracking visual effects and Hans Zimmer's music adds richness to the jollity too. A big screen must, really. It's just not so good on the telly.
67	Probably Cronenberg's most mundane work, but that's not even remotely a knock against _A History of Violence_. I hear tell that fans of the comic don't much like this big screen re-telling, but I've never read it, so I'm gonna go ahead and really enjoy it anyway.\r\n\r\n_Final rating:★★★½ - I really liked it. Would strongly recommend you give it your time._
68	We start with images of two rather brutal hoodlums who have robbed and massacred the staff at a roadside motel and then sort of follow them into a town where "Tom" (Viggo Mortensen) runs the diner. They stop by one afternoon, intent on causing a bit of mayhem, only to discover that their host is a bit more capable of defending himself than they'd anticipated. Quickly "Tom" is lauded as an hero, and wife "Edie" (Maria Bello) and kids "Jack" (Ashton Holmes) and "Sarah" (Heidi Hayes) are proud to have their dad at home. What he hadn't anticipated, though, is that the publicity would attract the attention of one-eyed gangster "Fogarty" (Ed Harris) who arrives and starts calling him "Joey". Who's "Joey"? Well we quickly find out that nothing is as it seems and we gradually begin to realise that the past always has an habit of catching up with you. This is a violent film, but oddly enough I felt it rather visually tame as the pieces start to fall into place and the arrival of William Hurt signals an escalation that cleverly marries the comically menacing with the somewhat predictable conclusion. There's not a great deal of dialogue here, though not quite on the Clint Eastwood scale, and Mortensen holds it together increasingly well as we move along. It's one of the few films that I feel could have added half an hour or so, just so we get to grips a bit better with the characterisations and concomitant baggage, but as it is - it's well worth a look.
69	There are many great predictions hinting to future (it is from 1968 - can you believe it?) innovations throughout the movie. I might not have found all them because I keep falling asleep while watching it but I will keep trying to find them all.
70	I believe that we should call it a modernism show, albeit exhibited in the form of a movie. While it might feel "boring", it forces you to rethink what philosophical level that a two-hour film can achieve. The focus on questions about life, intelligence, and time, is worth more attention than the sci-fi part (though the special effect of this movie is already way ahead of its time).
71	The eighth wonder of the world. Easily 30+ viewings since I was a little kid. Nothing new to say here; simply wanted to add another pair of hands to the ocean of applause for my absolute favorite thing, the only indisputably perfect movie, the answer to the question of Is Life Worth Living, Man's greatest achievement, two thousand one a burger-flipping space odyssey
72	I got this movie recently when it came out on Ultra HD Blu-ray simply because it was missing in my collection and, being a Sci-Fi fan, missing 2001 in my collection simply would not do. It is a movie that was made to rely almost entirely on the visuals. It could be said that it is a visual symphony if that makes sense. Thus it was filmed on 70 mm film and in 6 channel stereo which, at the time was a huge thing. Thanks to this it actually made some sense to transfer this movie to Ultra HD Blu-ray since the originals were really good enough even though the movie was made in 1968.\r\n\r\nI remember watching this movie as a kid and was profoundly disappointed. I thought come on, where’s the adventure, not to mention any form of action? Today I can more appreciate it for what it is. A visually stunning movie. I also can more appreciate the fact that the movie is trying to be scientifically accurate instead of going all out on the fiction part. The parts where gravity, or rather the lack thereof, was portrayed, that was really high tech movie making at the time. I also noticed now, when re-watching it, that all the screens are actually flat which also was really far in the future at the time. Actually it was still pretty much in the future back in 2001.\r\n\r\nHowever, even today, I have to say that I find the movie excruciatingly boring. It is two and a half hour long and it moves very, very slowly. It takes 50 minutes of movie time before we actually get to the main part of the movie and get onto the Discovery for instance. No matter how great the visuals are, there’s only so much boredom I can stand before it starts to get to me.\r\n\r\nIn the last 30 minutes or so the movie starts to become very psychedelic. The part where Bowman is pulled into the vortex, the stargate, is going on forever and in the end it just becomes a blur of headache inducing color effects. The final parts of the movie with the three Bowmans of different ages is just weird.\r\n\r\nSo,as this is a non-professional and personal take on the movie I cannot really motivate more than 3 out of 5 stars.\r\n\r\nI hadn’t actually planned to review this movie. Everything has really already been said about it but I could not refrain after having read this crap at Rotten Tomatoes:\r\n\r\nCritics Consensus: One of the most influential of all sci-fi films — and one of the most controversial — Stanley Kubrick’s 2001 is a delicate, poetic meditation on the ingenuity — and folly — of mankind.\r\n\r\nIt’s pretty well known that Rotten Tomatoes is the absolutely worst movie rating site around and the so called “critics” are useless culture elite morons with an over-inflated opinion about themselves at best and politically motivated SJW asswipes at worst but still.\r\n\r\nWhat the hell is controversial about it? Reality check, there’s really nothing controversial about it at all. It is just a fictional story in the future. Then we have that crap “the folly”. What bloody folly? If anything the movie shows a much better future  than what we got. A future where the politicians apparently promoted advancement of science and space exploration which is the direct opposite to the money and oxygen wasters we have today.\r\n\r\nSure, if you indulge too much in smoking funny mushrooms or are politically motivated you can probably “interpret” the hell out of any movie and “find” whatever message you want but it is still bullshit.\r\n\r\nWell, that was my (controversial?) take on 2001.
73	_**Inscrutable space science-fiction as cinematic art**_\r\n\r\nThe discovery of an ancient extraterrestrial monolith on the Moon leads to a mission to Jupiter, but the astronauts have unexpected complications with their vessel’s onboard computer, HAL 9000. William Sylvester plays an official of US Astronautics in the first hour while Keir Dullea and Gary Lockwood play the two functioning astronauts in the second half.\r\n\r\nCreated by Stanley Kubrick (director/writer) and Arthur C. Clarke (writer), "2001: A Space Odyssey" (1968) is an artistic sci-fi film about human evolution, advanced technology, the wonders of space, the routineness of space travel, artificial intelligence and the mystery of extraterrestrial life. It mixes elements of “Planet of the Apes,” which debuted over six weeks earlier, with aspects of “Star Trek: The Motion Picture,” which came out eleven years later and was obviously influenced by this one-of-a-kind movie. \r\n\r\nIt begins with the “dawn of man” as a curious introduction before jumping forward to the 21st Century, which has been called the longest flash-forward in cinematic history. The depictions of space travel and life-in-space feel wholly authentic. \r\n\r\nBut “2001” is peculiar in that it rejects traditional techniques of narrative cinema and is often a nonverbal experience, which leaves some viewers in awe and others bored. It’s not about conventional thrills, but rather disquieting awe. It’s not easy entertainment, but meditative, transcendent art. The 1985 sequel, “2010: The Year We Make Contact,” is more standard and less ambiguous yet a worthy companion piece. \r\n\r\nThe soundtrack mixes classical compositions, e.g. “Also Sprach Zarathustra” by Richard Strauss, with four creepy modernistic compositions by György Ligeti. The parts of the movie that utilize the latter pieces really evoke an unsettling sense of the unknown.\r\n\r\nMy favorite part is the astronauts’ exchange with HAL, which involves almost an hour of the runtime and is the only part of the film that generates a low-key sense of suspense.\r\n\r\nPersonally, I don’t believe that humankind began as apes (rolling my eyes). But, even if this were true, where did the apes come from? Did they just spontaneously manifest by accident? If so, when? How? Biogenesis is a scientific axiom meaning “life proceeds from life.” So what life form originally created the apes or the simple organisms that supposedly evolved into apes?\r\n\r\nThe film runs 2 hours, 29 minutes.\r\n\r\nGRADE: A-/B+
117	Some people will say this classic sci-fi "has nothing to offer other than overrated cult-status". To that, I would respond, "it has Rutger Hauer on a rooftop, and that's enough for me".\r\n\r\n_Final rating:★★★★ - Very strong appeal. A personal favourite._\r\n\r\n(3.5 for the Theatrical Cut, 4.0 for the Final Cut)
125	This is one I saw back in theaters and don't remember caring much for perhaps due to the stark shift in direction with the digital format and over-saturation (compare that to Heat) but seems like the 16 years since, not only with Mann's Collateral, but other films have adopted something similar, that this time around it didn't look or feel off. As for the movie itself, solid storyline and the performances from Jamie Foxx and Colin Farrell were really good, now I wish there was a sequel but that time has passed unless Universal goes the streaming route. **4.0/5**
74	I saw it for the first time when I was in middle school. I thought it was the worst movie ever. Then, some time later, as an adult, I rewatched it and was amazed at how wonderful it was. It was so beautiful and magnificent that I could not believe it was made in 1968, and I thought it was an unprecedented and solemn historical work, like Goethe's "Faust" in literature, one of the greatest masterpieces of cinema that mankind has ever possessed. First of all, it is a film in which dialogue is reduced to the utmost limit, and even if it had been in black and white, I could have watched it ten times without getting tired of it, regardless of whether I could have endured the "silence. It's Kubrick's magic that you can watch this film without any annoying sound effects like in "Jaws" but with classical music and with your heart rate regulated like in Charlie Chaplin's silent films. I don't know how well this film was received in the U.S. at the time, but in Japan, many people shy away from it, saying it is difficult to understand.
75	**A magnificent film, with beautiful music and great visuals... but smug, empty and unforgivably overrated.**\r\n\r\nStanley Kubrick is, for me, one of those directors who so quickly impresses us with a great film, as it makes us doubt his competence with an absolutely pathetic trash. I know that the director's fans are going to crucify me, but that's how I think, and I even say more: with each Kubrick film I see, I am more convinced that an aura of unjustified “cult” genius has been created around him. I loved some of his movies like “Spartacus”, “Dr. Strangelove”, “Shining” and “Eyes Wide Shut”, but thinking about them and trying to compare them with “Clockwork Orange” and “Full Metal Jacket” is strange. They don't look like the work of the same director.\r\n\r\nReleased in the 1960s, at a time when the space race was at its height and when the future of Humanity seemed, more and more, to be outside our planet, the film addresses the question of the evolution of the human species in a “sui generis” way: it starts with monkeys and goes to the first contacts with extraterrestrial beings. The film was considered one of the defining milestones of sci-fi as a cinematographic genre, and I believe that this is indisputable. It's also one of the rare sci-fi movies that seems concerned with being scientifically credible, yet not without flaws that a good scientist will spot (and we might not).\r\n\r\nSet in a hypothetical future, the film shows what space explorations and life in colonies made in space and on the Moon would be like. However, it is still ironic that, after the 60s and 70s, space exploration has been so secondary that many questions, even today, whether we really should spend industrial amounts of money and resources on it. The future that Kubrick imagined in 2001 seems, in 2022, even more imaginative and far from happening than when the film was released. However, some things really did happen and are, today, normal: this is the case of video calls and the extraordinary advances in robotics and artificial intelligence.\r\n\r\nAmong the various merits of this film, we have to highlight the extraordinary visual beauty, the way the director worked with the visual and special effects and the excellent camera work. At a time when CGI was a mirage far from a filmmaker's mind, this film gives us images and visuals that look like they were made this year. The film simply hasn't aged a single day: we have clear images, magnificently crafted light and details, excellent sound effects, a cinematography that makes envy to many 21st century films and, also important, a magnificent soundtrack where “Blue Danube” and “Also Sprach Zarathustra” stand out, helping to popularize these melodies.\r\n\r\nDespite these indisputable merits, I think this film deserves to be on the list of the most overrated films I've ever seen. And this is due, in good part, to everything else that I didn't say, and which is essential in a good film. Let's start with the absence of a script and horrible pace: for almost three hours, the film drags on unbearably in scenes of great beauty, but with nothing to say. It's truly exasperating. The only moments where the film really gains interest are when the ship's supercomputer turns against the astronauts, and even that segment feels loose, as if the script were a patchwork quilt. The allusions to aliens didn't fascinate me either, it's a regular cliché when making a movie set in space. One point that also didn't help is the lack of good actors, or any decent work for them to do, and the fact that Kubrick shows us life on the space stations as if it were a stay in a luxury hotel. And what about the extraordinary sense of arrogant conceit that the film conveys? We are the ones who have to recognize if the film is good, it can't be the film telling us that every minute!
76	From the opening bars of Richard Strauss's "Also spracht Zarathustra" you just know that this is going to be something unique - and that it is. Apes, playing by a puddle - occasionally engaging in some noisy territorial warfare with their neighbours until one morning, this great black monolith appears. Shortly afterwards these creatures have realised that old bones make new weapons - and that these weapons can kill! The next phase jumps forward four million years later to a mission to Jupiter where a crew of five astronauts under the helpful gaze of their "HAL" computer are making their way across space. Two of them: "Poole" (Gary Lockwood) and "Bowman" (Keir Dullea) are not in hibernation and are regularly engaging with there outwardly affable digital companion. It doesn't take the humans long to conclude that "HAL" might be both malfunctioning and malevolent, and all of a sudden the life of all the people on board becomes precariously balanced. Is "HAL" malfunctioning, or is it fulfilling it's programming and the crew are just not read in? What might that objective be? We know that the monolith has been seen since the apes, what does that mean? What is the symbolism of this perfectly hewn tablet of granite? Kubrick was visionary with this work. It is a tale of evolution, or progress - of intelligence. It doesn't always make immediate sense, but after you've watched it a few times, there are extra ingredients to this potent mix of adventure and intellect that emerge. The ending is a tad surreal for my rather non-lateral-thinking brain, but the trip they take and the trip we take are eventful and thought provoking. Of course, back in 1968 2001 was a lifetime away and obviously none of this came to pass, but if we renamed it 3001 and recalibrated, well I wonder...! Great stuff.
77	Absolute classic, must see, one of the best scifi movies ever made
78	This is the most pretentious crap ever made - but is it an amazing film? No. But it is an amazing _**piece of art**_. This is worthy of the label of film, but the label of film is not worthy of this. Kubrick has crafted a stellar and surreal experience, one of the greatest **_pieces of art_** ever made. Why, you ask, do I obtain from referring to this as a film? Because it is simply not, it is an overpowering sensory experience, not a film. If I seem to be losing my point, here is it straight. It’s too good to be a film. I wouldn’t say this is enjoyable, or entertaining, but it is a stunning experience. One of the greatest **_pieces of art_** ever made. I only lost a point because it’s not a film. Kubrick is often critiqued for his icy cold view of human emotion, and this is no different. The most affecting and human sequence in the film comes ironically (spoilers) from the death of a machine. Check this out, it may not be entertaining, but it IS worth it.
79	Pleasing on a technical level, even with barely anything to grasp story-wise.\r\n\r\n<em>'2001: A Space Odyssey'</em> looks and sounds exquisite, it really is seriously impressive in that regard for a film from 1968. That is, however, the only reason that this gets a passing rating from me if I'm to be totally truthful. The plot itself is rather disappointing, with not much meat on the bones.\r\n\r\nI get it's evidently going for the more artsy approach, made clear by the lack of dialogue/bona fide narrative alongside plenty of ambiguity. It's a Stanley Kubrick film after all, not that I've seen much of his work (this be the first, in fact); moreso what I've heard through the grapevine down the years. There are also a lot of long held, empty-feeling (as intended, I'd imagine) shots that bothered me throughout. It just didn't entice me, that's all. I can still respect it.\r\n\r\nGiven the aforementioned, the cast are basically nonentities - as harsh as that may sound. Douglas Rain does a good job, in fairness, and William Sylvester is alright. I can't say I blame those onscreen all that much, as they aren't exactly given much opportunity to showcase themselves.\r\n\r\nAs has been the case with a couple of other movies down the years, I'm certainly content to file this one with the 'I clearly didn't get it and I'm cool with that' tag. I'm still glad I watched it. I do appreciate it, if only technically, and naturally love that others love it.
80	Seeing _2001: A Space Odyssey_ on the big screen for the first time is an eye-opener. The vastness of space, the eerily precise shots of the spacecraft, and the careful pacing all come to life in a way a TV could never match. The immersive sound design, from the opening hum to the famous orchestral music, and in particular the equally orchestrated silence filling the cinema, makes you feel like you're part of the journey. Details that might seem faint on a smaller screen are clear and striking here: the textures of the spacesuits, the contrast in colours, and the scale of Kubrick's vision. This unique visual and auditory experience in a cinema is a must for any film enthusiast, as it genuinely lets the film's grandeur and mystery sink in.
81	Really good sci-fi thriller with wonderful performances by Bruce Willis, Madeline Stowe and Brad Pitt. Really well done by director Terry Gilliam that has great pacing through the two hour running time. **4.0/5**
99	I enjoyed this entry into the HG Wells film library. The special effects are great (to this amateur anyway) and the acting and action more than adequate. Plus it stays near enough to the sci-fi genius of the author to satisfy the fans of the classic novel. I will say that I got a little tired of the son acting like such a teenager, but he and the Tom Cruise character both show some character growth by the end of the film. Tom is one of those actors who seems to be playing himself a lot, but I suspect there is a lot more work to it than that. I'm not sure Dustin Hoffman would have gotten his Academy Award for Rain Man if he had played off a lesser actor than Cruise. \r\n\r\nI think there are a couple of scenes the movie could have done without, such as in the cellar with Cruise, his daughter and the man who lived there. It slowed the story down, changed the tenor of the drama, and didn't add a lot, in my view. But it is what it is and overall I found War of the Worlds to be entertaining. Good science fiction movies can be hard to find.
100	First time seeing this in 15 years and lame plot, annoying characters (both kids got on my nerves) and a protagonist who just runs around, as Tom Cruise does so well, but has zero impact on the end game which was... bacteria. Yeah, this was just as dumb today as it was back then. At least the visual effects and sound design still holds up. **2.5/5**
82	**_A-man-comes-back-from-the-future Sci-Fi with Bruce Willis and Brad Pitt_**\r\n\r\nIn 2035 survivors are living underground after a viral outbreak has wiped out most of the populace. A prisoner (Bruce Willis) is sent back in time to obtain the original virus so scientists can find a cure. Madeleine Stowe, Brad Pitt, Christopher Plummer and David Morse are on hand in key roles.\r\n\r\n"12 Monkeys" (1996) has a huge reputation as a sci-fi thriller and is iconic of 90’s cinema. The man coming back from the future plot immediately brings to mind the first two Terminator flicks (from 1984 and 1991), but “12 Monkeys” pales by comparison.\r\n\r\nDon’t get me wrong, it’s worth seeing and is entertaining enough with Madeleine Stowe shining, but the story is hampered by a muddled tone of schizophrenia and the unrelenting grunginess of the visual aesthetic (which makes perfect sense for 2035, but not for 1990 and 1996 where most of the events take place). In short, the movie’s just not as compelling as it could be.\r\n\r\nPeople gush over Brad Pitt’s role and he is entertaining, but it’s a glaring rip-off of Dennis Hopper’s photojournalist in “Apocalypse Now” (1979), although I suppose you could see it as an homage. In any case, I could see through Pitt’s acting here and there whereas Hopper was the real deal, perhaps because he & crew were literally stuck in the sweltering jungle waiting around for days doing drugs or whatever while Coppola & Brando worked out the kinks in the script for the last act.\r\n\r\nIf I'm in the mood for this kind of fare, the first three Terminator flicks are a superior option and even the remake of "The Day the Earth Stood Still" (2008). This one's decent, but overrated.\r\n   \r\nThe film runs 2 hours, 9 minutes, and was shot primarily in the Philadelphia & Baltimore areas. For instance, Eastern State Penitentiary in Philadelphia was used for the rundown asylum.\r\n\r\nGRADE: B-
83	**An excellent sci-fi film that deserves our attention.**\r\n\r\nI didn't really know what to expect when this movie was on TV very recently, but I was really glued to the set until the end thanks to a truly absorbing story and a collection of great actors who do a great job. I don't know director Terry Gilliam very well, I've only seen one or two of his films so far (not counting this film), but I'm beginning to understand his aesthetic a bit. However, I recognize that surrealism, of which the director is adept, and the bizarre script can really make it difficult to understand the work.\r\n\r\nThe film begins by immersing us in a profoundly dystopian world, where humanity was almost extinct by a pandemic. As the disease comes from an airborne virus that was deliberately released, the survivors moved into underground shelters. Technology, however, has evolved and allows the sending of chrononauts (that is, time travelers) to the past, in order to obtain pure samples of the virus, which can be used in the manufacture of a vaccine or medicine.\r\n\r\nThis is how James Cole, a criminal, is chosen for time travel in exchange for his crimes being forgiven. His mission is not to alter the past by preventing the release of the virus, even if he seems to want to. The mission is to locate those responsible and pass on all the information to the future, in order to send another agent who will collect the samples. But he only knows that a radicalized environmentalist group, the Army of the Twelve Monkeys, was responsible. Sent by accident to 1990 (instead of 1996), he ends up in an insane asylum where he will befriend the manic Jeffrey Goines and endear Dr. Railly.\r\n\r\nThe film deals with very complex themes, such as time travel, temporal paradoxes, the impossibility of changing the past, and even madness, the tenuous difference between reality and imagination, or between sanity and insanity. It has several advances and retreats in time and you have to be attentive, but what intrigues viewers the most is its ending, strangely sudden and confusing. I understood it quite well, and I think you just need to pay attention to the film to understand everything, but I'll leave a clue to help: the eyes of the protagonist and the eyes of the child that we see at the end of the film are exactly the same, and the what she sees coincides perfectly with a recurring dream that torments the protagonist, coming from the future. I say no more.\r\n\r\nI loved Brad Pitt's performance in this movie. The actor, very used to heartthrob roles where he can use and abuse his natural charm, is almost unrecognizable here. Of course, younger and less experienced, but just as impeccable. I don't know to what extent participating in this film had an influence on his learning as an actor, but I believe it was useful for Pitt. Bruce Willis is also an actor who deserves a positive mention for his work here. He really seems confused, and in many scenes he manages to give the character the feeling that she is abandoning herself to the course of events, fighting against it whenever she feels her mission is in danger. Madeleine Stowe's performance was not so happy: while being frankly positive, it is the least interesting and the most conventional.\r\n\r\nTechnically, the film is flawless. Gilliam cleverly takes advantage of the sets and costumes and makes a truly strange, bizarre future, with those plastic protective suits and that ball in the interrogation scenes. It's an ugly world that we don't want to see one day. I especially liked the cinematography, and the way the director works the footage in a way that makes everything even more surreal and strange. For example, the scene on the staircase of Goines' father's mansion, which is as elegant and majestic as it is labyrinthine and dreamlike. In addition to the good effects, the film also has a very effective soundtrack.
84	Bruce Willis is at the height of his game here as his "Cole" character is sent back in time to find out just how the world came to suffer from a virus that all but wiped out humanity. He is promised early release from his extended prison sentence if he can glean enough information and get back alive to share it! Thing is, they put him back a bit too early and his harbingering of doom stuff merely serves to find him sectioned and under the care of scientist "Railly" (Madeleine Stowe) and friends with the off-his-trolley "Goines" (Brad Pitt) who might just have an use when it comes to fulfilling their quest. "Railly" doesn't exactly volunteer to help him out, but quickly she and "Cole" are onto a group called the "Army of the Twelve Monkeys" believing that they might hold some of the clues to this man-made misery in waiting. It's a Terry Gilliam film so the plot is never going to stick to just the one dimension. Accordingly, "Cole" starts to lose his grasp on reality - he hallucinates, hears voices and generally begins to wonder if he is going mad. Maybe it's the effects of time travel? Maybe something more sinister is afoot? Willis and Stowe are on good form but it's actually Pitt who plays the role of the bonkers "Goines" more memorably. You just know that his character has more to it than the vacillatingly unhinged man presented in the hospital, and as the adventure develops these three characters present us with a quickly paced story that mixes the future with the past whilst peppering the whole thing with questions about the morality of vivisection, scientific experimentation and unfettered technological advances. Why would anyone want to create a virus this potent and irreversible anyway? That's the question.
85	Now this is…really something different like the story and Benigno. I know what he did was so so wrong but I felt bad for him. Such a heartbreaking story and I love how the friendship was formed, although I really didn’t care about the writer and matador. I just couldn’t stop watching this film when I saw it on Sundance, until the ending, like the butt shakin partner dance before the end credits. It may be the music. And of course…Paz Vega’s black and white silent film, the shrinking man who went inside her…literally!
86	This is a clever exposé of how men deal with their emotions. Marco and Benigno develop a close friendship almost despite themselves - and certainly not because they actually ought to. There is "love" that is unrequited, on-the-rebound and even violent all encompassed within this relatively concise story. Almodóvar hits the gold mine early with this and mines it wonderfully. There are some distinctive moral ambiguities in this film, and the Director makes no apology for that nor does he try to corral us into his (or any other) way of thinking - we have to make our own judgement as to how compassionate and/or forgiving we are at the end.
87	Eminem turned out to be a pretty decent actor. I love battle raps. Honestly he's one of if not the best to ever do it!
88	One of my all time favourite sci fi movies. Set the bench mark for modern sci fi, should be considered a great like Blade Runner.\r\nGreat acting, story, soundtrack! 5/5
89	**A film that was enough for more than one review: dream, nightmare, utopia and reality.**\r\n\r\nIt was in 1939 that composer and singer-songwriter Ary Barroso released the iconic song “Aquarela do Brasil”. This samba became an icon of Brazilian music and was sung and disseminated by such noble voices as Francisco Alves, João Gilberto, Tom Jobim, Caetano Veloso, Tim Maia, Gal Costa, Erasmo Carlos, Elis Regina and, in English versions, Frank Sinatra and the Portuguese Carmem Miranda. Ary Barroso, however, never imagined that the mere sight of an elderly man, sitting on a beach on a rainy day while listening to his song, would end up inspiring Terry Gilliam to make a film. But, before these words can mislead anyone, and especially any Brazilian, it is necessary to clarify that the film has nothing to do with Brazil.\r\n\r\nThe film takes place in an unnamed country that lives under a dictatorship (okay, Brazil was a dictatorship when the film was released, but the similarity ends there). The government, obsessed with controlling information, has created a monstrous and highly ineffective bureaucratic system that makes fatal mistakes. It is because of one of these mistakes that a citizen is arrested and killed as a revolutionary, mistaken for the real fugitive. And so we meet Sam Lowry, a government official with a conventional life who is plagued by dreams where he flies like a bird and saves a damsel in distress. His life changes precisely when he meets a woman like the one in the dream and finds that she, too, is in danger of being arrested for another mistake.\r\n\r\nI haven't seen both movies, but I believe the critics who said there were similarities between this movie and "1984". I myself could see the similarities with “Metropolis”, either in the narrative or in the bizarre and exaggerated visual aspects. As in those films, we have a dystopian, totalitarian society, where the individual is stripped of his humanity and becomes a cog in a larger gear, serving the State. Of course, the film weaves a long and judicious critique around this, and the bureaucracy that the country sustains, and which is of little practical use. It also offers us some sharp criticisms of the futile needs and vanity of today's society. The big problem is that all this seems to have no meaning. In fact, the main plot ignores these issues: Sam, the main character, is not a revolutionary nor does he seem to have political ideas. In fact, if you look closely, he seems to act almost on instinct, living his life as if it were a dream. The main plot is underutilized and poorly harmonizes with the rest of the film, as if it conflicts with the visuals and the other points of the script.\r\n\r\nGilliam made an original film. Where he failed was in the harmonic conjunction of the pieces in his work. And of course, in the relationship with the studios, which almost forced him to accept a radical cut in the film, considered excessively long and expensive. In fairness, I can understand both sides: the studios were trying to monetize an investment and rationalize expenses; for his part, Gilliam did not want his creative work done in pieces, although it is clear where the money was spent: just look at the incredible visuals, the dreamlike way in which he expresses himself as a director. Jonathan Pryce is the featured actor playing Sam. He gives us a work of great quality and is very well assisted by Katherine Helmond, in a very interesting sarcastic role, and Kim Greist, his romantic partner. The film also features the participation of great actors of the time, namely Bob Hoskins, Jim Broadbent, Barbara Hiks, Ian Holm, Michael Palin and Robert De Niro. This perhaps shows the prestige and consideration that the artistic world already had for Gilliam: the actors, more than having a good salary, wanted to work with him.\r\n\r\nAll of this is very nice, but why is the film called Brazil, and why did I mention it in a song? I was also thinking about this for some time, it really is something that does not seem understandable at first glance. I saw the film and nothing seemed to give me the answer to the choice of title, except the insistence on the song, which is the skeleton on top of which the film's soundtrack was assembled. But perhaps Gilliam was trying to show us, through this song, the dreamlike utopia of Sam's dream compared to the fantasies of others and the dystopian reality of his life.
90	A great example of bad casting, Cash was over 6'
91	**Walk the Line showcases incredible acting and directing but leaves out the brighter parts of Cash’s life to tell a more somber story that left me sad.**\r\n\r\nWalk the Line chronicles the story of Johnny Cash’s rise to fame and romance with June Carter. James Mangold is one of my favorite directors and tells this story powerfully through the Oscar-worthy performances of Joaquin Phoenix and Reese Witherspoon. The acting, music, and directing are all phenomenal. Still, the story is so sad, and its conclusion, while happy, happens so abruptly that it doesn’t feel resolved or satisfied after 2+ hours of drug addiction and hurting loved ones. Cash’s faith and love for his family, which are well known, aren’t represented in the movie and could have provided hope in this dark tale. I understand why this movie was such a huge award winner, but my escapist nature struggled to enjoy such a sad story.
101	Sometimes it just pays to leave well alone, and this remake of the 1953 version adds nothing aside from more sophisticated special effects. A vehicle for Tom Cruse, it allows Stephen Spielberg to turn this menacing and thought-provoking sci-fi classic into a family melodrama with the star and his dysfunctional family travelling the breadth of the country trying to escape the terror that is falling from the skies. These metallic creations are ruthless, destroying everything in their path but somehow the emphasis of this is more on why "Ray" can't get on with "Robbie" (Justin Chatwin) and whether or not "Rachel" (Dakota Fanning) can keep hold of her childhood toy. The effects are good: the lasers and the pyrotechnics; the explosions and scenes of dereliction are impressive - but oddly enough, I found them less so than in the iteration made fifty years earlier. Lots of horrified expressions as the cast look longingly at green screens, some banal dialogue and we end up with a film about the people in/behind it rather than one about alien world domination. After almost two hours, the ending - and it's huge significance - is almost an afterthought to the boring story of who did what to whom over the years in the "Ferrier" family. Cruise can, at times, bring charisma to the screen. Here he brings little and I am afraid that I found this a triumph of commercialism over creativity and was cheerily egging on the aliens from fairly early on.
170	Far from being a good movie, with tons of flaws but already pointing to the pattern of the whole Ritchie's filmography.
92	Joaquin Phoenix might take top billing as the legendary American musician Johnny Cash, but it's got to be Reece Witherspoon who steals the plaudits as June Carter. She demonstrates all the feistiness and determination of a woman, in a man's world, quite prepared to do her own thing. Assisted by a fair degree of charisma and musical talent, she can play a stage with the likes of Jerry Lee Lewis, Elvis and Carl Perkins with confidence. The film starts at the now famous Folsom Prison just before he takes the stage and by way of a continuing retrospective, we learn of his childhood - one touched by tragedy very early on, of his strained relationship with his father (Robert Patrick) then his service in the US Air Force before, gradually, his stage career and burgeoning romance with his co-star. He is married to Vivian (Ginnifer Goodwin) and they have children, but that doesn't really curtail his passion for Carter and we see that relationship evolve in parallel with his affection for just about anything that comes from a bottle. The life of this man has been pretty publicly documented so there's little room for James Mangold to manoeuvre with the facts here. Instead, we are offered a plausible speculation on just how this couple made it through. I found Phoenix's performance just a little too close to mimicry at times, but there's a solid chemistry between him and Witherspoon throughout with the depiction of his descent into chemically indeed oblivion quite sad to watch. It's underpinned by a strong score and both deliver the songs - especially "Jackson" quite toe-tappingly. This is a fair biopic of a flawed but ultimately quite decent character and it's worth a watch.
93	***Female “Rocky” with a downbeat and contradictory close***\r\n\r\nReleased in 2004 and directed by Clint Eastwood, “Million Dollar Baby” stars Eastwood as a cantankerous boxing trainer who owns a working class gym in Los Angeles, which is maintained by one of his former boxers, the narrator of the story (Morgan Freeman). A waitress from the sticks of Missouri (Hilary Swank) shows up and asks that Frankie (Eastwood) train her, which he refuses to do because she’s too old at 32 and he “doesn’t train girls,” probably because he had an unexplained falling out with his daughter years earlier. Eventually he begrudgingly agrees.\r\n\r\nThe bulk of the film is basically a female version of “Rocky” (1976), except that I prefer the potent drama in this one. The three main characters are well fleshed-out with an all-around reverent tone, not to mention an occasional bit of mild amusement. Frankie and Maggie (Swank) slowly develop a father/daughter-type relationship and it’s touching.\r\n\r\nThe third act, however, takes a left turn that is seriously downbeat. It departs from sports movie formula with a message that contradicts everything the first two acts pushed, which is inexplicable. Sure, I ‘get’ the point: A certain person basically sacrifices everything to do what’s (supposedly) best for the situation and honor the will of a dearly loved soul. Nevertheless, it’s a dark turn that leaves a sour taste because it refutes the positive message of the first two-thirds of the story.\r\n\r\nThe film runs 2 hours, 12 minutes and was shot in Los Angeles.\r\n\r\nGRADE: B-/C+
94	Unreal! I didn't expect <em>'Million Dollar Baby'</em> to be so astonishingly brilliant.\r\n\r\nI've said it many a time before but for full context, I do not read up about films before watching them - aside from making sure the film isn't part of a franchise, checking the run time and seeing the genre - so I was expecting this to be a cliché-filled, but still great, sports flick. It's so much more than that.\r\n\r\nIt's way more deeper and has an everlasting impact that I hadn't anticipated. Even across the opening chunk I was predicating the obvious cliché ending, but as the film progresses and, especially, as the final portion rolls around it just absorbed my total attention - I was fully engrossed... hook, line, and sinker. Some film!\r\n\r\nThe cast are simply stunning. Clint Eastwood gives an absolutely fantastic performance, Hilary Swank is truly sensational - especially at the end, damn - and Morgan Freeman is Morgan Freeman; what an actor and what a voice, using him as narrator was a great move. Elsewhere, and though less dramatically, Jay Baruchel, Anthony Mackie, Margo Martindale and Michael Peña also feature interestingly.\r\n\r\nIt's quite the journey the film takes you on, which I just found utterly enthralling to watch unfold. Perfect pacing, perfect acting. I loved watching every second of it and will undoubtedly be revisiting it.\r\n\r\nI noted days ago that I was rather surprised to learn that Eastwood's <em>'<a href="https://letterboxd.com/film/unforgiven/" rel="nofollow">Unforgiven</a>'</em> had been so heavily acclaimed, on this occasion with this 2004 film I am the complete opposite. I don't care much for awards et al., but I am delighted to see all involved receive their props for this. Chapeau!\r\n\r\nMarvellous, just marvellous.
95	**Million Dollar Baby is an extremely well-done film that takes an abrupt turn to deal with incredibly sobering subjects that are definitely not what I thought I signed up for.**\r\n\r\nI know it’s supposedly a masterpiece, and I will lose some cred for saying this, but Million Dollar Baby was a dreadful movie. I spent the first half of the film falling in love with the hopeful, talented, and inspiring Maggie Fitzgerald and her redeeming of the cranky and lonely trainer, Frankie Dunn. But when the second half takes its giant turn, the story shifts from an endearing sports narrative about overcoming opposition and redemption to hopelessness and agony. Clint Eastwood directed a powerful story with impressive mastery, but the subject matter robbed the film of any enjoyment. For many, Million Dollar Baby deserved Best Picture at the Oscars. For me, I wish The Incredibles had claimed that victory.
96	I hadn't seen this film since it was released when it was shown recently as a part of the Glasgow Youth Film Festival. The fact that it was chosen by the kids of today in what would have been just as unlikely a setting for this film as the North of England speaks volumes as to it's effect on challenging and breaking the stereotypical moulds that the British working class in the early 1980s was steeped in. The sylph-like "Billy" (the hugely engaging Jamie Bell) goes to boxing class each week but is soon more preoccupied by the adjacent dancing class of the no-nonsense "Mrs. Wilkinson" (Julie Walters) who gradually lets him join in. He's a bit scared that his dad (Gary Lewis) and his wayward brother "Tony" (Jamie Draven) will find out so it has to all be a bit clandestine. It's only when his striking miner father finds out from the boxing coach that "Billy" is spending his 50p elsewhere that a confrontation ensues and the film steps up a gear. The characterisations are strong and are not frightened to evolve - but not in a simplistic A+B=C fashion. There are troubles and traumas - not least those faced by a father who struggles with his own emotions; is facing financial difficulties, a wayward older son and a younger one who wants to dance and hangs about with best pal "Michael" (another strong effort from Stuart Wells) who is quite clearly gay. Walters and Bell and Bell and Lewis work well together here; allowing the story to emerge naturally and energetically and as feel-good films go, this takes some beating. It's the ultimate "anyone can do" film that resonates as well now as it did then - only, maybe, the soundtrack needs a bit of updating! Great film this - and there's even a tiny bit of Adam Cooper at the end.
97	Despite having a somewhat weak cast, this is an incredibly poignant drama of one man's struggle to live a new life. Probably too violent and close-to-home for some.
106	**A very simple but very human film, with very good feelings and dialogue.**\r\n\r\nContrary to what I like to do, I saw this film after seeing its sequel, “Before Sundown”. It's a very nice story about an American tourist who is enchanted by a French student he meets on the train on the way to Vienna, and invites her to spend some time with him. The rest of the film is an intense dialogue between the two through the streets of the city, as emotions and feelings develop.\r\n\r\nThe best thing this film has to offer is the surprising and intensely credible interpretation of the main actors. Ethan Hawke and Julie Delpy are both young, elegant and seem to make a nice couple (of course, the characters, not the actors). I don't know if I'm the only person to think this way, but it seems like the actors felt what the characters were feeling, to the extent that there was sympathy or mutual understanding between the two professionals, and a chemistry that permeated entirely to us. .\r\n\r\nDirected and written with great skill by Richard Linklater, the film can summarize the first meetings of many young couples out there, and I have no doubt that there are many people who will easily identify with the two characters. Who has never chatted with someone cute on a train or bus? There are friendships that start like this, and I myself have a similar case in my life: I have a friend that I value very much, who is blind and who I met by chance on the train, helping her to sit down on more than one occasion (we were both regular travelers due to work). It's a very human film, full of feelings, and full of good dialogues.
107	We all lie to ourselves to be happy.\r\n\r\nIt's not until a film like Memento comes along, or that you personally have to deal with someone close who suffers a form of this subject to hand, that you get jolted to remember just how your memory is such a prized and treasured thing - and crucially that it's one of your key safety devices.\r\n\r\nChristopher and Jonathan Nolan crafted one of the best films of 2000 based on those facets of the human condition. Their protagonist is Leonard Shelby, played with stupendous believability by Guy Pearce, who is suffering from a memory amnesia caused by a trauma to the head as he tried to aide his wife who was raped and murdered. He can remember things before the incident, but anything post that and he can't form a memory. So who can he trust? Does he know any of the few people who appear to be in his life at the present time? He tattoos his body to help him remember, constantly writes notes to keep him alert in his now alien world, while all the time he is on the search for the man who ruined his life.\r\n\r\nChristopher Nolan plants the audience right into Leonard's world. By using a reverse story telling structure it's deliberately complex and ingenious given that it opens with the ending! It has been argued that it's trickery for trickery sake, style over substance, but the way each scene is built upon in the narrative is a thing of high quality, it's all relevant and demands the closest of attention from the viewer, where cheekily we are ourselves asked to form memories of prior narrative passages. Mystery is strong throughout, the characters currently in Leonard's life may have different means and motives, it keeps us alert, with the confusion, lies, manipulations, enigmas and amnesia angles booming with neo-noir vibrancy. And the Nolan's know their noir of course, adding a narrator who is hard to define or trust himself!\r\n\r\nThe reverse structure wasn't new in 2000, but Christopher Nolan picks up the idea and adds new strands to it, simultaneously bringing his visual ticks as David Julyan's musical score shifts from elegiac forebodings to pulse pounding dread, and as evidenced by the darling easter egg option that allows one to watch it in chronological order, it's a damn fine thriller without the reverse trickery anyway. Super. 9/10
108	Excellent. I can't believe I've finally gotten around to watching all of Christopher Nolan's films (I have 'The Prestige' on DVD, but have yet to see it), but it's been well worth the wait. There are a couple of handful of English-language directors operating right now that I will make sure I watch every single film of, and Nolan has become one of those for me, and rightfully so. A very fine twist on the noir framework.
109	‘Memento’ is director Christopher Nolan’s tribute to classic film noir tales of revenge and mystery. By adding a new twist to traditional conventions, Nolan is able to consume and grip the viewer throughout the entire film and for years after. The aspect that differentiates this neo-noir from its competitors today is its jumbled and complex narrative which continually moves backwards in time. The viewers first see the main character complete his revenge murder (a triumphant scene we usually associate with the ending of film noirs). We then begin to see events unfold backwards and the reason for this becomes clear.\r\n\r\nLeonard Shelby (Guy Pearce) and his wife are attacked in their home. His wife is murdered but Guy Pearce is left with a brain condition that disables him from creating anymore short-term memory. Constantly being reminded of the horror of the situation, he is relentlessly spurred on to get his revenge on his wife’s killer. As the viewer progresses through the film, they begin to feel more and more like Lenny. The audience have no idea of what has happened prior to the scene currently showing and so we are left feeling the same confusion as our protagonist. To cope with his condition, he maintains a system of notes, photographs, and tattoos to record information about himself and others, including his wife's killer. He is aided in his investigation by "Teddy" (Joe Pantoliano) and Natalie (Carrie-Anne Moss), neither of whom he can really trust (both of the latter actors starred together in ‘The Matrix (1999)’ in which Pantoliano was not to be trusted, disorientating the informed viewer more).\r\n\r\nThe film's events unfold in two separate, alternating narratives—one in colour, and the other in black and white. Leonard's investigation is depicted in five-minute colour sequences that are in reverse chronological order, however, the short black and white scenes are shown in chronological order and show Leonard on the phone to a mysterious stranger having a conversation that the viewers cannot understand (these sequences are more direct references to the film noir genre that Christopher Nolan is embracing). This style of directing makes the audience completely empathise with Leonard’s situation as you never know more than he does, but also it creates huge comedic and emotional moments which rely heavily on the notion of dramatic irony.\r\n\r\nWith Nolan’s use of handheld camera work, an overtone of pink colouring, and sharp editing (the only transition effects in use are occasional fade outs) the viewer is made to feel disorientated and is therefore able to empathise more with Leonard’s character. The original idea was a short story by Nolan’s brother, Jonathan who also helped with the screenplay. The dialogue in the film is its best feature with its insightful, powerful and heart-wrenching speeches about the nature of memory. As we learn how we rely upon memory for our sense of reality, we begin to question reality itself.  The idea of faith and constant references to the bible can make the entire film a metaphor for people’s faith in Christianity or any other religion at that.\r\n\r\n★★★★★
110	Structuring the film in such a way that the viewer knows as little as the protagonist, the Nolan's have created a nifty puzzle that slowly unravels to its climax.\r\n\r\n8/10
111	Phenomenal.\r\n\r\nWhat a movie! I had heard plenty about <em>'Memento'</em> prior to watching in regards to how high-quality it supposedly was, though didn't actually (thankfully) get spoiled on anything that occurs onscreen - I did know of the note-taking, though for some reason thought it was via post-it notes rather than polaroids - no idea why!\r\n\r\nIt's a very satisfying movie come the conclusion, concentration is very much the order of the day but the film does connect enough dots rather sharpish. I thoroughly appreciated the ending itself, Guy Pearce delivers the final moments supremely. Speaking of he, I've not seen much of him before but this is a terrific lead performance!\r\n\r\nJoe Pantoliano and Carrie-Anne Moss are excellent in their respective roles too, even Stephen Tobolowsky and Harriet Sansom Harris manage to leave an imprint on my mind despite much less screen time; first time I've seen Harris in anything properly since I was in my teens a decade or so ago, always remember her great showing in <em>'Desperate Housewives'</em> (interestingly the first television show I ever got into, it's quality, don't @ me 😎).\r\n\r\nAnyway, back on track... Christopher Nolan - some director, eh?! I'd put this right in my top three ranking of his work, behind <em>'Inception'</em> and <em>'Interstellar'</em>. Such a fulfilling movie! I hope for similar-ish with his other pictures in <em>'Insomnia'</em> and <em>'The Prestige'</em>, two flicks I know absolutely zilch about. I don't anticipate that Mr. Nolan will let me down at this point.
112	I reckon what makes this work from Christopher Nolan is the creation of a cerebral maelstrom that is every bit as confusingly frustrating for us watching as it is for his protagonist "Leonard" (Guy Pearce). Now we don't know how he has developed his menacing ninja skills, but we do know that he is trying to get to the bottom of his wife's murder, and that he has virtually no short-term memory to help him. As he pieces things together, he has to leave himself notes, or polaroids augmented with scribbles so he can recall just how far he has got and whom he can (or cannot) trust. The facts that he considers crucial are tattooed across his body as his search narrows - or does it? Along the way he meets some characters that he has some documentation on - some, not. Some he advises himself to trust, some not. Some of the photos depict dead bodies. On those fronts, we do have just a little more information on the cause tan he does - but it doesn't really help anyone deduce who did kill his wife? Maybe he did it himself? Its a maze of a film this. It's littered with twists and complications - but they are not annoying nor gratuitous. It's the ultimate in cinematic one step forward two steps back, and those muddled scenarios are only emphasised by "Natalie" (Carrie-Anne Moss) and an on-form Joe Pantoliano as "Teddy" - a man who features increasingly as his quest proceeds. I also did enjoy the ending. It avoids the concrete and the simplistic, and offers a fitting end to a potently effective effort from a Pearce at the top of his game.
113	A similar style to Inception, pay attention or you’ll lose it
114	**Planet Noir**\r\n\r\nI declare _Blade Runner_ the best sci-fi movie of all time. Arguments? No? Okay. So long. Please upvote the guest book on your way out.\r\n\r\nWAIT! There's more. At the risk of whistling conspiracies and setting off inappropriate vibrations in your slacks, you see, this Ridley K. Dick concoction is going on right now. While we're all transfixed by the endlessly goofy droppings from the web, forever staring down and swiping things on our smarty-pants phones, retweeting selfies of infinitely mirrored  selfies; proliferating at light speed, every aspect of humanity is being replicated, perfected, mechanized, optimized, upgraded, fortified, robofied, Googlized, quantumized, DNA'd and NSA'd and will soon converge to fall upon and supplant us, and Harrison Ford, despite looking trim for his years, will be too old to stop it! And the irony to end all ironies is that we, as the irresponsibly arrogant, over-infested and narcissistic caretakers and consumers, and the colossal defecators of this broken-down, flea-bag of a planet, are entirely fundamentally responsible. No, the irony of all ironies is that a world exclusively dominated by self-correcting technocratic cyborgs with zettabytes of artificial intelligence will be a vast improvement. The androids are saving the planet! AHHH, run for your life! Blade Runner is both an expired cautionary tale and emerging utopian fantasy.\r\n\r\nOh, you knew this already? Very well. Carry on. Enjoy your self-driving cars and virtual nature tours.
115	Retirement - Replicants - Resplendent. \r\n\r\nBlade Runner is one of those glorious films that has gained in popularity the older it has gotten. Ridley Scott's follow up to the critical and commercial darling that was Alien, was by and large considered a flop and damned for not being a science fiction action blockbuster. There was of course some fans who recognised its many many strengths during the initial weeks of its 1982 release, but many who now claim to have loved it back then are surely looking sheepishly in the mirror these days, for the hard-core minority of 82 fans remember it very differently. \r\n\r\nRemember the spider that lived outside your window? Orange body, green legs. Watched her build a web all summer, then one day there's a big egg in it. The egg hatched... \r\n\r\nAnyway, that's by the by, the point being that a film can sometimes be ahead of its time, misunderstood or miss-marketed, Scott's masterpiece is one such case. Story, adapted in fashion from Philip K. Dick's story, Do Androids Dream of Electric Sheep? Is pretty simple. It's a dystopian Los Angeles, 2019, and there are four genetically engineered Replicants - human in appearance - in the city, which is illegal. They were designed to work on off-world colonies, any Replicant who defies the rules will be retired by special police assassins known as Blade Runners, and Blade Runner Rick Deckard (Harrison Ford) is on this case. A case that will prove to have many layers... \r\n\r\nA new life awaits you in the Off-world colonies! A chance to begin again in a golden land of opportunity and adventure! \r\n\r\nRidley Scott gets to have all his cakes to eat here, managing to blend intriguing science fiction with film noir. That the visuals are outstanding is a given, even the film's most hardest critics grudgingly acknowledge this to be an eye popping piece of visual class - the mention of eyes is on purpose since it's forms a key narrative thread. That it is awash with eye orgasms has led to critics calling a charge of beauty over substance, but the deep themes at work here tickle the brain and gnaw away at the senses. \r\n\r\nQuite an experience to live in fear, isn't it? That's what it is to be a slave. \r\n\r\nMood is set at perpetually bleak, a classic film noir trait, and paced accordingly. Scott isn't here to perk anyone up, he's here to ask questions whilst filtering his main characters through a prism of techno decay, of humanity questioned to the max, for a film so stunning in visuals, it's surprisingly nightmarish at its core. The emotional spine is ever present, troubled when violence shows its hand, but it's there posing an intriguing question as the Replicants kill because they want to live. And this as our antagonist, Deckard (Ford a brilliantly miserable Marlowe clone), starts to fall for Rachael (a sensually effective femme fatale portrayal), one of his retirement targets. \r\n\r\nTears in the Rain. \r\n\r\nAs Rutger Hauer (never better) saunters more prominently into the story as head Replicant Roy Batty, the pic evolves still more. Haunting lyricism starts pulsing away in conjunction with Vangelis' rib shaking techno score, while Jordan Cronenweth's cinematography brings Scott's masterful visions to life, key characters one and all. Visuals, aural splendour and dark thematics - so just what does it mean to be human? - Indeed, curl as one in a magnificent cinematic achievement. A number of cuts of the film are out there, and all of them have fans, but Scott's Final Cut is the one where he had total artistic control, and the scrub up job across the board is quite literally breath taking. 10/10
116	The movie's story didn't do much for me, however I did find parts of it confusing. After watching it I found out that I watched the "Final Cut" which has a completely different ending and different implications from the theatrical release. I didn't understand those implications...I needed to look up the ending online. Whether that's because the movie is confusing or I'm dumb, I can't say. But my friend I watched it with didn't understand it either.\r\n\r\nAfter looking up the end's meaning, I did find it a bit more satisfying. But the main reason this movie is worth watching is the visuals. Not sure I'd watch it again any time soon though.
118	I have only viewed the Final Cut, and judging by reviews elsewhere this is possibly the most complete and satisfying version of them all.\r\n\r\nI cannot truthfully say I am in awe with this film as I found it quite plodding at times. But having said that the visionary aspects, the bleak surrounds, and the air of hopelessness that permeates throughout most of the film is exceptionally well done. \r\n\r\nI would hazard a guess it wasn't a big success at the box office back in 82/83 chiefly because of the likes of ET, and Raiders of the Lost Ark, Return of the Jedi and quite a few other adventure/SF films of the time pushing this film into a dark corner. Another reason could be because it was too slow for those brought up on Star Wars; or just too unengaging for those looking at it from a murder-mystery perspective  (I recall reading that the original version had Ford do a Marlowesque voice over).\r\n\r\nAn impressive film for all that, with some delightful special effects, and a decent performance from Ford. But of course for me the true delight was Roy's "Time to Die" speech at the end. If there was an Oscar for best speech in a film, he would have won it with ease!
119	This time, it is Ridley Scott's turn to offer us his prognostication of a future wherein corporate America has, ostensibly benignly, introduced the ultimate in labour saving devices - androids called "replicants" - which have a look and feel of people about them. These "Nexus" creations can turn their hands to just about anything, but when the latest off-world models rebel, all of their cousins become outlawed and it falls to the "Blade Runners" to track them down and destroy them. "Deckard" (Harrison Ford) is one such operator who is called back out of his retirement to identify four of these highly adaptable and intelligent robots and this perilous task takes him to the heart of their manufacturer run by the fiendishly clever but unscrupulous "Tyrell" (Joe Turkel), and into a web of duplicity surrounding their controlling protocols and maybe even a fifth, almost impossible to recognise "replicant", whom - unlike it's contemporaries - has no idea that it isn't human. Ford is on cracking form here, as is Rutger Hauer - the android leader "Batty" and the dark, frequently rainy imagery contributes wonderfully to this seedily presented story of greed and manipulation set amongst a grittily dank and hostile environment that offers little, visually anyway, by way of hope or relief. It has a film-noir look and feel to it, and Scott keeps it moving well, keeps the dialogue sparse - though impactful, and the whole thing develops cinematographically some of the pretty profound questions brought up in the original Philip Dick novel about just what constitutes humanity. Just shy of two hours - it flies by, especially on a big screen where the visuals and audio still work wonders.
120	**A magnificent work, if we consider the time when it was released and the technical resources that existed.**\r\n\r\nHonestly, I didn't expect much from this movie. It was a film that was not successful in theaters and that only took off when it went to VHS, acquiring admirers since then and becoming one of the most respected films of all time. Set in a profoundly dystopian Los Angeles, it raises many philosophical and sociological questions around human nature, the course of humanity, our relationship with technology and our morality in general.\r\n\r\nWatching this film in 2022 was funny because the action of the film, released in 1982, takes place in the year 2019. That is, it was set in a future that, now, is past for me and never materialized (and I'm glad). The film's plot is not easy: humanity colonized other planets while destroying Earth, and created very realistic human androids while destroying itself. However, the androids, called replicants, got out of control, and are now hunted and killed, or used for the most vile purposes. The metaphors are clear, there is a lot of philosophical material, and it leaves us thinking for a long time.\r\n\r\nRidley Scott gives us, with this film, one of his masterpieces. The film is magnificent in every way, and it is worth giving it the time it needs to surprise us. It creates a neo-noir plot where nobody is innocent or angelic, and where danger is everywhere. The lighting, the shutters on the windows, the indispensable “femme fatale”, all the classic components of noir are here, in a frankly colorful film with sets and landscapes that combine the most grandiose futurism with the decadence and dirt of the world we destroy. The dialogues are memorable and full of deeply symbolic moments. The characters are rich, dense and complex, and it's extraordinary to think that we still don't really understand, after several decades, whether the main character is human or not.\r\n\r\nIn fact, it seems that time has not passed for this film: if we think that it is from the early 80s, it is incredible that it is so visually powerful and that it has such good cinematography. It looks like a movie made ten years ago. The sets and costumes couldn't be better, and the special effects are stunning. The soundtrack, composed by Vangelis, is smooth and hypnotic.\r\n\r\nAdding to all this, we have Harrison Ford, in one of the most underrated works of his career. He does a really good job, and he deserved more recognition for that. Sean Young also deserves a round of applause for the way he brought his character to life, a replicant who really thinks she's human. There are other very good actors, and we can highlight Rutger Hauer in particular, but they do not match this duo of artists.
121	Experienced on the big screen in the Everyman Cinema was just about the best way to loose myself in this spectacular SCI FI  masterpiece. Without Doubt “Blade Runner” has been extremely influential since its original release over 40 years ago and it’s technical wonder and effects are still as inspiring today. Doug Trumble’s effects, Larry Paull’s production design and the downtown L.A. location shots all work so well in creating a retro- fitted future.\r\n\r\nObviously a different cut to the original release , “Blade Runner: The Final cut “ removes the voiceover and original ending so criticised by audiences and critics during its theatrical run in 1982. This newer ( 2007 ) ending elevates the movie to something more spectacular and wonderful. A group of rebel replicants , feared dangerous to humans,  have escaped and landed on earth. Earth is a cyber, neon, futuristic , overpopulated, uncaring environment, with a population that has little time for anything other than existence.  Unlike these humans of the future, the replicants show far more empathy and humanity towards each other.  It is in the the dying moments of a replicant that we come to learn of the true nature of the rebel groups attempt to escape to earth. It is simply a quest that most humans try and attain, the desire to extend life. The beauty and wonder experienced by replicant leader Roy Batty ( Rutger Hauer ) in his short existence is sympathetically relayed as he saves his would be assassin. The power of “ Blade Runner : The final cut’”  is highlighted during the end scenes  when Roy reflects his existence. As he “dies”  it is clear he is gazing into a future already lost to the past.
122	"Blade Runner," Ridley Scott's iconic 1982 sci-fi masterpiece, is a film that transcends time with its **thematic depth** and **stunning visual design**. Having immersed myself in all the various cuts of the movie, I can confidently say that each version provides a unique experience worth exploring.\r\n\r\nFrom the original U.S. Theatrical Cut with its voice-over narration to the more enigmatic Director's Cut, each rendition adds different textures to the story of Rick Deckard, a Blade Runner tracking down synthetic beings known as replicants. But it is **the Final Cut**, hailed by many, that stands as the **most cohesive and definitive vision of the film**. Scott's meticulous craftsmanship reaches its peak here, harmonizing all the elements that make "Blade Runner" an enduring classic.\r\n\r\nVisually, "Blade Runner" is a triumph. Yes, by today's standards, some shots—such as those flying over the dystopian cityscape—may seem dated. But what remains impressive is the film's ability to create a **believable and immersive world without relying on CGI**. Utilizing miniatures, matte paintings, and carefully designed sets, the film's visual aesthetics hold up remarkably well, echoing a time when practical effects were the vanguard of filmmaking.\r\n\r\nWhether you're a newcomer to the world of "Blade Runner" or revisiting it, there's value in exploring each cut of the film. Yet, if you were to choose one version to encapsulate the entire essence of this groundbreaking work, the Final Cut would be the ideal choice. Its blend of story, character depth, and visual artistry illustrates why "Blade Runner" continues to be a beacon of cinematic excellence."
123	Visually stunning and completely immersive.\r\n\r\nGreat performances by Harrison Ford, Rutger Hauer, Sean Young, Daryl Hannah, Edward James Olmos etc. \r\n\r\nRidley Scott does some impressive visuals, camera work, lighting etc.\r\n\r\nLove the completely immersive dark, gritty, rainy dystopia portrayed. I love that the camera sometimes lingers on details or zooms out to show you more of the world. Fantastic atmosphere.\r\n\r\nExcellent unique soundtrack by Vangelis. \r\n\r\nI felt a great range of emotions watching this movie including melancholy, sentimental, in awe, in wonder etc.\r\n\r\nRoy Batty stands out to me as a wonderfully complex, strange, interesting, confused, troubled character. Total pleasure to watch. So is Deckard, Rachel, Pris, Sebastian etc.
124	Non stop violence in a post apocalyptic earth, this is so much more anime than Ghibli. It isn't actually a true Ghibli film but is often marketed as such. It's style is very different to that usually associated with Ghibli. If you're expecting 'My Neighbour Totoro', you'll be disappointed. I like Ghibli films but this falls into an anime spiral of - attack the armies that control the power and release the monster driving army2 into the acid sea who must retaliate by killing more people and raising a demon etc.\r\nAll very well for that genre but I don't tend to rate those films well. I'm really reviewing this film for Ghibli fans hoping for, "Howl's Moving Castle" so they can find something more appropriate 
127	You are in for a disappointment if you are expecting this to be a shark movie. Open Water, which reminded me of Force Majeure (2014), is instead about the tension brewing between two husband-wife divers who are left to adrift by their crew in the middle of a reef. Based on an odd true story, it is about the delirium, the panic attack, and the sheer fear of being shark food when you are in the middle of an ocean infested with sharks, stingrays, and barracudas than about being preyed on by sharks, which makes it a slightly dull movie to watch, especially if you are a shark movie connoisseur like me. There are hardly any jumpscares or thrills here, their lack of which is aggravated by some odd humming music and found footage-like camera work. But it does have some brilliant dialogues that are tinged with humour and wisdom, which is supported by some level of suspense, making it a worthwhile watch if you like natural survival films. Give it a try. (Grade C+). TN.
128	**Trailblazers of a Lost Art**\r\n\r\nLittle wonder James Cameron and Joss Whelon movies are the biggest box-office earners. They are masters of cinematic rhetoric. The unfolding dramatic situations and controlled dialogue are meticulously contrived. Cameron could probably have potted more if it wasn't for his earnest, simplistic messages (rich bad; nature good). All three movies (_Titanic_, _Avatar_, _Avengers_) plot along comfortably then suddenly spike spectacularly.\r\n\r\nBut no one has ever laid on the cinematic charm and cajolery like Stephen Spielberg. He was by far the craftiest manipulator of action and melodrama there ever was. He was the progenitor of summer blockbusters and all-ages, all-nations spectacles. At his best he had a gift for re-living and realizing that ethereal and irresistible childhood awe.\r\n\r\nIf _Raiders of the Lost Ark_ (NOT the sequels... NO, not even the father- son one) was made today, exactly the same way, okay maybe in 3D with updated CGI, it would surely land at the top of the box-office heap. It is essentially the first comic book movie that wasn't a comic book (bespectacled mild-mannered Archaeology prof by day and globe-trotting whip-wielding action hero on sabbatical). _Raiders of the Lost Ark_ (the first and only) is arguably the greatest adventure movie ever cooked up. And we, the abject audience, servile participants of the artifice, were licking its boots. We wanted Spielberg and his Indy to rope us in, reel us into the action, and completely have their way with us. We overlooked the emotional manipulation and contrived trappings because it was a pure freaking joy to watch, a Lucas produced godsend. Harrison Ford was born to play it just as Steven was born to direct it. It's really too bad they had to brand and knock off inferior sequels that, while making oodles of money, tarnished the shine of the unsurpassed prototype.\r\n\r\nIndiana Jones was the perfect reluctant action hero on a selfless mission. A whip-snapping, truck-wrangling, swordster-gunning, Nazi- brawling adventurer who was matched only by his headstrong and sassy love interest, one pistol of a gal who could drink any man under the table. Not enough credit has been given to the great Lawrence Kasdan as the writer of this marvellous adventure. The script is as close to perfect as anybody could scribe. Even a dialogue-heavy expository scene (poisoned dates) was infused with a tense element of suspense. Yes, the story was hyper-fictional, completely contrived, shamelessly far-fetched... and altogether delightful. I wasn't expecting much when I went in to watch it back in 1981, but it had me wanting to do do back-flips on the way out. America's own Fab Four, Larry, Steve, Harrison and George, put on an action-adventure clinic.\r\n\r\nPossibly the only weak spot in the movie is the climax which had our hero and heroine tied to a stake while God, the almighty Mcguffin from the Old Testament, magically wrapped things up for them. "Don't look" Indy warns, with his patented crooked grin. Are you kidding? We can't possibly take out eyes off of this. With respect to lost Teddy Bears from space and anti-Nazi machinators, Raiders is Spielbergs greatest achievement. It is one of the finest films ever made, of its or any kind. It is, hands down, my desert island movie.
129	I think for a lot of people, Raiders is their favourite (x) movie. Be that their favourite adventure movie, favourite '80s movie, favourite Spielberg movie, whatever. None of those ring true for me, but it is my favourite Indiana Jones movie. I was a mad fiend for Temple of Doom as a kid, and I've managed to make multiple teachers put The Last Crusade on in class, so I'm quite a fan of the franchise, but Raiders is the most enjoyable to me... I've never even seen Crystal Skull... So maybe it's dishonest to say I'm a fan of the franchise... I'm a fan of the trilogy!\r\n\r\n_Final rating:★★★½ - I really liked it. Would strongly recommend you give it your time._
130	Good watch, could watch again, and can recommend.\r\n\r\nFor Spielberg's American Alan Quartermaine, I can certainly understand what the hype is about, but I've never been a big fan myself.\r\n\r\nFor starters, Nazis are boring.  I'm sure they were all the rage once upon a time as a classic villain, but it doesn't do much for me.\r\n\r\nHarrison Ford, of course, carries the movie, but Karen Allen plays really well with him throughout the movie and is amazing in her own right.\r\n\r\nIf nothing else, Spielberg is able to shoot a powerful atmosphere, and the movie is captivating and engaging.\r\n\r\nIt's not something I can watch over and over, but when I do watch it I know I'm going to get drawn in and have a great time.
131	5 stars ⭐️⭐️⭐️⭐️⭐️\r\n\r\nMy favorite action film of all time due to one of the most iconic death scenes at the end being my personal favorite and being featured in my melt movie lists on many different websites!!!
132	This is trailblazing stuff - a great action film in the vein of earlier Technicolor swashbucklers. Harrison Ford is engaging and hugely charismatic and his battles with Karen Allen and Paul Freeman make for a considered, slightly dark but funny and memorable piece of cinema. So many great films have a depth in the cast that offers a multi-layered approach to storytelling. Spielberg cast John Rhys-Davies and Denholm Elliott excellently as Ford's stalwarts. John Williams has a golden baton when it comes to action-scores (akin to Korngold) and the story clearly has a tint of George Lucas' imagination to it. Historically, there is plenty of fiction but that spoils nothing. Not the best of the series, but a very good start...
133	**The best film in the series**\r\n\r\n_Raiders_ was great but suffered patches of slowness where the momentum was damaged - I know people who actually fast forward Raiders when Indy and Sallah discover the Well of Souls and begin watching the film again at the plane fight sequence.\r\n\r\n_Temple of Doom_, however, is a non stop rollercoaster ride - a thrilling, violent and funny adventure. Spielberg's best action film, in my opinion. Violence, horror, sentimentality, thrills, comedy - _Temple_ has it all! _And more_!!!\r\n\r\nJohn Williams provides a superb Indian infused score performed beautifully by the ever reliable _London Symphony Orchestra_  probably my favourite musical score of the series too. Indy takes a severe beating in this adventure, famously losing his shirt sleeve in the process - whereas in the toned down Raiders rehash, _Last Crusade_, he merely gets a bit of dust on his hat.\r\n\r\nA great whirlwind of energy this film is. Love it!\r\n\r\n- Potential Kermode
134	Simultaneously both more grim and more silly than the Indiana Jones films either side of it, _The Temple of Doom_ was my favourite of the series as a kid. As an adult though, it seems it is objectively the worst movie in the trilogy, but damn if there isn't a lot of memorable parts to love about it.\r\n\r\n_Final rating:★★½ - Had a lot that appealed to me, didn’t quite work as a whole._
135	Spielberg on devilishly OTT form!  \r\n\r\nPrior to the long mooted and eventual release of part 4, Temple Of Doom was often thought of as the weakest part of the series, yet it actually appears to me to be maturing nicely with age. With honest appraisal I see the only crime that Temple Of Doom can be charged with is is not being as good as Raiders Of The Lost Ark. But since few films can match that movie's classic status I find it churlish to do the second film down for it.\r\n\r\nTemple Of Doom is a frenetic roller-coaster ride, full of enough crash bang wallop fit to grace any action adventure in the history of cinema. The set pieces are pure outrageous fun; life raft escape from a crashing plane, mine cart thrill ride & a bridge sequence that is pure boys own brilliance. And while the film finds Spielberg cramming the action with a darkly sinister streak (hence the PG13 rating), we find that the fun still far outweighs any horror that junior viewers might get from certain scenes.\r\n\r\nThe film also finds Ford giving his best performance as Indiana Jones since the plot calls for a more humane Jones. In fine physical shape, his witty interplay with Short Round is coupled with a textured feel of friendship that plays real well up on the screen. Kate Capshaw was always going to struggle to get close to Karen Allen's wonderful turn as Marion Ravenwood in Raiders, for where Marion was feisty and tough, Capshaw's Willie Scott is more scare-d-cat and reliant on Indy's guile to save her from peril, but she does OK and looks gorgeous into the bargain.\r\n\r\nIndiana Jones and the Temple of Doom was a massive hit at the box-office and firmly bought Spielberg the time to then go out and make two dramas in Empire of the Sun (1987) & The Color Purple (1985). He would then return with the third Indiana film to finish what was then a marvellous trilogy; of which Temple Of Doom is the prime piece of meat in the delightful (original) trilogy sandwich. 8.5/10
136	Decent watch, might watch again, and can only recommend for people who are already big Indiana Jones fans.\r\n\r\nThis is a much cheaper movie than it's prequel, not in budget, but in writing and characters.  With the trade out in female co-leads, Willie is an annoying if not irritating character and the movie might actually be improved if you just edited her out of the movie.\r\n\r\nShort-Round is fun, but not to any degree to go as far as saving the movie.  The atmosphere of the movie is darker than it is funny where it matters.\r\n\r\nI'm not saying it's a bad movie by any means, but I'm not a big Indiana Jones fan and this is definitely the worst of the 4 movies.
171	Genuinely one of my favorite movies of all time. Watched again recently and realised how well written, brilliantly shot, beautifully cast and cleverly produced this movie actually is!
137	Sadly, this chose to go down the route of child stardom - which you either love or hate. Though "Short Round" (Ke Huy Quan) wasn't as irritating as many; he was still pretty persistently annoying and for my money helps make this quite a bit weaker. Aside from the elephant, this also lacks the depth of casting that the first of the films had - Kate Capshaw is almost slapstick as "Wille Scott" and the story isn't so hot, either, as our intrepid explorer has to try and track down some ancient stones that - along with their stolen children - are crucial to the agrarian lives of many peaceful citizens. The roller-coaster finish is still the stuff of Hollywood legend, though - and the films is a classy, well put together tale of clashes of culture with a healthy dose of mysticism, colonialism and Ford certainly has charisma to spare. Good fun, just not quite "Raiders".
138	This was schmaltzy but decent and could have been a lot worse. Normally I run from this sort of film like the plague but Patrick Swayze's recent death and me greatly enjoying 'Point Break' recently made me want to check out another one of his finest roles ('Ghost' and 'Road House' will have to wait, methinks.). When I got my first DJ-ing job, working the night shift at the now-defunct K-102 FM in Woodstock as a teenager, I often received calls asking for any of the three hit songs from its stellar and nostalgia-wringing soundtrack: Eric Carmen's 'Hungry Eyes', Swayze's own 'She's Like the Wind' or the Oscar-winning 'The Time of My Life' by Bill Medley and Jennifer Warnes. It was interesting now, almost three decades later, finally seeing the music I had played on the airwaves eon before now shown in some sort of cinematic context.\r\n\r\nIt was OK to see as a tribute to Swayze's craft (he was trained in classic ballet as well as in acting) but I'm left with no interest whatsoever in either the sequel or remake, unless as a special gift for my lady, Tammy.
139	Entertaining hit with lush Appalachian locations, but the writing doesn't respect the intelligence of the viewer  \r\n\r\nRELEASED IN 1987 and directed by Emile Ardolino, "Dirty Dancing" stars Patrick Swayze as Johnny Castle, a working-class dance instructor at a mountain resort in the Catskills in 1963. Jennifer Grey costars as "Baby," the 17-year-old daughter of an affluent Jewish doctor vacationing at the resort. She takes the place of Johnny's dance partner after his partner gets pregnant, albeit not by Johnny. Baby naturally develops a crush.\r\n\r\nThis was the hit romantic drama of 1987, but it actually didn’t make as much at the domestic box office compared to the other two dance flicks of the 80s: “Flashdance” (1983) made $95 million and “Footloose” (1984) $80 million while “Dirty Dancing” brought it $64 million. The two main cast members are a highlight. Swayze was in his prime and Jennifer Grey cute & nimble, like a fawn. In reality Grey was 26 years-old during filming, although she passes for late teens pretty well. Swayze, however, was 34 and looked it, albeit trim and fit.\r\n\r\nThe lush Appalachian locations are outstanding and the story keeps your attention but you'll roll your eyes at the idiotic misunderstanding where Baby's father assumes Johnny's the one who got his partner pregnant and, for some strange reason, no one sets him straight. Not to mention, the characters always say the wrong thing at the wrong time, which perpetuates the misunderstanding. Also, the sexual union of Johnny & Baby is both premature and unbelievable in light of the time period, Baby's age (17 years-old) and her upbringing. Frankie Avalon was once asked about his early 60’s "Beach" movies if the male-female relationships were as "squeaky clean" as portrayed and he answered (paraphrasing): "As a teen back then 'going all the way' wasn't even considered an option." The obvious exception would be disreputable kids from the "other side of the tracks."\r\n\r\nMoreover, the fact that Johnny is having sex with the doctor's daughter, a minor at that, can't win any points in his favor. Hence, even without the misunderstanding there's little reason for the father to warm up to Johnny. So why does the doctor show respect for Johnny at the end, a dude who's fornicating with his under-aged daughter and is clearly much older than her as well, although it could be argued that he’s naïve and doesn’t necessarily know they’re having sex already. Flaws like these smack of lazy writing and are offensive to anyone with an ounce of intelligence.\r\n\r\nIf you can look past these problems, however, the film is entertaining. The dance sequences shown in the staff area are akin to vertical sex with clothes on. I guess that's why it's called "Dirty Dancing," huh? Yet this is another flaw of the movie: these scenes are so amped-up and choreographed they shout to the viewer via megaphone: "This is A MOVIE; it's NOT REAL." Nonetheless, Grey's a cutie, Swayze's The Man and the beautiful Appalachian locations are a highlight, filmed at Mountain Lake Resort, Pembroke, Virginia, and Lake Lure, NC.\r\n\r\nTHE FILM RUNS 1 hour, 45 minutes. WRITER: Eleanor Bergstein.\r\n\r\nGRADE: B-/C+
140	A pretty simplistic film with a plot that's more of an excuse to show dance scenes and an extremely surface level handling of the issues of gender and class that it raises, but it's pretty cute and also I'm bisexual so I like it anyway.
141	An ok movie. A lot of cheesy parts that I didn't like. I did like the dancing and the love story. I guess it was better at that time.
142	Pretty iconic.\r\n\r\nNot sure how I hadn't logged this until now, given it's a film I watched quite a bit growing up due to it being my mum's favourite movie. Better late than never! <em>'Dirty Dancing'</em> is entertaining - cheesy, but entertaining. What helps is the ace soundtrack, which culminates with the classic <em>'(I've Had) The Time of My Life'</em> scene.\r\n\r\nThe film flies through its 100-minute run time and features super chemistry between leads Patrick Swayze and Jennifer Grey, two who give strong performances. Jerry Orbach (Just me confusing him with Jonathan Hyde? Probably.) is good too. As you'd expect, the dance numbers are all on point as well.\r\n\r\nI've never checked out the 2004 prequel, <em>'Dirty Dancing: Havana Nights'</em>. It's next up, though high hopes I do not hold - but we'll see.
143	Raiders Of The Last Crusade.\r\n\r\nIndiana Jones teams up with his father to try and locate the Holy Grail. Something that the Nazis are again particularly interested in themselves. \r\n\r\nWe didn't know it at the time, but every Indiana Jones fan on the planet presumed that The Last Crusade was to be the final film to feature the intrepid archaeologist. As it turned out, another film would surface in 2008, but casting that aside (as many would like to do), Last Crusade should, and is, judged as the trilogy closer it was meant to be. \r\n\r\nIn 1988 Steven Spielberg was deep into bringing Rain Man to fruition, all thoughts of Indiana Jones had gone by the wayside with the harshly judged part two, Temple Of Doom. In stepped George Lucas to politely remind Spielberg that they had an agreement to make another Indiana Jones picture, Spielberg no doubt obliged and humble, passed on his Rain Man work to Barry Levinson who promptly bagged himself an Oscar for the film. It can be guessed that Spielberg was probably grouchy around this period, but he needn't have worried, because The Last Crusade provided a much needed hit for not only himself (post Empire Of The Sun), but also Lucas (Willow) and Harrison Ford (Frantic). \r\n\r\nI mention the run up to this picture because it explains a lot on why the film is pretty much a retread of Raiders Of The Lost Ark, something that some detractors find unforgivable. Yet Last Crusade is still an immensely enjoyable adventure picture, with Spielberg proving that he was still capable of a popcorn bonanza. Using the Raiders formula and moving away from the dark flourishes of Temple Of Doom, Last Crusade is actually the simplest film of the three, but still it manages, courtesy of a sparkling casting decision, to become the most entertaining of the original trilogy. Is it better than Raiders? Of course not, but it positively rips along with sparky dialogue and an agenda of cliffhanging suspense like the adventure films of yore. \r\n\r\nIn comes Sean Connery as Dr Jones Senior, and its the picture's trump card, because the magnificent interplay and obvious rapport with Ford (cool as a cucumber) is there for all to see. It's this what drives the film on through the more mundane and picture filler sequences, showcasing two top wily professionals with care and consideration to their craft. The casting of Alison Doody as the main female is a poor one, and one only has to look at her subsequent career post Crusade to see she wasn't up to the task here. Bonus comes in the form of the River Phoenix prologue, Phoenix as the young Indiana paves the way for the jaunty path that Crusade takes, whilst simultaneously giving us a nice little back story from which to launch the adventure. \r\n\r\nMade for $48 million, the film went on to gross $474,171,806 Worldwide, now that's a lot of people who evidently were happy with Raiders Of The Lost Ark 2! And I gleefully count myself amongst that number. 9/10
144	It feels very much a retread of _Raiders_. But, that was a great movie, so it's not exactly as if that's a bad plan.\r\n\r\n_Final rating:★★★½ - I really liked it. Would strongly recommend you give it your time._
145	Good watch, could watch again, and can recommend.\r\n\r\nWhile Harrison Ford does a great job as Indiana Jones, it is always good to see Sean Connery get involved, even if he is very passive in the action. \r\n\r\nThen there is an unfortunate amount of flashback, but it is better than doing an "Indian Jones: Origin" movie to explain how he attained his stylish attire and phobia of snakes.\r\n\r\nThis has a quality female companion, an entertaining side character, but we're back to Nazi's again for villains.  It almost is just a highlight of the ridiculous lengths that Nazi's went to look for weird resources: the occult ("Hellboy"), artifacts, and investigations into alien contact.\r\n\r\nThis is a return to quality though, it takes up the more serious atmosphere of the first movie and with that concentrates on a dramatically good action adventure movie.\r\n\r\nThis is my favorite of the franchise.
146	"Indiana Jones and the Last Crusade" adopts a change of pace probably because the filmmakers have obviously deemed "Indiana Jones and the Temple of Doom" (1984) much too dark (and perhaps completely unpalatable in some quarters) for most audiences who thrilled at the exciting derring-do of "Raiders of the Lost Ark" (1981). This current outing is much more audience friendly and it gets the delicate balance just right to create a heady mix of thrills and spills which results in a breathless whirlwind adventure during its action packed two hours. Steven Spielberg is certainly on tremendous form as he skillfully pieces together superbly executed action scene after action scene. He also makes extensive use of a tank in much the same way as he did the boat "Orca" in the blockbusting "Jaws" (1975) and he effortlessly finds a seemingly inexhaustible array of fresh camera angles to capture every second of the unfolding and fast moving action.
147	In my view, the best of the series by a country mile. It's action-packed adventure cinema at the top of it's game. Harrison Ford and Alison Doody provide the foundations in an engaging and sexy way and allow Denholm Elliott; John Rhys-Davies, a duplicitous monkey and, of course, a series defining Sean Connery as his learned dad "Professor Henry Jones" with such a cheeky glint in his eye to add all the icing to a very, very good cake. John Williams provides a cracking score to complement the history and creativity of Messrs. Spielberg and Boam's words and images. We have even got a quote from Charlemagne. What's not to like?
148	The heat is on - indeed!\r\n\r\nCocky rule dodging Detroit Cop Axel Foley (Eddie Murphy) heads to Beverly Hills in search of those responsible for murdering his friend. Upon getting there he falls foul of everyone he meets due to his tough Detroit approach work. Undaunted, Foley, aided by old friend Jenny Summers (Lisa Eilbacher) and two intrigued local detectives, starts to unravel the mystery.\r\n\r\nHey Axel you got a cigarette?\r\n\r\nThere was a time when Eddie Murphy ruled the world. After Trading Places had introduced us to his sharp comedic tongue, and 48 Hours had shown him to be a more than capable action character actor, Beverly Hills Cop fused the two together and propelled Murphy to super stardom. Directed by Martin Brest and produced by Messers Simpson & Bruckheimer, it's really no surprise that "Hills Cop" is shallow, simple (a fish out of water comedy standard) and utterly commercial. Yet with its gusto, humorous script (Daniel Petrie Jr) and neat plotting, it becomes a hugely entertaining film - led superbly by Murphy due to infectious comedy energy and superb knack for timing.\r\n\r\nYou're not going to fall for the banana in the tailpipe routine!\r\n\r\nIt's hard to believe that the likes of Sly Stallone and Al Pacino were first mooted for the role, so not as a comedy one imagines, but as it being a standard police action movie, but enter Murphy and it ended up as a fine blend of action and comedy. There's little digs at Beverly Hills and its smugness, a way of life that Foley, with his down on the streets toughness, can't comprehend, while opposing police methods also get a wry once over -  wonderfully threaded in the relationship between Foley, Taggart (John Ashton) and Rosewood (Judge Reinhold). \r\n\r\n\r\nSmall gripes reside, such as Steven Berkoff's by the numbers villain being something of a let down and Ronny Cox is sadly playing filler time with an underwritten character. But this is about Murphy, the fabulous stunt work and the successful union of action and comedy. And hey! even Harold Faltermeyer's bobbing synth score, "Axel F," has a nippiness that remains quintessentially 1980s. 8/10
149	This is probably my favourite outing for a fresh-faced and wise-cracking Eddie Murphy. He ("Axel Foley") is the cop from Detroit who finds himself embroiled in some criminal antics in the upper class and distinctly by-the-book LA suburb of Beverly Hills. Despite the serious reservations of "Lt. Bogomil" (Ronny Cox) he ends up working with two of his detectives "Taggart" (John Ashton) and "Rosewood" (Judge Reinhold) as they try to track down the murderer of a childhood friend from Detroit that, of course, soon has them knee-deep in a lucrative - and deadly - drugs operation. It's the unorthodox nature of Murphy's character and the paradox with the posh culture of his new surroundings that gives the star a chance to be exactly that here. The writing provides him with quick-fire dialogue and the two foils work well in being the butt of the gags and, as the relationships develop along fairly predictable lines, the whole thing marries the comedic, the slapstick and some pyrotechnics with just enough sophistication to keep it from being cringeworthy. Of course there's no doubt that the guys will get their man - a rather hammy Steven Berkoff, but the manner in which this is all pursued is funny and entertaining. Keep an eye to for the disdainful Stephen Elliott as "Chief Hubbard" whose disbelief in just what's going on under his nose raises a smile, as does Bronson Pinchot's "Serge". It's got quite a memorable soundtrack - even if I hated "Axel F", and is good fun!
182	Earth Angel And The Nuclear DeLorean.\r\n\r\nIt's 1984 and director Robert Zemeckis, fresh from the success of Romancing The Stone, is trying to film Back To the Future - a film about a young teenager called Marty McFly who is accidentally sent back in time to 1955 and inadvertently risks the future of his family. Zemeckis is troubled by his leading man, Eric Stoltz, who just isn't capturing the youthful teenager exuberance that he wants for Marty McFly. Stoltz is jettisoned and in comes Michael J. Fox who was busy wowing audiences in the hugely popular sit-com Family Ties. Fox had been first choice anyway but couldn't get a release slot from shooting with Family Ties. Luckily the wasted time with Stoltz created an opening for Fox to play Marty McFly as well as work on the show - the result of which would turn out to be one of the most beloved fantasy trilogies of the modern era.\r\n\r\nIt's honestly hard to find anyone who seriously doesn't like Back To The Future part one. The second one has its critics, because, lets face it, it's a bridge between two better films, while the third film loses some people because of its Western themed plot (the heathens that they are). Yet really this trilogy opener is as near perfect cinema for all the family as you could wish to view. It's a water tight script from Zemeckis and Bob Gale that not only encompasses witty time travel paradoxes, but also dares to be dramatic into the bargain. The first 15 minutes contains a real shocker that is as cheeky as it bold, something that really gives Marty's 1955 quest a real urgency that the audience can buy into as the comedy relief then comes in spades. The set pieces are first rate - hello skateboard - hello rock "n" roll 101, and the makers have fun in winking towards other notable sci-fi pictures along the way. Hell they even manage to deal in an Oedipal strand that is tasteful, handled superbly and garners guffaws aplenty. No mean feat that last one actually. Alan Silvestri provides a whirring & pleasing score and the theme song, The Power Of Love, by Huey Lewis & The News, is infectiously enjoyable. Finally it's the cast that seal the deal for why this is as good as it gets for fantasy escapist cinema. Fox, Christopher Lloyd, Lea Thompson, Thomas F. Wilson & Crispin Glover are the perfect quintet, each feeding off each other and doing justice to the excellently constructed story.\r\n\r\nMade for $19 million, Back To The Future went on to make a worldwide gross of over $381 million, and those are the kind of figures you really can't argue with. It's snappy, happy and down right funny, so really, if you don't like Back To The Future then seek medical help immediately. 10/10
183	"Robert Zemeckis remains the beating heart of modern science-fiction films"\r\n\r\nThe first time I have ever redacted a critic was down in 2015, since then, I learned how impressive productions could change lives and start movements throughout the world. Back To The Future represents one of those films, such a powerful, inspirational, comical, heartwarming, and innovative one. Probably, McFly and Doc Brown proffer the best duo-interaction I have ever beheld in an 80s film (which, happily, could end up being top-notch of all time). There are almost no blunders to be found because the flick essentially represents an instant classic of cinematic history as if to say, pure perfection. From this moment on, you might be thinking about the reason of having assessed the film as absolute perfection score.\r\n\r\nFirst and foremost, we discuss relating to breaking formulas and experiencing new paths, in other words, means opening new cinematic genres and improving them, that is to say, films which leave a significant legacy. Back To The Future follows the proper steps to provide that brand-new feature we were all hoping. Secondly, we balance the film's highest moments and ordinary moments with humour, some 50's nostalgia, some drama and (even) some action moments which results in a win-win the film provides a mixture of genres carefully well-managed and accurately-needed. Third, if the goal is the production of an instant classic, we will need to focus on the cast, because they are the ones who will perform during the whole film, they embody the heroes and villains; therefore, they become fundamental. Michael J. Fox and Christopher Lloyd are the film's core, as excellent as Vince Vaughn-Owen Wilson's 2005 Wedding Crashers, I daresay. \r\n\r\nFinally, but not least, the soundtrack and the environment, in spite of ending up being complementary, provides not only a trusting reality but an opportunity to show the audience the plot's main incidents. During the display, we will notice the most recurrent spots are the 80's and 50's at school, at traditional coffee shops and the streets, not forgetting the excellent pop-culture references introduced.\r\n\r\nThe audience ought to congratulate Robert Zemeckis' mind and, also, the crucial support of his staff (one of whom was Steve Spielberg) owing to this masterpiece. The montage is proof that everyone who has an incredible imagination is capable of creating chef-d'oeuvres, delivering the audience such an extraordinary time. What is more exhilarating is the fact that then-president Ronald Reagan loved the film to the point that he used famous BTTF quotes, for example, during his 1986 State of Union Adress. What an achievement ladies and gentlemen!\r\n\r\n(90/100)
150	It's Bayhem time again.\r\n\r\nAn asteroid the size of Texas is heading towards Earth, the consequence if it hits is a global killer, the end of mankind. In spite of the billions invested in the space programme, NASA has no answers other than the notion that the asteroid will need to be nuked, from the inside. Enter Harry Stamper and his rough and rugged crew of deep core drillers. Can NASA get these men up on the asteroid and do the job? The fate of mankind rests with a bunch of odd balls!\r\n\r\nPerhaps because I have a particular kink for the disaster picture, I find it hard to understand the hate for Armageddon. I am after all a man who gleefully defends The Towering Inferno et al with staunch defiance. Armageddon does exactly what was expected from it, ridiculous high octane entertainment with laughs, peril and obligatory chest thumping bravado. All of course cloaked in director Michael Bay's gleeful insistence on blowing things up with devilish panache. Sure there are some twee moments, sure there is some less than great acting on show, but you know what? It's a disaster picture for Michael Bay's crying out loud sake! Check the brain at the door, turn the sound and colour systems up, enjoy the effects on offer and singalong to Aeromith's smashing, "I Don't Want To Miss A Thing".\r\n\r\nArmageddon, does exactly what it says on the cover, don't take it so serious folks. 8/10
151	Good watch, might watch again, and can recommend.\r\n\r\nThis has a great premise and stacked cast which is incredibly well balanced not only between the "diggers", but the control crew and the astronauts as well.  While they take that opportunity use the characters to really build the world, the story really just boils down to "meteor going to kill earth" and "guy and girl connection, but girl's daddy doesn't like".  Surprisingly the latter takes up a significant amount of time in the movie, but everyone gets their moment in the spotlight.  Steve Buscemi definitely has some of the most memorable moments in the movie.\r\n\r\nThis is the first movie I can think of that has this sort of detail of space travel, let alone tried to simulate the hellish landscape of an asteroid.  It really feels like they put the production value into not only to making the movie look good but getting the details right.\r\n\r\nThis is a "I laughed, I cried" sort of movie, and while I don't think it does any one thing especially well, it definitely delivers a solidly good experience.
152	This starts off quite entertaingly as "Stamper" (Bruce Willis) discovers that his daughter "Grace" (Liv Tyler) has been having a romance with one of his employees "AJ" (Ben Affleck) and so chases him around a drilling establishment taking pot shots at him with a shotgun. Sadly, though, this silliness is soon replaced by a greater one as we discover a great meteor is heading our way and "Stamper" and his team might be the only hope for mankind. Egged on by "Truman" (Billy Bob Thornton) they must quickly learn to be astronauts, then by way of a Russian space station, head into space to plant a gazillion ton nuclear bomb on the thing so it will split up and harmlessly pass us by. This is probably Willis at the top of his game, lively and mischievous and Affleck was at his most eye-catching, but the rest of this just just fits nicely into the well trodden sphere of sci-fi disaster movie. The visual effects are fine, but the dialogue is pretty pedestrian and the ending has a cheesy sentimentality to it that made my eyes roll. It is far, far too long. We spend at least an hour faffing about on the preamble, establishing the characters and when finally lift off comes, I was not entirely convinced the meteor wasn't welcome. There is quite a fun contribution from cosmonaut "Andropov" (Peter Stormare) who knows just how to fix high-spec technology, but otherwise this is all just a rather colourful vehicle for the star that is enjoyable enough, eventually, but really nothing to phone home about.
153	**Armageddon might not be as good as I think, but it’s definitely not as bad as many say.**\r\n\r\nI know I’m an extreme to love this movie as much as I do, but I can’t help it! I know it’s filled with scientific inaccuracies (I’m ok with that. I don’t watch Michael Bay movies for the science). I know it has some cliche parts and cheesy lines, but it all just works. The casting director for this movie needs a trophy because every character has the perfect actor portraying them. From Stomare’s crazy cosmonaut to Fitchner’s by-the-book commander, along with Affleck, Duncan, Tyler, Wilson, Thornton, and more - this cast is stacked! Bruce Willis is the perfect choice for a grizzled oil driller that could save the world. The result is a cast of characters you care for, are scared for, root for, and almost mourn for. Michael Bay’s explosive directing and love for special effects guys this outlandish plot perfectly. And the soundtrack! Liv’s father, Steven Tyler, and Aerosmith provide an iconic soundtrack with songs like Sweet Emotion, Come Together, and I Don’t Wanna Miss a Thing. The cast, music, effects, camaraderie, and epic heroism make this movie one of my all-time favorites!
154	Directed by Michael Bay, co-written by J.J. Abrams and starring Bruce Willis just being Bruce Willis while he saves the world from a giant asteroid with a proper bunch of misfits and some oil drilling equipment. I'm in!
155	Another end of the world movie. Not really action more drama then anything. It's an unlikely team that saves the world.
156	**_First, there was "2001: A Space Odyssey," and then..._**\r\n\r\n..."Armageddon."\r\n\r\nLol, okay maybe it suffers from too much modern blockbuster syndrome, but I couldn't help thinking that 1998's "Armageddon" was the 1990's "2001: A Space Odyssey." I visualize the sci-fi progression something like this:\r\n\r\n1968: "2001: A Space Odyssey"\r\n\r\n1979: "Star Trek: The Motion Picture" (which towers alone in the Trek franchise -- a profoundly spiritual TRIUMPH)\r\n\r\n1986: "Aliens"\r\n\r\n1998: "Armageddon"\r\n\r\nSome might object that I omitted "Star Wars: Episode IV - A New Hope" (1977), but it really doesn't fit the list. Don't get me wrong, it's good for what it is, a space fantasy, but it's just too kid-oriented to be relevant to adult-oriented sci-fi.\r\n\r\nIn any case, I hated "Armageddon" when I first saw it and never cared to see it again. My dislike was a combination of the whole "blockbuster" syndrome with its fast-editing to please those with ADHD approach and, believe it or not, Roger Ebert's scathing denouncement, which illustrates the power of words.\r\n\r\nWell I decided to give it another chance. Wow, was I entertained! Despite my dislike of fast-editing techniques, the story pulled me in right away and held me to the end. Yeah, some of the melodrama is too much, like Willis' scene with his daughter (Liv Tyler) near the end (rolling my eyes), but the filmmakers actually put some depth into the story and it mixes well with the action and humor. Their best move was to focus on character so that we knew and identified (with) the many individuals before the last hour's non-stop suspense & action kicked-in.\r\n\r\nSpeaking of the humor, there are some laugh-out-loud lines, like the one on not paying taxes, ever.\r\n\r\nFurthermore, the star-studded cast is great and I especially appreciated the inclusion of Keith David and Michael Clarke Duncan (RIP).\r\n\r\nThe film is rather long at 2 hours and 31 minutes (the DC adds two additional minutes), but the story maintains your attention and the suspense, action and F/X are literally senses-shattering.\r\n\r\nSo, yeah, it's a shameless, over-the-top "blockbuster," but it tries so hard to entertain that you can't help but respect it. Besides, in addition to the disasters, action and humor, there's some actual depth to the characters and story. Take, for instance, Willis' character stumbling upon Affleck and Tyler during an intimate moment where Affleck literally covers her with kisses while she just eats it up. Willis stops, looks, and reconsiders his stubborn position. Then you know why he does what he does at the end.\r\n\r\nGRADE: B+/A-
157	Entertaining enough sequel isn't as sharp as the original and some parts felt like Murphy's stand-up routine, and while the plot itself was weak, did enjoy the on-screen friendships between Murphy, Reinhold and Ashton. **3.5/5**
158	Well I suppose a sequel to the 1984 success was inevitable, and to be fair Tony Scott has managed to re-assemble the cast from the first film and recruit Jürgen Prochnow ("Dent") to adopt the Steven Berkoff role as baddie-in-chief. The rest of this is pretty much a straight copy of the original as Eddie Murphy's "Foley" reunites with "Ashton" (John Taggart) and "Rosewood" (Judge Reinhold) to get to the bottom of an assassination attempt on their beloved "Bogomil" (Ronny Cox) after he had been suspended for failing to make inroads into the media-dominating "alphabet crimes". What now ensues is really a vehicle for the star and his quick-mouth. The others continue to deliver well as foils for his antics, though this time they are more active participants and less unwilling victims! The plot is thin, but that doesn't matter - Prochnow offers just about enough menace and there are still plenty of perilous scenarios for them to, obviously, get trapped into and then escape from! It clearly isn't as fresh now, the characters are regurgitating themselves to some extent, but as sequels go this one retains much of the character and joie de vivre of the fish-out-of-water aspects that worked well before. It's not great, but it's an easy and entertaining film to watch.
159	An acquired taste. For me, someone who has no knowledge of computer programming and the sort, it's a very slow, tedious and boring watch.\r\n\r\n<em>'Tron'</em>, unfortunately, didn't take my interest whatsoever. Not helped by the poor special effects (they get a pass due to it being an 1982 release; though I'm not convinced it's good either way) and forgettable cast performances, it's not a premise that's easy to get into if you have no prior understanding of coding etc.\r\n\r\nThere is some intrigue in there, but not nearly enough to satisfy my viewing pleasure - it felt like a much longer run time than 96 minutes, that's for sure. All cool if you love this, but I very much didn't. Hopefully the 2010 sequel gives the concept a major boost.
160	I saw this again yesterday - it's 40 years old! I didn't see it at the time, I was one of those kids who hadn't the slightest interest in "Space Invaders" nor did I ever have an Atari, but I do recall the fuss that was being made about Disney's first foray into the world of the emerging computer games market. Actually, the story is not so terrible. It's pretty derivative, with a quite handsome, young, 501-clad Jeff Bridges ("Flynn") out to avenge himself on the evil "Dillinger" (David Warner) who pinched some of his gaming ideas and subsequently rose through the company. Thing is, though, "Dillinger" has now designed a "Master Control Programme" (Think "Forbin Project" from 1970) and when "Flynn" tries to break into this system, he is reduced to a player in a game of survival where he encounters fellow rebels "Tron", "Ram" and "Lora". Adventures ensue as they must try to destroy this "MCP" before it bores of industrial aspirations, and sets it's sights on the Pentagon and the Kremlin. By any modern day standard, the graphics are linear and static - but there is no doubt that they were groundbreaking and quickly-paced for 1982. The use of light - blue and red for good and evil; the slightly over-exposed imagery to try and create the feeling of an alternative digital environment works well enough and though there isn't the slightest amount of jeopardy as to the ending, it's actually quite an entertaining 90-odd minutes that reminded me that every oak tree starts with an acorn. The attempts to incorporate technical or gaming language into the dialogue are a bit contrived, but there is a fun sequence with a "bit" that can only say yes and no as "Flynn" drives his wonky thing ("Max" from "The Black Hole" (1979), anyone?) through the maze of circuitry. Warner is not very convincing, it has to be said - he was rarely much good, I thought - but once it gets going it's an enjoyable piece of cinema nostalgia that looked quite reasonable on a big screen.
161	**Once avant-garde and innovative, this film feels archaic and old as an arcade game, and has an absolutely miserable script.**\r\n\r\nI'm not sure what Disney was thinking when they decided to make this film, but I understand the concept and the reasons that led the studio to bet on something like this. In the 1980s, the creation and gradual massification of the computer (a huge box that we see in the movie and which is now primitive compared to the machines we use) generated a “fever” around computing and led to the creation of games that, later, the World Wide Web has taken it to another level. The movie came out when personal computers started to become popular in the US, but here in my country it took about fifteen years to happen. It's extraordinary to think about this, and how quickly things have evolved. I am thirty-two years old, I belong to a generation that still lived its childhood without technologies, but I was a teenager when they started to become something more visible in our lives. So I can understand why this movie was made, but being a Disney movie, I confess I was expecting better.\r\n\r\nThe film has an uninspired cast made up of third-rate actors. Among all the (almost) anonymous names, only David Warner stands out. The film also has one of the worst dramatic interpretations of Jeff Bridges' life. He was still young here, but the film's material and style didn't help him do a satisfying job. In fact, I blame the screenwriters for most of the film's problems, as they weren't able to come up with a decent story that would justify the feature film. The story that the film brings us is based on the journey of a human being inside the computer, where he will basically have to play and beat opponents. This is very little and it bores us quickly. It seems like a mere excuse for the studio to make an experiment in the field of CGI and the application of technology in cinema.\r\n\r\nWhere the film really bets heavily is on the visuals, heavily stylized and inspired by two obvious elements: the integrated circuits used in engineering and the colorful and (now) somewhat forgotten neon lights. In those late 1980s, neon was something that drew attention in the urban landscape, and there was no street or square where, at dusk, dozens of neon signs did not light up. It's something that has virtually disappeared in the last decade, but that gave the city a certain life. I confess that I felt some nostalgia when feeling the aesthetic influences of all that, but I recognize that the film tried to do something far ahead of its time: the Hollywood Academy itself refused to nominate this film for an Oscar because it considered that CGI was a form of cheating. And perhaps also because they did so early, the resources used were so rudimentary (even though they were the best there was) that they gave the film an extremely heavy and dated look, which aged very poorly. The same can be said of the sound effects and even that soundtrack, so dominated by the synthesizer.
162	Gladiator has been my most favorite film of all time. It is an epic masterpiece in many ways and it really explains why despite the numerous viewings, Gladiator still amuses me with its powerful imageries and many other crucial aspects so that it won five Academy Awards. This film is very well written, the well-ensemble casts, the A-class acting (especially Russell Crowe and Joaquin Phoenix), the stunning cinematography and definitely a strong character of Maximus (magnificently portrayed by Russell Crowe) whose life, struggle, disappointment and anger really move the audience, as if the world attention centers on him. Gladiator is not a historical film, because it only used the history of the ancient Roman Empire merely as the time setting.\r\nAll other aspects namely those gorgeous shots, the great storyline/plot, the fantastic cinematography, the vividly lavish colors, detailed production design and digital imaging (that successfully rebuilt the stunning beauty of the ancient Roman Empire) and all sell really well, making the 170 minute-long running time definitely worthwhile. The visual of great battle in the first 15 minutes really stole my heart. The gruesome pictures, the blood and violence just to beautiful to abandon. Everything in this movie seems perfectly balanced, Ridley Scott as the film director really did his homework well in redefining and revitalizing the big battle sequence once considered masterpiece from Spartacus and Ben Hur. In the end, once again, I would say that Gladiator perfectly combines some crucial elements such as good, moving story, dazzling visual, beautiful scenery, filming techniques, direction and touching music score into one harmonious, action-packed film about heroism and its true meaning.
163	They said you were a giant. They said you can crush a man's skull with one hand.\r\n\r\nRidley Scott's Gladiator is not a perfect film, I would think that the hardiest of fans, of which I'm firmly one, know this deep down. Yet just like Commodus in the film is keen to point out that he himself has other virtues that are worthy, so does Gladiator the film. Enough in fact to make it an everlasting favourite of genre fans and worthy of the Academy Award acknowledgements it received.\r\n\r\nIn narrative terms the plot and story arc is simplicity supreme, something Scott and Russell Crowe have never shied away from. There has to my knowledge as well, never been a denial of the debt Gladiator owes to Anthony Mann's 1964 Epic, The Fall of the Roman Empire. Some folk seem very irritated by this, which is strange because the makers of Gladiator were not standing up bold as brass to proclaim they were unique with their movie, what they did do was reinvigorate a stagnant genre of film for a new generational audience. And it bloody worked, the influence and interest in all things Roman or historically swashbuckling of film that followed post Gladiator's success is there for all to see.\r\n\r\nWhat we do in life echoes in eternity.\r\n\r\nSo no originality in story, then. While some of the CGI is hardly "Grade A" stuff, and there's a little over - mugging acting in support ranks as some of the cast struggle to grasp the period setting required, yet the way Gladiator can make the emotionally committed feel, actually overrides film making irks. Crowe's Maximus is the man men want to be and the man women want to be with. As he runs through the gamut of life's pains and emotionally fortified trials and tribulations, we are with him every step of the way, urging him towards his day of revenge splattered destiny - with Crowe superb in every pained frame, winning the Academy Award for Best Actor that he should have won for The Insider the previous year.\r\n\r\nBacking Crowe up is Joaquin Phoenix giving Commodus preening villainy and Connie Nielsen graceful as Lucilla (pitch Nielsen's turn here against that of Diane Kruger's in Troy to see the class difference for historical period playing). Oliver Reed, leaving the mortal coil but leaving behind a spicy two fold performance as Proximo the Gladiator task master. Olly superb in both body and CGI soul. Richard Harris tugging the heart strings, Derek Jacobi classy, David Hemmings also, while Djimon Hounso gives Juba - Maximus right hand man and confidante - a level of character gravitas that's inspiring.\r\n\r\nI didn't know man could build such things.\r\n\r\nDialogue is literate and poetic, resplendent with iconic speeches. Action is never far away, but never at the expense of wrought human characterisations. The flaming arrows and blood letting of the Germania conflict kicks things off with pulse raising clarity, and Scott and his team never sag from this standard. The gladiator arena fights are edge of the seat inducing, the recreation for the Battle of Carthage a stunning piece of action sequence construction. And then the finale, the culmination of two men's destinies, no soft soaping from Scott and Crowe, it lands in the heart with a resounding thunderclap. A great swords and sandals movie that tipped its helmet to past masters whilst simultaneously bringing the genre alive again. Bravo Maximus Decimus Meridius. 10/10
164	Ridley Scott's Gladiator is a real masterpiece of its genre. With its unique battle scenes, cinematography, acting and directing. It's a real must-watch. Shame on you if you haven't watched this movie!
165	This has got just about everything from "Spartacus" (1960) to "Decline and Fall of the Roman Empire" (1964) via a bit of "Quo Vadis" (1951) to it - and Ridley Scott has managed to create a magnificent spectacle of a film. Russell Crowe is the eponymous soldier "Maximus". Commander of the Armies of the Rhine for Emperor Marcus Aurelius (Richard Harris) and his designated successor - until, that is, the emperor's son "Commodus" (Joaquin Phoenix) and his sister "Lucilla" (an efficient Connie Nielsen) arrive and suddenly it's all change at the top. Betrayed and left for dead, our hero must now make other shifts if he is to survive in his new world - controlled by slave-owning "Proximo" (Oliver Reed) and deliver him of vengeance on his new Imperial nemesis. The film looks great, the cast - including some some strong supporting efforts from Sir Derek Jacobi, John Shrapnel, Djimon Hounsou and Tomas Arana all contribute well to this grandeur of this historical saga. The high politics, betrayal and duplicity are matched with a sense of integrity and camaraderie as "Maximus" begins to galvanise his colleagues and his political allies into something more than a disparate band fighting just to survive each day. Reed and Harris both feature only sparingly, but both add a richness to the characterisations that are dominated by two on-form performances from Crowe and Phoenix that epitomise a struggle of good versus evil and ultimate power in an empire where corruption and brutality trade human life as if it were a watermelon. Add to this some superb visual effects and a rousing score from Hans Zimmer (and Lisa Gerrard) and we have a compelling watch on a big screen that shows there is still a glimmer of the Cecil B. De Mille spirit left in Hollywood.
166	"Gladiator," directed by Ridley Scott and released in 2000, is undeniably one of the best movies ever made. A cinematic masterpiece that effortlessly blends action, drama, and history, this film leaves an indelible mark on all who watch it.\r\n\r\nAt the heart of "Gladiator" are the remarkable performances by Russell Crowe and Joaquin Phoenix. Crowe's portrayal of Maximus Decimus Meridius is nothing short of breathtaking. His stoic determination, unwavering loyalty, and charismatic presence make him the perfect embodiment of a hero. Joaquin Phoenix, on the other hand, delivers a chillingly convincing performance as the treacherous Commodus. His portrayal of the power-hungry and morally bankrupt emperor is both mesmerizing and repulsive, showcasing his exceptional acting prowess.\r\n\r\nWhat sets "Gladiator" apart from other films is its ability to evoke genuine emotions. The story of Maximus, a loyal general who seeks revenge for the murder of his family and the betrayal of his emperor, touches the very core of our humanity. The film explores themes of honor, justice, and the indomitable spirit of the human soul, making it a truly timeless narrative.\r\n\r\nI would rewatch it anytime and recommend it to anyone. It's a solid 10/10, truly an amazing masterpiece.
167	This film got my attention right away because of the references to 2 of my fave old Hollywood films : All About Eve and Streetcar Named Desire. Melodramatic with a lil comedy. My fave scene when all 4 ladies were at the couch just chatting and laughing. I love all the characters (maybe not Nina). Agrado…for the win! Penelope…what a beautiful nun, so sad about her situation though. Huma, at first kinda off (as she didn’t give the autograph to the son) but as the movie went on, I liked her character more and more. And Cecilia, very empowering. At first, the other characters were supposed to be helping the mother but in the end, she was the one who helped all of them, in a way. Feel good dramatic film.
172	The very entertaining ending makes this film.\r\n\r\nI wasn't sure about <em>'Lock, Stock and Two Smoking Barrels'</em> up until that point. Like, don't get me wrong, it is a good film from the get-go but I wasn't personally convinced by it to be more than that until the credits rolled - at which point, I found myself to have been thoroughly entertained.\r\n\r\nWith Guy Ritchie in his directing debut and a whole host of familiar British faces, it isn't a difficult film to get into. I did feel at some points that there were too many characters and that they weren't distinctive enough; there were momentary bits where I had to think a tad harder at which characters were linked with each other. However, that actually turns into the film's best thing at the end as it does come together brilliantly.\r\n\r\nAll in all, this 1998 gangster flick is something I'd consider as very good and worthy of watching.
173	HOW TO MAKE A FEMALE ASSASSIN. TRAUMA, TRAINING THEN GET HER EXTRA ANGRY.  NATILIE PORTMANS FIRST ASSASSIN ROLE AND HOPEFULLY NOT HER LAST.  WE NEED A PART 2 TO THIS MOVIE.
174	This films stars a 12-year old Natalie Portman as Mathilda, a girl living with her abusive stepfather, a step-sister, mother, and four-year old brother. She doesn’t care for any of these people except her brother. One day, she returns home from getting the groceries to find corrupt DEA agents have killed her entire family. Key amongst those agents is Stansfield, played by Gary Oldman. Seeking refuge in the flat of a neighbour she had befriended earlier, Léon (Jean Reno), she learns that he is a hitman. She makes a deal with him: she will look after the flat by doing the domestic chores if he will teach her how to get revenge on the men who killed her brother.\r\n\r\nStrange though the synopsis may be, the relationship between Léon and Mathilda is kept innocent, and the scenes between the two are believable. Mathilda’s sexual awareness is at a nascent stage and her exposure to the sordid side of life with her recently deceased family (her step-father worked for drug-dealers) means she is perhaps not as innocent as most 12-year old girls; however, Léon is unwilling to take advantage of the situation. This means the story can focus on the platonic relationship between the two, the bond that develops between them, and how each affects the other’s life.\r\n\r\nAlthough it may seem a little far-fetched that a young girl would accompany a hitman during his work, Léon ensures that her assistance is required only on fairly routine hits that follow a well-defined pattern. For the more complex hits he leaves her behind.\r\n\r\nThere is a thread of humour running through the film, but you must bear in mind the film is framed in the world of corruption and greed and all is not sweet and light, and graphic violence is depicted.\r\n\r\nJean Reno is wonderful as the extremely good but placid hitman, whose whole outlook on life is changed by the young Mathilda, played wonderfully by Natalie Portman in her first film. I’ve not read it, but I understand that Eppie has a similar effect on Silas Marner, as described in the book of the same name. I found Gary Oldman’s performance histrionic, the only let-down in the film, albeit not something that spoilt the film as a whole.\r\n\r\nRecommended.
175	A real feel-good mov... yeah, maybe not!\r\n\r\n<em>'Open Hearts'</em> is actually a film that doesn't really evoke many thoughts in my head. It's a solid watch, the story is standout and the acting is more than satisfactory. Apart from that, I don't have much elese to say, to be honest.\r\n\r\nSonja Richter and Mads Mikkelsen are very good together in this, as are Paprika Steen and Nikolaj Lie Kaas in fairness. The whole plot that they are all involved in is rather depressing, the relationship between Richter's Cecilie and Mikkelsen's Joachim is uncomforting to see unfold. Stine Bjerregaard's character is annoyingly used (just there to twist the story) but the Bjerregaard herself does do well.\r\n\r\nI will say that I didn't overly like the editing/camera work, though that's pretty much only early on as it becomes less noticeable as the film ticks by. That's the only real negative that I have.
176	**Social outcast with a mohawk goes nutzoid**\r\n\r\nPorn obsessed loner, Travis Bickle, is a cabbie in New York. The story tells of his gradual descent into madness brought on by his inability to relate to those around him and a feeling of a lack of worth. Travis is essentially invisible - of no importance. Walton's self imposed isolation preferable to getting along with the scum around him. One day he decides to change all of that and become _a somebody_ by murdering a politician.\r\n\r\nThis _nobody_ with the superiority complex has gone off the rails, for certain and it can only lead to bloodshed. A lot of it will be his own.
177	Taxi Driver has had many things said about it, and I don't wish to add to all that but it is the yardstick I measure all other films by, it is by far my favourite of all the films I have ever watched.\r\n\r\nIt's brutal honesty and use of themes such as paranoia, mental health issues, and society degradation make it a film that has been imitated, and referenced since its opening in cinemas back in 1976.\r\n\r\nRobert De Niro puts in a tour-de-force performance as Travis Bickle, a Vietnam War veteran with symptoms of PTSD and paranoia, who becomes a New York City taxi driver because of his inability to sleep. Travis is one who is at odds with society, fed up with pimps, prostitutes, drug dealers, and all the other scum of the earth, he slowly works himself in his sleep deprived and drugged state to become a one man army ready to kill anyone he believes to be part of the problem.\r\n\r\nHis interactions with other cabbies, Betsy (Shepherd) a Presidential Candidate campaign worker, Iris a teenage prostitute (Foster), and her Pimp “Sport” (Keitel) fuels his destructive mission to rid New York City of its problems. His attempt at normalcy with Betsy, by taking her on date to a movie that disagrees with her sensibilities ends in disaster, mostly due to Travis’ supposed naivety about what is considered appropriate and tasteful entertainment.\r\n\r\nWhile plying his nightly trade as a NYC cabbie, he has some unusual encounters, including a fare from a fairly psychotically jealous man showing Travis the place where the man’s wife is cheating on him, and then a short encounter with Iris who gets in his cab, and then forced out by Sport, who throws Travis a dirty crumpled up twenty dollar note for the trouble, Travis then makes it his mission to rescue Iris from her situation while also making a menace of himself to the visiting Presidential candidate.\r\n\r\nThis film is still relevant in these times, as social media, and other such technological & society advancements have brought about a new degradation of values, with many wanting their fifteen minutes of fame by any means necessary, which now brings with it many who sell their souls to attain notoriety.\r\n\r\nI love De Niro's performance as Travis, its one that has many facets to it, in it is a man who is angry, naive, sleep deprived, lonely, a sociopath, and a killer.\r\n\r\nA scene in the Presidential campaign office where he is rebuffed by Betsy due to the terrible date experience, and ushered, and menaced by the opportunistic & snotty campaign co-worker Tom (Brooks), shows the range of De Niro's performance as he goes from apologetic, and sheepish to angry, and ready to fight. De Niro was nominated for the Best Actor Academy Award for this role.\r\n\r\nThe presentation on blu-ray is a solid one, PQ is nice, skin tones not waxy, and the AQ allowing the score, and surrounding noise subtleties to really shine through, it's very well handled for a source filmed in the mid 70's
178	Robert De Niro is outstanding in this dark and gritty depiction of former marine "Travis Bickle". He spends his time, alone, driving his cab at night then watching seedy movies during the day. This relentless cycle is broken when he takes a shine to "Betsy" (Cybill Shepherd), a campaign worker for a would be US Presidential candidate. There is a glimmer of hope for him, as she agrees to go out with him for a movie - but when he takes her to his usual haunt for a Swedish film that perhaps wasn't quite Ingmar Bergman, he ends up back at square one. Simultaneously, he takes a more protective interest in the young "iris" (Jodie Foster) - a teenage hooker who is being used abused by her pimp, and to that end he acquires some firearms with which he is perfectly proficient, and so finally starts to see a purpose for his hitherto rather rudderness existence. Director Martin Scorsese and veteran scorer Bernard Hermann have created a wonderfully convincing and evocative scenario emphasising the seediness of a night time New York in which De Niro is able to thrive as few other actors could. He exudes a sense of helplessness but also of decency; he has integrity almost in spite of the indifference of his city, his peers - and by the end, I was firmly in his corner. If you can see it up on a big screen, then do so - it lends a great deal to this wonderfully atmospheric and potent piece of cinema.
179	**_Hellish urban decay and one man’s step-by-step fall into Big City madness_**\r\n\r\nIn the mid-70s, an ex-marine insomniac in New York works the graveyard shift as a cab driver (De Niro) while trying to develop a relationship with a beautiful campaign volunteer for a presidential candidate (Cybill Shepherd and Leonard Harris). He experiences White Knight Syndrome as he seeks to rescue a 12½ years-old prostitute (Jodie Foster). \r\n\r\nWritten by Paul Schrader and directed by Scorsese, "Taxi Driver" (1976) is an interesting character study of a misfit and his descent into radicalness after the day-to-day grind of living amidst the grungy, unsanitary places of an infernal Gotham, especially the grindhouse district. The protagonist is a ‘contradiction,’ loathing the decadence he observes but frequenting porn theaters in his spare time. Then there’s the irony of a potential assassin perceived as a vigilante hero.\r\n\r\nThe notable cast also includes a young Harvey Keitel as the girl’s pimp and Peter Boyle as Travis’ mentor-like fellow cabbie. Albert Brooks in on hand as a protective colleague of the campaign volunteer. Scorsese shows up in a bit part as an unhinged cab passenger.\r\n\r\nIt’s a good companion-piece to similar Schrader flicks, like “Hardcore,” “Cat People,” “Auto Focus” and “Dog Eat Dog.”\r\n\r\nThe film runs 1 hour, 54 minutes, and was shot in Manhattan and Brooklyn.\r\n\r\nGRADE: B+/A-
180	Stupid criminal is stupid and expects his girlfriend to bail him out and fix his problems. We watch 3 different scenarios of her running around trying to come up with money. More stupid stuff happens and she screams to try to make things go her way. Yes, literally screams. Ridiculous
181	**Entertaining**\r\n\r\nA man goes back in time to save his mother - or something like that anyway - I was too entertained to fully grasp what was going on.  Seriously, this film moves so fast that you will find yourself having to try your hardest to keep up with it.\r\n\r\nGreat movie. Great soundtrack. Great performances. A shame that the sequels did not live up to this one. \r\n\r\n- Ian Beale
184	Not sure how many times I've seen this (first time was on VHS ~1986 or 87 I think) but still an incredibly fun sci-fi comedy with Fox and Lloyd working perfectly off one another. Holds up so well each and every time I re-visit. **4.5/5**
185	Everyone who's ever seen this movie loves it. We all wish we could go back in time. I know I do.
186	A quintasential '80s movie. A time-jumping rollercoaster ride everyone will enjoy getting on board.
187	The first time I saw this movie I was 6 or 7 years old and my friend had it on VHS and since then I can't count the number of times I have seen it. Such a fun time travel adventure movie.
188	From about 1996 to about 2009 (roughly ages 4 til 17 for those playing at home), this was my all-time favourite movie. It was the first non-pirated VHS I ever owned, and it probably informed more of my youth than I'm comfortable with admitting. _Predator_ is the sort of movie that somehow both encapsulates and transcends the 1980s, I implore anybody who unlucky enough to never have seen _Predator_ to watch it, just to fulfil the life experience.\r\n\r\nOne of only five movies that I've ever given a 5/5 star rating to.\r\n\r\n_Final rating:★★★★★ – Transcendent entertainment! An all time great._
189	Ball busting Vietnam allegory McTiernan style delivers wholesale. \r\n\r\nI will start this by giving my ratings, yes plural because to me as a sci-fi/action film fan the film has few peers, it is 100% pure suspense testo explosive fun that along side John McTiernan's other action template Die Hard, stands the test of time to the point that it will be thrilling viewers long after we have left this earth. So with that I give it a personal rating of 10/10, it's faultless for my needs in a genre I indulge and lose myself in on a frequent roster. For any other movie fan aware of the genre's traits and peccadilloes without being a fan of sorts, then I rate the film easily at 7 or 8 out of 10, what's not to like here?\r\n\r\nThe film is without a shadow of a doubt another allegory of Vietnam, a crack unit of soldiers are stuck in a central American jungle being killed off by an invisible enemy, the soldiers are there after being lied to by the powers that be, tactics are paramount but the enemy that stalks them holds all the aces. This crack special rescue team are a testosterone fuelled band of beef, Arnold Schwarzenegger, Carl Weathers, Sonny Landham, Bill Duke & Jesse Ventura, these five alone have a combined muscle weight heavy enough to have sunk the Titanic, and McTiernan uses the beefcakes to the max in a series of joyous ball busting sequences.\r\n\r\nThe dialogue is sharp and funny with Schwarzenegger quipping his way thru the first reel, and the score from Alan Silvestri pumps the blood at just the right time, whilst the effects crew have done sterling work to bring this "hardest man in the world versus bad ass alien predator" to life, none more so than when viewing POV heat seeking infa-red shots as our deadly alien killer. The end throws up some interesting thoughts, that have for better or worse? Been fleshed out with further films involving the predator of the title, but one should judge this film as a single entry because it sits at the top of the tree as one of the best of it's kind; so truly this is a benchmark for the genre that will take some beating as far as I'm concerned.\r\n\r\nEnjoy 10/10
190	_**Schwarzenegger vs. "the demon who makes trophies of man" in the Latin American jungles**_ \r\n\r\nAn elite squad of commandos is enlisted for a mission to the jungles of Central America to rescue some VIPs after their helicopter is downed. They soon discover that they are hunted by some kind of predator… not of this world. Arnold Schwarzenegger and Carl Weathers star.\r\n\r\n“Predator” (1987) mixes jungle action with otherworldly sci-fi for satisfying adventure/horror. The macho cast is superb, counterbalanced by Elpidia Carrillo as Anna. The flick’s iconic and uber-“cool” with exceptional jungle locations and cinematography, as well as F/X that hold up. Unfortunately, there’s little depth. It’s enjoyable as a popcorn movie, but also forgettable. Catch “Apocalypse Now” (1979) for the real deal in jungle adventure/horror.    \r\n\r\nThe film runs 1 hour, 47 minutes and was shot in southern Mexico. \r\n\r\nGRADE: B-/B
191	It takes it's time to get going, this film - but once it does, it's amongst the best cat and mouse action adventures I've ever seen. Carl Weathers "Dillon" convinces his former commando mate "Dutch" (Arnold Schwarzenegger) to join him on a perilous rescue mission deep in the jungle. Once there they find themselves the prey of someone, something, that has ninja skills to die for - and, well, they do! Slowly and brutally picked off one by one, it becomes the ultimate battle for survival. This is my favourite from John McTiernan. He manages to use well, the claustrophobic environment; the heat-sensitive camera work is effective and the ascending sense of menace as these hardened men gradually realise that they are out of their depth is gripping. It builds tensely to a denouement that even has a degree of honour to it. Nope, of course the writing is never going to win a Pulitzer, nor is the acting offering us interestingly nuanced or delicate performances. It's just an out-and-out adventure film with a fair degree of horror, a slice of grown up/black humour and I quite enjoyed it.
192	**Overall : Predator’s mastery of suspense and action cements it as one of the most iconic alien thrillers of all time.**\r\n\r\nPredator takes typical 80s action and mixes in Jaws-style horror to create one of the greatest creature features ever made. Arnold Schwarzenegger matches wits with the ultimate alien hunter along with his team of highly trained but in-over-their-heads mercenaries. As the body count rises, so does the improbability that anyone will make it out alive. John McTiernan raises the bar of action movies by delivering one of the best sci-fi thrillers filled with suspense, fear, action, gore, and one of the most iconic creatures in cinematic history.
193	In the quiet words of the Virgin Mary... come again?\r\n\r\nSnatch seems to be one of those spunky British gangster films that critics are divided on, yet it's loved by the target audience. Guy Ritchie has done a Sam Raimi, he has remade the first film that put him on the cinematic map. Where Raimi remade The Evil Dead, and just called it Evil Dead II, Ritchie cheekily tries to get away with remaking Lock, Stock and Two Smoking Barrels and calling it Snatch. Sure the circumstances in plotting are different, and there's a big American star brought in to beef things up for the global market, but it's the same movie and without doubt it's lazy film making. But it still - like Evil Dead II - Rocks!\r\n\r\nSnatch in story terms is concerned with a big diamond that stitches together a number of threads involving the London underworld. Some rough and tough Romany types join in the fun, headed by a purposely illegible Brad Pitt, while Dennis Farina, Benicio Del Toro and Rade Serbedzija add more cosmopolitan meat to the crooks and gangster stew. The British cement holding the building up comes in the twin forms of Jason Statham and Stephen Graham, with Vinnie Jones once again turning up to frighten the masses. Everything from bare knuckle fighting to bumbled robberies - to dog fighting and shifty arcade empires - are here, with Ritchie writing characterisations that positively boom off of the screen. \r\n\r\nAs with "Lock-Stock", the beauty is in the way violence and humour are deftly blended. Scenes are often bloody but also bloody funny, a pearl of dialogue is never far away from a perilous situation. The comic tone is more close to the knuckle here, Ritchie having fun toying with ethnic and machismo stereotypes, while he brings his bag of visual tricks before it got boring. The narrative is deliciously complex, but much credit to Ritchie for the way he pulls all the threads neatly together in a whirl of scene splicing and cocky literary assuredness.\r\n\r\nSo it's "Lock-Stock 2" then! No bad thing if you happen to be a fan of that sort of wide boy malarkey. If you don't like it? Then jog on sunshine. 8/10
\.


--
-- Name: actor_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actor_actor_id_seq', 322, true);


--
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 138, true);


--
-- Name: director_director_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.director_director_id_seq', 125, true);


--
-- Name: genre_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_genre_id_seq', 264, true);


--
-- Name: keyword_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.keyword_keyword_id_seq', 2032, true);


--
-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.language_language_id_seq', 198, true);


--
-- Name: movie_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_movie_id_seq', 107, true);


--
-- Name: review_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_review_id_seq', 193, true);


--
-- Name: actor actor_actor_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_actor_name_key UNIQUE (actor_name);


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);


--
-- Name: country country_country_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_country_code_key UNIQUE (country_code);


--
-- Name: country country_country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_country_name_key UNIQUE (country_name);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: director director_director_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_director_name_key UNIQUE (director_name);


--
-- Name: director director_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_pkey PRIMARY KEY (director_id);


--
-- Name: genre genre_genre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_genre_key UNIQUE (genre);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- Name: keyword keyword_keyword_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyword
    ADD CONSTRAINT keyword_keyword_key UNIQUE (keyword);


--
-- Name: keyword keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyword
    ADD CONSTRAINT keyword_pkey PRIMARY KEY (keyword_id);


--
-- Name: language language_language_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_language_code_key UNIQUE (language_code);


--
-- Name: language language_language_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_language_name_key UNIQUE (language_name);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


--
-- Name: movie_actor movie_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_pkey PRIMARY KEY (movie_id, actor_id);


--
-- Name: movie_country movie_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_country
    ADD CONSTRAINT movie_country_pkey PRIMARY KEY (movie_id, country_id);


--
-- Name: movie_director movie_director_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_pkey PRIMARY KEY (movie_id, director_id);


--
-- Name: movie_genre movie_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_pkey PRIMARY KEY (movie_id, genre_id);


--
-- Name: movie movie_imdb_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_imdb_id_key UNIQUE (imdb_id);


--
-- Name: movie_keyword movie_keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_keyword
    ADD CONSTRAINT movie_keyword_pkey PRIMARY KEY (movie_id, keyword_id);


--
-- Name: movie_language movie_language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_language
    ADD CONSTRAINT movie_language_pkey PRIMARY KEY (movie_id, language_id);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (movie_id);


--
-- Name: movie_review movie_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_review
    ADD CONSTRAINT movie_review_pkey PRIMARY KEY (movie_id, review_id);


--
-- Name: movie movie_tmdb_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_tmdb_id_key UNIQUE (tmdb_id);


--
-- Name: movie movie_watchmode_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_watchmode_id_key UNIQUE (watchmode_id);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (review_id);


--
-- Name: movie_actor movie_actor_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actor(actor_id);


--
-- Name: movie_actor movie_actor_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- Name: movie_country movie_country_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_country
    ADD CONSTRAINT movie_country_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: movie_country movie_country_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_country
    ADD CONSTRAINT movie_country_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- Name: movie_director movie_director_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.director(director_id);


--
-- Name: movie_director movie_director_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- Name: movie_genre movie_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id);


--
-- Name: movie_genre movie_genre_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- Name: movie_keyword movie_keyword_keyword_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_keyword
    ADD CONSTRAINT movie_keyword_keyword_id_fkey FOREIGN KEY (keyword_id) REFERENCES public.keyword(keyword_id);


--
-- Name: movie_keyword movie_keyword_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_keyword
    ADD CONSTRAINT movie_keyword_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- Name: movie_language movie_language_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_language
    ADD CONSTRAINT movie_language_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(language_id);


--
-- Name: movie_language movie_language_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_language
    ADD CONSTRAINT movie_language_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- Name: movie_review movie_review_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_review
    ADD CONSTRAINT movie_review_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- Name: movie_review movie_review_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_review
    ADD CONSTRAINT movie_review_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.review(review_id);


--
-- PostgreSQL database dump complete
--

