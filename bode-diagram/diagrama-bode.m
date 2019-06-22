pkg load control

R1 = 1000;
R2 = 10;
L = 1e-3;
C = 0.22e-6;

s = tf('s');  # se cria uma variável que nos ajuda a 
              # a função de transferencia

GvC = (s*L)/(s*C*R1*R2 + s^2*C*L*R2 + s^2*C*L*R1 + R1 + s*L)

bode(GvC)
subplot(211),title('Diagramas de Bode')
ylabel('Ganancia [dB]')
subplot(212), ylabel('Fase [grados]')
xlabel('Frecuencia [rad/s]')