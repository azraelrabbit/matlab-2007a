function [pValue, propName] = getPropValue(this, objList, propName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch propName
    case this.getCommonPropValue('PropList')
        % 8 12
        % 9 12
        % 10 12
        [pValue, propName] = getCommonPropValue(this, objList, propName);
    case this.getPropList('rtwsummary')
        pValue = LocRtwSummary(this, objList, propName);
    otherwise
        pValue = rptgen.safeGet(objList, propName, 'get_param');
    end % switch
function out = LocRtwSummary(psSL, mdl, prop)
    % 18 22
    % 19 22
    % 20 22
    adSL = rptgen_sl.appdata_sl;
    % 22 24
    if ischar(mdl)
        mdl = cellhorzcat(mdl);
    end % if
    % 26 28
    for i=length(mdl):-1.0:1.0
        fid = get_rtw_fid(adSL, mdl{i});
        if gt(fid, 0.0)
            out{i, 1.0} = locRtwParser(fid, prop);
            fclose(fid);
        else
            out{i, 1.0} = 'N/A';
        end % if
    end % for
function pVal = locRtwParser(fid, propName)
    % 37 41
    % 38 41
    % 39 41
    pVal = 'N/A';
    lenPropName = length(propName);
    while 1
        s = fgetl(fid);
        if not(ischar(s))
            break
        else
            s = trimString(s);
            if strncmpi(s, propName, lenPropName)
                pVal = trimString(s(plus(lenPropName, 1.0):end));
                break
            end % if
        end % if
    end % while
function s = trimString(s)
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    [r, c] = find(and(ne(s, 0.0), not(isspace(s))));
    if isempty(c)
        s = s([]);
    else
        s = s(:, min(c):max(c));
    end % if
