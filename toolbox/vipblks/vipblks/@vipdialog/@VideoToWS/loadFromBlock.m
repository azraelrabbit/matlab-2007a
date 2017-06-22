function loadFromBlock(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h.VariableName = h.Block.VariableName;
    h.NumInputs = h.Block.NumInputs;
    h.DataLimit = h.Block.DataLimit;
    h.DecimationFactor = h.Block.DecimationFactor;
    h.InPortLabels = h.Block.InPortLabels;
    h.InPortLabels = h.Block.InPortLabels;
    h.LogFi = strcmpi(h.Block.LogFi, 'on');
end % function
