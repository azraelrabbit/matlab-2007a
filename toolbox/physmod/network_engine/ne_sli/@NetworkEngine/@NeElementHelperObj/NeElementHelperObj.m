function hObj = NeElementHelperObj(varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if ne(nargin, 1.0)
        error('NetworkEngine:NeElementHelperObj:InvalidArgNum', 'Constructor expecting one object handle');
        % 7 8
    end % if
    % 9 10
    if not(l_IsElement(varargin{1.0}))
        error('NetworkEngine:NeElementHelperObj:InvalidArg', 'Constructor expecting handle to NetworkEngine.ElementSchema object');
        % 12 13
    end % if
    % 14 15
    hObj = NetworkEngine.NeElementHelperObj;
    hObj.hElementObj = varargin{1.0};
    % 17 18
    hObj.parameterVec = [];
    hObj.variableVec = [];
    hObj.terminalVec = [];
    hObj.inputVec = [];
    hObj.outputVec = [];
    hObj.portVec = [];
    % 24 25
    hObj.descriptorStr = hObj.hElementObj.descriptor;
    % 26 27
    itemLst = hObj.hElementObj.items();
    nItems = numel(itemLst);
    for idx=1.0:nItems
        itemName = itemLst{idx, 1.0};
        itemObj = eval(horzcat('hObj.hElementObj.', itemName));
        % 32 33
        clsName = class(itemObj);
        switch clsName
        case 'NetworkEngine.Terminal'
            hObj.terminalVec = vertcat(horzcat(hObj.terminalVec), itemObj);
            hObj.portVec = vertcat(horzcat(hObj.portVec), itemObj);
        case 'NetworkEngine.Parameter'
            hObj.parameterVec = vertcat(horzcat(hObj.parameterVec), itemObj);
        case 'NetworkEngine.LocalVariable'
            hObj.variableVec = vertcat(horzcat(hObj.variableVec), itemObj);
        case 'NetworkEngine.Input'
            hObj.inputVec = vertcat(horzcat(hObj.inputVec), itemObj);
            hObj.portVec = vertcat(horzcat(hObj.portVec), itemObj);
        case 'NetworkEngine.Output'
            hObj.outputVec = vertcat(horzcat(hObj.outputVec), itemObj);
            hObj.portVec = vertcat(horzcat(hObj.portVec), itemObj);
        otherwise
            disp(sprintf('Unhandled class type: %s.', clsName));
        end % switch
    end % for
end % function
function isElem = l_IsElement(hObj)
    % 54 55
    isElem = strcmp(class(hObj), 'NetworkEngine.ElementSchema');
end % function
