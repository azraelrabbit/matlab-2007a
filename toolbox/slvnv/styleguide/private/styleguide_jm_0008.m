function rec = styleguide_jm_0008
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:jm0008Title');
    rec.TitleID = 'StyleGuide: jm_0008';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:jm0008Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @jm_0008_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = jm_0008_StyleThreeCallback(varargin)
    % 23 27
    % 24 27
    % 25 27
    system = varargin{1.0};
    % 27 30
    % 28 30
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    % 30 33
    % 31 33
    resultData = getCheckInformation(system);
    % 33 35
    [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData);
function [ResultDescription, ResultHandles] = updateMdladvObj(mdladvObj, resultData)
    % 36 39
    % 37 39
    feature('scopedaccelenablement', 'off');
    ResultDescription = {};
    ResultHandles = {};
    % 41 43
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('jm0008Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 44 46
    if isempty(resultData.badBlocks)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
        mdladvObj.setCheckResultStatus(true);
    else
        % 51 53
        currentDescription = DAStudio.message('Slvnv:styleguide:jm0008FailMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = resultData.badBlocks;
        mdladvObj.setCheckResultStatus(false);
        % 56 58
    end % if
function resultData = getCheckInformation(system)
    % 59 63
    % 60 63
    % 61 63
    blks = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'all', 'type', 'block');
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    portcon = get_param(blks, 'PortConnectivity');
    ports = get_param(blks, 'Ports');
    % 69 75
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    numBlks = length(blks);
    resultData.failedBlocks = {};
    resultData.badBlocks = {};
    for inx=1.0:numBlks
        for jnx=1.0:ports{inx}(1.0)
            if eq(portcon{inx}(jnx).SrcBlock, -1.0)
                resultData.failedBlocks{plus(end, 1.0)} = blks{inx};
            end % if
        end % for
        % 83 85
        for jnx=1.0:ports{inx}(2.0)
            lh = get_param(blks{inx}, 'LineHandles');
            if eq(lh.Outport(jnx), -1.0)
                resultData.failedBlocks{plus(end, 1.0)} = blks{inx};
            else
                % 89 92
                % 90 92
                curlines = get_param(lh.Outport(jnx), 'LineChildren');
                allsinks = get_param(curlines, 'DstPortHandle');
                allsinks = cat(1.0, allsinks{:});
                if eq(isempty(allsinks), 0.0) && eq(isempty(find(eq(allsinks, -1.0))), 0.0)
                    resultData.failedBlocks{plus(end, 1.0)} = blks{inx};
                end % if
            end % if
        end % for
    end % for
    resultData.badBlocks = unique(resultData.failedBlocks);
