LINES=[]


def read_file():
	global LINES
	file = open("file.txt","r")
	for line in file:
		LINES.append(line.lower())
	file.close()
	print(LINES)

def processLine():
	global LINES
	for line in LINES:
		if( re.findall("\Aadd"),line):
			print(line)
		elif( re.findall("\Asub"),line):
			print(line)
		elif( re.findall("\Amov"),line):
			print(line)

def write_file():
    file = open("output.dat","w")
    file.write()
    file.close()

read_file()