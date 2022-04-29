% input all the PF-CLM output variables
A = [1:234]';
for i = 1:size(A,1)
    i = A(i)
    filename = ['sim_' num2str([i],'%03d')];
    cd(filename);
    cd('Data_output'); 
    
    temp1 = load('latent_heat.dat');
    temp1(1:1095,:) = [];
    lh1(:,i)= temp1(:,1);
    clear temp1;

    temp2 = load('long_wave_radiation.dat');
    temp2(1:1095,:) = [];
    lwrad2(:,i) = temp2(:,1);
    clear temp2;

    temp3 = load('sensible_heat.dat');
    temp3(1:1095,:) = [];
    sh3(:,i) = temp3(:,1);
    clear temp3;

    temp4 = load('ground_heat_flux.dat');
    temp4(1:1095,:) = [];
    grnd4(:,i) = temp4(:,1);
    clear temp4;

    temp5 = load('total_E.dat');
    temp5(1:1095,:) = [];
    E5(:,i) = temp5(:,1);
    clear temp5;

    temp6 = load('vegetation_T.dat');
    temp6(1:1095,:) = [];
    T6(:,i) = temp6(:,1);
    clear temp6;

    temp7 = load('soil_infiltration.dat');
    temp7(1:1095,:) = [];
    infl7(:,i) = temp7(:,1);
    clear temp7;

    temp8 = load('snow_water.dat');
    temp8(1:1095,:) = [];
    swe8(:,i) = temp8(:,1);
    clear temp8;

    temp9 = load('soil_surface_temp.dat');
    temp9(1:1095,:) = [];
    t_soil9(:,i) = temp9(:,1);
    clear temp9;

    temp10 = load('subsurface_storage.dat');
    temp10(1:1095,:) = [];
    ssw10(:,i) = temp10(:,1);
    clear temp10;

    temp11 = load('gw_storage.dat');
    temp11(1:1095,:) = [];
    gw11(:,i) = temp11(:,1);
    clear temp11;

    temp12 = load('surface_storage.dat');
    temp12(1:1095,:) = [];
    sw12(:,i) = temp12(:,1);
    clear temp12;

    temp13 = load('runoff.dat');
    temp13(1:1095,:) = [];
    runoff(:,i) = temp13(:,1);
    clear temp13;

    temp14 = load('surface_saturation.dat');
    temp14(1:1095,:) = [];
    ss14(:,i) = temp14(:,1);
    clear temp14;
cd ..
cd ..
end

    
    clear filename i;
    save PF_CLM_output;