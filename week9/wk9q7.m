%img_origin = imread('Cameraman256.bmp');
%img_origin_double = double(img_origin);
%imwrite(img_origin, 'img_new.jpg', 'jpg', 'quality', 75);
%img_new = imread('img_new.jpg');
%img_new_double = double(img_new);

%MAXI=255;

%MSE = mean(mean((img_new_double - img_origin_double).^2));
%PSNR = 10 * log10(MAXI^2 / MSE);

function psnr = wk9q7(filename, img_new_name, quality_level)
	img_origin = imread(filename);
	img_origin_double = double(img_origin);
	imwrite(img_origin, img_new_name, 'jpg', 'quality', quality_level);
	
	img_new = imread(img_new_name);
	img_new_double = double(img_new);
	MAXI=255;

	MSE = mean(mean((img_new_double - img_origin_double).^2));
	psnr = 10 * log10(MAXI^2 / MSE);
end