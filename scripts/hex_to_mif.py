# Este script requiere leer un archivo con código máquina en hexadecimal, donde cada línea tiene 32 bits (una instrucción en ARM). Se puede llamar con "python hex_to_mif.py <nombre_de_archivo>" o se puede llamar sin dar el nombre del archivo, en cuyo caso el programa le preguntará al usuario cuál es el nombre del archivo a leer.

import sys

WIDTH = 32
DEPTH = 65536

# Esta función toma un archivo con código máquina en hexadecimal donde cada línea representa 32 bits y genera un archivo .mif donde cada dirección tiene una instrucción
def hex_to_mif(args):
    if(len(sys.argv) > 1):
        filename = sys.argv[1]
    else:
        print("Ingrese el nombre del archivo en hexadecimal")
        filename = input()
    try:
        with open(filename, 'r') as readfile:
            with open("hex.mif", 'w') as writefile:
                writefile.write("WIDTH={};\n".format(WIDTH))
                writefile.write("DEPTH={};\n\n".format(DEPTH))
                writefile.write("ADDRESS_RADIX=UNS;\n")
                writefile.write("DATA_RADIX=HEX;\n\n")
                address = 0;
                writefile.write("CONTENT BEGIN\n")
                for line in readfile:
                    line = line.replace('\n','')
                    if(address < DEPTH):
                        writefile.write("\t{0}\t:   {1:0{2}X};\n".format(address, int(line,16), WIDTH//4))
                        address += 4
                    else:
                        break

                if(address < DEPTH-1):
                        writefile.write("\t[{0}..{1}]\t:   {2:0{3}X};\n".format(address, DEPTH-1, 0, WIDTH//4))

                writefile.write("END;")
                print("Se escribió el archivo 'hex.mif' con éxito")
    except FileNotFoundError:
        print("No se encontró el archivo '"+filename+"'")
    except IOError:
        print("Hubo un error leyendo el archivo dado")
    return

if __name__ == "__main__":
    hex_to_mif(sys.argv)
