from nltk.corpus import wordnet, stopwords
from rouge import Rouge

def convert(summary):
	new_summ=""
	summary = summary.replace("-", " ")
	_summary = (summary.lower()).split()
	summary = [word for word in _summary if word not in stopwords.words('english')]
	for word in summary:
		word=''.join(e for e in word if e.isalnum())
		try:
			syns=wordnet.synsets(word)
			if len(syns) > 0:
				new_summ = new_summ + syns[0].lemmas()[0].name() + " "

		except Exception as e:
			print("Skipping... err: "+str(e))
	return new_summ+"\n"



def eval(ref, summ):
	r = Rouge()

	ref 	= convert(ref)
	summ 	= convert(summ)

	scores = r.get_scores([ref], [summ])
	return scores


