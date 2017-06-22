function allTypes = summ_getTypeList
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error('summ_getTypeList is abstract');
    allTypes = vertcat(cellhorzcat('type1', xlate('Type 1')), cellhorzcat('type2', xlate('Type 2')));
    % 12 14
    % 13 14
end % function
