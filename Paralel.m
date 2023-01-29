function [P,F]=Paralel( x, y,z,l,h)

    %Depending if option is 1 or 2 creates a parallelepiped figure
    % If it is 1 it creates a regular 3d parallelepiped
    % If it is 2 it creates a plane 
    % Returns points and faces
    
    
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