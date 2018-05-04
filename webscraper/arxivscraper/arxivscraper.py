"""
A python program to retreive recrods from ArXiv.org in given
categories and specific date range.

Author: Mahdi Sadjadi (sadjadi.seyedmahdi[AT]gmail[DOT]com).
"""
from __future__ import print_function
import xml.etree.ElementTree as ET
import datetime
import time
import sys
PYTHON3 = sys.version_info[0] == 3
if PYTHON3:
    from urllib.parse import urlencode
    from urllib.request import urlopen
    from urllib.error import HTTPError
else:
    from urllib import urlencode
    from urllib2 import HTTPError, urlopen
OAI = '{http://www.openarchives.org/OAI/2.0/}'
ARXIV = '{http://arxiv.org/OAI/arXiv/}'
BASE = 'http://export.arxiv.org/oai2?verb=ListRecords&'

class Record(object):
    """
    A class to hold a single record from ArXiv
    Each records contains the following properties:

    object should be of xml.etree.ElementTree.Element.
    """

    def __init__(self, xml_record):
        """if not isinstance(object,ET.Element):
        raise TypeError("")"""
        self.xml = xml_record
        self.id = self._get_text(ARXIV, 'id')
        self.url = 'https://arxiv.org/abs/' + self.id
        self.title = self._get_text(ARXIV, 'title')
        self.abstract = self._get_text(ARXIV, 'abstract')
        self.cats = self._get_text(ARXIV, 'categories')
        self.created = self._get_text(ARXIV, 'created')
        self.updated = self._get_text(ARXIV, 'updated')
        self.doi = self._get_text(ARXIV, 'doi')
        self.authors = self._get_authors()

    def _get_text(self, namespace, tag):
        """Extracts text from an xml field"""
        try:
            return self.xml.find(namespace + tag).text.strip().lower().replace('\n', '')
        except:
            return ''

    def _get_authors(self):
        authors = self.xml.findall(ARXIV + 'authors/' + ARXIV + 'author')
        authors = [author.find(ARXIV + 'keyname').text.lower() for author in authors]
        return authors

    def output(self):
        d = {'title': self.title,
         'id': self.id,
         'abstract': self.abstract,
         'categories': self.cats,
         'doi': self.doi,
         'created': self.created,
         'updated': self.updated,
         'authors': self.authors,
         'url': self.url}
        return d


class Scraper(object):
    """
    A class to hold info about attributes of scraping,
    such as date range, categories, and number of returned
    records. If `from` is not provided, the first day of
    the current month will be used. If `until` is not provided,
    the current day will be used.

    Paramters
    ---------
    category: str
    The category of scraped records
    data_from: str
    starting date in format 'YYYY-MM-DD'. Updated eprints are included even if
    they were created outside of the given date range. Default: first day of current month.
    date_until: str
    final date in format 'YYYY-MM-DD'. Updated eprints are included even if
    they were created outside of the given date range. Default: today.
    t: int
    Waiting time between subsequent calls to API, triggred by Error 503.
    filter: dictionary
    A dictionary where keys are used to limit the saved results. Possible keys:
    subcats, author, title, abstract. See the example, below.

    Example:
    Returning all eprints from
    """

    def __init__(self, category, date_from=None, date_until=None, t=30, filters={}):
        self.cat = cats[category]
        self.t = t
        DateToday = datetime.date.today()
        if date_from is None:
            self.f = str(DateToday.replace(day=1))
        else:
            self.f = date_from
        if date_until is None:
            self.u = str(DateToday)
        else:
            self.u = date_until
        self.url = BASE + 'from=' + self.f + '&until=' + self.u + '&metadataPrefix=arXiv&set=%s' % self.cat
        self.filters = filters
        if not self.filters:
            self.append_all = True
        else:
            self.append_all = False
            self.keys = filters.keys()

    def scrape(self):
        t0 = time.time()
        url = self.url
        print(url)
        ds = []
        k = 0
        while True:
            k += 1
            print('fetching up to ', 1000 * k, 'records...')
            try:
                response = urlopen(url)
            except HTTPError as e:
                if e.code == 503:
                    to = int(e.hdrs.get('retry-after', 30))
                    print('Got 503. Retrying after {0:d} seconds.'.format(self.t))
                    time.sleep(to)
                    continue
                else:
                    raise

            xml = response.read()
            root = ET.fromstring(xml)
            records = root.findall(OAI + 'ListRecords/' + OAI + 'record')
            for record in records:
                meta = record.find(OAI + 'metadata').find(ARXIV + 'arXiv')
                record = Record(meta).output()
                if self.append_all:
                    ds.append(record)
                else:
                    save_record = False
                    for key in self.keys:
                        for word in self.filters[key]:
                            if word.lower() in record[key]:
                                save_record = True

                    if save_record:
                        ds.append(record)

            token = root.find(OAI + 'ListRecords').find(OAI + 'resumptionToken')
            if token is None or token.text is None or k==5:
                break
            else:
                url = BASE + 'resumptionToken=%s' % token.text

        t1 = time.time()
        print('fetching is completes in {0:.1f} seconds.'.format(t1 - t0))
        return ds


