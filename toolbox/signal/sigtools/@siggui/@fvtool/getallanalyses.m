function names = getallanalyses(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    info = rmfield(get(this, 'AnalysesInfo'), 'tworesps');
    names = fieldnames(info);
end % function
