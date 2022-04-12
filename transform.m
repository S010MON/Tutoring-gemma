function [v_global] = transform(v_local, image_vector, pixels_per_image)
%% TRANSFORM Transform the local coordinates into global
%   v_local - a 2d vector [x, y] of the pixel within the image
%   
%   image_vector - a 2d vector [x, y] of the image location in the raster
%   scan (3,5) would be the 3rd image along, 5th down.
%   
%   pixels_per_image - the integer number of pixels (assuming square images) 
%   along one edge of the image.


    v_global = (image_vector * pixels_per_image) + v_local;

end

