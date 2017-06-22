function sl_customization(cm)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    cm.addCustomMenuFcn('Simulink:ToolsMenu', @getMyItems);
end % function
function schemaFcns = getMyItems(callbackInfo)
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    schemaFcns = cellhorzcat(@myItem1);
end % function
function schema = myItem1(callbackInfo)
    % 19 21
    schema = DAStudio.ActionSchema;
    schema.label = '&SystemTest...';
    schema.callback = @launchSystemTest;
end % function
function launchSystemTest(callbackInfo)
    % 25 27
    systemtest;
end % function
