function pList = getPropList(ps, filterName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pList = getPropList(rptgen_ud.propsrc_ud_class, 'all');
    pList = strcat('(', pList, ')');
    pList{plus(end, 1.0)} = '(class)';
end % function
