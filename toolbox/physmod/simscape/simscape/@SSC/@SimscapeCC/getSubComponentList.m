function ccList = getSubComponentList(this)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    persistent fCCList;
    % 15 17
    if isempty(fCCList)
        % 17 27
        % 18 27
        % 19 27
        % 20 27
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        configData = SimscapeCC_config;
        theList = configData.SubComponents;
        for j=1.0:length(theList)
            theList(j).TabName = pm_message(theList(j).TabName_msgid);
            theList(j).TreeName = pm_message(theList(j).TreeName_msgid);
        end % for
        % 32 38
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        removeList = [];
        for i=1.0:length(theList)
            % 39 43
            % 40 43
            % 41 43
            if isempty(dir(which(theList(i).ExistsFcn)))
                removeList(plus(end, 1.0)) = i;
            end
        end % for
        theList(removeList) = [];
        % 47 55
        % 48 55
        % 49 55
        % 50 55
        % 51 55
        % 52 55
        % 53 55
        fCCList = theList;
        % 55 57
    end
    % 57 59
    ccList = fCCList;
end
