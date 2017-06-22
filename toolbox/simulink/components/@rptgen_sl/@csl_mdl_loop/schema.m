function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 10 12
    clsH = schema.class(pkg, 'csl_mdl_loop', pkgRG.findclass('rpt_looper'));
    % 12 16
    % 13 16
    % 14 16
    pkg.findclass('rpt_mdl_loop_options');
    p = rptgen.prop(clsH, 'LoopList', 'rptgen_sl.rpt_mdl_loop_options vector');
    % 17 19
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @setLoopList;
    p.GetFunction = @getLoopList;
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    p = rptgen.prop(clsH, 'DlgLoopListIdx', 'mxArray', 0.0, xlate('Models to Include'), 2.0);
    % 29 40
    % 30 40
    % 31 40
    % 32 40
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    m = schema.method(clsH, 'dlgAdd');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'handle'};
    % 44 46
    m = schema.method(clsH, 'dlgMoveDown');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 50 52
    m = schema.method(clsH, 'dlgMoveUp');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 56 58
    m = schema.method(clsH, 'dlgSelect');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 62 64
    m = schema.method(clsH, 'dlgDelete');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 68 70
    rptgen.makeStaticMethods(clsH, {'dlgDeleteStatic'}, {'addModel';'dlgAdd';'dlgMoveDown';'dlgSelect';'dlgDelete';'dlgMoveUp';'findOptionsObject';'loop_getDialogSchema';'loop_getContextString';'loop_getLoopObjects';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState'});
    % 70 87
    % 71 87
    % 72 87
    % 73 87
    % 74 87
    % 75 87
    % 76 87
    % 77 87
    % 78 87
    % 79 87
    % 80 87
    % 81 87
    % 82 87
    % 83 87
    % 84 87
    % 85 87
end
function returnedValue = getLoopList(this, storedValue)
    % 88 92
    % 89 92
    % 90 92
    returnedValue = find(this, '-depth', 1.0, '-isa', 'rptgen_sl.rpt_mdl_loop_options');
    % 92 96
    % 93 96
    % 94 96
    if isempty(returnedValue)
        if not(isempty(storedValue))
            setLoopList(this, storedValue);
            returnedValue = storedValue
        else
            % 100 103
            % 101 103
            returnedValue = rptgen_sl.rpt_mdl_loop_options(this, 'MdlName', '$current');
            % 103 105
        end
    end
end
function storedValue = setLoopList(this, proposedValue)
    % 108 111
    % 109 111
    existingValues = find(this, '-depth', 1.0, '-isa', 'rptgen_sl.rpt_mdl_loop_options');
    % 111 115
    % 112 115
    % 113 115
    for i=1.0:length(existingValues)
        disconnect(existingValues(i));
    end % for
    % 117 119
    for i=1.0:length(proposedValue)
        if isa(proposedValue(i), 'rptgen_sl.rpt_mdl_loop_options')
            connect(proposedValue(i), this, 'up');
        else
            error('LoopList must contain rptgen_sl.rpt_mdl_loop_options');
        end
    end % for
    % 125 127
    storedValue = [];
end
