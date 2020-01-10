[filename, pathname] = uigetfile({'*.jpg';'*.png'}, 'select a Leaf Image File');
image = imread([pathname,filename]);

rgb = im2double(image);

r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);
% Implement the conversion equations.
num = 0.5*((r - g) + (r - b));
den = sqrt((r - g).^2 + (r - b).*(g - b));
theta = acos(num./(den + eps));
H = theta;
H(b > g) = 2*pi - H(b > g);
H = H/(2*pi);
num = min(min(r, g), b);
den = r + g + b;
den(den == 0) = eps;
S = 1 - 3.* num./den;
H(S == 0) = 0;
I = (r + g + b)/3;
% Combine all three results into an hsi image.
hsi1 = cat(3, H, S, I);



for j=1:3
k=hsi1(:,:,j);
k1(:,:,j)= histeq(k);
end
H=k1(:,:,1);
S=k1(:,:,2);
figure(),imshow(S);

I=S;

figure(2),imhist(I); 
n=imhist(I); 
N=sum(n); 
max=0; 
for i=1:256
    P(i)=n(i)/N; 
end
for T=2:255      
    w0=sum(P(1:T)); 
    w1=sum(P(T+1:256)); 
    u0=dot([0:T-1],P(1:T))/w0; 
    u1=dot([T:255],P(T+1:256))/w1; 
    sigma=w0*w1*((u1-u0)^2); 
    if sigma>max 
        max=sigma; 
        threshold=T-1; 
    end
end
bw=im2bw(I,threshold/255); 
 BW2 = edge(bw,'canny');
 
 
 figure

subplot(2,2,1)
imshow(I);
title('H&S-Image')

subplot(2,2,3)
imshow(bw);
title('OTSU segmentation')
imwrite(bw,'otsu.png');

subplot(2,2,4)
imshow(BW2);
title('Edge Detection')
imwrite(BW2,'edge.png');
