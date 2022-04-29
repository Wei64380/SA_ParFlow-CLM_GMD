function [dataout,nx,ny,nz,dx,dy,dz] = f_pfb_read(filename)
% READ PFB FILES
    
    % open file
    [data,message] = fopen(filename,'r','ieee-be'); % (filename,permission,format)
   
    
    % SATURATION
    x1 = fread(data,1,'double');    %Lower X
    y1= fread(data,1,'double');    %Lower Y
    z1 = fread(data,1,'double');    %Lower Z
    
    nx = fread(data,1,'int32');  % NX
    ny = fread(data,1,'int32');  % NY
    nz = fread(data,1,'int32');  % NZ
    
    dx = fread(data,1,'double');
    dy = fread(data,1,'double');
    dz = fread(data,1,'double');
    
    ns = fread(data,1,'int32');   % num_subgrids
    
    dataout=zeros(nx,ny,nz);
    
    for is = 1:ns;  %number of subgrids
        ix = fread(data,1,'int32');
        iy = fread(data,1,'int32');
        iz = fread(data,1,'int32');
        
        nnx = fread(data,1,'int32');  % nx
        nny = fread(data,1,'int32');  % ny
        nnz = fread(data,1,'int32');  % nz
        
        rx = fread(data,1,'int32');
        ry = fread(data,1,'int32');
        rz = fread(data,1,'int32');
        
       
        
        for k=(iz+1):(iz+nnz);
            for j=(iy+1):(iy+nny);
                for i=(ix+1):(ix+nnx);
                    dataout(i,j,k) = fread(data,1,'double');
     
                   
                    % i
            end   %j
        end   %k
        
    end %is
    end