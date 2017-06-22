function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pk = findpackage('channel');
    % 9 11
    c = schema.class(pk, 'sigresponse', findclass(pk, 'baseclass'));
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    p = schema.prop(c, 'Domain', 'double_vector');
    p.FactoryValue = 0.0;
    p.SetFunction = @setVector;
    % 19 22
    % 20 22
    p = schema.prop(c, 'Values', 'double_vector');
    p.FactoryValue = 0.0;
    p.SetFunction = @setVector;
    p.GetFunction = @getValues;
end
function x = setVector(v, x)
    % 27 31
    % 28 31
    % 29 31
    S = size(x);
    if ne(length(S), 2.0) || ne(S(1.0), 1.0)
        error('comm:channel_sigresponse:rowvector', 'Value must be a row vector.');
    end
end
function x = getValues(v, x)
    Ld = length(v.Domain);
    Lx = length(x);
    if gt(Ld, Lx)
        x = horzcat(x, zeros(1.0, minus(Ld, Lx)));
    else
        if lt(Ld, Lx)
            x = x(1.0:Ld);
        end
    end
end
