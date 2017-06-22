function settitle(hFDA, varargin)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    error(nargchk(1.0, 3.0, nargin));
    % 21 23
    % 22 23
    switch nargin
    case 1.0
        set(hFDA, 'FigureTitle', '');
        set(hFDA, 'SubTitle', '');
    case 2.0
        set(hFDA, 'SubTitle', strrep(varargin{1.0}, char(10.0), ' '));
    case 3.0
        set(hFDA, 'SubTitle', strrep(varargin{1.0}, char(10.0), ' '));
        set(hFDA, 'FigureTitle', strrep(varargin{2.0}, char(10.0), ' '));
    end % switch
end % function
