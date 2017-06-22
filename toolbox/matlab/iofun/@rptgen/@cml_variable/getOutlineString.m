function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if strncmpi(c.Source, 'd', 1.0)
        if isempty(c.SourceDirect)
            vName = xlate('<no value specified>');
        else
            if isa(c.SourceDirect, 'DAStudio.Object')
                vName = class(c.SourceDirect);
            else
                vName = rptgen.toString(c.SourceDirect, 24.0, ' ');
            end
        end
    else
        vName = c.variable;
    end
    s = horzcat(xlate('Variable - '), vName);
end
