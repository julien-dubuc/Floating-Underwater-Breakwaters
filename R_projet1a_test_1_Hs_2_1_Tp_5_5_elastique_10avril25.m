clear();
clc
close all 
% Analyse avec transformée de fourier d'un signal en sinus
% calcul du coefficient de réflexion 
% tinit : temps initial
% tfinal : temps final
% deltat : pas de temps
% fech=1/deltat : fréquence d'echantillonnage
% T : periode de la houle
% nbrepoints : nombre de points

% ampliseuil : amplitude minimale des maxima recherchés
ampliseuil=0.005;

hold off;


%ENTREES DONNEES DES 3 SONDES AMONT et des 2 SONDES AVAL
ampliseuil=0.0005;
% profondeur d'eau
h=1;

% entree des donnees des sondes

load test_4_Hs_1_7_Tp_5_0_elastique_matlab.txt;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coefficients de transfert entre mesure en volt et mesure en cm  %
%          et données amplitudes mesurées en cm                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Coefficient en mm/V

% sondes amont

Coef_tension_sonde1=-55.53;
Coef_tension_sonde2= -27.70;
Coef_tension_sonde3= -26.86;
Coef_tension_sonde4= -22.12;
Coef_tension_sonde5= -13.18;
Coef_tension_sonde6= -18.75;

% sondes aval

Coef_tension_sonde11=-40.67;
Coef_tension_sonde13= -28.59;
Coef_tension_sonde14= -19.44;
Coef_tension_sonde15= -12.11;
Coef_tension_sonde16= -18.87;
Coef_tension_sonde17= -27.11;
Coef_tension_sonde18= -24.16;



% coefficients de transfert

A1=Coef_tension_sonde1;
A2=Coef_tension_sonde2;
A3=Coef_tension_sonde3;
A4=Coef_tension_sonde4;
A5=Coef_tension_sonde5;
A6=Coef_tension_sonde6;

A11=Coef_tension_sonde11;
A13=Coef_tension_sonde13;
A14=Coef_tension_sonde14;
A15=Coef_tension_sonde15;
A16=Coef_tension_sonde16;
A17=Coef_tension_sonde15;
A18=Coef_tension_sonde16;


% TRAITEMENT SONDES AMONT


% temps
temps= test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,1);
% Sonde S1
eta_Sonde1=A1*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,8);
% Sonde S2
eta_Sonde2=A2*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,2);
%% Sonde S3
eta_Sonde3=A3*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,3);
% Sonde S4
eta_Sonde4=A4*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,5);
% Sonde S5
eta_Sonde5=A5*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,13);
% Sonde S6
eta_Sonde6=A6*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,4);



figure(1); 
hold on
plot(temps,eta_Sonde1,'-k');
%,axis([0 2 0 1]);
hold on
plot(temps,eta_Sonde2,'-b');
hold on
plot(temps,eta_Sonde3,'-g');
hold on
plot(temps,eta_Sonde4,'-r');
hold on
plot(temps,eta_Sonde5,'-m');
hold on
plot(temps,eta_Sonde6,'-y');
hold on
% plot(temps,eta_Sonde6,'-y');
% hold on


legend('sonde 1','sonde 2','sonde 3','sonde 4','sonde 5');
xlabel('temps')
ylabel('hauteur d''eau (mm)')
hold off

% longueur de la serie temporelle
lserie=length(temps);

% traitement entre xdebut et xfin;
xdebut=(335)*16;xfin=(400)*16;

% xdebut=120.0625*16;xfin=190.0625*16-1;

% données avec moyenne nulle
% Sonde S1
eta_Sonde1=eta_Sonde1-mean(eta_Sonde1);
% Sonde S2
eta_Sonde2=eta_Sonde2-mean(eta_Sonde2);
%% Sonde S3
eta_Sonde3=eta_Sonde3-mean(eta_Sonde3);
% Sonde S4
eta_Sonde4=eta_Sonde4-mean(eta_Sonde4);
% Sonde S5
eta_Sonde5=eta_Sonde5-mean(eta_Sonde5);



figure(2); 
hold on
plot(temps(xdebut:xfin),eta_Sonde1(xdebut:xfin),'-k');
%,axis([0 2 0 1]);
hold on
plot(temps(xdebut:xfin),eta_Sonde2(xdebut:xfin),'-b');
hold on
plot(temps(xdebut:xfin),eta_Sonde3(xdebut:xfin),'-g');
hold on
plot(temps(xdebut:xfin),eta_Sonde4(xdebut:xfin),'-r');
hold on
plot(temps(xdebut:xfin),eta_Sonde5(xdebut:xfin),'-m');
hold on

legend('sonde 1','sonde 2','sonde 3','sonde 4','sonde 5');
xlabel('temps')
ylabel('hauteur d''eau (mm)')
hold off


% entree des series temporelles pour FFT

% en amont Sondes 2, 3 et 4
% en aval Sondes 1, 3, 5

% traitement sondes amont
% sondes 2, 3 et 4

% Positions sondes amonts (en metres)
%  xs1=0;xs2=0.205;xs3=0.205+0.28;
 xs1=0;xs2=0.21;xs3=0.44;


