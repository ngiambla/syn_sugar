import arxivscraper.arxivscraper as ax

import urllib2
import datetime


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


def check_date(date):
    cur_date            = datetime.datetime.now()
    date_fmt    = date.split("-")

    if len(date_fmt) < 3:
        return False

    # checking if year is cool.
    if not(int(date_fmt[0]) >= 1900 and int(date_fmt[0]) <= cur_date.year):
        return False

    # checking if month is cool..
    if not(int(date_fmt[1]) >= 1 and int(date_fmt[1]) <= 12):          
        return False

    #checking of day is cool.
    if not(int(date_fmt[2]) >= 1 and int(date_fmt[2]) <= 31):
        return False

    return True

def main():

    starting_date       = ""
    ending_date         = ""

    while not check_date(starting_date):
        starting_date=raw_input("Enter starting date in the format YYYY-MM-DD: ")


    while not check_date(ending_date):
        ending_date=raw_input("Enter ending date in the format YYYY-MM-DD: ")
    
    scraper = ax.Scraper(category=14, date_from=str(starting_date),date_until=str(ending_date))

    documents = scraper.scrape()
    print("Found "+ str(documents) + "documents")

    for doc in range(documents):
        download_file(output[doc]['url'], output[doc]['abstract'])


if __name__ == "__main__":
    main()