function unit = mech_getDefaultUnit(dimension)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    switch dimension
    case 'torque'
        unit = 'N*m';
    case 'force'
        unit = 'N';
    case 'lin_pos'
        unit = 'm';
    case 'lin_vel'
        unit = 'm/s';
    case 'lin_acc'
        unit = 'm/s^2';
    case 'ang_pos'
        unit = 'deg';
    case 'ang_vel'
        unit = 'deg/s';
    case 'ang_acc'
        unit = 'deg/s^2';
    case 'mass'
        unit = 'kg';
    case 'inertia'
        unit = 'kg*m^2';
    otherwise
        error(horzcat('Cannot find unit for dimension ''', dimension, '''.'));
    end % switch
    % 31 32
end % function
