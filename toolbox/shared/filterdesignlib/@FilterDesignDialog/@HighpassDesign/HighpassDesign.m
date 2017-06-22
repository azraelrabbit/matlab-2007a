function this = HighpassDesign(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = FilterDesignDialog.HighpassDesign;
    % 9 10
    set(this, 'VariableName', getVariableName(this, 'Hhp'), varargin{:});
    % 11 13
    % 12 13
    if isfdtbxinstalled
        set(this, 'FDesign', fdesign.highpass);
        updateMethod(this);
    else
        set(this, 'DesignMethod', 'Equiripple', 'Structure', 'Direct-form FIR');
    end % if
    % 19 21
    % 20 21
    set(this, 'LastAppliedState', getState(this), 'LastAppliedSpecs', getSpecs(this), 'LastAppliedDesignOpts', getDesignOptions(this));
    % 22 24
    % 23 24
end % function
