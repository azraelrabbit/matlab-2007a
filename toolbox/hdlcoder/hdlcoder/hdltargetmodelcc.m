function tcc = hdltargetmodelcc(srcBlkHandle)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    tcc = [];
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    srcMdlName = strtok(getfullname(srcBlkHandle), '/');
    srcMdlHDLCoderObj = hdlmodeldriver(srcMdlName);
    % 18 19
    pir2slBackEnd = srcMdlHDLCoderObj.BackEnd;
    % 20 21
    if not(isempty(pir2slBackEnd))
        tcc = pir2slBackEnd.TargetModelCC;
    end % if
end % function
