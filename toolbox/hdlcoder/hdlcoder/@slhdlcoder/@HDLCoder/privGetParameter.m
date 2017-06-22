function value = privGetParameter(this, param)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hINI = this.CoderParameterObject.INI;
    value = getProp(hINI, param);
end % function
