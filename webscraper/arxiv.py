import arxivscraper.arxivscraper as ax

import os
import glob
import urllib2
import datetime
import argparse

from pprint import pprint

SUCCESS = 1
QUIT    = -1

def download_file(page_url, abstract):
    try:
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
        return SUCCESS
    except KeyboardInterrupt:
        print("Exiting...")
        return QUIT


# Parse user range based on input
# i.e., 1-5, 7, 8 will give categories 1-5, 7 and 8
def parse_categories(cat_range, categories):
    result = set()
    for part in cat_range.split(','):
        x = part.split('-')
        result.update(range(int(x[0]), int(x[-1]) + 1))
    print("[!] Going to collect documents from")
    for item in result:
            print("  [+] "+categories[item])
    return sorted(result)

def check_categories(cat_range, categories):
    if len(cat_range) < 1: # add support for non-integer input
        return False

    if len(cat_range) > len(categories)-1:
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
    
    cats = {
        0 : 'Physics',  
        1 : 'Mathematics', 
        2 : 'Computer Science', 
        3 : 'Quantitative Biology', 
        4 : 'Quantitative Finance', 
        5 : 'Statistics', 
        6 : 'Electrical Engineering and System Science', 
        7 : 'Economics'
        }


    print("[WEBSCRAPE]: Would you like to begin with a fresh dataset? [Y/n]")
    ans = ""
    while ans.upper() != "Y" and ans.upper() != "N": 
        ans=raw_input("? ")
    if ans.upper() == "Y":
        for file in glob.glob("docs/*"):
            os.remove(file)
        for file in glob.glob("solns/*"):
            os.remove(file)
        print("[INFO] Clean.\n")

    print("Available Categories:")
    for cat in cats:
        print(str(cat)+": "+str(cats[cat]))
    print("\n")

    while not check_categories(categories, cats): 

        categories=raw_input("Enter a valid range of categories from list abve: i.e., 0-5, 7: ")

    categories=parse_categories(categories, cats)
    adjust_date_range=False

    if 6 or 7 in categories:
        adjust_date_range=True
    

    while not check_date(starting_date, adjust_date_range):
        starting_date=raw_input("Enter starting date in the format YYYY-MM-DD: ")

    while not check_date(ending_date, adjust_date_range):
        ending_date=raw_input("Enter ending date in the format YYYY-MM-DD: ")
    
    
    raw_input("~~INFO:\n-[CTRL + c] exits.\n-Press [return] to Process.")
    for category in range(len(categories)):
        scraper = ax.Scraper(category=categories[category], date_from=str(starting_date),date_until=str(ending_date))

        documents = scraper.scrape()
        print("Found "+ str(len(documents)) + " documents.")

        for doc in range(len(documents)):
            if download_file(documents[doc]['url'], documents[doc]['abstract']) == -1:
                return


if __name__ == "__main__":
    main()
