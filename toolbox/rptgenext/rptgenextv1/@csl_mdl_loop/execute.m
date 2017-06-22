function out = execute(c)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    mdlStruct = getfield(c.att, horzcat(c.att.LoopType, 'Models'));
    mdlStruct = loopmodel(c, mdlStruct);
    out = loopobject(c, 'Model', mdlStruct);
end % function
