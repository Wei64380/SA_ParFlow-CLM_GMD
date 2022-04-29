load('ind0.dat');
for i = 1096:5484
    filename = ['SA_060.out.clm_output.' num2str([i],'%05d') '.txt'];
    fid = fopen(filename);
    data = fscanf(fid, ['%f']);
    data(1:3,:) = [];
    data(ind0,:) = [];
    fclose(fid);
    clear filename fid;
    
    latent_heat(i,1) = mean(data(1:1601));
    long_wave_radiation(i,1) = mean(data(1602:(1601*2)));
    sensible_heat(i,1) = mean(data((1601*2+1):(1601*3)));
    ground_heat_flux(i,1)  = mean(data((1601*3+1):(1601*4)));
    total_E(i,1) = 3600*(mean(data((1601*4+1):(1601*5))));
    ground_E(i,1) = 3600*(mean(data((1601*5+1):(1601*6))));
    soil_E(i,1) = 3600*(mean(data((1601*6+1):(1601*7))));
    vegetation_E(i,1) = 3600*(mean(data((1601*7+1):(1601*8))));
    vegetation_T(i,1) = 3600*(mean(data((1601*8+1):(1601*9))));
    soil_infiltration(i,1)  = 3600*(mean(data((1601*9+1):(1601*10))));
    snow_water(i,1)  = mean(data((1601*10+1):(1601*11)));
    ground_surface_temp(i,1)  = mean(data((1601*11+1):(1601*12)));
    soil_lower_temp(i,1)  = mean(data((1601*12+1):(1601*13)));
    soil_surface_temp(i,1)  = mean(data((1601*22+1):(1601*23)));
    soil_20cm_temp(i,1)  = mean(data((1601*21+1):(1601*22)));
    soil_mean_temp(i,1)  = mean(data((1601*12+1):(1601*23)));
    clear data
end

 dlmwrite('latent_heat.dat', latent_heat, 'delimiter',' ','precision','%.2f');  clear latent_heat;
 dlmwrite('long_wave_radiation.dat', long_wave_radiation, 'delimiter',' ','precision','%.2f');  clear long_wave_radiation;
 dlmwrite('sensible_heat.dat', sensible_heat, 'delimiter',' ','precision','%.2f');  clear sensible_heat;
 dlmwrite('ground_heat_flux.dat', ground_heat_flux, 'delimiter',' ','precision','%.2f');  clear ground_heat_flux;
 dlmwrite('total_E.dat', total_E, 'delimiter',' ','precision','%.2f');  clear total_E;
 dlmwrite('ground_E.dat', ground_E, 'delimiter',' ','precision','%.2f');  clear ground_E;
 dlmwrite('soil_E.dat', soil_E, 'delimiter',' ','precision','%.2f');  clear soil_E;
 dlmwrite('vegetation_E.dat', vegetation_E, 'delimiter',' ','precision','%.2f');  clear vegetation_E;
 dlmwrite('vegetation_T.dat', vegetation_T, 'delimiter',' ','precision','%.2f');  clear vegetation_T;
 dlmwrite('soil_infiltration.dat', soil_infiltration, 'delimiter',' ','precision','%.2f');  clear soil_infiltration;
 dlmwrite('snow_water.dat', snow_water, 'delimiter',' ','precision','%.2f');  clear snow_water;
 dlmwrite('ground_surface_temp.dat', ground_surface_temp, 'delimiter',' ','precision','%.2f');  clear ground_surface_temp;
 dlmwrite('soil_surface_temp.dat', soil_surface_temp, 'delimiter',' ','precision','%.2f');  clear soil_surface_temp;
 dlmwrite('soil_lower_temp.dat', soil_lower_temp, 'delimiter',' ','precision','%.2f');  clear soil_lower_temp;
 dlmwrite('soil_mean_temp.dat', soil_mean_temp, 'delimiter',' ','precision','%.2f');  clear soil_mean_temp;

 clear all





