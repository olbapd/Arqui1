
import sys

from PIL import Image
formatType=0
dataType =0
def main(image_name):
    global formatType,dataType
    image = Image.open(image_name, 'r').convert('L')
    image.save('greyscale.png')
    pixels = list(image.getdata())
    fileName = image_name.split('.')[0] + '.mem'
    file = open(fileName, 'w+')

    dataType= int(input("1. For Hex 2. For bin"))
    formatType= int(input("1.Simple 2. For pasting"))
    lineType= int(input("1.Separate 2. Same"))

    if(lineType==1):
        separateLine(file,image,pixels)
    elif(lineType==2):
        sameLine(file,image,pixels)
    file.close()
    image.close()
    print("done")
    

def sameLine(file,image,pixels):
    global dataType, formatType
    address = 0
    for i in range(image.size[1]):
        if(formatType==2):
            file.write("'{")
        for j in range(image.size[0]):
            if(dataType==1):
                line = '' + hexConversion(pixels[address])
            elif(dataType==2):
                line = '' + binConversion(pixels[address])
            file.write(line)
            address+=1
        if(formatType==2):
            file.write("},")
        file.write('\n')

def separateLine(file,image,pixels):
    global dataType, formatType
    address = 0
    for i in range(image.size[1]):
        if(formatType==2):
            file.write("'{")
        for j in range(image.size[0]):
            if(dataType==1):
                line = '' + hexConversion(pixels[address])
            elif(dataType==2):
                line = '' + binConversion(pixels[address])
            if(j!=image.size[0]-1):
                file.write(line+'\n')
            else:
                file.write(line)
            address+=1
        if(formatType==2):
            file.write("},")
        file.write('\n')


def hexConversion(rgb):
    hexNum=hex(int(rgb)).upper().split('X')[-1]
    return  hexNum

def binConversion(rgb):
    global formatType
    num="{0:b}".format(int(str(rgb)))
    num = "{:08b}".format(rgb)
    num = "{:.8}".format(num)
    if( len(num)!=8):
        print(rgb, num)
    else:
        if (formatType==2):
            num = "8'b"+str(num)+","
        else:
            return num
    return num


main("pandita.jpg")
