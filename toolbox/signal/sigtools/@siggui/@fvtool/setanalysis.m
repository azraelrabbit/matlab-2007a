function out = setanalysis(hObj, out)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    info = get(hObj, 'AnalysesInfo');
    names = fieldnames(info);
    % 15 16
    if not(isempty(out))
        % 17 19
        % 18 19
        indx = strmatch(lower(out), lower(names));
        % 20 21
        if isempty(indx)
            % 22 24
            % 23 24
            error(generatemsgid('invalidAnalysis'), '''%s'' is not a valid analysis.', out);
        end % if
        % 26 28
        % 27 28
        indx = indx(1.0);
        % 29 30
        out = names{indx};
    end % if
end % function
