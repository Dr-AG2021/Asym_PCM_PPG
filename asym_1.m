function w = asym_1 (cz_eeg1)
% This code has been written by Dr. Goshvarpour;
% If you use the code, please cite the following article:
% Atefeh Goshvarpour, Ateke Goshvarpour. Asymmetric Measures of Polar ...
% Chebyshev Chaotic Map for Discrete/Dimensional Emotion Recognition ...
% using PPG. Biomedical Signal Processing & Control. 2024.

 y = cz_eeg1;
q2=1;
for i = 1
    o=1;
    for j=1:8
    y1 = y(o:o+999,i);
    w1(j,:) = cardioid_f (y1);
    o=o+1000;
    end
    w(:,q2:q2+5) = w1;
    q2 =q2+6;
end