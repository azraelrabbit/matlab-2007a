function att = v1convert_att(h, att, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isfield(att, 'isShowVariableValue')
        % 7 9
        att.isVariableTable = logical(1);
        att.isFunctionTable = logical(0);
        att.VariableTableTitle = att.TableTitle;
        att.VariableTableTitleType = 'manual';
    else
        % 13 15
        att.isVariableTable = logical(0);
        att.isFunctionTable = logical(1);
        att.FunctionTableTitle = att.TableTitle;
        att.FunctionTableTitleType = 'manual';
    end
    % 19 21
    att = rmfield(att, 'TableTitle');
end
