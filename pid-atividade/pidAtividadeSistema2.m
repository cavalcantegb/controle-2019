clear; close all; clc;
pkg load control;

num = [1];
den = [1 10 20];

plantaG = tf(num, den);

step(plantaG, 5, 'r');
hold on

kp = 0.380;
kd = 1;

step(tf([kp kd 0], [1 10 20 0]), 5)
axis([0,5,0,0.1])
xlabel('Tempo(segundos)')
ylabel('Amplitude')
title('Erro de Regime')

hold off