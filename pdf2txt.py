from pdfminer.pdfinterp import PDFResourceManager, PDFPageInterpreter
from pdfminer.pdfpage import PDFPage
from pdfminer.converter import TextConverter, PDFPageAggregator
from pdfminer.layout import LAParams, LTTextBoxHorizontal, LTTextBox
from pdfminer.pdfparser import PDFParser
from pdfminer.pdfdocument import PDFDocument

from cStringIO import StringIO


def convert(pdfname):

	# PDFMiner boilerplate
	rsrcmgr 	= PDFResourceManager()
	sio 		= StringIO()
	codec 		= 'utf8'
	laparams 	= LAParams()
	device 		= TextConverter(rsrcmgr, sio, codec=codec, laparams=laparams)
	interpreter = PDFPageInterpreter(rsrcmgr, device)
	caching 	= True
	pagenos		= set()

	fp = file(pdfname, 'rb')

	parser = PDFParser(fp)
	# Create a PDF document object that stores the document structure.
	# Supply the password for initialization.
	document = PDFDocument(parser, '')
	rsrcmgr = PDFResourceManager()
	# Create a PDF device object.
	laparams = LAParams()
	device = PDFPageAggregator(rsrcmgr, laparams=laparams)
	# Create a PDF interpreter object.
	interpreter = PDFPageInterpreter(rsrcmgr, device)
	# Process each page contained in the document.
	text_from_pdf = open(pdfname.rsplit('.', 1)[0]+".txt",'w+')
	for page in PDFPage.create_pages(document):
		interpreter.process_page(page)
		layout = device.get_result()
		for element in layout:
			if isinstance(element, LTTextBox):
				out = ''.join([i if ord(i) < 128 else ' ' for i in element.get_text()])
				text_from_pdf.write(out)
