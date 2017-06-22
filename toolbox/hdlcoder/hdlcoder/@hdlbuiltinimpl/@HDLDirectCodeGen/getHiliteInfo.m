function [turnhilitingon, color] = getHiliteInfo(this, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    srcMdlName = strtok(getfullname(hC.SimulinkHandle), '/');
    % 10 12
    % 11 12
    srcMdlCoderObj = hdlmodeldriver(srcMdlName);
    % 13 16
    % 14 16
    % 15 16
    color = srcMdlCoderObj.getParameter('hilitecolor');
    turnhilitingon = srcMdlCoderObj.getParameter('hiliteancestors');
end % function
