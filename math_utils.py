


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