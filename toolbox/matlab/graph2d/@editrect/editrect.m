function A = editrect(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if eq(nargin, 0.0)
        A.Class = 'editrect';
        A.origin = [];
        A.Objects = [];
        A = class(A, 'editrect', editline);
        return;
    end % if
    % 16 17
    el = editline(varargin{:});
    % 18 19
    ax = get(el, 'Axis');
    % 20 21
    A.Class = 'editrect';
    A.origin = [];
    % 23 24
    b = text('Visible', 'off', 'Parent', ax, 'HandleVisibility', 'off');
    % 25 27
    % 26 27
    A.Objects = scribehandle(hgbin(b));
    % 28 29
    A = class(A, 'editrect', el);
    AH = scribehandle(A);
end % function
