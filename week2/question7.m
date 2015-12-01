% For the question 7 problem

img = imread('digital-images-week2_quizzes-lena.gif');
imgd =  double(img); %im2double(img); %double(img);
f = ones(3, 3) / 9;
img2 = imfilter(imgd, f,  'replicate');
MSE = mean(mean((imgd - img2).^2));
MAXI=255;
PSNR = 10 * log10(MAXI^2 / MSE);
imshow(img);
%imshow(img2);

f1 = ones(5, 5) / 25;
img3 = imfilter(imgd, f1,  'replicate');
MSE1 = mean(mean((imgd - img3).^2));
PSNR1 = 10 * log10(MAXI^2 / MSE1);