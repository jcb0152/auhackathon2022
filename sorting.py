import json
num_ranks = 6
rank_list = [0,0,0,6,5,4,3,2,1]

def sort(data, ranks):
    scores = []
    for i in range(len(data)):
        score = 0
        for j in range(1, len(data[i])):
            try:
                score += int(data[i][j]) * int(ranks[j])
            except:
                continue
        scores.append(list((data[i][0], score)))
    return sorted(scores, key = lambda x: x[1], reverse = True)

if __name__ == "__main__":
    filename = "dataset/final_data.json"
    data= {}
    with open(filename, "r") as in_file:
        data = json.load(in_file)
        
    scores = [num_ranks - x for x in reversed(range(num_ranks + 1))]
    ranks = [scores[x] for x in rank_list]

    sorted_data = {}
    for cat in list(data.keys()):
        sorted_data[cat] = sort(data[cat], ranks)[:5]

    print(sorted_data)
        
