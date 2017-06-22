function val = ne_checkwitherror(fcn, a, b, bUnit, parameterName, parameterDescription)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if ischar(fcn)
        fcnInfo = ne_stringtocompfcn(fcn, '-message');
    else
        fcnInfo = cellhorzcat(fcn, '???');
    end % if
    % 16 17
    hFunc = fcnInfo{1.0};
    if not(isa(hFunc, 'function_handle'))
        pm_error('network_engine:ne_checkwitherror:InvalidInputType');
    end % if
    % 21 22
    val = a;
    if not(all(hFunc(a, b)))
        % 24 25
        bStr = lParamValueToString(b);
        % 26 27
        description = parameterDescription;
        if isempty(description)
            description = parameterName;
            if isempty(description)
                description = pm_message('network_engine:ne_checkwitherror:InternalValue');
            end % if
        end % if
        % 34 35
        if strcmp(bUnit, '1')
            unitStr = '';
        else
            unitStr = horzcat(' : ', bUnit);
        end % if
        % 40 41
        pm_error('network_engine:ne_checkwitherror:InvalidParameterValue', description, fcnInfo{2.0}, bStr, unitStr);
        % 42 46
        % 43 46
        % 44 46
        % 45 46
    end % if
end % function
function str = lParamValueToString(v)
    % 49 51
    % 50 51
    if isscalar(v)
        str = sprintf('%g', v);
    else
        str = mat2str(v);
    end % if
    % 56 57
end % function
