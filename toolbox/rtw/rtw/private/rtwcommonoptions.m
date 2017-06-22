function rtwoptions = rtwcommonoptions
    % 1 73
    % 2 73
    % 3 73
    % 4 73
    % 5 73
    % 6 73
    % 7 73
    % 8 73
    % 9 73
    % 10 73
    % 11 73
    % 12 73
    % 13 73
    % 14 73
    % 15 73
    % 16 73
    % 17 73
    % 18 73
    % 19 73
    % 20 73
    % 21 73
    % 22 73
    % 23 73
    % 24 73
    % 25 73
    % 26 73
    % 27 73
    % 28 73
    % 29 73
    % 30 73
    % 31 73
    % 32 73
    % 33 73
    % 34 73
    % 35 73
    % 36 73
    % 37 73
    % 38 73
    % 39 73
    % 40 73
    % 41 73
    % 42 73
    % 43 73
    % 44 73
    % 45 73
    % 46 73
    % 47 73
    % 48 73
    % 49 73
    % 50 73
    % 51 73
    % 52 73
    % 53 73
    % 54 73
    % 55 73
    % 56 73
    % 57 73
    % 58 73
    % 59 73
    % 60 73
    % 61 73
    % 62 73
    % 63 73
    % 64 73
    % 65 73
    % 66 73
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    % 72 73
    cr = sprintf('\n');
    % 74 75
    if rtwinbat
        showHTMLdefault = 'on';
    else
        showHTMLdefault = 'off';
    end % if
    % 80 83
    % 81 83
    % 82 83
    roi = 1.0;
    rtwoptions(roi).prompt = 'General code generation options';
    rtwoptions(roi).type = 'Category';
    rtwoptions(roi).enable = 'on';
    rtwoptions(roi).default = 7.0;
    % 88 89
    rtwoptions(roi).popupstrings = '';
    rtwoptions(roi).tlcvariable = '';
    rtwoptions(roi).tooltip = '';
    rtwoptions(roi).callback = '';
    rtwoptions(roi).opencallback = '';
    rtwoptions(roi).closecallback = '';
    rtwoptions(roi).makevariable = '';
    % 96 97
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Show eliminated statements';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'off';
    rtwoptions(roi).tlcvariable = 'ShowEliminatedStatements';
    rtwoptions(roi).tooltip = sprintf('Show eliminated statements as comments in the generated code');
    % 103 105
    % 104 105
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Loop rolling threshold';
    rtwoptions(roi).type = 'Edit';
    rtwoptions(roi).enable = 'on';
    rtwoptions(roi).default = '5';
    rtwoptions(roi).tlcvariable = 'RollThreshold';
    rtwoptions(roi).tooltip = sprintf('Set limit when eliminating "for" loops');
    % 112 114
    % 113 114
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Verbose builds';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'on';
    rtwoptions(roi).tlcvariable = 'RTWVerbose';
    rtwoptions(roi).tooltip = sprintf('Show code generation stages and compiler output');
    % 120 122
    % 121 122
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Generate HTML report';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = showHTMLdefault;
    rtwoptions(roi).tlcvariable = 'GenerateReport';
    rtwoptions(roi).makevariable = 'GENERATE_REPORT';
    rtwoptions(roi).tooltip = sprintf(horzcat('Create a report for the generated C code.', cr, 'The report summarizes the generated code and describes how to ', cr, 'compile and interface the code with hand-written (legacy) code.'));
    % 129 132
    % 130 132
    % 131 132
    rtwoptions(roi).opencallback = 'val = ''off''; if (ecoderinstalled) val = ''on''; end;objTag = ''Generate HTML report_CheckboxTag'';obj = findobj(DialogFig,''Tag'',objTag);set(obj, ''Enable'', val);';
    % 133 138
    % 134 138
    % 135 138
    % 136 138
    % 137 138
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Inline invariant signals';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'on';
    rtwoptions(roi).tlcvariable = 'InlineInvariantSignals';
    rtwoptions(roi).tooltip = sprintf('Inline the values of invariant signals in the generated code.');
    % 144 145
    rtwoptions(roi).opencallback = 'val = get_param(model, ''RTWInlineParameters'');objTag = ''Inline invariant signals_CheckboxTag'';obj = findobj(DialogFig,''Tag'',objTag);set(obj, ''Enable'', val);';
    % 146 151
    % 147 151
    % 148 151
    % 149 151
    % 150 151
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Local block outputs';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'on';
    rtwoptions(roi).tlcvariable = 'LocalBlockOutputs';
    rtwoptions(roi).tooltip = sprintf('Declare block outputs in local (function) scope when possible');
    % 157 159
    % 158 159
    rtwoptions(roi).callback = 'DialogFig = get(gcbo,''Parent'');obj0Tag = ''Local block outputs_CheckboxTag'';obj0 = findobj(DialogFig,''Tag'',obj0Tag);obj1Tag = ''Expression folding_CheckboxTag'';obj1 = findobj(DialogFig,''Tag'',obj1Tag);obj2Tag = ''Fold unrolled vectors_CheckboxTag'';obj2 = findobj(DialogFig,''Tag'',obj2Tag);obj3Tag = ''Enforce integer downcast_CheckboxTag'';obj3 = findobj(DialogFig,''Tag'',obj3Tag);val = get(obj0,''Value'');ud=get(DialogFig, ''Userdata'');set_param(getActiveConfigSet(ud.model),''ExpressionFolding'',val);if val == 1;val=''on'';else;val=''off'';end;set(obj1, ''Enable'', val);set(obj2, ''Enable'', val);set(obj3, ''Enable'', val);';
    % 160 176
    % 161 176
    % 162 176
    % 163 176
    % 164 176
    % 165 176
    % 166 176
    % 167 176
    % 168 176
    % 169 176
    % 170 176
    % 171 176
    % 172 176
    % 173 176
    % 174 176
    % 175 176
    rtwoptions(roi).opencallback = 'val = get_param(model, ''OptimizeBlockIOStorage'');objTag = ''Local block outputs_CheckboxTag'';obj = findobj(DialogFig,''Tag'',objTag);set(obj, ''Enable'', val);';
    % 177 182
    % 178 182
    % 179 182
    % 180 182
    % 181 182
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Force generation of parameter comments';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'off';
    rtwoptions(roi).tlcvariable = 'ForceParamTrailComments';
    rtwoptions(roi).tooltip = sprintf(horzcat('Place parameter variable names and source blocks in comments ', cr, 'by the model parameter structure declaration.', cr, 'By default parameter comments appear if you have less than 1000 parameters.'));
    % 188 195
    % 189 195
    % 190 195
    % 191 195
    % 192 195
    % 193 195
    % 194 195
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'General code generation options (cont.)';
    rtwoptions(roi).type = 'Category';
    rtwoptions(roi).enable = 'on';
    rtwoptions(roi).default = 4.0;
    % 200 201
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Buffer reuse';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'on';
    rtwoptions(roi).tooltip = sprintf(horzcat('Reuse signal memory whenever possible. This option ', cr, 'is most noticeable for local (function scope) variables. ', cr, 'For many compilers buffer reuse reduces stack size (RAM)', cr, 'at the cost of code size (ROM) and readability.'));
    % 206 210
    % 207 210
    % 208 210
    % 209 210
    rtwoptions(roi).callback = 'DialogFig = get(gcbo,''Parent'');obj0Tag = ''Buffer reuse_CheckboxTag'';obj0 = findobj(DialogFig,''Tag'',obj0Tag);val = get(obj0,''Value'');if val == 1;val=''on'';else;val=''off'';end;ud=get(DialogFig, ''Userdata'');set_param(ud.model,''BufferReuse'',val);';
    % 211 218
    % 212 218
    % 213 218
    % 214 218
    % 215 218
    % 216 218
    % 217 218
    rtwoptions(roi).opencallback = 'val1 = get_param(model, ''OptimizeBlockIOStorage'');val2 = get_param(model, ''BufferReuse'');objTag = ''Buffer reuse_CheckboxTag'';obj = findobj(DialogFig,''Tag'',objTag);if strcmp(val2,''on''); val=1;else;val=0;end;set(obj, ''Value'', val);set(obj, ''Enable'', val1);';
    % 219 226
    % 220 226
    % 221 226
    % 222 226
    % 223 226
    % 224 226
    % 225 226
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Expression folding';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'on';
    rtwoptions(roi).tooltip = sprintf(horzcat('Whenever possible, collapse, or "fold," block computations', cr, 'into a single expression instead of generating separate code', cr, 'statements and storage declarations for each block.'));
    % 231 234
    % 232 234
    % 233 234
    rtwoptions(roi).callback = 'DialogFig = get(gcbo,''Parent'');obj1Tag = ''Expression folding_CheckboxTag'';obj1 = findobj(DialogFig,''Tag'',obj1Tag);obj2Tag = ''Fold unrolled vectors_CheckboxTag'';obj2 = findobj(DialogFig,''Tag'',obj2Tag);obj3Tag = ''Enforce integer downcast_CheckboxTag'';obj3 = findobj(DialogFig,''Tag'',obj3Tag);val = get(obj1,''Value'');ud=get(DialogFig, ''Userdata'');set_param(getActiveConfigSet(ud.model),''ExpressionFolding'',val);if val == 1;val=''on'';else;val=''off'';end;set(obj2, ''Enable'', val);set(obj3, ''Enable'', val);';
    % 235 248
    % 236 248
    % 237 248
    % 238 248
    % 239 248
    % 240 248
    % 241 248
    % 242 248
    % 243 248
    % 244 248
    % 245 248
    % 246 248
    % 247 248
    rtwoptions(roi).opencallback = 'obj0Tag = ''Local block outputs_CheckboxTag'';obj0 = findobj(DialogFig,''Tag'',obj0Tag);obj1Tag = ''Expression folding_CheckboxTag'';obj1 = findobj(DialogFig,''Tag'',obj1Tag);obj2Tag = ''Fold unrolled vectors_CheckboxTag'';obj2 = findobj(DialogFig,''Tag'',obj2Tag);obj3Tag = ''Enforce integer downcast_CheckboxTag'';obj3 = findobj(DialogFig,''Tag'',obj3Tag);bioval = get_param(model, ''OptimizeBlockIOStorage'');exprval= double(strcmp(get_param(getActiveConfigSet(model), ''ExpressionFolding''), ''on''));if exprval > 0;exprval=1;else;exprval=0;end;set(obj1, ''Value'', exprval);set(obj1, ''Enable'', bioval);set(obj2, ''Enable'', bioval);set(obj3, ''Enable'', bioval);';
    % 249 265
    % 250 265
    % 251 265
    % 252 265
    % 253 265
    % 254 265
    % 255 265
    % 256 265
    % 257 265
    % 258 265
    % 259 265
    % 260 265
    % 261 265
    % 262 265
    % 263 265
    % 264 265
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Fold unrolled vectors';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'on';
    rtwoptions(roi).tlcvariable = 'FoldNonRolledExpr';
    rtwoptions(roi).tooltip = sprintf(horzcat('Always fold vector expressions, even when the signal width is', cr, 'below the loop rolling threshold. Selecting this option reduces', cr, 'code size (ROM) but may increase code generation time for unrolled', cr, 'vector signals (i.e., signals that have widths less than the loop', cr, 'rolling threshold).  Use this option only when you wish to reduce', cr, 'code generation time.'));
    % 271 279
    % 272 279
    % 273 279
    % 274 279
    % 275 279
    % 276 279
    % 277 279
    % 278 279
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Enforce integer downcast';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'on';
    rtwoptions(roi).tlcvariable = 'EnforceIntegerDowncast';
    rtwoptions(roi).tooltip = sprintf(horzcat('This option refers to 8-bit operations on 16-bit', cr, 'microprocessors, and 8 and 16-bit operations on 32-bit', cr, 'microprocessors. To insure consistency between', cr, 'simulation and code generation, the results of', cr, '8 and 16-bit integer expressions must be ', cr, 'explicitly downcast.  Deselecting this option', cr, 'improves code efficiency. However, the primary effect', cr, 'of deselecting this option is that expressions', cr, 'involving 8 and 16-bit arithmetic are less likely to', cr, 'overflow in code than they are in simulation. We', cr, 'recommend that you turn on Enforce integer downcast for', cr, 'safety; turn the option off only if you are concerned', cr, 'with generating the smallest possible code, and you', cr, 'know that 8 and 16-bit signals will not overflow.'));
    % 285 303
    % 286 303
    % 287 303
    % 288 303
    % 289 303
    % 290 303
    % 291 303
    % 292 303
    % 293 303
    % 294 303
    % 295 303
    % 296 303
    % 297 303
    % 298 303
    % 299 303
    % 300 303
    % 301 303
    % 302 303
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'General code appearance options';
    rtwoptions(roi).type = 'Category';
    rtwoptions(roi).enable = 'on';
    rtwoptions(roi).default = 7.0;
    % 308 309
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Maximum identifier length';
    rtwoptions(roi).type = 'Edit';
    rtwoptions(roi).enable = 'on';
    rtwoptions(roi).default = '31';
    rtwoptions(roi).tlcvariable = 'MaxRTWIdLen';
    rtwoptions(roi).tooltip = sprintf('Maximum identifer length for variable, typedef, and function names.');
    % 316 319
    % 317 319
    % 318 319
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Include data type acronym in identifiers';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'off';
    rtwoptions(roi).tlcvariable = 'IncDataTypeInIds';
    rtwoptions(roi).tooltip = sprintf(horzcat('Include data type acronym, in the signal and work vector', cr, 'identifiers. For example, rtB.i32_signame is a 32-bit integer', cr, 'block output named ''signame''.'));
    % 325 329
    % 326 329
    % 327 329
    % 328 329
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Include system hierarchy number in identifiers';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'off';
    rtwoptions(roi).tlcvariable = 'IncHierarchyInIds';
    rtwoptions(roi).tooltip = sprintf(horzcat('Include the system hierarchy number in variable identifiers. For example', cr, 'the ''s3_'' in rtB.s3_signame (a block output signal named ''signame'').', cr, 'Including the system hierarchy number in the identifiers helps improve', cr, 'traceability of the generated code. To locate the subsystem in which', cr, 'this identifier resides, use:', cr, '  hilite_system(''<S3>'')', cr, 'at the MATLAB prompt. Note, hilite_system requires a capital S.'));
    % 335 343
    % 336 343
    % 337 343
    % 338 343
    % 339 343
    % 340 343
    % 341 343
    % 342 343
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Prefix model name to global identifiers';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'on';
    rtwoptions(roi).tlcvariable = 'PrefixModelToSubsysFcnNames';
    rtwoptions(roi).makevariable = 'ADD_MDL_NAME_TO_GLOBALS';
    rtwoptions(roi).tooltip = sprintf(horzcat('For any code format, prefix the model name to the subsystem function names.', cr, 'When appropriate for the code format, also prefix the model name to the top-level', cr, 'functions and data structures. This prevents compiler errors due to name', cr, 'clashes when combining multiple models.'));
    % 350 355
    % 351 355
    % 352 355
    % 353 355
    % 354 355
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Generate scalar inlined parameters as';
    rtwoptions(roi).type = 'Popup';
    rtwoptions(roi).default = 'Literals';
    rtwoptions(roi).popupstrings = 'Literals|Macros';
    rtwoptions(roi).tlcvariable = 'InlinedPrmAccess';
    rtwoptions(roi).tooltip = sprintf(horzcat('Specify if inlined parameter accesses', cr, 'are generated as numeric values or as symbols', cr, 'defined in macros.'));
    % 362 366
    % 363 366
    % 364 366
    % 365 366
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Generate comments';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'on';
    rtwoptions(roi).tlcvariable = 'GenerateComments';
    rtwoptions(roi).tooltip = sprintf('Generate comments in code.');
    % 372 373
    rtwoptions(roi).callback = 'DialogFig = get(gcbo,''Parent'');obj1Tag = ''Generate comments_CheckboxTag'';obj1 = findobj(DialogFig,''Tag'',obj1Tag);obj2Tag = ''Force generation of parameter comments_CheckboxTag'';obj2 = findobj(DialogFig,''Tag'',obj2Tag);val = get(obj1,''Value'');if val == 1;val=''on'';else;val=''off'';end;set(obj2, ''Enable'', val);';
    % 374 382
    % 375 382
    % 376 382
    % 377 382
    % 378 382
    % 379 382
    % 380 382
    % 381 382
    rtwoptions(roi).opencallback = 'obj1Tag = ''Generate comments_CheckboxTag'';obj1 = findobj(DialogFig,''Tag'',obj1Tag);obj2Tag = ''Force generation of parameter comments_CheckboxTag'';obj2 = findobj(DialogFig,''Tag'',obj2Tag);val = get(obj1,''Value'');if val == 1;val=''on'';else;val=''off'';end;set(obj2, ''Enable'', val);';
    % 383 391
    % 384 391
    % 385 391
    % 386 391
    % 387 391
    % 388 391
    % 389 391
    % 390 391
    roi = plus(roi, 1.0);
    rtwoptions(roi).prompt = 'Generate full header including time stamp';
    rtwoptions(roi).type = 'Checkbox';
    rtwoptions(roi).default = 'on';
    rtwoptions(roi).tlcvariable = 'GenerateFullHeader';
    rtwoptions(roi).tooltip = horzcat('Generate instance-specific code generation information. ', cr, 'Uncheck the box to generate deterministic code.');
    % 397 401
    % 398 401
    % 399 401
    % 400 401
    if eq(exist('dsp_rtwoptions'), 2.0)
        dspOptions = dsp_rtwoptions;
        % 403 404
        rtwoptions(1.0).default = plus(rtwoptions(1.0).default, length(dspOptions));
        % 405 406
        rtwoptions = horzcat(rtwoptions, dspOptions);
    end % if
end % function
