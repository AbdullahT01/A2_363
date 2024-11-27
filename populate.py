
#eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Ii4rQC4rIiwibWl4cGFuZWxJZCI6IiRkZXZpY2U6MTkzNjY3MDI5MTI0NTEtMDM1OGNlYjI0ZWI4OTItMWU1MjU2MzYtMWNlMjZhLTE5MzY2NzAyOTEzNDUxIiwibWl4cGFuZWxQcm9qZWN0SWQiOiI0YmZiMjQxNGFiOTczYzc0MWI2ZjA2N2JmMDZkNTU3NSIsIm9yZyI6Ii4qIiwicHViIjoibmVvNGouY29tIiwicmVnIjoiICIsInN1YiI6Im5lbzRqLWRlc2t0b3AiLCJleHAiOjE3NjQyNTg5NTksInZlciI6IioiLCJpc3MiOiJuZW80ai5jb20iLCJuYmYiOjE3MzI3MjI5NTksImlhdCI6MTczMjcyMjk1OSwianRpIjoiN2VZdV9qQUVUIn0.dFxiDGFgjQEff3rc57ysvHrVT-FEVUUuyfRvDpqtKeIKEEDYqumpEurYEtFu24_aGG7ut7ujj7qrQCkE7eURJdBb6W4qSzZt6MW0jnj-mk-JEECgcVCSoqzyPKHpFnZ5vqJJFOL9-WQIInWiFp6zzptvF36WanDrteOAOhiGqYLKiRpp5nNQkFgNvqqCTDSOFa-waoNHn59ymxtu-WkkPFqIWFQpriDUIbGodrhedCmDz-jsirPm8UsEiJ9sy2W6TheQq1dbvO7zYiHxthVg_-3GYodKrCtHuWHIy60Hdgrk3gvDc3WD8J-fV1x8Rzfbq5eC2_hQAC7u1cc0Lz4RnA
from neo4j import GraphDatabase


URI = "bolt://localhost:7687"  
USERNAME = "neo4j"             
PASSWORD = "mac88soen363"     

driver = GraphDatabase.driver(URI, auth=(USERNAME, PASSWORD))

with driver.session() as session:
    result = session.run("RETURN 'Connection successful'").single()[0]
    print(result)

driver.close()