% t1=temps(xdebut:xfin);
% x1=eta_Sonde2(xdebut:xfin);
% 
% t2=temps(xdebut:xfin);
% x2=eta_Sonde6(xdebut:xfin);
% 
% t3=temps(xdebut:xfin);
% x3=eta_Sonde4(xdebut:xfin);

t1=temps(xdebut:xfin);
x1=eta_Sonde2(xdebut:xfin);

t2=temps(xdebut:xfin);
x2=eta_Sonde3(xdebut:xfin);

t3=temps(xdebut:xfin);
x3=eta_Sonde4(xdebut:xfin);

% VALEURS CENTREES DES AMPLITUDES

x1=x1-mean(x1);
x2=x2-mean(x2);
x3=x3-mean(x3);

figure(3); 
hold on
plot(t1,x1,'-k')
%,axis([0 2 0 1]);
hold on
plot(t2,x2,'-r');
hold on
plot(t3,x3,'-g');
hold on

legend('sonde x1','sonde x2','sonde x3');
xlabel('temps')
ylabel('hauteur d''eau (cm)')
hold off




% PAS DE TEMPS
deltat1=t1(2)-t1(1);
deltat2=t2(2)-t2(1);
deltat3=t3(2)-t3(1);


% transformées de Fourier
Y1 = fft(x1,length(t1));
N1 = length(Y1);
Y2 = fft(x2,length(t2));
N2 = length(Y2);
Y3 = fft(x3,length(t3));
N3 = length(Y3);


% amplitudes normalisees, soit coef de fourier
amplitude1=abs(Y1(1:N1/2))/(N1/2);
nyquist = 1/2;
freq1 = ((1:N1/2)-1)/(N1/2)/deltat1*nyquist;
amplitude2=abs(Y2(1:N2/2))/(N2/2);
nyquist = 1/2;
freq2 = ((1:N2/2)-1)/(N2/2)/deltat2*nyquist;
amplitude3=abs(Y3(1:N3/2))/(N3/2);
nyquist = 1/2;
freq3 = ((1:N3/2)-1)/(N3/2)/deltat3*nyquist;


% recherche de la fréquence pic;
[mp,index1] = max(amplitude1);
freq1(index1);
[mp,index2] = max(amplitude2);
freq2(index2);
[mp,index3] = max(amplitude3);
freq3(index3);


% recherche de la phase
theta1=angle(Y1(1:N1/2));
theta2=angle(Y2(1:N2/2));
theta3=angle(Y3(1:N3/2));


imax1=find(amplitude1(2:end-1)>amplitude1(1:end-2)&amplitude1(2:end-1)>=amplitude1(3:end)&amplitude1(2:end-1)>=ampliseuil); 
imax2=find(amplitude2(2:end-1)>amplitude2(1:end-2)&amplitude2(2:end-1)>=amplitude2(3:end)&amplitude2(2:end-1)>=ampliseuil); 
imax3=find(amplitude3(2:end-1)>amplitude3(1:end-2)&amplitude3(2:end-1)>=amplitude3(3:end)&amplitude3(2:end-1)>=ampliseuil); 
% imax=imax+1;
% maxima=[freq(imax),amplitude(imax),phase(imax)];
figure(4)
subplot(3,1,1),stem(freq1(imax1+1),amplitude1(imax1+1),'o'), axis([0 2 0 2*max(amplitude1)]), grid on
xlabel('fréquence'),ylabel('amplitude');
title(['SONDE 1, Tmax = ',num2str(1/freq1(index1)),'amplimax=',num2str(max(amplitude1)),'phase=',num2str(theta1(index1))])

subplot(3,1,2),stem(freq2(imax2+1),amplitude2(imax2+1),'o'), axis([0 2 0 2*max(amplitude2)]), grid on
xlabel('fréquence'),ylabel('amplitude');
title(['SONDE 2, fmax = ',num2str(freq2(index2)),'amplimax=',num2str(max(amplitude2)),'phase=',num2str(theta2(index2))])

subplot(3,1,3),stem(freq3(imax3+1),amplitude3(imax3+1),'o'), axis([0 2 0 2*max(amplitude3)]), grid on
xlabel('fréquence'),ylabel('amplitude');
title(['SONDE 3, fmax = ',num2str(freq3(index3)),'amplimax=',num2str(max(amplitude3)),'phase=',num2str(theta3(index3))])



% Sondes nommées 1, 2, 3 (amont) et 4, 5 (aval), xij=x(j)-x(i) 
x12=xs2-xs1;x23=xs3-xs2;x13=xs3-xs1;

f1=freq1(index1)
f2=freq2(index2)
f3=freq3(index3)
f=f1;
T=1/f;

a1=amplitude1(index1);a2=amplitude2(index2);a3=amplitude3(index3);

phi1=theta1(index1);phi2=theta2(index2);phi3=theta3(index3);

k = newtonpropa(h,f);

% verification
%omega*omega=gk tanh (kh)
% g=9.81;
% omega=2*pi*f1;
% membredegauche=omega*omega
% membrededroite=g*k* tanh (k*h)


% dephasages entre les signaux experimentaus des 3 sondes amont
phi12=phi2-phi1;phi13=phi3-phi1;phi23=phi3-phi2;

% evolution theorique entre les sondes de la phase pour une onde progressive 
delta12= -k*x12;delta13= -k*x13;delta23= -k*x23;

