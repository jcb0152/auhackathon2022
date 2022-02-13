filename = "ranks.txt"
rank_list = [0,0,0,6,5,4,3,2,1] #get from application

with open(filename, "w") as out_file:
    out_file.write(str(rank_list))

