
import sys

from PIL import Image

def main(image_name):
    image = Image.open(image_name, 'r').convert('L')
    image.save('greyscale.png')
    pixels = list(image.getdata())
    
	
    hex_name = image_name.split('.')[0] + '.hex'

    hex_file = open(hex_name, 'w+')
    address=0
    #hex_file.write('DEPTH={};\nWIDTH={};\nADDRESS_RADIX=DEC;\nDATA_RADIX=BIN;\nCONTENT\nBEGIN\n\n'.format(len(pixels), 8))
    for i in range(image.size[1]):
        for j in range(image.size[0]):
            #line = '' + eight_bit_conversion(pixels[address])+"\n"
            line = ':01000005' + eight_bit_conversion(pixels[address])+"\n"
            hex_file.write(line)
            address+=1

    hex_file.close()

    image.close()
    print("done")

def eight_bit_conversion(rgb):
    '''num="{0:b}".format(int(str(rgb)))
    num = "{:08b}".format(rgb)
    num = "{:.8}".format(num)
    if( len(num)!=8):
        print(rgb, num)'''
    num= hex(rgb).split('x')[-1]
    if( len(num)!=2):
        num="0"+str(num)

    print(num)
    checksum = str(hex(int(num,16)+6).split('x')[-1])
    print(checksum)
    checksum = getCheckSum(checksum)
    
        
    return num

def getCheckSum(checksum):
    if(len(checksum)<2):
        checksum="0"+str(checksum)
    elif (len(checksum)<1):
        checksum="00"
    else:
        checksum = ""+checksum[-2]+checksum[-1]
   
    binint = "{0:8b}".format(int(checksum,16)) #convert to binary
    flipped = ~binint #flip the bits
    flipped += 1 #add one (two's complement method)
    print(flipped)
    intflipped=hex(int(str(flipped),2))
    return intflipped
    

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
