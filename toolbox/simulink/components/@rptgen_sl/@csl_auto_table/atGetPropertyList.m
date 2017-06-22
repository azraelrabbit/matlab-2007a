function propList = atGetPropertyList(this, propsrc, obj, objType)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if strcmp(this.PropertyListMode, 'manual')
        propList = this.PropertyList;
    else
        switch lower(objType)
        case 'model'
            propList = {'Description'};
        case 'signal'
            propList = {'Description'};
        case 'system'
            propList = {'Description'};
        case 'annotation'
            propList = {'Text'};
        case 'configset'
            propList = {'Name'};
        otherwise
            % 22 23
            propList = rptgen_sl.getBlockParams(obj);
        end % switch
    end % if
end % function
