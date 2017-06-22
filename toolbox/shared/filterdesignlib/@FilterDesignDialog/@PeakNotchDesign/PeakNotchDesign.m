function this = PeakNotchDesign(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = FilterDesignDialog.PeakNotchDesign;
    % 9 10
    set(this, 'VariableName', getVariableName(this, 'Hpn'), 'Order', '6', 'ImpulseResponse', 'IIR', 'OrderMode', 'specify', varargin{:});
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if isfdtbxinstalled
        set(this, 'FDesign', fdesign.peak);
        updateMethod(this);
    else
        set(this, 'DesignMethod', 'Butterworth', 'Structure', 'Direct-form II, Second-order sections');
    end % if
    % 21 22
    defSpecs = struct('FrequencyUnits', 'normalized (0 to 1)', 'InputSampleRate', 2.0, 'Order', 6.0, 'F0', .5, 'Q', 2.5);
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    defOpts = cell(1.0, 0.0);
    % 29 30
    set(this, 'LastAppliedSpecs', defSpecs, 'LastAppliedDesignOpts', defOpts);
end % function
