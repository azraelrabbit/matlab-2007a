function destObj = SetPrimitiveStateObj(hThis, destObj)
    % 1 5
    % 2 5
    % 3 5
    if isempty(destObj) || ~(ishandle(destObj)) || ~(strcmp(class(destObj), 'MECH.PrimitiveState'))
        error(xlate('MechPrimitiveStateHelper::CopyPrimitiveStateObj'), xlate('Invalid input argument.'));
        return
    end
    % 8 10
    destObj.PrimitiveName = hThis.Name;
    if eq(hThis.Enabled, true)
        destObj.IsSet = 'true';
    else
        destObj.IsSet = 'false';
    end
    destObj.CoordPosition = hThis.Position;
    destObj.Velocity = hThis.Velocity;
    % 17 19
    allUnits = {'PosUnit','CoordPositionUnits','angUnit','AngleUnits','velUnit','VelocityUnits','angVelUnit','ArcVelocityUnits'};
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    nUnits = mrdivide(length(allUnits), 2.0);
    for idx=1.0:nUnits
        thisUnit = allUnits{plus(1.0, mtimes(2.0, minus(idx, 1.0)))};
        srcUnit = allUnits{mtimes(2.0, idx)};
        theseChoices = hThis.(horzcat(thisUnit, 'Choices'));
        destObj.(srcUnit) = theseChoices{hThis.(thisUnit)};
    end % for
end
