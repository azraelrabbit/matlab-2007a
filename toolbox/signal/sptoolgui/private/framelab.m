function fl = framelab(framehand, labelstr, lfs, lh, varargin)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    pos = get(framehand, 'position');
    % 17 18
    lpos = horzcat(plus(pos(1.0), lfs), minus(plus(pos(2.0), pos(4.0)), mrdivide(lh, 2.0)), 100.0, lh);
    % 19 20
    l = uicontrol('style', 'text', 'units', 'pixels', 'string', horzcat(labelstr, ' '), 'position', lpos, varargin{:});
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    ex = get(l, 'extent');
    % 26 27
    set(l, 'position', horzcat(lpos(1.0:2.0), ex(3.0), lpos(4.0)))
    set(l, 'horizontalalignment', 'center')
    % 29 30
    if gt(nargout, 0.0)
        fl = l;
    end % if
end % function
