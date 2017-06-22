function copyContentToSFTarget(hObj, hSFTarget)
    % 1 5
    % 2 5
    % 3 5
    fields = hObj.fields;
    % 5 7
    for i=1.0:length(fields)
        % 7 9
        switch fields{i}
        case {'Components','SelectedCmd','TargetOptionsDlg','CoderOptionsDlg','Id'}
            % 11 13
        case 'CodeFlagsInfo'
            % 12 14
            codeFlags = get(hObj, 'CodeFlagsInfo');
            for j=1.0:length(codeFlags)
                codeFlag = codeFlags(j);
                try
                    hSFTarget.setCodeFlag(codeFlag.name, codeFlag.value);
                    % 18 23
                    % 19 23
                    % 20 23
                    % 21 23
                end % try
            end % for
        otherwise
            % 25 29
            % 26 29
            % 27 29
            prop = findprop(hSFTarget, fields{i});
            if not(isempty(prop))
                try
                    set(hSFTarget, fields{i}, get(hObj, fields{i}));
                    % 32 37
                    % 33 37
                    % 34 37
                    % 35 37
                end % try
            end % if
        end % switch
    end % for
