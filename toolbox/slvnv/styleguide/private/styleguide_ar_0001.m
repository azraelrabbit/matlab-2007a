function rec = styleguide_ar_0001
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:ar0001Title');
    rec.TitleID = 'StyleGuide: ar_0001';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:ar0001Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @ar_0001_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
end
function [ResultDescription, ResultHandles] = ar_0001_StyleThreeCallback(system)
    % 24 28
    % 25 28
    % 26 28
    feature('scopedaccelenablement', 'off');
    % 28 30
    ResultDescription = {};
    ResultHandles = {};
    % 31 33
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('ar0001Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 34 37
    % 35 37
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    hits = [];
    okchars = '.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz';
    % 40 43
    % 41 43
    mdlfilename = get_param(bdroot(system), 'FileName');
    % 43 47
    % 44 47
    % 45 47
    if not(isempty(mdlfilename))
        % 47 52
        % 48 52
        % 49 52
        % 50 52
        dirlist = dir(fileparts(mdlfilename));
        % 52 55
        % 53 55
        for i=3.0:length(dirlist)
            % 55 58
            % 56 58
            if eq(dirlist(i).isdir, 0.0)
                % 58 64
                % 59 64
                % 60 64
                % 61 64
                % 62 64
                if gt(sum(eq(dirlist(i).name, '.')), 1.0)
                    hits = horzcat(hits, i);
                else
                    % 66 70
                    % 67 70
                    % 68 70
                    if not(isempty(setdiff(dirlist(i).name, okchars)))
                        hits = horzcat(hits, i);
                    end
                end
            end
        end % for
    end
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    if isempty(hits)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        mdladvObj.setCheckResultStatus(true);
        % 83 85
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
    else
        % 87 90
        % 88 90
        outputstr = '';
        for i=1.0:length(hits)
            outputstr = horzcat(outputstr, '<P>', dirlist(hits(i)).name, '</P>');
        end % for
        % 93 96
        % 94 96
        currentDescription = DAStudio.message('Slvnv:styleguide:ar0001FailMsg', outputstr);
        mdladvObj.setCheckResultStatus(false);
        % 97 99
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
        % 100 102
    end
end
