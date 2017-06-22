function varargout = drive_enginemodel(Mode)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    switch lower(Mode)
    case 'maskdiesel'
        Data = drive_getmaskdata(gcb);
        power_max = Data.power_max;
        speed_at_power_max = Data.speed_at_power_max;
        speed_max = Data.speed_max;
        % 17 19
        p0 = 0.0;
        p1 = mrdivide(mtimes(.65259157794653, power_max), speed_at_power_max);
        p2 = mrdivide(mtimes(1.69481684410694, power_max), mpower(speed_at_power_max, 2.0));
        p3 = mrdivide(mtimes(-1.34740842205346, power_max), mpower(speed_at_power_max, 3.0));
        p = horzcat(p3, p2, p1, p0);
        speed = transpose(linspace(2.220446049250313e-16, speed_max, 101.0));
        power = polyval(p, speed);
        torque = mtimes(9.549296585513721, rdivide(power, speed));
        % 26 28
        varargout(1.0) = cellhorzcat(speed);
        varargout(2.0) = cellhorzcat(power);
        varargout(3.0) = cellhorzcat(torque);
        varargout(4.0) = cellhorzcat(p);
    case 'maskgasoline'
        % 32 34
        Data = drive_getmaskdata(gcb);
        power_max = Data.power_max;
        speed_at_power_max = Data.speed_at_power_max;
        speed_max = Data.speed_max;
        % 37 39
        p0 = 0.0;
        p1 = mrdivide(power_max, speed_at_power_max);
        p2 = mrdivide(power_max, mpower(speed_at_power_max, 2.0));
        p3 = mrdivide(uminus(power_max), mpower(speed_at_power_max, 3.0));
        p = horzcat(p3, p2, p1, p0);
        speed = transpose(linspace(2.220446049250313e-16, speed_max, 101.0));
        power = polyval(p, speed);
        torque = mtimes(9.549296585513721, rdivide(power, speed));
        % 46 48
        varargout(1.0) = cellhorzcat(speed);
        varargout(2.0) = cellhorzcat(power);
        varargout(3.0) = cellhorzcat(torque);
        varargout(4.0) = cellhorzcat(p);
    case 'start'
        % 52 54
        FullName = getfullname(gcb);
        Name = get_param(gcb, 'Name');
        Parent = get_param(gcb, 'Parent');
        Data = drive_getmaskdata(gcb);
        % 57 59
        p3 = Data.p(1.0);
        p2 = Data.p(2.0);
        p1 = Data.p(3.0);
        p0 = Data.p(4.0);
        speed_max = Data.speed_max;
        speed_max_max = mrdivide(mrdivide(uminus(plus(p2, sqrt(minus(mpower(p2, 2.0), mtimes(mtimes(4.0, p3), p1))))), 2.0), p3);
        if gt(speed_max, speed_max_max)
            % 65 68
            % 66 68
            blockName = horzcat('''', FullName, '''');
            error('physmod:drive:drive_enginemodel:InvalidMaxSpeed', horzcat('Error in the Engine block:', blockName, '. The maximum speed is too large. ', 'The engine power and torque can become negative. Reduce the maximum speed to ', num2str(floor(speed_max_max)), ' RPM or less.'));
            % 69 73
            % 70 73
            % 71 73
        end % if
    otherwise
        % 74 76
        Name = get_param(gcb, 'Name');
        Parent = get_param(gcb, 'Parent');
        blockName = horzcat('''', Parent, '/', Name, '''');
        error('physmod:drive:drive_enginemodel:IllegalMode', horzcat('Error in ', blockName, ':', ' Illegal Mode value.'));
        % 79 81
    end % switch
