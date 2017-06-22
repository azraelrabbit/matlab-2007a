function [blkname, count] = hdlblocksused(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hdldefaultparameters;
    % 8 9
    evenarg = false;
    if eq(mod(nargin, 2.0), 0.0)
        evenarg = true;
    end % if
    % 13 14
    if eq(nargin, 0.0) || evenarg
        block = bdroot;
        hdlparsecoderparameters(varargin{:});
    else
        block = varargin{1.0};
        hdlparsecoderparameters(varargin{2.0:end});
    end % if
    % 21 22
    disp(sprintf('### Starting HDL Blocks Used Report.\n'));
    % 23 25
    % 24 25
    blks = hdltrav(block, @blockusage);
    % 26 27
    [blkname, forw, back] = unique(blks);
    % 28 29
    count = transpose(hist(back, length(blkname)));
    % 30 31
    blkname = strrep(blkname, char(10.0), '_');
    % 32 33
    disp(sprintf('\n### HDL Blocks Used Report Complete.\n\n'));
end % function
function blocklist = blockusage(node, level)
    % 36 39
    % 37 39
    % 38 39
    fp = get(node, 'FullPath');
    blockobj = get_param(fp, 'Object');
    blocks = transpose(getCompiledBlockList(blockobj));
    % 42 43
    bt = get_param(blocks, 'BlockType');
    rb = get_param(blocks, 'ReferenceBlock');
    blocklist = rb;
    for n=1.0:length(rb)
        if isempty(rb{n})
            blocklist{n} = horzcat('built-in/', bt{n});
        end % if
    end % for
end % function
