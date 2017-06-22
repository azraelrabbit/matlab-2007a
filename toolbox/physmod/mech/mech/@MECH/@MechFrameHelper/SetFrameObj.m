function destObj = SetFrameObj(hThis, destObj)
    % 1 5
    % 2 5
    % 3 5
    if isempty(destObj) || ~(ishandle(destObj)) || ~(strcmp(class(destObj), 'MECH.WorkingFrame'))
        error(xlate('MechPrimitiveHelper::CopyPrimitiveObj'), xlate('Invalid input argument.'));
        return
    end
    % 8 10
    destObj.Port = hThis.Port;
    destObj.Name = hThis.Name;
    destObj.Position = hThis.Position;
    destObj.PositionOrigin = hThis.PositionOrigin;
    destObj.PositionReference = hThis.PositionReference;
    destObj.Orientation = hThis.Orientation;
    destObj.OrientationType = hThis.OrientationType;
    destObj.OrientationFrame = hThis.OrientationFrame;
    destObj.ShowPort = 'false';
    if hThis.ShowPort
        destObj.ShowPort = 'true';
    end
    % 21 23
    allUnits = {'PositionUnits','PositionUnits','OrientationUnits','OrientationUnits'};
    % 23 25
    nUnits = mrdivide(length(allUnits), 2.0);
    for idx=1.0:nUnits
        thisUnit = allUnits{plus(1.0, mtimes(2.0, minus(idx, 1.0)))};
        srcUnit = allUnits{mtimes(2.0, idx)};
        theseChoices = hThis.(horzcat(thisUnit, 'Choices'));
        destObj.(srcUnit) = theseChoices{hThis.(thisUnit)};
    end % for
    % 31 34
    % 32 34
end
