#This python script just resets the testing main sert_main.c

a_file = open("ert_main.c", "r")

lines = a_file.readlines()
a_file.close()

strip_Flag = False
#using "sert_main.c so I dont overwrite the origional until things are good"
new_file = open("sert_main.c", "w")
for line in lines:
	new_file.write(line)

new_file.close()