function [pValue, propName] = getPropValue(psUD, objList, propName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    switch lower(propName)
    case 'superclasses'
        d = get(rptgen.appdata_rg, 'CurrentDocument');
        pValue = rptgen.safeGet(objList(:, 1.0), propName);
        for i=1.0:length(pValue)
            pValue{i} = psUD.makeLink(pValue{i}, psUD, 'link', d);
            % 13 16
            % 14 16
            % 15 16
        end % for
    case 'subclasses'
        adUD = rptgen_ud.appdata_ud;
        d = get(rptgen.appdata_rg, 'CurrentDocument');
        for i=length(objList):-1.0:1.0
            sc = adUD.getSubclasses(objList(i));
            if not(isempty(sc))
                pValue{i} = psUD.makeLink(sc, 'class', 'link', d, '', ', ');
            else
                pValue{i} = '';
            end % if
        end % for
    case 'javainterfaces'
        % 29 30
        pValue = psUD.getCommonPropValue(objList, propName);
        for i=1.0:length(pValue)
            pValue{i} = rptgen.makeSingleLineText(pValue{i}, ', ');
        end % for
    otherwise
        [pValue, propName] = getCommonPropValue(psUD, objList, propName);
    end % switch
end % function
