function cmd = tlcsetup(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    cmd = [];
    for i=2.0:nargin
        if gt(i, 2.0)
            cmd = horzcat(cmd, ',');
        end % if
        cmd = horzcat(cmd, '''', varargin{i}, '''');
    end % for
end % function
