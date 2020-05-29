import os
import sys


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

print("~~~~~~~~~~~~~~~~~~~~")
print(" Reading input.txt  ")
print("~~~~~~~~~~~~~~~~~~~~")

#First Lets pull infor out of the text file. I'm splitting this into stages to make it easier to read. 
with open("input.txt","r+") as input_file:
	for line in input_file:
		for word in line.split(','):
			if word != "\n":

				if line_count == 0 :
					var_count = word

				if line_count == 1 :
					#print(word)
					var_names.append(word)

				if line_count == 2 :
					#print(word)
					var_sizes.append(word)

		line_count = line_count + 1

if DEBUG:
	print("Line count: " + str(line_count))
	print("Variable Count: " + str(var_count))
	print("Variable Names: " + str(var_names))
	print("Variable Size: " + str(var_sizes))

input_file.close()

#Now we have to strip the existing ert_main.c so that it works with our autocoder
print("~~~~~~~~~~~~~~~~~~~~")
print("Stripping ert_main.c")
print("~~~~~~~~~~~~~~~~~~~~")

#Start_Trigger = "sgp4_lib_fsw0_initialize();"
#End_Trigger = "return 0;"

a_file = open("ert_main.c", "r")

lines = a_file.readlines()
a_file.close()

strip_Flag = False
#using "sert_main.c so I dont overwrite the origional until things are good"
new_file = open("sert_main.c", "w")
for line in lines:
	if "return 0;" in line:
		strip_Flag = False
		print("End strip")
	if strip_Flag == False:
		new_file.write(line)
	if "sgp4_lib_fsw0_initialize();" in line:
		strip_Flag = True
		print("start Strip")
		new_file.write("\n")
# 
new_file.close()



print("~~~~~~~~~~~~~~~~~~~~")
print("Autocoding The Test")
print("~~~~~~~~~~~~~~~~~~~~")

#Grab the lines from the stripped function
# new_file = open("sert_main.c", "w")

sert_in = open("sert_main.c", "r")
new_lines = sert_in.readlines()

new_file = open("sert_main.c", "w")

for line in new_lines:
	new_file.write(line)
	if "sgp4_lib_fsw0_initialize();" in line:
		print("Adding Code")
		new_file.write("\n")
		new_file.write("  rt_OneStep();\n")
		# new_file.write("//you will need something like this:")
		new_file.write("  for (int i = 0; i < 3; ++i) {\n")
		new_file.write("    printf(\"rtY.pos_eci_m[%d] = %20.12f\\n\",i,rtY.pos_eci_m[i]);\n")
		new_file.write("  }\n")
		new_file.write("  for (int i = 0; i < 3; ++i) {\n")
		new_file.write("    printf(\"rtY.vel_eci_mps[%d] = %20.12f\\n\",i,rtY.vel_eci_mps[i]);\n")
		new_file.write("  }\n")
		new_file.write("  printf(\"rtY.SGP4_FLAG = %f\\n\",rtY.SGP4_FLAG);\n")	
 	# new_file.write(line)

new_file.close()

