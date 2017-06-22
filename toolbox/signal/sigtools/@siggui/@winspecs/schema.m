function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    % 8 10
    c = schema.class(pk, 'winspecs', pk.findclass('siggui'));
    % 10 14
    % 11 14
    % 12 14
    pk = findpackage('sigwin');
    pk.findclass('window');
    p = schema.prop(c, 'Window', 'sigwin.window');
    set(p, 'SetFunction', @set_window);
    % 17 19
    p = schema.prop(c, 'Name', 'string');
    p.FactoryValue = 'window_';
    p.SetFunction = @set_name;
    % 21 23
    p = schema.prop(c, 'MATLABExpression', 'string');
    p.SetFunction = @set_prop;
    % 24 26
    p = schema.prop(c, 'Length', 'string');
    set(p, 'FactoryValue', '64', 'SetFunction', @set_prop);
    % 27 29
    p = schema.prop(c, 'SamplingFlag', 'signalSignalwindowsExtendedWindowSampling_flag');
    p.SetFunction = @set_prop;
    % 30 33
    % 31 33
    p = schema.prop(c, 'Data', 'mxArray');
    % 33 36
    % 34 36
    p = schema.prop(c, 'isModified', 'bool');
    set(p, 'Visible', 'Off');
    % 37 39
    p = schema.prop(c, 'Parameters', 'mxArray');
    set(p, 'Visible', 'Off', 'SetFunction', @set_prop);
    % 40 43
    % 41 43
    schema.event(c, 'NewState');
    schema.event(c, 'NewCurrentwinIndex');
end
function window = set_window(this, window)
    % 46 49
    % 47 49
    if isempty(window)
        return
    end
    % 51 53
    if isa(window, 'sigwin.parameterizewin')
        param = getparamnames(window);
        % 54 56
        paramstruct = get(this, 'Parameters');
        % 56 58
        if ~(isfield(paramstruct, param))
            paramstruct.(param) = sprintf('%g', window.(param));
            set(this, 'Parameters', paramstruct);
        end
    end
    % 62 65
    % 63 65
    set(this, 'isModified', 1.0);
end
function len = set_prop(this, len)
    % 67 70
    % 68 70
    set(this, 'isModified', 1.0);
end
function name = set_name(this, name)
    % 72 76
    % 73 76
    % 74 76
    set(this, 'isModified', 1.0);
    % 76 78
    if (~(isvarname(name))) | (isreserved(name, 'm'))
        error(horzcat('winspecs internal error : ''', name, ''' is not a valid name.'))
    end
end
