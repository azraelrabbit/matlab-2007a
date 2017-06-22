function s = getGroupInfoString(ch)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    wfcn = '';
    if not(isempty(ch.WidgetFcn))
        % 10 12
        % 11 12
        wfcn = 'Widget';
        hWidget = ch.hWidget;
        if not(isempty(hWidget)) && ishandle(hWidget)
            % 15 16
            hh = handle(hWidget);
            sepStr = '';
            if not(isempty(hh.findprop('Separator')))
                if strcmp(get(hWidget, 'Separator'), 'on')
                    sepStr = ',sep';
                end % if
            else
                sepStr = ',<no sep support>';
            end % if
            wren = sprintf('(rendered%s) ', sepStr);
        else
            % 27 28
            if strcmp(ch.Separator, 'on')
                sepStr = ',sep';
            else
                sepStr = '';
            end % if
            wren = sprintf('(unrendered%s) ', sepStr);
        end % if
        wfcn = horzcat(wfcn, wren);
    end % if
    % 37 38
    s = sprintf('''%s'' Place=%g %s%s', ch.Name, ch.ActualPlacement, wfcn, class(ch));
end % function
