function ConfigEnv
% This function is responsible for creating the mats and their marks for
% piece stopage
    


%mats
[PP,FPI]= MakeMat(-1540, -1065,0,625,2560,560 );
TapeteB=patch( 'Vertices', PP(1:3,:)', 'Faces', FPI, 'FaceColor', '#dbcfce');

[PP,FPI]= MakeMat(-755, 370,0,1250,550,560 );
TapeteP1=patch( 'Vertices', PP(1:3,:)', 'Faces', FPI, 'FaceColor', '#dbcfce');

[PP,FPI]= MakeMat(205, 370,0 ,1250,550,560 );
TapeteP2=patch( 'Vertices', PP(1:3,:)', 'Faces', FPI, 'FaceColor', '#dbcfce');


%lines
[PP,FPI]= MakeMat(-205-550, 403,0,30,550,560 );
lineA=patch( 'Vertices', PP(1:3,:)', 'Faces', FPI, 'FaceColor', '#FFFFFF');

[PP,FPI]= MakeMat(755-550, 403,0,30,550,560 );
lineA=patch( 'Vertices', PP(1:3,:)', 'Faces', FPI, 'FaceColor', 'r');

[PP,FPI]= MakeMat(-10, -1065,0,625,20,560 );
center=patch( 'Vertices', PP(1:3,:)', 'Faces', FPI, 'FaceColor', 'y');

[PP,FPI]= MakeMat(-565, -1065,0,625,30,560 );
lineA=patch( 'Vertices', PP(1:3,:)', 'Faces', FPI, 'FaceColor', 'g');

[PP,FPI]= MakeMat(325, -1065,0,625,30,560 );
lineB=patch( 'Vertices', PP(1:3,:)', 'Faces', FPI, 'FaceColor', 'b');

end

