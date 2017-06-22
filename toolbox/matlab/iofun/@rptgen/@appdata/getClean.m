function getValue = getClean(this, propName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    set(this.PropertyListeners, 'Enabled', 'off');
    oldImply = this.ImplyValues;
    this.ImplyValues = false;
    getValue = get(this, propName);
    this.ImplyValues = oldImply;
    set(this.PropertyListeners, 'Enabled', 'on');
end % function
