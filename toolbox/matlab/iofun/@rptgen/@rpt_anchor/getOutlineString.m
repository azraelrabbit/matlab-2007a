function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    s = sprintf('%s Anchor', rptgen.capitalizeFirst(c.anchor_getGenericType));
    lt = c.LinkText;
    if not(isempty(lt))
        if gt(length(lt), 16.0)
            lt = horzcat(lt(1.0:13.0), '...');
        end % if
        s = horzcat(s, ' - ', lt);
    end % if
