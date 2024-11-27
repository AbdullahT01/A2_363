#n-Gvnjrez63L0TCqkOZYFT3F_UZ_bqtT2KuZ4q41Ckc
#pip install neo4j
#database user : neo4j
#protocol: neo4j+s://
#connection url: a7877bc2.databases.neo4j.io:7687

from neo4j import GraphDatabase


uri = "neo4j+s://19f58327.databases.neo4j.io" 
username = "neo4j"
password = "863ZuHP1Ls2AAqJgCTTNrIHaRrbVdHMBK2MOwgtHzIE"





# Set up authentication credentials
AUTH = (username, password)

# Establish a connection
try:
    driver = GraphDatabase.driver(uri, auth=AUTH, encrypted=True, connection_timeout=60)
    
    # Test connection with a simple query
    with driver.session() as session:
        result = session.run("RETURN 'Hello, Neo4j!'")
        print(result.single()[0])  # Should print 'Hello, Neo4j!'
        
    print("Connection successful")
except Exception as e:
    print(f"Failed to connect: {e}")