function v1convert(h, v1info)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    h.PropertyName = v1info.Name;
    h.Description = v1info.String;
    % 8 10
    switch v1info.Type
    case 'LOGICAL'
        h.DataTypeString = 'bool';
        h.FactoryValueString = RptgenML.toStringExe(v1info.Default, v1info.Type);
    case 'ENUM'
        ev = {};
        en = {};
        for i=length(v1info.enumValues):-1.0:1.0
            ev{i} = strrep(rptgen.toString(v1info.enumValues{i}, 0.0), '''', '''''');
            en{i} = strrep(rptgen.toString(v1info.enumNames{i}, 0.0), '''', '''''');
        end % for
        % 20 22
        h.EnumValues = ev;
        h.EnumNames = en;
        % 23 25
        h.DataTypeString = '!ENUMERATION';
        h.FactoryValueString = horzcat('''', strrep(rptgen.toString(v1info.Default, 0.0), '''', ''''''), '''');
    case 'NUMBER'
        h.DataTypeString = 'double';
        h.FactoryValueString = RptgenML.toStringExe(v1info.Default, v1info.Type);
    case 'STRING'
        h.DataTypeString = 'string';
        h.FactoryValueString = RptgenML.toStringExe(v1info.Default, v1info.Type);
    case 'CELL'
        h.DataTypeString = 'string vector';
        h.FactoryValueString = RptgenML.toStringExe(v1info.Default, v1info.Type);
    otherwise
        warning('rptgen:NonConvertableV1Property', 'Could not convert v1.x property "%s"', v1info.Name);
        % 37 40
        % 38 40
        h.DataTypeString = 'MATLAB array';
        h.FactoryValueString = '[]';
    end % switch
