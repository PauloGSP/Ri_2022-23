function [P]=VfromC(t, x, y,z,l,h)
    
    
    if t==0
        x=x-l/2;
        y=y-l/2;
        z=z-h;
         P =   [ 
          x y z
          x y+l z
          x+l y+l z
          x+l y z
          x y h+z
          x y+l h+z
          x+l y+l h+z
          x+l y h+z
          ]';

       P = [P; ones(1,size(P,2))];
    end
    
    if t==1
        x=x;
        y=y-l/2;
        z=z-h;
    
        l=l/2;
        d=l*sqrt(2);
     P =   [ 
          x   y    z
          x+l y+l  z
          x   y+d  z
          x-l y-l  z
          x   y   z
          x+l y+l z
          x   y+d z
          x-l y-l z
          ]';

       P = [P; ones(1,size(P,2))];
       
    end
    if t==2
        l=sin(pi/4)*30;

        smallside=l/2;
        alpha=deg2rad(22.5);
        apoteca=smallside/tan(alpha);

        x=x-apoteca;
        y=y-smallside;
        z=z-h;
   P=[ 
    x                   y                           z;
    x                   y+l                         z;
    x+(l/sqrt(2))       y+l+(l/sqrt(2))             z;
    x+l/sqrt(2)+l       y+l+(l/sqrt(2))             z;
    x+2*(l/sqrt(2))+l   y+l                         z;
    x+2*(l/sqrt(2))+l   y                           z;
    x+l/sqrt(2)+l       y-l/sqrt(2)                 z;
    x+l/sqrt(2)         y-l/sqrt(2)                 z;
    x                   y                           z+h
    x                   y+l                         z+h
    x+(l/sqrt(2))       y+l+(l/sqrt(2))             z+h
    x+l/sqrt(2)+l       y+l+(l/sqrt(2))             z+h
    x+2*(l/sqrt(2))+l   y+l                         z+h
    x+2*(l/sqrt(2))+l   y                           z+h
    x+l/sqrt(2)+l       y-l/sqrt(2)                 z+h
    x+l/sqrt(2)         y-l/sqrt(2)                 z+h

]';
    end
   
end