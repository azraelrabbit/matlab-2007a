function argOut = compareComponentWithChild(this, other)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    clientProperties = this.getClientProperties(false);
    % 12 13
    ignoreClientProps = cellhorzcat(clientProperties(eq(horzcat(clientProperties.IgnoreCompare), true)).Name);
    % 14 16
    % 15 16
    IGNORE = cellhorzcat('Listener', 'instanceId', ignoreClientProps{:});
    IGNORE_LENGTH = length(IGNORE);
    % 18 19
    argOut = pm_superclassmethod(this, 'SSC.SimscapeCC', 'compareComponentWithChild', other);
    % 20 23
    % 21 23
    % 22 23
    whichAllowed = ones(horzcat(length(argOut), 1.0));
    for ignoreNum=1.0:IGNORE_LENGTH
        % 25 26
        whichIgnore = strcmp(argOut, IGNORE{ignoreNum});
        whichAllowed = and(whichAllowed, not(whichIgnore));
        % 28 29
    end % for
    % 30 31
    if any(whichAllowed)
        argOut = cellhorzcat(argOut{whichAllowed});
    else
        argOut = [];
    end % if
end % function
