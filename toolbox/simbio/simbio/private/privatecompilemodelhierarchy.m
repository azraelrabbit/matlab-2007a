function cmodel = privatecompilemodelhierarchy(model)
    % 1 67
    % 2 67
    % 3 67
    % 4 67
    % 5 67
    % 6 67
    % 7 67
    % 8 67
    % 9 67
    % 10 67
    % 11 67
    % 12 67
    % 13 67
    % 14 67
    % 15 67
    % 16 67
    % 17 67
    % 18 67
    % 19 67
    % 20 67
    % 21 67
    % 22 67
    % 23 67
    % 24 67
    % 25 67
    % 26 67
    % 27 67
    % 28 67
    % 29 67
    % 30 67
    % 31 67
    % 32 67
    % 33 67
    % 34 67
    % 35 67
    % 36 67
    % 37 67
    % 38 67
    % 39 67
    % 40 67
    % 41 67
    % 42 67
    % 43 67
    % 44 67
    % 45 67
    % 46 67
    % 47 67
    % 48 67
    % 49 67
    % 50 67
    % 51 67
    % 52 67
    % 53 67
    % 54 67
    % 55 67
    % 56 67
    % 57 67
    % 58 67
    % 59 67
    % 60 67
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    try
        cmodel = localCompileModel(model);
    catch
        rethrow(lasterror);
    end % try
    % 71 73
    for j=1.0:length(model.models)
        cmodel_sub = privatecompilemodelhierarchy(model.models(j));
        cmodel = localLinkModels(cmodel, cmodel_sub);
    end % for
    % 76 78
function cmodel = localLinkModels(cmodel, cmodel_sub)
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    cmodel.Xsizes = plus(cmodel.Xsizes, cmodel_sub.Xsizes);
    cmodel.reactionX = cat(1.0, cmodel.reactionX, cmodel_sub.reactionX);
    cmodel.rateX = cat(1.0, cmodel.rateX, cmodel_sub.rateX);
    cmodel.algebraicX = cat(1.0, cmodel.algebraicX, cmodel_sub.algebraicX);
    cmodel.constantX = cat(1.0, cmodel.constantX, cmodel_sub.constantX);
    cmodel.parameters = cat(1.0, cmodel.parameters, cmodel_sub.parameters);
    % 89 92
    % 90 92
    cmodel.activeReactions = cat(1.0, cmodel.activeReactions, cmodel_sub.activeReactions);
    cmodel.activeRateRules = cat(1.0, cmodel.activeRateRules, cmodel_sub.activeRateRules);
    cmodel.activeAlgRules = cat(1.0, cmodel.activeAlgRules, cmodel_sub.activeAlgRules);
    cmodel.activeAssignRules = cat(1.0, cmodel.activeAssignRules, cmodel_sub.activeAssignRules);
    cmodel.inactiveReactions = cat(1.0, cmodel.inactiveReactions, cmodel_sub.inactiveReactions);
    cmodel.inactiveRateRules = cat(1.0, cmodel.inactiveRateRules, cmodel_sub.inactiveRateRules);
    cmodel.inactiveAlgRules = cat(1.0, cmodel.inactiveAlgRules, cmodel_sub.inactiveAlgRules);
    cmodel.inactiveAssignRules = cat(1.0, cmodel.inactiveAssignRules, cmodel_sub.inactiveAssignRules);
    % 99 102
    % 100 102
    cmodel.S = blkdiag(cmodel.S, cmodel_sub.S);
    % 102 104
function cmodel = localCompileModel(model)
    % 104 112
    % 105 112
    % 106 112
    % 107 112
    % 108 112
    % 109 112
    % 110 112
    allModelParams = vertcat(sbioselect(model, 'type', 'parameter', 'depth', 1.0), sbioselect(model.reactions, 'type', 'parameter'));
    % 112 114
    cmodel.parameters = sbioselect(allModelParams, 'ConstantValue', true);
    stateVariables = vertcat(horzcat(model.species), sbioselect(allModelParams, 'ConstantValue', false));
    % 115 119
    % 116 119
    % 117 119
    cmodel.constantX = sbioselect(model.species, 'ConstantAmount', true);
    freeVariables = localSetDiff(stateVariables, cmodel.constantX);
    % 120 123
    % 121 123
    [cmodel.S, cmodel.reactionX, cmodel.activeReactions, cmodel.inactiveReactions] = localGetReactionSystem(model);
    % 123 127
    % 124 127
    % 125 127
    freeVariables = localSetDiff(freeVariables, cmodel.reactionX);
    % 127 130
    % 128 130
    [cmodel.rateX, cmodel.activeRateRules, cmodel.inactiveRateRules, freeVariables] = localGetRateRules(model, freeVariables);
    % 130 136
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    [cmodel.algebraicX, cmodel.activeAlgRules, cmodel.inactiveAlgRules, freeVariables] = localGetAlgebraicRules(model, freeVariables);
    % 136 142
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    cmodel.activeAssignRules = sbioselect(model.rules, 'RuleType', 'assignment', 'Active', 1.0);
    cmodel.inactiveAssignRules = sbioselect(model.rules, 'RuleType', 'assignment', 'Active', 0.0);
    % 143 145
    localCompileAssignmentRules(cmodel.activeAssignRules);
    % 145 148
    % 146 148
    cmodel.constantX = vertcat(horzcat(cmodel.constantX), freeVariables);
    % 148 150
    cmodel.Xsizes = vertcat(length(cmodel.reactionX), length(cmodel.rateX), length(cmodel.algebraicX), length(cmodel.constantX));
    % 150 154
    % 151 154
    % 152 154
    cmodel = orderfields(cmodel, {'reactionX';'rateX';'algebraicX';'constantX';'Xsizes';'parameters';'S';'activeReactions';'activeRateRules';'activeAlgRules';'activeAssignRules';'inactiveReactions';'inactiveRateRules';'inactiveAlgRules';'inactiveAssignRules'});
    % 154 171
    % 155 171
    % 156 171
    % 157 171
    % 158 171
    % 159 171
    % 160 171
    % 161 171
    % 162 171
    % 163 171
    % 164 171
    % 165 171
    % 166 171
    % 167 171
    % 168 171
    % 169 171
    localDebugErrorCheck(model, cmodel);
    % 171 173
