function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('spectrum');
    c = schema.class(pk, 'mtm', findclass(pk, 'abstractspectrum'));
    % 10 11
    findpackage('sigdatatypes');
    % 12 14
    % 13 14
    name = 'SignalSpectrumDataWinSpecMode';
    if isempty(findtype(name))
        schema.EnumType(name, {'DPSS','TimeBW'});
    end % if
    p = schema.prop(c, 'SpecifyDataWindowAs', name);
    set(p, 'SetFunction', @setdatawindowspecmode);
    set(p, 'AccessFlags.Abortset', 'off');
    p.FactoryValue = 'TimeBW';
    % 22 24
    % 23 24
    if isempty(findtype('SignalSpectrumCombineMethodList'))
        schema.EnumType('SignalSpectrumCombineMethodList', {'Adaptive','Eigenvalue','Unity'});
        % 26 29
        % 27 29
        % 28 29
    end % if
    p = schema.prop(c, 'CombineMethod', 'SignalSpectrumCombineMethodList');
    p.FactoryValue = 'Adaptive';
end % function
function mode = setdatawindowspecmode(this, mode)
    % 34 37
    % 35 37
    % 36 37
    propStr1 = 'TimeBW';
    propStr2 = 'DPSS';
    propStr3 = 'Concentrations';
    % 40 41
    if not(isprop(this, propStr1))
        % 42 43
        p1 = schema.prop(this, propStr1, 'double');
        set(this, propStr1, 4.0);
    else
        p1 = findprop(this, propStr1);
    end % if
    % 48 49
    if not(isprop(this, propStr2))
        % 50 51
        p2 = schema.prop(this, propStr2, 'MATLAB array');
        p3 = schema.prop(this, propStr3, 'double_vector');
        % 53 55
        % 54 55
        nfft = 256.0;
        [E, V] = dpss(nfft, this.TimeBW);
        set(this, 'DPSS', E, 'Concentrations', V);
    else
        % 59 60
        p2 = findprop(this, propStr2);
        p3 = findprop(this, propStr3);
    end % if
    % 63 65
    % 64 65
    if strcmpi(mode, 'TimeBW')
        prop1State = 'on';
        prop2State = 'off';
        prop3State = 'off';
    else
        prop1State = 'off';
        prop2State = 'on';
        prop3State = 'on';
        % 73 74
    end % if
    enabdynprop(this, propStr1, prop1State);
    enabdynprop(this, propStr2, prop2State);
    enabdynprop(this, propStr3, prop3State);
end % function
