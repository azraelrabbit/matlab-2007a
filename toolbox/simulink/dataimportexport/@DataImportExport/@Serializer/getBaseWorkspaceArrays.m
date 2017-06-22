function [Arrays, ArrayNames] = getBaseWorkspaceArrays(hSerializer)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    Arrays = [];
    % 9 11
    % 10 11
    ArrayNames = evalin('base', 'who');
    % 12 14
    % 13 14
    for idx=1.0:length(ArrayNames)
        % 15 16
        Arrays{idx} = evalin('base', ArrayNames{idx});
    end % for
    % 18 19
end % function
