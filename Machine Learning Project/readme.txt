The machine learning Project is named 'Image Denoising'.

It consists of adding a Gaussian noise to the MNIST images and then implementing an auto-encoder to denoise them.

The auto-encoder implemented denoises the images after 10 training epochs.

To train a neural network, it is necessary to choose an optimization function that updates the coefficients of the different layers.
In this model, the Adam optimizer is used and takes a learning rate as input.

Two autoencoders are implemented and compared, one using a 10^(-2) learning rate and the other 10^(-3).

Second, the same autoencoder is tested on RGB images belonging to the torchvision CIFAR dataset.

