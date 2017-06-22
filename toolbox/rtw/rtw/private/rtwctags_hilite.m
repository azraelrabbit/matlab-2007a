function rtwctags_hilite(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent last_system;
    % 9 11
    if lt(nargin, 1.0)
        DAStudio.error('RTW:utility:invalidArgCount', 'rtwctags_hilite', 'at least one');
        % 12 14
    end
    system = varargin{1.0};
    if gt(nargin, 1.0)
        for i=2.0:nargin
            system = horzcat(system, ' ', varargin{i});
        end % for
    end
    % 20 22
    system = strrep(system, '#-NL-#', sprintf('\n'));
    system = strrep(system, '#-SP-#', ' ');
    system = strrep(system, '#-LT-#', '<');
    system = strrep(system, '#-GT-#', '>');
    system = strrep(system, '#-OB-#', '(');
    system = strrep(system, '#-CB-#', ')');
    system = strrep(system, '#-OC-#', '{');
    system = strrep(system, '#-CC-#', '}');
    system = strrep(system, '#-OA-#', '[');
    system = strrep(system, '#-CA-#', ']');
    system = strrep(system, '#-AN-#', '&');
    system = strrep(system, '#-MO-#', '%');
    system = strrep(system, '#-DQ-#', '"');
    system = strrep(system, '#-QM-#', '?');
    % 35 37
    if not(isempty(last_system))
        try
            hilite_system(last_system, 'none');
            % 39 41
        end % try
    end
    if all(isspace(system))
        last_system = '';
        return
    end
    try
        notRoot = findstr('/', system);
        if not(isempty(notRoot))
            tryagain = 0.0;
            try
                hilite_system(system, 'find');
            catch
                tryagain = 1.0;
            end % try
            if tryagain
                % 56 59
                % 57 59
                tryagain = 0.0;
                try
                    open_system(system(1.0:minus(notRoot(1.0), 1.0)));
                    hilite_system(system, 'find');
                catch
                    tryagain = 1.0;
                end % try
            end
            if tryagain
                try
                    system = strrep(system, '//+', '//*');
                    system = strrep(system, '+//', '*//');
                    hilite_system(system, 'find');
                catch
                    rethrow(lasterror);
                end % try
            end
        else
            % 76 80
            % 77 80
            % 78 80
            open_system(system);
        end
        last_system = system;
    catch
        DAStudio.error('RTW:utility:objectNotFound', system);
    end % try
end
