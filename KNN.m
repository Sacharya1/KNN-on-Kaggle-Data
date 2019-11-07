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
K=5;

k=0;-
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
    U{kkk}= mink(PP(:,i:i+999),K);
    [U{kkk} min_index{kkk}]=mink(PP(:,i:i+999),K);
    Y=cell2mat(min_index);


    
end
Y=cell2mat(min_index)
k=0;
for i=1:K
k=k+1;
if Y(i)>1 && Y(i)<=100
    label(i)=0;
elseif Y(i)>101 && Y(i)<=200
    label(i)=1;
elseif Y(i)>201 && Y(i)<=300
   label(i)=2;
elseif Y(i)>301 && Y(i)<=400
    label(i)=3;
elseif Y(i)>401 && Y(i)<=500
    label(i)=4;
elseif Y(i)>501 && Y(i)<=600
    label(i)=5;
elseif Y(i)>601 && Y(i)<=700
    label(i)=6;
elseif Y(i)>701 && Y(i)<=800
    label(i)=7;
elseif Y(i)>801 && Y(i)<=900
   label(i)=8;
else Y(i)>901 && Y(i)<=1000
   label(i)=9;
    
   G{k}=label(i);

end
end
label
L=mode(label);

% if  Y>1 && Y<=100 || Y>201 && Y<=300 || Y>401 && Y<=500 || Y>601 && Y<=700 || Y>801 && Y<=900
%  NumberIs= 'Even'
% else NumberIs='Odd'
% end
The_input_number_is=L
% format= 'The input number is: %label';
% fprintf(format,label);
