function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('fdadesignpanel');
    % 8 10
    c = schema.class(pk, 'abstractmagframe', pk.findclass('abstractfiltertype'));
    c.Description = 'abstract';
    % 11 13
    if isempty(findtype('fdadesignpanelIRType'))
        schema.EnumType('fdadesignpanelIRType', {'IIR','FIR'});
    end % if
    % 15 17
    if isempty(findtype('fdadesignpanelMagUnits'))
        schema.EnumType('fdadesignpanelMagUnits', {'dB','Linear','Squared'});
    end % if
    % 19 21
    p = schema.prop(c, 'IRType', 'fdadesignpanelIRType');
    p.SetFunction = @setirtype;
    p.Description = 'spec';
    % 23 25
    p = schema.prop(c, 'magUnits', 'fdadesignpanelMagUnits');
    p.SetFunction = @setmagunits;
    p.FactoryValue = 'dB';
    p.Description = 'spec';
function out = setirtype(h, out)
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    set(h, 'magUnits', 'dB');
function out = setmagunits(h, out)
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    switch h.IRType
    case 'IIR'
        if isempty(find(strcmpi(out, {'db','squared'}), 1.0))
            error(generatemsgid('invalidMagUnits'), sprintf(horzcat(out, ' is not a valid magUnits for IIR')));
            % 44 46
        end % if
    case 'FIR'
        if isempty(find(strcmpi(out, {'db','linear'}), 1.0))
            error(generatemsgid('invalidMagUnits'), sprintf(horzcat(out, ' is not a valid magUnits for FIR')));
            % 49 51
        end % if
    end % switch
