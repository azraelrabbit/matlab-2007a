function [outputBlk, outputBlkPosition] = addSLBlockModel(this, hC, originalBlkPath, targetBlkPath)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    blkpath = horzcat(targetBlkPath, '/', hC.Name);
    add_block(originalBlkPath, blkpath);
    set_param(blkpath, 'Position', [185.0 75.0 215.0 115.0]);
    % 11 12
    for ii=1.0:length(hC.InputPorts)
        add_line(targetBlkPath, horzcat('In', num2str(ii), '/1'), horzcat(hC.Name, '/', num2str(ii)), 'autorouting', 'on');
    end % for
    % 15 16
    outputBlk = hC.Name;
    outputBlkPosition = [215.0 75.0];
end % function
