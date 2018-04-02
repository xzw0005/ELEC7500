% Examples of pole placement with FSFB
% demonstrating the Nbar modifcation to the reference command
%
% Jonathan How
% Sept, 2010
%
close all; clear all;
set(0,'DefaultLineLineWidth',2)
set(0,'DefaultlineMarkerSize',10);set(0,'DefaultlineMarkerFace','b')
set(0, 'DefaultAxesFontSize', 14);set(0, 'DefaultTextFontSize', 14);
% system
[a,b,c,d]=tf2ss(8*14*20,conv([1 8],conv([1 14],[1 20])));
% controller gains to place poles at specified locations
k=place(a,b,[?12+12*j;?12?12*j;?20]);

% find the feedforward gains
Nbar=?inv(c*inv(a?b*k)*b);

sys1=ss(a?b*k,b,c,d);
sys2=ss(a?b*k,b*Nbar,c,d);

t=[0:.01:1];
[y,t,x]=step(sys1,t);
[y2,t2,x2]=step(sys2,t);
figure(1);clf
plot(t,y,'??',t2,y2,'LineWidth',2);axis([0 1 0 1.2]);grid;
legend('u=r?Kx','u=Nbar r?Kx');xlabel('time (sec)');ylabel('Y output')
title('Step Response')
hold on
plot(t2([1 end]),[.1 .1]*y2(end),'r??');
plot(t2([1 end]),[.1 .1]*9*y2(end),'r??');
hold off

text(.4,.6,['k= [ ',num2str(round(k*1000)/1000),' ]'],'FontSize',14)
text(.4,.8,['Nbar= ',num2str(round(Nbar*1000)/1000)],'FontSize',14)
export fig triple1 ?pdf

figure(1);clf
f=logspace(?1,2,400);
gcl1=freqresp(sys1,f);
gcl2=freqresp(sys2,f);
loglog(f,abs(squeeze(gcl1)),f,abs(squeeze(gcl2)),'LineWidth',2);grid
xlabel('Freq (rad/sec)')
ylabel('G {cl}')
title('Closed?loop Freq Response')
legend('u=r?Kx','u=Nbar r?Kx')
export fig triple11 ?pdf

%%%%%%%%%
% example 2
%
clear all

[a,b,c,d]=tf2ss(8*14*20,conv([1 ?8],conv([1 ?14],[1 ?20])))
k=place(a,b,[?12+12*j;?12?12*j;?20])
% find the feedforward gains
Nbar=?inv(c*inv(a?b*k)*b);
sys1=ss(a?b*k,b,c,d);
sys2=ss(a?b*k,b*Nbar,c,d);
t=[0:.01:1];
[y,t,x]=step(sys1,t);
[y2,t2,x2]=step(sys2,t);

figure(2);clf
plot(t,y,'??',t2,y2,'LineWidth',2);axis([0 1 0 1.2])
grid;
legend('u=r?Kx','u=Nbar r?Kx')
xlabel('time (sec)');ylabel('Y output');title('Step Response')
hold on
plot(t2([1 end]),[.1 .1]*y2(end),'r??');
plot(t2([1 end]),[.1 .1]*9*y2(end),'r??');
hold off

text(.4,.6,['k= [ ',num2str(round(k*1000)/1000),' ]'],'FontSize',14)
text(.4,.8,['Nbar= ',num2str(round(Nbar*1000)/1000)],'FontSize',14)
export fig triple2 ?pdf

figure(2);clf
f=logspace(?1,2,400);
gcl1=freqresp(sys1,f);
gcl2=freqresp(sys2,f);
loglog(f,abs(squeeze(gcl1)),f,abs(squeeze(gcl2)),'LineWidth',2);grid
xlabel('Freq (rad/sec)')
ylabel('G {cl}')
title('Closed?loop Freq Response')
legend('u=r?Kx','u=Nbar r?Kx')
export fig triple21 ?pdf

%%%%%%%%%%%%%%
% example 3
clear all

[a,b,c,d]=tf2ss(.94,[1 0 ?0.0297])
k=place(a,b,[?1+j;?1?j]/4)
% find the feedforward gains
Nbar=?inv(c*inv(a?b*k)*b);
sys1=ss(a?b*k,b,c,d);
sys2=ss(a?b*k,b*Nbar,c,d);
t=[0:.1:30];
[y,t,x]=step(sys1,t);
[y2,t2,x2]=step(sys2,t);

figure(3);clf
plot(t,y,'??',t2,y2,'LineWidth',2);axis([0 30 0 2])
grid;
legend('u=r?Kx','u=Nbar r?Kx')
xlabel('time (sec)');ylabel('Y output');title('Step Response')
hold on
plot(t2([1 end]),[.1 .1]*y2(end),'r??');
plot(t2([1 end]),[.1 .1]*9*y2(end),'r??');
hold off

text(15,.6,['k= [ ',num2str(round(k*1000)/1000),' ]'],'FontSize',14)
text(15,.8,['Nbar= ',num2str(round(Nbar*1000)/1000)],'FontSize',14)
export fig triple3 ?pdf

figure(3);clf
f=logspace(?3,1,400);
gcl1=freqresp(sys1,f);
gcl2=freqresp(sys2,f);
loglog(f,abs(squeeze(gcl1)),f,abs(squeeze(gcl2)),'LineWidth',2);grid
xlabel('Freq (rad/sec)')
ylabel('G {cl}')
title('Closed?loop Freq Response')
legend('u=r?Kx','u=Nbar r?Kx')
export fig triple31 ?pdf 

%%%%%%%%%%%%
% example 4
clear all

[a,b,c,d]=tf2ss([1 ?1],conv([1 1],[1 ?3]))
k=place(a,b,[[?1+j;?1?j]])
% find the feedforward gains
Nbar=?inv(c*inv(a?b*k)*b);

sys1=ss(a?b*k,b,c,d);
sys2=ss(a?b*k,b*Nbar,c,d);

t=[0:.1:10];
[y,t,x]=step(sys1,t);
[y2,t2,x2]=step(sys2,t);

figure(3);clf
plot(t,y,'??',t2,y2,'LineWidth',2);axis([0 10 ?1 1.2]) 

grid;
legend('u=r?Kx','u=Nbar r?Kx')
xlabel('time (sec)');ylabel('Y output')
title('Unstable, NMP system Step Response')
hold on
plot(t2([1 end]),[.1 .1]*y2(end),'r??');
plot(t2([1 end]),[.1 .1]*9*y2(end),'r??');
hold off

text(5,.6,['k= [ ',num2str(round(k*1000)/1000),' ]'],'FontSize',14)
text(5,.8,['Nbar= ',num2str(round(Nbar*1000)/1000)],'FontSize',14)
export fig triple4 ?pdf

figure(4);clf
f=logspace(?2,2,400);
gcl1=freqresp(sys1,f);
gcl2=freqresp(sys2,f);
loglog(f,abs(squeeze(gcl1)),f,abs(squeeze(gcl2)),'LineWidth',2);grid
xlabel('Freq (rad/sec)')
ylabel('G {cl}')
title('Closed?loop Freq Response')
legend('u=r?Kx','u=Nbar r?Kx')
export fig triple41 ?pdf 