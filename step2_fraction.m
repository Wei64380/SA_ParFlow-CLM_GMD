
% creat fraction of the parameters
SA_parameter=load('parameters_low_slope.txt');

LH1 = (0:13:234)';

for i = 1:18
    temp = SA_parameter((LH1(i)+1):LH1(i+1),:);
    for j = 1:13
        f(1,j) = (temp(j,j)-temp(1,j))/temp(1,j);
    end
    fraction(i,2:13)= f(2:13);
    fraction(i,1) = i;
    clear f temp;
end
    
save fraction fraction

