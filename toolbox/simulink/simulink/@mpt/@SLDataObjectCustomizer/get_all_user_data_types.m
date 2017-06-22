function get_all_user_data_types(hcustom)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    userTypes = {};
    if not(isempty(hcustom)) && not(isempty(hcustom.UserDataTypes))
        try
            for i=1.0:length(hcustom.UserDataTypes)
                udt = hcustom.UserDataTypes{i};
                if iscell(udt)
                    % 13 14
                    userTypes{plus(end, 1.0)}.tmwName = udt{2.0};
                    userTypes{end}.userName = udt{1.0};
                    userTypes{end}.isAlias = false;
                    userTypes{end}.userTypeDepend = '';
                    userTypes{end}.type = 'Both';
                    if not(isempty(strfind(udt{2.0}, 'fixdt')))
                        if not(isempty(udt{3.0}))
                            userTypes{end}.isAlias = udt{3.0};
                        end % if
                    else
                        userTypes{end}.userTypeDepend = udt{3.0};
                    end % if
                else
                    % 27 30
                    % 28 30
                    % 29 30
                    builtin = {'double','single','int8','uint8','int16','uint16','int32','uint32','boolean'};
                    % 31 32
                    if isempty(strfind(udt, 'fixdt')) && not(ismember(udt, builtin))
                        userTypes{plus(end, 1.0)}.tmwName = '';
                        userTypes{end}.userName = udt;
                        userTypes{end}.isAlias = false;
                        userTypes{end}.userTypeDepend = '';
                        userTypes{end}.type = 'Both';
                    end % if
                end % if
            end % for
        catch
            warning('Simulink:mpt:Customization', lasterr);
        end % try
    end % if
    sldowprivate('cusattic', 'AtticData', 'userTypes', userTypes);
end % function
