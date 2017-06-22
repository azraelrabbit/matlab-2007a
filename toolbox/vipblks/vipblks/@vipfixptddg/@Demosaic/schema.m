function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dspPackage = findpackage('dspfixptddg');
    vipPackage = findpackage('vipfixptddg');
    parent = findclass(dspPackage, 'DSPDDGBase');
    this = schema.class(vipPackage, 'Demosaic', parent);
    % 11 13
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 21
    % 19 21
    % 20 21
    if isempty(findtype('VIPDemosaicAlgorithm'))
        schema.EnumType('VIPDemosaicAlgorithm', {'Bilinear','Gradient-corrected linear','Obsolete'});
        % 23 26
        % 24 26
        % 25 26
    end % if
    % 27 29
    % 28 29
    if isempty(findtype('VIPDemosaicAlgorithmActive'))
        schema.EnumType('VIPDemosaicAlgorithmActive', {'Bilinear','Gradient-corrected linear'});
        % 31 33
        % 32 33
    end % if
    % 34 35
    if isempty(findtype('VIPDemosaicAlignment'))
        schema.EnumType('VIPDemosaicAlignment', {'RGGB','GRBG','GBRG','BGGR'});
    end % if
    % 38 40
    % 39 40
    if isempty(findtype('VIPDemosaicImagePortsEnum'))
        schema.EnumType('VIPDemosaicImagePortsEnum', {'One multidimensional signal','Separate color signals'});
        % 42 44
        % 43 44
    end % if
    % 45 57
    % 46 57
    % 47 57
    % 48 57
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    schema.prop(this, 'algorithm', 'VIPDemosaicAlgorithm');
    schema.prop(this, 'alignment', 'VIPDemosaicAlignment');
    schema.prop(this, 'imagePorts', 'VIPDemosaicImagePortsEnum');
    schema.prop(this, 'algorithmActive', 'VIPDemosaicAlgorithmActive');
end % function
