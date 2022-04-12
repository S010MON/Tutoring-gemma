M = readmatrix("marker_reference_coordinates.csv"); %  <----input file to read
out = [];
for i = 1:size(M)
    %% Manually re-find the correct_target to obtain x, y stage coordinates after rotation of sample to check accuracy.
    % if this is not possible or comparison of calculated and correct coordinate position is not required ignore
    %correct_target =[M(i, 8), M(i, 9)];

    %% Define the position of the 5 points from stitch pixel x, y coordinates.
    pixel_position = [988 16785; 
                      9053 13546;
                      15856 15931;
                      4538 5963;
                      16301 11618];

    %% Sort the points according to numbering scheme, e.g A is 1, B is 2, C is 3
    nums = [1 2 3 4 5];
    pixel_position = pixel_position(nums,:);

    %% Define 5 points of sample and input each stage position x, y coordinates.
    stage_position = [-0.200000	-4.754253; 
                      -2.074751 -3.999670;
                      -3.658012 -4.554308;
                      -1.025840 -2.237629;
                      -3.762216	-3.550817];

    %% Perform 2D geometric transformation to align to two sets of points
    trans = fitgeotrans(pixel_position, stage_position,'nonreflectivesimilarity');

    %% Target point x, y in pixels.
    pixel_target =[M(i, 2), M(i, 3)]; 

    %% Calculate location of target point in new position
    new_target = transformPointsForward(trans,pixel_target);

    %% Print values obtained for calculated new target position, the correct (manually found) new position 
    %% and the difference (error).
    fprintf('new target value: %s %s \n',new_target(1), new_target(2));
    %fprintf('correct target value: %s %s \n',correct_target(1), correct_target(2));
    %fprintf('difference: %s %s \n', (new_target(1)-correct_target(1)), (new_target(2)-correct_target(2)));
end

