function feat = cardioid_f(X1)
% This code has been written by Dr. Goshvarpour;
% If you use the code, please cite the following article:
% Atefeh Goshvarpour, Ateke Goshvarpour. Asymmetric Measures of Polar ...
% Chebyshev Chaotic Map for Discrete/Dimensional Emotion Recognition ...
% using PPG. Biomedical Signal Processing & Control. 2024.


a = zscore(X1'); a = normalize_1(a);
L = length(a);k = 1:L;
%%%%%%%%%%%%%%%%%%%%%%%%%%% Polar chebychev %%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:L 
    ro2 =  cos(k.*acos(a(k)));
    X2(i) = ( ro2(i) * (cos(a(i))));
    Y2(i) = (ro2(i) * (sin(a(i))));
end


y1 = X2; y2 = Y2;
%%%%%%%%%%%%%%%%%%%%%%% Symmetric evaluations:
q1 = find(y1>0 & y2>0); nb1 = length(q1);
q2 = find(y1<0 & y2>0); nb2 = length(q2);
q3 = find(y1<0 & y2<0); nb3 = length(q3);
q4 = find(y1>0 & y2<0); nb4 = length(q4);

nn1 = (nb1+nb2);nn2 = (nb3-nb4);
nn3 = (nb1+nb4);nn4 = (nb2+nb3);
a1 = abs(nn1-nn2);a2 = abs(nn3-nn4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1q1 = y1(q1); y2q1 = y2(q1);
y1q2 = y1(q2); y2q2 = y2(q2);
y1q3 = y1(q3); y2q3 = y2(q3);
y1q4 = y1(q4); y2q4 = y2(q4);

%%%%%%%%%%%%%%%%%
qq1=isinf(y1q1);y1q1(qq1)=[];
qq1=isinf(y1q2);y1q2(qq1)=[];
qq1=isinf(y1q3);y1q3(qq1)=[];
qq1=isinf(y1q4);y1q4(qq1)=[];

qq1=isinf(y2q1);y2q1(qq1)=[];
qq1=isinf(y2q2);y2q2(qq1)=[];
qq1=isinf(y2q3);y2q3(qq1)=[];
qq1=isinf(y2q4);y2q4(qq1)=[];
n1 = length(y1q1);
n2 = length(y1q2);
n3 = length(y1q3);
n4 = length(y1q4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for k = 1:n1
    m_1(k) = sqrt(y1q1(k)^2+y2q1(k)^2);
end
mq1 = sum(m_1);
%%%%%%%%%%%%%%%%%%%%

for k = 1:n2
    m_2(k) = sqrt(y1q2(k)^2+y2q2(k)^2);
end
mq2 = sum(m_2);

%%%%%%%%%%%%%%%%%%%%

for k = 1:n3
    m_3(k) = sqrt(y1q3(k)^2+y2q3(k)^2);
end
mq3 = sum(m_3);

%%%%%%%%%%%%%%%%%%%%

for k = 1:n4
    m_4(k) = sqrt(y1q4(k)^2+y2q4(k)^2);
end
mq4 = sum(m_4);

d1 = abs(mq1+mq2-mq3-mq4);d2=abs(mq1+mq4-mq2-mq3); %distance to x-axis & y-axis

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Angle%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%p_1(1)=0;
for k = 1:n1
    p_1(k) = atan2(y2q1(k),y1q1(k));
end
tq1 = sum(p_1);
%%%%%%%%%%%%%%%%%%%%

for k = 1:n2
    p_2(k) = atan2(y2q2(k),y1q2(k));
end
tq2 = sum(p_2);

%%%%%%%%%%%%%%%%%%%%

for k = 1:n3
    p_3(k) = atan2(y2q3(k),y1q3(k));
end
tq3 = sum(p_3);

%%%%%%%%%%%%%%%%%%%%

for k = 1:n4
    p_4(k) = atan2(y2q4(k),y1q4(k));
end
tq4 = sum(p_4);

t1 = abs(tq1+tq2-tq3-tq4);t2=abs(tq1+tq4-tq2-tq3); %Angle to x-axis & y-axis
% % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
feat = [a1,a2,d1,d2,t1,t2];