function [theMode, isLibrary] = getModelEditingMode(hh)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    this = SSC.RunTimeModule.getInstance;
    % 11 13
    if isempty(this)
        pm_error(Error.RtmNotInitialized_msgid);
    end % if
    % 15 18
    % 16 18
    accessFn = ssc_private('ssc_get_configset');
    propOwningObj = accessFn(hh.Handle);
    % 19 21
    if isempty(propOwningObj)
        % 21 23
        isLibrary = true;
        theMode = EDITMODE_AUTHORING;
    else
        % 25 28
        % 26 28
        isLibrary = false;
        theMode = this.getCcEditingMode(propOwningObj);
        % 29 31
    end % if
