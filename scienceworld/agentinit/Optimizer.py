import numpy as np
from collections import defaultdict

class Optimizer:
    def __init__(self,  maximize=False):
        self.maximize = maximize  # True for maximization, False for minimization

    def dominates(self, a, b):
        """Check if solution a dominates solution b."""
        a = np.array(a)
        b = np.array(b)
        if self.maximize:
            return np.all(a >= b) and np.any(a > b)
        else:
            return np.all(a <= b) and np.any(a < b)

    def fast_non_dominated_sort(self, objectives):
        S = defaultdict(list)  # Solutions dominated by this solution
        n = np.zeros(len(objectives), dtype=int)  # Number of solutions dominating this one
        rank = np.zeros(len(objectives), dtype=int)  # Pareto front rank
        fronts = [[]]  # Fronts (first front is the Pareto-optimal set)

        for i, a in enumerate(objectives):
            for j, b in enumerate(objectives):
                if i == j:
                    continue
                if self.dominates(a, b):
                    S[i].append(j)  # i dominates j
                elif self.dominates(b, a):
                    n[i] += 1  # j dominates i
            if n[i] == 0:
                rank[i] = 0
                fronts[0].append(i)

        k = 0
        while fronts[k]:
            next_front = []
            for i in fronts[k]:
                for j in S[i]:
                    n[j] -= 1
                    if n[j] == 0:
                        rank[j] = k + 1
                        next_front.append(j)
            k += 1
            fronts.append(next_front)

        return fronts[:-1]  # Last front is empty

 