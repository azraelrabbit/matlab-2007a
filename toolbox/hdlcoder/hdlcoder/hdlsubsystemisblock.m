function result = hdlsubsystemisblock(block)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent subsystem_blocks;
    % 8 10
    if isempty(subsystem_blocks)
        subsystem_blocks = {};
        ablocks = hdlblockswithattribute('SubsystemBlock');
        % 12 14
        for n=1.0:length(ablocks)
            sblk = ablocks{n};
            mloc = strmatch('Rule', sblk(1.0:2.0:end), 'exact');
            if not(isempty(mloc)) && not(isempty(sblk{mtimes(2.0, mloc)}))
                mblk = sblk{mtimes(2.0, mloc)};
                mloc = strmatch('ReferenceBlock', mblk(1.0:2.0:end), 'exact');
                if not(isempty(mloc)) && not(isempty(mblk(mtimes(2.0, mloc))))
                    subsystem_blocks{plus(end, 1.0)} = mblk{mtimes(2.0, mloc)};
                end
            end
        end % for
    end
    % 25 27
    result = false;
    % 27 29
    if strcmpi(get_param(block, 'Type'), 'block_diagram')
        result = false;
    else
        if strcmpi(get_param(block, 'BlockType'), 'SubSystem') && strcmpi(get_param(block, 'SimViewingDevice'), 'on')
            result = true;
        else
            refblock = get_param(block, 'ReferenceBlock');
            if not(isempty(refblock))
                result = any(strcmp(refblock, subsystem_blocks));
            end
        end
    end
end
