function oName = getObjectName(ps, obj, oType)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if isempty(obj)
        oName = '[]';
        return
    end
    % 12 14
    if ischar(obj) || isa(obj, 'Simulink.SubSystem')
        % 14 17
        % 15 17
        if lt(nargin, 3.0)
            oType = '';
        end
        oName = getObjectName(ps, rptgen_sf.block2chart(obj), oType);
    else
        if isempty(findprop(obj, 'Name'))
            if isa(obj, 'Stateflow.Transition')
                oName = get(obj, 'LabelString');
                if strcmp(oName, '?') || isempty(oName)
                    % 25 27
                    if sf('get', get(obj, 'ID'), '.isDefault')
                        oType = 'DefaultTransition';
                    else
                        oType = 'Transition';
                    end
                    oName = getDefaultName(obj, oType);
                else
                    oName = getFirstLine(oName);
                end
            else
                if isa(obj, 'Stateflow.Note') || isa(obj, 'Stateflow.Annotation')
                    oName = get(obj, 'Text');
                    if strcmp(oName, '?') || isempty(oName)
                        oName = getDefaultName(obj, 'Annotation');
                    else
                        oName = getFirstLine(oName);
                    end
                else
                    if lt(nargin, 3.0)
                        oType = getObjectType(ps, obj);
                    end
                    oName = getDefaultName(obj, oType);
                end
            end
        else
            oName = strrep(get(obj, 'Name'), char(10.0), ' ');
        end
    end
end
function oName = getDefaultName(obj, oType)
    if isempty(findprop(obj, 'ID'))
        oName = oType;
    else
        oName = sprintf('%s%i', oType, get(obj, 'ID'));
    end
end
function oName = getFirstLine(oName)
    % 63 66
    % 64 66
    crIdx = find(eq(oName, char(10.0)));
    if not(isempty(crIdx))
        if eq(crIdx(1.0), length(oName))
            oName = oName(1.0:minus(crIdx(1.0), 1.0));
        else
            oName = horzcat(oName(1.0:minus(crIdx(1.0), 1.0)), '...');
        end
    end
    oName = rptgen.truncateString(oName, '', 32.0);
end
