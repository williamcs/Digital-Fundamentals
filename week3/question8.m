% For the question 8 problem

img = imread('digital-images-week3_quizzes-original_quiz.jpg');
imgd =  double(img);
f = ones(3, 3) / 9;
img2 = imfilter(imgd, f,  'replicate');
img3 = img2(1: 2: end, 1: 2: end);
Z = zeros(359, 479);

for i = 1: 2: 359
	for j = 1: 2: 479
		Z(i, j) = img3((i+1)/2, (j+1)/2);
	end
end

f2 = [0.25,0.5,0.25;0.5,1,0.5;0.25,0.5,0.25];
img4 = imfilter(Z, f2);

MSE = mean(mean((imgd - img4).^2));
MAXI=255;
PSNR = 10 * log10(MAXI^2 / MSE);
