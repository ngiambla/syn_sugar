import arxivscraper.arxivscraper as ax
import urllib2
scraper = ax.Scraper(category='physics:cond-mat', date_from='2017-05-27',date_until='2017-06-07')

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
