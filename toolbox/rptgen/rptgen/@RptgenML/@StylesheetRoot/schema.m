function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pkg = findpackage('RptgenML');
    pkgRG = findpackage('rptgen');
    % 8 10
    clsH = schema.class(pkg, 'StylesheetRoot', pkgRG.findclass('DAObject'));
    % 10 14
    % 11 14
    % 12 14
    p = schema.prop(clsH, 'StylesheetLibrary', 'handle');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 18 20
    p = schema.prop(clsH, 'CategoryNEW', 'handle');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.Visible = 'off';
    p.GetFunction = cellhorzcat(@getCategory, 'NEW', xlate('New Stylesheet'), true);
    % 26 29
    % 27 29
    tTypes = vertcat(cellhorzcat('HTML', xlate('HTML'), true), cellhorzcat('FO', xlate('Formatting Objects (PDF)'), true), cellhorzcat('DSSSL', xlate('DSSSL Print (RTF)'), true), cellhorzcat('DSSSLHTML', xlate('DSSSL HTML (v1)'), getFmtVis('html-dsssl')), cellhorzcat('LATEX', xlate('LaTeX'), getFmtVis('latex')));
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    for i=1.0:size(tTypes, 1.0)
        p = schema.prop(clsH, horzcat('Params', tTypes{i, 1.0}), 'handle');
        p.AccessFlags.PublicSet = 'off';
        p.AccessFlags.Reset = 'off';
        p.AccessFlags.Serialize = 'off';
        p.Visible = 'off';
        % 42 44
        p = schema.prop(clsH, horzcat('Category', tTypes{i, 1.0}), 'handle');
        p.AccessFlags.PublicSet = 'off';
        p.AccessFlags.Reset = 'off';
        p.AccessFlags.Serialize = 'off';
        p.AccessFlags.AbortSet = 'off';
        p.Visible = 'off';
        p.GetFunction = horzcat(cellhorzcat(@getCategory), tTypes(i, :));
        % 50 52
    end % for
    % 52 54
    p = schema.prop(clsH, 'CategoryEmpty', 'handle');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.Visible = 'off';
    p.GetFunction = cellhorzcat(@getCategory, 'Empty', '', false);
    % 60 64
    % 61 64
    % 62 64
    m = schema.method(clsH, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 68 70
    m = schema.method(clsH, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 74 76
    m = schema.method(clsH, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 80 82
    m = schema.method(clsH, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 86 88
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 92 94
    m = schema.method(clsH, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 98 100
    m = schema.method(clsH, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 104 106
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 110 112
    m = schema.method(clsH, 'canAcceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 116 118
    m = schema.method(clsH, 'acceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 122 124
    m = schema.method(clsH, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
function returnedValue = getCategory(this, storedValue, id, displayName, isVisible)
    % 129 142
    % 130 142
    % 131 142
    % 132 142
    % 133 142
    % 134 142
    % 135 142
    % 136 142
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    if isempty(storedValue)
        ssLib = this.StylesheetLibrary;
        if isempty(ssLib)
            ssLib = this.getStylesheetLibrary;
            returnedValue = get(this, horzcat('Category', id));
        else
            returnedValue = RptgenML.LibraryCategory(displayName, 'Visible', isVisible, 'Tag', id, 'HelpMapFile', RptgenML.getHelpMapfile, 'HelpMapKey', horzcat('category.StylesheetType.', lower(id)));
            % 148 153
            % 149 153
            % 150 153
            % 151 153
            connect(returnedValue, ssLib, 'up');
            set(this, horzcat('Category', id), returnedValue);
        end % if
    else
        returnedValue = storedValue;
    end % if
function isVis = getFmtVis(fmtID)
    % 159 163
    % 160 163
    % 161 163
    try
        isVis = getVisible(com.mathworks.toolbox.rptgencore.output.OutputFormat.getFormat(fmtID));
    catch
        isVis = false;
    end % try
