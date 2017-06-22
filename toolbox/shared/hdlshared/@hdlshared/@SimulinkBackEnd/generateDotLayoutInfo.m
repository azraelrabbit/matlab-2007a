function generateDotLayoutInfo(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdldisp(sprintf('Generating Dot Layout...'), 3.0);
    % 7 10
    % 8 10
    computeNodeSizes(this, this.hPir);
    % 10 13
    % 11 13
    DotFile = genDotFile(this, this.hPir);
    % 13 16
    % 14 16
    LayoutFile = computeLayout(this, DotFile);
    % 16 19
    % 17 19
    readLayout(this, LayoutFile);
    % 19 21
end % function
function LayoutFile = computeLayout(this, DotFile)
    % 22 32
    % 23 32
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    dotExe = fullfile(this.DotPath, this.DotTool);
    % 32 34
    OutModelFile = this.OutModelFile;
    LayoutFileExt = this.LayoutFileExt;
    % 35 37
    this.LayoutFile = horzcat(tempdir, OutModelFile, LayoutFileExt);
    % 37 39
    dotArgs = horzcat(' -Tplain -o ', '"', this.LayoutFile, '"');
    % 39 41
    dotLayoutCmd = horzcat('"', dotExe, '"', dotArgs, ' "', DotFile, '"');
    [s, w] = system(dotLayoutCmd);
    % 42 44
    if s
        error(hdlcodererrormsgid('nodotgenfile'), 'Internal Error: Unable to generate layout info');
        % 45 47
    end % if
    % 47 49
    LayoutFile = this.LayoutFile;
    % 49 51
end % function
