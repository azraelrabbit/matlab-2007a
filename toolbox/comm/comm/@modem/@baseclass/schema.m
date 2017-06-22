function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    pk = findpackage('modem');
    % 10 13
    % 11 13
    c = schema.class(pk, 'baseclass');
    c.Description = 'abstract';
    % 14 18
    % 15 18
    % 16 18
    if isempty(findtype('SymOrderType'))
        schema.EnumType('SymOrderType', {'Binary','Gray','User-defined'});
        % 19 22
        % 20 22
    end % if
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    p = schema.prop(c, 'Type', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 30 34
    % 31 34
    % 32 34
    p = schema.prop(c, 'Constellation', 'double_vector');
    p.FactoryValue = [1.0 -1.0];
    p.AccessFlags.PublicSet = 'off';
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    p = schema.prop(c, 'PrivSymOrder', 'SymOrderType');
    p.FactoryValue = 'Binary';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    p = schema.prop(c, 'PrivSymMapping', 'double_vector');
    p.FactoryValue = [0.0 1.0];
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    p.SetFunction = @setPrivSymMapping;
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    p = schema.prop(c, 'SymbolOrder', 'SymOrderType');
    p.FactoryValue = 'Binary';
    p.SetFunction = @setSymbolOrder;
    p.GetFunction = @getSymbolOrder;
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    p = schema.prop(c, 'SymbolMapping', 'double_vector');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @setSymbolMapping;
    p.GetFunction = @getSymbolMapping;
    % 71 75
    % 72 75
    % 73 75
    p = schema.prop(c, 'M', 'posint');
    p.FactoryValue = 2.0;
    p.setFunction = @setM;
    % 77 81
    % 78 81
    % 79 81
    p = schema.prop(c, 'PhaseOffset', 'double');
    p.FactoryValue = 0.0;
    p.SetFunction = @setPhaseOffset;
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    p = schema.prop(c, 'ProcessFunction', 'MATLAB callback');
    p.FactoryValue = @disp;
    % 89 91
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    p = schema.prop(c, 'PrivMapping', 'double_vector');
    p.FactoryValue = [1.0 2.0];
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
function phOffset = setPhaseOffset(h, phOffset)
    % 102 109
    % 103 109
    % 104 109
    % 105 109
    % 106 109
    % 107 109
    if isinf(phOffset) || isnan(phOffset)
        error(horzcat(getErrorId(h), ':InvalidPhaseOffset'), 'PhaseOffset must be a finite scalar number.');
        % 110 112
    end % if
    % 112 115
    % 113 115
    calcAndSetConstellation(h, h.M, phOffset);
end % function
function symbolOrder = setSymbolOrder(h, symbolOrder)
    % 117 121
    % 118 121
    % 119 121
    setPrivProp(h, 'PrivSymOrder', symbolOrder);
    % 121 124
    % 122 124
    calcAndSetSymbolMapping(h, h.M);
    setProcessFunction(h, h.M);
end % function
function symbolOrder = getSymbolOrder(h, symbolOrder)
    % 127 130
    % 128 130
    symbolOrder = getPrivProp(h, 'PrivSymOrder');
end % function
function symbolMapping = setSymbolMapping(h, symbolMapping)
    % 132 136
    % 133 136
    % 134 136
    if ismember(lower(h.SymbolOrder), {'binary','gray'})
        error(horzcat(getErrorId(h), ':WriteOnlySymbolMapping'), 'Changing SymbolMapping is not allowed when SymbolOrder is ''Binary'' or ''Gray''.\nPlease set SymbolOrder to ''User-defined''.');
    else
        % 138 140
        % 139 144
        % 140 144
        % 141 144
        % 142 144
        if ne(length(symbolMapping), h.M) || ne(length(unique(symbolMapping)), h.M) || any(ne(floor(symbolMapping), symbolMapping)) || lt(min(symbolMapping), 0.0) || gt(max(symbolMapping), minus(h.M, 1.0))
            % 144 147
            % 145 147
            error(horzcat(getErrorId(h), ':InvalidSymbolMapping'), 'SymbolMapping must be a unique vector of length M with integer valued elements in range [0:M-1].');
            % 147 150
            % 148 150
        end % if
        % 150 153
        % 151 153
        setPrivProp(h, 'PrivSymMapping', symbolMapping);
        % 153 155
    end % if
end % function
function symbolMapping = getSymbolMapping(h, symbolMapping)
    % 157 160
    % 158 160
    symbolMapping = getPrivProp(h, 'PrivSymMapping');
end % function