def search_all(df, col, *words):
    """
    Return a sub-DataFrame of those rows whose Name column match all the words.
    source: https://stackoverflow.com/a/22624079/3349443
    """
    return df[np.logical_and.reduce([df[col].str.contains(word) for word in words])]


cats = ['physics','math','cs','q-bio','q-fin','stat','eess','econ']
subcats = {
 'q-fin': ['q-fin.CP', 'q-fin.EC', 'q-fin.GN',
           'q-fin.MF', 'q-fin.PM', 'q-fin.PR', 'q-fin.RM', 'q-fin.ST', 'q-fin.TR'],
 'cs': ['cs.AI','cs.CL','cs.CC','cs.CE','cs.CG','cs.GT','cs.CV','cs.CY','cs.CR','cs.DS',
        'cs.DB','cs.DL','cs.DM','cs.DC','cs.ET','cs.FL','cs.GL','cs.GR','cs.AR','cs.HC',
        'cs.IR','cs.IT','cs.LG','cs.LO','cs.MS','cs.MA','cs.MM','cs.NI','cs.NE','cs.NA', 
        'cs.OS','cs.OH','cs.PF','cs.','cs.PL','cs.RO','cs.SI','cs.SE','cs.SD','cs.SC', 'cs.SY'],
 'physics': ['physics.acc-ph', 'physics.app-ph', 'physics.ao-ph',
             'physics.atom-ph', 'physics.atm-clus', 'physics.bio-ph', 'physics.chem-ph',
             'physics.class-ph', 'physics.comp-ph', 'physics.data-an', 'physics.flu-dyn',
             'physics.gen-ph', 'physics.geo-ph', 'physics.hist-ph', 'physics.ins-det',
             'physics.med-ph', 'physics.optics', 'physics.ed-ph', 'physics.soc-ph',
             'physics.plasm-ph', 'physics.pop-ph', 'physics.space-ph'],
 'math': ['math.AG', 'math.AT', 'math.AP', 'math.CT', 'math.CA', 'math.CO',
          'math.AC', 'math.CV', 'math.DG', 'math.DS', 'math.FA', 'math.GM', 'math.GN',
          'math.GT', 'math.GR', 'math.HO', 'math.IT', 'math.KT', 'math.LO', 'math.MP',
          'math.MG', 'math.NT', 'math.NA', 'math.OA', 'math.OC', 'math.PR', 'math.QA',
          'math.RT', 'math.RA', 'math.SP', 'math.ST', 'math.SG'],
 'q-bio': ['q-bio.BM','q-bio.CB', 'q-bio.GN', 'q-bio.MN', 'q-bio.NC',
            'q-bio.OT', 'q-bio.PE', 'q-bio.QM','q-bio.SC', 'q-bio.TO'],
 'eess':['eess.AS','eess.IV','eess.SP'],
 'econ':['econ.EM'],
 'stat': ['stat.AP', 'stat.CO', 'stat.ML',
          'stat.ME', 'stat.OT', 'stat.TH']
 }
