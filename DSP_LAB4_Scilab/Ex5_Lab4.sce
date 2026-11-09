clc;
clear;
close;

// Doc anh
img = imread("input.png");

// Chuyen sang anh xam
gray = rgb2gray(img);

// Tinh histogram ban dau
H1 = imhist(gray);

// Histogram Equalization
CDF = cumsum(H1);
CDF = CDF / CDF($);
LUT = uint8(round(255 * CDF));
equalized = LUT(double(gray) + 1);

// Tao bo loc trung binh 5x5
kernel = fspecial("average", 5);

// Lam mo anh
blurred = imfilter(img, kernel);

// Hien thi ket qua
figure();

subplot(2,2,1);
imshow(gray);
title("Original Image");

subplot(2,2,2);
imshow(equalized);
title("Histogram Equalization");

subplot(2,2,3);
plot(0:255, H1');
title("Original Histogram");
xlabel("Gray Level");
ylabel("Pixel Count");

subplot(2,2,4);
imshow(blurred);
title("Blurred Image");
