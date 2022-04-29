import numpy as np
import os
import shutil
import tempfile
import pandas as pd

#parameters = pd.read_csv('SA_parameters_LH-OAT.csv', header=None)
parameters = np.loadtxt('parameters_SA.txt')
parameters_size = parameters.shape
    

for i in np.arange(0,parameters_size[0]):


    f11 = open('SA_014.tcl','r')
    contents = f11.read()
    #print(f1.tell()) 
    contents = contents.replace(contents[2599:2605], str('{:.4f}'.format(parameters[i][1])))
    contents = contents.replace(contents[2628:2634], str('{:.4f}'.format(parameters[i][2])))
    if (parameters[i][3] > 10):
        contents = contents.replace(contents[2657:2663], str('{:.3f}'.format(parameters[i][3])))
    else:
        contents = contents.replace(contents[2657:2663], str('{:.4f}'.format(parameters[i][3])))
        
    contents = contents.replace(contents[2686:2692], str('{:.4f}'.format(parameters[i][4])))
    contents = contents.replace(contents[2715:2721], str('{:.4f}'.format(parameters[i][5])))
    contents = contents.replace(contents[2744:2750], str('{:.4f}'.format(parameters[i][6])))
    contents = contents.replace(contents[2805:2811], str('{:.4f}'.format(parameters[i][8])))
    contents = contents.replace(contents[2834:2840], str('{:.4f}'.format(parameters[i][9])))
    contents = contents.replace(contents[2867:2870], '{0:03}'.format(i + 1))
    contents = contents.replace(contents[2773:2782], str('{:.7f}'.format(parameters[i][7])))
    f11.close()   
    
    #testfile = 'PF_CLM.tcl' 
    #f30 = open( testfile, 'w')
    #f30.write(contents)
    #print(i, contents[2627:2632])
    #print(i, contents[2655:2660])
    #f30.close()

    
    f12 = open('drv_vegp.dat','r')
    veg_parameter = f12.read()
    veg_parameter = veg_parameter.replace(veg_parameter[1855:1860], str('{:.3f}'.format(parameters[i][10])))
    veg_parameter = veg_parameter.replace(veg_parameter[2118:2123], str('{:.3f}'.format(parameters[i][11])))
    veg_parameter = veg_parameter.replace(veg_parameter[2261:2266], str('{:.3f}'.format(parameters[i][12])))
    f12.close()

    f13 = open('run_script.sh','r')
    jobscript = f13.read()
    jobscript = jobscript.replace(jobscript[87:90], '{0:03}'.format(i + 1))
    jobscript = jobscript.replace(jobscript[509:512], '{0:03}'.format(i + 1))
    jobscript = jobscript.replace(jobscript[565:568], '{0:03}'.format(i + 1))  
    f13.close()    


    f14 = open('Extract_CLM_data.tcl','r')
    CLM_read = f14.read()
    CLM_read = CLM_read.replace(CLM_read[209:212], '{0:03}'.format(i + 1))
    f14.close()

    
    f15 = open('Extract_PF_data.tcl','r')
    PF_read = f15.read()
    PF_read = PF_read.replace(PF_read[373:376], '{0:03}'.format(i + 1))
    f15.close()


    f16 = open('extra_clm.m','r')
    M_CLM = f16.read()
    M_CLM = M_CLM.replace(M_CLM[54:57], '{0:03}'.format(i + 1))
    f16.close()


    f17 = open('extra_PF.m','r')
    M_PF = f17.read()
    f17.close()


    f18 = open('data_process.sh','r')
    CLM_PF_process = f18.read()
    CLM_PF_process = CLM_PF_process.replace(CLM_PF_process[88:91], '{0:03}'.format(i + 1))
    f18.close()


    new_dir = os.getcwd() + '/sim_' + '{0:03}'.format(i + 1) + '/'
    print(new_dir) 
    try:
        os.mkdir(new_dir)
        print('Directory', new_dir, 'Created')
    except FileExistsError:
        print('Directory', new_dir, 'already exits') 
    
    tempname = 'SA_' + '{0:03}'.format(i + 1) + '.tcl' 
    filename21 = new_dir + tempname
    f21 = open( filename21, 'w')
    f21.write(contents)
    f21.close()

    filename22 = new_dir + 'drv_vegp.dat'
    f22 = open( filename22, 'w')
    f22.write(veg_parameter)
    f22.close()

    filename23 = new_dir + 'run_PF.sh'
    f23 = open( filename23, 'w')
    f23.write(jobscript)
    f23.close()


    filename24 = new_dir + 'Extract_CLM_data.tcl'
    f24 = open(filename24, 'w')
    f24.write(CLM_read)
    f24.close()


    filename25 = new_dir + 'Extract_PF_data.tcl'
    f25 = open(filename25, 'w')
    f25.write(PF_read)
    f25.close()

    
    filename26 = new_dir + 'extract_clm.m'
    f26 = open(filename26, 'w')
    f26.write(M_CLM)
    f26.close()    


    filename27 = new_dir + 'extract_PF.m'
    f27 = open(filename27, 'w')
    f27.write(M_PF)
    f27.close()  


    filename28 = new_dir + 'data_process.sh'
    f28 = open(filename28, 'w')
    f28.write(CLM_PF_process)
    f28.close()
    

    filename31 = new_dir + 'xslope.pfb'
    shutil.copy('xslope.pfb',filename31) 

    filename32 = new_dir + 'yslope.pfb'
    shutil.copy('yslope.pfb',filename32)

    filename33 = new_dir + 'distribute.tcl'
    shutil.copy('distribute.tcl',filename33)

    filename34 = new_dir + 'drv_clmin.dat'
    shutil.copy('drv_clmin.dat',filename34)

    
    filename35 = new_dir + 'drv_vegm.dat'
    shutil.copy('drv_vegm.dat',filename35)


    filename36 = new_dir + 'indicater_Stettbach.pfb'
    shutil.copy('indicater_Stettbach.pfb',filename36)

    filename37 = new_dir + 'initial_press.pfb'
    shutil.copy('initial_press.pfb',filename37)

    filename38 = new_dir + 'metfile.dat'
    shutil.copy('metfile.dat',filename38)
  
    filename39 = new_dir + 'Stettbach_mask.pfb'
    shutil.copy('Stettbach_mask.pfb',filename39)

    filename40 = new_dir + 'ind0.dat'
    shutil.copy('ind0.dat',filename40)



    
