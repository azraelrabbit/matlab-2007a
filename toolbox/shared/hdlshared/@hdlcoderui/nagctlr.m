function nagctlr(type)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 1.0)
        type = 'Error';
    end % if
    nag = slsfnagctlr('NagTemplate');
    nag.type = type;
    if strcmpi(type, 'Error')
        nag.msg.details = sf('Private', 'clean_error_msg', lasterr);
    else
        nag.msg.details = sf('Private', 'clean_error_msg', lastwarn);
    end % if
    nag.msg.type = 'Simulink HDL Coder';
    nag.msg.summary = '';
    nag.component = 'Simulink HDL Coder';
    nag.sourceName = bdroot;
    nag.sourceFullName = bdroot;
    nag.ids = [];
    nag.blkHandles = [];
    slsfnagctlr('Naglog', 'push', nag);
end % function
