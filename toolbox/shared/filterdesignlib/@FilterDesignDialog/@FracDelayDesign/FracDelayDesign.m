function this = FracDelayDesign(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = FilterDesignDialog.FracDelayDesign;
    % 9 10
    set(this, 'VariableName', getVariableName(this, 'Hfd'), 'Order', '3', 'OrderMode', 'specify', varargin{:});
    % 11 14
    % 12 14
    % 13 14
    if isfdtbxinstalled
        set(this, 'FDesign', fdesign.fracdelay);
        updateMethod(this);
    else
        set(this, 'DesignMethod', 'Lagrange interpolation', 'Structure', 'Fractional delay');
    end % if
    % 20 22
    % 21 22
    set(this, 'LastAppliedState', getState(this), 'LastAppliedSpecs', getSpecs(this));
    % 23 24
end % function
