%{
Name: Mathew Teoh
Student Number: 301165239
Email: mteoh@sfu.ca
Date: Novermber 13th 2014

This code is adapted from Dr. Muraki's bfqrDemo.m file.
%}
clear 
close all

[code, xd, yd, fd, Ncase] = bfDataHW(301165239);

%  make B matrix & plot data (P matrix for plot points)
switch Ncase
	
    case {3}
        % plot already done by the call to bfDataHW
        Bmtx = [xd.^2 xd.*yd yd.^2];
end

%  economy qr
[qq,rr] = qr(Bmtx,0);

%  qr solve for coefficients
coefs = rr \ (transpose(qq)*fd);

%  evaluate curve at data & plot points
bd = Bmtx*coefs;

switch Ncase
	
    case {3}
        hold on;
%         plot3(xd,yd,bd,'r.');
        [X,Y] = meshgrid(-1:0.01:1);
%         manually calculated the z values
        a=coefs(1);
        b=coefs(2);
        c=coefs(3);
        Z=a*X.^2 + b*X.*Y + c*Y.^2;
        mesh(X,Y,Z);
        
        rotatMtx = [a, b/2; b/2 c];
        [V, D] = eig(rotatMtx);
        
        SqEr = (fd-bd).^2;
        aveSqEr = mean(SqEr)
        
        longAx = V(:,1)
        shortAx = V(:,2)
        theta = atan(longAx(2)/longAx(1))+pi
        frac = theta/pi
        
        figure(2);
        hold on
        plot([longAx(1),-longAx(1)],[longAx(2),-longAx(2)],'b-');
        plot([shortAx(1)/2,-shortAx(1)/2],[shortAx(2)/2,-shortAx(2)/2],'r-');
        axis on;
        axis([-1 1 -1 1]);
        title('Orientation of ellipse long (blue) and short (red) axis')
        xlabel('x axis')
        ylabel('y axis')
        
        
        
        
end
