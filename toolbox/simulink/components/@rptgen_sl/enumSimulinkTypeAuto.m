function e = enumSimulinkTypeAuto(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    e = 'rptgen_sl_SlTypeAuto';
    % 9 10
    if isempty(findtype(e))
        rptgen.enum(e, {'model';'system';'block';'signal';'annotation';'auto'}, vertcat(cellhorzcat(xlate('Model')), cellhorzcat(xlate('System')), cellhorzcat(xlate('Block')), cellhorzcat(xlate('Signal')), cellhorzcat(xlate('Annotation')), cellhorzcat(xlate('Automatic'))));
        % 12 26
        % 13 26
        % 14 26
        % 15 26
        % 16 26
        % 17 26
        % 18 26
        % 19 26
        % 20 26
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        % 25 26
    end % if
end % function
