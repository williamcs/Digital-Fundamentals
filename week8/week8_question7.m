img = imread('Cameraman256.bmp');
img = double(img);

p = zeros(1, 256);

for i = 1: size(img, 1)
	for j = 1: size(img, 2)
		p(img(i, j) + 1) = p(img(i, j) + 1) + 1;
	end
end

% normalize the probability
p = p/(size(img, 1)*size(img, 2));

% Make mask to eliminate 0's since log2(0) = -inf.
i = find(p);

H = -sum(p(i).*log2(p(i)))
