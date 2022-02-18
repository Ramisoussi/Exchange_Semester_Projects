Le projet de la matiére "Image Processing" s'appelle 'Single Image Super-Resolution'.

Le but de ce projet était de trouver des algorithmes qui augmente la taille de l'image tout en gardant une bonne résolution.

J'ai implémenté deux types d'algorithmes :

1) Un algorithme basé sur des méthodes d'interpolation qui s'appelle 'directionally averaging scaling algorithm'. Cet algorithme utilise des méthodes 
de traitement d'images tel que le gradient de l'image et la similarité des pixels voisins. J'ai implémenté cet algorithme avec matlab.

2) Un algorithme basé sur des méthodes d'apprentissage profond où j'ai utilisé principalement la couche ConvTranspose2d appartenante à la librairie torch.
J'ai implémenté cet algorithme avec python.

Aprés l'implémentation, j'ai comparé les résolutions données par ces algorithmes sur les mêmes images. 
