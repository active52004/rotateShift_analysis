close all;
clear all;
clc;
MaxValue = 64;
dir = '..\frequency_count.csv';
M=csvread(dir);

%{
%find all pattern value in column 1 as x, store in C
A = [0,17,34,51,68, 85, 102, 119, 136, 153, 170, 187,204, 221, 238, 255];
X = 0:255;
%B = A;
%Both no-pattern
B = setdiff(X,A);
D = B;
C = [];
for i=D
    for j=B
       C = [C i*256+j+1]; 
    end
end
M1 = M(C,2)/MaxValue;
scatter(C,M1,10,'o','b');
%Both pattern
hold on
C=[];
B = A;
for i=A
    for j=B
       C = [C i*256+j+1]; 
    end
end
M1 = M(C,2)/MaxValue;
scatter(C,M1,5,'fill','r');
%pattern and no-pattern
hold on
C=[];
B = setdiff(X,A);
for i=A
    for j=B
       C = [C i*256+j+1]; 
    end
end

for i=B
    for j=A
       C = [C i*256+j+1]; 
    end
end
M1 = M(C,2)/MaxValue;
scatter(C,M1,5,'v','g');
%use C as x M(C,2) as y to draw the bar
legend('Both no-pattern','Both pattern', 'Pattern and no-pattern')



set (gcf,'Position',[400,100,1000,400]);
%plot(C,M1,'*');
scatter(C,M1,5,'fill','g');

%plot(M(:,1),M(:,2)/MaxValue);
%scatter(M(:,1),M(:,2)/MaxValue,5,'fill');
%}


%xlabel('Decimal Value of Input Message Block');


S = 21998:22020;
B_S = dec2bin(S);

%B_S(1,:)

bar(S,M(S+1,2)/MaxValue)
x=S(1);
y=M(S(1)+1,2);
%text(x,y,'\leftarrow0101010111101110');
%set the x axis

s_1=S(1):5:S(length(S));
bs1=dec2bin(s_1,16);
set(gca,'XTick',s_1,'XTickLabel',bs1);
h = gca;
rotateticklabel(gca,'x',20);
ylim([0 1]);

ylabel('No. of Distinct Tags/ Max No. of Distinct Tags');






