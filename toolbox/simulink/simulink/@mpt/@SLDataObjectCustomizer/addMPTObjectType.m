function addMPTObjectType(hThisObj, objName, varargin)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    warnID = 'Simulink:mpt:SLDataObjectCustomizer:addMPTObjectType';
    warnMsg = 'Invalid input argument for addMPTObjectType.';
    % 22 25
    % 23 25
    if not(ischar(objName))
        warning(warnID, warnMsg);
        return
    end
    % 28 30
    objName = strtrim(objName);
    % 30 32
    if not(isvarname(objName))
        warning(warnID, warnMsg);
        return
    end
    % 35 39
    % 36 39
    % 37 39
    existObjectTypeList = sl_get_customization_param(hThisObj, 'MPTObjectTypes');
    oldList = hThisObj.MPTObjectTypes;
    [tf, loc] = ismember(objName, existObjectTypeList);
    if not(tf)
        % 42 44
        objectType = mpt.MPTObjectType;
        objectType.Name = objName;
    else
        % 46 48
        objectType = oldList{loc};
    end
    % 49 52
    % 50 52
    if eq(nargin, 2.0)
        if not(tf)
            % 53 55
            hThisObj.MPTObjectTypes = cellhorzcat(objectType, oldList{:});
        else
            % 56 58
        end
        return
    end
    % 60 63
    % 61 63
    isSpecifiedClassType = 0.0;
    % 63 66
    % 64 66
    if ischar(varargin{1.0}) && strcmpi(varargin{1.0}, 'Signal')
        setProperty(objectType, 'ClassType', 'Signal');
        isSpecifiedClassType = 1.0;
    else
        if ischar(varargin{1.0}) && strcmpi(varargin{1.0}, 'Parameter')
            setProperty(objectType, 'ClassType', 'Parameter');
            isSpecifiedClassType = 1.0;
        else
            if ischar(varargin{1.0}) && strcmpi(varargin{1.0}, 'Both')
                setProperty(objectType, 'ClassType', 'Both');
                isSpecifiedClassType = 1.0;
            end
        end
    end
    if eq(nargin, 3.0)
        if eq(isSpecifiedClassType, 1.0)
            if not(tf)
                hThisObj.MPTObjectTypes = cellhorzcat(objectType, oldList{:});
            else
                hThisObj.MPTObjectTypes{loc} = objectType;
            end
        else
            warning(warnID, warnMsg);
        end
        return
    end
    if eq(isSpecifiedClassType, 1.0)
        propValuePair = cellhorzcat(varargin{2.0:end});
    else
        propValuePair = cellhorzcat(varargin{1.0:end});
    end
    % 96 98
    if ne(rem(length(propValuePair), 2.0), 0.0)
        % 98 100
        warning(warnID, warnMsg);
        return
    end
    % 102 105
    % 103 105
    [objectType, status] = update_object_prop(objectType, propValuePair, warnID, warnMsg);
    % 105 108
    % 106 108
    if eq(status, 1.0)
        if not(tf)
            hThisObj.MPTObjectTypes = cellhorzcat(objectType, oldList{:});
        else
            hThisObj.MPTObjectTypes{loc} = objectType;
        end
    end
end
function [hobj, status] = update_object_prop(hobj, propValuePair, warnID, warnMsg)
    % 116 120
    % 117 120
    % 118 120
    status = 1.0;
    % 120 122
    try
        oldPropList = getProperty(hobj, 'Property');
        % 123 125
        oldPropNameList = {};
        for i=1.0:length(oldPropList)
            oldPropNameList{plus(end, 1.0)} = oldPropList{i}{1.0};
        end % for
        % 128 132
        % 129 132
        % 130 132
        if iscellstr(propValuePair{1.0})
            if eq(length(propValuePair), 2.0) && eq(size(propValuePair{1.0}, 1.0), 1.0)
                % 133 136
                % 134 136
                propList = propValuePair{1.0};
                valueList = propValuePair{2.0};
            else
                % 138 140
                warning(warnID, warnMsg);
                status = 0.0;
                return
            end
        else
            if iscell(propValuePair{1.0})
                % 145 148
                % 146 148
                warning(warnID, warnMsg);
                status = 0.0;
                return
            else
                % 151 153
                propList = {};
                valueList = {};
                for i=1.0:2.0:minus(length(propValuePair), 1.0)
                    propList{plus(end, 1.0)} = propValuePair{i};
                    valueList{plus(end, 1.0)} = propValuePair{plus(i, 1.0)};
                end % for
                % 158 160
                if not(iscellstr(propList))
                    warning(warnID, warnMsg);
                    status = 0.0;
                    return
                end
            end
        end
        % 166 170
        % 167 170
        % 168 170
        if isUnique(propList)
            % 170 172
            addList = {};
            for i=1.0:length(propList)
                % 173 176
                % 174 176
                [tf, loc] = ismember(propList{i}, oldPropNameList);
                if tf
                    % 177 179
                    oldPropList{loc}{2.0} = valueList{i};
                else
                    % 180 182
                    addList = cellhorzcat(addList{:}, cellhorzcat(propList{i}, valueList{i}));
                end
            end % for
            setProperty(hobj, 'Property', cellhorzcat(oldPropList{:}, addList{:}));
        else
            % 186 188
            warning(warnID, warnMsg);
            status = 0.0;
        end
    catch
        warnMsg = sprintf('Error in addMPTObjectType.\n%s', lasterr);
        warning(warnID, warnMsg);
    end % try
end
function tf = isUnique(cellString)
    % 196 200
    % 197 200
    % 198 200
    new = unique(cellString);
    tf = isequal(new, sort(cellString));
end
