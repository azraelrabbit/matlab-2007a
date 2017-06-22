function sl_customization(cm)
    cm.addModelAdvisorCheckFcn(@mdl_advisor_callback);
function recordCellArray = mdl_advisor_callback
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    recordCellArray = {};
    % 8 11
    % 9 11
    currentRecord = Simulink.MdlAdvisorCheck;
    currentRecord.Title = DAStudio.message('Simulink:tools:MATitleIdentQuestFixptOper');
    currentRecord.TitleTips = DAStudio.message('Simulink:tools:MATitletipIdentQuestFixptOper');
    currentRecord.TitleInRAWFormat = false;
    currentRecord.RAWTitle = 'Identify questionable fixed-point operations';
    currentRecord.CallbackHandle = @ExecFunctionEleven;
    currentRecord.CallbackContext = 'PostCompile';
    currentRecord.CallbackStyle = 'StyleThree';
    currentRecord.CallbackReturnInRAWFormat = false;
    currentRecord.Visible = true;
    currentRecord.Enable = true;
    currentRecord.Value = false;
    currentRecord.Group = 'Real-Time Workshop Embedded Coder';
    currentRecord.GroupID = 'Real-Time Workshop Embedded Coder';
    currentRecord.TitleID = 'Identify questionable fixed-point operations';
    currentRecord.LicenseName = {'Real-Time_Workshop','Fixed_Point_Toolbox'};
    % 26 28
    recordCellArray{plus(end, 1.0)} = currentRecord;
function [ResultDescription, ResultHandles] = ExecFunctionEleven(system)
    % 29 32
    % 30 32
    ResultDescription = {};
    ResultHandles = {};
    % 33 36
    % 34 36
    passString = horzcat('<p><font color="#008000">', DAStudio.message('Simulink:tools:MAPassedMsg'), '</font>');
    skipString = '<p><font color="#008000">Skipped for non-ERT targets.</font>';
    model = bdroot(system);
    hScope = get_param(system, 'Handle');
    hModel = get_param(model, 'Handle');
    cs = getActiveConfigSet(model);
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 43 45
    notes = fixpt_advisor(getfullname(hScope));
    if not(isempty(notes))
        combined_notes = [];
        for i=1.0:length(notes)
            notes_found = 0.0;
            for j=1.0:length(combined_notes)
                if strcmpi(combined_notes{j}.issue, notes{i}.issue)
                    notes_found = 1.0;
                    break
                end % if
            end % for
            if notes_found
                combined_notes{j}.path{plus(end, 1.0)} = notes{i}.path;
            else
                combined_notes{plus(end, 1.0)}.issue = notes{i}.issue;
                if not(isempty(notes{i}.path))
                    combined_notes{end}.path{1.0} = notes{i}.path;
                else
                    combined_notes{end}.path = notes{i}.path;
                end % if
            end % if
        end % for
        for i=1.0:length(combined_notes)
            currentDescription = sprintf('\n\n<p><p><p>%s\n\n', combined_notes{i}.issue);
            currentResult = combined_notes{i}.path;
            ResultDescription{plus(end, 1.0)} = currentDescription;
            ResultHandles{plus(end, 1.0)} = currentResult;
        end % for
        mdladvObj.setCheckResultStatus(false);
    else
        currentResult = [];
        currentDescription = passString;
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
        mdladvObj.setCheckResultStatus(true);
    end % if
