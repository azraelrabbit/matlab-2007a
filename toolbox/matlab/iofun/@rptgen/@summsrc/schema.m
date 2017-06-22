function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('rptgen');
    % 10 11
    h = schema.class(pkg, 'summsrc', pkg.findclass('DAObject'));
    % 12 15
    % 13 15
    % 14 15
    p = rptgen.prop(h, 'Type', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 17 18
    pkg.findclass('propsrc');
    p = rptgen.prop(h, 'PropSrc', 'rptgen.propsrc');
    p.AccessFlags.PublicSet = 'off';
    % 21 22
    pkg.findclass('rpt_looper');
    p = rptgen.prop(h, 'LoopComp', 'rptgen.rpt_looper');
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.GetFunction = @getLoopComp;
    p.SetFunction = @setLoopComp;
    % 30 31
    p = rptgen.prop(h, 'Properties', 'string vector', {}, xlate('Property columns'));
    % 32 34
    % 33 34
    p = rptgen.prop(h, 'ColumnHeaders', 'string vector', {}, xlate('Custom headers'));
    % 35 37
    % 36 37
    p = rptgen.prop(h, 'Anchor', 'bool', false, xlate('Insert anchor for each row'));
    % 38 40
    % 39 40
    p = rptgen.prop(h, 'FilterEmptyColumns', 'bool', true, xlate('Remove empty columns'));
    % 41 44
    % 42 44
    % 43 44
    p = rptgen.prop(h, 'ColumnWidths', 'MATLAB array', [], xlate('Relative column widths'));
    % 45 47
    % 46 47
    p = rptgen.prop(h, 'DlgCurrentPropertyIdx', 'int32', 1.0, '', 2.0);
    % 48 49
    m = find(h.Method, 'Name', 'getDialogSchema');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle','string'};
        s.OutputTypes = {'mxArray'};
    end % if
end % function
function storedValue = setLoopComp(this, proposedValue)
    % 58 60
    % 59 60
    storedValue = [];
    oldLoopComp = getLoopComp(this, []);
    if not(isempty(oldLoopComp))
        disconnect(oldLoopComp);
    end % if
    % 65 66
    connect(proposedValue, this, 'up');
end % function
function returnedValue = getLoopComp(this, storedValue)
    % 69 71
    % 70 71
    returnedValue = find(this, '-depth', 1.0, '-isa', 'rptgen.rpt_looper');
    if not(isempty(returnedValue))
        returnedValue = returnedValue(1.0);
    end % if
end % function
