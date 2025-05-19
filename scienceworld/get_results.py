import os
import re

score_dirs = {
    "deepseek": "results/deepseek",
    "auto": "results/deepseek_auto",
    "evo": "results/deepseek_evo",
    "init": "results/deepseek_init",
}

groups = {
    "L": [0,1,9,10,11,14,15,16,21,22,23,24],
    "M": [2,4,12,20,26,27,28,29],
    "S": [3,5,6,7,8,13,17,18,19,25],
}

task_mapping = {
    0: "1-1", 1: "1-4", 2: "6-1", 3: "6-2", 4: "6-3",
    5: "4-4", 6: "4-1", 7: "4-2", 8: "4-3", 9: "1-3",
    10: "5-2", 11: "5-1", 12: "8-1", 13: "8-2", 14: "9-1",
    15: "9-2", 16: "9-3", 17: "7-1", 18: "7-3", 19: "7-2",
    20: "2-2", 21: "2-3", 22: "1-2", 23: "10-1", 24: "10-2",
    25: "3-1", 26: "3-2", 27: "3-3", 28: "3-4", 29: "2-1",
}

def avg(lst):
    return sum(lst) / len(lst) if lst else 0.0

results = {}

for model_name, score_dir in score_dirs.items():
    task_scores = {}
    total_scores = []
    group_scores = {"L": [], "M": [], "S": []}

    for i in range(30):
        filename = os.path.join(score_dir, f"task{i}-score.txt")
        if not os.path.exists(filename):
            print(f"❌ Missing file: {filename}")
            continue

        with open(filename, "r") as f:
            content = f.read()
            match = re.search(r"Average score:\s*([\d\.]+)", content)
            if match:
                score = float(match.group(1))
                task_name = task_mapping.get(i, f"task{i}")
                task_scores[task_name] = {"score": score, "group": None}
                total_scores.append(score)
                for group, indices in groups.items():
                    if i in indices:
                        group_scores[group].append(score)
                        task_scores[task_name]["group"] = group
                        break
            else:
                print(f"⚠️ No average score in: {filename}")

    results[model_name] = {
        "tasks": task_scores,
        "S": avg(group_scores["S"]),
        "M": avg(group_scores["M"]),
        "L": avg(group_scores["L"]),
        "Overall": avg(total_scores)
    }

sorted_task_names = sorted(task_mapping.values(), key=lambda x: tuple(map(int, x.split('-'))))

print("\n📋 Detailed Score Table (per task):\n")
header = f"{'Task':<6}" + "".join(f"{model:>12}" for model in score_dirs.keys())
print(header)
print("-" * len(header))
for task_name in sorted_task_names:
    row = f"{task_name:<6}"
    for model in score_dirs.keys():
        score = results[model]["tasks"].get(task_name, {}).get("score", None)
        row += f"{score:>12.2f}" if score is not None else f"{'N/A':>12}"
    print(row)

print("\n📊 Average Scores Table:\n")
header = f"{'Model':<15}{'Short':>10}{'Medium':>10}{'Long':>10}{'Overall':>10}"
print(header)
print("-" * len(header))
for model, scores in results.items():
    print(f"{model:<15}{scores['S']:>10.2f}{scores['M']:>10.2f}{scores['L']:>10.2f}{scores['Overall']:>10.2f}")
