function e = enumAutoManual
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    eType = 'rptgen_automanual';
    % 8 10
    % 9 10
    e = rptgen.enum(eType, {'auto';'manual'}, vertcat(cellhorzcat(xlate('Automatic')), cellhorzcat(horzcat(xlate('Custom'), ':'))));
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
end % function
