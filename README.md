# Syntactic Sugar #

This project is an extractive text summarization system intended for academic papers. It can be tailored for other purposes. 

## Installation ##

To be completed.
(Check what python is screaming about during runtime ... )

## Usage ##

You can either run this algorithm with a `CLI` or as a web version.

### Command Line ###

This program should be very straight forward to use: simply place text inside the `data/` folder, and then in a terminal enter:

```bash
$ python syn_sugar.py

``` 

### Website ###

For convenience, a locally hosted website is included with this software,
You can navigate to `website/` to check it out. We use `flask`, a pythonic microweb framework.
To use:

```bash
$ export FLASK_APP=web_syn.py
$ flask run
```
Then navigate to `localhost:5000` to view what's included.


## Future Work ##

Althought the algorithm and website are 'working', it is not optimized for deployment. If interest picks up, feel free to contact us, and we can modify this software package to be 'deployable'.


## Authors ##

Nicholas V. Giamblanco, MASc Candidate

Ian Taras, MASc Candidate

Dylan Stuart, MASc Candidate

@ The University of Toronto
