function componentName = getComponentName
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    persistent fComponentName;
    % 6 8
    if isempty(fComponentName)
        hName = ssc_private('ssc_productname');
        fComponentName = hName();
    end
    % 11 13
    componentName = fComponentName;
end
