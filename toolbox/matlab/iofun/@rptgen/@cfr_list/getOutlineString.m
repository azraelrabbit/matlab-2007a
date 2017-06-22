function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if isempty(c.Source)
        vName = xlate('<no variable specified>');
    else
        if isa(c.Source, 'DAStudio.Object')
            vName = class(c.Source);
        else
            vName = rptgen.toString(c.Source, 24.0, ' ');
        end % if
        % 16 18
    end % if
    s = horzcat(c.getName, ' - ', vName);