function [S, reactionX, activeReacts, inactiveReacts] = localGetReactionSystem(model)
    % 173 182
    % 174 182
    % 175 182
    % 176 182
    % 177 182
    % 178 182
    % 179 182
    % 180 182
    if isempty(model.reactions) || isempty(model.species)
        S = [];
        reactionX = [];
        activeReacts = [];
        inactiveReacts = model.reactions;
        return;
    end % if
    % 188 191
    % 189 191
    S = model.getstoichmatrix('flat');
    % 191 194
    % 192 194
    constflags = cell2mat(get(model.species, {'ConstantAmount'}));
    bcflags = cell2mat(get(model.species, {'BoundaryCondition'}));
    resysflags = and(not(constflags), not(bcflags));
    activeflags = cell2mat(get(model.reactions, {'Active'}));
    % 197 199
    S = S(resysflags, activeflags);
    reactionX = model.species(resysflags);
    activeReacts = model.reactions(activeflags);
    % 201 206
    % 202 206
    % 203 206
    % 204 206
    nzrows = any(S, 2.0);
    nzcols = transpose(any(S, 1.0));
    % 207 209
    S = S(nzrows, nzcols);
    reactionX = reactionX(nzrows);
    activeReacts = activeReacts(nzcols);
    inactiveReacts = localSetDiff(model.reactions, activeReacts);
    % 212 214
