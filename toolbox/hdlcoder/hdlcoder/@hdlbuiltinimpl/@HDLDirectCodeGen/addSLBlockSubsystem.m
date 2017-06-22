function addSLBlockSubsystem(this, hC, originalBlkPath, targetBlkPath)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    add_block('built-in/Subsystem', targetBlkPath);
    % 9 11
    exceptionList = 'ReferenceBlock';
    setModelParam(this, originalBlkPath, targetBlkPath, exceptionList);
    % 12 14
    [turnhilitingon, color] = this.getHiliteInfo(hC);
    set_param(targetBlkPath, 'BackgroundColor', color);
    % 15 17
    if turnhilitingon
        hiliteBlkAncestors(targetBlkPath, color);
    end % if
    % 19 21
    for ii=1.0:length(hC.InputPorts)
        inportPath{ii} = horzcat(targetBlkPath, '/In', num2str(ii));
        add_block('built-in/Inport', inportPath{ii});
        set_param(inportPath{ii}, 'Position', horzcat(85.0, plus(78.0, mtimes(minus(ii, 1.0), 20.0)), 115.0, plus(92.0, mtimes(minus(ii, 1.0), 20.0))));
    end % for
    % 25 27
    for ii=1.0:length(hC.OutputPorts)
        outportPath{ii} = horzcat(targetBlkPath, '/Out', num2str(ii));
        add_block('built-in/Outport', outportPath{ii});
        set_param(outportPath{ii}, 'Position', horzcat(395.0, plus(88.0, mtimes(minus(ii, 1.0), 20.0)), 425.0, plus(102.0, mtimes(minus(ii, 1.0), 20.0))));
    end % for
end % function
function hiliteBlkAncestors(blkPath, color)
        while not(isempty(blkPath))
        set_param(blkPath, 'BackgroundColor', color);
        blkPath = get_param(blkPath, 'Parent');
        if isempty(get_param(blkPath, 'Parent'))
            break
        end % if
    end % while
end % function
