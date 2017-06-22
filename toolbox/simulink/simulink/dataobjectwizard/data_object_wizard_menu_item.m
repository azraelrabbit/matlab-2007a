function s = data_object_wizard_menu_item(callbackInfo)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    s = DAStudio.ActionSchema;
    % 9 10
    s.label = xlate('Data Object Wi&zard');
    s.statustip = xlate('Open Data Object Wizard');
    s.callback = @dataobjectwizard_wrapper;
end % function
function dataobjectwizard_wrapper(callbackInfo)
    % 15 17
    % 16 17
    dataobjectwizard(bdroot);
end % function
