function e = enumObjectTypeAuto(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    e = 'rptgen_ud_UddTypeAuto';
    % 8 9
    if isempty(findtype(e))
        rptgen.enum(e, {'auto';'Package';'Class';'Object';'Property';'Method'}, vertcat(cellhorzcat(xlate('Automatic')), cellhorzcat(xlate('Package')), cellhorzcat(xlate('Class')), cellhorzcat(xlate('Object')), cellhorzcat(xlate('Property')), cellhorzcat(xlate('Method'))));
        % 11 25
        % 12 25
        % 13 25
        % 14 25
        % 15 25
        % 16 25
        % 17 25
        % 18 25
        % 19 25
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        % 24 25
    end % if
end % function
