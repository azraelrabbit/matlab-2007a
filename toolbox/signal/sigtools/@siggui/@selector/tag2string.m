function string = tag2string(hObj, tag)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    tags = get(hObj, 'Identifiers');
    strs = get(hObj, 'String');
    % 9 11
    string = '';
    % 11 13
    for i=1.0:length(tags)
        if ischar(tags{i})
            if strcmpi(tag, tags{i})
                string = strs{i};
                return;
            end % if
        else
            indx = find(strcmpi(tag, tags{i}));
            switch length(indx)
            case 0.0
            case 1.0
                % 23 25
                string = strs{i}{minus(indx, difference(hObj, i))};
            case 2.0
                if eq(indx(1.0), 1.0)
                    string = strs{i}{indx(minus(2.0, difference(hObj, i)))};
                else
                    error('Cannot determine string from tag.');
                end % if
            otherwise
                error('Cannot determine string from tag.');
            end % switch
        end % if
    end % for
