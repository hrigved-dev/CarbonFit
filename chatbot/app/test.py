import requests
from requests.models import Response

abcd=requests.post("http://127.0.0.1:5000/question")

print(abcd)



