function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
end % function
function c = start(c)
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    c = controlsmake(c);
    % 24 26
    set(horzcat(c.x.TrueTextTitle), 'HorizontalAlignment', 'left');
    % 26 29
    % 27 29
    c.x.LayoutManager = vertcat({[10.0]}, cellhorzcat(c.x.TrueTextTitle), cellhorzcat(cellhorzcat('indent', c.x.TrueText)));
    % 29 33
    % 30 33
    % 31 33
    if gt(length(children(c)), 0.0)
        set(c.x.TrueText, 'enable', 'off');
    else
        set(c.x.TrueText, 'enable', 'on');
    end % if
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    c = resize(c);
end % function
function c = refresh(c)
end % function
function c = resize(c)
    % 48 58
    % 49 58
    % 50 58
    % 51 58
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 60 68
    % 61 68
    % 62 68
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    c = controlsupdate(c, whichControl, varargin{:});
end % function
