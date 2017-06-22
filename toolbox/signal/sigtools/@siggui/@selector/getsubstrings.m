function strs = getsubstrings(hSct, tag)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(1.0, 2.0, nargin));
    % 8 10
    if eq(nargin, 1.0)
        tag = get(hSct, 'Selection');
    end % if
    if isempty(tag)
        strs = {''};
        return;
    end % if
    strings = get(hSct, 'Strings');
    selections = getallselections(hSct);
    % 18 21
    % 19 21
    indx = strmatch(tag, selections);
    % 21 23
    switch length(indx)
    case 0.0
        msg = 'Selection not found.';
    case 1.0
        selections = get(hSct, 'Identifiers');
        msg = '';
        % 28 31
        % 29 31
        if iscell(strings{indx})
            strs = strings{indx}(1.0:end);
            % 32 36
            % 33 36
            % 34 36
            if not(difference(hSct, indx))
                strs = strs(2.0:end);
            end % if
        else
            strs = {};
        end % if
    otherwise
        msg = horzcat('Selection is not specific enough.  Found these matches:', char(10.0));
        for i=1.0:length(indx)
            msg = horzcat(msg, char(9.0), '''', selections{indx(i)}, '''');
        end % for
    end % switch
    % 47 49
    error(msg);
