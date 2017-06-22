function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    dpk = findpackage('sigdatatypes');
    findclass(dpk, 'parameter');
    % 10 13
    % 11 13
    c = schema.class(pk, 'fvtool', pk.findclass('sigcontainer'));
    % 13 15
    p = schema.prop(c, 'Analysis', 'string');
    set(p, 'SetFunction', @setanalysis);
    % 16 18
    p = schema.prop(c, 'OverlayedAnalysis', 'string');
    set(p, 'SetFunction', @setanalysis);
    % 19 21
    p = schema.prop(c, 'Filters', 'MATLAB array');
    set(p, 'SetFunction', @setfilters, 'GetFunction', @getfilters);
    % 22 24
    p = schema.prop(c, 'Grid', 'on/off');
    set(p, 'SetFunction', cellhorzcat(@setprop, 'Grid'), 'FactoryValue', 'On');
    % 25 27
    p = schema.prop(c, 'ShowReference', 'on/off');
    set(p, 'SetFunction', cellhorzcat(@setprop, 'ShowReference'), 'FactoryValue', 'on');
    % 28 30
    p = schema.prop(c, 'PolyphaseView', 'on/off');
    set(p, 'SetFunction', cellhorzcat(@setprop, 'PolyphaseView'), 'FactoryValue', 'off');
    % 31 33
    p = schema.prop(c, 'Legend', 'on/off');
    set(p, 'SetFunction', cellhorzcat(@setprop, 'Legend'));
    % 34 36
    p = schema.prop(c, 'FastUpdate', 'on/off');
    set(p, 'SetFunction', cellhorzcat(@setprop, 'FastUpdate'));
    % 37 39
    p = schema.prop(c, 'DisplayMask', 'on/off');
    set(p, 'GetFunction', @getdisplaymask, 'SetFunction', cellhorzcat(@setprop, 'DisplayMask'));
    % 40 42
    findclass(findpackage('dspopts'), 'sosview');
    p = schema.prop(c, 'SOSViewOpts', 'dspopts.sosview');
    set(p, 'SetFunction', cellhorzcat(@setprop, 'SOSViewOpts'));
    % 44 46
    findclass(findpackage('dspdata'), 'maskline');
    p = schema.prop(c, 'UserDefinedMask', 'dspdata.maskline');
    set(p, 'SetFunction', cellhorzcat(@setprop, 'UserDefinedMask'));
    % 48 50
    findclass(findpackage('sigresp'), 'abstractanalysis');
    p = vertcat(schema.prop(c, 'CurrentAnalysis', 'sigresp.abstractanalysis'), schema.prop(c, 'Parameters', 'sigdatatypes.parameter vector'));
    % 51 53
    set(p, 'AccessFlags.PublicSet', 'Off');
    set(p(2.0), 'SetFunction', @setparameters);
    % 54 56
    p = schema.prop(c, 'FsEditable', 'on/off');
    set(p, 'Visible', 'Off', 'FactoryValue', 'On');
    % 57 59
    p = vertcat(schema.prop(c, 'AnalysisListeners', 'handle.listener vector'), schema.prop(c, 'CurrentAnalysisListeners', 'handle.listener vector'), schema.prop(c, 'AnalysesInfo', 'MATLAB array'), schema.prop(c, 'SubMenuFixed', 'bool'), schema.prop(c, 'ParameterDlg', 'handle'), schema.prop(c, 'FiltRespWarnings', 'handle.EventData vector'), schema.prop(c, 'privFilters', 'MATLAB array'), schema.prop(c, 'SosViewListeners', 'handle.listener vector'), schema.prop(c, 'MaskListeners', 'handle.listener vector'), schema.prop(c, 'CachedFilters', 'MATLAB array'));
    % 59 70
    % 60 70
    % 61 70
    % 62 70
    % 63 70
    % 64 70
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 70 72
    schema.event(c, 'NewAnalysis');
    schema.event(c, 'NewFilter');
    schema.event(c, 'NewPlot');
    schema.event(c, 'NewParameters');
    % 75 77
    if isempty(findtype('signalAddReplace'))
        schema.EnumType('signalAddReplace', {'Add','Replace'});
    end % if
end % function
function value = setprop(this, value, prop)
    % 81 85
    % 82 85
    % 83 85
    ca = get(this, 'CurrentAnalysis');
    % 85 87
    if not(isempty(ca)) && isprop(ca, prop)
        set(ca, prop, value);
    end % if
    % 89 91
    sendfiltrespwarnings(this);
end % function
function out = setparameters(this, out)
    % 93 96
    % 94 96
    pname = 'ParameterListenerProp';
    p = findprop(this, pname);
    if isempty(p)
        % 98 102
        % 99 102
        % 100 102
        p = schema.prop(this, pname, 'MATLAB array');
        set(p, 'Visible', 'Off');
    end % if
    % 104 106
    l = handle.listener(union(out, this.Parameters), 'NewValidValues', @lclvalidvalues_listener);
    % 106 108
    set(l, 'CallbackTarget', this);
    set(this, pname, l);
end % function
function lclvalidvalues_listener(this, eventData)
    % 111 114
    % 112 114
    send(this, 'NewParameters', eventData);
end % function
function out = getdisplaymask(this, out)
    % 116 119
    % 117 119
    ca = get(this, 'CurrentAnalysis');
    % 119 121
    if isempty(ca)
        out = 'off';
    else
        if isprop(ca, 'DisplayMask')
            out = get(ca, 'DisplayMask');
        else
            out = 'off';
        end % if
    end % if
end % function
