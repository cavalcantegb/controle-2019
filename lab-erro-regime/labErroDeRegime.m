clc; clear; close all;
pkg load control;

u1 = [1 0];
u2 = [0.5 0 0];

# Sistemas

tipo0 = tf([1],[1 3 6])
tipo1 = tf([1],[1 3 6 0])
tipo2 = tf([1 4 3],[1 3 6 0 0])

#G_closed_loop = feedback(tipo0, -1);
#G_closed_loop = feedback(tipo1, -1);
G_closed_loop = feedback(tipo0, -1);

[y,t]=step(G_closed_loop);
u=ones(size(t));
#figure(1)
plot(t,y,'g',t,u,'b')
axis([0,2.9,0,1.1])
xlabel('Tempo(segundos)')
ylabel('Amplitude')
title('Erro de Regime_')
legend('saida', 'entrada');
hold on;

G_closed_loop = feedback(tipo0, -1);
[y,t]=ramp(G_closed_loop);
u=ones(size(t));
#figure(2)
plot(t,y,'r',t,u,'b')
axis([0,2.9,0,1.1])
#xlabel('Tempo(segundoss)')
#ylabel('Amplitude')
#title('Erro de Regime_')
#legend('entrada', 'saida');

#G_closed_loop = feedback(tipo2, -1);
#[y,t]=step(G_closed_loop);
#u=ones(size(t));
#figure(3)
#plot(t,y,'y',t,u,'b')
#axis([0,2.9,0,1.1])
#xlabel('Tempo(segundoss)')
#ylabel('Amplitude')
#title('Erro de Regime_')
#legend('entrada', 'saida');
hold off;