function output = findD(Vs_req)
%��ֵ������ٶȶ�Ӧ��ֱ��%
k=1;
output=zeros(length(Vs_req)/21,8);
for i=1:length(Vs_req)/21
    for j=1:10001
        d=0.0001*j+7.4999;
        v(i,j)=interp1(Vs_req(k:k+20,2),Vs_req(k:k+20,3),d,'spline');
    end
        vmax1=max(v');
        vmax=vmax1(1,i);
        d_max=interp1(Vs_req(k:k+20,3),Vs_req(k:k+20,2),vmax,'spline');
        output(i,1)=Vs_req(k,1);        %v_d��һ��Ϊ�����
        output(i,2)=d_max;           %�ڶ�����ֱ������ֵ
        output(i,3)=vmax;            %���������ٶ����ֵ
        output(i,4)=interp1(Vs_req(k:k+20,3),Vs_req(k:k+20,4),vmax,'spline');%������Ϊ�ݾ�
        output(i,5)=interp1(Vs_req(k:k+20,3),Vs_req(k:k+20,5),vmax,'spline');%������ΪЧ��
        output(i,6)=interp1(Vs_req(k:k+20,3),Vs_req(k:k+20,6),vmax,'spline');%������Ϊ����ϵ��
        output(i,7)=interp1(Vs_req(k:k+20,3),Vs_req(k:k+20,7),vmax,'spline');%������ΪŤ��ϵ��
        output(i,8)=interp1(Vs_req(k:k+20,3),Vs_req(k:k+20,8),vmax,'spline');%�ڰ���Ϊ����ϵ��
        k=k+21;
end

end

