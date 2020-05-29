import os
import sys

print("resetting ert_main.c")


in_file= open("ert_main.c", "r")
lines = in_file.readlines()

new_file = open("ert_main.c", "w")
for line in lines:
	new_file.write("")

in_file.close()
