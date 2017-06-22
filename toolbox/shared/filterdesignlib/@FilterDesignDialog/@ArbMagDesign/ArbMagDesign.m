function this = ArbMagDesign(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = FilterDesignDialog.ArbMagDesign;
    % 9 11
    % 10 11
    f = 'linspace(0, 1, 30)';
    a = '[ones(1, 7) zeros(1,8) ones(1,8) zeros(1,7)]';
    m = 'ones(1, 30)';
    p = 'angle(exp(-12*j*pi*linspace(0, 1, 30)))';
    h = 'exp(-12*j*pi*linspace(0, 1, 30))';
    % 16 17
    set(this, 'OrderMode', 'specify', 'VariableName', getVariableName(this, 'Ham'), 'Band1', FilterDesignDialog.ArbMagBand(f, a, m, p, h), varargin{:});
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    if isfdtbxinstalled
        set(this, 'FDesign', fdesign.arbmag);
    end % if
    set(this, 'DesignMethod', 'Frequency sampling');
    % 28 29
    set(this, 'LastAppliedSpecs', getSpecs(this), 'LastAppliedState', getState(this), 'LastAppliedDesignOpts', {'Window',''});
    % 30 32
    % 31 32
end % function