% % calcul du coefficient de reflexion a partir des sondes 1 et 2
aincident12=sqrt(a1*a1+a2*a2-2*a1*a2*cos(phi12+delta12))/(2*abs(sin((delta12+delta12)/2)));
areflechi12=sqrt(a1*a1+a2*a2-2*a1*a2*cos(phi12-delta12))/(2*abs(sin((delta12+delta12)/2)));
r12=areflechi12/aincident12
% 
% % calcul du coefficient de reflexion a partir des sondes 2 et 3
aincident23=sqrt(a2*a2+a3*a3-2*a2*a3*cos(phi23+delta23))/(2*abs(sin((delta23+delta23)/2)));
areflechi23=sqrt(a2*a2+a3*a3-2*a2*a3*cos(phi23-delta23))/(2*abs(sin((delta23+delta23)/2)));
r23=areflechi23/aincident23
% 
% % calcul du coefficient de reflexion a partir des sondes 1 et 3
aincident13=sqrt(a1*a1+a3*a3-2*a1*a3*cos(phi13+delta13))/(2*abs(sin((delta13+delta13)/2)));
areflechi13=sqrt(a1*a1+a3*a3-2*a1*a3*cos(phi13-delta13))/(2*abs(sin((delta13+delta13)/2)));
r13=areflechi13/aincident13


% calcul du coefficient de reflexion par methode des 3 sondes
% avec moindres carrés 
delta1=0;
delta2=delta12;
delta3=delta13;

s1=exp(-i*2*delta1)+exp(-i*2*delta2)+exp(-i*2*delta3);
s2=exp(+i*2*delta1)+exp(+i*2*delta2)+exp(+i*2*delta3);

%s12=exp(i*(delta1-delta1))+exp(i*(delta2-delta2))+exp(i*(delta3-delta3));
s12=3;
s3=a1*exp(-i*(phi1+delta1))+a2*exp(-i*(phi2+delta2))+a3*exp(-i*(phi3+delta3));

s4=a1*exp(-i*(phi1-delta1))+a2*exp(-i*(phi2-delta2))+a3*exp(-i*(phi3-delta3));

%s5=s1*s2-s12*s12;
s5=s1*s2-9;

ai=abs((s2*s3-s12*s4)/s5);
ar=abs((s1*s4-s12*s3)/s5);
refl_3sondes_amont_carre=ar/ai


hold on;
hold off;

% calcul de la reflexion a partir du calcul des coefficients de Fourier:

% periode du signal 
T1=1/f1;
T1=1.23;

% % frequence:
% f1=1/T1;
 %pas de temps deltat
fech=64;
deltat=1./fech;

% nombre de points de mesure
npoints=length(t1);

% duree de la mesure doit etre un multiple de T
% en toute rigueur
% si tel n'est pas le cas, on fait une petite erreur sur les résultats
% c'est en fait ce que fait la FFT puisque Matlab calcule les coefficients de
% Fourier pour toutes les frequences du spectre dans l'espace des
% fréquences

% nombre de periodes
nperiod=round(npoints*deltat*f1)-1;

