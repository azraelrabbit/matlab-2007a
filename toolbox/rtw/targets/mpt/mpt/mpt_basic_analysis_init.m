function mpt_basic_analysis_init(modelName, seFlag)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ecac = rtwprivate('rtwattic', 'AtticData', 'ecac');
    % 9 11
    % 10 11
    if eq(exist('get_global_comments'), 2.0)
        globalComments = get_global_comments(modelName);
    else
        globalComments = [];
    end % if
    list = find_system(modelName, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'MaskType', 'DocBlock');
    rr = sprintf('\r');
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    ecac.globalComments = globalComments;
    % 31 32
    turnitoff = 0.0;
    if eq(seFlag, 1.0)
        % 34 35
        status = 0.0;
        if eq(status, 0.0)
            ecac.checkStatusFlag = 0.0;
            if eq(get_mpt_feature('signalSourceAnalysis'), 1.0)
                try
                    feature('EngineInterface', 1.0);
                    % 41 43
                    % 42 43
                    o = get_param(modelName, 'Object');
                    dirty = o.dirty;
                    blockReductionOpt = o.BlockReductionOpt;
                    o.BlockReductionOpt = 'off';
                    o = special_engine_init(o);
                    [actualSource, lineInfo] = find_all_line_s_and_d(modelName, o);
                    ecac.line_s_d.actualSource = actualSource;
                    ecac.line_s_d.lineInfo = lineInfo;
                    if eq(turnitoff, 0.0)
                        ecac.packInfo = mpt_package_and_data(modelName, o);
                        dataInfo = fp_for_active_sdo2(ecac.packInfo, modelName);
                    else
                        ecac.packInfo = get_data_list(modelName);
                        dataInfo = fp_for_active_sdo2(ecac.packInfo, modelName);
                    end % if
                    ecac.dataInfo = dataInfo;
                    if eq(get_mpt_feature('nameRules'), 1.0)
                        mpt_apply_rename(modelName, dataInfo);
                    end % if
                    % 62 63
                end % try
                o.term;
                o.dirty = dirty;
                o.BlockReductionOpt = blockReductionOpt;
            else
                % 68 69
                ecac.line_s_d.actualSource = [];
                ecac.line_s_d.lineInfo = [];
                ecac.packInfo = [];
            end % if
        else
            % 74 75
            ecac.checkStatusFlag = -1.0;
            ecac.line_s_d.actualSource = [];
            ecac.line_s_d.lineInfo = [];
            ecac.packInfo = [];
        end % if
    end % if
    rtwprivate('rtwattic', 'AtticData', 'ecac', ecac);
end % function
