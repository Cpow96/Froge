from PIL import Image
import sys

argv = 'backgroundupdat'                # name of file shit
'''
if len(argv) != 2:
	print ("Invalid arguments")
	sys.exit()
'''

img = Image.open(argv + '.png')
pixel = img.load()
size = img.size

f = open(argv + '.txt', 'w')
f.write('\'{')

hashtable = {      (163, 73, 164, 255): 0,    # backgruond / flowers
                   (0, 0, 0, 255): 1,           # black
                   (255, 255, 255, 255): 2,     # white
                   (127, 127, 127, 255): 3,        # grey
                   (181, 230, 29, 255): 4,      # frog body green
                   (34,177,76,255) : 5,         # frog arm green
                   (237, 28, 36, 255): 6,               # Frog Eye Red
                   (136, 0, 21, 255): 7,        # red
                   (217, 0, 33, 255): 8,        # other red
                   (185, 122, 87, 255) : 9,     #beige
                   (0, 152, 0 ,255): 10,        # Bush Green
                   (7, 92, 14, 255): 11,        # Bush detail
                   (10, 131, 19, 255): 12,      # flower outline
                   (171, 221, 0, 255): 13,      # lily pad detail
                   (153, 204, 0, 255): 14,      # lily pad central
                   (51, 255, 204, 255): 15,     # water blue
                   (132, 255, 224, 255): 16,    # wave blue
                   (135, 255, 225, 255): 17,     # more wave blue
                   (134, 255, 0, 255): 18,      #Grass green
                   (119, 53, 119, 255): 19,     #dark purple car
                   (164, 147, 239, 255): 20,       #light purple car
                   (214, 106, 244, 255): 21,       #pink car
                   (92, 175, 251, 255): 22,        #blue car
                   (222, 196, 223, 255): 23,       #very light purple car
                   (255, 242, 0, 255): 24,       #yellow
                   (200, 191, 231, 255): 25,      #another fucking purple car
                   (175, 127, 117, 255): 26,    #brown for log
                   (210, 124, 101, 255): 27,    #another brown
                   (185, 122, 87, 255): 28,     #more brown
                   (239, 228, 176, 255): 29    #light yellow for log
                   }
for y in range(size[1]):
        #print(size[1])
        f.write('\'{')

        for x in range(size[0]):
                #print pixel[x,y]
                if pixel[x,y] not in hashtable:
                        print ("Invalid color: " + str(pixel[x,y]))
                        print(x,y)
                        f.write("x")
                else:
                        f.write(str(hashtable[pixel[x,y]]))
                if x != size[0] -1: f.write(',')

        f.write('}')
        if y != size[1] - 1: f.write(',\n')

f.write("}")

f.close()

