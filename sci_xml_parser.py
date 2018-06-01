from bs4 import BeautifulSoup, Tag


def parse_sci_xml(sci_xml_file):
    file_handler = open(sci_xml_file).read()
    doc = BeautifulSoup(file_handler, "xml")
    abstract = doc.find_all('A-S')
    sentences = doc.find_all('S')

    abstract_soln = open(sci_xml_file.replace("xdocs", "solns").rsplit('.', 1)[0]+'.txt', 'w')
    sentence_soln = open(sci_xml_file.replace("xdocs", "docs").rsplit('.', 1)[0]+'.txt', 'w')
   
    print "i am inside of this script"
    for a in abstract:
        try:
            if isinstance(a, Tag):
                abstract_soln.write(unicode(''.join(a.strings))+'\n')
                sentence_soln.write(unicode(''.join(a.strings))+'\n')
        except Exception as e:
            pass          
    for sentence in sentences:
        try:
            if isinstance(sentence, Tag):
                sentence_soln.write(unicode(''.join(sentence.strings))+'\n')
        except Exception as e:
            pass
            
    abstract_soln.close()
    sentence_soln.close()
