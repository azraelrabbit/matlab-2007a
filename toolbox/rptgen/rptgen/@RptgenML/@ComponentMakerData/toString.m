function s = toString(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    s = sprintf('\n%%------ %s --------\n', h.PropertyName);
    % 7 9
    if strcmpi(h.DataTypeString, '!enumeration')
        dType = sprintf(' {\n');
        nameCount = length(h.enumNames);
        for i=1.0:length(h.enumValues)
            if ge(nameCount, i)
                displayName = strrep(h.enumNames{i}, '''', '''''');
            else
                displayName = h.enumValues{i};
            end % if
            % 17 20
            % 18 20
            dType = sprintf('%s\t''%s'',\t''%s''\n', dType, h.enumValues{i}, displayName);
            % 20 24
            % 21 24
            % 22 24
        end % for
        dType = sprintf('%s}', dType);
    else
        if strcmp(h.DataTypeString, rptgen.makeStringType)
            dType = 'rptgen.makeStringType';
        else
            dType = horzcat('''', h.DataTypeString, '''');
        end % if
        % 31 33
    end % if
    s = sprintf('%sp = rptgen.prop(h,''%s'',%s,%s,...\n\t''%s'');\n', s, h.PropertyName, dType, h.FactoryValueString, strrep(h.Description, '''', ''''''));
    % 34 38
    % 35 38
    % 36 38
