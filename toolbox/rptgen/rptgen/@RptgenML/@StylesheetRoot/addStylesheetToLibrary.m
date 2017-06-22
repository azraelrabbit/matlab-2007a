function addStylesheetToLibrary(this, ssNew)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    tType = ssNew.TransformType;
    if isempty(tType)
        tType = 'empty';
    end % if
    % 12 14
    % 13 14
    try
        typeCat = get(this, horzcat('Category', tType));
    catch
        warning('rptgen:UnknownTransformType', 'Transform type "%s" not recognized', tType);
        typeCat = this.CategoryEmpty;
    end % try
    % 20 21
    connect(ssNew, typeCat, 'up');
end % function
