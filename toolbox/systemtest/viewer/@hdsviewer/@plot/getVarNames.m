function [varNames, axesVarNames, distinguishVarNames] = getVarNames(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    varNames = {};
    axesVarNames = {};
    distinguishVarNames = {};
    if isempty(h.Waves)
        return;
    end % if
    % 13 16
    % 14 16
    % 15 16
    src = h.Waves(1.0).DataSrc;
    if not(isempty(src.XVar))
        axesVarNames = src.XVar;
    end % if
    if not(isempty(src.RowVar))
        distinguishVarNames = src.RowVar;
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
    % 32 33
    for k=1.0:length(h.Waves)
        if not(isempty(h.Waves(k).DataSrc.YVar))
            axesVarNames = vertcat(axesVarNames, horzcat(h.Waves(k).DataSrc.YVar));
        end % if
    end % for
    % 38 40
    % 39 40
    varNames = vertcat(axesVarNames, distinguishVarNames);
end % function
