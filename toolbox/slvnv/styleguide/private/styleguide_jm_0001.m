function rec = styleguide_jm_0001
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:jm0001Title');
    rec.TitleID = 'StyleGuide: jm_0001';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:jm0001Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @jm_0001_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
    % 21 23
function [ResultDescription, ResultHandles] = jm_0001_StyleThreeCallback(system)
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    feature('scopedaccelenablement', 'off');
    % 31 33
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    % 33 36
    % 34 36
    resultData = getCheckInformation(system);
    % 36 39
    % 37 39
    [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData);
    % 39 41
function [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData)
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    ResultDescription = {};
    ResultHandles = {};
    % 49 51
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('jm0001Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 52 55
    % 53 55
    if isempty(resultData(1.0).failedBlocks)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
        % 58 60
        mdladvObj.setCheckResultStatus(true);
    else
        % 61 63
        currentDescription = DAStudio.message('Slvnv:styleguide:jm0001FailMsg');
        mdladvObj.setCheckResultStatus(false);
        % 64 66
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = resultData(1.0).failedBlocks;
    end % if
    % 68 70
function resultData = getCheckInformation(system)
    % 70 79
    % 71 79
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    ProhibitedBlocks = {'SubSystem','Algebraic Constraint';'SubSystem','Band-Limited White Noise.';'SubSystem','chirp';'Clock','';'ComplexToMagnitudeAngle','';'ComplexToRealImag','';'Derivative','';'DigitalClock','';'FromWorkspace','';'FromFile','';'GotoTagVisibility','';'HitCross','';'Integrator','';'MATLABFcn','';'MagnitudeAngleToComplex','';'SubSystem','Manual Switch';'Memory','';'S-Function','Polyval';'Probe','';'DiscretePulseGenerator','';'SubSystem','Ramp';'RandomNumber','';'RealImagToComplex','';'SubSystem','Repeating table';'SignalGenerator','';'Sin','';'SubSystem','Slider Gain';'StateSpace','';'Step','';'TransferFcn','';'TransportDelay','';'UniformRandomNumber','';'VariableTransportDelay','';'ZeroPole',''};
    % 79 117
    % 80 117
    % 81 117
    % 82 117
    % 83 117
    % 84 117
    % 85 117
    % 86 117
    % 87 117
    % 88 117
    % 89 117
    % 90 117
    % 91 117
    % 92 117
    % 93 117
    % 94 117
    % 95 117
    % 96 117
    % 97 117
    % 98 117
    % 99 117
    % 100 117
    % 101 117
    % 102 117
    % 103 117
    % 104 117
    % 105 117
    % 106 117
    % 107 117
    % 108 117
    % 109 117
    % 110 117
    % 111 117
    % 112 117
    % 113 117
    % 114 117
    % 115 117
    failedBlocks = [];
    % 117 120
    % 118 120
    for idx=1.0:size(ProhibitedBlocks, 1.0)
        % 120 122
        blks = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'all', 'BlockType', ProhibitedBlocks{idx, 1.0}, 'MaskType', ProhibitedBlocks{idx, 2.0});
        % 122 129
        % 123 129
        % 124 129
        % 125 129
        % 126 129
        % 127 129
        failedBlocks = vertcat(failedBlocks, blks);
    end % for
    % 130 133
    % 131 133
    resultData.failedBlocks = failedBlocks;
    % 133 135
