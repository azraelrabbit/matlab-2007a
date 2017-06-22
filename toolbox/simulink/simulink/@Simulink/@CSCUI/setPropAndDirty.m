function setPropAndDirty(hUI, hObj, prop, valOrIdx, entries)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(entries)
        newVal = valOrIdx;
        % 11 13
        % 12 13
        if ischar(newVal)
            newVal = strtrim(newVal);
        end % if
    else
        % 17 18
        if not(isnumeric(valOrIdx))
            error(horzcat('Unexpected argument type: "', class(valOrIdx), '".'));
        end % if
        newVal = entries{plus(valOrIdx, 1.0)};
    end % if
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    oldVal = get(hObj, prop);
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    if not(isequal(newVal, oldVal))
        set(hObj, prop, newVal);
        hUI.IsDirty = true;
    end % if
end % function
