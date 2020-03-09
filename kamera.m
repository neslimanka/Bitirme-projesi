function []=kamera()
cam=webcam(2);

c=snapshot(cam);
b=im2bw(c,0.70); 
% b=b>0.95;
imshow(b);

imwrite(b,'m.png')
clear cam
end