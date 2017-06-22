function node = createTstoolNode(ts, h, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    node = [];
    % 10 12
    status = prepareTsDataforImport(ts);
    if not(status)
        return;
    end % if
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    if localDoesNameExist(h, ts.Name)
        % 23 26
        % 24 26
        tmpname = ts.name;
        Namestr = sprintf('Simulink Time Series object ''%s'' is already defined.\n\nSpecify a different name for the new object to be imported :\n', tmpname);
        % 27 29
            while true
            answer = inputdlg(Namestr, 'Enter Unique Name');
            % 30 33
            % 31 33
            if isempty(answer)
                return;
            end % if
            tmpname = strtrim(cell2mat(answer));
            if isempty(tmpname)
                Namestr = sprintf('%s \n\n %s', 'Empty names are not allowed.', 'Specify a different name for the new object to be imported :');
            else
                % 39 41
                tmpname = strtrim(cell2mat(answer));
                % 41 43
                if localDoesNameExist(h, tmpname)
                    Namestr = sprintf('Simulink Time Series object  ''%s''  is already defined.\n\nPlease give a different name for the new object to be imported :\n', tmpname);
                    continue;
                else
                    ts.name = tmpname;
                    break
                end % if
            end % if
        end % while
    end % if
    % 52 56
    % 53 56
    % 54 56
    node = tsguis.simulinkTsNode(ts);
    % 56 60
    % 57 60
    % 58 60
    node.Tslistener = handle.listener(node.Timeseries, 'datachange', cellhorzcat(@localUpdatePanel, node));
    node.DataNameChangeListener = handle.listener(node.Timeseries, node.Timeseries.findprop('Name'), 'PropertyPostSet', cellhorzcat(@localUpdateNodeName, node));
end % function
function localUpdateNodeName(es, ed, node)
    % 63 67
    % 64 67
    % 65 67
    newName = node.Timeseries.Name;
    node.updateNodeNameCallback(newName);
end % function
function localUpdatePanel(es, ed, node)
    % 70 73
    % 71 73
    node.updatePanel(node.getContainerNodeName, node.Timeseries);
end % function
function Flag = localDoesNameExist(h, name)
    % 75 78
    % 76 78
    nodes = h.getChildren('Label', name);
    Flag = false;
    if not(isempty(nodes))
        for k=1.0:length(nodes)
            if strcmp(class(nodes(k)), 'tsguis.simulinkTsNode')
                Flag = true;
                break
            end % if
        end % for
    end % if
end % function
