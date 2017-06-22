function saveMergedConfigFile(this, filename, nondefault)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(this.MergedConfigContainer))
        if lt(nargin, 3.0)
            nondefault = false;
        end % if
        this.MergedConfigContainer.dumpText(filename, nondefault);
    else
        if hdlgetparameter('debug')
            warning(hdlcodererrormsgid('CannotSave'), 'Cannot save empty control file');
            % 15 16
        end % if
    end % if
end % function
