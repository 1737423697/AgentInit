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
            # For maximization: a dominates b if a >= b in all objectives and a > b in at least one
            return np.all(a >= b) and np.any(a > b)
        else:
            # For minimization: a dominates b if a <= b in all objectives and a < b in at least one
            return np.all(a <= b) and np.any(a < b)

    def fast_non_dominated_sort(self, objectives):
        S = defaultdict(list)  # Solutions dominated by this solution
        n = np.zeros(len(objectives), dtype=int)  # Number of solutions dominating this one
        rank = np.zeros(len(objectives), dtype=int)  # Pareto front rank
        fronts = [[]]  # Fronts (first front is the Pareto-optimal set)

        # Compute dominance relationships
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

        # Build subsequent fronts
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

    def calculate_crowding_distance(self, front, objectives):
        """Calculate crowding distance for a front (Deb et al., 2002)"""
        num_objs = len(objectives[0])
        distances = np.zeros(len(front))
        
        if len(front) == 0:
            return distances

        # Normalize objectives to [0, 1] for fair comparison
        normalized_objs = np.array([objectives[i] for i in front])
        min_objs = np.min(normalized_objs, axis=0)
        max_objs = np.max(normalized_objs, axis=0)
        range_objs = max_objs - min_objs
        range_objs[range_objs == 0] = 1  # Avoid division by zero

        normalized_objs = (normalized_objs - min_objs) / range_objs

        for m in range(num_objs):
            # Sort by objective m
            sorted_indices = np.argsort(normalized_objs[:, m])
            front_sorted = [front[i] for i in sorted_indices]
            
            # Boundary points get infinity distance
            distances[front_sorted[0]] = np.inf
            distances[front_sorted[-1]] = np.inf
            
            # Calculate crowding distance
            for i in range(1, len(front) - 1):
                distances[front_sorted[i]] += (
                    normalized_objs[sorted_indices[i + 1], m] - 
                    normalized_objs[sorted_indices[i - 1], m]
                )

        return distances

    def select_parents(self, fronts, objectives):
        """Select parents using crowding distance and non-dominated sorting."""
        selected = []
        remaining = self.population_size
        
        for front in fronts:
            if len(front) <= remaining:
                selected.extend(front)
                remaining -= len(front)
            else:
                # Select the best `remaining` solutions based on crowding distance
                crowding_distances = self.calculate_crowding_distance(front, objectives)
                ranked_front = sorted(
                    front,
                    key=lambda x: crowding_distances[front.index(x)],
                    reverse=True,
                )
                selected.extend(ranked_front[:remaining])
                break

        return selected

    def optimize(self, objectives):
        """Run NSGA-II optimization."""
        fronts = self.fast_non_dominated_sort(objectives)
        parents = self.select_parents(fronts, objectives)
        # new_population = self.crossover_and_mutate(parents)  # Implement your crossover/mutation
        return new_population