% nombre de points pour le calcul
nbrepoints=round(nperiod*fech*T1);
nbrepointstest=(nperiod*fech*T1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcul sonde 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialisation des coefficents de Fourier
cos_f1=0;
sin_f1=0;


for ii=1:nbrepoints
    %pas de temps
    cos_f1=cos_f1+x1(ii)*cos(2*pi*t1(ii)/T1)*deltat;
    sin_f1=sin_f1+x1(ii)*sin(2*pi*t1(ii)/T1)*deltat;
end
%coefficients
cos_f1=(2/T1)*cos_f1/nperiod;
sin_f1=(2/T1)*sin_f1/nperiod;

% amplitude (module)
ampli_s1=sqrt(cos_f1*cos_f1+sin_f1*sin_f1);
% phase
phi_s1_degre=atan(sin_f1/cos_f1)*180/pi;
% en radians
phi_s1=-atan(sin_f1/cos_f1);
% si amplitude negative, ajouter pi a la phase
% amplitude ampli_s1=cos_f1/cos(phi_s1)
if cos_f1/cos(phi_s1)<0
    phi_s1=phi_s1+pi;
end
% fin 

%%%%%%%%%%%%%%
%verification solution

for ii=1:nbrepoints
    %pas de temps
    t1verif(ii)=t1(ii);
    x1verif(ii)=ampli_s1*cos(2*pi*t1(ii)/T1+phi_s1);
end

figure(10); 
hold on
plot(t1,x1,'-k')
%,axis([0 2 0 1]);
hold on
plot(t1verif,x1verif,'-r');
hold on

legend('sonde x1','sonde 1 verif');
xlabel('temps')
ylabel('hauteur d''eau (cm)')
hold off



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcul sonde 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialisation des coefficents de Fourier
cos_f1=0;
sin_f1=0;


for ii=1:nbrepoints
    %pas de temps
    cos_f1=cos_f1+x2(ii)*cos(2*pi*t2(ii)/T1)*deltat;
    sin_f1=sin_f1+x2(ii)*sin(2*pi*t2(ii)/T1)*deltat;
end
%coefficients
cos_f1=(2/T1)*cos_f1/nperiod;
sin_f1=(2/T1)*sin_f1/nperiod;

% amplitude (en module)
ampli_s2=sqrt(cos_f1*cos_f1+sin_f1*sin_f1);
% phase
phi_s2_degre=-atan(sin_f1/cos_f1)*180/pi;
% en radians
phi_s2= -atan(sin_f1/cos_f1);
% % amplitude (avec le signe)
% ampli_s2=cos_f1/cos(phi_s2);
% si amplitude negative, ajouter pi a la phase
% amplitude ampli_s1=cos_f1/cos(phi_s1)
if cos_f1/cos(phi_s2)<0
    phi_s2=phi_s2+pi;
end

% fin 

for ii=1:nbrepoints
    %pas de temps
    t2verif(ii)=t2(ii);
    x2verif(ii)=ampli_s2*cos(2*pi*t2(ii)/T1+phi_s2);
end

figure(20); 
hold on
plot(t2,x2,'-k')
%,axis([0 2 0 1]);
hold on
plot(t2verif,x2verif,'-r');
hold on

legend('sonde x1','sonde 1 verif');
xlabel('temps')
ylabel('hauteur d''eau (cm)')
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcul sonde 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialisation des coefficents de Fourier
cos_f1=0;
sin_f1=0;


for ii=1:nbrepoints
    %pas de temps
    cos_f1=cos_f1+x3(ii)*cos(2*pi*t3(ii)/T1)*deltat;
    sin_f1=sin_f1+x3(ii)*sin(2*pi*t3(ii)/T1)*deltat;
end
%coefficients
cos_f1=(2/T1)*cos_f1/nperiod;
sin_f1=(2/T1)*sin_f1/nperiod;

% amplitude (module)
ampli_s3=sqrt(cos_f1*cos_f1+sin_f1*sin_f1);
% phase
phi_s3_degre=-atan(sin_f1/cos_f1)*180/pi;
% en radians
phi_s3=-atan(sin_f1/cos_f1);

% % amplitude (avec le signe)
% ampli_s3=cos_f1/cos(phi_s3);
% si amplitude negative, ajouter pi a la phase
% amplitude ampli_s1=cos_f1/cos(phi_s1)
if cos_f1/cos(phi_s3)<0
    phi_s3=phi_s3+pi;
end

% fin 

for ii=1:nbrepoints
    %pas de temps
    t3verif(ii)=t3(ii);
    x3verif(ii)=ampli_s3*cos(2*pi*t3(ii)/T1+phi_s3);
end

figure(30); 
hold on
plot(t3,x3,'-k')
%,axis([0 2 0 1]);
hold on
plot(t3verif,x3verif,'-r');
hold on

legend('sonde x3','sonde 3 verif');
xlabel('temps')
ylabel('hauteur d''eau (cm)')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   calculs coefficients de reflexion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

k = newtonpropa(h,f1);

% verification
%omega*omega=gk tanh (kh)
% g=9.81;
% omega=2*pi*f1;
% membredegauche=omega*omega
% membrededroite=g*k* tanh (k*h)


% dephasages entre les signaux experimentaus des 3 sondes amont
phi12=phi_s2-phi_s1;phi13=phi_s3-phi_s1;phi23=phi_s3-phi_s2;

% evolution theorique entre les sondes de la phase pour une onde progressive 
delta12= -k*x12;delta13= -k*x13;delta23= -k*x23;

% % calcul du coefficient de reflexion a partir des sondes 1 et 2
aincident12=sqrt(ampli_s1*ampli_s1+ampli_s2*ampli_s2-2*ampli_s1*ampli_s2*cos(phi12+delta12))/(2*abs(sin((delta12+delta12)/2)));
areflechi12=sqrt(ampli_s1*ampli_s1+ampli_s2*ampli_s2-2*ampli_s1*ampli_s2*cos(phi12-delta12))/(2*abs(sin((delta12+delta12)/2)));
r_s12=areflechi12/aincident12
% 
% % calcul du coefficient de reflexion a partir des sondes 2 et 3
aincident23=sqrt(ampli_s2*ampli_s2+ampli_s3*ampli_s3-2*ampli_s2*ampli_s3*cos(phi23+delta23))/(2*abs(sin((delta23+delta23)/2)));
areflechi23=sqrt(ampli_s2*ampli_s2+ampli_s3*ampli_s3-2*ampli_s2*ampli_s3*cos(phi23-delta23))/(2*abs(sin((delta23+delta23)/2)));
r_s23=areflechi23/aincident23
% 
% % calcul du coefficient de reflexion a partir des sondes 1 et 3
aincident13=sqrt(ampli_s1*ampli_s1+ampli_s3*ampli_s3-2*ampli_s1*ampli_s3*cos(phi13+delta13))/(2*abs(sin((delta13+delta13)/2)));
areflechi13=sqrt(ampli_s1*ampli_s1+ampli_s3*ampli_s3-2*ampli_s1*ampli_s3*cos(phi13-delta13))/(2*abs(sin((delta13+delta13)/2)));
r_s13=areflechi13/aincident13


% calcul du coefficient de reflexion par methode des 3 sondes
% avec moindres carrés 
delta1=0;
delta2=delta12;
delta3=delta13;

s1=exp(-i*2*delta1)+exp(-i*2*delta2)+exp(-i*2*delta3);
s2=exp(+i*2*delta1)+exp(+i*2*delta2)+exp(+i*2*delta3);

%s12=exp(i*(delta1-delta1))+exp(i*(delta2-delta2))+exp(i*(delta3-delta3));
s12=3;
s3=ampli_s1*exp(-i*(phi_s1+delta1))+ampli_s2*exp(-i*(phi_s2+delta2))+ampli_s3*exp(-i*(phi_s3+delta3));

s4=ampli_s1*exp(-i*(phi_s1-delta1))+ampli_s2*exp(-i*(phi_s2-delta2))+ampli_s3*exp(-i*(phi_s3-delta3));

%s5=s1*s2-s12*s12;
s5=s1*s2-9;

ai=abs((s2*s3-s12*s4)/s5)
ar=abs((s1*s4-s12*s3)/s5);
refl_s3sondes_amont_newton=ar/ai


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRAITEMENT SONDES AVAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% temps
temps= test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,1);
% Sonde S11
eta_Sonde11=A11*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,12);
% Sonde S13
eta_Sonde13=A13*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,7);
% Sonde S14
eta_Sonde14=A14*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,17);
% Sonde S15
eta_Sonde15=A15*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,15);
% Sonde S16
eta_Sonde16=A16*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,14);
% Sonde S17
eta_Sonde17=A17*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,16);
% Sonde S18
eta_Sonde18=A18*test_4_Hs_1_7_Tp_5_0_elastique_matlab(:,11);



