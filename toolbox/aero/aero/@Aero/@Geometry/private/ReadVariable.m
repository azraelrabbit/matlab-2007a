function [data, name] = ReadVariable(var, varname)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(license('test', 'aerospace_toolbox'))
        error('Aero:schema:noLicense', 'The use of the Aero.Animation object requires the Aerospace Toolbox.');
        % 11 12
    end % if
    % 13 15
    % 14 15
    if eq(license('checkout', 'aerospace_toolbox'), 0.0)
        return;
    end % if
    % 18 19
    data = var;
    name = varname;
    % 21 22
end % function
