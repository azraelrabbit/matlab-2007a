function sl_customization(cm)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    cm.addModelAdvisorCheckFcn(@defineModelAdvisorChecks);
    cm.addModelAdvisorTaskFcn(@defineModelAdvisorTasks);
end % function
function taskCellArray = defineModelAdvisorTasks
    % 12 13
    taskCellArray = {};
    % 14 15
    task = Simulink.MdlAdvisorTask;
    task.Title = DAStudio.message('Slvnv:consistency:taskTitle');
    task.TitleID = 'Requirement consistency checking';
    task.TitleTips = DAStudio.message('Slvnv:consistency:taskTips');
    task.CheckTitleIDs = {'Check Requirement Documents','Check Requirement Identifiers','Check Requirement Labels','Check Requirement Paths'};
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    taskCellArray{plus(end, 1.0)} = task;
end % function
function recordCellArray = defineModelAdvisorChecks
    % 28 29
    recordCellArray = {};
    % 30 32
    % 31 32
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:consistency:checkDocumentTitle');
    rec.TitleID = 'Check Requirement Documents';
    rec.TitleTips = DAStudio.message('Slvnv:consistency:checkDocumentTips');
    rec.CallbackHandle = @rmicheckdoc;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.Group = 'Simulink Verification and Validation|Requirements Consistency';
    rec.LicenseName = {'SL_Verification_Validation'};
    recordCellArray{plus(end, 1.0)} = rec;
    % 42 44
    % 43 44
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:consistency:checkIdTitle');
    rec.TitleID = 'Check Requirement Identifiers';
    rec.TitleTips = DAStudio.message('Slvnv:consistency:checkIdTips');
    rec.CallbackHandle = @rmicheckid;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.Group = 'Simulink Verification and Validation|Requirements Consistency';
    rec.LicenseName = {'SL_Verification_Validation'};
    recordCellArray{plus(end, 1.0)} = rec;
    % 54 56
    % 55 56
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:consistency:checkLabelTitle');
    rec.TitleID = 'Check Requirement Labels';
    rec.TitleTips = DAStudio.message('Slvnv:consistency:checkLabelTips');
    rec.CallbackHandle = @rmichecklabel;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.Group = 'Simulink Verification and Validation|Requirements Consistency';
    rec.LicenseName = {'SL_Verification_Validation'};
    recordCellArray{plus(end, 1.0)} = rec;
    % 66 68
    % 67 68
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:consistency:checkPathTitle');
    rec.TitleID = 'Check Requirement Paths';
    rec.TitleTips = DAStudio.message('Slvnv:consistency:checkPathTips');
    rec.CallbackHandle = @rmicheckpath;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.Group = 'Simulink Verification and Validation|Requirements Consistency';
    rec.LicenseName = {'SL_Verification_Validation'};
    recordCellArray{plus(end, 1.0)} = rec;
end % function
