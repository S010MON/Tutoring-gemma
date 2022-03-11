
M = readmatrix("coordinate_translation_gq.xlsx");
out = [];

for i = 1:length(M)

    vector = [M(i, 4), M(i, 5)];
    out = [out; locate_point(vector)];
    
end

out

file = fopen('~/git/gemma/output.txt','w'); % Make sure to change the file paths!
% Yours might look like "C:\\file\\path"

fprintf(file,'%6s %6s\n','x','y');
fprintf(file,'%6.4f %6.4f\n',out);
fclose(file);