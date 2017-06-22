function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    mlock;
    % 9 10
    pkg = findpackage('hdlshared');
    this = schema.class(pkg, 'SimulinkConnection');
    % 12 14
    % 13 14
    if isempty(findtype('BlockDiagramHandle'))
        schema.UserType('BlockDiagramHandle', 'handle', @checkBlockDiagramHandle);
        % 16 17
    end % if
    % 18 19
    if isempty(findtype('SubsystemGraphHandle'))
        schema.UserType('SubsystemGraphHandle', 'handle', @checkSubsystemGraphHandle);
        % 21 22
    end % if
    % 23 25
    % 24 25
    schema.prop(this, 'ModelName', 'string');
    % 26 28
    % 27 28
    p = schema.prop(this, 'Model', 'BlockDiagramHandle');
    p.getFunction = @getModel;
    % 30 32
    % 31 32
    schema.prop(this, 'System', 'string');
    % 33 35
    % 34 35
    schema.prop(this, 'BlockReductionOpt', 'on/off');
    schema.prop(this, 'ConditionallyExecuteInputs', 'on/off');
    schema.prop(this, 'DirtyState', 'on/off');
    % 38 40
    % 39 40
    schema.prop(this, 'ModelRates', 'mxArray');
    % 41 43
    % 42 43
    schema.prop(this, 'SignalLogging', 'string');
    schema.prop(this, 'SignalLoggingName', 'string');
    % 45 46
    schema.prop(this, 'InportTestPoint', 'string vector');
    schema.prop(this, 'InportDataLogging', 'string vector');
    schema.prop(this, 'InportDataLoggingNameMode', 'string vector');
    schema.prop(this, 'InportDataLoggingName', 'string vector');
    % 50 51
    schema.prop(this, 'OutportTestPoint', 'string vector');
    schema.prop(this, 'OutportDataLogging', 'string vector');
    schema.prop(this, 'OutportDataLoggingNameMode', 'string vector');
    schema.prop(this, 'OutportDataLoggingName', 'string vector');
    % 55 58
    % 56 58
    % 57 58
    schema.prop(this, 'StartNode', 'SubsystemGraphHandle');
end % function
function checkBlockDiagramHandle(h)
    % 61 63
    % 62 63
    if not(isempty(h)) && not(isa(h, 'Simulink.BlockDiagram'))
        error(hdlerrormsgid('simulinkconnection'), 'Invalid BlockDiagram handle');
    end % if
end % function
function checkSubsystemGraphHandle(h)
    % 68 70
    % 69 70
    if not(isempty(h)) && not(isa(h, 'Simulink.SubsystemGraph'))
        error(hdlerrormsgid('simulinkconnection'), 'Invalid SubsystemGraph handle');
    end % if
end % function
