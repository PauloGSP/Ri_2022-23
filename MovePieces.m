function MovePieces(type,C1top,C1bot, C2top,C2bot,C3top,C3Big,t)

%animates the pieces using while loops for easier implementation

n=0;
%move all pieces to 1st line
if type==0
    while n<800
            
        C1top.Vertices(:,1)=C1top.Vertices(:,1)+1;
        C1bot.Vertices(:,1)=C1bot.Vertices(:,1)+1;
        
        C2top.Vertices(:,2)=C2top.Vertices(:,2)-1.1025;
        C2bot.Vertices(:,2)=C2bot.Vertices(:,2)-1.1025;
        C3top.Vertices(:,2)=C3top.Vertices(:,2)-1;
        C3Big.Vertices(:,2)=C3Big.Vertices(:,2)-1;
        
        pause(0.002)
        n=n+1;
    end

elseif type==1

        objx= -521.2132;
        objy= -781.2868;
        tmx=20.3838/100;
        tmy=-24.9518/100;
        nt=t(1,:);
        C2BP= VfromC(0,nt(1)+tmx, nt(2)+tmy,nt(3),70,50 );
        C2tP= VfromC(1,nt(1), nt(2),nt(3),24*sqrt(2),50 );
        
        C=C2BP(1:3,:)';
        Ct=C2tP(1:3,:)';
        C2top.Vertices(:,1)=Ct(:,1)+24*sqrt(2)/2;
        C2top.Vertices(:,2)=Ct(:,2);
        C2top.Vertices(:,3)=Ct(:,3);
        C2bot.Vertices(:,1)=C(:,1)+tmx;
        C2bot.Vertices(:,2)=C(:,2)+tmy;
        C2bot.Vertices(:,3)=C(:,3);



elseif type==3
     nt=t(1,:);
    C3TP= VfromC(2,nt(1), nt(2),nt(3),70,50 );
    Ct=C3TP(1:3,:)';

        C3Big.Vertices(:,1)=Ct(:,1);
        C3Big.Vertices(:,2)=Ct(:,2);
        C3Big.Vertices(:,3)=Ct(:,3);
        C3top.Vertices(:,3)=C3top.Vertices(:,3)+1000000;
else
%move 1st step of final piece to second line

n=0;
%move 2nd component
while n<201
    C3top.Vertices(:,3)=C3top.Vertices(:,3)+1;
    C3Big.Vertices(:,3)=C3Big.Vertices(:,3)+1;
    pause(0.002)
    
    n=n+1;
end
n=0;
while n<1252
    C3top.Vertices(:,2)=C3top.Vertices(:,2)-1;
    C3Big.Vertices(:,2)=C3Big.Vertices(:,2)-1;
    pause(0.002)
    n=n+1;
end
    C3top.Vertices(:,2)=C3top.Vertices(:,2)-0.5;
    C3Big.Vertices(:,2)=C3Big.Vertices(:,2)-0.5;
n=0;
while n<101
    C3top.Vertices(:,3)=C3top.Vertices(:,3)-1;
    C3Big.Vertices(:,3)=C3Big.Vertices(:,3)-1;
    pause(0.002)
    n=n+1;
end
delete(C3top);
%finish up
while n<695
    C1top.Vertices(:,1)=C1top.Vertices(:,1)+1;
    C3Big.Vertices(:,1)=C3Big.Vertices(:,1)+1;

    C1bot.Vertices(:,1)=C1bot.Vertices(:,1)+1;
    C2bot.Vertices(:,1)=C2bot.Vertices(:,1)+1;
    pause(0.002)
    n=n+1;
end
delete(C2bot);
delete(C3Big);
delete(C1bot);
delete(C1top);

end
end

