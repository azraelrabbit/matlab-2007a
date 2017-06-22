function blocks = mech_get_blocks(block)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    block = get_param(block, 'Handle');
    props = get_param(block, 'ObjectParameters');
    if ~(isfield(props, 'PhysicalDomain')) || ~(strcmpi(get_param(block, 'PhysicalDomain'), 'mechanical'))
        % 19 21
        error('physmod:mech:mech_get_blocks:InvalidBlock', 'Passed block must be a SimMechanics block.');
        % 21 23
    end
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    [blockhandles, classnames] = feature('PhysicalModelingUpdate', block, 'getblocks');
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    classnames = sort(classnames);
    blockclasses = get_param(blockhandles, 'ClassName');
    args(1.0:2.0:mtimes(2.0, length(classnames))) = classnames;
    args(2.0:2.0:mtimes(2.0, length(classnames))) = repmat({[]}, length(classnames), 1.0);
    blocks = struct(args{:});
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    for i=1.0:length(blockclasses)
        blocks.(blockclasses{i})(plus(end, 1.0)) = blockhandles(i);
    end % for
end
