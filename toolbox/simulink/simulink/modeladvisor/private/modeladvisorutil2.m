function varargout = modeladvisorutil2(methods, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch methods
    case 'GetSelectMenuForTaskAdvsiorNode'
        taskadvisornode = varargin{1.0};
        switch taskadvisornode.Type
        case 'Container'
            InfoStruct.selectmsg = DAStudio.message('Simulink:tools:MASelectAll2');
            InfoStruct.deselectmsg = DAStudio.message('Simulink:tools:MADeselectAll');
            InfoStruct.runTaskAdvisormsg = DAStudio.message('Simulink:tools:MARunSelectedChecks');
        case 'Task'
            InfoStruct.selectmsg = DAStudio.message('Simulink:tools:MASelect');
            InfoStruct.deselectmsg = DAStudio.message('Simulink:tools:MADeselect');
            InfoStruct.runTaskAdvisormsg = DAStudio.message('Simulink:tools:MARunThisCheck');
        end % switch
        if taskadvisornode.Enable
            switch taskadvisornode.Type
            case 'Container'
                InfoStruct.selectEnable = 'on';
                InfoStruct.deselectEnable = 'on';
                InfoStruct.runTaskAdvisorEnable = 'on';
                if strcmp(taskadvisornode.ID, 'SysRoot')
                    InfoStruct.runTaskAdvisorEnable = 'off';
                    InfoStruct.selectEnable = 'off';
                    InfoStruct.deselectEnable = 'off';
                end % if
            case 'Task'
                if taskadvisornode.Selected
                    InfoStruct.selectEnable = 'off';
                    InfoStruct.deselectEnable = 'on';
                    InfoStruct.runTaskAdvisorEnable = 'on';
                else
                    InfoStruct.selectEnable = 'on';
                    InfoStruct.deselectEnable = 'off';
                    InfoStruct.runTaskAdvisorEnable = 'off';
                end % if
            end % switch
        else
            if taskadvisornode.Selected
                InfoStruct.runTaskAdvisorEnable = 'on';
            else
                InfoStruct.runTaskAdvisorEnable = 'off';
            end % if
            InfoStruct.selectEnable = 'off';
            InfoStruct.deselectEnable = 'off';
        end % if
        varargout{1.0} = InfoStruct;
    case 'UpdateMEMenuToolbar'
        me = varargin{1.0};
        imme = DAStudio.imExplorer(me);
        mdladvObj = Simulink.ModelAdvisor.getActiveModelAdvisorObj;
        selectedNode = imme.getCurrentTreeNode;
        menuStruct = modeladvisorprivate('modeladvisorutil2', 'GetSelectMenuForTaskAdvsiorNode', selectedNode);
        mdladvObj.MEMenus.Select.text = menuStruct.selectmsg;
        mdladvObj.MEMenus.Select.enabled = menuStruct.selectEnable;
        mdladvObj.MEMenus.Deselect.text = menuStruct.deselectmsg;
        mdladvObj.MEMenus.Deselect.enabled = menuStruct.deselectEnable;
    case 'GetIconForModelAdvisorCheck'
        mdladvCheck = varargin{1.0};
        if mdladvCheck.Success
            imagename = 'task_passed.png';
        else
            imagename = 'task_warning.png';
        end % if
        varargout{1.0} = imagename;
    case 'LoadGenerateInfo'
        mdladvObj = varargin{1.0};
        if isfield(mdladvObj.AtticData, 'WorkDir')
            infoFile = fullfile(mdladvObj.AtticData.WorkDir, 'geninfo.mat');
        else
            fullfile(mdladvObj.getWorkDir, 'geninfo.mat');
        end % if
        if exist(infoFile, 'file')
            infoStruct = load(infoFile);
        else
            infoStruct = [];
        end % if
        varargout{1.0} = infoStruct;
    case 'SaveGenerateInfo'
        mdladvObj = varargin{1.0};
        if isfield(mdladvObj.AtticData, 'WorkDir')
            infoFile = fullfile(mdladvObj.AtticData.WorkDir, 'geninfo.mat');
        else
            fullfile(mdladvObj.getWorkDir, 'geninfo.mat');
        end % if
        fromTaskAdvisorNode = varargin{2.0};
        generateTime = varargin{3.0};
        numCheckPassed = varargin{4.0};
        numCheckFailed = varargin{5.0};
        save(infoFile, 'fromTaskAdvisorNode', 'generateTime', 'numCheckPassed', 'numCheckFailed');
    otherwise
        error(horzcat('Unknown method: ', methods, ' specified.'));
    end % switch
