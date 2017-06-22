function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    c = schema.class(pk, 'abstractnstages', pk.findclass('abstractmultistage'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'NStages', 'mxArray');
    p.SetFunction = @set_ns;
    p.FactoryValue = 'auto';
    % 16 17
    if isempty(findtype('HalfbandFilterDesignMethods'))
        schema.EnumType('HalfbandFilterDesignMethods', {'equiripple','kaiserwin','butter','ellip','iirlinphase'});
        % 19 20
    end % if
end % function
function ns = set_ns(this, ns)
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    errmsg = 'The number of stages must be either a positive integer or the string ''auto''.';
    if ischar(ns)
        if not(strcmpi(ns, 'auto'))
            error(errmsg);
        end % if
    else
        % 33 34
        if isnumeric(ns)
            if ne(ns, round(ns)) || le(ns, 0.0)
                error(errmsg);
            end % if
        else
            % 39 40
            error(errmsg);
        end % if
    end % if
end % function
