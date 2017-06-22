function e = enumObjectType(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    e = 'rptgen_ud_UddType';
    % 8 9
    if isempty(findtype(e))
        rptgen.enum(e, {'Package';'Class';'Object';'Property';'Method'}, vertcat(cellhorzcat(xlate('Package')), cellhorzcat(xlate('Class')), cellhorzcat(xlate('Object')), cellhorzcat(xlate('Property')), cellhorzcat(xlate('Method'))));
        % 11 23
        % 12 23
        % 13 23
        % 14 23
        % 15 23
        % 16 23
        % 17 23
        % 18 23
        % 19 23
        % 20 23
        % 21 23
        % 22 23
    end % if
end % function
