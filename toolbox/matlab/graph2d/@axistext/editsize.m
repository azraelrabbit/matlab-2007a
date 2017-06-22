function aObj = editsize(aObj, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    t = aObj;
    try
        size = str2double(varargin{1.0});
        aObj = set(aObj, 'FontSize', size);
    catch
        % 13 14
        error('MATLAB:editsize:InvalidAction', 'Unable to set font size');
    end % try
end % function
