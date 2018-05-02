import arxivscraper.arxivscraper as ax
import urllib2


starting_date=raw_input("Enter starting date in the format YYYY-MM-DD: ")
ending_date=raw_input("Enter ending date in the format YYYY-MM-DD: ")
scraper = ax.Scraper(category=14, date_from=str(starting_date),date_until=str(ending_date))

output = scraper.scrape()

def download_file(page_url, abstract):
    filenum = page_url.split('/')[-1]
    download_url = 'https://arxiv.org/pdf/'+filenum+'.pdf'
    response = urllib2.urlopen(download_url)
    file = open('./docs/'+filenum+".pdf", 'w')
    file.write(response.read())
    file.close()
    file = open('./solns/'+filenum+'.txt', 'w')
    file.write(abstract)
    file.close()
    print "Extracted ", filenum

num_docs = len(output)
print 'Found ', num_docs, ' documents'

for i in range(num_docs):
    download_file(output[i]['url'], output[i]['abstract'])
