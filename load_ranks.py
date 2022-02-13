filename = "ranks.txt"
rank_list = []

with open(filename, "r") as in_file:
    rank_list = in_file.readline()

rank_list = (rank_list[1:-1].split(", "))[3:]

order = ["Calories", "Protein", "Carbohydrates", "Fiber", "Fat", "Saturated Fat"]
values = {}
for i in range(len(rank_list)):
    values[rank_list[i]] = order[i]

for i in reversed(range(1,len(rank_list)+1)):
    print(values[str(i)])
