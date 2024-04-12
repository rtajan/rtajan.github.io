clear all
close all
clc

%% Chargement du fichier contenant le signal re�u
load 'signal_recu.mat';

%% Votre r�cepteur
% En entr�e : signal_recu, signal �quivalent � rl(kTe) avec Te le temps
% d'�chantillonnage

% hatB doit �tre une matrice de log2(M) = 2 lignes et Ns = 65536 colonnes
% A partir des entiers obtenus en sortie de theMod.modulate_Int, hatB est
% calcul� grace � la fonction de2bi(foo,2);
%% D�codage de source
hatMatBitImg = reshape(hatB(:),[],8);
matImg = bi2de(hatMatBitImg);
Img = reshape(matImg,128,128);

%% Affichage
figure
imagesc(Img)
colormap gray
