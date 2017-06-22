function generateModel(this, pirInstance)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 2.0)
        pirInstance = this.PirInstance;
    end % if
    % 10 12
    % 11 12
    infile = this.ModelConnection.ModelName;
    % 13 14
    verbose = this.getParameter('verbose');
    openoutfile = not(isempty(strmatch(this.getParameter('codegenerationoutput'), {'DisplayGeneratedModelOnly','GenerateHDLCodeAndDisplayGeneratedModel'}, 'exact')));
    % 16 19
    % 17 19
    % 18 19
    outfile = this.getParameter('generatedmodelname');
    outfileprefix = this.getParameter('generatedmodelnameprefix');
    usedot = this.getParameter('usedotlayout');
    useautoroute = this.getParameter('useslautoroute');
    hiliteparents = this.getParameter('hiliteancestors');
    color = this.getParameter('hilitecolor');
    % 25 26
    hb = hdlshared.SimulinkBackEnd(pirInstance, 'InModelFile', infile, 'OutModelFile', outfile, 'ShowModel', mapyesno(openoutfile), 'OutModelFilePrefix', outfileprefix, 'UseDotLayout', mapyesno(usedot), 'AutoRoute', mapyesno(useautoroute), 'HiliteAncestors', mapyesno(hiliteparents), 'HiliteColor', color, 'Verbose', verbose);
    % 27 38
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    this.BackEnd = hb;
    % 39 41
    % 40 41
    hb.generateModel;
end % function
function result = mapyesno(booleaninput)
    % 44 54
    % 45 54
    % 46 54
    % 47 54
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    % 53 54
    mapstr = {'no','yes'};
    % 55 56
    result = mapstr{plus(double(booleaninput), 1.0)};
end % function