figure(101); 
hold on
plot(temps,eta_Sonde11,'-k');
%,axis([0 2 0 1]);
hold on
plot(temps,eta_Sonde13,'-g');
hold on
plot(temps,eta_Sonde14,'-r');
hold on
plot(temps,eta_Sonde15,'-m');
hold on
plot(temps,eta_Sonde16,'-y');
hold on
plot(temps,eta_Sonde17,'-b');
hold on
plot(temps,eta_Sonde18,'--k');
hold on


legend('sonde 11','sonde 13','sonde 14','sonde 15','sonde 16','sonde 17','sonde 18');
xlabel('temps')
ylabel('hauteur d''eau (mm)')
hold off

% longueur de la serie temporelle
lserie=length(temps);

% traitement entre xdebut et xfin;
xdebut=(335)*16;xfin=(400)*16;
% xdebut=120.0625*16;xfin=190.0625*16-1;

% données avec moyenne nulle
% Sonde S11
eta_Sonde11=eta_Sonde11-mean(eta_Sonde11);
% Sonde S13
eta_Sonde13=eta_Sonde13-mean(eta_Sonde13);
% Sonde S14
eta_Sonde14=eta_Sonde14-mean(eta_Sonde14);
% Sonde S15
eta_Sonde15=eta_Sonde15-mean(eta_Sonde15);
% Sonde S16
eta_Sonde16=eta_Sonde16-mean(eta_Sonde16);
% Sonde S17
eta_Sonde17=eta_Sonde17-mean(eta_Sonde17);
% Sonde S18
eta_Sonde18=eta_Sonde18-mean(eta_Sonde18);



figure(102); 
hold on
plot(temps(xdebut:xfin),eta_Sonde11(xdebut:xfin),'-k');
%,axis([0 2 0 1]);
hold on
plot(temps(xdebut:xfin),eta_Sonde13(xdebut:xfin),'-b');
hold on
plot(temps(xdebut:xfin),eta_Sonde14(xdebut:xfin),'-g');
hold on
plot(temps(xdebut:xfin),eta_Sonde15(xdebut:xfin),'-r');
hold on
plot(temps(xdebut:xfin),eta_Sonde16(xdebut:xfin),'-m');
hold on
plot(temps(xdebut:xfin),eta_Sonde17(xdebut:xfin),'-m');
hold on
plot(temps(xdebut:xfin),eta_Sonde18(xdebut:xfin),'-m');
hold on
legend('sonde 11','sonde 13','sonde 14','sonde 15','sonde 16','sonde 17','sonde 18');
xlabel('temps')
ylabel('hauteur d''eau (mm)')
hold off


% entree des series temporelles pour FFT

% en amont Sondes 2, 3 et 4
% en aval Sondes 11, 13, 14

% traitement sondes aval
% sondes 11, 13 et 14

% Positions sondes amonts (en metres)
%  xs1=0;xs2=0.205;xs3=0.205+0.28;
 xs1=0;xs2=0.30;xs3=0.45;


% t1=temps(xdebut:xfin);
% x1=eta_Sonde2(xdebut:xfin);
% 
% t2=temps(xdebut:xfin);
% x2=eta_Sonde6(xdebut:xfin);
% 
% t3=temps(xdebut:xfin);
% x3=eta_Sonde4(xdebut:xfin);

t1=temps(xdebut:xfin);
x1=eta_Sonde11(xdebut:xfin);

t2=temps(xdebut:xfin);
x2=eta_Sonde13(xdebut:xfin);

t3=temps(xdebut:xfin);
x3=eta_Sonde14(xdebut:xfin);

% VALEURS CENTREES DES AMPLITUDES

x1=x1-mean(x1);
x2=x2-mean(x2);
x3=x3-mean(x3);

figure(103); 
hold on
plot(t1,x1,'-k')
%,axis([0 2 0 1]);
hold on
plot(t2,x2,'-r');
hold on
plot(t3,x3,'-g');
hold on

