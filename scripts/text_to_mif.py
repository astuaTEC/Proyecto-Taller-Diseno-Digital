import sys

WIDTH = 8
DEPTH = 65536

# Esta función transforma un string de caracteres ASCII a un archivo .mif donde cada dirección tiene un caracter
def text_to_mif( text: str):
    with open("ascii.mif", 'w') as file:
        file.write("WIDTH={};\n".format(WIDTH))
        file.write("DEPTH={};\n\n".format(DEPTH))
        file.write("ADDRESS_RADIX=UNS;\n")
        file.write("DATA_RADIX=HEX;\n\n")

        address = 2;
        file.write("CONTENT BEGIN\n")
        for char in text:
            if(address < DEPTH):
                file.write("\t{0}\t:   {1:0{2}X};\n".format(address, ord(char), WIDTH//4))
                address += 1
            else:
                break

        if(address < DEPTH-1):
                file.write("\t[{0}..{1}]\t:   {2:0{3}X};\n".format(address, DEPTH-1, 0, WIDTH//4))

        file.write("END;")
        return

if (__name__ == "__main__"):
    text = ""
    if(len(sys.argv) > 1):
        text = sys.argv[1]
        text_to_mif("Lorem" + text)
    else:
        text_to_mif("Lorem" + "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem Cras hendrerit blandit est eget Lorem ornare.Lorem Nunc porta ante quis ante aliquet, eu tempor velit aliquam. Lorem Pellentesque posuere pharetra aliquam. Proin quis nulla at dui porta congue. Pellentesque sit amet maximus neque, et blandit diam. Donec non mi nec nibh dignissim rutrum. Vestibulum pretium lorem libero, ac tempor ex porttitor in. Nullam lacinia sagittis quam nec viverra. Nulla facilisi. Sed nec dictum sem. Pellentesque ullamcorper nisi nibh, id iaculis eros cursus Lorem vitae Lorem. ")
