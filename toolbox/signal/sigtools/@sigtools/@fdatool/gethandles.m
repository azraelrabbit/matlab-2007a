function h = gethandles(hFDA, varargin)
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
    error(nargchk(1.0, 4.0, nargin));
    % 21 22
    h = get(hFDA, 'Handles');
    % 23 24
    if gt(nargin, 1.0)
        h = getfield(h, varargin{:});
    end % if
end % function
