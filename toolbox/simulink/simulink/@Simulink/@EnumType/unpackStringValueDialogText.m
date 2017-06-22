function [stringCell, valuesCell] = unpackStringValueDialogText(h, dlgText)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    tmpStr = strrep(dlgText, sprintf('\n'), ' ');
    tmpStr = strrep(tmpStr, sprintf(','), '''; ''');
    tmpStr = horzcat('{''', tmpStr, '''}');
    newCell = eval(tmpStr);
    newCell = strtrim(newCell);
    newCell = newCell(not(cellfun('isempty', newCell)));
    % 13 16
    % 14 16
    nStrings = length(newCell);
    stringCell = cell(nStrings, 1.0);
    valuesCell = cell(nStrings, 1.0);
    for idx=1.0:nStrings
        [thisString, thisValue] = strtok(newCell{idx}, '=');
        stringCell{idx, 1.0} = strtrim(thisString);
        if not(isempty(thisValue))
            valuesCell{idx, 1.0} = str2double(thisValue(2.0:end));
        end
    end % for
    % 25 28
    % 26 28
    if all(cellfun('isempty', valuesCell))
        % 28 30
        valuesCell = [];
    else
        if all(cellfun('isempty', valuesCell(2.0:end)))
            % 32 34
            if not(iscell(h.Values))
                valuesCell = valuesCell{1.0};
            end
        end
    end
end
