function updateFilePathsAndExtensions(h, varargin)
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
    if lt(nargin, 2.0)
        extList = {'.c','.C'};
    else
        if iscell(varargin{1.0})
            extList = varargin{1.0};
        else
            extList = cellhorzcat(varargin{1.0});
        end % if
    end % if
    % 22 24
    % 23 24
    h.Src.updateFilePathsAndExtensions(extList);
    % 25 26
    for i=1.0:length(h.LinkObj)
        h.LinkObj(i).updateFilePathsAndExtensions(extList);
    end % for
end % function
