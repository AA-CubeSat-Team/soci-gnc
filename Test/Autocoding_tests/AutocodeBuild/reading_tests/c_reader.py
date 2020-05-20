import os
import sys

DEBUG = True
#some DEBUG stuff to be nice to the user
if len(sys.argv) > 1:
	if sys.argv[1] == "-d" or sys.argv[1] == "d":
		DEBUG = True
	else:
		print("use -d Flag for debug")

#Important information about your input
line_count = 0
var_sizes = []
var_count = 0
var_names = []
var_type = []

print("~~~~~~~~~~~~~~~~~~~~")
print(" Reading input.txt  ")
print("~~~~~~~~~~~~~~~~~~~~")

#First Lets pull infor out of the text file. I'm splitting this into stages to make it easier to read. 
with open("input.txt","r") as input_file:
	for line in input_file:
		for word in line.split(','):
			if word != "\n":

				if line_count == 0 :
					var_count = int(word)

				if line_count == 1 :
					#print(word)
					var_names.append(word)

				if line_count == 2 :
					#print(word)
					var_sizes.append(int(word))
				if line_count == 3 :
					var_type.append(word)

		line_count = line_count + 1

trials = line_count - 4

input_file.close()

print("- -")
print("Info Obtained From Input.txt: ")
print("----------------------------")
if DEBUG:
	print("Line count: " + str(line_count))
	print("Variable Count: " + str(var_count))
	print("Variable Names: " + str(var_names))
	print("Variable Size: " + str(var_sizes))
	print("Number of Trials: " + str(trials))
	print("Variable Types: " + str(var_type))

print("~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" Creating Variable Lines ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~")

values_per_line = sum(var_sizes)
print(values_per_line)

# Line to be added to ert_main.c
parse_line = "fscanf(fp,\""

# add in all the %<vartype> to the parseline
for k in range(0,var_count):
	for i in range(0,var_sizes[k]):
		if var_type[k] == "float":
			parse_line = parse_line + "%f,"

		if var_type[k] == "int":
			parse_line = parse_line + "%d,"

		if var_type[k] == "double":
			parse_line = parse_line + "%lf,"
	# parse_line 


# Just fucking remove that last comma cuz lazy
parse_line = parse_line[:-1]

# add all the assigned vars
parse_line = parse_line + "\""

for k in range(0,var_count):
	for i in range(0,var_sizes[k]):
		if(var_sizes[k] > 1):
			parse_line = parse_line + ", &rt_U."+ var_names[k] +"[" + str(i) + "]"
		else:
			parse_line = parse_line + ", &rt_U."+ var_names[k] 
	# These lines can do some "better" formatting
	# parse_line = parse_line + "\n"
	# parse_line = parse_line + "		"

parse_line = parse_line + ");\n"

print("the parse line is: ")
print(parse_line)


print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" Adding Variable Population to ert_main.c  ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

backup_in = open("bert_main.c", "r")
lines = backup_in.readlines()

new_file = open("ert_main.c", "w")

for line in lines:
	new_file.write(line)
	if "   RTU rt_U;" in line:
		print("Adding Code")
		new_file.write("\n")
		new_file.write("	char buffer[1024];\n")
		new_file.write("	int num_trials = " + str(trials) + ";\n")
		new_file.write("	FILE * fp; \n")
		new_file.write("	fp = fopen (\"input.txt\", \"r\");\n")
		new_file.write("	fscanf(fp, \"%s\", buffer);\n")
		new_file.write("	fscanf(fp, \"%s\", buffer);\n")
		new_file.write("	fscanf(fp, \"%s\", buffer);\n")
		new_file.write("	fscanf(fp, \"%s\", buffer);\n")
		new_file.write("	// This Line will pull in variables from text file \n")
		new_file.write("	" + parse_line)



new_file.close()





