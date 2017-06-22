function config = pm_readconfigfile(filename)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    fid = fopen(filename, 'r');
    if eq(fid, -1.0)
        pm_error('pm_util:pm_readconfigfile:UnableToReadFile', filename);
    end
    % 22 24
    config = struct;
    lcount = 0.0;
    while ~(feof(fid))
        % 26 31
        % 27 31
        % 28 31
        % 29 31
        lcount = plus(lcount, 1.0);
        l = fgetl(fid);
        % 32 38
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        if ~(isequal(l, -1.0))
            % 38 42
            % 39 42
            % 40 42
            l(findstr(l, '#'):end) = [];
            l = strtrim(l);
            % 43 48
            % 44 48
            % 45 48
            % 46 48
            if ~(isempty(l))
                % 48 53
                % 49 53
                % 50 53
                % 51 53
                e = findstr(l, '=');
                % 53 58
                % 54 58
                % 55 58
                % 56 58
                if isempty(e)
                    lcounts = int2str(lcount);
                    fclose(fid);
                    pm_error('pm_util:pm_readconfigfile:InvalidLineFormat', lcounts, filename);
                end
                % 62 67
                % 63 67
                % 64 67
                % 65 67
                name = strtrim(l(1.0:minus(e, 1.0)));
                value = strtrim(l(plus(e, 1.0):end));
                % 68 73
                % 69 73
                % 70 73
                % 71 73
                if ~(isvarname(name))
                    lcounts = int2str(lcount);
                    fclose(fid);
                    pm_error('pm_util:pm_readconfigfile:InvalidPropertyName', lcounts, filename, name);
                end
                % 77 82
                % 78 82
                % 79 82
                % 80 82
                config.(name) = value;
            end
        end
    end % while
    % 85 87
    fclose(fid);
end
