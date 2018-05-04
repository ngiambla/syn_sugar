import arxivscraper.arxivscraper as ax

import urllib2
import datetime
import argparse
from pprint import pprint

def download_file(page_url, abstract):
    filenum         = page_url.split('/')[-1]
    download_url    = 'https://arxiv.org/pdf/'+filenum+'.pdf'
    response        = urllib2.urlopen(download_url)
    file            = open('./docs/'+filenum+".pdf", 'w')
    file.write(response.read())
    file.close()

    file            = open('./solns/'+filenum+'.txt', 'w')
    file.write(abstract)
    file.close()
    
    print("Extracted: "+str(filenum))


# Parse user range based on input
# i.e., 1-5, 7, 8 will give categories 1-5, 7 and 8
def parse_categories(cat_range):
    result = set()
    for part in cat_range.split(','):
        x = part.split('-')
        result.update(range(int(x[0]), int(x[-1]) + 1))
    return sorted(result)

#def parse_sc(categories):
#    sc = defaultdict(categories)
#    for part in range(categories):
#        if part==
#    return sorted(result)

def check_categories(cat_range):
    if len(cat_range) < 1: # add support for non-integer input
        return False

    for part in cat_range.split(','):
        x = part.split('-')
        if int(x[-1]) > 7:
            return False
    return True

def check_date(date, adjust_date_range):
    cur_date    = datetime.datetime.now()
    date_fmt    = date.split("-")
    min_year    = 2003
    min_month   = 1

    if adjust_date_range == True:
        min_year = 2017
        min_month = 9
    
    if len(date_fmt) < 3:
        return False

    # checking if year is cool - 2017 since eess and econ have only been around since this year
    if not(int(date_fmt[0]) >= min_year and int(date_fmt[0]) <= cur_date.year):
        if adjust_date_range==1:
            print "Year must be >= 2017 to support Electrical Engineering and System Science and Economics."
        return False

    # checking if month is cool.. - since sept since eess and econ have only been around since this year
    if not(int(date_fmt[1]) >= min_month and int(date_fmt[1]) <= 12):          
        if adjust_date_range==1:
            print "Month must be >= 9 to support Electrical Engineering and System Science and Economics."
        return False

    #checking of day is cool.
    if not(int(date_fmt[2]) >= 1 and int(date_fmt[2]) <= 31):
        return False

    return True

def main():

    starting_date       = ""
    ending_date         = ""
    categories          = ""
    
    cats = ['Physics',  'Mathematics', 'Computer Science', 'Quantitative Biology', 'Quantitative Finance', 
            'Statistics', 'Electrical Engineering and System Science', 'Economics']

    print("Available Categories:")
    pprint(cats)



    while not check_categories(categories): 
        categories=raw_input("Enter a valid range of categories from list abve: i.e., 0-5, 7: ")
    
    categories=parse_categories(categories)
    adjust_date_range=False

    if 6 or 7 in categories:
        adjust_date_range=True
    

    while not check_date(starting_date, adjust_date_range):
        starting_date=raw_input("Enter starting date in the format YYYY-MM-DD: ")

    while not check_date(ending_date, adjust_date_range):
        ending_date=raw_input("Enter ending date in the format YYYY-MM-DD: ")
    
    
    
    for category in range(len(categories)):
        scraper = ax.Scraper(category=categories[category], date_from=str(starting_date),date_until=str(ending_date))

        documents = scraper.scrape()
        print("Found "+ str(documents) + "documents")

        for doc in range(len(documents)):
            download_file(documents[doc]['url'], documents[doc]['abstract'])


if __name__ == "__main__":
    main()
