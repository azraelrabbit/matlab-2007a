function init_callbacks(this, hviewer)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    resultsActions = hviewer.HDSTableAdaptor.HDSTable.getHDSActions;
    for k=1.0:length(resultsActions)
        thisLabel = char(resultsActions(k).getName);
        set(handle(resultsActions(k), 'callbackproperties'), 'PropertyChangeCallback', cellhorzcat(@localEnableCallback, this, thisLabel));
        % 12 14
    end % for
end % function
function localEnableCallback(es, ed, h, thisLabel)
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    if strcmp(char(ed.getPropertyName), 'enabled')
        for k=1.0:length(h.Figures)
            m = findobj(allchild(h.Figures(k)), 'Label', thisLabel);
            if es.isEnabled
                set(m, 'Enable', 'on');
            else
                set(m, 'Enable', 'off');
            end % if
        end % for
    end % if
end % function
