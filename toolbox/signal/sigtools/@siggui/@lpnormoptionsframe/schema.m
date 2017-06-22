function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'lpnormoptionsframe', pk.findclass('remezoptionsframe'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'PNormStart', 'string');
    p.Description = 'Initial value for least-Pth algorithm:';
    p.FactoryValue = '2';
    % 17 19
    % 18 19
    p = schema.prop(c, 'PNormEnd', 'string');
    p.FactoryValue = '128';
    % 21 22
    p = schema.prop(c, 'InitNum', 'string');
    p.Description = 'Initial estimate of the filter numerator:';
    p.FactoryValue = '[]';
end % function
