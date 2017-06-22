function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigdatatypes');
    % 9 11
    % 10 11
    c = schema.class(pk, 'notificationeventdata', pk.findclass('sigeventdata'));
    % 12 13
    if isempty(findtype('sigdatatypesNotificationType'))
        schema.EnumType('sigdatatypesNotificationType', {'ErrorOccurred','WarningOccurred','StatusChanged','FileDirty'});
        % 15 16
    end % if
    % 17 19
    % 18 19
    schema.prop(c, 'NotificationType', 'sigdatatypesNotificationType');
end % function
