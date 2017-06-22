function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfdata');
    parent = findclass(package, 'rfdata');
    % 8 11
    % 9 11
    h = schema.class(package, 'data', parent);
    % 11 14
    % 12 14
    if isempty(findtype('InterpolationMethodDATATYPE'))
        schema.EnumType('InterpolationMethodDATATYPE', {'Linear','Cubic','Spline'});
    end % if
    % 16 19
    % 17 19
    p = schema.prop(h, 'Freq', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    % 22 24
    p = schema.prop(h, 'S_Parameters', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'S Parameters';
    p.SetFunction = cellhorzcat(@setcomplexmatrix, 'rf', p, true);
    % 27 29
    p = schema.prop(h, 'NF', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Noise figure';
    p.SetFunction = cellhorzcat(@setnf, p);
    % 32 34
    p = schema.prop(h, 'OIP3', 'MATLAB array');
    p.FactoryValue = Inf;
    p.Description = 'OIP3';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, false, true, false);
    % 37 39
    p = schema.prop(h, 'Z0', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Reference impedance';
    p.SetFunction = cellhorzcat(@setcomplexvector, 'rf', p, false);
    % 42 44
    p = schema.prop(h, 'ZS', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Source impedance';
    p.SetFunction = cellhorzcat(@setcomplexvector, 'rf', p, false);
    % 47 49
    p = schema.prop(h, 'ZL', 'MATLAB array');
    p.Description = 'Load Impedance';
    p.FactoryValue = 50.0;
    p.SetFunction = cellhorzcat(@setcomplexvector, 'rf', p, false);
    % 52 54
    p = schema.prop(h, 'IntpType', 'InterpolationMethodDATATYPE');
    p.FactoryValue = 'Linear';
    p.Description = 'Interpolation type';
    % 56 58
    p = schema.prop(h, 'BudgetData', 'handle');
    p.FactoryValue = [];
    p.Description = 'Budget data';
    p.SetFunction = cellhorzcat(@setdata, p);
    p.Visible = 'off';
    % 62 64
    p = schema.prop(h, 'SpurPower', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Mixer spur power';
    p.Visible = 'off';
    % 67 69
    p = schema.prop(h, 'Reference', 'handle');
    p.AccessFlags.PublicSet = 'Off';
    p.FactoryValue = [];
    p.Description = 'The data from a text file';
    p.SetFunction = cellhorzcat(@setref, p);
    p.Visible = 'off';
    % 74 76
    p = schema.prop(h, 'FreqOffset', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Phase noise frequency offset';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    p.Visible = 'off';
    % 80 82
    p = schema.prop(h, 'PhaseNoiseLevel', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Phase noise level';
    p.SetFunction = cellhorzcat(@setnegativevector, 'rf', p, true, false, true);
    p.Visible = 'off';
    % 86 88
    p = schema.prop(h, 'NeedReset', 'bool');
    p.FactoryValue = false;
    p.Description = 'Plot flag';
    p.Visible = 'off';
end % function
function out = setdata(h, out, prop)
    % 93 95
    if isempty(out)
        return;
    end % if
    if not(isa(out, 'rfdata.data'))
        id = sprintf('rf:%s:schema:NotRFdataObj', strrep(class(h), '.', ':'));
        error(id, '%s of %s must be an RFDATA.DATA object.', prop.name, upper(class(h)));
    end % if
end % function
function out = setref(h, out, prop)
    if isempty(out)
        return;
    end % if
    if not(isa(out, 'rfdata.reference')) && not(isa(out, 'rfdata.multireference'))
        id = sprintf('rf:%s:schema:NotRFdataObj', strrep(class(h), '.', ':'));
        error(id, '%s of %s must be an RFDATA.REFERENCE or RFDATA.MULTIREFERENCE object.', prop.name, upper(class(h)));
    end % if
    if h.CopyPropertyObj
        out = copy(out);
    end % if
end % function
function out = setnf(h, out, prop)
    if isempty(out)
        id = sprintf('%s:%s:schema:EmptyNotAllowed', 'rf', strrep(class(h), '.', ':'));
        error(id, '%s of %s must not be empty.', prop.name, upper(class(h)));
    end % if
    out = real(out);
    [row, col] = size(squeeze(out));
    if not(isnumeric(out)) || ne(min(horzcat(row, col)), 1.0) || any(isnan(out))
        id = sprintf('%s:%s:schema:NotAPositiveVector', 'rf', strrep(class(h), '.', ':'));
        error(id, '%s of %s must be a positive vector.', prop.name, upper(class(h)));
    end % if
    if eq(row, 1.0)
        out = out(:);
    end % if
    index = find(lt(out, 0.0));
    % 129 136
    % 130 136
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    if not(isempty(index))
        out(index) = 0.0;
    end % if
    if any(lt(out, 0.0))
        id = sprintf('%s:%s:schema:NotAPositiveVector', 'rf', strrep(class(h), '.', ':'));
        % 140 142
        error(id, '%s of %s must be a positive vector.', prop.name, upper(class(h)));
    end % if
end % function
