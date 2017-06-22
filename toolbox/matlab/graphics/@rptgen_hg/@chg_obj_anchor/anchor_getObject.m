function [o, oType] = anchor_getObject(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    o = get(rptgen_hg.appdata_hg, horzcat('Current', c.anchor_getGenericType));
    % 10 11
    oType = '';
end % function
