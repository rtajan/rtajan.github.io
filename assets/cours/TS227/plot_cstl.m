function plot_cstl(constellation)
% constellation : (vector) vecteur de taille M contenant la modulation
M = length(constellation);
nb = log2(M);

theta = linspace(0,2*pi,100);

% Affiche le cercle trigonométrique
plot(exp(1j*theta), Color=[0.75, 0.75, 0.75]); 
axis([-1.5 1.5 -1.5 1.5])
hold on
grid on
xlabel('In phase')
ylabel('Quadrature')

% Affiche les points de la constellation
plot(real(constellation), imag(constellation), 'r+', MarkerSize=8); 

% Affiche les étiquettes binaires (en décimal)
for k = 1:M
    etiquette = num2str(de2bi(k-1, nb, 'left-msb'));
    text(real(constellation(k)), imag(constellation(k))+0.01, etiquette, ...
         Color='r', VerticalAlignment='bottom', HorizontalAlignment='center');
end

hold off