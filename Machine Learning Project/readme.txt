Le projet de la matiére Machine Learning s'appelle 'Image Denoising'.

Il s'agit d'ajouter un bruit gaussien aux images MNIST puis d'implémenter un auto-encodeur qui sert à débruiter ses images.

L'auto-encodeur que j'avais implémenté arrive à débruiter les images aprés 10 epochs d'entrainement.

Pour entrainer un réseau de neurones, on doit choisir une fonction d'optimisation qui met à jour les coefficients des différentes couches.
Dans mon modéle, j'ai utilisé l'optimiseur Adam qui prend un taux d'apprentissage (learning rate) en entrée.

J'ai comparé deux auto-encodeurs, l'un utilisant un learning rate de 10^(-2) et l'autre 10^(-3) et j'ai comparé leurs performances.

Dans un deuxiéme temps, j'ai testé le même auto-encodeur sur des images RGB appartenant à la dataset CIFAR de torchvision. 

Ce projet était l'occasion de découvrir les auto-encodeurs et d'ajuster les paramétres des différentes couches pour aboutir au meilleur débruitage
avec une complexité temporelle réduite. 
