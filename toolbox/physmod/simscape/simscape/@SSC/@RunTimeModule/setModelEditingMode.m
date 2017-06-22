function success = setModelEditingMode(this, hModel, requestedMode)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    accessFn = ssc_private('ssc_get_configset');
    propOwningObj = accessFn(hModel.Handle);
    % 12 13
    this.setCcEditingMode(propOwningObj, requestedMode);
    % 14 15
    success = true;
end % function
