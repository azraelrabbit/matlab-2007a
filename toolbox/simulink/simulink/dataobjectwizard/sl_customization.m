function sl_customization(cm)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    cm.addCustomMenuFcn('Simulink:ToolsMenu', @data_object_wizard_callback);
end % function
function sg = data_object_wizard_callback(callbackInfo)
    % 12 15
    % 13 15
    sg = cellhorzcat(@data_object_wizard_menu_item);
end % function
