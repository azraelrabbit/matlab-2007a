function [pValue, propName] = getPropValue(ps, objList, propName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    switch lower(propName)
    case 'classes'
        % 9 12
        % 10 12
        % 11 12
        psUDClass = rptgen_ud.propsrc_ud_class;
        d = get(rptgen.appdata_rg, 'CurrentDocument');
        for i=length(objList):-1.0:1.0
            try
                pValue{i, 1.0} = findclass(objList(i));
                ok = true;
            catch
                pValue{i, 1.0} = 'N/A';
                ok = false;
            end % try
            % 22 23
            if ok
                % 24 25
                pValue{i, 1.0} = psUDClass.makeLink(pValue{i, 1.0}, psUDClass.getObjectType, 'link', d);
                % 26 29
                % 27 29
                % 28 29
            end % if
        end % for
    otherwise
        [pValue, propName] = getCommonPropValue(ps, objList(:, 1.0), propName);
    end % switch
end % function
