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

% hatB doit être une matrice de log2(M) = 2 lignes et Ns = 65536 colonnes
% A partir des entiers obtenus en sortie de theMod.modulate_Int, hatB est
% calculé grace à la fonction de2bi(foo,2);
%% Décodage de source
hatMatBitImg = reshape(hatB(:),[],8);
matImg = bi2de(hatMatBitImg);
Img = reshape(matImg,128,128);

%% Affichage
figure
imagesc(Img)
colormap gray
