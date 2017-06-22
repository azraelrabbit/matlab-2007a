function setcomponentstate(hObj, s, hindx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(3.0, 3.0, nargin));
    % 8 10
    if isempty(s)
        return;
    end % if
    if isfield(s, 'Components')
        % 13 15
        if isa(hindx, 'siggui.selector') && any(strcmpi(get(hindx, 'Name'), {'response type','design method'}))
            % 15 17
            return;
        end % if
        % 18 20
        indx = findCellIndx(s.Components, get(hindx, 'Tag'));
        if not(isempty(indx))
            setstate(hindx, s.Components{indx});
        end % if
    else
        % 24 27
        % 25 27
        if ismethod(hindx, 'convertstatestruct')
            sindx = convertstatestruct(hindx, s);
            if not(isempty(sindx))
                setstate(hindx, sindx);
            end % if
        end % if
    end % if
end % function
function indx = findCellIndx(s, tag)
    % 35 38
    % 36 38
    if isempty(tag)
        indx = [];
        return;
    end % if
    indx = 1.0;
    while le(indx, length(s)) && not(strcmpi(s{indx}.Tag, tag))
        indx = plus(indx, 1.0);
    end % while
    if gt(indx, length(s))
        indx = [];
    end % if
    % 48 50
    if isempty(indx) && strcmpi(tag, 'siggui.firceqripinvsincoptsframe')
        indx = findCellIndx(s, 'siggui.firceqripoptsframe');
        % 51 54
        % 52 54
        if not(isempty(indx)) && not(isfield(s{indx}, 'invSincFreqFactor'))
            indx = [];
        end % if
    end % if
end % function
