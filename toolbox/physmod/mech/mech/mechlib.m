function varargout = mechlib(v)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    error(nargchk(0.0, 1.0, nargin, 'struct'));
    % 16 18
    % 17 18
    if eq(nargin, 0.0)
        vs = '1';
    else
        % 21 22
        if ischar(v)
            vs = v;
        else
            % 25 26
            vs = num2str(floor(v));
        end % if
    end % if
    % 29 30
    model = horzcat('mblibv', vs);
    % 31 32
    if eq(nargout, 0.0)
        % 33 34
        try
            open_system(model);
        catch
            error('physmod:mech:mechlib:CannotFindSimMechanics', 'Could not find SimMechanics %s (%s.mdl).', vs, model);
            % 38 39
        end % try
    else
        if gt(nargout, 0.0)
            varargout{1.0} = model;
        end % if
    end % if
end % function
