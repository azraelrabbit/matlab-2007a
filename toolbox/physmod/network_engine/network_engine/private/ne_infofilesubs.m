function subs = ne_infofilesubs
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    persistent SUBS;
    % 11 13
    if isempty(SUBS)
        SUBS = struct('matlabroot', matlabroot, 'mexext', mexext);
        % 14 16
    end
    % 16 18
    subs = SUBS;
end
