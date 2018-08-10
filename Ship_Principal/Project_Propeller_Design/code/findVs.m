function Vs_req = findVs(PD_req,den,n,w,t)
%��ĳһ������ֱ�����������ĺ���
%����:��ˮ�ܶ�den,������ת��n,����ϵ��w,�����������t
%���:���ź���

Vs = PD_req(:,3);%�Ӿ�������ȡ����
[ PE1, PE2, PE3 ] = calPE(Vs);%PE1ѹ�ع���, PE2���ع���, PE3�����ع���
R = (PE1.*1000)./(Vs.*0.514);%��������
Kt2 = (R./PD_req(:,2).^4)./((1-t)*den*n^2);%������Ҫ������ϵ��
delta_Kt=Kt2-PD_req(:,6);

k=1;
PD_len=length(Kt2)/21;
Vs_req=zeros(PD_len,8);
for i=1:1:PD_len
    Vs_req(i,1) = PD_req(k,1);%��һ�������
    Vs_req(i,2) = PD_req(k,2);%�ڶ���ֱ��
    %�����в�ֵȷ����Ҫ�ĺ���
    Vs_req(i,3) = interp1(delta_Kt(k:k+20,1),PD_req(k:k+20,3),0,'spline'); 
    %�����в�ֵȷ����Ҫ���ݾ�
    Vs_req(i,4) = interp1(delta_Kt(k:k+20,1),PD_req(k:k+20,4),0,'spline');  
    %�����в�ֵȷ����Ҫ��Ч��
    Vs_req(i,5) = interp1(delta_Kt(k:k+20,1),PD_req(k:k+20,5),0,'spline');  
    %�����в�ֵȷ����Ҫ������ϵ��
    Vs_req(i,6) = interp1(delta_Kt(k:k+20,1),PD_req(k:k+20,6),0,'spline');  
    Vs_req(i,7) = PD_req(k,8);%�����м���Ť��ϵ��
    Vs_req(i,8) = 0.514*Vs_req(i,3)*(1-w)/n/Vs_req(i,2);%�ڰ��м������ϵ��
    k=k+21;
end

