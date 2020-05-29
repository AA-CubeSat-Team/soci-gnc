a_file = open("sample.txt", "r")

lines = a_file.readlines()
a_file.close()

strip_Flag = False
new_file = open("sample.txt", "w")
for line in lines:
	if line.strip("\n") == "THIS ONE":
		strip_Flag = False
		print("End strip")
	if strip_Flag == False:
		new_file.write(line)
	if line.strip("\n") == "TRIGGERED":
		strip_Flag = True
		print("start Strip")
new_file.close()