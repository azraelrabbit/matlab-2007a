function rec = styleguide_db_0126
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0126Title');
    rec.TitleID = 'StyleGuide: db_0126';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0126Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0126_StyleThreeCallback;
    rec.CallbackContext = 'none';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = db_0126_StyleThreeCallback(system)
    % 23 26
    % 24 26
    feature('scopedaccelenablement', 'off');
    % 26 28
    ResultDescription = {};
    ResultHandles = {};
    % 29 31
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0126Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 32 35
    % 33 35
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 36 40
    % 37 40
    % 38 40
    rt = sfroot;
    m = rt.find('-isa', 'Simulink.BlockDiagram', '-and', 'Name', bdroot);
    % 41 44
    % 42 44
    eventArray = m.find('-isa', 'Stateflow.Event');
    machine = m.find('-isa', 'Stateflow.Machine');
    machineEvent = [];
    if eq(isempty(machine), 0.0)
        machineId = machine.Id;
        % 48 50
        for i=1.0:length(eventArray)
            eventId = eventArray(i).Id;
            parentId = sf('get', eventId, '.linkNode.parent');
            if eq(parentId, machineId)
                machineEvent{plus(end, 1.0)} = eventArray(i);
            end % if
        end % for
    end % if
    eventHandles = [];
    % 58 60
    currentResult = eventHandles;
    if isempty(machineEvent)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
        mdladvObj.setCheckResultStatus(true);
    else
        currentDescription = DAStudio.message('Slvnv:styleguide:db0126FailMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
        % 69 71
        for i=1.0:length(machineEvent)
            path = machineEvent{i}.Path;
            name = machineEvent{i}.Name;
            ResultDescription{plus(end, 1.0)} = horzcat('<a href="matlab: styleguideprivate(', '''view_event''', ',', '''', path, '''', ',', '''', name, '''', ')">', horzcat(path, ' : ', name), '</a>');
            % 74 76
            ResultHandles{plus(end, 1.0)} = {};
        end % for
        mdladvObj.setCheckResultStatus(false);
    end % if
