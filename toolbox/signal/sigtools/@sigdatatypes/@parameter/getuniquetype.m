function typename = getuniquetype(hPrm, check)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    tag = get(hPrm, 'Tag');
    % 8 11
    % 9 11
    typename = horzcat('signal_parameter_', tag);
    type = findtype(typename);
    % 12 16
    % 13 16
    % 14 16
    i = 0.0;
    % 16 18
        while typedoesntmatch(type, check)
        typename = sprintf('signal_parameter_%s%d', tag, i);
        type = findtype(typename);
        i = plus(i, 1.0);
    end % while
    % 22 24
    if isempty(type)
        if iscellstr(check)
            schema.EnumType(typename, check);
        else
            schema.UserType(typename, 'MATLAB array', check);
        end % if
    end % if
end % function
function boolflag = typedoesntmatch(type, check)
    % 32 35
    % 33 35
    if isempty(type)
        boolflag = false;
    else
        if isa(check, 'function_handle') && not(isa(type, 'schema.UserType'))
            boolflag = true;
        else
            if isa(type, 'schema.UserType') && not(isa(check, 'function_handle'))
                boolflag = true;
            else
                if isa(check, 'function_handle')
                    if isequal(type.Check, check)
                        boolflag = false;
                    else
                        boolflag = true;
                    end % if
                else
                    if ne(length(type.Strings), length(check))
                        boolflag = true;
                    else
                        if all(strcmpi(type.Strings, check))
                            boolflag = false;
                        else
                            boolflag = true;
                        end % if
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function
