function [entryArray, valsArray] = GetRefFrameComboItems(hThis, csIndex)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    entryArray = {'World','Adjoining'};
    valsArray = [-2.0 -1.0];
    itemIdx = 1.0;
    nFrames = numel(hThis.WorkFrames);
    % 11 12
    for idx=1.0:nFrames
        if ne(idx, csIndex)
            entryArray{plus(end, 1.0)} = hThis.WorkFrames(idx).Name;
            valsArray(plus(end, 1.0)) = idx;
        end % if
    end % for
end % function
