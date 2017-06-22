function addSymbol(hThisObj, symbolName, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    warnID = 'Simulink:mpt:MiscCustomizer:addSymbol';
    warnMsg = 'Invalid input arguments for addSymbol.';
    % 7 9
    if not(isprop(hThisObj, 'MPFSymbolDefinition'))
        persistent diswarn;
        if isempty(diswarn)
            warning(warnID, 'addSymbol requires Real-Time Workshop Embedded Coder installed.');
            diswarn = 1.0;
        end
        return
    end
    % 16 19
    % 17 19
    if ischar(symbolName) && gt(length(varargin), 1.0) && eq(rem(length(varargin), 2.0), 0.0)
        existCusSymbolList = sl_get_customization_param(hThisObj, 'MPFSymbolDefinition');
        oldList = hThisObj.MPFSymbolDefinition;
        % 21 23
        [tf, loc] = ismember(symbolName, existCusSymbolList);
        if not(tf)
            % 24 26
            symbol = mpt.SymbolDefinition;
            symbol.Name = symbolName;
            [symbol, status] = update_object_prop(symbol, varargin, warnID, warnMsg);
            % 28 30
            if eq(status, 1.0)
                hThisObj.MPFSymbolDefinition = cellhorzcat(symbol, oldList{:});
            end
        else
            % 33 35
            symbol = oldList{loc};
            [symbol, status] = update_object_prop(symbol, varargin, warnID, warnMsg);
            % 36 38
            if eq(status, 1.0)
                hThisObj.MPFSymbolDefinition{loc} = symbol;
            end
        end
    else
        warning(warnID, warnMsg);
    end
end
function [hobj, status] = update_object_prop(hobj, propValuePair, warnID, warnMsg)
    % 46 50
    % 47 50
    % 48 50
    status = 1.0;
    % 50 52
    try
        % 52 54
        oldPropList = getProperty(hobj, 'Property');
        % 54 56
        oldPropNameList = {};
        for i=1.0:length(oldPropList)
            oldPropNameList{plus(end, 1.0)} = oldPropList{i}{1.0};
        end % for
        % 59 63
        % 60 63
        % 61 63
        if not(iscellstr(propValuePair{1.0}))
            if not(iscell(propValuePair{1.0}))
                % 64 66
                propList = {};
                valueList = {};
                for i=1.0:2.0:minus(length(propValuePair), 1.0)
                    propList{plus(end, 1.0)} = propValuePair{i};
                    valueList{plus(end, 1.0)} = propValuePair{plus(i, 1.0)};
                end % for
                % 71 73
                if not(iscellstr(propList))
                    warning(warnID, warnMsg);
                    status = 0.0;
                    return
                end
            else
                % 78 81
                % 79 81
                warning(warnID, warnMsg);
                status = 0.0;
                return
            end
        else
            % 85 88
            % 86 88
            propList = propValuePair{1.0};
            valueList = propValuePair{2.0};
        end
        % 90 94
        % 91 94
        % 92 94
        if isUnique(propList)
            % 94 96
            addList = {};
            for i=1.0:length(propList)
                % 97 100
                % 98 100
                [tf, loc] = ismember(propList{i}, oldPropNameList);
                if tf
                    % 101 103
                    oldPropList{loc}{2.0} = valueList{i};
                else
                    % 104 106
                    addList = cellhorzcat(addList{:}, cellhorzcat(propList{i}, valueList{i}));
                end
            end % for
            setProperty(hobj, 'Property', cellhorzcat(oldPropList{:}, addList{:}));
        else
            % 110 112
            warning(warnID, warnMsg);
            status = 0.0;
        end
    catch
        warnMsg = sprintf('Error in addSymbol.\n%s', lasterr);
        warning(warnID, warnMsg);
    end % try
end
function tf = isUnique(cellString)
    % 120 124
    % 121 124
    % 122 124
    new = unique(cellString);
    tf = isequal(new, sort(cellString));
end
