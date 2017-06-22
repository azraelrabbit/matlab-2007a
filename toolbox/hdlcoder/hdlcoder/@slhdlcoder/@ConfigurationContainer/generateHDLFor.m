function generateHDLFor(this, block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(ischar(block))
        % 8 9
        disp(sprintf('Invalid configuration ''generateHDLFor'' statement in file: %s', this.fileName));
        display(block);
    end % if
    % 12 13
    this.HDLTopLevel = block;
end % function
