function [success, err] = setProp(h, prop, value)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    for i=1.0:numel(h.prop_sets)
        if h.prop_set_enables(i)
            % 24 28
            % 25 28
            % 26 28
            try
                % 28 33
                % 29 33
                % 30 33
                % 31 33
                h.prop_sets{i}.(prop) = value;
                % 33 36
                % 34 36
                success = true;
                err = [];
                return
            catch
                % 39 41
                err = lasterror;
                success = strcmpi(err.identifier, 'MATLAB:noPublicFieldForClass');
                if ~(success)
                    return
                end
            end % try
        end
    end % for
    % 48 51
    % 49 51
    success = false;
end