function [ruleX, activeRateRules, inactiveRateRules, freeVariables] = localGetRateRules(model, freeVariables)
    % 214 220
    % 215 220
    % 216 220
    % 217 220
    % 218 220
    activeRateRules = sbioselect(model.rules, 'RuleType', 'Rate', 'Active', 1.0);
    inactiveRateRules = sbioselect(model.rules, 'RuleType', 'Rate', 'Active', 0.0);
    ruleX = handle([]);
    % 222 224
    for j=1.0:length(activeRateRules)
        % 224 226
        [lhsobj, lhstok] = localGetLHSOfRateOrAssignmentRule(activeRateRules(j));
        [tf, loc] = ismember(lhsobj, freeVariables);
        % 227 229
        if tf
            ruleX(j, 1.0) = lhsobj;
            freeVariables(loc, :) = [];
        else
            error('SimBiology:INVALID_RULEVARIABLE', horzcat('Invalid rule variable ''', lhstok, ''' in rate rule ''', localGetRuleString(activeRateRules(j)), '''. This object', sprintf('\n'), 'has its Constant* property set to true or is being used in a reaction or in', sprintf('\n'), 'another rule.'));
            % 233 237
            % 234 237
            % 235 237
        end % if
    end % for
    % 238 240
function [algebraicX, activeAlgRules, inactiveAlgRules, freeVariables] = localGetAlgebraicRules(model, freeVariables)
    % 240 245
    % 241 245
    % 242 245
    % 243 245
    activeAlgRules = sbioselect(model.rules, 'RuleType', 'Algebraic', 'Active', 1.0);
    inactiveAlgRules = sbioselect(model.rules, 'RuleType', 'Algebraic', 'Active', 0.0);
    algebraicX = handle([]);
    % 247 249
    names = get(freeVariables, {'Name'});
    % 249 251
    for i=1.0:length(activeAlgRules)
        % 251 253
        parsevars = activeAlgRules(i).parserule;
        if isempty(parsevars)
            error('SimBiology:INVALID_ALGEBRAICRULE', horzcat('Invalid algebraic rule ''', localGetRuleString(activeAlgRules(i)), '''. Algebraic rules must be valid', sprintf('\n'), 'expressions that contain at least one variable that resolves to a species or', sprintf('\n'), 'parameter object.'));
            % 255 259
            % 256 259
            % 257 259
        end % if
        % 259 261
        tf = ismember(names, parsevars);
        j = find(tf, 1.0);
        if not(isempty(j))
            algebraicX(i, 1.0) = freeVariables(j);
            freeVariables(j, :) = [];
            names(j, :) = [];
        else
            error('SimBiology:INVALID_ALGEBRAICRULE', horzcat('The model is overdetermined by the following algebraic rule: ''%s''.', sprintf('\n'), 'At least one species and/or parameter in this rule must be non-constant', sprintf('\n'), 'and not used elsewhere in the model.'), localGetRuleString(activeAlgRules(i)));
            % 268 272
            % 269 272
            % 270 272
        end % if
    end % for
    % 273 275
function D = localSetDiff(A, B)
    % 275 285
    % 276 285
    % 277 285
    % 278 285
    % 279 285
    % 280 285
    % 281 285
    % 282 285
    % 283 285
    tf = ismember(A, B);
    D = A(not(tf));
    % 286 288
function localCompileAssignmentRules(aRuleObjs)
    % 288 294
    % 289 294
    % 290 294
    % 291 294
    % 292 294
    map = SimBiology.BMapWrapper;
    % 294 296
    for i=1.0:length(aRuleObjs)
        % 296 298
        [lhsobj, lhstok] = localGetLHSOfRateOrAssignmentRule(aRuleObjs(i));
        if isempty(map.find(lhsobj))
            map.insert(lhsobj, i);
        else
            error('SimBiology:INVALID_RULE', horzcat('Invalid rule ''', localGetRuleString(aRuleObjs(i)), '''. The variable ''', lhstok, ''' is specified by', sprintf('\n'), 'more than one assignment rule.'));
            % 302 305
            % 303 305
        end % if
    end % for
    % 306 308
function [lhsobj, lhstok] = localGetLHSOfRateOrAssignmentRule(robj)
    % 308 320
    % 309 320
    % 310 320
    % 311 320
    % 312 320
    % 313 320
    % 314 320
    % 315 320
    % 316 320
    % 317 320
    % 318 320
    lhstok = robj.parserule;
    % 320 322
    if ne(numel(lhstok), 1.0)
        switch robj.ruletype
        case 'rate'
            eid = 'SimBiology:INVALID_RATERULE';
            emsg = horzcat('Invalid rate rule ''', localGetRuleString(robj), '''. Rate rules must be of the form x = f(X)', sprintf('\n'), 'where x resolves to a species or parameter object.');
        case 'assignment'
            % 327 329
            eid = 'SimBiology:INVALID_ASSIGNMENTRULE';
            emsg = horzcat('Invalid assignment rule ''', localGetRuleString(robj), '''. Assignment rules must be of the', sprintf('\n'), 'form x = f(X) where x resolves to a species or parameter object.');
        otherwise
            % 331 333
            error('SimBiology:ODEBUILDER_INTERNAL_ERROR', 'Internal compiler error.');
            % 333 335
        end % switch
        error(eid, emsg);
    end % if
    % 337 339
    lhstok = lhstok{1.0};
    % 339 341
    if privateisreservedtoken(lhstok)
        error('SimBiology:INVALID_RULEVARIABLE', horzcat('Invalid rule variable ''', lhstok, ''' in ', robj.ruletype, ' rule ''', localGetRuleString(robj), '''.', sprintf('\n'), 'The string ''', lhstok, ''' is a SimBiology reserved word.'));
        % 342 345
        % 343 345
    end % if
    % 345 347
    lhsobj = robj.resolveobject(lhstok);
    % 347 349
    if isempty(lhsobj)
        error('SimBiology:INVALID_RULEVARIABLE', horzcat('The object ''', lhstok, ''' in ', robj.ruletype, ' rule ''', localGetRuleString(robj), ''' does not resolve to any', sprintf('\n'), 'in-scope species or parameters.'));
        % 350 353
        % 351 353
    end % if
    % 353 355
function str = localGetRuleString(robj)
    % 355 361
    % 356 361
    % 357 361
    % 358 361
    % 359 361
    if not(isempty(robj.Name))
        str = robj.Name;
    else
        str = robj.Rule;
    end % if
    % 365 367
function localDebugErrorCheck(m, cm)
    % 367 373
    % 368 373
    % 369 373
    % 370 373
    % 371 373
    allModelParams = vertcat(sbioselect(m, 'type', 'parameter', 'depth', 1.0), sbioselect(m.reactions, 'type', 'parameter'));
    % 373 375
    stateVariables = vertcat(horzcat(m.species), sbioselect(allModelParams, 'ConstantValue', false));
    % 375 378
    % 376 378
    svs = vertcat(horzcat(cm.reactionX), horzcat(cm.rateX), horzcat(cm.algebraicX), horzcat(cm.constantX));
    % 378 380
    if ne(length(stateVariables), length(svs)) || not(all(ismember(stateVariables, svs)))
        error('PRIVATECOMPILEMODELHIERARCHY:CompileError', 'Internal compiler error.');
    end % if
    % 382 384
    if ne(size(cm.S, 1.0), length(cm.reactionX)) || ne(size(cm.S, 2.0), length(cm.activeReactions))
        error('PRIVATECOMPILEMODELHIERARCHY:CompileError', 'Internal compiler error.');
    end % if
    % 386 388
