function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('dspdialog');
    parent = findclass(package, 'DSPDDG');
    fixptPackage = findpackage('dspfixptddg');
    findclass(fixptPackage, 'FixptDialog');
    % 13 14
    this = schema.class(package, 'DigitalFilter', parent);
    % 15 17
    % 16 17
    schema.prop(this, 'MaskFixptDialog', 'dspfixptddg.FixptDialog');
    % 18 20
    % 19 20
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 25 27
    % 26 27
    if isempty(findtype('DSPDigitalFilterTransferFunction'))
        schema.EnumType('DSPDigitalFilterTransferFunction', {'IIR (poles & zeros)','IIR (all poles)','FIR (all zeros)'});
        % 29 32
        % 30 32
        % 31 32
    end % if
    % 33 34
    if isempty(findtype('DSPDigitalFilterDialogModeIIRStructure'))
        schema.EnumType('DSPDigitalFilterDialogModeIIRStructure', {'Direct form I','Direct form I transposed','Direct form II','Direct form II transposed','Biquad direct form I (SOS)','Biquad direct form I transposed (SOS)','Biquad direct form II (SOS)','Biquad direct form II transposed (SOS)'});
        % 36 44
        % 37 44
        % 38 44
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        % 43 44
    end % if
    % 45 46
    if isempty(findtype('DSPDigitalFilterPortsModeIIRStructure'))
        schema.EnumType('DSPDigitalFilterPortsModeIIRStructure', {'Direct form I','Direct form I transposed','Direct form II','Direct form II transposed'});
        % 48 52
        % 49 52
        % 50 52
        % 51 52
    end % if
    % 53 54
    if isempty(findtype('DSPDigitalFilterIIRAllPoleStructure'))
        schema.EnumType('DSPDigitalFilterIIRAllPoleStructure', {'Direct form','Direct form transposed','Lattice AR'});
        % 56 59
        % 57 59
        % 58 59
    end % if
    % 60 61
    if isempty(findtype('DSPDigitalFilterFIRStructure'))
        schema.EnumType('DSPDigitalFilterFIRStructure', {'Direct form','Direct form symmetric','Direct form antisymmetric','Direct form transposed','Lattice MA'});
        % 63 68
        % 64 68
        % 65 68
        % 66 68
        % 67 68
    end % if
    % 69 70
    if isempty(findtype('DSPDigitalFilterCoeffSource'))
        schema.EnumType('DSPDigitalFilterCoeffSource', {'Specify via dialog','Input port(s)'});
        % 72 74
        % 73 74
    end % if
    % 75 76
    if isempty(findtype('DSPDigitalFilterCoeffUpdateRate'))
        schema.EnumType('DSPDigitalFilterCoeffUpdateRate', {'One filter per frame','One filter per sample'});
        % 78 80
        % 79 80
    end % if
    % 81 83
    % 82 83
    schema.prop(this, 'FilterSource', 'int');
    schema.prop(this, 'dfiltObjectName', 'string');
    schema.prop(this, 'DialogModeTransferFunction', 'DSPDigitalFilterTransferFunction');
    schema.prop(this, 'PortsModeTransferFunction', 'DSPDigitalFilterTransferFunction');
    schema.prop(this, 'DialogModeIIRStructure', 'DSPDigitalFilterDialogModeIIRStructure');
    schema.prop(this, 'DialogModeIIRAllPoleStructure', 'DSPDigitalFilterIIRAllPoleStructure');
    schema.prop(this, 'DialogModeFIRStructure', 'DSPDigitalFilterFIRStructure');
    schema.prop(this, 'PortsModeIIRStructure', 'DSPDigitalFilterPortsModeIIRStructure');
    schema.prop(this, 'PortsModeIIRAllPoleStructure', 'DSPDigitalFilterIIRAllPoleStructure');
    schema.prop(this, 'PortsModeFIRStructure', 'DSPDigitalFilterFIRStructure');
    schema.prop(this, 'CoeffSource', 'DSPDigitalFilterCoeffSource');
    schema.prop(this, 'NumCoeffs', 'string');
    schema.prop(this, 'DenCoeffs', 'string');
    schema.prop(this, 'RefCoeffs', 'string');
    schema.prop(this, 'SOSCoeffs', 'string');
    schema.prop(this, 'ScaleValues', 'string');
    schema.prop(this, 'IgnoreA0Coeff', 'bool');
    schema.prop(this, 'CoeffUpdateRate', 'DSPDigitalFilterCoeffUpdateRate');
    schema.prop(this, 'ICs', 'string');
    schema.prop(this, 'ZeroSideICs', 'string');
    schema.prop(this, 'PoleSideICs', 'string');
end % function
