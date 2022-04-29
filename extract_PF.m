for i = 1:9504
    filename = ['water_storage.' num2str([i],'%05d') '.txt'];
    data = load(filename);
    
    subsurface_storage(i, 1) = data(1,2);
    gw_storage(i,1) = data(1,3);
    surface_storage(i,1) = data(1,4);
    runoff(i,1) = data(1,5);
    surface_saturation(i,1) = data(1,6)/1601;

    clear filename data;
     
end

 dlmwrite('subsurface_storage.dat', subsurface_storage, 'delimiter',' ','precision','%.2f');  
 dlmwrite('gw_storage.dat', gw_storage, 'delimiter',' ','precision','%.2f');  
 dlmwrite('surface_storage.dat', surface_storage, 'delimiter',' ','precision','%.2f');  
 dlmwrite('runoff.dat', runoff, 'delimiter',' ','precision','%.2f');  
 dlmwrite('surface_saturation.dat', surface_saturation, 'delimiter',' ','precision','%.2f');  
 clear all




