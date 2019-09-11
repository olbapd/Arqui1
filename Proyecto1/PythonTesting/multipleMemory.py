import sys
import math
from PIL import Image


def main(image_name):
    value=int(input("1.Hex/Bin 2.Dec/Dec"))
    if(value==1):
        main1(image_name)
    elif(value==2):
        main2(image_name)

def main1(image_name):
    image = Image.open(image_name, 'r').convert('L')
    image.save('greyscale.png')
    pixels = list(image.getdata())
    pixelAmount = image.size[1]*image.size[0]
    memoryAmount = math.ceil(float(pixelAmount)/float(65356))
    print(pixelAmount,memoryAmount)
    fileNames=[]
    for i in range(1,memoryAmount+1):
        fileNames.append(image_name.split('.')[0] +str(i)+'.mif')

    address = 0
    currentPixel=0
    fileIndex=0
    line=''
    depth = image.size[1]*image.size[0]
    mif_file = open(fileNames[0], 'w+')
    if(depth <65536):
        mif_file.write('DEPTH='+str(int(depth))+';\nWIDTH=8;\nADDRESS_RADIX=HEX;\nDATA_RADIX=BIN;\nCONTENT\nBEGIN\n\n')
    else:
        mif_file.write('DEPTH=65536;\nWIDTH=8;\nADDRESS_RADIX=HEX;\nDATA_RADIX=BIN;\nCONTENT\nBEGIN\n\n')
    for i in range(image.size[1]):
        for j in range(image.size[0]):
            hexAddress = hex(address).split('x')[-1]
            mif_file.write(hexAddress.upper()  + ": ")
            line ='' + eight_bit_conversion(pixels[currentPixel])
            mif_file.write(line)
            mif_file.write(';\n')
            address+=1
            currentPixel+=1
            if(address==65536):
                address=0
                fileIndex+=1
                mif_file.write('END;')
                mif_file.close()
                mif_file=open(fileNames[fileIndex], 'w+')
                if(depth-(fileIndex*65536) <65536):
                     mif_file.write('DEPTH='+str(int(depth))+';\nWIDTH=8;\nADDRESS_RADIX=HEX;\nDATA_RADIX=BIN;\nCONTENT\nBEGIN\n\n')
                else:
                    mif_file.write('DEPTH=65536;\nWIDTH=8;\nADDRESS_RADIX=HEX;\nDATA_RADIX=BIN;\nCONTENT\n BEGIN\n\n')
    
    mif_file.write('END;')
    mif_file.close()
    image.close()
    print("done")


def main2(image_name):
    image = Image.open(image_name, 'r').convert('L')
    image.save('greyscale.png')
    pixels = list(image.getdata())
    pixelAmount = image.size[1]*image.size[0]
    memoryAmount = math.ceil(float(pixelAmount)/float(65356))
    print(pixelAmount,memoryAmount)
    fileNames=[]
    for i in range(1,memoryAmount+1):
        fileNames.append(image_name.split('.')[0] +str(i)+'.mif')

    address = 0
    currentPixel=0
    fileIndex=0
    line=''
    depth = image.size[1]*image.size[0]
    mif_file = open(fileNames[0], 'w+')
    if(depth <65536):
        mif_file.write('DEPTH='+str(int(depth))+';\nWIDTH=8;\nADDRESS_RADIX=UNS;\nDATA_RADIX=UNS;\nCONTENT BEGIN\n\n')
    else:
        mif_file.write('DEPTH=65536;\nWIDTH=8;\nADDRESS_RADIX=UNS;\nDATA_RADIX=UNS;\nCONTENT BEGIN\n\n')
    for i in range(image.size[1]):
        for j in range(image.size[0]):
            mif_file.write(str(address)+ ": ")
            line ='' + str(pixels[currentPixel])
            mif_file.write(line)
            mif_file.write(';\n')
            address+=1
            currentPixel+=1
            if(address==65536):
                address=0
                fileIndex+=1
                mif_file.write('END;')
                mif_file.close()
                mif_file=open(fileNames[fileIndex], 'w+')
                if(depth-(fileIndex*65536) <65536):
                     mif_file.write('DEPTH='+str(int(depth))+';\nWIDTH=8;\nADDRESS_RADIX=UNS;\nDATA_RADIX=UNS;\nCONTENT BEGIN\n\n')
                else:
                    mif_file.write('DEPTH=65536;\nWIDTH=8;\nADDRESS_RADIX=UNS;\nDATA_RADIX=UNS;\nCONTENT BEGIN\n\n')
    
    mif_file.write('END;')
    mif_file.close()
    image.close()
    print("done")


def eight_bit_conversion(rgb):
    num="{0:b}".format(int(str(rgb)))
    num = "{:08b}".format(rgb)
    num = "{:.8}".format(num)
    if( len(num)!=8):
        print(rgb, num)
    return num
    hexNum=hex(int(num,2)).upper().split('X')[-1]
    if len(hexNum)!=2:
        hexNum = '0'+hexNum
    return  hexNum



def add_padding(num,pad):
    if pad == 24: 
        #offset = "{:024b}".format(num)
        offset = "{:024}".format(num)
        offset = "{:.24}".format(offset)
        return offset
    if pad == 20: 
        #offset = "{:024b}".format(num)
        offset = "{:020}".format(num)
        offset = "{:.20}".format(offset)
        return offset
    elif pad==12:
        #offset = "{:012b}".format(num)
        offset = "{:012}".format(num)
        offset = "{:.12}".format(offset)
        return offset
    elif pad==4:
        offset = "{:04b}".format(num)
        offset = "{:.4}".format(offset)
        return offset
    
def num_to_bin(num):
    if num[0]=='#':
        if '0x' in num:
            num="{0:b}".format(abs(int(num[1:],16)))
        else:
            num= "{0:b}".format(abs(int(num[1:])))
    elif num[0]=='=':
        if '0x' in num:
            num="{0:b}".format(abs(int(num[1:],16)))
        else:
            num= "{0:b}".format(abs(int(num[1:])))
    elif '0x' in num:
        num="{0:b}".format(abs(int(num,16)))
    else:
        raise Exception("Error 03: Numero no valido. Por favor revisar el reference sheet.")
    return num

main("pandita.jpg")
