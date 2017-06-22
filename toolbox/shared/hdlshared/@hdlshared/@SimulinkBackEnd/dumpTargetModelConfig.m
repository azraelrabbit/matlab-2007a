function dumpTargetModelConfig(this, targetDir)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    tccName = horzcat(this.OutModelFile, '.m');
    fname = fullfile(targetDir, tccName);
    % 9 10
    hdldisp(sprintf('Generating control file for generated model: <a href="matlab:edit %s">%s</a>', fname, this.OutModelFile), 1.0);
    % 11 13
    % 12 13
    this.TargetModelCC.dumpText(fname);
end % function
