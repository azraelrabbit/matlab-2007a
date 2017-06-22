function result = entityNameExists(this, nname)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    result = any(strcmpi(nname, this.EntityNameList));
end % function
