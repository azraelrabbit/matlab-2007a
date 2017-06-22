function rec = styleguide_jm_0013
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:jm0013Title');
    rec.TitleID = 'StyleGuide: jm_0013';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:jm0013Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @jm_0013_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = jm_0013_StyleThreeCallback(system)
    % 22 25
    % 23 25
    feature('scopedaccelenablement', 'off');
    ResultDescription = {};
    ResultHandles = {};
    % 27 29
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('jm0013Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 30 33
    % 31 33
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 34 38
    % 35 38
    % 36 38
    hAnnDropShadow = [];
    hAnnDropShadowStr = {};
    annotations = find_system(system, 'FindAll', 'on', 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'all', 'type', 'annotation');
    % 40 44
    % 41 44
    % 42 44
    for i=1.0:length(annotations)
        if strcmp(get_param(annotations(i), 'DropShadow'), 'on')
            hAnnDropShadow = horzcat(hAnnDropShadow, annotations(i));
            % 46 48
        end % if
    end % for
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    currentResult = hAnnDropShadow;
    if isempty(currentResult)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        mdladvObj.setCheckResultStatus(true);
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
    else
        currentDescription = DAStudio.message('Slvnv:styleguide:jm0013FailMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = [];
        for i=1.0:length(currentResult)
            % 64 66
            object = get_param(currentResult(i), 'Object');
            pathA = object.path;
            ResultDescription{plus(end, 1.0)} = horzcat('<a href="matlab: styleguideprivate(', '''view_annotation''', ',', '''', pathA, '''', ')">', pathA, '</a>');
            ResultHandles{plus(end, 1.0)} = {};
        end % for
        mdladvObj.setCheckResultStatus(false);
        % 71 73
    end % if
