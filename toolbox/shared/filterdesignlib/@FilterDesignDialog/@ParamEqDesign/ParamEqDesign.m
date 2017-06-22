function this = ParamEqDesign(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = FilterDesignDialog.ParamEqDesign;
    % 9 10
    set(this, 'VariableName', getVariableName(this, 'Hpe'), 'Order', '10', 'ImpulseResponse', 'IIR', varargin{:});
    % 11 14
    % 12 14
    % 13 14
    if isfdtbxinstalled
        set(this, 'FDesign', fdesign.parameq);
        updateMethod(this);
    else
        set(this, 'DesignMethod', 'Butterworth', 'Structure', 'Direct-form II, Second-order sections');
    end % if
    % 20 22
    % 21 22
    set(this, 'LastAppliedState', getState(this), 'LastAppliedSpecs', getSpecs(this), 'LastAppliedDesignOpts', getDesignOptions(this));
    % 23 25
    % 24 25
end % function
