function T = TablePredict1(m, height, weight)
g = 9.81;
hei = height;
mass = weight;

%% ���ӵ�
[AccData, time] = m.accellog;

Xacc = AccData(:,1); % X ���ӵ� ����
Yacc = AccData(:,2); % Y ���ӵ� ����
Zacc = AccData(:,3); % Z  ���ӵ� ����

[macc nacc] = size(Xacc);

%% ����
OriData = m.orientlog;

pitch = OriData(:,2);
roll = OriData(:,3);

[mori nori] = size(roll);
%%
if mori> macc
    pitch= pitch(1:macc,:);
    roll = roll(1:macc,:);
else 
    Xacc = Xacc(1:mori,:);
    Yacc = Yacc(1:mori,:);
    Zacc = Zacc(1:mori,:);
end

%%  linear ���ӵ� = �������ӵ� - �߷°��ӵ�
Xacc = Xacc + g*sin(roll*pi/180);
Yacc = Yacc + g*sin(pitch*pi/180);
Zacc = Zacc - g*cos(pitch*pi/180).*cos(roll*pi/180);

%% �ð� ����
[ma n] = size(Xacc);
ts = time(2) - time(1); % �ð� ����

%% Acc magnitude = square_root(X^2+Y^2+Z^2)
Amag = sqrt(Xacc.^2 + Yacc.^2 + Zacc.^2);
n = find(Amag>5,1,'first');
Amag = Amag(n:end);
Xacc = Xacc(n:end);
Yacc = Yacc(n:end);
Zacc = Zacc(n:end);

n = find(Amag<5,1,'first');
Amag = Amag(1:n-1);
Xacc = Xacc(1:n-1);
Yacc = Yacc(1:n-1);
Zacc = Zacc(1:n-1);
%% cumsum = �ش� ������� ��
VelX = cumsum(Xacc(:)*ts);
VelY = cumsum(Yacc(:)*ts);
VelZ = cumsum(Zacc(:)*ts);

distX = cumsum(VelX(:)*ts); % cumsum �Լ��� �̿��� ��������
distY = cumsum(VelY(:)*ts);
distZ = cumsum(VelZ(:)*ts);

figure(1);
plot3(distX, distY, distZ);
hold on;
comet3(distX, distY, distZ);
title('Distance');
xlabel('X Axis');
ylabel('Y Axis');
zlabel('Z Axis');
grid on;
hold off;

%%
VelocityX = VelX(end);
VelocityY = VelY(end);
VelocityZ = VelZ(end);

T = table(mass,hei,VelocityX,VelocityY,VelocityZ);
end