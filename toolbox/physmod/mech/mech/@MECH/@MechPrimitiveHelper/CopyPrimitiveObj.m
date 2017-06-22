function retVal = CopyPrimitiveObj(hThis, srcObj)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    retVal = false;
    if isempty(srcObj) || not(ishandle(srcObj)) || not(strcmp(class(srcObj), 'MECH.Primitive'))
        error(xlate('MechPrimitiveHelper::CopyPrimitiveObj'), xlate('Invalid input argument.'));
        return;
    end % if
    % 10 11
    hThis.Name = srcObj.Name;
    hThis.Type = srcObj.Type;
    hThis.Axis = srcObj.Axis;
    switch lower(srcObj.ReferenceFrame)
    case {'world','inertial'}
        hThis.RefFrame = 'World';
    case 'base'
        hThis.RefFrame = 'Base';
    case 'follower'
        hThis.RefFrame = 'Follower';
    end % switch
end % function
