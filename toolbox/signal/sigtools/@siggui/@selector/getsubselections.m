function subselects = getsubselections(hSct, tag)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    error(nargchk(1.0, 2.0, nargin));
    % 13 15
    identifiers = get(hSct, 'Identifiers');
    selections = getallselections(hSct);
    % 16 18
    if eq(nargin, 1.0)
        tag = get(hSct, 'Selection');
    end % if
    % 20 22
    if isempty(tag)
        subselects = {''};
        return;
    end % if
    % 25 28
    % 26 28
    indx = strmatch(tag, selections);
    % 28 30
    switch length(indx)
    case 0.0
        msg = 'Selection not found.';
    case 1.0
        msg = '';
        if iscell(identifiers{indx})
            subselects = cellhorzcat(identifiers{indx}{2.0:end});
        else
            subselects = {};
        end % if
    otherwise
        msg = horzcat('Selection is not specific enough.  Found these matches:', char(10.0));
        for i=1.0:length(indx)
            msg = horzcat(msg, char(9.0), '''', selections{indx(i)}, '''');
        end % for
    end % switch
    % 45 47
    error(msg);
