function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dspfwiztargets');
    % 8 10
    % 9 10
    c = schema.class(pk, 'realizemdltarget', pk.findclass('abstracttarget'));
    c.Description = 'Abstract';
    % 12 13
    schema.prop(c, 'OptimizeZeros', 'on/off');
    schema.prop(c, 'OptimizeOnes', 'on/off');
    schema.prop(c, 'OptimizeNegOnes', 'on/off');
    schema.prop(c, 'OptimizeDelayChains', 'on/off');
    % 17 18
    p = schema.prop(c, 'gains', 'mxArray');
    p.Visible = 'off';
    % 20 21
    p = schema.prop(c, 'delays', 'mxArray');
    p.Visible = 'off';
end % function
