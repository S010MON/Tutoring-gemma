%% Target point stage x, y coordinates before rotation of sample.
original_target = [-1.747000 0.724135];

%% Manually re-find the target to obtain x, y stage coordinates after rotation of sample, 
% if this is not possible or comparison of calculated and correct coordinate position is not required 
% then input zero.
correct_target = [-0.645757 0.871330];

%% Define 5 points before rotation of sample and input each stage position x, y coordinates.
original_position = [0.257000 0.827159; -1.747000 0.724135; 0.168001 2.826159; 0.00 0.00 ; 0.00 0.00];

%% Sort the points according to numbering scheme, e.g A is 1, B is 2, C is 3
nums = [1 2 3 4 5];
original_position = original_position(nums,:);

%% Define the position of the 5 points after sample rotation.
new_position = [0.970073 -0.310670; -0.645757 0.871330; 2.148984 1.311330; 0.00 0.00; 0.00 0.00];

%% Perform 2D geometric transformation to align to two sets of points
trans = fitgeotrans(original_position, new_position,'nonreflectivesimilarity');

%% Calculate location of target point in new position
nw = nw_xy_mm

for i = 1:62(nw)
    new_target = (transformPointsForward(trans,original_target));
    %% Print values obtained for calculated new target position, the correct (manually found) new position; 
    %% and the difference (error);
    fprintf('new target value: %s %s \n',new_target(1), new_target(2));
    fprintf('correct target value: %s %s \n',correct_target(1), correct_target(2));
    fprintf('difference: %s %s \n', (new_target(1)-correct_target(1)), (new_target(2)-correct_target(2)));
end



