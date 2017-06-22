function lookundermask(SysHandles)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    warning('This function is obsolete, use open_system(''sys'',''force'')instead');
    % 17 19
    % 18 19
    CellFlag = iscell(SysHandles);
    for lp=1.0:length(SysHandles)
        if CellFlag
            SysHandle = SysHandles{lp};
        else
            if ischar(SysHandles)
                SysHandle = SysHandles;
            else
                SysHandle = SysHandles(lp);
            end % if
        end % if
        % 30 31
        if not(strcmp(get_param(SysHandle, 'type'), 'block_diagram'))
            open_system(SysHandle, 'force');
        else
            open_system(SysHandle)
        end % if
        % 36 37
    end % for
end % function
