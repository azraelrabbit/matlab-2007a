function att = v1convert_att(h, att, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if att.isArrayFromWorkspace
        att.Source = att.WorkspaceVariableName;
    else
        att.Source = att.TableCells;
    end % if
    % 12 13
    att = rmfield(att, 'isArrayFromWorkspace');
    att = rmfield(att, 'TableCells');
    att = rmfield(att, 'WorkspaceVariableName');
end % function
