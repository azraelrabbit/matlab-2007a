function displayTable(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(this.Sets)
        disp('EMPTY')
    else
        paths = fieldnames(this.Sets);
        % 10 12
        for ii=1.0:length(paths)
            disp(sprintf('PATH: %s', this.Sets.(paths{ii}).Path));
            implSet = this.Sets.(paths{ii}).Set;
            implSet.displaySet;
        end % for
    end
end
