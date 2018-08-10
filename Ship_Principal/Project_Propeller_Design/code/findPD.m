function PD_req = findPD(Result, Q, den, n)
%��ĳ��������ֱ����, ͨ����ֵȷ��������ƹ���Ҫ�󣨼���������
%Ҫ���Ť������ƹ�����ת���µ��յ�ת��ƽ�⣩���ݾ༰��Ӧ����Ч����
%�볨ˮЧ��)
%����:Result
%     �������յ�ת��D, ��ˮ�ܶ�den, ������ת��n
%���:ÿ��������ֱ���º��ʵ��ݾ��PD
k=1;
PD_req=zeros(length(Result)/13,8);
for i=1:1:length(Result)/13
    Kq_req=Q/(den*n^2*Result(k,2)^5);%������Ҫ���Ť��
    PD_req(i,1)=Result(k,1);%�̶������
    PD_req(i,2)=Result(k,2);%�̶�ֱ��
    PD_req(i,3)=Result(k,3);%�̶�����
    %��Ť��ϵ����ֵ�õ��ݾ��
    PD_req(i,4)=interp1(Result(k:k+12,7),Result(k:k+12,5),Kq_req,'spline');
    %��Ť��ϵ����ֵ�õ���ˮЧ��
    PD_req(i,5)=interp1(Result(k:k+12,7),Result(k:k+12,8),Kq_req,'spline');
    %��Ť��ϵ����ֵ�õ�����ϵ��
    PD_req(i,6)=interp1(Result(k:k+12,7),Result(k:k+12,6),Kq_req,'spline');
    %������ϵ�����������Ч����
    PD_req(i,7)=PD_req(i,6)*den*n^2*Result(k,2)^4;
    PD_req(i,8)=Kq_req;%��ӦŤ��ϵ��
    k=k+13;
end

