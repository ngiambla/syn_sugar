import arxivscraper.arxivscraper as ax
import category_fetcher as cat_fetch


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
def parse_categories(cat_range):
    result = set()
    for part in cat_range.split(','):
        x = part.split('-')
        result.update(range(int(x[0]), int(x[-1]) + 1))
    return sorted(result)

def check_categories(cat_range, categories):
    try:
        cat_range = int(cat_range)
        print("-----")
        if int(cat_range) < 0: 
            return False

        if int(cat_range) > len(categories)-1:
            return False
    except ValueError:
        for part in cat_range.split(','):
            x = part.split('-')
            if len(x) > 1:
                if int(x[-1]) > len(categories)-1:
                    return False
            else:
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
            print("Year must be >= 2017 to support Electrical Engineering and System Science and Economics.")
        return False

    # checking if month is cool.. - since sept since eess and econ have only been around since this year
    if not(int(date_fmt[1]) >= min_month and int(date_fmt[1]) <= 12):          
        if adjust_date_range==1:
            print("Month must be >= 9 to support Electrical Engineering and System Science and Economics.")
        return False

    #checking of day is cool.
    if not(int(date_fmt[2]) >= 1 and int(date_fmt[2]) <= 31):
        return False

    return True

def main():

    starting_date       = ""
    ending_date         = ""
    categories          = ""
    sub_categories      = ""
    
    scraper             = None
    
    cats                = {} 
    sub_cats            = {}
    adjust_date_range   = False
    sub_cat_selected    = False


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

    cat_lst=cat_fetch.get_categories()

    cats = cat_lst[0]
    sub_cats = cat_lst[1]

    print("Available Categories:")
    for cat in cats:
        print(str(cat)+": "+str(cats[cat]))
    print("\n")

    while not check_categories(categories, cats): 
        categories=raw_input("Enter a valid range of categories from list abve: i.e., 0-5, 7: ")

    categories=parse_categories(categories)


    if 6 in categories or 7 in categories:
        adjust_date_range=True
    if len(categories) == 1:
        temp_cat = categories[0]
        sub_idx = 0
        for subs in sub_cats[cats[temp_cat]]:
            print("+-- ["+str(sub_idx)+"]: "+str(subs))
            sub_idx = sub_idx+1
        if len(sub_cats[cats[temp_cat]]) > 0:
            print("Select a Subcategory: ")
            while not check_categories(sub_categories, sub_cats[cats[temp_cat]]):
                sub_categories=raw_input("Enter a valid range of subcategories from list abve: i.e., 0-5, 7: ")



    while not check_date(starting_date, adjust_date_range):
        starting_date=raw_input("Enter starting date in the format YYYY-MM-DD: ")

    while not check_date(ending_date, adjust_date_range):
        ending_date=raw_input("Enter ending date in the format YYYY-MM-DD: ")
    
    raw_input("~~INFO:\n-[CTRL + c] exits.\n-Press [return] to Process.")

    for category in categories:
        if len(sub_categories) > 0: 
            sub_dict={
                "categories":list()
            }
            for subs in sub_categories:
                subs=int(subs)
                sub_dict["categories"].append(sub_cats[cats[category]][subs])
            scraper = ax.Scraper(category=cats[category], date_from=str(starting_date),date_until=str(ending_date), filters=sub_dict)
        else:    
            scraper = ax.Scraper(category=cats[category], date_from=str(starting_date),date_until=str(ending_date))

        documents = scraper.scrape()
        print("Found "+ str(len(documents)) + " documents.")

        for doc in range(len(documents)):
            if download_file(documents[doc]['url'], documents[doc]['abstract']) == -1:
                return


if __name__ == "__main__":
    main()
