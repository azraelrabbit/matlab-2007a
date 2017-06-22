function this = ISincLPDesign(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = FilterDesignDialog.ISincLPDesign;
    % 9 10
    set(this, 'VariableName', getVariableName(this, 'Hisinc'), varargin{:});
    % 11 12
    if isfdtbxinstalled
        set(this, 'FDesign', fdesign.isinclp);
        % 14 15
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
