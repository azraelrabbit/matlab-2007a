function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('MECH');
    % 9 11
    % 10 11
    hThisClass = schema.class(hCreateInPackage, 'MechPrimitiveHelper');
    % 12 15
    % 13 15
    % 14 15
    m = schema.method(hThisClass, 'CopyPrimitiveObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'bool'};
    % 20 21
    m = schema.method(hThisClass, 'SetPrimitiveObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'handle'};
    % 26 27
    m = schema.method(hThisClass, 'CreatePrimitiveObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle'};
    % 32 33
    m = schema.method(hThisClass, 'setRefFrameCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','mxArray'};
    % 37 38
    m = schema.method(hThisClass, 'setAxisCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','mxArray'};
    % 42 45
    % 43 45
    % 44 45
    if isempty(findtype('mechJointRefFrameEnum'))
        schema.EnumType('mechJointRefFrameEnum', {'World','Base','Follower'}, [1.0 2.0 3.0]);
        % 47 51
        % 48 51
        % 49 51
        % 50 51
    end % if
    % 52 53
    schema.prop(hThisClass, 'Name', 'string');
    schema.prop(hThisClass, 'Axis', 'string');
    schema.prop(hThisClass, 'Type', 'string');
    schema.prop(hThisClass, 'RefFrame', 'mechJointRefFrameEnum');
end % function
