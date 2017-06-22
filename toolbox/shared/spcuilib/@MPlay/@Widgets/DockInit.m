function DockInit(widgetsObj, makeDocked)
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
    if not(ismac)
        jf = get(widgetsObj.hfig, 'javaframe');
        % 18 19
        if not(isempty(jf))
            jf.setGroupName('Sinks');
        end % if
    end % if
    if makeDocked
        set(widgetsObj.hfig, 'WindowStyle', 'docked');
    else
        set(widgetsObj.hfig, 'WindowStyle', 'normal');
    end % if
end % function
