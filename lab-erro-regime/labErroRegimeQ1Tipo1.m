# Universidade Federal do Cear� - Centro de Tecnologia - Departamento de Teleinform�tica
# Disciplina: Introdu��o aos Sistemas de Controle
# Trabalho: Laborat�rio de Erro de Regime
# Professor: Tarc�sio
# Grupo:  Glauton Cardoso dos Santos
#         Guilherme Bastos Cavalcante 
#         Yerlon Sousa Magalh�es

clc; clear;  close all;           # limpa o terminal e as variaveis de ambiente
pkg load control;                 # importa o pacote de controle

%Entrada Degrau
num = [1];                        # Numerador da Fun��o de Transfer�ncia
den = [1 3 6 0];                  # Denominador da Fun��o de Transfer�ncia
tipo1 = tf(num,den)
G_closed_loop1 = feedback(tipo1); # Fun��o de Transfer�ncia em Malha Fechada

[y,t]=step(G_closed_loop1);
u=ones(size(t));
plot(t,y,'m')
axis([0,25,0,10])
xlabel('Tempo(segundos)')
ylabel('Amplitude')
title('Erro de Regime_')
hold on;

%Entrada Rampa
t=0:0.1:100;
u=t;
[y,t,x]=lsim(G_closed_loop1,u,t);
plot(t,y,'b',t,u,'r')

%Entrada Parabola
den1 = [1 5 6 0]; 
G=tf(num, den1);
sys_cl=feedback(G,1);
t=0:0.1:100;
u=0.5*t.*t;
[y,t,x]=lsim(G_closed_loop1,u,t);
plot(t,y,'g')
legend('degrau','rampa', 'saida', 'quadratico');

hold off;