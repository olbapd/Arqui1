import cv2
import numpy as np
import os


def load_img(name): #Para subir imagnenes
    path= os.path.join("imgs",name) #Establece donde debe buscar la imagen
    #img= PhotoImage(file=path)
    img=cv2.imread(path,1)
    #img=cv2.cvtColor(img,cv2.COLOR_BGR2RGB)

    #sharping
    kernel = np.array(([0,-1,0],[-1,5,-1],[0,-1,0]),np.float32)

    #gaussian blur 3x3
    kernel2 = np.array(([0.0625, 0.125, 0.0625], [0.125, 0.25, 0.125], [0.0625, 0.125, 0.0625]),np.float32)

    #unsharp masking 5x5
    #kernel2 = np.array(([-0.00390625, -0.015625, -0.0234375, -0.015625, -0.00390625], [-0.015625, -0.0625, -0.09375, -0.0625, -0.015625], [-0.0234375, -0.09375, 1.859375, -0.09375, -0.0234375], [-0.015625, -0.0625, -0.09375, -0.0625, -0.015625], [-0.00390625, -0.015625, -0.0234375, -0.015625, -0.00390625]),np.float32)
    
    kernel3 = np.array(([1,0,-1],[0,0,0],[-1,0,1]),np.float32)

    output = cv2.filter2D(img,-1, kernel)
    output = cv2.filter2D(output,-1, kernel2)
    output = cv2.filter2D(output,-1, kernel)

    cv2.imshow('image',output)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    cv2.imwrite(os.path.join("imgs","resultado.jpg"),output)
    
    

load_img('test1.jpg')
'''
a=[[1,2,1],[2,4,2],[1,2,1]]
temp=[]
for line in a:
    t=[]
    for i in line:
        t.append(i*1/16)
    temp.append(t)
print(temp)
'''
