for i = 1:9504
    filename = ['SA_005.surfacerunoff.' num2str([i],'%05d') '.txt'];
    fid = fopen(filename);
    data = fscanf(fid, ['%f']);
    data(1:3,:) = [];
    data = sort(data(:,1),'descend');
    
    runoff_mean(i,1) = mean(nonzeros(data));

    runoff_1(i,1) = data(1,1);
    runoff_2(i,1) = data(2,1);
    runoff_3(i,1) = data(3,1);
    
    clear filename data;
     
end

 dlmwrite('runoff_1.dat', runoff_1, 'delimiter',' ','precision','%.2f');  
 dlmwrite('runoff_2.dat', runoff_2, 'delimiter',' ','precision','%.2f');  
 dlmwrite('runoff_3.dat', runoff_3, 'delimiter',' ','precision','%.2f');  
 dlmwrite('runoff_mean.dat', runoff_mean, 'delimiter',' ','precision','%.2f');  
 clear all




