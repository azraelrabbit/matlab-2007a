function [knew, result] = privaterunparamestim(k0, pe_info)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    m = pe_info.model;
    cs = m.getconfigset('active');
    m.verify;
    try
        % 19 22
        % 20 22
        odebuilder(m, cs, feature('SimBioODEFcnHandles'));
    catch
        error('SimBiology:SBIOPARAMESTIM_INVALID_MODEL', 'Invalid model, please check the model contents.');
        % 24 26
    end % try
    ODEData = get(m, 'ODESimulationData');
    % 27 30
    % 28 30
    p_unitconv = [];
    pe_info.ucflag = ~(isempty(ODEData.UnitMultipliers));
    if pe_info.ucflag
        num_tunable_params = length(pe_info.pindex);
        p_unitconv = ODEData.UnitMultipliers(plus(length(ODEData.X0), 1.0):end);
        p_unitconv = p_unitconv(pe_info.pindex);
        if ~(isempty(p_unitconv))
            k0 = rdivide(k0, p_unitconv);
        end
    end
    % 39 42
    % 40 42
    solveropts = cs.SolverOptions;
    absTol = solveropts.AbsoluteTolerance;
    relTol = solveropts.RelativeTolerance;
    % 44 46
    options = odeset('AbsTol', absTol, 'RelTol', relTol);
    % 46 49
    % 47 49
    if ODEData.DAE
        options = odeset(options, 'Mass', ODEData.Mass, 'MassSingular', 'yes');
        % 50 53
        % 51 53
    end
    % 53 55
    if ~(isempty(solveropts.MaxStep))
        options = odeset(options, 'MaxStep', solveropts.MaxStep);
        % 56 58
    end
    % 58 60
    pe_info.odeoptions = options;
    % 60 63
    % 61 63
    statestolog = get(cs.RuntimeOptions.StatesToLog, 'Name');
    % 63 66
    % 64 66
    lb = zeros(size(k0));
    ub = [];
    tspan_saved = cs.SolverOptions.Tspan;
    cs.SolverOptions.Tspan = pe_info.tspan;
    % 69 71
    try
        switch pe_info.method
        case 'fminsearch'
            opt = localInitOptimOptions(pe_info.optimoptions);
            objfcn = @(k)norm(paramestimerror(k,pe_info));
            [knew, fval, exitflag, output] = fminsearch(objfcn, k0, opt);
            % 76 78
            result.fval = fval;
            result.exitflag = exitflag;
            result.iterations = output.iterations;
            result.funccount = output.funcCount;
        case 'lsqcurvefit'
            % 82 85
            % 83 85
            opt = localInitOptimOptions(pe_info.optimoptions);
            objfcn = @(k,tspan)paramestim(k,tspan,pe_info);
            [knew, resnorm, residual, exitflag, output] = lsqcurvefit(objfcn, k0, pe_info.tspan, pe_info.xtarget, lb, ub, opt);
            % 87 89
            result.fval = resnorm;
            result.residual = residual;
            result.exitflag = exitflag;
            result.iterations = output.iterations;
            result.funccount = output.funcCount;
            result.algorithm = output.algorithm;
            result.message = output.message;
        case 'lsqnonlin'
            % 96 99
            % 97 99
            opt = localInitOptimOptions(pe_info.optimoptions);
            objfcn = @(k)paramestimerror(k,pe_info);
            [knew, resnorm, residual, exitflag, output] = lsqnonlin(objfcn, k0, lb, ub, opt);
            % 101 103
            result.fval = resnorm;
            result.residual = residual;
            result.exitflag = exitflag;
            result.iterations = output.iterations;
            result.funccount = output.funcCount;
            result.algorithm = output.algorithm;
            result.message = output.message;
        case 'fmincon'
            % 110 113
            % 111 113
            opt = localInitOptimOptions(pe_info.optimoptions);
            opt = optimset(opt, 'LargeScale', 'off');
            objfcn = @(k)norm(paramestimerror(k,pe_info));
            [knew, fval, exitflag, output] = fmincon(objfcn, k0, [], [], [], [], lb, ub, [], opt);
            % 116 118
            result.fval = fval;
            result.exitflag = exitflag;
            result.iterations = output.iterations;
            result.funccount = output.funcCount;
            result.algorithm = output.algorithm;
            result.message = output.message;
        case 'patternsearch'
            % 124 127
            % 125 127
            psopt = localInitPsOptions(pe_info.optimoptions);
            objfcn = @(k)norm(paramestimerror(k,pe_info));
            [knew, fval, exitflag, output] = patternsearch(objfcn, k0, [], [], [], [], lb, ub, [], psopt);
            % 129 131
            result.fval = fval;
            result.exitflag = exitflag;
            result.iterations = output.iterations;
            result.funccount = output.funccount;
            result.problemtype = output.problemtype;
            result.pollmethod = output.pollmethod;
            result.message = output.message;
        case 'patternsearch_hybrid'
            % 138 141
            % 139 141
            pshopt = localInitPsHybridOptions(pe_info.optimoptions);
            objfcn = @(k)norm(paramestimerror(k,pe_info));
            [knew, fval, exitflag, output] = patternsearch(objfcn, k0, [], [], [], [], lb, ub, [], pshopt);
            % 143 145
            result.fval = fval;
            result.exitflag = exitflag;
            result.iterations = output.iterations;
            result.funccount = output.funccount;
            result.problemtype = output.problemtype;
            result.pollmethod = output.pollmethod;
            result.message = output.message;
        case 'ga'
            % 152 155
            % 153 155
            gaopt = localInitGaOptions(pe_info.optimoptions);
            objfcn = @(k)norm(paramestimerror(k,pe_info));
            [knew, fval, exitflag, output] = ga(objfcn, length(k0), [], [], [], [], lb, ub, [], gaopt);
            % 157 159
            knew = knew(:);
            result.fval = fval;
            result.exitflag = exitflag;
            result.generations = output.generations;
            result.funccount = output.funccount;
            result.message = output.message;
        case 'ga_hybrid'
            % 165 168
            % 166 168
            gahopt = localInitGaHybridOptions(pe_info.optimoptions);
            objfcn = @(k)norm(paramestimerror(k,pe_info));
            [knew, fval, exitflag, output] = ga(objfcn, length(k0), [], [], [], [], lb, ub, [], gahopt);
            % 170 172
            knew = knew(:);
            result.fval = fval;
            result.exitflag = exitflag;
            result.generations = output.generations;
            result.funccount = output.funccount;
            result.message = output.message;
        otherwise
            % 178 180
        end
    catch
        cs.SolverOptions.Tspan = tspan_saved;
        rethrow(lasterror);
    end % try
    % 184 187
    % 185 187
    if ~(isempty(p_unitconv))
        knew = times(knew, p_unitconv);
    end
    % 189 192
    % 190 192
    cs.SolverOptions.Tspan = tspan_saved;
