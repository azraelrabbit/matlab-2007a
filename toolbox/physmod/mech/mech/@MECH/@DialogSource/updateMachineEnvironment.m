function [enabled, disabled] = updateMachineEnvironment(src, tag, value)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    enabled = {};
    disabled = {};
    % 8 10
    switch tag
    case 'GravityAsSignal'
        if strcmp(value, 'on')
            disabled{plus(end, 1.0)} = 'Gravity';
        else
            enabled{plus(end, 1.0)} = 'Gravity';
        end % if
    case 'ConstraintSolverType'
        % 17 19
        if strcmp(value, 'Tolerancing')
            enabled{plus(end, 1.0)} = 'ConstraintRelTolerance';
            enabled{plus(end, 1.0)} = 'ConstraintAbsTolerance';
        else
            disabled{plus(end, 1.0)} = 'ConstraintRelTolerance';
            disabled{plus(end, 1.0)} = 'ConstraintAbsTolerance';
        end % if
    end % switch
