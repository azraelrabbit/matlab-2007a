function s = getOutlineString(c)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    titleString = c.TableTitle.Text;
    if isempty(titleString)
        titleString = xlate('<no title>');
    else
        if gt(length(titleString), 16.0)
            titleString = horzcat(titleString(1.0:13.0), '...');
        end
    end
    s = sprintf('%s Prop Table - %s', rptgen.capitalizeFirst(c.pt_getObjectName(true)), titleString);
end