end
function opt = localInitOptimOptions(useropts)
    % 194 198
    % 195 198
    % 196 198
    sbopt = localSbioDefaultOptimOptions;
    % 198 201
    % 199 201
    opt = optimset;
    % 201 204
    % 202 204
    opt = optimset(opt, sbopt);
    % 204 207
    % 205 207
    if ~(isempty(useropts))
        opt = optimset(opt, useropts);
    end
end
function psopt = localInitPsOptions(useropts)
    % 211 215
    % 212 215
    % 213 215
    sbopt = localSbioDefaultPsOptions;
    % 215 218
    % 216 218
    psopt = psoptimset;
    % 218 221
    % 219 221
    psopt = psoptimset(psopt, sbopt);
    % 221 224
    % 222 224
    if ~(isempty(useropts))
        psopt = psoptimset(psopt, useropts);
    end
end
function psopt = localInitPsHybridOptions(useropts)
    % 228 232
    % 229 232
    % 230 232
    sbopt = localSbioDefaultPsOptions;
    sbopt.SearchMethod = cellhorzcat(@searchlhs, 10.0, 15.0);
    % 233 236
    % 234 236
    psopt = psoptimset;
    % 236 239
    % 237 239
    psopt = psoptimset(psopt, sbopt);
    % 239 242
    % 240 242
    if ~(isempty(useropts))
        psopt = psoptimset(psopt, useropts);
    end
