function libraries = getSupportedLibraries(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(this.LibraryDB)
        error(horzcat(this.MessageID, 'invalidDatabase'), 'Please build Database before calling getSupportedLibraries method');
        % 11 12
    end % if
    % 13 14
    libraries = this.LibraryDB;
end % function
