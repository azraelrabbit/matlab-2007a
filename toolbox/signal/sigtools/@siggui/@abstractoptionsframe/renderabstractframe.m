function renderabstractframe(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pos = parserenderinputs(this, varargin{:});
    % 8 11
    % 9 11
    if isempty(pos)
        sz = gui_sizes(this);
        pos = times(sz.pixf, horzcat(217.0, 55.0, 178.0, minus(131.0, mrdivide(sz.vffs, sz.pixf))));
    end % if
    % 14 16
    framewlabel(this, pos, get(this, 'Name'));
    % 16 19
    % 17 19
    if not(isempty(getbuttonprops(this)))
        renderactionbtn(this, pos, 'More options ...', 'editadditionalparameters');
    end % if
end % function
