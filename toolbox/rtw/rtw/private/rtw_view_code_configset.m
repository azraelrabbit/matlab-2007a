function rtw_view_code_configset(ModelName, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent openDlgArray;
    for i=1.0:length(openDlgArray)
        if isa(openDlgArray{i}.dlg, 'DAStudio.Dialog')
            if strcmp(ModelName, openDlgArray{i}.ModelName)
                openDlgArray{i}.dlg.show;
                return
            end
        else
            openDlgArray{i}.dlg = '';
        end
    end % for
    % 18 21
    % 19 21
    tmpDlgArray = [];
    for i=1.0:length(openDlgArray)
        if not(isempty(openDlgArray{i}.dlg))
            tmpDlgArray{plus(end, 1.0)} = openDlgArray{i};
        end
    end % for
    openDlgArray = tmpDlgArray;
    % 27 31
    % 28 31
    % 29 31
    codeObj = '';
    % 31 33
    if isempty(find_system('Name', ModelName, 'type', 'block_diagram'))
        % 33 36
        % 34 36
        if gt(nargin, 1.0) && exist(varargin{1.0}, 'file')
            % 36 39
            % 37 39
            load(varargin{1.0});
            if isa(infoStructConfigSet, 'Simulink.ConfigSet')
                codeObj.ConfigSetObj = infoStructConfigSet;
                codeObj.ConfigSetObj.readonly = 'on';
            end
        end
    else
        codeObj = getActiveCode(ModelName);
    end
    % 47 49
    if isempty(codeObj)
        DAStudio.error('RTW:configSet:codeUnavailable', ModelName);
    end
    % 51 53
    if isa(codeObj.ConfigSetObj, 'Simulink.ConfigSet')
        dlg = DAStudio.Dialog(codeObj.ConfigSetObj, 'simprm', 'DLG_STANDALONE');
    else
        codeObj.refresh;
        if isa(codeObj.ConfigSetObj, 'Simulink.ConfigSet')
            dlg = DAStudio.Dialog(codeObj.ConfigSetObj, 'simprm', 'DLG_STANDALONE');
        else
            DAStudio.error('RTW:configSet:configSetUnavailable', ModelName);
        end
    end
    % 62 65
    % 63 65
    openDlgArray{plus(end, 1.0)}.dlg = dlg;
    openDlgArray{end}.ModelName = ModelName;
end
