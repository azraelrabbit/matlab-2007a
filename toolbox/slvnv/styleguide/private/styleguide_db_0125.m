function rec = styleguide_db_0125
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0125Title');
    rec.TitleID = 'StyleGuide: db_0125';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0125Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0125_StyleThreeCallback;
    rec.CallbackContext = 'none';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = db_0125_StyleThreeCallback(system)
    % 23 26
    % 24 26
    feature('scopedaccelenablement', 'off');
    ResultDescription = {};
    ResultHandles = {};
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0125Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 30 33
    % 31 33
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 34 38
    % 35 38
    % 36 38
    rt = sfroot;
    m = rt.find('-isa', 'Simulink.BlockDiagram', '-and', 'Name', bdroot);
    % 39 42
    % 40 42
    dataArray = m.find('-isa', 'Stateflow.Data');
    machine = m.find('-isa', 'Stateflow.Machine');
    machineData = [];
    if eq(isempty(machine), 0.0)
        machineId = machine.Id;
        % 46 48
        for i=1.0:length(dataArray)
            dataId = dataArray(i).Id;
            parentId = sf('get', dataId, '.linkNode.parent');
            if eq(parentId, machineId)
                machineData{plus(end, 1.0)} = dataArray(i);
            end % if
        end % for
    end % if
    dataHandles = [];
    % 56 58
    currentResult = dataHandles;
    if isempty(machineData)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
        mdladvObj.setCheckResultStatus(true);
    else
        currentDescription = DAStudio.message('Slvnv:styleguide:db0125FailMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
        % 67 69
        for i=1.0:length(machineData)
            path = machineData{i}.Path;
            cr = sprintf('\n');
            pathB = strrep(path, cr, '__CR__');
            name = machineData{i}.Name;
            ResultDescription{plus(end, 1.0)} = horzcat('<a href="matlab: styleguideprivate(', '''view_data''', ',', '''', pathB, '''', ',', '''', name, '''', ')">', horzcat(path, ' : ', name), '</a>');
            % 74 76
            ResultHandles{plus(end, 1.0)} = {};
        end % for
        mdladvObj.setCheckResultStatus(false);
    end % if
