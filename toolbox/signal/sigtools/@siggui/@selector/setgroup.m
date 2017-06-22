function setgroup(hSct, varargin)
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
    [tag, tags, strings, msg] = parse_inputs(hSct, varargin{:});
    error(msg);
    % 14 16
    selections = getallselections(hSct);
    indx = strmatch(tag, selections);
    % 17 19
    switch length(indx)
    case 0.0
        msg = 'That selection is not available.';
    case 1.0
        alltags = get(hSct, 'Identifiers');
        allstrings = get(hSct, 'Strings');
        % 24 26
        if iscell(alltags{indx})
            indx2 = plus(minus(find(strcmpi(hSct.SubSelection, alltags{indx}(2.0:end))), difference(hSct, indx)), 1.0);
            if isempty(indx2)
                cstring = '';
            else
                cstring = allstrings{indx}{indx2};
            end % if
        else
            % 33 35
            cstring = '';
        end % if
        % 36 38
        msg = '';
        % 38 42
        % 39 42
        % 40 42
        if not(difference(hSct, indx))
            if iscell(allstrings{indx})
                newstr = horzcat(allstrings{indx}(1.0), strings);
            else
                newstr = horzcat(cellhorzcat(allstrings{indx}), strings);
            end % if
        else
            newstr = strings;
        end % if
        % 50 52
        if iscell(alltags{indx})
            alltags{indx} = horzcat(alltags{indx}(1.0), tags);
        else
            if eq(length(tags), length(strings))
                alltags{indx} = horzcat(cellhorzcat(alltags{indx}), tags);
            else
                alltags{indx} = tags;
            end % if
        end % if
        % 60 62
        allstrings{indx} = newstr;
    otherwise
        msg = 'Input selection is not specific.  Found these possible matches:';
        msg = horzcat(msg, char(10.0));
        for i=1.0:length(indx)
            msg = horzcat(msg, '  ''', selections{indx(i)}, '''');
        end % for
    end % switch
    % 69 71
    error(msg);
    % 71 73
    set(hSct, 'Identifiers', alltags);
    set(hSct, 'Strings', allstrings);
    % 74 77
    % 75 77
    if strcmpi(hSct.Selection, tag)
        subselect = get(hSct, 'SubSelection');
        if isempty(find(strcmpi(subselect, tags)))
            % 79 82
            % 80 82
            cindx = find(strcmpi(cstring, allstrings{indx}));
            if isempty(cindx)
                set(hSct, 'subselection', tags{1.0});
            else
                % 85 88
                % 86 88
                set(hSct, 'subselection', alltags{indx}{cindx});
            end % if
        end % if
    end % if
    % 91 93
    if isrendered(hSct)
        update(hSct, 'update_popup');
    end % if
function [tag, tags, strs, msg] = parse_inputs(hSct, varargin)
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    msg = nargchk(4.0, 4.0, nargin);
    % 101 103
    if isempty(msg)
        tag = varargin{1.0};
        tags = varargin{2.0};
        strs = varargin{3.0};
        % 106 108
        msg = validate_inputs(tags, strs);
    end % if
function msg = validate_inputs(tags, strs)
    % 110 115
    % 111 115
    % 112 115
    % 113 115
    msg = '';
    % 115 117
    if not(any(eq(minus(length(tags), length(strs)), [0.0 1.0])))
        msg = 'New identifiers and strings must be of the same length.';
    end % if
