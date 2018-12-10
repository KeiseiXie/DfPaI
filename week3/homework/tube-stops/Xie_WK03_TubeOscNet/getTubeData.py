import json
import urllib.request

from pythonosc import udp_client

# my computer
ip, port = '127.0.0.1', 12000

client = udp_client.SimpleUDPClient(ip, port)

data = urllib.request.urlopen("http://fezz.in/whg/projects/data/tube-stops.json").read()
output = json.loads(data)


# create key list
keys =[]
# json.load
for key in output.keys():

    lat = output[key]['lat']
    lon = output[key]['lon']


    loc = [lat,lon]
    # send to processing
    client.send_message("/lat", loc)
