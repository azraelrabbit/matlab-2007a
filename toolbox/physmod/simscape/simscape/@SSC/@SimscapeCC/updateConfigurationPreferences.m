function updateConfigurationPreferences(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    slRoot = Simulink.Root;
    slRootAcs = slRoot.getActiveConfigSet;
    slRootCC = slRootAcs.getComponent(SSC.SimscapeCC.getComponentName);
    if isempty(slRootCC)
        slRootAcs.attachComponent(this.makeCleanCopy);
    end % if
