function this = NyquistDesign(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = FilterDesignDialog.NyquistDesign;
    % 9 10
    set(this, 'VariableName', getVariableName(this, 'Hnyq'), varargin{:});
    % 11 12
    if isfdtbxinstalled
        set(this, 'FDesign', fdesign.nyquist);
    else
        % 15 17
        % 16 17
        set(this, 'Structure', 'Direct-form FIR');
    end % if
    % 19 20
    set(this, 'DesignMethod', 'Kaiser window');
    % 21 23
    % 22 23
    set(this, 'LastAppliedState', getState(this), 'LastAppliedSpecs', getSpecs(this), 'LastAppliedDesignOpts', getDesignOptions(this));
    % 24 26
    % 25 26
end % function
