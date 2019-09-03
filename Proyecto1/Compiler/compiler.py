INSTRUCTIONS = {
	"addv":{"code":"0100", "type":1},
	"subv":{"code":"0010", "type":1},
	"andv":{"code":"0000", "type":1},
	"orrv":{"code":"1100", "type":1},
	"movv":{"code":"1101", "type":1},
    "mulv":{"code":"0001", "type":1},
    "conv":{"code":"0011", "type":1},
	"ldrv":{"code":"011001", "type":2},
	"movv":{"code":"000000", "type":2}
}

OUTPUT=[]
CURRENT_TYPE=""
CURRENT_CODE=""

def write_file():
    file = open("output.dat","w")
    text = ""
    for instruc in OUTPUT:
        text+=instruc+"\n"
    length = len(text)
    text = text[:length-1]
    file.write(text)
    file.close()

def read_file():
    file = open("file.dat","r")
    for line in file:
        linea=format_instruc(line)
        verify_instr(linea)
        compile_reg(linea) #le indico cual es el label
        if len(OUTPUT[-1]) != 32:
            raise Exception("Error 04: La instruccion no tiene formato adecuado. Por favor revisar el reference sheet.")
    file.close()
    write_file()
#--------------- Validation -------------------#
def format_instruc(line):
    line=line.rstrip("\n")
    line=line.strip()
    line = line.split(" ")
    while(True):
        if '' in line:
            line.remove('')
        else:
            break
    for i in range(0,len(line)):
        if ',' in line[i]:
            elem=line[i].split(",")
            if elem[1]=='':
                line[i] = elem[0]
            else:
                line.append(elem[1])
                break
    return line

#Input: la instruccion
def verify_instr(linea):
    global CURRENT_TYPE, CURRENT_CODE
    instr=linea[0]
    instr = instr.lower()
    if instr in INSTRUCTIONS:
        CURRENT_TYPE = INSTRUCTIONS.get(instr).get("type")
        CURRENT_CODE = INSTRUCTIONS.get(instr).get("code")
    else:
        raise Exception("Error 01: Instruccion no encontrada. Por favor revisar el reference sheet.")


#--------------- Compiling -------------------#

def compile_reg(lista):
    global OUTPUT
    opcode=[CURRENT_CODE]
    rd = get_reg(lista[1])
    opcode.append(rd)
    i=2
    contains_imm=False
    while(i<len(lista)):
        data= lista[i]
        if lista[i][0].lower() == "r":
            data=get_reg(lista[i])
            opcode.append(data)
        else: 
            contains_imm=True
            num=num_to_bin(lista[i])
            if CURRENT_TYPE ==1:
                num=add_padding(int(num),12)
            '''elif CURRENT_TYPE ==6:
                num=add_padding(int(num),20)
            else:
                num=add_padding(int(num),24)'''
            opcode.append(num)
        i+=1

    '''if contains_imm:
        opcode= set_imm(opcode)'''
    opcode = fill_empty(opcode,contains_imm,lista[0])
    temp = ''
    for code in opcode:
        temp+=code
    print(temp)
    OUTPUT.append(temp)
# --------------------- Utilities --------------------------#
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

def set_imm(registers):
    if CURRENT_TYPE ==1:
        registers[0]= registers[0][:6]+'1'+registers[6:]
    '''elif CURRENT_TYPE ==3 or CURRENT_TYPE ==4:
        registers[0]=registers[0][:3]+'1'''
    return registers


def get_reg(register):
     num = int(register[1:])
     if num<0 or num>16:
        raise Exception("Error 06: Este registro no existe. Por favor revisar el reference sheet.")
     else:
        reg = add_padding(num,4)
     return reg



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



def fill_empty(opcode,hasImm,instr):
    if CURRENT_TYPE ==1 and (not hasImm):
        opcode= ['1110000',opcode[0],'0',opcode[2],opcode[1],'00000000',opcode[3]]
    elif CURRENT_TYPE ==1 and hasImm:
        opcode= ['1110001',opcode[0],'0',opcode[2], opcode[1],opcode[3]]
    '''elif CURRENT_TYPE ==2 or CURRENT_TYPE ==7:
        opcode.append('000000000000')
        opcode =add_cond(opcode,hasImm,instr)
    elif (CURRENT_TYPE ==3 or CURRENT_TYPE ==4 ) and not hasImm:
        opcode.append('0000000000000000')
        opcode =add_cond(opcode,hasImm,instr)
    elif CURRENT_TYPE ==5:
        opcode.append('0000000000')
        opcode =add_cond(opcode,hasImm,instr)
    elif CURRENT_TYPE ==6:
        opcode =add_cond(opcode,hasImm,instr)
    elif CURRENT_TYPE ==10:
        opcode.append('0000000000000000000000')
        opcode =add_cond(opcode,hasImm,instr)'''
    return opcode

read_file()
