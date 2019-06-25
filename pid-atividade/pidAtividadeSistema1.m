clear; close all; clc;
pkg load control

num = [1];
den = [100 50];

plantaG = tf(num, den);

step(plantaG, 50, 'r');

hold on
kp = 1.5;
kd = .98;

step(tf([kp kd 0], [100 50 0]), 50, 'b');

axis([0,50,0,0.1])
xlabel('Tempo(segundos)')
ylabel('Amplitude')
title('Erro de Regime')

hold off;