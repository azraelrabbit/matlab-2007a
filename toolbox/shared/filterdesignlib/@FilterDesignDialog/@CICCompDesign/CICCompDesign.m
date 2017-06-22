function this = CICCompDesign(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = FilterDesignDialog.CICCompDesign;
    % 9 10
    set(this, 'VariableName', getVariableName(this, 'Hciccomp'), varargin{:});
    % 11 12
    if isfdtbxinstalled
        set(this, 'FDesign', fdesign.ciccomp);
        updateMethod(this);
    else
        set(this, 'DesignMethod', 'Equiripple', 'Structure', 'Direct-form FIR');
    end % if
    % 18 20
    % 19 20
    set(this, 'LastAppliedState', getState(this), 'LastAppliedSpecs', getSpecs(this), 'LastAppliedDesignOpts', getDesignOptions(this));
    % 21 23
    % 22 23
end % function
