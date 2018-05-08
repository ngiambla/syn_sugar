from bs4 import BeautifulSoup
import requests


cat_url = 'https://arxiv.org/'
subcat_url = 'https://arxiv.org/archive/'

def return_soup(url):
    url = requests.get(url).content
    soup = BeautifulSoup(url,"html.parser")
    return soup
    
def get_namespace(x):
    name = x.find('a').text
    tag = x.find('b').text
    return name, tag

def convert_to_markdown(*args):
    print (('|'+a for a in args))


def get_categories():
    cat_idx = 0
    main_cat_dict = {}
    sub_cat_lists = {}

    main_page = return_soup(cat_url).find_all('li')            

    print("Fetching Categories...")
    for x in main_page[0:]:
        try:
            xname,xtag = get_namespace(x)
            string = '| ' + xname + ' | `' + xtag + '` | '
            print("*")
            if xtag == "CoRR":
                xtag="cs"
            main_cat_dict[cat_idx]=xtag
            cat_idx = cat_idx + 1
            sub_cat_lists[xtag]=list()

            subcat_page = return_soup(subcat_url + xtag).find_all('ul')[-1].find_all('b')
            for y in subcat_page:
                subs = y.text.split(' - ')
                sub_cat_lists[xtag].append(subs[0])
        except:
            pass

    return [main_cat_dict, sub_cat_lists]