function configData = SimscapeCC_config
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    persistent fConfigData;
    % 17 19
    if isempty(fConfigData)
        % 19 21
        msgStem = 'platform:SSC:SimscapeCC:';
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        msgPrfx = horzcat(msgStem, 'subcomponent:');
        % 27 30
        % 28 30
        theList(1.0) = struct('ProductName', SSC.SimscapeCC.getComponentName, 'TabName_msgid', horzcat(msgPrfx, 'general:tabname'), 'TreeName_msgid', horzcat(msgPrfx, 'general:treename'), 'CustomComponent', 'SSC.SimscapeCC', 'ExistsFcn', 'ssc_private');
        % 30 36
        % 31 36
        % 32 36
        % 33 36
        % 34 36
        theList(2.0) = struct('ProductName', 'SimMechanics', 'TabName_msgid', horzcat(msgPrfx, 'SimMechanics:tabname'), 'TreeName_msgid', horzcat(msgPrfx, 'SimMechanics:treename'), 'CustomComponent', 'MECH.SimMechanicsCC', 'ExistsFcn', 'mechlib');
        % 36 41
        % 37 41
        % 38 41
        % 39 41
        fConfigData.SubComponents = theList;
        % 41 43
        fConfigData.SlMenu.Name_msgid = horzcat(msgStem, 'menu:name');
        % 43 45
        fConfigData.internal.getDialogSchemaError = horzcat(msgStem, 'internal:getDialogSchema');
        % 45 47
    end
    % 47 49
    configData = fConfigData;
end
