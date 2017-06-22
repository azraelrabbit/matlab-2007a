function [validStructures, defaultStructure] = getValidStructures(this, flag)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hd = get(this, 'FDesign');
    set(hd, 'Specification', getSpecification(this));
    % 10 12
    % 11 12
    switch lower(this.FilterType)
    case 'decimator'
        hd = fdesign.decimator(evaluatevars(this.Factor), hd);
    case 'interpolator'
        hd = fdesign.interpolator(evaluatevars(this.Factor), hd);
    case 'sample-rate converter'
        hd = fdesign.rsrc(evaluatevars(this.Factor), evaluatevars(this.SecondFactor), hd);
        % 19 21
        % 20 21
    end % switch
    % 22 23
    dopts = designoptions(hd, getSimpleMethod(this));
    % 24 25
    validStructures = dopts.FilterStructure;
    defaultStructure = dopts.DefaultFilterStructure;
    % 27 29
    % 28 29
    if strcmpi(this.OperatingMode, 'Simulink')
        validStructures = setdiff(validStructures, {'fftfir','fftfirinterp'});
    end % if
    % 32 33
    if gt(nargin, 1.0) && strcmpi(flag, 'full')
        for indx=1.0:length(validStructures)
            validStructures{indx} = convertStructure(this, validStructures{indx});
        end % for
        defaultStructure = convertStructure(this, defaultStructure);
    end % if
end % function
