function pHandles = createfixptprops(obj, props, extraArgs)
    % 1 56
    % 2 56
    % 3 56
    % 4 56
    % 5 56
    % 6 56
    % 7 56
    % 8 56
    % 9 56
    % 10 56
    % 11 56
    % 12 56
    % 13 56
    % 14 56
    % 15 56
    % 16 56
    % 17 56
    % 18 56
    % 19 56
    % 20 56
    % 21 56
    % 22 56
    % 23 56
    % 24 56
    % 25 56
    % 26 56
    % 27 56
    % 28 56
    % 29 56
    % 30 56
    % 31 56
    % 32 56
    % 33 56
    % 34 56
    % 35 56
    % 36 56
    % 37 56
    % 38 56
    % 39 56
    % 40 56
    % 41 56
    % 42 56
    % 43 56
    % 44 56
    % 45 56
    % 46 56
    % 47 56
    % 48 56
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    pRM = schema.prop(obj, 'RoundMode', 'SEARoundingModeEnum');
    obj.RoundMode = 'floor';
    pRM.SetFunction = cellhorzcat(@setnontunable, pRM);
    pRM.GetFunction = cellhorzcat(@checkvisibility, pRM);
    % 59 61
    pOM = schema.prop(obj, 'OverflowMode', 'SEAOverflowModeEnum');
    obj.OverflowMode = 'wrap';
    pOM.SetFunction = cellhorzcat(@setnontunable, pOM);
    pOM.GetFunction = cellhorzcat(@checkvisibility, pOM);
    % 64 66
    pHandles = horzcat(pRM, pOM);
    % 66 68
    if ge(nargin, 3.0)
        for ii=1.0:length(extraArgs)
            curArg = extraArgs{ii};
            pArg = schema.prop(obj, curArg{1.0}, curArg{2.0});
            pHandles = horzcat(pHandles, pArg);
        end % for
    end
    % 74 76
    for ii=1.0:length(props)
        curProp = props{ii};
        prefix = curProp{1.0};
        modeStr = horzcat(prefix, 'Mode');
        typeStr = horzcat(prefix, 'Type');
        % 80 83
        % 81 83
        pMode = schema.prop(obj, modeStr, curProp{2.0});
        mode = curProp{3.0};
        obj.(modeStr) = mode;
        pMode.GetFunction = cellhorzcat(@checkvisibility, pMode);
        % 86 91
        % 87 91
        % 88 91
        % 89 91
        args = curProp{4.0};
        defType = numerictype(args{:});
        pType = schema.prop(obj, typeStr, 'embedded.numerictype');
        obj.(typeStr) = defType;
        if sealib.isspecifiedtypemode(mode)
            pType.Visible = 'on';
        else
            pType.Visible = 'off';
        end
        % 99 102
        % 100 102
        pType.AccessFlags.AbortSet = 'off';
        pType.GetFunction = cellhorzcat(@checkvisibility, pType);
        % 103 106
        % 104 106
        res = curProp{5.0};
        for jj=1.0:length(res)
            if ~(any(strcmp(res{jj}, {'SIGNED','UNSIGNED','NOTSIGNED','SCALED','NOTSCALED','ALLOWFLOAT'})))
                % 108 117
                % 109 117
                % 110 117
                % 111 117
                % 112 117
                % 113 117
                % 114 117
                % 115 117
                error('sealib:fixedpoint:invalidnumerictyperestriction', 'Invalid numeric type restriction in createfixptprops: %s', res{jj});
                % 117 120
                % 118 120
            end
        end % for
        % 121 123
        pMode.SetFunction = cellhorzcat(@sealib.setfixptmodevisibility, pMode, pType);
        pType.SetFunction = cellhorzcat(@sealib.setnumerictype, res, pType, pMode);
        % 124 126
        pHandles = horzcat(pHandles, pMode, pType);
    end % for
end
