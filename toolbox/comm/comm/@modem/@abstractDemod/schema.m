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
    c = schema.class(pk, 'abstractDemod', findclass(pk, 'baseclass'));
    c.Description = 'abstract';
    % 14 18
    % 15 18
    % 16 18
    if isempty(findtype('OutType'))
        schema.EnumType('OutType', {'Bit','Integer'});
        % 19 21
    end % if
    % 21 23
    if isempty(findtype('DecType'))
        schema.EnumType('DecType', {'Hard decision','LLR','Approximate LLR'});
        % 24 27
        % 25 27
    end % if
    % 27 48
    % 28 48
    % 29 48
    % 30 48
    % 31 48
    % 32 48
    % 33 48
    % 34 48
    % 35 48
    % 36 48
    % 37 48
    % 38 48
    % 39 48
    % 40 48
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    p = schema.prop(c, 'PrivOutputType', 'OutType');
    p.FactoryValue = 'Integer';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    p = schema.prop(c, 'PrivDecisionType', 'DecType');
    p.FactoryValue = 'Hard decision';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    p = schema.prop(c, 'OutputType', 'OutType');
    p.FactoryValue = 'Integer';
    p.SetFunction = @setOutputType;
    p.GetFunction = @getOutputType;
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    p = schema.prop(c, 'DecisionType', 'DecType');
    p.FactoryValue = 'Hard decision';
    p.SetFunction = @setDecisionType;
    p.GetFunction = @getDecisionType;
    % 75 81
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    p = schema.prop(c, 'NoiseVariance', 'double');
    p.FactoryValue = 1.0;
    p.SetFunction = @setNoiseVar;
    % 83 94
    % 84 94
    % 85 94
    % 86 94
    % 87 94
    % 88 94
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    p = schema.prop(c, 'PrivS0', 'double_vector');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 97 103
    % 98 103
    % 99 103
    % 100 103
    % 101 103
    p = schema.prop(c, 'PrivS1', 'double_vector');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 106 119
    % 107 119
    % 108 119
    % 109 119
    % 110 119
    % 111 119
    % 112 119
    % 113 119
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    p = schema.prop(c, 'PrivMinIdx0', 'double_vector');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 122 129
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    p = schema.prop(c, 'PrivMinIdx1', 'double_vector');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
function outputType = setOutputType(h, outputType)
    % 134 140
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    if ismember(lower(getPrivProp(h, 'PrivDecisionType')), {'llr','approximate llr'}) && strcmpi(outputType, 'integer')
        error(horzcat(getErrorId(h), ':InvalidOutputTypeAndDecisionType'), '''Integer'' OutputType is not allowed when DecisionType is %s.\nPlease set DecisionType to ''Hard decision'' before changing OutputType.', h.DecisionType);
        % 141 145
        % 142 145
        % 143 145
    end % if
    % 145 148
    % 146 148
    setPrivProp(h, 'PrivOutputType', outputType);
    % 148 151
    % 149 151
    setProcessFunction(h, h.M);
end % function
function outputType = getOutputType(h, outputType)
    % 153 156
    % 154 156
    outputType = getPrivProp(h, 'PrivOutputType');
end % function
function decisionType = setDecisionType(h, decisionType)
    % 158 162
    % 159 162
    % 160 162
    if ismember(lower(decisionType), {'llr','approximate llr'}) && strcmpi(getPrivProp(h, 'PrivOutputType'), 'integer')
        error(horzcat(getErrorId(h), ':InvalidDecisionTypeAndOutputType'), '''%s'' DecisionType is not allowed when OutputType is ''Integer''.\nPlease set OutputType to ''Bit'' before changing DecisionType.', decisionType);
        % 163 167
        % 164 167
        % 165 167
    end % if
    % 167 170
    % 168 170
    setPrivProp(h, 'PrivDecisionType', decisionType);
    % 170 172
    setProcessFunction(h, h.M);
    % 172 175
    % 173 175
    initSoftDemod(h, h.M, h.SymbolMapping);
end % function
function decisionType = getDecisionType(h, decisionType)
    % 177 180
    % 178 180
    decisionType = getPrivProp(h, 'PrivDecisionType');
end % function
function noiseVar = setNoiseVar(h, noiseVar)
    % 182 186
    % 183 186
    % 184 186
    if not(isnumeric(noiseVar)) || not(isscalar(noiseVar)) || le(noiseVar, 0.0) || isnan(noiseVar) || isinf(noiseVar)
        % 186 188
        error(horzcat(getErrorId(h), ':InvalidNoiseVariance'), 'NoiseVariance must be a positive finite scalar number.');
        % 188 190
    end % if
end % function
