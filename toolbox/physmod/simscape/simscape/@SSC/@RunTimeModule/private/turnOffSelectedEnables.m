function [maskEnables, offIdx] = turnOffSelectedEnables(maskNames, maskEnables, whichOff)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    offIdx = logical(zeros(size(maskNames)));
    for anOffParam=whichOff
        offIdx = or(offIdx, strcmp(anOffParam, maskNames));
    end % for
    % 17 18
    maskEnables(offIdx) = {'off'};
end % function
