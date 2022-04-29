% caculate partial effects

LH1 = (0:13:234)';
data2 = lh1;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(1,1:12) = nanmean(S(:,2:13));

data2 = lwrad2;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(2,1:12) = nanmean(S(:,2:13));

data2 = sh3;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(3,1:12) = nanmean(S(:,2:13));

data2 = grnd4;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(4,1:12) = nanmean(S(:,2:13));

data2 = E5;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(5,1:12) = nanmean(S(:,2:13));

data2 = T6;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(6,1:12) = nanmean(S(:,2:13));


data2 = infl7;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(7,1:12) = nanmean(S(:,2:13));

data2 = swe8;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(8,1:12) = nanmean(S(:,2:13));

data2 = t_soil9;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(9,1:12) = nanmean(S(:,2:13));

data2 = ssw10;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(10,1:12) = nanmean(S(:,2:13));

data2 = gw11;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(11,1:12) = nanmean(S(:,2:13));

data2 = sw12;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(12,1:12) = nanmean(S(:,2:13));

data2 = runoff;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(13,1:12) = nanmean(S(:,2:13));

data2 = ss14;
for i = 1:18
    temp = data2(:,(LH1(i)+1):LH1(i+1));   
    for j = 2:13
        S(i,j) = ((100*nansum((temp(:,j)-temp(:,1)))/nansum((temp(:,j)+temp(:,1))))/fraction(i,j));
        S(i,1) = i;
    end
    
    clear temp;
end
S_mean(14,1:12) = nanmean(S(:,2:13));
LK_SA = S_mean;
save LK_SA LK_SA;













