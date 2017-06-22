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
    set(horzcat(c.x.ConditionalStringTitle, c.x.TrueTextTitle), 'HorizontalAlignment', 'left');
    % 26 29
    % 27 29
    c.x.LayoutManager = vertcat({[10.0]}, cellhorzcat(c.x.ConditionalStringTitle), cellhorzcat(cellhorzcat('indent', c.x.ConditionalString)), {[10.0]}, cellhorzcat(c.x.TrueTextTitle), cellhorzcat(cellhorzcat('indent', c.x.TrueText)));
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    if gt(length(children(c)), 0.0)
        set(c.x.TrueText, 'enable', 'off');
    else
        set(c.x.TrueText, 'enable', 'on');
    end % if
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    c = resize(c);
end % function
function c = refresh(c)
end % function
function c = resize(c)
    % 51 61
    % 52 61
    % 53 61
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 63 71
    % 64 71
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    c = controlsupdate(c, whichControl, varargin{:});
end % function