legend('sonde x1','sonde x2','sonde x3');
xlabel('temps')
ylabel('hauteur d''eau (cm)')
hold off




% PAS DE TEMPS
deltat1=t1(2)-t1(1);
deltat2=t2(2)-t2(1);
deltat3=t3(2)-t3(1);


% transformées de Fourier
Y1 = fft(x1,length(t1));
N1 = length(Y1);
Y2 = fft(x2,length(t2));
N2 = length(Y2);
Y3 = fft(x3,length(t3));
N3 = length(Y3);


% amplitudes normalisees, soit coef de fourier
amplitude1=abs(Y1(1:N1/2))/(N1/2);
nyquist = 1/2;
freq1 = ((1:N1/2)-1)/(N1/2)/deltat1*nyquist;
amplitude2=abs(Y2(1:N2/2))/(N2/2);
nyquist = 1/2;
freq2 = ((1:N2/2)-1)/(N2/2)/deltat2*nyquist;
amplitude3=abs(Y3(1:N3/2))/(N3/2);
nyquist = 1/2;
freq3 = ((1:N3/2)-1)/(N3/2)/deltat3*nyquist;


% recherche de la fréquence pic;
[mp,index1] = max(amplitude1);
freq1(index1);
[mp,index2] = max(amplitude2);
freq2(index2);
[mp,index3] = max(amplitude3);
freq3(index3);


% recherche de la phase
theta1=angle(Y1(1:N1/2));
theta2=angle(Y2(1:N2/2));
theta3=angle(Y3(1:N3/2));


imax1=find(amplitude1(2:end-1)>amplitude1(1:end-2)&amplitude1(2:end-1)>=amplitude1(3:end)&amplitude1(2:end-1)>=ampliseuil); 
imax2=find(amplitude2(2:end-1)>amplitude2(1:end-2)&amplitude2(2:end-1)>=amplitude2(3:end)&amplitude2(2:end-1)>=ampliseuil); 
imax3=find(amplitude3(2:end-1)>amplitude3(1:end-2)&amplitude3(2:end-1)>=amplitude3(3:end)&amplitude3(2:end-1)>=ampliseuil); 
% imax=imax+1;
% maxima=[freq(imax),amplitude(imax),phase(imax)];
figure(104)
subplot(3,1,1),stem(freq1(imax1+1),amplitude1(imax1+1),'o'), axis([0 2 0 2*max(amplitude1)]), grid on
xlabel('fréquence'),ylabel('amplitude');
title(['SONDE 1, Tmax = ',num2str(1/freq1(index1)),'amplimax=',num2str(max(amplitude1)),'phase=',num2str(theta1(index1))])

subplot(3,1,2),stem(freq2(imax2+1),amplitude2(imax2+1),'o'), axis([0 2 0 2*max(amplitude2)]), grid on
xlabel('fréquence'),ylabel('amplitude');
title(['SONDE 2, fmax = ',num2str(freq2(index2)),'amplimax=',num2str(max(amplitude2)),'phase=',num2str(theta2(index2))])

subplot(3,1,3),stem(freq3(imax3+1),amplitude3(imax3+1),'o'), axis([0 2 0 2*max(amplitude3)]), grid on
xlabel('fréquence'),ylabel('amplitude');
title(['SONDE 3, fmax = ',num2str(freq3(index3)),'amplimax=',num2str(max(amplitude3)),'phase=',num2str(theta3(index3))])



% Sondes nommées 1, 2, 3 (amont) et 4, 5 (aval), xij=x(j)-x(i) 
x12=xs2-xs1;x23=xs3-xs2;x13=xs3-xs1;

f1=freq1(index1)
f2=freq2(index2)
f3=freq3(index3)
f=f1;
T=1/f;

a1=amplitude1(index1);a2=amplitude2(index2);a3=amplitude3(index3);

phi1=theta1(index1);phi2=theta2(index2);phi3=theta3(index3);

k = newtonpropa(h,f);

% verification
%omega*omega=gk tanh (kh)
% g=9.81;
% omega=2*pi*f1;
% membredegauche=omega*omega
% membrededroite=g*k* tanh (k*h)


% dephasages entre les signaux experimentaus des 3 sondes amont
phi12=phi2-phi1;phi13=phi3-phi1;phi23=phi3-phi2;

% evolution theorique entre les sondes de la phase pour une onde progressive 
delta12= -k*x12;delta13= -k*x13;delta23= -k*x23;

% % calcul du coefficient de reflexion a partir des sondes 1 et 2
aincident12=sqrt(a1*a1+a2*a2-2*a1*a2*cos(phi12+delta12))/(2*abs(sin((delta12+delta12)/2)));
areflechi12=sqrt(a1*a1+a2*a2-2*a1*a2*cos(phi12-delta12))/(2*abs(sin((delta12+delta12)/2)));
r12=areflechi12/aincident12
% 
% % calcul du coefficient de reflexion a partir des sondes 2 et 3
aincident23=sqrt(a2*a2+a3*a3-2*a2*a3*cos(phi23+delta23))/(2*abs(sin((delta23+delta23)/2)));
areflechi23=sqrt(a2*a2+a3*a3-2*a2*a3*cos(phi23-delta23))/(2*abs(sin((delta23+delta23)/2)));
r23=areflechi23/aincident23
% 
% % calcul du coefficient de reflexion a partir des sondes 1 et 3
aincident13=sqrt(a1*a1+a3*a3-2*a1*a3*cos(phi13+delta13))/(2*abs(sin((delta13+delta13)/2)));
areflechi13=sqrt(a1*a1+a3*a3-2*a1*a3*cos(phi13-delta13))/(2*abs(sin((delta13+delta13)/2)));
r13=areflechi13/aincident13


