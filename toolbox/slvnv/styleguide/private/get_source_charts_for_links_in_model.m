function sourceChartObjects = get_source_charts_for_links_in_model(modelName, ref_list)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    machineId = sf('find', 'all', 'machine.name', modelName);
    linkCharts = sf('get', machineId, 'machine.sfLinks');
    sourceCharts = [];
    for i=1.0:length(linkCharts)
        sourceCharts(i) = sfprivate('block2chart', linkCharts(i));
    end % for
    % 12 13
    sourceCharts = unique(sourceCharts);
    % 14 15
    sfRoot = sfroot;
    sourceChartObjects = [];
    for i=1.0:length(sourceCharts)
        chartObj = sfRoot.idToHandle(sourceCharts(i));
        if ismember(chartObj.Path, ref_list)
            sourceChartObjects{plus(end, 1.0)} = sfRoot.idToHandle(sourceCharts(i));
        end % if
    end % for
end % function
