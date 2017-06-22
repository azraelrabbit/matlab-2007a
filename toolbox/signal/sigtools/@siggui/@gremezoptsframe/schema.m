function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    % 8 10
    c = schema.class(pk, 'gremezoptsframe', pk.findclass('remezoptionsframe'));
    % 10 12
    findclass(findpackage('filtdes'), 'gremez');
    schema.prop(c, 'Phase', 'gremezPhase');
    schema.prop(c, 'FIRType', 'gremezFIRType');
    % 14 16
    p = schema.prop(c, 'InitOrder', 'string');
    set(p, 'FactoryValue', '[]', 'Description', 'Initial Estimate of the Filter Order');
    % 17 19
    p = schema.prop(c, 'ErrorBands', 'string');
    set(p, 'Description', 'Independent Approximation Error Bands', 'FactoryValue', '[]');
    % 20 22
    p = schema.prop(c, 'SinglePointBands', 'string');
    set(p, 'Description', 'Single Point Bands', 'FactoryValue', '[]');
    % 23 25
    p = schema.prop(c, 'ForcedFreqPoints', 'string');
    set(p, 'Description', 'Forced Frequency Points', 'FactoryValue', '[]');
    % 26 28
    p = schema.prop(c, 'IndeterminateFreqPoints', 'string');
    set(p, 'Description', 'Indeterminate Frequency Points', 'FactoryValue', '[]');
    % 29 31
    p = schema.prop(c, 'DisabledProps', 'MATLAB array');
    set(p, 'FactoryValue', {}, 'SetFunction', @setdisabledprops);
end
function out = setdisabledprops(h, out)
    % 34 37
    % 35 37
    if ischar(out)
        out = cellhorzcat(out);
    else
        if not(iscellstr(out))
            error('DisabledProps must be a string or a string vector');
        end
    end
end
