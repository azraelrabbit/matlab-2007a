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
    if gt(nargin, 2.0) && not(isempty(varargin{1.0}))
        Label = horzcat(varargin{1.0}, ' (', ts.Name, ')');
    else
        Label = ts.Name;
    end % if
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    if localDoesNameExist(h, Label)
        % 26 29
        % 27 29
        tmpname = Label;
        Namestr = sprintf('TsArray object ''%s'' is already defined.\n\nSpecify a different name for the new object to be imported :\n', tmpname);
        % 30 32
            while true
            answer = inputdlg(Namestr, 'Enter Unique Name');
            % 33 36
            % 34 36
            if isempty(answer)
                return;
            end % if
            tmpname = strtrim(cell2mat(answer));
            if isempty(tmpname)
                Namestr = sprintf('Empty names are not allowed.\n\nSpecify a different name for the new object to be imported :');
            else
                tmpname = strtrim(cell2mat(answer));
                if localDoesNameExist(h, tmpname)
                    Namestr = sprintf('TsArray object ''%s'' is already defined.\n\nSpecify a different name for the new object to be imported :\n', tmpname);
                    % 45 47
                    continue;
                else
                    Label = tmpname;
                    break
                end % if
            end % if
        end % while
    end % if
    % 54 58
    % 55 58
    % 56 58
    node = tsguis.simulinkTsArrayNode(Label, ts);
    % 58 62
    % 59 62
    % 60 62
    Members = ts.whos;
    % 62 64
    for k=1.0:length(Members)
        try
            thisdataobj = eval(horzcat('ts.', Members(k).name));
        catch
            msg = sprintf('The data object with name %s could not be interpreted for importing. Please use a valid logged signal name.', Members(k).name);
            error('%s\n%s', msg, 'Creation of data node failed.')
        end % try
        % 70 72
        if isempty(thisdataobj.Name)
            thisdataobj.Name = Members(k).name;
        end % if
        childnode = createTstoolNode(thisdataobj, node);
        if not(isempty(childnode))
            childnode = node.addNode(childnode);
        end % if
    end % for
    % 79 81
    node.DataNameChangeListener = handle.listener(node.SimModelhandle, node.SimModelhandle.findprop('Name'), 'PropertyPostSet', cellhorzcat(@localUpdateNodeName, node));
end % function
function localUpdateNodeName(es, ed, node)
    % 83 87
    % 84 87
    % 85 87
    newName = node.SimModelhandle.Name;
    node.updateNodeNameCallback(newName);
end % function
function Flag = localDoesNameExist(h, name)
    % 90 93
    % 91 93
    nodes = h.getChildren('Label', name);
    Flag = false;
    if not(isempty(nodes))
        for k=1.0:length(nodes)
            if strcmp(class(nodes(k)), 'tsguis.simulinkTsArrayNode')
                Flag = true;
                break
            end % if
        end % for
    end % if
end % function
