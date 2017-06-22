function runFcnImpCallbacks(h, modelName, dispOpts, genDir)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    me = h.MatchedEntries;
    numEnts = length(me);
    % 10 11
    dh = dispOpts.DispHook;
    % 12 14
    % 13 14
    for i=1.0:numEnts
        thisEnt = me(i);
        if not(isempty(thisEnt.GenCallback)) && isempty(regexpi(thisEnt.GenCallback, '.tlc'))
            % 17 19
            % 18 19
            fctInfo = struct('FcnName', thisEnt.Prototype.ImplName, 'FcnType', thisEnt.Prototype.Return.toString(), 'HdrFile', thisEnt.Prototype.HeaderFile, 'NumInputs', thisEnt.Prototype.NumInputs);
            % 20 23
            % 21 23
            % 22 23
            try
                feval(thisEnt.GenCallback, modelName, fctInfo, genDir);
            catch
                feval(dh{:}, horzcat('###    Error invoking Library Function callback ', thisEnt.GenCallback));
                % 27 28
                error('%s', lasterr);
            end % try
        end % if
    end % for
end % function
