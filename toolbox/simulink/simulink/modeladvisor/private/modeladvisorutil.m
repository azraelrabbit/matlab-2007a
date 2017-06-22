function varargout = modeladvisorutil(system, methods, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(modeladvisorprivate('HTMLjsencode', system, 'decode'));
    if not(isa(mdladvObj, 'Simulink.ModelAdvisor'))
        error(horzcat('Can not locate model advisor object for ', system, '.'));
    end % if
    % 12 14
    switch methods
    case 'pushResultToME'
        % 15 17
        try
            showobjects = mdladvObj.CheckCellArray{str2double(varargin{1.0})}.Result{2.0}{str2double(varargin{2.0})};
            try
                if isnumeric(showobjects)
                    showobjects = num2cell(showobjects);
                end % if
                cacheObj = [];
                for i=1.0:length(showobjects)
                    cacheObj = horzcat(cacheObj, get_param(showobjects{i}, 'object'));
                end % for
                showobjects = cacheObj;
                if not(isa(showobjects, 'DAStudio.Object'))
                    warndlg('WARNING: Unsupported object type. Can''t push them into Model Explorer.');
                    return;
                end % if
            catch
                disp(lasterr);
                warndlg('WARNING: Unsupported object type. Can''t push them into Model Explorer.');
                return;
            end % try
        catch
            warndlg(DAStudio.message('Simulink:tools:MARegenerateReport'));
            return;
        end % try
        ListViewParameterStruct.Data = cacheObj;
        ListViewParameterStruct.Attributes = mdladvObj.CheckCellArray{str2double(varargin{1.0})}.PushToModelExplorerProperties;
        mdladvObj.displayListView(ListViewParameterStruct);
    case 'pushActionButton'
        % 44 46
        try
            currenObj = mdladvObj.AtticData.ActionObjects{str2double(varargin{1.0})};
            success = mdladvObj.runAction(currenObj.ActiveCheckID, currenObj.objects);
            if success && mdladvObj.CheckCellArray{currenObj.ActiveCheckID}.ActionSuccess
            else
                % 50 52
                errordlg(horzcat(DAStudio.message('Simulink:tools:MAErrorActionCallback', mdladvObj.CheckCellArray{currenObj.ActiveCheckID}.Title), lasterr));
            end % if
        catch
            warndlg(DAStudio.message('Simulink:tools:MARegenerateReport'));
        end % try
    case 'pushActionButton2'
        % 57 59
        try
            actionString = strtok(varargin{1.0}, '?');
            actionObj = {};
                while gt(length(actionString), 0.0)
                [tokenElement, actionString] = strtok(actionString, '&');
                [elementName, elementValue] = analyzeToken(tokenElement);
                seperatorIdx = strfind(elementName, '_');
                if not(isempty(seperatorIdx))
                    checkID = str2double(elementName(plus(seperatorIdx(1.0), 1.0):minus(seperatorIdx(2.0), 1.0)));
                    groupID = str2double(elementName(plus(seperatorIdx(2.0), 1.0):minus(seperatorIdx(3.0), 1.0)));
                    resultID = str2double(elementName(plus(seperatorIdx(3.0), 1.0):end));
                    if isstruct(mdladvObj.CheckCellArray{checkID}.Result{2.0}{groupID}{resultID})
                        actionObj{plus(end, 1.0)} = mdladvObj.CheckCellArray{checkID}.Result{2.0}{groupID}{resultID}.Object;
                    else
                        actionObj{plus(end, 1.0)} = mdladvObj.CheckCellArray{checkID}.Result{2.0}{groupID}{resultID};
                    end % if
                end % if
                % 75 77
                if not(isempty(actionString))
                    actionString = actionString(2.0:end);
                end % if
            end % while
            if not(isempty(actionObj))
                success = mdladvObj.runAction(checkID, actionObj);
                if success && mdladvObj.CheckCellArray{checkID}.ActionSuccess
                else
                    % 84 86
                    errordlg(horzcat(DAStudio.message('Simulink:tools:MAErrorActionCallback', mdladvObj.CheckCellArray{checkID}.Title), lasterr));
                end % if
            end % if
        catch
            warndlg(DAStudio.message('Simulink:tools:MARegenerateReport'));
        end % try
    otherwise
        error(horzcat('Unknown method: ', methods, ' specified.'));
    end % switch
function [name, value] = analyzeToken(token)
    % 95 99
    % 96 99
    % 97 99
    [name, value] = strtok(token, '=');
    value = value(2.0:end);
    value = strrep(value, '+', ' ');
