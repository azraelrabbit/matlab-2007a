function destObj = SetJointSpringDamperStateObj(hThis, destObj)
    % 1 5
    % 2 5
    % 3 5
    if isempty(destObj) || ~(ishandle(destObj)) || ~(strcmp(class(destObj), 'MECH.JointSpringDamperState'))
        error(xlate('MechJointSpringDamperStateHelper::SetJointSpringDamperStateObj'), xlate('Invalid input argument.'));
        return
    end
    % 8 10
    destObj.PrimitiveName = hThis.Name;
    if eq(hThis.IsSet, 1.0)
        destObj.IsSet = 'true';
    else
        destObj.IsSet = 'false';
    end
    destObj.Spring_k = hThis.Spring_k;
    destObj.Damper_b = hThis.Damper_b;
    destObj.Offset_x0 = hThis.Offset_x0;
    % 18 20
    allUnits = {'PositionUnits';'VelocityUnits';'AngleUnits';'AngleVelocityUnits';'ForceUnits';'TorqueUnits'};
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    nUnits = length(allUnits);
    for idx=1.0:nUnits
        thisUnit = allUnits{idx};
        theseChoices = hThis.(horzcat(thisUnit, 'Choices'));
        destObj.(thisUnit) = theseChoices{hThis.(thisUnit)};
    end % for
end
