import os
import glob
import re
from collections import defaultdict

def parse_files(directory):
    questions_by_domain = defaultdict(list)
    
    file_pattern = os.path.join(directory, "raw", "test*.md")
    for filepath in sorted(glob.glob(file_pattern)):
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
            
        blocks = re.split(r'Question\s+\d+\n(?:Skipped|Incorrect|Correct|Unanswered)\n', content)
        
        for block in blocks[1:]:
            lines = block.strip().split('\n')
            
            q_text = ""
            idx = 0
            while idx < len(lines):
                if lines[idx].startswith("Correct answer") or lines[idx].startswith("Correct selection") or lines[idx].startswith("Your selection is incorrect") or (idx + 1 < len(lines) and lines[idx+1] == "Explanation"):
                    break
                q_text += lines[idx] + "\n"
                idx += 1
                
            options = []
            while idx < len(lines):
                is_correct = False
                if lines[idx].startswith("Correct answer") or lines[idx].startswith("Correct selection"):
                    is_correct = True
                    idx += 1
                elif lines[idx].startswith("Your selection is incorrect"):
                    is_correct = False
                    idx += 1
                
                if idx >= len(lines) or lines[idx].startswith("Overall explanation"):
                    break
                    
                opt_text = lines[idx]
                idx += 1
                
                exp_text = ""
                if idx < len(lines) and lines[idx] == "Explanation":
                    idx += 1
                    while idx < len(lines) and not lines[idx].startswith("Correct answer") and not lines[idx].startswith("Correct selection") and not lines[idx].startswith("Your selection is incorrect") and not lines[idx].startswith("Overall explanation") and not (idx + 1 < len(lines) and lines[idx+1] == "Explanation"):
                        exp_text += lines[idx] + "\n"
                        idx += 1
                
                options.append({"text": opt_text.strip(), "is_correct": is_correct, "explanation": exp_text.strip()})
                
            overall_exp = ""
            if idx < len(lines) and lines[idx].startswith("Overall explanation"):
                idx += 1
                while idx < len(lines) and not lines[idx].startswith("Domain"):
                    overall_exp += lines[idx] + "\n"
                    idx += 1
                    
            domain = "Embedded C" # Default domain since tests might not have one
            if idx < len(lines) and lines[idx].startswith("Domain"):
                idx += 1
                if idx < len(lines):
                    domain = lines[idx].strip()
            
            q_text = q_text.strip()
            overall_exp = overall_exp.strip()
            
            questions_by_domain[domain].append({
                "text": q_text,
                "options": options,
                "overall": overall_exp,
                "domain": domain
            })
            
    return questions_by_domain

def generate_markdown(questions_by_domain, output_file):
    with open(output_file, 'w', encoding='utf-8') as f:
        domains_sorted = sorted(questions_by_domain.keys())
        
        seq_id = 1
        for domain in domains_sorted:
            for q in questions_by_domain[domain]:
                q["seq_id"] = seq_id
                seq_id += 1
                
        # Section 1: Questions
        for domain in domains_sorted:
            for q in questions_by_domain[domain]:
                f.write(f"## Question {q['seq_id']}\n\n")
                f.write("::: questionbox\n\n")
                f.write(f"{q['text']} [***{q['domain']}***] ([Check Answer](#question-{q['seq_id']}-explanation))\n\n")
                f.write(":::\n\n")
                
                for i, opt in enumerate(q["options"]):
                    f.write(f"{i+1}. {opt['text']}\n\n")
        
        # Section 2: Explanations
        f.write("# Explanations & Answers\n\n")
        for domain in domains_sorted:
            for q in questions_by_domain[domain]:
                f.write(f"### Question {q['seq_id']} Explanation\n\n")
                
                correct_options = [opt for opt in q["options"] if opt["is_correct"]]
                
                f.write("::: correctbox\n\n")
                if len(correct_options) == 1:
                    f.write(f"**Correct Answer:** {correct_options[0]['text']}\n\n")
                elif len(correct_options) > 1:
                    f.write("**Correct Answers:**\n")
                    for opt in correct_options:
                        f.write(f"- {opt['text']}\n")
                    f.write("\n")
                f.write(":::\n\n")
                
                f.write("#### [Explanations for all options:]{.underline}\n\n")
                for i, opt in enumerate(q["options"]):
                    correct_label = "[**(Correct)**]{.correct-text}" if opt["is_correct"] else "[**(Incorrect)**]{.incorrect-text}"
                    f.write(f"**Option:** {opt['text']} {correct_label}\n\n")
                    exp_lines = opt['explanation'].split("\n")
                    exp_text = "\n> ".join(exp_lines)
                    f.write(f"> **Explanation:** {exp_text}\n\n")
                
                if q['overall']:
                    f.write("#### [Overall Explanation:]{.underline}\n\n")
                    f.write(f"{q['overall']}\n\n")
                
                f.write(f"[Back to Question](#question-{q['seq_id']})\n\n")

if __name__ == "__main__":
    directory = "/home/mohan/Learning/git/book/book_embedded_c"
    output_file = os.path.join(directory, "01_embedded_c_interview_questions.md")
    
    questions = parse_files(directory)
    generate_markdown(questions, output_file)
    print(f"Generated successfully at {output_file}")
