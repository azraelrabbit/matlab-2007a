function mech_primitivespringdamper
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    name = getfullname(gcb);
    h = gcbh;
    actuatedPrimitive = get_param(gcbh, 'actuatedPrimitive');
    positionUnits = get_param(gcbh, 'positionUnits');
    angleUnits = get_param(gcbh, 'angleUnits');
    velocityUnits = get_param(gcbh, 'velocityUnits');
    angleVelocityUnits = get_param(gcbh, 'angleVelocityUnits');
    forceUnits = get_param(gcbh, 'forceUnits');
    torqueUnits = get_param(gcbh, 'torqueUnits');
    % 20 21
    conversionName = horzcat(name, '/Conversion');
    position = get_param(conversionName, 'Position');
    delete_block(conversionName);
    if eq(actuatedPrimitive(1.0), 'R')
        add_block('SingleDofForceElement/Conversion', conversionName, 'Position', position);
        set_param(conversionName, 'AngleUnits', angleUnits, 'VelocityUnits', angleVelocityUnits);
    else
        add_block('built-in/Gain', conversionName, 'Position', position);
    end % if
    % 30 31
    set_param(horzcat(name, '/Position&Velocity Sensor'), 'Primitive', actuatedPrimitive);
    % 32 33
    set_param(horzcat(name, '/Position&Velocity Sensor'), 'CoordPositionUnits', positionUnits);
    % 34 35
    set_param(horzcat(name, '/Position&Velocity Sensor'), 'AngleUnits', angleUnits);
    % 36 37
    set_param(horzcat(name, '/Position&Velocity Sensor'), 'VelocityUnits', velocityUnits);
    % 38 39
    set_param(horzcat(name, '/Position&Velocity Sensor'), 'ArcVelocityUnits', angleVelocityUnits);
    % 40 41
    set_param(horzcat(name, '/Force Actuator'), 'Primitive', actuatedPrimitive);
    set_param(horzcat(name, '/Force Actuator'), 'ForceUnits', forceUnits);
    set_param(horzcat(name, '/Force Actuator'), 'TorqueUnits', torqueUnits);
end % function
