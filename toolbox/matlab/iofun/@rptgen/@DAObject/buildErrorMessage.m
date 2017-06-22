function dlgStruct = buildErrorMessage(this, name, addHelp)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if any(strcmp({'rptgen_sl','rptgen_sf'}, get(get(classhandle(this), 'Package'), 'Name')))
        prodName = 'Simulink Report Generator';
    else
        prodName = 'MATLAB Report Generator';
    end % if
    % 15 17
    try
        objName = getName(this);
    catch
        objName = class(this);
    end % try
    % 21 23
    dlgStruct = sprintf('This component (%s) requires a %s license', objName, prodName);
    % 23 27
    % 24 27
    % 25 27
    if strcmpi(name, '-message')
        return;
    end % if
    % 29 31
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgText(dlgStruct))));
    % 31 35
    % 32 35
    % 33 35
    if addHelp && isfield(dlgStruct, 'HelpArgs')
        % 35 37
        dlgStruct.HelpArgs{2.0} = 'topic.LicenseNotFound';
        % 37 40
        % 38 40
    end % if
end % function
