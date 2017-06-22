function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    parent = findclass(pk, 'abstractmultistage');
    c = schema.class(pk, 'abstractifir', parent);
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'UpsamplingFactor', 'mxArray');
    p.SetFunction = @set_uf;
    p.FactoryValue = 'auto';
    % 16 17
    p = schema.prop(c, 'JointOptimization', 'bool');
    p.FactoryValue = false;
end % function
function uf = set_uf(this, uf)
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    errmsg = 'The UpsamplingFactor must be either a positive integer or the string ''auto''.';
    if ischar(uf)
        if not(strcmpi(uf, 'auto'))
            error(errmsg);
        end % if
    else
        % 31 32
        if isnumeric(uf)
            if ne(uf, round(uf)) || le(uf, 0.0)
                error(errmsg);
            end % if
        else
            % 37 38
            error(errmsg);
        end % if
    end % if
end % function
