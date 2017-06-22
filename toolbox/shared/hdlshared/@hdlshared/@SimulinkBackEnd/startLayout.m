function startLayout(this)
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
    hdldisp(sprintf('Start Layout...'), 3.0);
    % 12 14
    dutName = this.hPir.getTopNetwork.Name;
    inMdlFileName = this.InModelFile;
    outMdlFileName = this.OutModelFile;
    % 16 18
    if strcmp(dutName, inMdlFileName)
    else
        % 19 21
        % 20 27
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        [tok, rem] = strtok(dutName, '/');
        rem = rem(2.0:end);
        % 28 30
        targetBlkSS = outMdlFileName;
            while not(isempty(rem))
            [tok, rem] = strtok(rem, '/');
            % 32 34
            targetBlkSS = horzcat(targetBlkSS, '/', tok);
            % 34 36
            srcBlkSS = regexprep(targetBlkSS, horzcat('^', outMdlFileName), inMdlFileName);
            srcBlkSSHandle = get_param(srcBlkSS, 'Handle');
            % 37 39
            add_block('built-in/Subsystem', targetBlkSS);
            % 39 41
            if hasmaskdlg(srcBlkSSHandle)
                pv = getMaskParams(this, srcBlkSSHandle);
                setMaskParams(this, targetBlkSS, pv);
            else
                pv = getMaskDlgParams(this, srcBlkSSHandle);
                setMaskDlgParams(this, targetBlkSS, pv);
            end % if
            % 47 49
            if not(isempty(rem))
                rem = rem(2.0:end);
            end % if
        end % while
    end % if
end % function
