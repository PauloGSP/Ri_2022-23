function [P,F]=MakeMat( x, y,z,l,w,h)

    %Basically is same as the paralel function but it is capable of making
    %a rectangle
    
    
    P =   [ 
          x y z
          x+w y z
          x+w y+l z
          x y+l z
          x y z+h
          x+w y z+h
          x+w y+l z+h
          x y+l z+h
          ]';
   
   F =  [
        1 2 3 4
        5 6 7 8
        1 2 6 5
        3 4 8 7
        1 4 8 5
        2 3 7 6
        ];

   P = [P; ones(1,size(P,2))];
   

end