function dLabel = getDisplayLabel(mlo)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if strcmp(mlo.MdlName, '$current')
        dLabel = xlate('Current block diagram');
    else
        if strcmp(mlo.MdlName, '$all')
            dLabel = xlate('All open models');
        else
            if strcmp(mlo.MdlName, '$alllib')
                dLabel = xlate('All open libraries');
            else
                if strcmp(mlo.MdlName, '$pwd')
                    dLabel = xlate('Block diagrams in current directory');
                else
                    if isempty(mlo.MdlName)
                        dLabel = xlate('<enter model name>');
                    else
                        [fPath, dLabel] = fileparts(mlo.MdlName);
                    end % if
                end % if
            end % if
        end % if
    end % if
    if not(mlo.Active)
        dLabel = horzcat('(', dLabel, ')');
    end % if
end % function
