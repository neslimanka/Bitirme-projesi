function []=yol_bul(s1)
s2=s1;
 
a = padarray(s1,[2 2]);
imshow(a);
[r,c] = find(a);

n = min(r);

for i=1:length(r)
    if r(i) == n
       break;
    end
end

x = r(i);
y = c(i);

if length(r)>length(c)
    rc = length(r);
else
    rc = length(c);
end

x1 = zeros(0,rc);
y1 = zeros(0,rc);
f = zeros(0,rc);

x1(1) = x;
y1(1) = y;

k = 0;
o = 1;

for i = 2:rc
    
switch (o)
    case 1  % down
    if    a(x+1,y) == 1 %straight
          x1(i) = x+1;
          y1(i) = y;
          a(x+1,y) = 0;
          x = x+1;
          o=1;
          k = k + 1;
          f(k) = 1;
    else if a(x+1,y+1) == 1 %s-left
            x1(i) = x+1;
            y1(i) = y+1;
            a(x+1,y+1) = 0 ;
            x = x+1;
            y = y+1;
            o=2;
            k = k + 1;
            f(k) = 2;
    else if a(x+1,y-1) == 1 %s-right
             x1(i) = x+1;
             y1(i) = y-1;
             a(x+1,y-1) = 0;
             x = x+1;
             y = y-1;
             o=3;
             k = k + 1;
             f(k) = 3;
        else if a(x,y+1) ==  1  %left
                x1(i) = x;
                y1(i) = y+1;a(x,y+1) =  0;
                y = y+1;
                o=4;   
                
        else if a(x,y-1) ==  1  %right
                x1(i) = x;
                y1(i) = y-1;a(x,y-1) =  0;
                y = y-1;
                o=5;
                k = k + 1;
                f(k) = 5;
            end
            end
        end
        end
    end
                
                case 2 % s-left
    if    a(x+1,y+1) == 1 %straight
          x1(i) = x+1;
          y1(i) = y+1;a(x+1,y+1) =  0;
          x = x+1;
          y = y+1;
          o=2;
          k = k + 1;
          f(k) = 1;
          
    else if a(x,y+1) == 1 %s-left
            x1(i) = x;
            y1(i) = y+1;a(x,y+1) = 0;
            y = y+1;
            o =4;
            k = k + 1;
            f(k) = 2;
    
    else if a(x+1,y) == 1 %s-right
             x1(i) = x+1;
             y1(i) = y;a(x+1,y) = 0;
             x = x+1;
             o=1;
             k = k + 1;
             f(k) = 3;
             
        else if a(x-1,y+1) ==  1  %left
                x1(i) = x-1;
                y1(i) = y+1;a(x-1,y+1) =  0;
                x = x-1;
                y = y+1;
                o=6;
                k = k + 1;
                f(k) = 4;
                
        else if a(x+1,y-1) ==  1  %right
                x1(i) = x+1;
                y1(i) = y-1;a(x+1,y-1) =  0;
                x = x+1;
                y = y-1;
                o=3;
                k = k + 1;
                f(k) = 5;
            end
            end
        end
        end
    end
                
    case 3 %s-right
   
    if    a(x+1,y-1) == 1 %straight
          x1(i) = x+1;
          y1(i) = y-1;a(x+1,y-1) = 0;
          x = x+1;
          y = y-1;
          o=3;
          k = k + 1;
          f(k) = 1;
          
    else if a(x+1,y) == 1 %s-left
            x1(i) = x+1;
            y1(i) = y;a(x+1,y) = 0;
            x = x+1;
            o =1;
            k = k + 1;
            f(k) = 2;
    
    else if a(x,y-1) == 1 %s-right
             x1(i) = x;
             y1(i) = y-1; a(x,y-1) = 0;
             y = y-1;
             o=5;
             k = k + 1;
             f(k) = 3;
             
        else if a(x+1,y+1) ==  1  %left
                x1(i) = x+1;
                y1(i) = y+1;a(x+1,y+1) =0;
                x = x+1;
                y = y+1;
                o=4; 
                k = k + 1;
                f(k) = 4;
                
        else if a(x-1,y-1) ==  1  %right
                x1(i) = x-1;
                y1(i) = y-1;a(x-1,y-1) =0;
                x = x-1;
                y = y-1;
                o=7;
                k = k + 1;
                f(k) = 5;
            end
            end
        end
        end
    end
    
    case 4
    %left
    if    a(x,y+1) == 1 %straight
          x1(i) = x;
          y1(i) = y+1;a(x,y+1) =0;
          y = y+1;
          o=4;
          k = k + 1;
          f(k) = 1;
          
    else if a(x-1,y+1) == 1 %s-left
            x1(i) = x-1;
            y1(i) = y+1;a(x-1,y+1) =0;
            x = x-1;
            y = y+1;
            o =6;
            k = k + 1;
            f(k) = 2;
    
    else if a(x+1,y+1) == 1 %s-right
             x1(i) = x+1;
             y1(i) = y+1;a(x+1,y+1) =0;
             x = x+1;
             y = y+1;
             o=2;
             k = k + 1;
             f(k) = 3;
          
        else if a(x-1,y) ==  1  %left
                x1(i) = x-1;
                y1(i) = y;a(x-1,y) =0;
                x = x-1;
                o=8; 
                k = k + 1;
                f(k) = 4;
                
        else if a(x+1,y) ==  1  %right
                x1(i) = x+1;
                y1(i) = y;a(x+1,y) =0;
                x = x+1;
                o=1;
                k = k + 1;
                f(k) = 5;
            end
            end
        end
        end
    end
    
    case 5 % right
    if    a(x,y-1) == 1 %straight
          x1(i) = x;
          y1(i) = y-1;a(x,y-1) =0;
          y = y-1;
          o=5;
          k = k + 1;
          f(k) = 1;
          
    else if a(x+1,y-1) == 1 %s-left
            x1(i) = x+1;
            y1(i) = y-1;a(x+1,y-1) =0;
            x = x+1;
            y = y-1;
            o =3;
            k = k + 1;
            f(k) = 2;
    
    else if a(x-1,y-1) == 1 %s-right
             x1(i) = x-1;
             y1(i) = y-1;a(x-1,y-1) =0;
             x = x-1;
             y = y-1;
             o=7;
             k = k + 1;
             f(k) = 3;
             
        else if a(x+1,y) ==  1  %left
                x1(i) = x+1;
                y1(i) = y;a(x+1,y) =0;
                x = x+1;
                o=1;   
                k = k + 1;
                f(k) = 4;
        else if a(x-1,y) ==  1  %right
                x1(i) = x-1;
                y1(i) = y;a(x-1,y) =0;
                x = x-1;
                o=8;
                k = k + 1;
                f(k) = 5;
            end
            end
        end
        end
    end
    
    
    case 6
        if    a(x-1,y+1) == 1 %straight
          x1(i) = x-1;
          y1(i) = y+1;a(x-1,y+1) =0;
          x = x-1;
          y = y+1;
          o=6;
          k = k + 1;
          f(k) = 1;
    else if a(x-1,y) == 1 %s-left
            x1(i) = x-1;
            y1(i) = y;a(x-1,y) =0;
            x = x-1;
            o =8;
            k = k + 1;
            f(k) = 2;
    
    else if a(x,y+1) == 1 %s-right
             x1(i) = x;
             y1(i) = y+1;a(x,y+1) =0;
             y = y+1;
             o=4;
             k = k + 1;
             f(k) = 3;
          
        else if a(x-1,y-1) ==  1  %left
                x1(i) = x-1;
                y1(i) = y-1;a(x-1,y-1) =0;
                x = x-1;
                y = y-1;
                o=7;   
                k = k + 1;
                f(k) = 4;
          
        else if a(x+1,y+1) ==  1  %right
                x1(i) = x+1;
                y1(i) = y+1;a(x+1,y+1) =0;
                x = x+1;
                y = y+1;
                o=2;
                k = k + 1;
                f(k) = 5;
            end
            end
        end
        end
        end
    
    case 7
        if    a(x-1,y-1) == 1 %straight
          x1(i) = x-1;
          y1(i) = y-1;a(x-1,y-1) =0;
          x = x-1;
          y = y-1;
          o=7;
          k = k + 1;
          f(k) = 1;
    else if a(x,y-1) == 1 %s-left
            x1(i) = x;
            y1(i) = y-1;a(x,y-1) =0;
            y = y-1;
            o =5;
            k = k + 1;
            f(k) = 2;
    
    else if a(x-1,y) == 1 %s-right
             x1(i) = x-1;
             y1(i) = y;a(x-1,y) =0;
             x = x-1;
             o=8;
             k = k + 1;
             f(k) = 3;
             
        else if a(x+1,y-1) ==  1  %left
                x1(i) = x+1;
                y1(i) = y-1;a(x+1,y-1) =0;
                x = x+1;
                y = y-1;
                o=3;   
                k = k + 1;
                f(k) = 4;
          
        else if a(x-1,y+1) ==  1  %right
                x1(i) = x-1;
                y1(i) = y+1;a(x-1,y+1) =0;
                x = x-1;
                y = y+1;
                o=6;
                k = k + 1;
                f(k) = 5;
            end
            end
        end
        end
        end
    
    case 8
        if    a(x-1,y) == 1 %straight
          x1(i) = x-1;
          y1(i) = y;a(x-1,y) =0;
          x = x-1;
          o=8;
          k = k + 1;
          f(k) = 1;
          
    else if a(x-1,y-1) == 1 %s-left
            x1(i) = x-1;
            y1(i) = y-1;a(x-1,y-1) =0;
            x = x-1;
            y = y-1;
            o =7;
            k = k + 1;
            f(k) = 2;
    
    else if a(x-1,y+1) == 1 %s-right
             x1(i) = x-1;
             y1(i) = y+1;a(x-1,y+1) =0;
             x = x-1;
             y = y+1;
             o=6;
             k = k + 1;
             f(k) = 3;
        else if a(x,y-1) ==  1  %left
                x1(i) = x;
                y1(i) = y-1;a(x,y-1) =0;
                y = y-1;
                o=5;   
                k = k + 1;
                f(k) = 4;
          
        else if a(x,y+1) ==  1  %right
                x1(i) = x;
                y1(i) = y+1;a(x,y+1) =0;
                y = y+1;
                o=4;
                k = k + 1;
                f(k) = 5;
             end
            end
          end
        end
        end
end
if mod(i,2)==0
    imshow(a);
end
end
%

x2 = x1';
y2 = y1';
 close all


subplot(2,3,1)   
imshow(s2);
subplot(2,3,2)  
% imshow(a1)
 hold on
 subplot(2,3,2)  
 figure;
 plot(y2,-x2)
filename = 'testdata.xlsx';
xlswrite(filename,f);
end