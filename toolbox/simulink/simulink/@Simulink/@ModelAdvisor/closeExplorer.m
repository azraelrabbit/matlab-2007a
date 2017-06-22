function closeExplorer(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isa(this.MAExplorer, 'DAStudio.Explorer')
        this.MAExplorer.hide;
    end % if
end % function
