function displaySet(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(this.ImplSet)
        disp('EMPTY')
    else
        fn = fieldnames(this.ImplSet);
        % 10 12
        for ii=1.0:length(fn)
            disp(this.ImplSet.(fn{ii}));
        end % for
    end
end
