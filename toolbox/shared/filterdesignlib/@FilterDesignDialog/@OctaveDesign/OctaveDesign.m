function this = OctaveDesign(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    this = FilterDesignDialog.OctaveDesign;
    % 8 10
    set(this, 'VariableName', getVariableName(this, 'Hoct'), 'FrequencyUnits', 'Hz', 'InputSampleRate', '48000', 'Order', '6', 'ImpulseResponse', 'IIR', 'OrderMode', 'specify', varargin{:});
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if isfdtbxinstalled
        set(this, 'FDesign', fdesign.octave);
        updateMethod(this);
    else
        set(this, 'DesignMethod', 'Butterworth', 'Structure', 'Direct-form II, Second-order sections');
    end
    % 22 24
    l = handle.listener(this, this.findprop('FrequencyUnits'), 'PropertyPreSet', @(hSrc,eventData)fix_f0(this,eventData));
    % 24 26
    set(this, 'FrequencyUnitsListener', l);
    % 26 29
    % 27 29
    set(this, 'LastAppliedState', getState(this), 'LastAppliedSpecs', getSpecs(this), 'LastAppliedDesignOpts', getDesignOptions(this));
    % 29 32
    % 30 32
end
function fix_f0(this, eventData)
    % 33 37
    % 34 37
    % 35 37
    oldF0 = get(this, 'F0');
    oldFU = get(this, 'FrequencyUnits');
    newFU = get(eventData, 'NewValue');
    newF0 = convertfrequnits(oldF0, oldFU, newFU);
    % 40 42
    set(this, 'F0', newF0);
end
