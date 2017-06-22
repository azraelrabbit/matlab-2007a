function aObj = editsize(aObj, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    t = aObj;
    try
        size = str2double(varargin{1.0});
        aObj = set(aObj, 'LineWidth', size);
    catch
        % 14 15
        error('MATLAB:editsize:InvalidAction', 'Unable to set line size');
    end % try
end % function
