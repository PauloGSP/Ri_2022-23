function [P,F]=Cyl(x,y,z,l,h)

%function capable of making a octagonal prism

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

F=[
    1 2 10 9 9 9 9 9 
    1 8 16 9 9 9 9 9 
    7 8 16 15 15 15 15 15 
    6 7 15 14 14 14 14 14 
    5 6 14 13 13 13 13 13 
    4 5 13 12 12 12 12 12 
    3 4 12 11 11 11 11 11 
    2 3 11 10 10 10 10 10 
    1 2 3 4 5 6 7 8
    9 10 11 12 13 14 15 16


    
];
   P = [P; ones(1,size(P,2))];


end

