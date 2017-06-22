function fList = getFilterList(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    fList = vertcat(cellhorzcat('all', xlate('All Properties')), cellhorzcat('xyz', xlate('XYZ Axis Properties')), cellhorzcat('camera', xlate('Camera Properties')));
    % 9 12
    % 10 12
    % 11 12
end % function
