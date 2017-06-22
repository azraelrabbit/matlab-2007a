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
    c.x.allTitle = uicontrol(c.x.all, 'style', 'text', 'String', 'Only execute subcomponents:', 'HorizontalAlignment', 'left');
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    c.x.LayoutManager = vertcat(cellhorzcat(c.x.allTitle), {[5.0,5.0]}, cellhorzcat(vertcat(cellhorzcat(c.x.minNumBlocksTitle, c.x.minNumBlocks), cellhorzcat(c.x.minNumSubSystemsTitle, c.x.minNumSubSystems), {[5.0],[5.0]}, cellhorzcat(c.x.isMaskTitle, c.x.isMask(1.0)), cellhorzcat(5.0, c.x.isMask(2.0)), cellhorzcat(5.0, c.x.isMask(3.0)))));
    % 35 44
    % 36 44
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
    % 48 57
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    c = controlsresize(c);
end % function
function c = Update(c, whichControl, varargin)
    % 59 67
    % 60 67
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    c = controlsupdate(c, whichControl, varargin{:});
end % function
