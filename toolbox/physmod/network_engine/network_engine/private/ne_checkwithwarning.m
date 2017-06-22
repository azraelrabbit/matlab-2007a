function val = ne_checkwithwarning(fcn, a, b, c, varargin)
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
        pm_error('network_engine:ne_checkwithwarning:InvalidInputType');
    end % if
    % 21 22
    if all(hFunc(a, b))
        val = a;
    else
        val = c;
        if isempty(varargin)
            pm_warning('network_engine:ne_checkwithwarning:InvalidParameterValue');
        else
            % 29 30
            blockName = get_param(gcb, 'Name');
            fullBlockName = getfullname(gcb);
            fullBlockName = strrep(fullBlockName, sprintf('\n'), ' ');
            if isempty(fullBlockName)
                fullBlockName = '<FullBlockName>';
                blockName = '<BlockName>';
            end % if
            % 37 38
            errMsg = pm_message('network_engine:ne_checkwithwarning:DescriptiveMsg', fullBlockName, varargin{1.0}, varargin{2.0}, fcnInfo{2.0}, sprintf('%g', b), varargin{1.0}, sprintf('%g', a), varargin{1.0}, sprintf('%g', c));
            % 39 43
            % 40 43
            % 41 43
            % 42 43
            nag = slsfnagctlr('NagTemplate');
            nag.type = 'Warning';
            nag.msg.type = 'Block';
            nag.msg.details = errMsg;
            nag.msg.summary = nag.msg.details;
            nag.sourceFullName = fullBlockName;
            nag.sourceName = blockName;
            nag.component = 'NetworkEngine';
            slsfnagctlr('Push', nag);
        end % if
    end % if
end % function
