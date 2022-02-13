import json
filename = "ranks.json"
ranks = {}

with open(filename, "r") as in_file:
    ranks = json.load(in_file)

print("Choose saved plan")
plans = list(ranks.keys())
print(plans)
name = plans[0]

rank_list = ranks[name][3:]

order = ["Calories", "Protein", "Carbohydrates", "Fiber", "Fat", "Saturated Fat"]
values = {}

for i in range(len(rank_list)):
    values[rank_list[i]] = order[i]

for i in reversed(range(1,len(rank_list)+1)):
    print(values[i])
