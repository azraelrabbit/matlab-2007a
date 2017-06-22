function output = LocMapMakeVarsToTLCVars(h, makeString)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if h.LocalFindStr(makeString, 'MSFCN=1')
        DAStudio.error('RTW:makertw:obsoleteMakeOption', 'MSFCN');
    end % if
    % 11 14
    % 12 14
    % 13 14
    map(1.0).makename = 'EXT_MODE';
    map(1.0).makevalue = '1';
    map(1.0).tlcname = 'ExtMode';
    map(1.0).tlcvalue = '1';
    % 18 21
    % 19 21
    % 20 21
    map(2.0).makename = 'MAT_FILE';
    map(2.0).makevalue = '1';
    map(2.0).tlcname = 'MatFileLogging';
    map(2.0).tlcvalue = '1';
    % 25 28
    % 26 28
    % 27 28
    map(3.0).makename = 'STETHOSCOPE';
    map(3.0).makevalue = '1';
    map(3.0).tlcname = 'StethoScope';
    map(3.0).tlcvalue = '1';
    % 32 33
    output = [];
    makeString = horzcat(' ', makeString);
    % 35 36
    for j=1.0:length(map)
        token = horzcat(' ', map(j).makename, '=', map(j).makevalue);
        if ge(length(makeString), length(token))
            location = findstr(makeString, token);
        else
            location = [];
        end % if
        if not(isempty(location))
            output = horzcat(output, ' -a', map(j).tlcname, '=', map(j).tlcvalue);
        end % if
    end % for
end % function
