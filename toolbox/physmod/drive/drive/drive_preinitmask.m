function drive_preinitmask
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    verbose = false;
    isLicensed = drive_checklicense(verbose);
    % 13 14
    if not(isLicensed)
        % 15 16
        dispScript = sprintf('color(''red'');\n disp(''%s\\n%s'');', 'No', 'License');
        rootSys = bdroot(gcb);
        if not(strcmp(get_param(rootSys, 'lock'), 'on'))
            set_param(gcb, 'MaskDisplay', dispScript, 'MaskIconOpaque', 'on', 'BackgroundColor', 'white');
        end % if
    end % if
end % function
