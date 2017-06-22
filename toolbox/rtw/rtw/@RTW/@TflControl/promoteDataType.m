function result = promoteDataType(h, ent)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    result = ent.Prototype.Return.toString();
    if not(isempty(bdroot))
        cs = getActiveConfigSet(bdroot);
        if not(isempty(cs))
            if strcmp(get_param(cs, 'IsERTTarget'), 'on') && strcmp(get_param(cs, 'ProdEqTarget'), 'on')
                % 12 14
                inDataType = ent.Prototype.Args(1.0).toString();
                intBits = get_param(cs, 'ProdBitPerInt');
                switch inDataType
                case 'int8'
                    if ge(intBits, 8.0)
                        result = 'integer';
                    else
                        result = inDataType;
                    end
                case 'int16'
                    if ge(intBits, 16.0)
                        result = 'integer';
                    else
                        result = inDataType;
                    end
                case 'uint8'
                    if eq(intBits, 32.0)
                        result = 'uint32';
                    else
                        if eq(intBits, 16.0)
                            result = 'uint16';
                        else
                            result = inDataType;
                        end
                    end
                case 'uint16'
                    if eq(intBits, 32.0)
                        result = 'uint32';
                    else
                        result = inDataType;
                    end
                end
            end
        end
    end
end
