function menuedit(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    warning('MATLAB:menuedit:ObsoleteFunction', 'MENUEDIT function is obsolete. Use the GUIDE command instead.');
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    switch nargin
    case 0.0
        % 15 16
        guide;
    case 1.0
        % 18 19
        guide(varargin{1.0});
    otherwise
        % 21 22
        error('MATLAB:menuedit:WrongNumberInputs', 'Wrong number of input arguments for MENUEDIT.');
        % 23 24
    end % switch
end % function
