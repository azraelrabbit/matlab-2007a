function rec = styleguide_db_0138
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0138Title');
    rec.TitleID = 'StyleGuide: db_0138';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0138Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0138_StyleThreeCallback;
    rec.CallbackContext = 'none';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = db_0138_StyleThreeCallback(system)
    % 23 26
    % 24 26
    feature('scopedaccelenablement', 'off');
    ResultDescription = {};
    ResultHandles = {};
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0138Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 30 34
    % 31 34
    % 32 34
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 35 39
    % 36 39
    % 37 39
    rt = sfroot;
    m = rt.find('-isa', 'Simulink.BlockDiagram', '-and', 'Name', system);
    % 40 44
    % 41 44
    % 42 44
    listOfCharts = find_system(system, 'FollowLinks', 'on', 'MaskType', 'Stateflow');
    lib_chart = [];
    org_path = [];
    % 46 48
    for i=1.0:length(listOfCharts)
        if strcmp(get_param(listOfCharts{i}, 'LinkStatus'), 'resolved')
            lib_chart{plus(end, 1.0)} = get_param(listOfCharts{i}, 'ReferenceBlock');
            org_path{plus(end, 1.0)} = listOfCharts{i};
        end % if
    end % for
    % 53 55
    lib_chart_u = unique(lib_chart);
    sourceChartObjects = get_source_charts_for_links_in_model(bdroot(system), lib_chart_u);
    chartArray = m.find('-isa', 'Stateflow.Chart');
    pathList = {};
    linkList = {};
    for i=1.0:length(chartArray)
        pathList{i} = chartArray(i).Path;
        linkList{i} = [];
    end % for
    for i=1.0:length(org_path)
        for j=1.0:length(sourceChartObjects)
            if strcmp(lib_chart{i}, sourceChartObjects{j}.Path)
                chartArray(plus(end, 1.0)) = sourceChartObjects{j};
                pathList{plus(end, 1.0)} = org_path{i};
                linkList{plus(end, 1.0)} = lib_chart{i};
            end % if
        end % for
    end % for
    % 72 75
    % 73 75
    historyJ = [];
    historyHandles = [];
    failMsg = 0.0;
    currentResult = [];
    for q=1.0:length(chartArray)
        historyJ = chartArray(q).find('-isa', 'Stateflow.Junction', '-and', 'Type', 'HISTORY');
        % 80 83
        % 81 83
        currentResult = historyHandles;
        if isempty(historyJ)
        else
            % 85 87
            if eq(failMsg, 0.0)
                failMsg = 1.0;
                currentDescription = DAStudio.message('Slvnv:styleguide:db0138FailMsg');
                ResultDescription{plus(end, 1.0)} = currentDescription;
                ResultHandles{plus(end, 1.0)} = currentResult;
            end % if
            for i=1.0:length(historyJ)
                path = historyJ(i).Path;
                if eq(isempty(linkList{q}), 0.0)
                    systemJ = linkList{q};
                    pathD = strrep(path, linkList{q}, pathList{q});
                    chartP = pathList{q};
                else
                    systemJ = system;
                    pathD = path;
                    chartP = pathList{q};
                end % if
                cr = sprintf('\n');
                systemJ = strrep(systemJ, cr, '__CR__');
                pathD = strrep(pathD, cr, '__CR__');
                chartP = strrep(chartP, cr, '__CR__');
                ResultDescription{plus(end, 1.0)} = horzcat('<a href="matlab: styleguideprivate(', '''view_junction''', ',', '''', systemJ, '''', ',', '''', path, '''', ',', '''', chartP, '''', ')">', pathD, '</a>');
                ResultHandles{plus(end, 1.0)} = {};
            end % for
            mdladvObj.setCheckResultStatus(false);
        end % if
        % 112 114
    end % for
    % 114 116
    if eq(failMsg, 0.0)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
        mdladvObj.setCheckResultStatus(true);
    end % if
