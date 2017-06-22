function outstr = fixNameForDot(this, instr)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    outstr = instr;
    % 9 11
    % 10 11
    outstr(or(or(or(lt(outstr, fix('0')), and(gt(outstr, fix('9')), lt(outstr, fix('A')))), and(gt(outstr, fix('Z')), lt(outstr, fix('a')))), gt(outstr, fix('z')))) = '_';
    % 12 14
    % 13 14
end % function
