function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
end
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
    set(c.x.ObjectTypeTitle, 'HorizontalAlignment', 'left');
    cdata = getslcdata(c);
    % 27 29
    set(c.x.ObjectType(2.0:5.0), {'cdata'}, vertcat(cellhorzcat(cdata.ModelLarge), cellhorzcat(cdata.SystemLarge), cellhorzcat(cdata.BlockLarge), cellhorzcat(cdata.SignalLarge)));
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    spacer = [-Inf 5.0];
    c.x.LayoutManager = vertcat(cellhorzcat(c.x.ObjectTypeTitle), cellhorzcat(vertcat(cellhorzcat('indent', c.x.ObjectType(1.0)), cellhorzcat(5.0, cellhorzcat(c.x.ObjectType(2.0), spacer, c.x.ObjectType(3.0), spacer, c.x.ObjectType(4.0), spacer, c.x.ObjectType(5.0))), {[1.0],[inf,1.0]})), {[10.0]}, cellhorzcat(cellhorzcat(c.x.LinkTextTitle, c.x.LinkText)));
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    c.x.HelpText = uicontrol(c.x.all, 'style', 'text', 'string', help('csllinktarget'), 'HorizontalAlignment', 'left');
    % 43 53
    % 44 53
    % 45 53
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    UpdateAutoText(c);
    % 53 56
    % 54 56
    c = resize(c);
end
function c = refresh(c)
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    UpdateAutoText(c);
end
function c = resize(c)
    % 65 72
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    c = controlsresize(c);
    if gt(c.x.lowLimit, plus(plus(c.x.yzero, mtimes(2.0, c.x.pad)), 40.0))
        pos = horzcat(plus(c.x.xzero, c.x.pad), plus(c.x.yzero, c.x.pad), minus(minus(c.x.xext, c.x.xzero), mtimes(2.0, c.x.pad)), minus(minus(c.x.lowLimit, c.x.yzero), mtimes(2.0, c.x.pad)));
        % 74 78
        % 75 78
        % 76 78
        set(c.x.HelpText, 'position', pos);
    else
        c.x.allInvisible = logical(1);
    end
end
function c = Update(c, whichControl, varargin)
    % 83 92
    % 84 92
    % 85 92
    % 86 92
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    c = controlsupdate(c, whichControl, varargin{:});
end
function UpdateAutoText(c)
    % 94 97
    % 95 97
    oType = getparentloop(c);
    if isempty(oType)
        oType = 'Model';
    end
    % 100 102
    set(c.x.ObjectType(1.0), 'String', sprintf('Automatic (%s)', oType));
end
