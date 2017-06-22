function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'ArbMagDesign', pk.findclass('AbstractDesign'));
    % 9 11
    definetypes(pk);
    % 11 13
    spcuddutils.addpostsetprop(c, 'SpecifyDenominator', 'bool', @set_specifydenominator);
    % 13 16
    % 14 16
    p = schema.prop(c, 'DenominatorOrder', 'string');
    set(p, 'FactoryValue', '20');
    % 17 20
    % 18 20
    spcuddutils.addpostsetprop(c, 'NumberOfBands', 'double', @set_numberofbands);
    spcuddutils.addpostsetprop(c, 'ResponseType', 'ArbMagDesignResponses', @set_responsetype);
    % 21 23
    schema.prop(c, 'Band1', 'FilterDesignDialog.ArbMagBand');
    schema.prop(c, 'Band2', 'FilterDesignDialog.ArbMagBand');
    schema.prop(c, 'Band3', 'FilterDesignDialog.ArbMagBand');
    schema.prop(c, 'Band4', 'FilterDesignDialog.ArbMagBand');
    schema.prop(c, 'Band5', 'FilterDesignDialog.ArbMagBand');
    schema.prop(c, 'Band6', 'FilterDesignDialog.ArbMagBand');
    schema.prop(c, 'Band7', 'FilterDesignDialog.ArbMagBand');
    schema.prop(c, 'Band8', 'FilterDesignDialog.ArbMagBand');
    schema.prop(c, 'Band9', 'FilterDesignDialog.ArbMagBand');
    schema.prop(c, 'Band10', 'FilterDesignDialog.ArbMagBand');
end
function set_specifydenominator(this, oldSpecifyDenominator)
    % 34 37
    % 35 37
    updateMethod(this);
end
function set_responsetype(this, oldResponseType)
    % 39 42
    % 40 42
    updateMethod(this);
end
function set_numberofbands(this, oldNBands)
    % 44 48
    % 45 48
    % 46 48
    for indx=plus(oldNBands, 1.0):this.NumberOfBands
        bandProp = sprintf('Band%d', plus(indx, 1.0));
        if isempty(this.(bandProp))
            this.(bandProp) = FilterDesignDialog.ArbMagBand;
        end
    end % for
    % 53 55
    updateMethod(this);
end
function definetypes(pk)
    % 57 60
    % 58 60
    findclass(pk, 'ArbMagBand');
    % 60 62
    if isempty(findtype('ArbMagDesignResponses'))
        schema.EnumType('ArbMagDesignResponses', {'Amplitudes','Magnitudes and phases','Frequency response'});
        % 63 65
    end
end
