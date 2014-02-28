close all;
clear all;
clc;
MaxValue = 64;
dir = '..\frequency_count.csv';
M=csvread(dir);




%find all pattern value in column 1 as x, store in C
A = [0,17,34,51,68, 85, 102, 119, 136, 153, 170, 187,204, 221, 238, 255];
B = A;
C = [];
for i=A
    for j=B
       C = [C i*256+j+1]; 
    end
end

%use C as x M(C,2) as y to draw the bar

M1 = M(C,2)/MaxValue;
S = 21760:21780;
set (gcf,'Position',[400,100,1000,400]);
%plot(C,M1,'*');
%scatter(C,M1,5,'fill','r');

%plot(M(:,1),M(:,2)/MaxValue);
%scatter(M(:,1),M(:,2)/MaxValue,5,'fill');
bar(S,M(S,2)/MaxValue);
ylim([0 1]);

xlabel('Decimal Value of Input Message Block');
ylabel('No. of Distinct Tags/ Max No. of Distinct Tags'); 


