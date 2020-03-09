function []=BT()
s2 = Bluetooth('HC-06',1);
fopen(s2)
[num,txt,raw] = xlsread('testdata.xlsx')

for i=1 : length(raw)
 
    if cell2mat(raw(i))==1
       fwrite(s2,'F');
    end
if cell2mat(raw(i))==2
       
    fwrite(s2,'R');
           pause(0.01)

   while  fscanf(s2,'%s')~='a'
   end
end
if cell2mat(raw(i))==4
       fwrite(s2,'R');
           pause(0.01)

       while  fscanf(s2,'%s')~='a'
end
end
    if cell2mat(raw(i))==3
         
       fwrite(s2,'L');
           pause(0.01)
      while  fscanf(s2,'%s')~='a'
      end
    end 
     if cell2mat(raw(i))==5
       fwrite(s2,'L');
           pause(0.01)
    while  fscanf(s2,'%s')~='a'
end
     end
     
     pause(0.01)
     
end
fclose(s2)
clc; 
close all; 
clear all;
end