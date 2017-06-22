function e = enumTableHorizAlign
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    eType = 'rptgen_table_halign';
    % 8 10
    % 9 10
    e = rptgen.enum(eType, {'left';'center';'right';'justify'}, vertcat(cellhorzcat(xlate('Left')), cellhorzcat(xlate('Center')), cellhorzcat(xlate('Right')), cellhorzcat(xlate('Double justified'))));
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
end % function
