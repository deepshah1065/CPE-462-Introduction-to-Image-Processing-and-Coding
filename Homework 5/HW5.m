diary HW5.txt
IMG=imread("Color_Image.jpg");
size(IMG) %Size of (1920 1440 3)
r=zeros(1920,1440); g=zeros(1920,1440); b=zeros(1920,1440);
r=IMG(:,:,1); g=IMG(:,:,2);b=IMG(:,:,3);
Y = (0.299*r)+(0.587*g)+(0.114*b); %Equation based on the slide 34 of Lecture 5
imshow(Y)

diary off 


