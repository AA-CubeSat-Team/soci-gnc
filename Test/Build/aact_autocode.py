import os
import sys

DEBUG = True
RUN = True

if len(sys.argv) < 2:
	print("Need the directory name for autocode") 
	print("Can add -d flag for debugging")
	sys.exit()

target = sys.argv[1]
if DEBUG:
	print("Target Folder: " + target)
	print("make sure this matches the function " + target + "_initialize()")

if "-d" in sys.argv:
	DEBUG = True
else:
	DEBUG = False

# move to specified directory
os.chdir("sgp4_lib_fsw0")
# move into main autocoding subdir
os.chdir("main_autocode")

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

if DEBUG:
	print("- -")
	print("Info Obtained From Input.txt: ")
	print("----------------------------")
	print("Line count: " + str(line_count))
	print("Variable Count: " + str(var_count))
	print("Variable Names: " + str(var_names))
	print("Variable Size: " + str(var_sizes))
	print("Number of Trials: " + str(trials))
	print("Variable Types: " + str(var_type))


print("~~~~~~~~~~~~~~~~~~~~")
print(" Reading output.txt  ")
print("~~~~~~~~~~~~~~~~~~~~")
out_count = 0
out_names = []
out_size = []
out_type = []
out_line_count = 0

with open("output.txt","r") as output_file:
	for line in output_file:
		for word in line.split(','):
			if word != "\n":

				if out_line_count == 0 :
					out_count = int(word)

				if out_line_count == 1 :
					#print(word)
					out_names.append(word)

				if out_line_count == 2 :
					#print(word)
					out_size.append(int(word))
				if out_line_count == 3 :
					out_type.append(word)

		out_line_count = out_line_count + 1

out_trials = out_line_count - 4

output_file.close()



if DEBUG:
	print("- -")
	print("Info Obtained From Output.txt: ")
	print("----------------------------")
	print("Line count: " + str(out_line_count))
	print("Variable Count: " + str(out_count))
	print("Variable Names: " + str(out_names))
	print("Variable Size: " + str(out_size))
	print("Variable Types: " + str(out_type))
	print("Number of Trials: " + str(out_trials))


#Now we have to strip the existing ert_main.c so that it works with our autocoder
print("~~~~~~~~~~~~~~~~~~~~")
print("Stripping ert_main.c")
print("~~~~~~~~~~~~~~~~~~~~")

Start_Trigger = target + "_initialize();"
End_Trigger = "return 0;"

a_file = open("ert_main.c", "r")

lines = a_file.readlines()
a_file.close()

strip_Flag = False
#using "sert_main.c so I dont overwrite the origional until things are good"
new_file = open("ert_main.c", "w")
for line in lines:
	if "/* Disable rt_OneStep() here */" in line:
		strip_Flag = False
	if strip_Flag == False:
		new_file.write(line)
	if Start_Trigger in line:
		strip_Flag = True
		new_file.write("\n")
# 
new_file.close()

print("~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" Creating Variable Lines ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~")

# ~~~~~~~~~~~~~~~~~
# INPUT VARIABLES
# ~~~~~~~~~~~~~~~~~
values_per_line = sum(var_sizes)
if DEBUG:
	print("Values per line")
	print(values_per_line)

# Line to be added to ert_main.c
parse_line = "fscanf(fp,\""

# add in all the %<vartype> to the parseline
for k in range(0,var_count):
	for i in range(0,var_sizes[k]):
		if var_type[k] == "float":
			parse_line = parse_line + "%lf,"

		if var_type[k] == "int":
			parse_line = parse_line + "%lf,"

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
			parse_line = parse_line + ", &rtU."+ var_names[k] +"[" + str(i) + "]"
		else:
			parse_line = parse_line + ", &rtU."+ var_names[k] 
	# These lines can do some "better" formatting
	# parse_line = parse_line + "\n"
	# parse_line = parse_line + "		"

parse_line = parse_line + ");\n"

if DEBUG:
	print("the input parse line is: ")
	print(parse_line)

# *    *    *    *   * 

# ~~~~~~~~~~~~~~~~~
# OUTPUT VARIABLES
# ~~~~~~~~~~~~~~~~~
# values_per_line = sum(out_size)
# print(values_per_line)

# # Line to be added to ert_main.c
# parse_line = "fscanf(fp,\""

# # add in all the %<vartype> to the parseline
# for k in range(0,out_count):
# 	for i in range(0,out_size[k]):
# 		if out_type[k] == "float":
# 			parse_line = parse_line + "%lf,"

# 		if out_type[k] == "int":
# 			parse_line = parse_line + "%lf,"

# 		if out_type[k] == "double":
# 			parse_line = parse_line + "%lf,"
# 	# parse_line 


# # Just fucking remove that last comma cuz lazy
# parse_line = parse_line[:-1]

# # add all the assigned vars
# parse_line = parse_line + "\""

# for k in range(0,var_count):
# 	for i in range(0,var_sizes[k]):
# 		if(var_sizes[k] > 1):
# 			parse_line = parse_line + ", &rtTruth."+ var_names[k] +"[" + str(i) + "]"
# 		else:
# 			parse_line = parse_line + ", &rtTruth."+ var_names[k] 
# 	# These lines can do some "better" formatting
# 	# parse_line = parse_line + "\n"
# 	# parse_line = parse_line + "		"

# parse_line = parse_line + ");\n"

# print("the input parse line is: ")
# print(parse_line)


print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" Adding INPUT Code to ert_main.c  ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

write_trigger = target + "_initialize();"

backup_in = open("ert_main.c", "r")
lines = backup_in.readlines()

new_file = open("ert_main.c", "w")

for line in lines:
	new_file.write(line)
	if write_trigger in line:
		# print("Adding Code")
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
		new_file.write("\n")
		new_file.write("	// This will Step through your model,\n")
		new_file.write("	rt_OneStep();\n")
		new_file.write("\n")
		print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		print(" Adding Output Code to ert_main.c  (print statements)")
		print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		for k in range(0,out_count):
			if out_size[k] > 1:			
				new_file.write("	for(int i=0; i<" + str(out_size[k]) + "; i++) {\n")
				new_file.write("		printf(\" " + out_names[k] +"[%d]: %lf \\n\", i,rtY." +out_names[k]+"[i]);\n")
				new_file.write("	}")
			else:
				new_file.write("		printf(\" " + out_names[k] +" %lf \\n\", rtY." +out_names[k]+");\n")
				new_file.write("\n")

new_file.close()
	

	












