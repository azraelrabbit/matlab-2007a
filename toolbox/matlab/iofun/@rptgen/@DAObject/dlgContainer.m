function c = dlgContainer(this, cItems, cTitle, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    cItems = ctranspose(cItems(:));
    % 10 11
    if lt(nargin, 3.0) || isempty(cTitle)
        c = struct('Type', 'panel', 'Items', cellhorzcat(cItems), varargin{:});
    else
        % 14 15
        % 15 16
        c = struct('Type', 'group', 'Name', cTitle, 'Items', cellhorzcat(cItems), varargin{:});
        % 17 20
        % 18 20
        % 19 20
    end % if
end % function
