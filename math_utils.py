from __future__ import division
from scipy import spatial

import numpy as np 
import math


def get_cosine_sim(a, b):

	while len(a) < len(b):
		a.append(0)
	while len(b) < len(a):
		b.append(0)

	return 1 - spatial.distance.cosine(a,b)


def sigmoid(val, shift=0):
	return ( 1 / (1+math.exp(-0.5*(val-shift)) ) )


def hamming_distance(s1, s2):
	if len(s1) != len(s2):
		raise ValueError("Undefined for sequences of unequal length")
	return sum(el1 != el2 for el1, el2 in zip(s1, s2))


def entropy(vec):
	h=0
	for v in vec:
		h=h+(v)*math.log(v,2)
	h=h*(-1)
	return h


def jaccard_index(ap, bp):
	a=set(ap)
	b=set(bp)
	r_int=a.intersection(b)
	r_uni=a.union(b)
	
	return len(r_int)/len(r_uni)
