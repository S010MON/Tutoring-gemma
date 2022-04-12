function [rotated_vector] = rotate(v, n)
%% ROTATE linear vector rotation
% rotate the vector v by n degrees

    R = [cos(n), -sin(n); 
         sin(n), cos(n)];

    rotated_vector = R * v;

end

