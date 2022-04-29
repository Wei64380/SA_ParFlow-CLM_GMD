
% plot partial effect in percentage
data2 = Barcelona_SA;

subplot(3,5,1)
plot(data2(1,:),'r.');
xticklabels([])
title('lh')
ylabel('partial effect [%]')
xticks([0:3:12]);

subplot(3,5,2)
plot(data2(2,:),'r.');

xticklabels([])
title('lwrad')
xticks([0:3:12]);

subplot(3,5,3)
plot(data2(3,:),'r.');

xticklabels([])
title('sh')
xticks([0:3:12]);

subplot(3,5,4)
plot(data2(4,:),'r.');

xticklabels([])
title('grnd')
xticks([0:3:12]);

subplot(3,5,5)
plot(data2(5,:),'r.');

xticklabels([])
title('E')
xticks([0:3:12]);

subplot(3,5,6)
plot(data2(6,:),'r.');

xticklabels([])
title('T')
ylabel('partial effect [%]')
xticks([0:3:12]);

subplot(3,5,7)
plot(data2(7,:),'r.');

xticklabels([])
title('infl')
xticks([0:3:12]);

subplot(3,5,8)
plot(data2(8,:),'r.');

xticklabels([])
title('swe')
xticks([0:3:12]);

subplot(3,5,9)
plot(data2(9,:),'r.');

xticklabels([])
title('t soil')
xticks([0:3:12]);

subplot(3,5,10)
plot(data2(10,:),'r.');

xticklabels([])
title('ssw')
xticks([0:3:12]);
xticklabels([0:3:12]);

subplot(3,5,11)
plot(data2(11,:),'r.');

xticklabels([])
title('gw')
ylabel('partial effect [%]')
xticks([0:3:12]);
xticklabels([0:3:12]);

subplot(3,5,12)
plot(data2(12,:),'r.');

xticklabels([])
title('gw')
xticks([0:3:12]);
xticklabels([0:3:12]);

subplot(3,5,13)
plot(data2(13,:),'r.');

xticklabels([])
title('runoff')
xticks([0:3:12]);
xticklabels([0:3:12]);

subplot(3,5,14)
plot(data2(14,:),'r.');

xticklabels([])
title('ss')
%legend({['dry' newline '13.06.2018-14.07.2018'],['wet' newline '07.12.2017-04.01.2018']})
%legend('2017','2018','2017 and 2018')
xticks([0:3:12]);
xticklabels([0:3:12]);
