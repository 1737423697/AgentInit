import os
import json

def compute_writing_score(data):
    scores = []
    for item in data:
        info = item.get("info", {})
        correct = info.get("correct_count", 0)
        total = info.get("question_count", 1)
        scores.append(correct / total if total else 0)
    return sum(scores) / len(scores) if scores else 0.0

def process_task(task, results_folder, model_order, method_order):
    for model in model_order:
        auto_path = os.path.join(results_folder, f"{task}_{model}_init.jsonl")
        if not os.path.exists(auto_path):
            print(f"Auto method file not found for task {task}, model {model}.")
            continue

        with open(auto_path, "r") as f:
            auto_data = [json.loads(line) for line in f if line.strip()]
        line_limit = len(auto_data)

        scores_table = {}

        for method in method_order:
            file_path = os.path.join(results_folder, f"{task}_{model}_{method}.jsonl")
            if not os.path.exists(file_path):
                scores_table[method] = "--"
                continue

            with open(file_path, "r") as f:
                data = [json.loads(line) for line in f if line.strip()][:line_limit]
            score = compute_writing_score(data)
            scores_table[method] = round(score * 100, 2)

        # 输出表格
        print(f"\n[Task: {task}] Only showing scores computed from first {line_limit} lines (based on 'init'):")
        print("Model     | Method     | Writing Score")
        print("--------------------------------------")
        for method in method_order:
            score = scores_table.get(method, "--")
            print(f"{model:<10} | {method:<10} | {score}")

def main(results_folder="results"):
    model_order = ["deepseek"]
    method_order = ["direct", "cot", "refine", "spp", "autoagents","evoagent", "init"]
    for task in ["writing", "writing_10"]:
        process_task(task, results_folder, model_order, method_order)

if __name__ == "__main__":
    main()