% calcul du coefficient de reflexion par methode des 3 sondes
% avec moindres carrés 
delta1=0;
delta2=delta12;
delta3=delta13;

s1=exp(-i*2*delta1)+exp(-i*2*delta2)+exp(-i*2*delta3);
s2=exp(+i*2*delta1)+exp(+i*2*delta2)+exp(+i*2*delta3);

%s12=exp(i*(delta1-delta1))+exp(i*(delta2-delta2))+exp(i*(delta3-delta3));
s12=3;
s3=a1*exp(-i*(phi1+delta1))+a2*exp(-i*(phi2+delta2))+a3*exp(-i*(phi3+delta3));

s4=a1*exp(-i*(phi1-delta1))+a2*exp(-i*(phi2-delta2))+a3*exp(-i*(phi3-delta3));

%s5=s1*s2-s12*s12;
s5=s1*s2-9;

ai=abs((s2*s3-s12*s4)/s5);
ar=abs((s1*s4-s12*s3)/s5);
refl_3sondes_aval_carre=ar/ai


hold on;
hold off;

% calcul de la reflexion a partir du calcul des coefficients de Fourier:

% periode du signal 
T1=1/f1;
T1=1.23;
% % frequence:
% f1=1/T1;
 %pas de temps deltat
fech=64;
deltat=1./fech;

% nombre de points de mesure
npoints=length(t1);

% duree de la mesure doit etre un multiple de T
% en toute rigueur
% si tel n'est pas le cas, on fait une petite erreur sur les résultats
% c'est en fait ce que fait la FFT puisque Matlab calcule les coefficients de
% Fourier pour toutes les frequences du spectre dans l'espace des
% fréquences

% nombre de periodes
nperiod=round(npoints*deltat*f1)-1;

