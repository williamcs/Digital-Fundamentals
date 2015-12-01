clear all
close all

%% Simulate 1-D blur and noise
image_original = im2double(imread('Cameraman256.bmp', 'bmp'));
[H, W] = size(image_original);
blur_impulse = fspecial('motion', 7, 0);
image_blurred = imfilter(image_original, blur_impulse, 'conv', 'circular');
noise_power = 1e-4;
randn('seed', 1);
noise = sqrt(noise_power) * randn(H, W);
image_noisy = image_blurred + noise;

figure; imshow(image_original, 'border', 'tight');
figure; imshow(image_blurred, 'border', 'tight');
figure; imshow(image_noisy, 'border', 'tight');

%% CLS restoration
alpha = 1;  % you should try different values of alpha
image_cls_restored = cls_restoration(image_noisy, blur_impulse, alpha);
figure; imshow(image_cls_restored, 'border', 'tight');

%% computation of ISNR
% ...
alpha_array = [0.0001, 0.001, 0.01, 0.1, 1, 10, 100];
isnr_array = zeros(1, size(alpha_array, 2));

noisy_snr = sum(sum((image_original - image_noisy).^ 2));

for i = 1: size(alpha_array, 2)
	image_cls_restored = cls_restoration(image_noisy, blur_impulse, alpha_array(i));
	restored_snr = sum(sum((image_original - image_cls_restored).^ 2));
	isnr_array(i) = 10 * log10(noisy_snr / restored_snr);
end

fprintf('largest ISNR value is %d\n', max(isnr_array));


