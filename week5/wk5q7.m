img_noise = imread('digital-images-week5_quizzes-noisy.jpg');
imgd_noise =  double(img_noise);
imshow(imgd_noise/255);

one_pass = medfilt2(imgd_noise);
imshow(one_pass/255);

second_pass = medfilt2(one_pass);
imshow(second_pass/255);

img_free = imread('digital-images-week5_quizzes-original.jpg');
img_free_double = double(img_free);

MAXI=255;

MSE_noise = mean(mean((img_free_double - imgd_noise).^2));
PSNR_noise = 10 * log10(MAXI^2 / MSE_noise);

MSE_one_pass = mean(mean((img_free_double - one_pass).^2));
PSNR_one_pass = 10 * log10(MAXI^2 / MSE_one_pass);

MSE_second_pass = mean(mean((img_free_double - second_pass).^2));
PSNR_second_pass = 10 * log10(MAXI^2 / MSE_second_pass);

fprintf('%d %d %d\n', PSNR_noise, PSNR_one_pass, PSNR_second_pass);