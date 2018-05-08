from bs4 import BeautifulSoup


def parse_xml(xml_file):
    file_handler = open(xml_file).read()
    doc = BeautifulSoup(file_handler, "xml")
    catchphrases = doc.find_all('catchphrase')
    sentences = doc.find_all('sentence')
    catchphrase_soln = open('xml_files/solns/'+xml_file+'_soln.txt', 'w')
    sentence_soln = open('xml_files/docs/'+xml_file+'.txt', 'w')
    for catchphrase in catchphrases:
         catchphrase_soln.write(catchphrase.text.split(">", 1)[-1]+'\n')
        
    for sentence in sentences:
        sentence_soln.write(sentence.text+'\n')
