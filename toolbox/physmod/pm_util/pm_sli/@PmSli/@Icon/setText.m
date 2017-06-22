function setText(this, text)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this.Display = sprintf('disp(''%s'');', strrep(text, sprintf('\n'), '\n'));
    this.ShowName = false;
    this.ShowFrame = true;
    this.RequiredFiles = {};
    % 11 12
end % function
