function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dspopts');
    c = schema.class(pk, 'abstractspectrumwfreqpoints', pk.findclass('abstractspectrum'));
    % 9 10
    set(c, 'Description', 'abstract');
    % 11 12
    if isempty(findtype('psdFreqPointsType'))
        schema.EnumType('psdFreqPointsType', {'All','User Defined'});
    end % if
    % 15 16
    p = schema.prop(c, 'FreqPoints', 'psdFreqPointsType');
    p.FactoryValue = 'All';
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_freqpoints;
end % function
