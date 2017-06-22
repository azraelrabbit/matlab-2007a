function disp(obj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    fprintf('AnalysisOptions:\n');
    s = struct(obj);
    s = rmfield(s, 'Ready');
    disp(s);
end % function
