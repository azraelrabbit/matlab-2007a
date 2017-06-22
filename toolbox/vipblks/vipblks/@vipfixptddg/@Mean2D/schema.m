function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspfixptddg');
    vipPackage = findpackage('vipfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    this = schema.class(vipPackage, 'Mean2D', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    schema.prop(this, 'run', 'bool');
    schema.prop(this, 'reset_popup', 'DSPResetPortEnum');
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    if isempty(findtype('vipMeanRoiType'))
        schema.EnumType('vipMeanRoiType', {'Rectangles','Lines','Label matrix','Binary mask'});
        % 32 33
    end % if
    if isempty(findtype('vipMeanRoiPortion'))
        schema.EnumType('vipMeanRoiPortion', {'Entire ROI','ROI perimeter'});
    end % if
    if isempty(findtype('vipMeanRoiOutput'))
        schema.EnumType('vipMeanRoiOutput', {'Individual statistics for each ROI','Single statistic for all ROIs'});
        % 39 40
    end % if
    % 41 42
    schema.prop(this, 'roiEnable', 'bool');
    schema.prop(this, 'roiType', 'vipMeanRoiType');
    schema.prop(this, 'roiPortion', 'vipMeanRoiPortion');
    schema.prop(this, 'roiOutput', 'vipMeanRoiOutput');
    schema.prop(this, 'roiFlag', 'bool');
end % function
