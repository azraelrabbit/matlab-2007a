function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dspdata');
    c = schema.class(pk, 'powermetadata');
    % 10 12
    % 11 12
    schema.prop(c, 'DataUnits', 'string');
    % 13 14
    p = schema.prop(c, 'FrequencyUnits', 'string');
    set(p, 'setFunction', @setfrequencyunits);
    p.FactoryValue = 'Hz';
    % 17 18
    findclass(findpackage('spectrum'), 'abstractspectrum');
    p = schema.prop(c, 'SourceSpectrum', 'spectrum.abstractspectrum');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
function frequnits = setfrequencyunits(this, frequnits)
    % 23 25
    % 24 25
    if isempty(frequnits)
        frequnits = this.Metadata.FrequencyUnits;
        error(generatemsgid('invalidFrequencyUnits'), 'Frequency units cannot be empty.');
    end % if
end % function
