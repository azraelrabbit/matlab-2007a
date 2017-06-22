function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('slmgr');
    c = schema.class(pk, 'SimState');
    % 10 11
    definetypes;
    % 12 15
    % 13 15
    % 14 15
    schema.prop(c, 'System', 'Simulink.BlockDiagram');
    % 16 19
    % 17 19
    % 18 19
    p = schema.prop(c, 'CurrentState', 'sl_state_enum');
    p.FactoryValue = 'unknown';
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(c, 'StopCallback', 'mxArray');
    p.SetFunction = @check_callback_param;
    % 26 27
    p = schema.prop(c, 'RunCallback', 'mxArray');
    p.SetFunction = @check_callback_param;
    % 29 30
    p = schema.prop(c, 'CloseCallback', 'mxArray');
    p.SetFunction = @check_callback_param;
    % 32 33
    p = schema.prop(c, 'PauseCallback', 'mxArray');
    p.SetFunction = @check_callback_param;
    % 35 36
    p = schema.prop(c, 'ContinueCallback', 'mxArray');
    p.SetFunction = @check_callback_param;
    % 38 42
    % 39 42
    % 40 42
    % 41 42
    p = schema.prop(c, 'CallbackOnConnect', 'bool');
    p.FactoryValue = true;
    % 44 47
    % 45 47
    % 46 47
    p = schema.prop(c, 'Verbose', 'bool');
    p.FactoryValue = false;
    % 49 52
    % 50 52
    % 51 52
    p = schema.prop(c, 'Listeners', 'handle.listener vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
function S = check_callback_param(H, S)
    % 57 61
    % 58 61
    % 59 61
    % 60 61
    c = isa(S, 'cell');
    if not(isempty(S)) && not(c) && not(isa(S, 'function_handle'))
        callback_syntax_error;
    end % if
    if c
        if not(isa(S{1.0}, 'function_handle'))
            callback_syntax_error;
        end % if
    end % if
end % function
function callback_syntax_error
    % 72 73
    error('Callback must be a function handle or cell-array\nwith a function handle as the first entry.', '');
end % function
function definetypes
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    % 80 81
    if isempty(findtype('sl_state_enum'))
        schema.EnumType('sl_state_enum', {'unknown','stopped','running','closed','paused'});
    end % if
    % 84 85
    findclass(findpackage('Simulink'), 'BlockDiagram');
end % function
