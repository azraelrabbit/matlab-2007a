function destObj = SetPrimitiveObj(hThis, destObj)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if isempty(destObj) || not(ishandle(destObj)) || not(strcmp(class(destObj), 'MECH.Primitive'))
        error(xlate('MechPrimitiveHelper::CopyPrimitiveObj'), xlate('Invalid input argument.'));
        return;
    end % if
    % 9 10
    destObj.Name = hThis.Name;
    destObj.Type = ctranspose(hThis.Type);
    % 12 13
    if strcmpi(destObj.Name, 'S')
        destObj.Axis = '[0 0 0]';
    else
        destObj.Axis = hThis.Axis;
    end % if
    % 18 19
    switch lower(hThis.RefFrame)
    case {'world','inertial'}
        destObj.ReferenceFrame = 'World';
    case 'base'
        destObj.ReferenceFrame = 'Base';
    case 'follower'
        destObj.ReferenceFrame = 'Follower';
    otherwise
        error(xlate('Unrecognized reference frame type'));
    end % switch
end % function
