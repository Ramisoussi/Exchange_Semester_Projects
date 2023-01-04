The Image Processing Project is named 'Single Image Super-Resolution'.

The goal of this project is to find algorithms that increase the size of the image while keeping a good resolution.

Two types of algorithms are implemented:

1) An algorithm based on interpolation methods called 'directionally averaging scaling algorithm'. This algorithm uses image processing methods such as the image gradient and the similarity of neighboring pixels. This algorithm is implemented with matlab.

2) An algorithm based on deep learning methods where the ConvTranspose2d layer belonging to the torch library is mainly used. This algorithm is implemented with python.

After the implementation, the resolutions given by these algorithms on the same images are compared.
