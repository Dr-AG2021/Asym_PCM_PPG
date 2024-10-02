% This code has been written by Dr. Goshvarpour;
% If you use the code, please cite the following article:
% Atefeh Goshvarpour, Ateke Goshvarpour. Asymmetric Measures of Polar ...
% Chebyshev Chaotic Map for Discrete/Dimensional Emotion Recognition ...
% using PPG. Biomedical Signal Processing & Control. 2024.
% Test_1 read the PPG data. Then, it recall another funtion (asym_1) to ...
% process the signal. Finally, save the features in "W1_T" matrix.

clc; close all; clear all;
tic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

oo=1;
for q = 1:9
    o=1; 
    s = ['load E:\s0' int2str(q) ];eval (s);
for qq = 1:40
for j = 1
    m=39;
    y1 = data(qq,m,:);
    y2(1:8064,j) = y1(:);
end

        s = ['w1_' int2str(qq) ' = asym_1 (y2);'];eval (s);
        s = ['W1_T' int2str(q) '(o:o+7, :) = w1_' int2str(qq) ';'];eval (s);
        o = o+8;
end
    s = ['W1_T(oo:oo+319, :) = W1_T' int2str(q) ';'];eval (s);
    oo=oo+320;
    q
end
%save W1_T W1_T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for q = 10:28
    o=1; 
    s = ['load E:\s' int2str(q) ];eval (s);
for qq = 1:40
for j = 1
    m=39;
    y1 = data(qq,m,:);
    y2(1:8064,j) = y1(:);
end

        s = ['w1_' int2str(qq) ' = asym_1 (y2);'];eval (s);
        s = ['W1_T' int2str(q) '(o:o+7, :) = w1_' int2str(qq) ';'];eval (s);
        o = o+8;
end
    s = ['W1_T(oo:oo+319, :) = W1_T' int2str(q) ';'];eval (s);
    oo=oo+320;
    q
end
for q = 29:32
    o=1; 
    s = ['load E:\s' int2str(q) ];eval (s);
for qq = 1:40
for j = 1
    m=39;
    y1 = data(qq,m,:);
    y2(1:8064,j) = y1(:);
end

        s = ['w1_' int2str(qq) ' = asym_1 (y2);'];eval (s);
        s = ['W1_T' int2str(q) '(o:o+7, :) = w1_' int2str(qq) ';'];eval (s);
        o = o+8;
end
    s = ['W1_T(oo:oo+319, :) = W1_T' int2str(q) ';'];eval (s);
    oo=oo+320;
    q
end
save W1_T W1_T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 toc