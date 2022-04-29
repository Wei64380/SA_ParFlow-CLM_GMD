import numpy as np
import os
import shutil
import tempfile
import pandas as pd

#temp = pd.read_csv('SA_parameters_LH-OAT.txt', header=None)
#parameters = np.array(temp)
parameters = np.loadtxt('SA_parameters_LH-OAT.txt',dtype='f')
#parameters = np.float(parameters)

parameters_size = parameters.shape
    
print(parameters_size)

for i in np.arange(parameters_size[0]):

    f1 = open('SA_001.tcl','r')
    contents = f1.read()
    contents = contents.replace(contents[2859:2862], '{0:03}'.format(i + 1))
    contents = contents.replace(contents[2599:2604], str('{:.3f}'.format(parameters[i][1])))
    print(i,contents[2599:2604],parameters[i][1])
    contents = contents.replace(contents[2627:2632], str('{:.3f}'.format(parameters[i][2])))
    print(i,contents[2627:2632],parameters[i][2])
    contents = contents.replace(contents[2655:2660], str('{:.3f}'.format(parameters[i][3])))
    print(i,contents[2655:2660],parameters[i][3])
    contents = contents.replace(contents[2683:2688], str('{:.3f}'.format(parameters[i][4])))
    contents = contents.replace(contents[2711:2716], str('{:.3f}'.format(parameters[i][5])))
    contents = contents.replace(contents[2739:2745], str('{:.4f}'.format(parameters[i][6])))
    contents = contents.replace(contents[2799:2804], str('{:.3f}'.format(parameters[i][8])))
    contents = contents.replace(contents[2827:2832], str('{:.3f}'.format(parameters[i][9])))
    f1.close()   
    
    filename1 =  'SA_' + '{0:03}'.format(i + 1) + '.tcl' 
    print(filename1)
    f3 = open( filename1, 'w')
    f3.write(contents)
    print(i, contents[2599:2604])
    print(i, contents[2627:2632])
    print(i, contents[2655:2660])
    f3.close()

