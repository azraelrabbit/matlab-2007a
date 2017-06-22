function htmlgatewayAdvisor(actionString, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    actionString = strtok(actionString, '?');
    % 9 12
    % 10 12
    decodedModelName = '';
    tmpactionString = actionString;
        while gt(length(tmpactionString), 0.0)
        [tokenElement, tmpactionString] = strtok(tmpactionString, '&');
        [elementName, elementValue] = analyzeToken(tokenElement);
        switch elementName
        case 'modelName'
            decodedModelName = elementValue;
            break
        end % switch
        % 21 23
        tmpactionString = tmpactionString(2.0:end);
    end % while
    % 24 26
    if isempty(decodedModelName)
        errordlg('Unable to locate model name from HTML data. Please clean slprj directory and restart the tool.');
        return;
    else
        mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(decodedModelName);
    end % if
    % 31 33
    if isempty(mdladvObj.System)
        errordlg('Please use ModelAdvisor.m to start the tool.');
        return;
    end % if
    % 36 40
    % 37 40
    % 38 40
    if gt(nargin, 1.0)
        StartInTaskPage = varargin{1.0};
    else
        StartInTaskPage = false;
    end % if
    if StartInTaskPage
        mdladvObj.deselectTaskAll;
    else
        mdladvObj.deselectCheckAll;
    end % if
    mdladvObj.StartInTaskPage = StartInTaskPage;
    % 50 53
    % 51 53
    ButtonClicked = 'checkModel';
    % 53 55
        while gt(length(actionString), 0.0)
        [tokenElement, actionString] = strtok(actionString, '&');
        [elementName, elementValue] = analyzeToken(tokenElement);
        % 57 59
        switch elementName
        case 'checkModel'
            ButtonClicked = 'checkModel';
        case 'modelName'
        otherwise
            % 63 65
            [category, serialNum] = analyzeName(elementName);
            if strcmp(category, 'CheckRecord')
                if strcmpi(elementValue, 'on')
                    mdladvObj.updateCheck(str2num(serialNum), true);
                else
                    mdladvObj.updateCheck(str2num(serialNum), false);
                end % if
            end % if
            if strcmp(category, 'CheckTask')
                if strcmpi(elementValue, 'on')
                    mdladvObj.updateTask(str2num(serialNum), true);
                else
                    mdladvObj.updateTask(str2num(serialNum), false);
                end % if
            end % if
        end % switch
        % 80 82
        actionString = actionString(2.0:end);
    end % while
    % 83 85
    switch ButtonClicked
    case 'checkModel'
        % 86 89
        % 87 89
        if StartInTaskPage
            mdladvObj.runTask;
        else
            mdladvObj.runCheck;
        end % if
    otherwise
        error('Unexpected button clicked. Please re-start the tool.');
        return;
    end % switch
    % 97 100
    % 98 100
    mdladvObj.displayReport('norefresh');
function [name, value] = analyzeToken(token)
    % 101 106
    % 102 106
    % 103 106
    % 104 106
    [name, value] = strtok(token, '=');
    value = value(2.0:end);
    value = strrep(value, '+', ' ');
    value = HTMLjsencode(value, 'decode');
function [category, serialNum] = analyzeName(name)
    % 110 115
    % 111 115
    % 112 115
    % 113 115
    [category, serialNum] = strtok(name, '_');
    serialNum = serialNum(2.0:end);
