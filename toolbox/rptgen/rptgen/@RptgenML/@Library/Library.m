function this = Library(persistenceTag)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    this = feval(mfilename('class'));
    % 11 13
    if gt(nargin, 0.0)
        % 13 22
        % 14 22
        % 15 22
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        this.Tag = persistenceTag;
        % 22 24
        mlock;
        persistent STATIC_LIBRARIES;
        % 25 28
        % 26 28
        STATIC_LIBRARIES.(persistenceTag) = this;
        % 28 31
        % 29 31
    end
end