end
function gaopt = localInitGaOptions(useropts)
    % 246 250
    % 247 250
    % 248 250
    sbopt = localSbioDefaultGaOptions;
    % 250 253
    % 251 253
    gaopt = gaoptimset;
    % 253 256
    % 254 256
    gaopt = gaoptimset(gaopt, sbopt);
    % 256 259
    % 257 259
    if ~(isempty(useropts))
        gaopt = gaoptimset(gaopt, useropts);
    end
end
function gaopt = localInitGaHybridOptions(useropts)
    % 263 267
    % 264 267
    % 265 267
    opt_hybrid = localSbioDefaultOptimOptions;
    opt_hybrid.LargeScale = 'off';
    sbopt = localSbioDefaultGaOptions;
    sbopt.HybridFcn = cellhorzcat(@fmincon, opt_hybrid);
    % 270 273
    % 271 273
    gaopt = gaoptimset;
    % 273 276
    % 274 276
    gaopt = gaoptimset(gaopt, sbopt);
    % 276 279
    % 277 279
    if ~(isempty(useropts))
        gaopt = gaoptimset(gaopt, useropts);
    end
end
function opt = localSbioDefaultOptimOptions
    % 283 286
    % 284 286
    opt.Display = 'off';
    opt.LargeScale = 'on';
    opt.PrecondBandWidth = Inf;
end
function psopt = localSbioDefaultPsOptions
    % 290 293
    % 291 293
    psopt.Tolmesh = .001;
    psopt.Display = 'off';
    psopt.Cache = 'on';
    psopt.MeshAccel = 'on';
end
function gaopt = localSbioDefaultGaOptions
    % 298 301
    % 299 301
    gaopt.PopulationSize = 10.0;
    gaopt.Generations = 30.0;
    gaopt.MutationFcn = @mutationadaptfeasible;
    gaopt.Display = 'off';
end
function F = paramestim(k, tspan, pe_info)
    % 306 311
    % 307 311
    % 308 311
    % 309 311
    m = pe_info.model;
    % 311 314
    % 312 314
    m.ODESimulationData.P(1.0, pe_info.pindex) = ctranspose(k(:));
    ODEData = get(m, 'ODESimulationData');
    % 315 319
    % 316 319
    % 317 319
    solvertype = pe_info.model.getconfigset('active').SolverType;
    simobj = [];
    cs = [];
    try
        [t, x] = feval(solvertype, @sbioodefile, pe_info.tspan, ODEData.X0, pe_info.odeoptions, pe_info.model, ODEData, simobj, cs);
    catch
        rethrow(lasterror);
    end % try
    % 326 333
    % 327 333
    % 328 333
    % 329 333
    % 330 333
    % 331 333
    newx(:, ODEData.Xorder) = x;
    if pe_info.ucflag
        num_tunable_species = size(pe_info.xtarget, 2.0);
        sp_unitconv = ODEData.UnitMultipliers(pe_info.xindex);
        if ~(isempty(sp_unitconv))
            for j=1.0:num_tunable_species
                newx(:, j) = mtimes(newx(:, j), sp_unitconv(j));
            end % for
        end
    end
    % 342 345
    % 343 345
    F = newx(:, pe_info.xindex);
end
function Ferror = paramestimerror(k, pe_info)
    % 347 356
    % 348 356
    % 349 356
    % 350 356
    % 351 356
    % 352 356
    % 353 356
    % 354 356
    F = paramestim(k, pe_info.tspan, pe_info);
    % 356 359
    % 357 359
    if ne(size(F, 1.0), size(pe_info.xtarget, 1.0))
        Ferror = mtimes(ones(size(pe_info.xtarget)), sqrt(1.7976931348623157e+308));
    else
        Ferror = minus(F, pe_info.xtarget);
    end
end
