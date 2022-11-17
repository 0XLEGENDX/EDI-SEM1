import time
import requests

f = open(r"\data\programreport.txt","r")
k = f.read()
smssent = True
print(k)
while(k=="False"):
    f.close()
    f = open(r"\data\programreport.txt","r")
    k = f.read()
    print(k)
    time.sleep(1)
else:
    time.sleep(1)

    if smssent:

        smssent = False
        url = "https://www.fast2sms.com/dev/bulkV2"

        querystring = {"authorization":"s7QM0kG8zI8dj9UGUDsJ0cm3Y7veZXKvtOWMkUVEliv18vzjecqviGI55uWd","message":"Violence Alert! Location : VIT College Pune, Maharashta.","language":"english","route":"q","numbers":"7219279796"}

        headers = {
        'cache-control': "no-cache"
        }

        #response = requests.request("GET", url, headers=headers, params=querystring)

        #print(response.text)
