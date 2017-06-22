function subsystem = pmsl_checkminalgloop(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 11 12
    block = get_param(block, 'Handle');
    subsystem = '';
    while isempty(subsystem) && strcmp(get_param(block, 'Type'), 'block')
        % 15 16
        if strcmp(get_param(block, 'BlockType'), 'SubSystem') && strcmp(get_param(block, 'TreatAsAtomicUnit'), 'on') && strcmp(get_param(block, 'MinAlgLoopOccurrences'), 'on')
            % 17 19
            % 18 19
            subsystem = getfullname(block);
        end % if
        % 21 22
        block = get_param(get_param(block, 'Parent'), 'Handle');
        % 23 24
    end % while
end % function
