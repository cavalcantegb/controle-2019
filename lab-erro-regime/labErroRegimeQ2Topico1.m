# Universidade Federal do Cear� - Centro de Tecnologia - Departamento de Teleinform�tica
# Disciplina: Introdu��o aos Sistemas de Controle
# Trabalho: Laborat�rio de Erro de Regime
# Professor: Tarc�sio
# Grupo:  Glauton Cardoso dos Santos
#         Guilherme Bastos Cavalcante 
#         Yerlon Sousa Magalh�es

clc; clear;  close all;           # limpa o terminal e as variaveis de ambiente
pkg load control;                 # importa o pacote de controle

% Entrada Rampa
num = [1 8 15]
den = [1 15 56 0]
tipo1 = tf(num,den)
G_closed_loop1 = feedback(tipo1); # Fun��o de Transfer�ncia em Malha Fechada

%Entrada Rampa
t=0:0.1:100;
u=t;
[y,t,x]=lsim(G_closed_loop1,u,t);
plot(t,y,'b',t,u,'y')
legend('rampa', 'sinal');

axis([0,25,0,20])
xlabel('Tempo(segundos)')
ylabel('Amplitude')
title('Erro de Regime_')