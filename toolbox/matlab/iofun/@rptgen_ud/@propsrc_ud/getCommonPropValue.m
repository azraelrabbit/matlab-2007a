function [pValue, propName] = getCommonPropValue(psUD, objList, propName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch lower(propName)
    case {'package'}
        d = get(rptgen.appdata_rg, 'CurrentDocument');
        pValue = rptgen.safeGet(objList(:, 1.0), propName);
        psUDSpecific = psUD.getPropSourceObject(propName);
        for i=1.0:length(pValue)
            if ishandle(pValue{i})
                pValue{i} = psUDSpecific.makeLinkScalar(pValue{i}, psUDSpecific.getObjectType, 'link', d);
            else
                % 15 18
                % 16 18
                % 17 19
                pValue{i} = 'N/A';
            end % if
        end % for
    case {'methods','properties'}
        d = get(rptgen.appdata_rg, 'CurrentDocument');
        pValue = rptgen.safeGet(objList(:, 1.0), propName);
        psUDSpecific = psUD.getPropSourceObject(propName);
        for i=1.0:length(pValue)
            pValue{i} = psUD.appendContext(pValue{i}, objList(i));
            pValue{i} = psUDSpecific.makeLink(pValue{i}, psUDSpecific.getObjectType, 'link', d);
            % 28 32
            % 29 32
            % 30 32
        end % for
    otherwise
        dotLoc = findstr(propName, '.');
        if isempty(dotLoc)
            pValue = rptgen.safeGet(objList(:, 1.0), propName);
        else
            firstProp = propName(1.0:minus(dotLoc(1.0), 1.0));
            pValue = rptgen.safeGet(objList(:, 1.0), firstProp);
            for i=1.0:length(pValue)
                eval(horzcat('pValue{i} = pValue{i}', propName(dotLoc(1.0):end), ';'), 'pValue{i}=''N/A'';');
                % 41 43
            end % for
        end % if
    end % switch
