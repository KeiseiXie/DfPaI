import requests
from lxml import etree
import time

urls = [
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_A%E2%80%93B',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_C%E2%80%93F',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_G%E2%80%93K',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_O%E2%80%93Q',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_R%E2%80%93S',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_T%E2%80%93Z',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_L%E2%80%93N'
]

parser = etree.HTMLParser()
# from will examples get url
def get_coords(url):
    res = requests.get(url)

    tree = etree.fromstring(res.text, parser)
    # coords = tree.xpath('//tbody[1]/tr/td[3]/text()')
    coords = tree.xpath('//span[@class="geo"]/text()')
    # //tbody[1]/tr/td[3]/text()
    return coords


# need 2 source data
def get_diameter(url):
    res = requests.get(url)

    tree = etree.fromstring(res.text, parser)
    diameter = tree.xpath('//tbody[1]/tr/td[3]/text()')

    # //tbody[1]/tr/td[3]/text()

    return diameter


all_coords = []
all_diameter= []
for url in urls:
    coords = get_coords(url)
    all_coords += coords
    diameter = get_diameter(url)
    all_diameter += diameter
    #  ^ this is the same as all_coords.extend(coords)

    print('added {} coords'.format(len(coords)))
    print('added {} coords'.format(len(diameter)))

# print('total of {} coords and {} diameter'.format(len(all_coords)，len(all_diameter))

# Save table
i=0
with open('moon_crater_coords_diameters.csv', 'w') as f:
    f.write('lat,lon,dia\n')
    for coord in all_coords:
        diameter = all_diameter[i]
        lat, lon  = coord.split('; ')
        # format
        f.write('{},{},{}\n'.format(lat, lon,diameter))
        i+=1
