function strout = getOutlineString(c)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if strcmp(c.TitleType, 'subcomp')
        minChild = 1.0;
    else
        minChild = 0.0;
    end % if
    % 14 16
    if isempty(c.ParaText)
        if gt(c.getNumChildren, minChild)
            postString = xlate('<Text from children>');
        else
            postString = xlate('<No Text>');
        end % if
    else
        postString = rptgen.truncateString(c.ParaText);
    end % if
    % 24 26
    strout = horzcat(c.getName, ' - ', postString);
