function e = enumSimulinkType(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    e = 'rptgen_sl_SlType';
    % 9 10
    if isempty(findtype(e))
        rptgen.enum(e, {'model';'system';'block';'signal';'annotation'}, vertcat(cellhorzcat(xlate('Model')), cellhorzcat(xlate('System')), cellhorzcat(xlate('Block')), cellhorzcat(xlate('Signal')), cellhorzcat(xlate('Annotation'))));
        % 12 24
        % 13 24
        % 14 24
        % 15 24
        % 16 24
        % 17 24
        % 18 24
        % 19 24
        % 20 24
        % 21 24
        % 22 24
        % 23 24
    end % if
end % function
