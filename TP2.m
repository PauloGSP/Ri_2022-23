function TP2

%Main func


%to do list
%- allow for file reading capabilities medium prio
%- change moving pieces to use translation/rotation like in TP1 low prio
%- make report high prio
%- animate robot highest prio
%- organize and revamp overall code with coments and distrubute over file
%for easier readabilty highest prio



addpath lib/
max=1800;
close all
grid on; axis equal; hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
axis([-max max -max max -max/3 1.6*max]);
view(3);

%call config functions
ConfigEnv
loopbreak=0;
%create pieces
while true
[C1top,C1bot, C2top,C2bot,C3top,C3Big] = CreatePieces;

if loopbreak==0



%robot default dimensions
LA=181;
LB=176;
LC=613;
LD=137;
LE=572;
LF=135;
LG=120;
LH=332;

DH=[0 0 LA 0
    -pi/2 0 0 -pi/2
    0 0 LB 0
    -pi/2 0 0 0
    0 LC 0 0
    0 0 -LD 0
    pi/2 0 0 pi/2
    0 0 LE 0
    0 0 0 -pi/2
    0 0 LF 0
    0 0 0 pi/2
    0 0 LG 0
    0 0 0 pi/2
    0 0 LH 0];



    QQ = {};
    % Init
    QQ{end+1} = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]'; % 1
    % Get C2
    QQ{end+1} = [0 deg2rad(-150) deg2rad(20) 0 0 deg2rad(60) 0 deg2rad(30)  0 deg2rad(50) 0 deg2rad(80) 0 0 ]'; % 2
    % Place C2 on C1
    QQ{end+1} = [0 -0.8871 deg2rad(30) 0 0 deg2rad(30) 0 pi/4  0 deg2rad(10) 0 deg2rad(75) 0 0 ]';% 3
    % Get C3
    QQ{end+1} = [0 deg2rad(-255) deg2rad(20) 0 0 deg2rad(60) 0 deg2rad(30)  0 deg2rad(50) 0 deg2rad(80) 0 0 ]'; % 4
    % Place C3 on C1
    QQ{end+1} = [0 deg2rad(0) deg2rad(30) 0 0 deg2rad(33) 0 deg2rad(55)  0 deg2rad(25) 0 deg2rad(75) 0 0 ]';% 5
    %reset
    QQ{end+1} = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]'; % 6
%2- elo horizontal inferior roda no plano xy
%3- inclina o robo direita ou esquerda a partir do eixo debaixo
%6- o mm do 3 mas a partir do eio mais afastado do meio
%8- o mm do 3 mas a partir do eio mais acima bbase do 3 linha a contar deup
%10- roda igual ao 1 mas em cima
%12- ultima barra gira como raio com da circunferencia do ultima dobra
%14- roda ponta

N=500;
jtypes=zeros(1,14);

AA = Tlinks(DH);
org = LinkOrigins(AA);
h = DrawLinks(org);
[P,F]=seixos3(0.5);
H = DrawFrames(AA, P, F);
end
loopbreak=1;
pause()
MovePieces(0,C1top,C1bot, C2top,C2bot,C3top,C3Big);

for i= 1 :5
    Qi = QQ{i};
        if i~=10
            Qf = QQ{i+1};
        end
    dQ = (Qf - Qi)/N;
                    
    Qn = Qi; 
    
    for k = 1 : N
	    MDH = GenerateMultiDH(DH,Qn, jtypes);
	    AAA = CalculateRobotMotion(MDH);
        
	    AnimateRobot(H,AAA,P,h,0.01);
        t=H{14}.Vertices;
 	    Qn = Qn + dQ;
        if i==2
            MovePieces(1,C1top,C1bot, C2top,C2bot,C3top,C3Big,t);
        end
        if i==4
            MovePieces(3,C1top,C1bot, C2top,C2bot,C3top,C3Big,t);
        end

    end
    if i==3
        n=0;
        while n<885
            C1top.Vertices(:,1)=C1top.Vertices(:,1)+1;
            C2bot.Vertices(:,1)=C2bot.Vertices(:,1)+1;
            C1bot.Vertices(:,1)=C1bot.Vertices(:,1)+1;
            
            pause(0.002)
            
            n=n+1;
            if n<20
                C1top.Vertices(:,2)=C1top.Vertices(:,2)-1;
                C2bot.Vertices(:,2)=C2bot.Vertices(:,2)-1;
                C1bot.Vertices(:,2)=C1bot.Vertices(:,2)-1;
                pause(0.002)
            end

        end

    end
    if i==2
        mini=0;
        while mini<192
                C2bot.Vertices(:,3)=C2bot.Vertices(:,3)-1;
                pause(0.002)
                mini=mini+1;
        end
        C2bot.Vertices(:,3)=C2bot.Vertices(:,3)-0.276;
        C2top.Vertices(:,3)=C2top.Vertices(:,3)+100000;

    end
    if i==4
        mini=0;
        while mini<110
                C3Big.Vertices(:,3)=C3Big.Vertices(:,3)-1;
                pause(0.002)
                mini=mini+1;
        end
        C3Big.Vertices(:,3)=C3Big.Vertices(:,3)-0.21;
    end
    if i==5
                mini=0;

        while mini<695
    C1top.Vertices(:,1)=C1top.Vertices(:,1)+1;
    C3Big.Vertices(:,1)=C3Big.Vertices(:,1)+1;

    C1bot.Vertices(:,1)=C1bot.Vertices(:,1)+1;
    C2bot.Vertices(:,1)=C2bot.Vertices(:,1)+1;
    pause(0.002)
    mini=mini+1;
        end
    end
    
end


%MovePieces
%MovePieces(C1top,C1bot, C2top,C2bot,C3top,C3Big);

%do this everytime we want to make another run
%[C1top,C1bot, C2top,C2bot,C3top,C3Big] = CreatePieces;
%MovePieces(C1top,C1bot, C2top,C2bot,C3top,C3Big);
delete(C2bot);
delete(C2top);
delete(C3Big);
delete(C3top);
delete(C1bot);
delete(C1top);
end


end