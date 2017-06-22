function schema
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    schema.package('SSC');
    % 7 8
    if isempty(findtype('SSC_CallbackType'))
        schema.EnumType('SSC_CallbackType', {'BLK_POSTLOAD','BLK_POSTCOPY','BLK_PRECOPY','BLK_POSTDELETE','BLK_PREDELETE','BLK_PRESAVE','BLK_POSTSAVE','BLK_PRECOMPILE','BLK_OPENDLG','DOM_INIT','CCC_ACTIVATE','CCC_DEACTIVATE','SLM_SELECTMODE'});
        % 10 28
        % 11 28
        % 12 28
        % 13 28
        % 14 28
        % 15 28
        % 16 28
        % 17 28
        % 18 28
        % 19 28
        % 20 28
        % 21 28
        % 22 28
        % 23 28
        % 24 28
        % 25 28
        % 26 28
        % 27 28
    end % if
end % function
