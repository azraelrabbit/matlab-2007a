function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('adaptfilt');
    % 9 11
    % 10 11
    c = schema.class(pk, 'adjfxlms', findclass(pk, 'lms'));
    c.Description = 'abstract';
    % 13 15
    % 14 15
    deffilter = fir1(10.0, .5);
    % 16 17
    p = schema.prop(c, 'SecondaryPathCoeffs', 'double_vector');
    p.FactoryValue = deffilter;
    p.SetFunction = @set_pathcoeffs;
    % 20 22
    % 21 22
    p = schema.prop(c, 'pathord', 'int32');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 25 27
    % 26 27
    p = schema.prop(c, 'SecondaryPathEstimate', 'double_vector');
    p.FactoryValue = deffilter;
    p.SetFunction = @set_pathest;
    % 30 32
    % 31 32
    p = schema.prop(c, 'pathestord', 'int32');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 35 37
    % 36 37
    p = schema.prop(c, 'SecondaryPathStates', 'double_vector');
    p.SetFunction = @set_outstates;
    p.Description = 'capture';
    % 40 43
    % 41 43
    % 42 43
    p = schema.prop(c, 'hiddenStates', 'double_vector');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.SetFunction = @set_hiddenstates;
end % function