% nombre de points pour le calcul
nbrepoints=round(nperiod*fech*T1);
nbrepointstest=(nperiod*fech*T1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcul sonde 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialisation des coefficents de Fourier
cos_f1=0;
sin_f1=0;


for ii=1:nbrepoints
    %pas de temps
    cos_f1=cos_f1+x1(ii)*cos(2*pi*t1(ii)/T1)*deltat;
    sin_f1=sin_f1+x1(ii)*sin(2*pi*t1(ii)/T1)*deltat;
end
%coefficients
cos_f1=(2/T1)*cos_f1/nperiod;
sin_f1=(2/T1)*sin_f1/nperiod;

% amplitude (module)
ampli_s1=sqrt(cos_f1*cos_f1+sin_f1*sin_f1);
% phase
phi_s1_degre=atan(sin_f1/cos_f1)*180/pi;
% en radians
phi_s1=-atan(sin_f1/cos_f1);
% si amplitude negative, ajouter pi a la phase
% amplitude ampli_s1=cos_f1/cos(phi_s1)
if cos_f1/cos(phi_s1)<0
    phi_s1=phi_s1+pi;
end
% fin 

%%%%%%%%%%%%%%
%verification solution

for ii=1:nbrepoints
    %pas de temps
    t1verif(ii)=t1(ii);
    x1verif(ii)=ampli_s1*cos(2*pi*t1(ii)/T1+phi_s1);
end

figure(110); 
hold on
plot(t1,x1,'-k')
%,axis([0 2 0 1]);
hold on
plot(t1verif,x1verif,'-r');
hold on

legend('sonde x1','sonde 1 verif');
xlabel('temps')
ylabel('hauteur d''eau (cm)')
hold off



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcul sonde 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialisation des coefficents de Fourier
cos_f1=0;
sin_f1=0;


for ii=1:nbrepoints
    %pas de temps
    cos_f1=cos_f1+x2(ii)*cos(2*pi*t2(ii)/T1)*deltat;
    sin_f1=sin_f1+x2(ii)*sin(2*pi*t2(ii)/T1)*deltat;
end
%coefficients
cos_f1=(2/T1)*cos_f1/nperiod;
sin_f1=(2/T1)*sin_f1/nperiod;

% amplitude (en module)
ampli_s2=sqrt(cos_f1*cos_f1+sin_f1*sin_f1);
% phase
phi_s2_degre=-atan(sin_f1/cos_f1)*180/pi;
% en radians
phi_s2= -atan(sin_f1/cos_f1);
% % amplitude (avec le signe)
% ampli_s2=cos_f1/cos(phi_s2);
% si amplitude negative, ajouter pi a la phase
% amplitude ampli_s1=cos_f1/cos(phi_s1)
if cos_f1/cos(phi_s2)<0
    phi_s2=phi_s2+pi;
end

% fin 

for ii=1:nbrepoints
    %pas de temps
    t2verif(ii)=t2(ii);
    x2verif(ii)=ampli_s2*cos(2*pi*t2(ii)/T1+phi_s2);
end

figure(120); 
hold on
plot(t2,x2,'-k')
%,axis([0 2 0 1]);
hold on
plot(t2verif,x2verif,'-r');
hold on

legend('sonde x1','sonde 1 verif');
xlabel('temps')
ylabel('hauteur d''eau (cm)')
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcul sonde 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialisation des coefficents de Fourier
cos_f1=0;
sin_f1=0;


for ii=1:nbrepoints
    %pas de temps
    cos_f1=cos_f1+x3(ii)*cos(2*pi*t3(ii)/T1)*deltat;
    sin_f1=sin_f1+x3(ii)*sin(2*pi*t3(ii)/T1)*deltat;
end
%coefficients
cos_f1=(2/T1)*cos_f1/nperiod;
sin_f1=(2/T1)*sin_f1/nperiod;

% amplitude (module)
ampli_s3=sqrt(cos_f1*cos_f1+sin_f1*sin_f1);
% phase
phi_s3_degre=-atan(sin_f1/cos_f1)*180/pi;
% en radians
phi_s3=-atan(sin_f1/cos_f1);

% % amplitude (avec le signe)
% ampli_s3=cos_f1/cos(phi_s3);
% si amplitude negative, ajouter pi a la phase
% amplitude ampli_s1=cos_f1/cos(phi_s1)
if cos_f1/cos(phi_s3)<0
    phi_s3=phi_s3+pi;
end

% fin 

for ii=1:nbrepoints
    %pas de temps
    t3verif(ii)=t3(ii);
    x3verif(ii)=ampli_s3*cos(2*pi*t3(ii)/T1+phi_s3);
end

figure(130); 
hold on
plot(t3,x3,'-k')
%,axis([0 2 0 1]);
hold on
plot(t3verif,x3verif,'-r');
hold on

legend('sonde x3','sonde 3 verif');
xlabel('temps')
ylabel('hauteur d''eau (cm)')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   calculs coefficients de reflexion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

k = newtonpropa(h,f1);

% verification
%omega*omega=gk tanh (kh)
% g=9.81;
% omega=2*pi*f1;
% membredegauche=omega*omega
% membrededroite=g*k* tanh (k*h)


% dephasages entre les signaux experimentaus des 3 sondes amont
phi12=phi_s2-phi_s1;phi13=phi_s3-phi_s1;phi23=phi_s3-phi_s2;

% evolution theorique entre les sondes de la phase pour une onde progressive 
delta12= -k*x12;delta13= -k*x13;delta23= -k*x23;

% % calcul du coefficient de reflexion a partir des sondes 1 et 2
aincident12=sqrt(ampli_s1*ampli_s1+ampli_s2*ampli_s2-2*ampli_s1*ampli_s2*cos(phi12+delta12))/(2*abs(sin((delta12+delta12)/2)));
areflechi12=sqrt(ampli_s1*ampli_s1+ampli_s2*ampli_s2-2*ampli_s1*ampli_s2*cos(phi12-delta12))/(2*abs(sin((delta12+delta12)/2)));
r_s12=areflechi12/aincident12
% 
% % calcul du coefficient de reflexion a partir des sondes 2 et 3
aincident23=sqrt(ampli_s2*ampli_s2+ampli_s3*ampli_s3-2*ampli_s2*ampli_s3*cos(phi23+delta23))/(2*abs(sin((delta23+delta23)/2)));
areflechi23=sqrt(ampli_s2*ampli_s2+ampli_s3*ampli_s3-2*ampli_s2*ampli_s3*cos(phi23-delta23))/(2*abs(sin((delta23+delta23)/2)));
r_s23=areflechi23/aincident23
% 
% % calcul du coefficient de reflexion a partir des sondes 1 et 3
aincident13=sqrt(ampli_s1*ampli_s1+ampli_s3*ampli_s3-2*ampli_s1*ampli_s3*cos(phi13+delta13))/(2*abs(sin((delta13+delta13)/2)));
areflechi13=sqrt(ampli_s1*ampli_s1+ampli_s3*ampli_s3-2*ampli_s1*ampli_s3*cos(phi13-delta13))/(2*abs(sin((delta13+delta13)/2)));
r_s13=areflechi13/aincident13


% calcul du coefficient de reflexion par methode des 3 sondes
% avec moindres carrés 
delta1=0;
delta2=delta12;
delta3=delta13;

s1=exp(-i*2*delta1)+exp(-i*2*delta2)+exp(-i*2*delta3);
s2=exp(+i*2*delta1)+exp(+i*2*delta2)+exp(+i*2*delta3);

%s12=exp(i*(delta1-delta1))+exp(i*(delta2-delta2))+exp(i*(delta3-delta3));
s12=3;
s3=ampli_s1*exp(-i*(phi_s1+delta1))+ampli_s2*exp(-i*(phi_s2+delta2))+ampli_s3*exp(-i*(phi_s3+delta3));

s4=ampli_s1*exp(-i*(phi_s1-delta1))+ampli_s2*exp(-i*(phi_s2-delta2))+ampli_s3*exp(-i*(phi_s3-delta3));

%s5=s1*s2-s12*s12;
s5=s1*s2-9;

ai=abs((s2*s3-s12*s4)/s5)
ar=abs((s1*s4-s12*s3)/s5);
refl_s3sondes_aval_newton=ar/ai

