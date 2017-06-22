function id = getObjectID(ps, object, objType)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if isempty(object)
        id = '';
    else
        if ischar(object) || isa(object, 'Simulink.SubSystem')
            % 13 15
            if lt(nargin, 3.0)
                objType = '';
            end % if
            id = getObjectID(ps, rptgen_sf.block2chart(object), objType);
        else
            if isa(object, 'Stateflow.Root')
                id = 'sf-root';
            else
                if isa(object, 'Simulink.Root')
                    id = 'sl-root';
                else
                    if isa(object, 'Stateflow.Clipboard')
                        id = 'sf-clipboard';
                    else
                        if lt(nargin, 3.0) || isempty(objType)
                            objType = getObjectType(ps, object);
                        end % if
                        objType = strrep(objType, ' ', '-');
                        id = sprintf('sf-%s-%i', lower(objType), get(object, 'id'));
                    end % if
                end % if
            end % if
        end % if
    end % if
    if not(get(rptgen.appdata_rg, 'DebugMode'))
        id = rptgen.hash(id);
    end % if
end % function
