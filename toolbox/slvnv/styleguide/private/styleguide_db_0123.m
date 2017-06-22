function rec = styleguide_db_0123
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0123Title');
    rec.TitleID = 'StyleGuide: db_0123';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0123Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0123_StyleThreeCallback;
    rec.CallbackContext = 'PostCompile';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = false;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
function [ResultDescription, ResultHandles] = db_0123_StyleThreeCallback(system)
    % 23 27
    % 24 27
    % 25 27
    feature('scopedaccelenablement', 'off');
    ResultDescription = {};
    ResultHandles = {};
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0123Tip');
    ResultHandles{plus(end, 1.0)} = [];
    % 31 34
    % 32 34
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 35 37
    rt = sfroot;
    m = rt.find('-isa', 'Simulink.BlockDiagram', '-and', 'Name', bdroot(system));
    % 38 42
    % 39 42
    % 40 42
    listOfCharts = find_system(system, 'FollowLinks', 'on', 'MaskType', 'Stateflow');
    lib_chart = [];
    org_path = [];
    % 44 46
    for i=1.0:length(listOfCharts)
        if strcmp(get_param(listOfCharts{i}, 'LinkStatus'), 'resolved')
            lib_chart{plus(end, 1.0)} = get_param(listOfCharts{i}, 'ReferenceBlock');
            org_path{plus(end, 1.0)} = listOfCharts{i};
        end % if
    end % for
    % 51 53
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
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    portHandles = [];
    for i=1.0:length(chartArray)
        c = chartArray(i);
        d = c.find('-isa', 'Stateflow.Data');
        di = d.find('Scope', 'Input');
        do = d.find('Scope', 'Output');
        % 80 82
        o = get_param(pathList{i}, 'Object');
        for j=1.0:length(o.LineHandles.Inport)
            if gt(o.LineHandles.Inport(j), 0.0)
                x = get_param(o.LineHandles.Inport(j), 'Object');
                sp = x.getSourcePort;
                if isempty(sp.Name)
                    name = sp.PropagatedSignals;
                else
                    name = sp.Name;
                end % if
                if eq(strcmp(name, di(j).Name), 0.0)
                    portHandles = horzcat(portHandles, x.handle);
                    % 93 96
                    % 94 96
                end % if
            end % if
        end % for
        for j=1.0:length(o.LineHandles.Outport)
            if gt(o.LineHandles.Outport(j), 0.0)
                x = get_param(o.LineHandles.Outport(j), 'Object');
                if eq(strcmp(get_param(x.SrcPortHandle, 'CompiledPortDataType'), 'fcn_call'), 0.0)
                    sp = x.getSourcePort;
                    if not(isempty(sp.Name)) && not(strcmp(sp.Name, do(j).Name))
                        portHandles = horzcat(portHandles, x.handle);
                    end % if
                end % if
            end % if
        end % for
    end % for
    % 110 114
    % 111 114
    % 112 114
    currentResult = portHandles;
    if isempty(currentResult)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
        mdladvObj.setCheckResultStatus(true);
    else
        currentDescription = DAStudio.message('Slvnv:styleguide:db0123FailMsg');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = currentResult;
        mdladvObj.setCheckResultStatus(false);
        % 124 126
    end % if
