%{
MACM 316 Homework 10

Name:           Mathew Teoh
Student Number: 301165239
Date:           Nov 20th 2014
Email:          mteoh@sfu.ca
%}

load photo_set.mat

% get the B matrix
B=zeros(76800,6);
for i=1:6
    B(:,i)=reshape(ph_shoot(:,(240*i-239):240*i),[76800,1]);
end

% do the QR
[qq,rr]=qr(B,0);

% get the "y values" ie the 7th picture
y_val = reshape(ph_check,[76800,1]);

%get coeffs for least square fit
coefs=rr\(transpose(qq)*y_val);

% get pic approx
pic_appr_vec = B*coefs;

% picturize it
pic_appr = reshape(pic_appr_vec,[320,240]);

figure(100)
imagesc(pic_appr);colormap('gray')