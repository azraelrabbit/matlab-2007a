function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('filtstates');
    c = schema.class(pk, 'cic');
    % 9 12
    % 10 12
    c.Handle = 'off';
    % 12 15
    % 13 15
    p = schema.prop(c, 'Integrator', 'mxArray');
    set(p, 'FactoryValue', 0.0, 'SetFunction', @set_integrator, 'AccessFlags.AbortSet', 'Off');
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    p = schema.prop(c, 'Comb', 'mxArray');
    set(p, 'FactoryValue', 0.0, 'SetFunction', @set_comb, 'AccessFlags.AbortSet', 'Off');
    % 24 27
    % 25 27
end
function int = set_integrator(this, int)
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    [rows, cols] = size(int);
    % 33 35
    if isnumeric(int) || isa(int, 'embedded.fi')
        % 35 38
        % 36 38
        if isa(int, 'double')
            int = int32(int);
        end
        % 40 43
        % 41 43
        for indx=1.0:rows
            for jndx=1.0:cols
                val(indx, jndx) = filtstates.state(int(indx, jndx));
            end % for
        end % for
        int = val;
    else
        if isa(int, 'filtstates.state'), else
            % 50 60
            % 51 60
            % 52 60
            % 53 60
            % 54 60
            % 55 60
            % 56 60
            % 57 60
            % 58 60
            % 59 61
            error(generatemsgid('invalidIntegratorStates'), 'The value must be a number, a FI or FILTSTATES.STATE object.');
            % 61 63
        end
    end
end
function comb = set_comb(this, comb)
    % 66 68
    nsections = size(this.Integrator, 1.0);
    % 68 71
    % 69 71
    if isnumeric(comb) || isa(comb, 'embedded.fi')
        % 71 74
        % 72 74
        if isa(comb, 'double')
            comb = int32(comb);
        end
        [rows, cols] = size(comb);
        % 77 85
        % 78 85
        % 79 85
        % 80 85
        % 81 85
        % 82 85
        % 83 85
        M = floor(mrdivide(rows, nsections));
        for indx=1.0:cols
            for jndx=1.0:nsections
                val(jndx, indx) = filtstates.state(comb(plus(1.0, mtimes(minus(jndx, 1.0), M)):mtimes(jndx, M), indx));
                % 88 90
            end % for
        end % for
        comb = val;
    else
        if not(isa(comb, 'filtstates.state'))
            error(generatemsgid('invalidCombStates'), 'The value must be a number, a FI or FILTSTATES.STATE object.');
        end
    end
end
