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
    % 40 42
    c = resize(c);
end % function
function c = refresh(c)
end % function
function c = resize(c)
    % 46 56
    % 47 56
    % 48 56
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 58 66
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    c = controlsupdate(c, whichControl, varargin{:});
end % function
