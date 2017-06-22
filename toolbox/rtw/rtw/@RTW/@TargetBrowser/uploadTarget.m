function uploadTarget(h, val)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if h.ThisDlg.hasUnappliedChanges
        hParent = get(h, 'parentSrc');
        % 9 10
        if not(isempty(hParent)) && isa(hParent, 'Simulink.ConfigSet')
            % 11 12
            tlcfiles = get(h, 'tlcfiles');
            selected = tlcfiles(plus(get(h, 'selected'), 1.0));
            % 14 15
            settings.TemplateMakefile = selected.tmf;
            settings.MakeCommand = selected.makeCmd;
            settings.Description = selected.description;
            settings.PushNag = true;
            % 19 20
            hParent.switchTarget(selected.shortName, settings);
            % 21 22
            enableApplyButton(get(h, 'ParentDlg'), true, false);
            refresh(get(h, 'ParentDlg'));
        end % if
    end % if
end % function
