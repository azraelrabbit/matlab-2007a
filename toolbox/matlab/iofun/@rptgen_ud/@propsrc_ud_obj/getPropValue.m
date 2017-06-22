function [pValue, propName] = getPropValue(ps, objList, propName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if strncmp(propName, '(', 1.0)
        if strcmpi(propName, '(name)')
            propName = xlate('Name');
            for i=1.0:length(objList)
                pValue{i} = ps.getObjectName(objList(i), 'Object');
            end % for
        else
            psClass = rptgen_ud.propsrc_ud_class;
            if strcmpi(propName, '(class)')
                d = get(rptgen.appdata_rg, 'CurrentDocument');
                for i=length(objList):-1.0:1.0
                    pValue{i} = psClass.makeLink(classhandle(objList(i)), '', 'link', d);
                end % for
                propName = 'Class';
            else
                for i=1.0:length(objList)
                    objList(i) = classhandle(objList(i));
                end % for
                propName = propName(2.0:minus(end, 1.0));
                [pValue, propName] = getPropValue(psClass, objList, propName);
            end % if
        end % if
    else
        [pValue, propName] = getCommonPropValue(ps, objList, propName);
    end % if
end % function
