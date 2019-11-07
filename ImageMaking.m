clc 
clear all;


M=csvread('FinalTestSet.csv',0,0);
[rows, cols]=size(M);

k=0;
for i=1:28:2800
    k=k+1;
    F=(M(i:i+27,:));
    HH=imshow(F);
%      name='TestImage_%d.jpg'
%     imwrite(F, name);

currentFile = sprintf('TestImage%d.jpg',k);
   imwrite(F,currentFile)


end
