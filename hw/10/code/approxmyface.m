%{
MACM 316 HW 10

Name:           Mathew Teoh
Student Number: 301165239
Date:           Nov 20 2014
Email:          mteoh@sfu.ca
%}

% In this script we will approximate my face using the faces of six other
% people 

% get the B matrix
B=zeros(76800,6);
for i=1:6
%     we'll ignore the 1st, 3rd, and 4th outputs
   [imgmtx,imgvec, Nrows, Ncols] = photoInput(['0' num2str(i) '.jpg']);
   B(:,i)=imgvec;
end

% do the QR
[qq,rr]=qr(B,0);

% for i=1:6
%    imgv=B(:,i);
%    figure(100)
%    imagesc(reshape(imgv,[240,320]));colormap('gray') 
% end

% get the "y values" vector. in this case it's the vector form of my face
[imgmtx,y_val, Nrows, Ncols] = photoInput('me.jpg');

%get coeffs for least square fit
coefs=rr\(transpose(qq)*y_val);

% get pic approx
pic_appr_vec = B*coefs;

% picturize it
pic_appr = reshape(pic_appr_vec,[240,320]);

figure(100)
imagesc(pic_appr);colormap('gray')