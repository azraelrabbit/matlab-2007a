function slEnableMultiDimensions
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    fprintf('-------------------------------------------------------------\n');
    fprintf('Multi-dimension support enabled in Simulink.\nThis Simulink session now supports signals with \nmore than two dimensions. This capability is for\ndemonstration purposes only. Models saved when \nmulti-dimension support is enabled may not work \nproperly in a Simulink session where this capability\nis disabled. Please restart MATLAB to disable this capabilty.\n');
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    fprintf('--------------------------------------------------------------\n');
    slfeature('MultiDimensionSupport', 1.0);
end % function
