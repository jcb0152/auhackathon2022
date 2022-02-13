import json
filename = "ranks.json"
rank_list = [0,0,0,6,5,4,3,2,1] #get from application
name = "Diet"

ranks = {}
with open(filename, "r") as in_file:
    ranks = json.load(in_file)

ranks[name] = rank_list
with open(filename, "w") as out_file:
    json.dump(ranks, out_file)
    

