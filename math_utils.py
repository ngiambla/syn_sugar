from scipy import spatial

import numpy as np 
import math


def get_cosine_sim(a, b):
	return 1 - spatial.distance.cosine(a,b)

def get_tri_area(a,b):
	return 0.5*a*b

def hyp(a, b):
	return (a**2 + b**2)**0.5

def area_sim(a, b):

	
	area1=get_tri_area(a[0], a[1])
	c1=hyp(a[0],a[1])

	area2=get_tri_area(b[0], b[1])
	c2=hyp(b[0],b[1])
	
	for i in range (2, len(a)):
		area1=area1+get_tri_area(c1,a[i])
		c1=hyp(c1,a[i])

		area2=area2+get_tri_area(c1,b[i])
		c2=hyp(c2,b[i])		

	return area1/area2


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