
import sys

from PIL import Image

def main(image_name):
    image = Image.open(image_name, 'r').convert('L')
    image.save('greyscale.png')
    pixels = list(image.getdata())

    bitAmount=8
    cols= bitAmount/8
    
    mif_name = image_name.split('.')[0] + '.mif'

    mif_file = open(mif_name, 'w+')
    depth = image.size[1]*image.size[0]/cols
    mif_file.write('DEPTH='+str(int(depth))+';\nWIDTH='+str(bitAmount)+';\nADDRESS_RADIX=HEX;\nDATA_RADIX=HEX;\nCONTENT\nBEGIN\n\n'.format(len(pixels), 8))
    address = 0
    #cont=0
    line=''
    for i in range(image.size[1]):
        for j in range(image.size[0]):
            #if(cont==0):
            hexAddress = hex(((i*image.size[0])+j)).split('x')[-1]
            mif_file.write(hexAddress.upper()  + ": ")
            line ='' + eight_bit_conversion(pixels[address])+line
            #mif_file.write(line)
            address+=1
            #if(cont==cols-1):
            #   cont=-1
            mif_file.write(line)
            line=''
            mif_file.write(';\n')
                
            #cont+=1
    '''print(cont)
    if(cont !=0):
        while(cont<cols-1):
            mif_file.write('00')
            cont+=1
        mif_file.write(';\n')'''

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
