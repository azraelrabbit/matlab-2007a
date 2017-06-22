function enableselection(hObj, varargin)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    error(nargchk(1.0, Inf, nargin));
    % 15 17
    if eq(nargin, 1.0)
        dSelects = {};
        set(hObj, 'DisabledSelections', dSelects);
        % 19 22
        % 20 22
        check_selection(hObj);
        if isrendered(hObj)
            update(hObj, 'update_popup');
        end % if
    else
        % 26 29
        % 27 29
        [indx, msg] = find_enabled_indexes(hObj, varargin{:});
        error(msg);
        % 30 33
        % 31 33
        dSelects = get(hObj, 'DisabledSelections');
        % 33 35
        if not(isempty(indx))
            dSelects(indx) = [];
            % 36 38
            set(hObj, 'DisabledSelections', dSelects);
            % 38 41
            % 39 41
            check_selection(hObj);
            if isrendered(hObj)
                update(hObj, 'update_popup');
            end % if
        end % if
    end % if
function [indx, msg] = find_enabled_indexes(hObj, varargin)
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    dSelects = get(hObj, 'DisabledSelections');
    indx = [];
    msg = '';
    % 55 57
    for i=1.0:length(varargin)
        % 57 60
        % 58 60
        tag = varargin{i};
        tempindx = strmatch(tag, dSelects);
        % 61 63
        switch length(tempindx)
        case 0.0
            selections = getallselections(hObj);
            % 65 68
            % 66 68
            if isempty(strmatch(tag, selections))
                msg = 'That selection is not available.';
                return;
            else
                tempindx = [];
            end % if
        case 1.0
        otherwise
            % 75 79
            % 76 79
            % 77 79
            msg = 'Input selection is not specific.  Found these possible matches:';
            msg = horzcat(msg, char(10.0));
            for i=1.0:length(tempindx)
                msg = horzcat(msg, '  ''', dSelects{tempindx(i)}, '''');
            end % for
            return;
        end % switch
        % 85 87
        if not(isempty(tempindx))
            indx(plus(end, 1.0)) = tempindx;
        end % if
    end % for
function check_selection(hObj)
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    if isempty(hObj.Selection)
        eSelects = getenabledselections(hObj);
        set(hObj, 'selection', eSelects{1.0});
    end % if
