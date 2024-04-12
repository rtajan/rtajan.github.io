clear
close all
clc

level = 1;

%% Chargement du fichier contenant le signal reçu
load 'signal_recu.mat';
if level > 1
  signal_recu = signal_recu(1:5:end);
end

%% Votre récepteur
% En entrée : signal_recu, signal équivalent à rl(kTe) avec Te le temps
% d'échantillonnage

% hatB doit être une matrice de log2(M) lignes et Ns
% calculé grace à la fonction de2bi(foo,2) foo étant ici une représentation entière des étiquettes
%% Décodage de source
hatMatBitImg = reshape(hatB(:),[],8);
matImg = bi2de(hatMatBitImg);
T = 1 % Changer ici la taille de l'image
Img = reshape(matImg,T,T);

%% Affichage
figure
imagesc(Img)
colormap gray
