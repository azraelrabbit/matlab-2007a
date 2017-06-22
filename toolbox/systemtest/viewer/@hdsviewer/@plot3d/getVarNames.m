function [varNames, axesVarNames, distinguishVarNames] = getVarNames(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    varNames = {};
    if isempty(h.Waves)
        return;
    end % if
    % 10 14
    % 11 14
    % 12 14
    src = h.Waves(1.0).DataSrc;
    if not(isempty(src.XVar))
        axesVarNames = src.XVar;
    else
        axesVarNames = {};
    end % if
    if not(isempty(src.YVar))
        axesVarNames = vertcat(axesVarNames, horzcat(src.YVar));
    end % if
    if not(isempty(src.RowVar))
        y(src.RowVar)
        distinguishVarNames = src.RowVar;
    else
        distinguishVarNames = {};
    end % if
    if not(isempty(src.ColumnVar))
        distinguishVarNames = vertcat(distinguishVarNames, horzcat(src.ColumnVar));
    end % if
    if not(isempty(src.MarkerVar))
        distinguishVarNames = vertcat(distinguishVarNames, horzcat(src.MarkerVar));
    end % if
    if not(isempty(src.ColorVar))
        distinguishVarNames = vertcat(distinguishVarNames, horzcat(src.ColorVar));
    end % if
    % 37 40
    % 38 40
    for k=1.0:length(h.Waves)
        if not(isempty(h.Waves(k).DataSrc.ZVar))
            axesVarNames = vertcat(axesVarNames, horzcat(h.Waves(k).DataSrc.ZVar));
        end % if
    end % for
    % 44 47
    % 45 47
    varNames = vertcat(axesVarNames, distinguishVarNames);
end % function
