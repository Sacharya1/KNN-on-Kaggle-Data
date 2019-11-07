% clc
% clean all;
clear all;

% for ImageNo=1:100
prompt= 'Enter the number of Image:';
ImageNo=input(prompt);
Test = sprintf('TestImage%d.jpg',ImageNo);
dd=imread(Test);
YY=double(dd);
imshow(dd);
Train=csvread('FinalTrainSet.csv',0,0);
[rows,cols]=size(Train);

k=0;
for r=1:28:rows
%    for c=1:cols

    M=Train(r:r+27,:);
%     imshow(M);
    M=double(M);
    MM=(M-YY);
    
        k=k+1;
    Dist{k}=MM;
    E_Dist{k}=sum(sum(cell2mat(Dist(k)).^2));
   
end

PP=cell2mat(E_Dist);
[row,col]=size(PP);
kkk=0;
for i=1:1000:col
    kkk=kkk+1;
    U{kkk}= min(PP(:,i:i+999));
    [U{kkk} min_index{kkk}]=min(PP(:,i:i+999));
    Y=cell2mat(min_index);


    
end
Y=cell2mat(min_index)
10


if Y>1 && Y<=100
    label='0'
elseif Y>101 && Y<=200
    label='1'
elseif Y>201 && Y<=300
    label='2'
elseif Y>301 && Y<=400
    label='3'
elseif Y>401 && Y<=500
    label='4'
elseif Y>501 && Y<=600
    label='5'
elseif Y>601 && Y<=700
    label='6'
elseif Y>701 && Y<=800
    label='7'
elseif Y>801 && Y<=900
    label='8'
else Y>901 && Y<=1000
    label='9'
    
    

end

if  Y>1 && Y<=100 || Y>201 && Y<=300 || Y>401 && Y<=500 || Y>601 && Y<=700 || Y>801 && Y<=900
 NumberIs= 'Even'
else NumberIs='Odd'
end
The_input_number_is=label
% format= 'The input number is: %label';
% fprintf(format,label);
