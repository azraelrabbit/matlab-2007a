function [outputBlk, outputBlkPosition] = addSLBlockModel(this, hC, originalBlkPath, targetBlkPath)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    in = hC.InputPorts;
    start_position = [185.0 75.0];
    move_right = [100.0 0.0];
    move_down = [0.0 100.0];
    % 12 13
    origBlkPortDataType = get_param(originalBlkPath, 'CompiledPortDataTypes');
    OutDataTypeMode = origBlkPortDataType.Outport;
    blkpath = horzcat(targetBlkPath, '/', hC.Name);
    blkSize = blockSize(originalBlkPath);
    add_block(originalBlkPath, blkpath);
    blkPosition = horzcat(start_position, plus(start_position, blkSize));
    start_position = plus(start_position, move_right);
    set_param(blkpath, 'Position', blkPosition);
    % 21 23
    % 22 23
    for i=1.0:length(in)
        add_line(targetBlkPath, horzcat('In', num2str(i), '/1'), horzcat(hC.Name, '/', num2str(i)), 'autorouting', 'on');
    end % for
    % 26 27
    genSignalConversionPath = horzcat(targetBlkPath, '/', hC.Name, '_SignalConversion');
    add_block('built-in/SignalConversion', genSignalConversionPath);
    blkPosition = horzcat(start_position, plus(start_position, blockSize(genSignalConversionPath)));
    set_param(genSignalConversionPath, 'Position', blkPosition);
    set_param(genSignalConversionPath, 'ConversionOutput', 'Contiguous copy');
    set_param(genSignalConversionPath, 'OverrideOpt', 'on')
    add_line(targetBlkPath, horzcat(hC.Name, '/1'), horzcat(hC.Name, '_SignalConversion', '/1'), 'autorouting', 'on');
    outputBlk = horzcat(hC.Name, '_SignalConversion');
    outputBlkPosition = plus(start_position, blockSize(genSignalConversionPath));
end % function
function blkSize = blockSize(Block)
    % 38 39
    Position = get_param(Block, 'Position');
    blkSize = horzcat(minus(Position(3.0), Position(1.0)), minus(Position(4.0), Position(2.0)));
end % function
