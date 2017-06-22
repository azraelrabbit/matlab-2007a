function schema = getSlMenuCustomization(callbackInfo)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    persistent menuItems;
    persistent haveItems;
    persistent menuLabel;
    % 13 15
    if isempty(haveItems)
        % 15 18
        % 16 18
        haveItems = false;
        methodName = mfilename;
        % 19 21
        clientNames = SSC.SimscapeCC.getClientClasses;
        for j=1.0:length(clientNames)
            % 22 24
            eval(horzcat(' thisClient = ', clientNames{j}, ';'));
            if any(strcmp(methods(thisClient), methodName))
                % 25 28
                % 26 28
                menuItems{plus(end, 1.0)} = eval(horzcat('@', clientNames{j}, '.', methodName));
                haveItems = true;
                % 29 31
            end
            % 31 33
        end % for
        % 33 35
        configData = SimscapeCC_config;
        % 35 37
        menuLabel = pm_message(configData.SlMenu.Name_msgid);
        % 37 39
    end
    % 39 42
    % 40 42
    if haveItems
        % 42 44
        schema = sl_container_schema;
        schema.childrenFcns = menuItems;
    else
        % 46 50
        % 47 50
        % 48 50
        schema = sl_action_schema;
        schema.callback = @noOpCallback;
        % 51 53
    end
    % 53 55
    schema.label = menuLabel;
    schema.tag = 'SSC';
end
function noOpCallback(callbackInfo)
    % 58 62
    % 59 62
    % 60 62
end
