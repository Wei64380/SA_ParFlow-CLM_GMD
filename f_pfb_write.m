function f_pfb_write(filename,data_in,nx,ny,nz,dx,dy,dz)
%pfb_creation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fid = fopen(filename, 'wb','ieee-be');

x1=0;
y1=0;
z1=0;

nnx=nx;
nny=ny;
nnz=nz;

rx=1;
ry=1;
rz=1;

ix=0;
iy=0;
iz=0;

ns=1;
        
    % header 
    
    fwrite(fid,x1,'double');    %Lower X
    fwrite(fid,y1,'double');    %Lower Y
    fwrite(fid,z1,'double');    %Lower Z
    
    fwrite(fid,nx,'int32');  % NX
    fwrite(fid,ny,'int32');  % NY
    fwrite(fid,nz,'int32');  % NZ
    
    fwrite(fid,dx,'double');
    fwrite(fid,dy,'double');
    fwrite(fid,dz,'double');
    
    fwrite(fid,ns,'int32');   % num_subgrids
    
    for is = 1:ns;  
    
        %subgrid header
        fwrite(fid,ix,'int32');
        fwrite(fid,iy,'int32');
        fwrite(fid,iz,'int32');
        
        fwrite(fid,nnx,'int32');  % nx
        fwrite(fid,nny,'int32');  % ny
        fwrite(fid,nnz,'int32');  % nz
        
        fwrite(fid,rx,'int32');
        fwrite(fid,ry,'int32');
        fwrite(fid,rz,'int32');
        
         %write matrix     
        for k=(iz+1):(iz+nnz);
            for j=(iy+1):(iy+nny);
                for i=(ix+1):(ix+nnx);
                    fwrite(fid,data_in(i,j,k),'double');
                end   % i
            end   %j
        end   %k
        
    end %is
    
    fclose(fid);
    text='pfb succesfully finished !';
    disp(text);
end
