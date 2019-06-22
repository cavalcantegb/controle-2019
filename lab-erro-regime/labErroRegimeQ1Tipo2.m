# Universidade Federal do Ceará - Centro de Tecnologia - Departamento de Teleinformática
# Disciplina: Introdução aos Sistemas de Controle
# Trabalho: Laboratório de Erro de Regime
# Professor: Tarcísio
# Grupo:  Glauton Cardoso dos Santos
#         Guilherme Bastos Cavalcante 
#         Yerlon Sousa Magalhães

clc; clear;  close all;         # limpa o terminal e as variaveis de ambiente
pkg load control;               # importa o pacote de controle

num = [1];                      # Numerador da Função de Transferência
den = [1 3 2];                  # Denominador da Função de Transferência
G = tf(num, den);               # Função de Transferência
G_closed_loop = feedback(G, 1); # Função de Transferência em Malha Fechada


%Entrada Degrau
tipo2 = tf([1 4 3],[1 3 6 0 0])
G_closed_loop2 = feedback(tipo2); # Função de Transferência em Malha Fechada

[y,t]=step(G_closed_loop2);
u=ones(size(t));
plot(t,y,'g')
axis([0,9.9,0,1.1])
xlabel('Tempo(segundos)')
ylabel('Amplitude')
title('Erro de Regime_')
hold on;

%Entrada Rampa
t=0:0.1:100;
u=t;
[y,t,x]=lsim(G_closed_loop2,u,t);
plot(t,y,'b')

%Entrada Parabola
den1 = [1 5 6 0]; 
G=tf(num, den1);
sys_cl=feedback(G,1);
t=0:0.1:100;
u=0.5*t.*t;
[y,t,x]=lsim(G_closed_loop2,u,t);
plot(t,y,'r',t,u,'y')
legend('entrada', 'saida');
hold off;