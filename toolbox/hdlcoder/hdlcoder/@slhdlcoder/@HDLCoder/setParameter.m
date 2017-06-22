function setParameter(this, param, value)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hINI = this.CoderParameterObject.INI;
    % 8 9
    if not(isempty(findProp(hINI, param)))
        setProp(hINI, param, value);
    else
        error(hdlcodererrormsgid('invalidparam'), sprintf('Parameter ''%s'' does not exist in the param repostiory', param));
        % 13 14
    end % if
end % function
