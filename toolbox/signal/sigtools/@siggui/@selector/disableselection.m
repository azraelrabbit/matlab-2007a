function disableselection(hObj, varargin)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    error(nargchk(2.0, Inf, nargin));
    % 19 22
    % 20 22
    [indx, msg] = find_disabled_indexes(hObj, varargin{:});
    error(msg);
    % 23 25
    if not(isempty(indx))
        % 25 28
        % 26 28
        eSelects = getenabledselections(hObj);
        % 28 31
        % 29 31
        dSelects = get(hObj, 'DisabledSelections');
        dSelects = cellhorzcat(dSelects{:}, eSelects{indx});
        % 32 35
        % 33 35
        set(hObj, 'DisabledSelections', dSelects);
        % 35 38
        % 36 38
        check_selection(hObj, eSelects{indx});
        % 38 40
        if isrendered(hObj)
            update(hObj, 'update_popup');
        end % if
    end % if
function [indx, msg] = find_disabled_indexes(hObj, varargin)
    % 44 48
    % 45 48
    % 46 48
    options = getenabledselections(hObj);
    indx = [];
    msg = '';
    % 50 52
    for i=1.0:length(varargin)
        tag = varargin{i};
        tempindx = strmatch(tag, options);
        % 54 56
        switch length(tempindx)
        case 0.0
            selections = getallselections(hObj);
            if isempty(strmatch(tag, selections))
                msg = 'That selection is not available.';
                return;
            end % if
        case 1.0
        otherwise
            % 64 67
            % 65 67
            msg = 'Input selection is not specific.  Found these possible matches:';
            msg = horzcat(msg, char(10.0));
            for i=1.0:length(tempindx)
                msg = horzcat(msg, '  ''', options{tempindx(i)}, '''');
            end % for
            return;
        end % switch
        % 73 75
        if not(isempty(tempindx))
            indx(plus(end, 1.0)) = tempindx;
        end % if
    end % for
function check_selection(hObj, varargin)
    % 79 83
    % 80 83
    % 81 83
    selection = get(hObj, 'Selection');
    % 83 86
    % 84 86
    if not(isempty(strmatch(selection, varargin)))
        eSelects = getenabledselections(hObj);
        % 87 89
        if isempty(eSelects)
            eSelects = {''};
        end % if
        % 91 93
        set(hObj, 'selection', eSelects{1.0});
    end % if
