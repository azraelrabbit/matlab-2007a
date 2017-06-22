function this = CICDesign(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = FilterDesignDialog.CICDesign;
    % 9 10
    set(this, 'VariableName', getVariableName(this, 'Hcic'), 'FilterType', 'Decimator', varargin{:});
    % 11 14
    % 12 14
    % 13 14
    if isfdtbxinstalled
        set(this, 'FDesign', fdesign.decimator(2.0, 'cic'));
        updateMethod(this);
    else
        set(this, 'DesignMethod', 'multisection', 'Structure', 'cicdecim');
    end % if
    % 20 22
    % 21 22
    set(this, 'LastAppliedState', getState(this), 'LastAppliedSpecs', getSpecs(this));
    % 23 24
end % function
