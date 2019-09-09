
import sys

from PIL import Image

def main(image_name):
    image = Image.open(image_name, 'r').convert('L')
    image.save('greyscale.png')
    pixels = list(image.getdata())
    
    bitAmount=32
    cols= bitAmount/8
    depth = image.size[1]*image.size[0]/cols

    mif_name = image_name.split('.')[0] + '.mif'

    mif_file = open(mif_name, 'w+')

    mif_file.write('DEPTH='+str(int(depth))+';\nWIDTH='+str(bitAmount)+';\nADDRESS_RADIX=HEX;\nDATA_RADIX=HEX;\nCONTENT\n CONTENT BEGIN\n\n')
    address = 0
    typeConv = int(input("1.Hex 2.Decimal"))
    line=''
    if(typeConv==1):
        for i in range(image.size[1]):
            for j in range(image.size[0]):
                hexAddress = ((i*image.size[0])+j).split('x')[-1]
                mif_file.write(str(hexAddress) + ": ")
                line = '' +eight_bit_conversion(pixels[address])
                mif_file.write(line)
                address+=1
                mif_file.write(';\n')
    elif(typeConv==2):
        cont=0
        for i in range(image.size[1]):
            for j in range(image.size[0]):
                if(cont==0):
                    address = ((i*image.size[0])+j)//4
                    mif_file.write(str(address) + ": ")
                line = '' +eight_bit_conversion(pixels[address])+line
                if(cont>=3):
                    mif_file.write(str(int(line,2)))
                    mif_file.write(';\n')
                    line=''
                    cont=-1
                cont+=1
                address+=1

    mif_file.write('END;\n')
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
