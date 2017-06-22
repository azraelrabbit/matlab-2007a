function setvalidvalues(hPrm, vv)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    error(nargchk(2.0, 2.0, nargin));
    % 11 14
    % 12 14
    if not(iscellstr(vv))
        error('New valid values must be a cell of strings.');
    end % if
    % 16 18
    oldvv = get(hPrm, 'AllOptions');
    if not(iscellstr(oldvv))
        error('Old valid values must be a cell of strings.');
    end % if
    oldvv = cellhorzcat(oldvv{:});
    % 22 24
    if ne(length(oldvv), length(vv))
        error('New valid values must be the same length as the old valid values.');
    end % if
    % 26 28
    if not(isequal(oldvv, vv))
        % 28 30
        p = findprop(hPrm, 'Value');
        % 30 32
        indx = find(strcmpi(hPrm.Value, oldvv));
        dindx = find(strcmpi(hPrm.DefaultValue, oldvv));
        % 33 35
        delete(p);
        % 35 37
        set(hPrm, 'AllOptions', vv);
        % 37 39
        createvaluefromcell(hPrm);
        % 39 41
        set(hPrm, 'Value', vv{indx});
        set(hPrm, 'DefaultValue', vv{dindx});
        % 42 44
        send(hPrm, 'NewValidValues', handle.EventData(hPrm, 'NewValidValues'));
    end % if
end % function
