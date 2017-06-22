function setappdata(h, name, val)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if lt(nargin, 3.0)
        % 14 16
        if ~(isstruct(name))
            error('uimgr:setappdata:MustBeStruct', 'Replacing all data requires a struct argument.')
            % 17 19
        end
        h.AppData = name;
    else
        % 21 23
        h.AppData.(name) = val;
    end
end
