function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pk = findpackage('channel');
    % 9 11
    c = schema.class(pk, 'multipathaxes', findclass(pk, 'baseclass'));
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    p = schema.prop(c, 'MultipathFigParent', 'mxArray');
    % 17 19
    p = schema.prop(c, 'FigureHandle', 'mxArray');
    % 19 21
    p = schema.prop(c, 'ParentHandle', 'mxArray');
    % 21 23
    p = schema.prop(c, 'AxesHandle', 'mxArray');
    % 23 25
    p = schema.prop(c, 'PlotHandles', 'mxArray');
    % 25 27
    p = schema.prop(c, 'AuxObjHandles', 'mxArray');
    % 27 29
    p = schema.prop(c, 'Title', 'mxArray');
    p = schema.prop(c, 'Tag', 'mxArray');
    p = schema.prop(c, 'XLabel', 'mxArray');
    p = schema.prop(c, 'YLabel', 'mxArray');
    % 32 34
    p = schema.prop(c, 'Position', 'mxArray');
    p.FactoryValue = [0.0 0.0 100.0 100.0];
    p.SetFunction = @setPosition;
    % 36 38
    p = schema.prop(c, 'Active', 'strictbool');
    p.FactoryValue = false;
    p.SetFunction = @setactive;
    % 40 42
    p = schema.prop(c, 'FirstPlot', 'strictbool');
    % 42 44
    p = schema.prop(c, 'NewChannelData', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    % 45 47
    p = schema.prop(c, 'OldChannelData', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    p = schema.prop(c, 'SnapshotTimeStampVector', 'mxArray');
    p.FactoryValue = 1.0;
    % 54 56
    p = schema.prop(c, 'PlotColorOrder', 'mxArray');
    p.FactoryValue = plotcolororder;
end % function
function p = setPosition(h, p)
    % 59 65
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    if h.Constructed
        setaxesposition(h, p);
    end % if
end % function
function c = plotcolororder
    N = 64.0;
    c = zeros(N, 3.0);
    c(:, 3.0) = horzcat(linspace(0.0, 1.0, mrdivide(N, 2.0)), ones(1.0, mrdivide(N, 2.0)));
    c(:, 1.0) = flipud(c(:, 3.0));
end % function
