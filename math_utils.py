from scipy import spatial

import numpy as np 
import math


def get_cosine_sim(a, b):
	return 1 - spatial.distance.cosine(a,b)

def correlate(a, b):
	return np.corrcoef(a, b)[0][1]


def levenshtein(s, t):
		if s == t: return 0
		elif len(s) == 0: return len(t)
		elif len(t) == 0: return len(s)
		v0 = [None] * (len(t) + 1)
		v1 = [None] * (len(t) + 1)
		for i in range(len(v0)):
			v0[i] = i
		for i in range(len(s)):
			v1[0] = i + 1
			for j in range(len(t)):
				cost = 0 if s[i] == t[j] else 1
				v1[j + 1] = min(v1[j] + 1, v0[j + 1] + 1, v0[j] + cost)
			for j in range(len(v0)):
				v0[j] = v1[j]

		return v1[len(t)]

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