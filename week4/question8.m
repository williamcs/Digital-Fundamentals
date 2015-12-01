% For the question 8 problem to compute block matching

img1 = imread('frame_1.jpg');
I1 = double(img1);

img2 = imread('frame_2.jpg');
I2 = double(img2);

% Target block 32*32
B_target = I2(65: 96, 81: 112);

[row1, col1] = size(I1);

min_MAE = inf;	% minmum MAE value
min_r = 0;	% upper-left corner row
min_c = 0;	% upper-left corner column

for ri = 1: row1-31
	for ci = 1: col1-31
		B1 = I1(ri: ri+31, ci: ci+31);
		MAE = mean(mean(abs(B1 - B_target)));
		if MAE < min_MAE
			min_MAE = MAE;
			min_r = ri;
			min_c = ci;
		end
	end
end

fprintf('%d %d %d\n', min_r, min_c, min_MAE);


