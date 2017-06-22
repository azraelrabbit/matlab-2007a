function reset(obj)
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
    tb = obj.AnalyzeUserToolboxFiles;
    tb = obj.AnalyzeMathWorksFiles;
    % 14 17
    % 15 17
    newobj = dependencies.MCodeAnalyzer;
    f = fieldnames(struct(newobj));
    for i=1.0:numel(f)
        obj.(f{i}) = newobj.(f{i});
    end % for
    % 21 24
    % 22 24
    obj.AnalyzeUserToolboxFiles = tb;
    obj.AnalyzeMathWorksFiles = tb;
end
