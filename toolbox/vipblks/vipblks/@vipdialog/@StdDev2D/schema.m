function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    parentpackage = findpackage('dspdialog');
    parent = findclass(parentpackage, 'DSPDDG');
    vipPackage = findpackage('vipdialog');
    this = schema.class(vipPackage, 'StdDev2D', parent);
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
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    if isempty(findtype('DSPResetPortEnum'))
        schema.EnumType('DSPResetPortEnum', {'None','Rising edge','Falling edge','Either edge','Non-zero sample'});
        % 30 31
    end % if
    schema.prop(this, 'reset_popup', 'DSPResetPortEnum');
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    if isempty(findtype('vipMeanRoiType'))
        schema.EnumType('vipMeanRoiType', {'Rectangles','Lines','Label matrix','Binary mask'});
        % 40 41
    end % if
    if isempty(findtype('vipMeanRoiPortion'))
        schema.EnumType('vipMeanRoiPortion', {'Entire ROI','ROI perimeter'});
    end % if
    if isempty(findtype('vipMeanRoiOutput'))
        schema.EnumType('vipMeanRoiOutput', {'Individual statistics for each ROI','Single statistic for all ROIs'});
        % 47 48
    end % if
    % 49 50
    schema.prop(this, 'roiEnable', 'bool');
    schema.prop(this, 'roiType', 'vipMeanRoiType');
    schema.prop(this, 'roiPortion', 'vipMeanRoiPortion');
    schema.prop(this, 'roiOutput', 'vipMeanRoiOutput');
    schema.prop(this, 'roiFlag', 'bool');
end % function
