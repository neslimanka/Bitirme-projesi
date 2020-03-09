function []=labirent_coz()
clc; 
close all; 
clear all;
dilationAmount = 120; 
	originalImage = imread('maze1 (2).png');
	[rows cols numberOfColorBands] = size(originalImage);
	if numberOfColorBands > 1
		redPlane = originalImage(:, :, 1);
		greenPlane = originalImage(:, :, 2);
		bluePlane = originalImage(:, :, 3);
		redStdDev = std(single(redPlane(:)));
		greenStdDev = std(single(greenPlane(:)));
		blueStdDev = std(single(bluePlane(:)));
		if redStdDev >= greenStdDev && redStdDev >= blueStdDev
			monoImage = single(redPlane);
		elseif greenStdDev >= redStdDev && greenStdDev >= blueStdDev
			monoImage = single(greenPlane);
        else
			monoImage = single(bluePlane);
		end
	else
		monoImage = single(originalImage);
    end
	subplot(4, 4, 1);
	imshow(monoImage, []);
	title('Original Image');
	set(gcf, 'Position', get(0,'Screensize'));
	maxValue = max(max(monoImage));
	minValue = min(min(monoImage));
	monoImage = uint8(255 * (single(monoImage) - minValue) / (maxValue - minValue));
	thresholdValue = uint8((maxValue + minValue) / 2);
	binaryImage = 255 * (monoImage < thresholdValue);
	subplot(4, 4, 2);
	imshow(binaryImage, []);
	title('Binary Image - The walls are white here, instead of black');
	[labeledImage numberOfWalls] = bwlabel(binaryImage, 4);     
    coloredLabels = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); 
	subplot(4, 4, 3);
	imshow(coloredLabels); 
	caption = sprintf('Labeled image of the %d walls, each a different color', numberOfWalls);
	title(caption);
	binaryImage2 = (labeledImage == 1);
	subplot(4, 4, 4);
	imshow(binaryImage2, []);
	title('One of the walls');
	dilatedImage = imdilate(binaryImage2, ones(dilationAmount));
	subplot(4, 4, 5);
	imshow(dilatedImage, []);
	title('Dilation of one wall');
	filledImage = imfill(dilatedImage, 'holes');
	subplot(4, 4, 6);
	imshow(filledImage, []);
	title('Now filled to get rid of holes');
	erodedImage = imerode(filledImage, ones(dilationAmount));
	subplot(4, 4, 7);
	imshow(erodedImage, []);
	title('Eroded');
	solution = filledImage;
	solution(erodedImage) = 0;
	subplot(4, 4, 8);
	imshow(solution, []);
	title('The Difference = The Solution');
I =solution;
I3 = flipdim(I ,1);           %# horizontal flip    
  
mirrorImage =  flipdim(I3 ,2);      %# horizontal+vertical flip   
enterline = 3; 
    figure;
	subplot(4, 4, 1);
	imshow(mirrorImage, []);
	title('Original Image');
	set(gcf, 'Position', get(0,'Screensize'));
	maxValue0 = max(max(mirrorImage));
	minValue0 = min(min(mirrorImage));
	mirrorImage = uint8(255 * (single(mirrorImage) - minValue0) / (maxValue0 - minValue0));
	thresholdValue0 = uint8((maxValue0 + minValue0) / 2);
	binaryImage0 = 255 * (mirrorImage < thresholdValue0);
	subplot(4, 4, 2);
	imshow(binaryImage0, []);
	title('Binary Image - The walls are white here, instead of black');
	[labeledImage0, numberOfWalls0] = bwlabel(binaryImage0, 4);     
    coloredLabels0 = label2rgb (labeledImage0, 'hsv', 'k', 'shuffle'); 
	subplot(4, 4, 3);
	imshow(coloredLabels0); 
	caption0 = sprintf('Labeled image of the %d walls, each a different color', numberOfWalls0);
	title(caption0);
	binaryImage20 = (labeledImage0 == 1);
	subplot(4, 4, 4);
	imshow(binaryImage20, []);
	title('One of the walls');
	dilatedImage0 = imdilate(binaryImage20, ones(enterline));
	subplot(4, 4, 5);
	imshow(dilatedImage0, []);
	title('Dilation of one wall');
	filledImage0 = imfill(dilatedImage0, 'holes');
	subplot(4, 4, 6);
	imshow(filledImage0, []);
	title('Now filled to get rid of holes');
	erodedImage0 = imerode(filledImage0, ones(enterline));
	subplot(4, 4, 7);
	imshow(erodedImage0, []);
	title('Eroded');
	solution0 = filledImage0;
	solution0(erodedImage0) = 0;
	subplot(4, 4, 8);
    I = solution0;
I2 = flipdim(I ,2);           %# horizontal flip
I3 = flipdim(I ,1);           %# vertical flip    
    againmirror = flipdim(I3 ,2);    %# horizontal+vertical flip

    		redPlane = monoImage;
		greenPlane = monoImage;
		bluePlane = monoImage;
       	imshow(againmirror, []);
	title('The Difference = The Solution');
  	redPlane(againmirror) = 255;
    figure;
    imshow(redPlane);
	greenPlane(againmirror) = 0;
	bluePlane(againmirror) = 0;
	solvedImage = cat(3, redPlane, greenPlane, bluePlane);
    imshow(solvedImage);

yol_bul(againmirror);
end

