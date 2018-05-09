from bs4 import BeautifulSoup


def parse_xml(xml_file):
    file_handler = open(xml_file).read()
    doc = BeautifulSoup(file_handler, "xml")
    catchphrases = doc.find_all('catchphrase')
    sentences = doc.find_all('sentence')

    catchphrase_soln = open(xml_file.replace("xdocs", "solns").rsplit('.', 1)[0]+'.txt', 'w')
    sentence_soln = open(xml_file.replace("xdocs", "docs").rsplit('.', 1)[0]+'.txt', 'w')
    
    for catchphrase in catchphrases:
        try:
            catchphrase_soln.write(unicode(catchphrase.text).split(">", 1)[-1]+'\n')
        except Exception as e:
            pass          
    for sentence in sentences:
        try:
            sentence_soln.write(unicode(sentence.text)+'\n')
        except Exception as e:
            pass
            
    catchphrase_soln.close()
    sentence_soln.close()
