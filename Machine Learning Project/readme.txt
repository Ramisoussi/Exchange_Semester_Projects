The machine learning Project is named 'Image Denoising'.

It consists of adding a Gaussian noise to the MNIST images and then implementing an auto-encoder to denoise them.

The auto-encoder I implemented denoises the images after 10 training epochs.

To train a neural network, it is necessary to choose an optimization function that updates the coefficients of the different layers.
In my model, I used the Adam optimizer which takes a learning rate as input.

I compared two autoencoders, one using a 10^(-2) learning rate and the other 10^(-3) and compared their performance.

Second, I tested the same autoencoder on RGB images belonging to the torchvision CIFAR dataset.

This project was an opportunity to discover the auto-encoders and to adjust the parameters of the different layers to obtain the best denoising
with reduced time complexity. 
