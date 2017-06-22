function getMaskParams(this, bfp)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if any(strcmp(fieldnames(get_param(bfp, 'objectparameters')), 'roundingMode'))
        % 9 10
        error(hdlcodererrormsgid('unsupportedblock'), 'Obsolete DSP Gain block: Not supported in Beta2 SLHDLCoder');
        % 11 13
        % 12 13
    end % if
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    this.Saturation = strcmp(get_param(bfp, 'DoSatur'), 'on');
    % 19 21
    % 20 21
    this.Rounding = get_param(bfp, 'RndMeth');
    % 22 23
    rto = get_param(bfp, 'RuntimeObject');
    gainloc = 0.0;
    for n=1.0:rto.NumRuntimePrms
        if strcmp(rto.RuntimePrm(n).Name, 'Gain')
            gainloc = n;
        end % if
    end % for
    if eq(gainloc, 0.0)
        error(hdlcodererrormsgid('gainparameternotfound'), 'hdlgainblock was unable to get the Gain parameter value.');
        % 32 33
    end % if
    % 34 35
    cval = rto.RuntimePrm(gainloc).Data;
    % 36 37
    if isempty(cval)
        error(hdlcodererrormsgid('gainparameterempty'), 'hdlgainblock was unable to get the Gain parameter value.');
        % 39 40
    end % if
    % 41 43
    % 42 43
    this.ConstantValue = double(cval);
    % 44 45
    this.SLDataType = rto.RuntimePrm(gainloc).Datatype;
    % 46 47
    constvector = rto.RuntimePrm(gainloc).Dimensions;
    % 48 49
    if all(eq(constvector, [1.0 1.0]))
        constvector = 0.0;
    end % if
    % 52 53
    this.SLDimensions = constvector;
    % 54 55
    constcomplex = rto.RuntimePrm(gainloc).Complexity;
    % 56 58
    % 57 58
    if strcmpi(constcomplex, 'real')
        this.Complex = 0.0;
    else
        this.Complex = 1.0;
    end % if
end % function
