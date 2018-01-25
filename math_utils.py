from scipy import spatial

import numpy as np 
import math


def get_cosine_sim(a, b):
	return 1 - spatial.distance.cosine(a,b)

def correlate(a, b):
	return np.corrcoef(a, b)[0][1]

def lev_distance(s_metric_1, s_len_1, s_metric_2, s_len_2):

	cost=0

	if s_len_1 == 0:
		return s_len_1

	if s_len_2 == 0:
		return s_len_2


	if s_metric_1[s_len_1-1] == s_metric_2[s_len_2-1]:
		cost = 0
	else:
		cost = 1

	return min( (lev_distance(s_metric_1, s_len_1-1, s_metric_2, s_len_2) + 1), (lev_distance(s_metric_1, s_len_1, s_metric_2, s_len_2-1) + 1), (lev_distance(s_metric_1, s_len_1-1, s_metric_2, s_len_2-1) + cost) )

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