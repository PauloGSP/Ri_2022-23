function [C1top,C1bot, C2top,C2bot,C3top,C3Big] = CreatePieces

%creates the needed pieces and returns their patch object


C1botH=50;
C1botL=100;
C1botx=-1400;
C1boty=-752.5000-C1botL/2;
C1topH= 150;
C1topL=24*sqrt(2);
HolePos1=0;
HolePosy=C1boty+26;
HolePosx=C1botx+C1botL/2;


C2botH=50;
C2BotL=70;
C2botx=-550-35;
C2boty=1300-C2BotL/2;
C2topH= C2botH;
C2topL=24*sqrt(2);
HolePosy2=C2boty+11;
HolePosx2=C2botx+C2BotL/2;

Radius= 30;
ActualC3Side=sin(pi/4)*Radius;
C3H=50;
C3Ymove=1300-ActualC3Side/2;
C3Xmove=-((ActualC3Side/sqrt(2))+ActualC3Side/2)+340;

HolePosy3=C3Ymove;
HolePosx3=C3Xmove;


[C2BP,FPI]= Paralel(C2botx, C2boty,0,C2BotL,C2botH );
C2bot=patch('XData', C2botx,'YData', C2boty,'Vertices', C2BP(1:3,:)', 'Faces', FPI, 'FaceColor', 'g');

[C2TP,FPI]= Paralel( HolePos1,  HolePos1,0,C2topL,C2topH );
C2top=patch('XData',  HolePos1,'YData',  HolePos1,'Vertices', C2TP(1:3,:)', 'Faces', FPI, 'FaceColor', 'w');

[C3BP, FCI]= Cyl(C3Xmove,C3Ymove,0,ActualC3Side,C3H);
C3Big= patch('XData', C3Xmove,'YData', C3Ymove,'Vertices', C3BP(1:3,:)', 'Faces', FCI, 'FaceColor', 'g');

[C3TP,FPI]= Paralel( HolePos1,  HolePos1,0,C1topL,C3H );
C3top=patch('XData',  0,'YData',  0,'Vertices', C3TP(1:3,:)', 'Faces', FPI, 'FaceColor', 'w');

[C1BP,FPI]= Paralel(C1botx+2.3020, C1boty-77.2738-15,0,C1botL,C1botH );
C1bot=patch('XData', C1botx,'YData', C1botx,'Vertices', C1BP(1:3,:)', 'Faces', FPI, 'FaceColor', 'g');

[C1TP,FPI]= Paralel( HolePos1,  HolePos1,50,C1topL,C1topH );
C1top=patch('XData',  HolePos1,'YData',  HolePos1,'Vertices', C1TP(1:3,:)', 'Faces', FPI, 'FaceColor', 'r');

rotate(C1top, [0 0 1], 45);
rotate(C2top, [0 0 1], 45);
rotate(C3top, [0 0 1], 45);

% place in proper coordiates
C1bot.Vertices(:,3)=C1bot.Vertices(:,3)+560;
C1top.Vertices(:,2)=C1top.Vertices(:,2)+HolePosy-77.2738-15;
C1top.Vertices(:,1)=C1top.Vertices(:,1)+HolePosx+2.3020;
C1top.Vertices(:,3)=C1top.Vertices(:,3)+560;

C2bot.Vertices(:,3)=C2bot.Vertices(:,3)+560;
C2top.Vertices(:,2)=C2top.Vertices(:,2)+HolePosy2;
C2top.Vertices(:,1)=C2top.Vertices(:,1)+HolePosx2;
C2top.Vertices(:,3)=C2top.Vertices(:,3)+560;
           
C3Big.Vertices(:,3)=C3Big.Vertices(:,3)+560;
C3top.Vertices(:,3)=C3top.Vertices(:,3)+560;
C3top.Vertices(:,2)=C3top.Vertices(:,2)-83+HolePosy3-11.7864-3.2136/2;
C3top.Vertices(:,1)=C3top.Vertices(:,1)+HolePosx3+25.6068+210;
C3Big.Vertices(:,1)=C3Big.Vertices(:,1)+210;


C3Big.Vertices(:,2)=C3Big.Vertices(:,2)-83;

end

