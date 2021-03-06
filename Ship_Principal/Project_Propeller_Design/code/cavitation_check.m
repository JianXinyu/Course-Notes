%%----空泡校核-------%%
hs=8;                      %m
p0=10330+1025.91*hs;       %kgf/m^2
pv=174;                    %kgf/m^2
P3=PS*0.97/1000/0.735;     %马力
den1=104.63;               %kgf·s^2/m^4
for i=1:7
    ae=0.05*i+0.45;
    v3=v_d(i,3);
    d=v_d(i,2);
    va=0.5144*v3*(1-w);
    vpf=va^2+(0.7*pi*n*v_d(i,2))^2;
    kp(i,9)=vpf;
    c=(p0-pv)/(0.5*104.63*vpf);
    kp(i,1)=ae;
    kp(i,2)=c;
end
%%然后对kp矩阵的第三列在柏利尔空泡限界线上读出对应的值%%
%%如对上面程序做任何改变，均需重新查表确定下面的值%%
kp(1,3)=0.1453;
kp(2,3)=0.1443;
kp(3,3)=0.1428;
kp(4,3)=0.1428;
kp(5,3)=0.1444;
kp(6,3)=0.1453;
kp(7,3)=0.1481;
for i=1:7
    T3=P3*v_d(i,5)*75/va;
    AP=T3/(0.5*104.63*vpf*kp(i,3));
    AE=AP/(1.067-0.229*v_d(i,4));
    ae2=AE/(0.25*pi*v_d(i,2)^2);
    kp(i,4)=ae2;    %4-ae
    kp(i,5)=v_d(i,2);%第五列为直径
    kp(i,6)=v_d(i,3);  %6-vmax
    kp(i,7)=v_d(i,4);  %7-螺距比
    kp(i,8)=v_d(i,5);  %8-效率
end
%%插值与直线的交点可以看出最有盘面比应为0.718  %%
ae3=0.718;
pd2=interp1(kp(1:7,1),kp(1:7,7),ae3,'spline');
d2=interp1(kp(1:7,1),kp(1:7,5),ae3,'spline');
eff=interp1(kp(1:7,1),kp(1:7,8),ae3,'spline');
v4=interp1(kp(1:7,1),kp(1:7,6),ae3,'spline')  ;   %%空炮校核后的结果%%