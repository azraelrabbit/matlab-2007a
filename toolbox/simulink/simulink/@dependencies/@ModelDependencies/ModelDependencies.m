function obj = ModelDependencies(options)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    obj = dependencies.ModelDependencies;
    % 17 19
    if nargin
        % 19 21
        f = fieldnames(options);
        for i=1.0:numel(f)
            obj.(f{i}) = options.(f{i});
        end % for
        obj.Ready = false;
    end
end
