function outMdlName = getUniqueOutputModelName(this, codeGenDir, inModelFile)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    if not(isempty(this.OutModelFile))
        % 26 27
        mdlname = this.OutModelFile;
    else
        % 29 30
        mdlname = inModelFile;
    end % if
    % 32 34
    % 33 34
    prefix = this.OutModelFilePrefix;
    outMdlName = horzcat(prefix, mdlname);
    % 36 37
    variantNum = 0.0;
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
        while not(isempty(find_system('type', 'block_diagram', 'name', outMdlName)))
        outMdlName = horzcat(prefix, mdlname, num2str(variantNum));
        variantNum = plus(variantNum, 1.0);
    end % while
    % 49 51
    % 50 51
    this.OutModelFile = outMdlName;
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    % 57 58
    this.setTargetModelCC(hdlnewconfig(outMdlName));
    % 59 60
end % function
