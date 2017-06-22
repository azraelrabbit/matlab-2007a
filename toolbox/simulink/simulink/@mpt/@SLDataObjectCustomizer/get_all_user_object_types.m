function varargout = get_all_user_object_types(hcustom)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    objectTypes = {};
    if not(isempty(hcustom)) && not(isempty(hcustom.MPTObjectTypes))
        try
            for i=1.0:length(hcustom.MPTObjectTypes)
                try
                    obj = hcustom.MPTObjectTypes{i};
                    temp = [];
                    temp.name = obj.Name;
                    temp.type = getProperty(obj, 'ClassType');
                    % 17 18
                    prop = getProperty(obj, 'Property');
                    for j=1.0:length(prop)
                        temp = setfield(temp, lower(prop{j}{1.0}), prop{j}{2.0});
                    end % for
                    objectTypes{plus(end, 1.0)} = temp;
                catch
                    msg = sprintf('Invalid property for UserObjectType ''%s''.', obj.Name);
                    warning('Simulink:mpt:Customization', msg);
                end % try
            end % for
        catch
            warning('Simulink:mpt:Customization', lasterr);
        end % try
    end % if
    varargout{1.0} = objectTypes;
end % function
