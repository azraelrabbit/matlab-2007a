function config = getDialogConfig(drive)
    % 1 87
    % 2 87
    % 3 87
    % 4 87
    % 5 87
    % 6 87
    % 7 87
    % 8 87
    % 9 87
    % 10 87
    % 11 87
    % 12 87
    % 13 87
    % 14 87
    % 15 87
    % 16 87
    % 17 87
    % 18 87
    % 19 87
    % 20 87
    % 21 87
    % 22 87
    % 23 87
    % 24 87
    % 25 87
    % 26 87
    % 27 87
    % 28 87
    % 29 87
    % 30 87
    % 31 87
    % 32 87
    % 33 87
    % 34 87
    % 35 87
    % 36 87
    % 37 87
    % 38 87
    % 39 87
    % 40 87
    % 41 87
    % 42 87
    % 43 87
    % 44 87
    % 45 87
    % 46 87
    % 47 87
    % 48 87
    % 49 87
    % 50 87
    % 51 87
    % 52 87
    % 53 87
    % 54 87
    % 55 87
    % 56 87
    % 57 87
    % 58 87
    % 59 87
    % 60 87
    % 61 87
    % 62 87
    % 63 87
    % 64 87
    % 65 87
    % 66 87
    % 67 87
    % 68 87
    % 69 87
    % 70 87
    % 71 87
    % 72 87
    % 73 87
    % 74 87
    % 75 87
    % 76 87
    % 77 87
    % 78 87
    % 79 87
    % 80 87
    % 81 87
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    RECTIFIER = 'Rectifier';
    INVERTER = 'Inverter';
    % 88 90
    switch drive
    case 'AC1'
        % 91 94
        % 92 94
        config(1.0) = getAsyncMachine;
        % 94 97
        % 95 97
        config(1.0).title = 'Six-Step VSI Induction Motor Drive';
        % 97 100
        % 98 100
        config(2.0).maskType = 'Universal Bridge';
        config(2.0).tag = RECTIFIER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getRectifierVarNames(drive);
        config(2.0).smlnkIdx = [1.0 1.0 1.0 1.0];
        config(2.0).matlabCell = mtimes(2.0, ones(1.0, 4.0));
        config(2.0).matlabIdx = [3.0 4.0 1.0 2.0];
        config(2.0).javaTab = mtimes(2.0, ones(1.0, 4.0));
        config(2.0).javaIdx = [3.0 4.0 1.0 2.0];
        config(2.0).loadIdx = mtimes(2.0, ones(1.0, 4.0));
        % 109 112
        % 110 112
        config(3.0).maskType = 'DC bus';
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = {'Br','freq_chop','ind_bus','cap_bus'};
        config(3.0).smlnkIdx = [1.0 1.0 1.0 1.0];
        config(3.0).matlabCell = mtimes(3.0, ones(1.0, 4.0));
        config(3.0).matlabIdx = [3.0 4.0 1.0 2.0];
        config(3.0).javaTab = mtimes(2.0, ones(1.0, 4.0));
        config(3.0).javaIdx = [7.0 8.0 5.0 6.0];
        config(3.0).loadIdx = mtimes(2.0, ones(1.0, 4.0));
        % 120 123
        % 121 123
        config(4.0).maskType = 'Universal Bridge';
        config(4.0).tag = INVERTER;
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getInverterVarNames(drive);
        config(4.0).smlnkIdx = [1.0 1.0 1.0 2.0 1.0 2.0 1.0 2.0 1.0 1.0];
        config(4.0).matlabCell = mtimes(4.0, ones(1.0, 10.0));
        config(4.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0];
        config(4.0).javaTab = mtimes(2.0, ones(1.0, 10.0));
        config(4.0).javaIdx = [9.0 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0];
        config(4.0).loadIdx = mtimes(2.0, ones(1.0, 10.0));
        % 132 135
        % 133 135
        config(5.0).maskType = 'Bridge firing unit';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'net_f'};
        config(5.0).smlnkIdx = 1.0;
        config(5.0).matlabCell = 5.0;
        config(5.0).matlabIdx = 2.0;
        config(5.0).javaTab = 3.0;
        config(5.0).javaIdx = 2.0;
        config(5.0).loadIdx = 3.0;
        % 143 146
        % 144 146
        config(6.0).maskType = 'DC bus voltage controller';
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'ki','kp','fc'};
        config(6.0).smlnkIdx = [1.0 1.0 1.0];
        config(6.0).matlabCell = mtimes(5.0, ones(1.0, 3.0));
        config(6.0).matlabIdx = [6.0 5.0 1.0];
        config(6.0).javaTab = mtimes(3.0, ones(1.0, 3.0));
        config(6.0).javaIdx = [6.0 5.0 1.0];
        config(6.0).loadIdx = mtimes(3.0, ones(1.0, 3.0));
        % 154 157
        % 155 157
        config(7.0).maskType = 'Six step generator';
        config(7.0).handle = [];
        config(7.0).smlnkVarNames = {'p','pos_dv','neg_dv','accel_ramp','decel_ramp','minof','maxof','minbv','maxbv','vbhr','zc_time'};
        % 159 161
        config(7.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0];
        config(7.0).matlabCell = mtimes(5.0, ones(1.0, 11.0));
        config(7.0).matlabIdx = [15.0 3.0 4.0 9.0 10.0 11.0 12.0 7.0 8.0 13.0 14.0];
        % 163 165
        config(7.0).javaTab = [1.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0];
        config(7.0).javaIdx = [18.0 3.0 4.0 9.0 10.0 11.0 12.0 7.0 8.0 13.0 14.0];
        config(7.0).loadIdx = mtimes(3.0, ones(1.0, 10.0));
    case 'AC2'
        % 168 171
        % 169 171
        config(1.0) = getAsyncMachine;
        % 171 174
        % 172 174
        config(1.0).title = 'Space Vector PWM VSI Induction Motor Drive';
        % 174 177
        % 175 177
        config(2.0).maskType = 'Universal Bridge';
        config(2.0).tag = RECTIFIER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getRectifierVarNames(drive);
        config(2.0).smlnkIdx = [1.0 1.0 1.0 1.0];
        config(2.0).matlabCell = mtimes(2.0, ones(1.0, 4.0));
        config(2.0).matlabIdx = [1.0 2.0 3.0 4.0];
        config(2.0).javaTab = mtimes(2.0, ones(1.0, 4.0));
        config(2.0).javaIdx = [1.0 2.0 3.0 4.0];
        config(2.0).loadIdx = mtimes(2.0, ones(1.0, 4.0));
        % 186 189
        % 187 189
        config(3.0).maskType = 'Braking chopper';
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = {'cap_bus','br','freq_chop','chopa','chopd'};
        config(3.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0];
        config(3.0).matlabCell = mtimes(3.0, ones(1.0, 5.0));
        config(3.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0];
        config(3.0).javaTab = mtimes(2.0, ones(1.0, 5.0));
        config(3.0).javaIdx = [5.0 6.0 7.0 8.0 9.0];
        config(3.0).loadIdx = mtimes(2.0, ones(1.0, 5.0));
        % 197 200
        % 198 200
        config(4.0).maskType = 'SPSdrives Converter';
        config(4.0).tag = INVERTER;
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getInverterVarNames(drive);
        config(4.0).smlnkIdx = [1.0 1.0 1.0 2.0 1.0 2.0 1.0 2.0 1.0 1.0];
        config(4.0).matlabCell = mtimes(4.0, ones(1.0, 10.0));
        config(4.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0];
        config(4.0).javaTab = mtimes(2.0, ones(1.0, 10.0));
        config(4.0).javaIdx = [10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0];
        config(4.0).loadIdx = mtimes(2.0, ones(1.0, 10.0));
        % 209 212
        % 210 212
        config(5.0).maskType = 'Speed Controller1';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'p','ramp','ramp','kp','ki','Tsc','fc','ctrl_sat','ctrl_sat','ctrl_freq','ctrl_freq','ctrl_volt','ctrl_volt','vbhr','zc_time'};
        % 214 217
        % 215 217
        config(5.0).smlnkIdx = [1.0 2.0 1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 2.0 1.0 2.0 1.0 1.0];
        config(5.0).matlabCell = mtimes(5.0, ones(1.0, 15.0));
        config(5.0).matlabIdx = [16.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0 14.0];
        config(5.0).javaTab = [1.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0];
        config(5.0).javaIdx = [18.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0 14.0];
        config(5.0).loadIdx = mtimes(3.0, ones(1.0, 14.0));
        % 222 224
        config(6.0).maskType = 'SVM generator';
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'car_freq','fc_bus','TsMLIV'};
        config(6.0).smlnkIdx = [1.0 1.0 1.0];
        config(6.0).matlabCell = [5.0 5.0 5.0];
        config(6.0).matlabIdx = [15.0 16.0 17.0];
        config(6.0).javaTab = [3.0 3.0 3.0];
        config(6.0).javaIdx = [15.0 16.0 17.0];
        config(6.0).loadIdx = [3.0 3.0 3.0];
    case 'AC3'
        % 233 236
        % 234 236
        config(1.0) = getAsyncMachine;
        % 236 239
        % 237 239
        config(1.0).title = 'Field-Oriented Control Induction Motor Drive';
        % 239 242
        % 240 242
        config(2.0).maskType = 'Universal Bridge';
        config(2.0).tag = RECTIFIER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getRectifierVarNames(drive);
        config(2.0).smlnkIdx = [1.0 1.0 1.0 1.0];
        config(2.0).matlabCell = mtimes(2.0, ones(1.0, 4.0));
        config(2.0).matlabIdx = [1.0 2.0 3.0 4.0];
        config(2.0).javaTab = mtimes(2.0, ones(1.0, 4.0));
        config(2.0).javaIdx = [1.0 2.0 3.0 4.0];
        config(2.0).loadIdx = mtimes(2.0, ones(1.0, 4.0));
        % 251 254
        % 252 254
        config(3.0).maskType = 'Braking chopper';
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = {'cap_bus','br','freq_chop','chopa','chopd'};
        config(3.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0];
        config(3.0).matlabCell = mtimes(3.0, ones(1.0, 5.0));
        config(3.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0];
        config(3.0).javaTab = mtimes(2.0, ones(1.0, 5.0));
        config(3.0).javaIdx = [5.0 6.0 7.0 8.0 9.0];
        config(3.0).loadIdx = mtimes(2.0, ones(1.0, 5.0));
        % 262 265
        % 263 265
        config(4.0).maskType = 'SPSdrives Converter';
        config(4.0).tag = INVERTER;
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getInverterVarNames(drive);
        config(4.0).smlnkIdx = [1.0 1.0 1.0 2.0 1.0 2.0 1.0 2.0 1.0 1.0 1.0 1.0 2.0 1.0 2.0 1.0 1.0];
        config(4.0).matlabCell = [4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 1.0 1.0 1.0 1.0 1.0 1.0];
        config(4.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 6.0 7.0 8.0 9.0 5.0 18.0];
        config(4.0).javaTab = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 1.0 1.0 1.0 1.0 1.0 1.0];
        config(4.0).javaIdx = [10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0 20.0 6.0 7.0 8.0 9.0 5.0 18.0];
        config(4.0).loadIdx = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0];
        % 274 277
        % 275 277
        config(5.0).maskType = 'Speed controller';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'p','nf','ramp','ramp','Tsc','kp','ki','ctrl_sat','ctrl_sat','p','SwK','fc','fn'};
        % 279 281
        config(5.0).smlnkIdx = [1.0 1.0 2.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0 1.0 1.0];
        config(5.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 1.0 5.0 5.0 1.0];
        config(5.0).matlabIdx = [19.0 2.0 3.0 4.0 6.0 7.0 8.0 9.0 10.0 18.0 19.0 5.0 4.0];
        config(5.0).javaTab = [1.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 1.0 3.0 3.0 1.0];
        config(5.0).javaIdx = [18.0 2.0 3.0 4.0 6.0 7.0 8.0 9.0 10.0 18.0 19.0 5.0 4.0];
        config(5.0).loadIdx = mtimes(3.0, ones(1.0, 10.0));
        % 286 289
        % 287 289
        config(6.0).maskType = 'FOC';
        config(6.0).handle = [];
        % 290 292
        config(6.0).smlnkVarNames = {'kp','ki','csat','csat','h','freq_max','fc','Tvect','p','Rr','Lm','Llr','in_flux'};
        config(6.0).smlnkIdx = [1.0 1.0 1.0 2.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0];
        config(6.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 1.0 1.0 1.0 1.0 5.0];
        config(6.0).matlabIdx = [11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 18.0 8.0 5.0 9.0 1.0];
        config(6.0).javaTab = [3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 1.0 1.0 1.0 1.0 3.0];
        config(6.0).javaIdx = [11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 18.0 8.0 5.0 9.0 1.0];
        config(6.0).loadIdx = mtimes(3.0, ones(1.0, 9.0));
    case 'AC4'
        % 299 302
        % 300 302
        config(1.0) = getAsyncMachine;
        % 302 305
        % 303 305
        config(1.0).title = 'DTC Induction Motor Drive';
        % 305 308
        % 306 308
        config(2.0).maskType = 'Universal Bridge';
        config(2.0).tag = RECTIFIER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getRectifierVarNames(drive);
        config(2.0).smlnkIdx = [1.0 1.0 1.0 1.0];
        config(2.0).matlabCell = mtimes(2.0, ones(1.0, 4.0));
        config(2.0).matlabIdx = [3.0 4.0 1.0 2.0];
        config(2.0).javaTab = mtimes(2.0, ones(1.0, 4.0));
        config(2.0).javaIdx = [3.0 4.0 1.0 2.0];
        config(2.0).loadIdx = mtimes(2.0, ones(1.0, 4.0));
        % 317 320
        % 318 320
        config(3.0).maskType = 'Braking chopper';
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = {'cap_bus','br','freq_chop','chopa','chopd'};
        config(3.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0];
        config(3.0).matlabCell = mtimes(3.0, ones(1.0, 5.0));
        config(3.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0];
        config(3.0).javaTab = mtimes(2.0, ones(1.0, 5.0));
        config(3.0).javaIdx = [5.0 6.0 7.0 8.0 9.0];
        config(3.0).loadIdx = mtimes(2.0, ones(1.0, 5.0));
        % 328 331
        % 329 331
        config(4.0).maskType = 'Universal Bridge';
        config(4.0).tag = INVERTER;
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getInverterVarNames(drive);
        config(4.0).smlnkIdx = [1.0 1.0 1.0 2.0 1.0 2.0 1.0 2.0 1.0 1.0];
        config(4.0).matlabCell = mtimes(4.0, ones(1.0, 10.0));
        config(4.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0];
        config(4.0).javaTab = mtimes(2.0, ones(1.0, 10.0));
        config(4.0).javaIdx = [10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0];
        config(4.0).loadIdx = mtimes(2.0, ones(1.0, 10.0));
        % 340 343
        % 341 343
        config(5.0).maskType = 'Speed controller';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'p','ramp','ramp','fc','Tsc','kp','ki','ctrl_sat','ctrl_sat','SwK','nf','fn'};
        % 345 347
        config(5.0).smlnkIdx = [1.0 1.0 2.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0 1.0];
        config(5.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 1.0];
        config(5.0).matlabIdx = [14.0 2.0 1.0 3.0 4.0 5.0 6.0 7.0 8.0 14.0 11.0 4.0];
        config(5.0).javaTab = [1.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 1.0];
        config(5.0).javaIdx = [18.0 2.0 1.0 3.0 4.0 5.0 6.0 7.0 8.0 14.0 11.0 4.0];
        config(5.0).loadIdx = mtimes(3.0, ones(1.0, 9.0));
        % 352 355
        % 353 355
        config(6.0).maskType = 'DTFC';
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'T_bw','F_bw','in_flux','freq_max','Ts_DTFC','Rss','p'};
        config(6.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 1.0];
        config(6.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 1.0 1.0];
        config(6.0).matlabIdx = [9.0 10.0 11.0 12.0 13.0 6.0 18.0];
        config(6.0).javaTab = [3.0 3.0 3.0 3.0 3.0 1.0 1.0];
        config(6.0).javaIdx = [9.0 10.0 11.0 12.0 13.0 6.0 18.0];
        config(6.0).loadIdx = mtimes(3.0, ones(1.0, 5.0));
    case 'AC5'
        % 364 368
        % 365 368
        % 366 368
        config(1.0).title = 'Self-Controlled Synchronous Motor Drive';
        % 368 371
        % 369 371
        config(1.0).maskType = 'Synchronous Machine';
        config(1.0).handle = [];
        config(1.0).smlnkVarNames = {'NominalParameters','NominalParameters','NominalParameters','NominalParameters','Stator','Stator','Stator','Stator','Field','Field','Dampers1','Dampers1','Dampers1','Dampers1','Mechanical','Mechanical','Mechanical','InitialConditions','InitialConditions','InitialConditions','InitialConditions','InitialConditions','InitialConditions','InitialConditions','InitialConditions','InitialConditions'};
        % 373 381
        % 374 381
        % 375 381
        % 376 381
        % 377 381
        % 378 381
        % 379 381
        config(1.0).smlnkIdx = [1.0 2.0 3.0 4.0 1.0 2.0 3.0 4.0 1.0 2.0 1.0 2.0 3.0 4.0 1.0 2.0 3.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0];
        config(1.0).matlabCell = ones(1.0, 26.0);
        config(1.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 13.0 14.0 7.0 8.0 9.0 10.0 11.0 12.0 22.0 23.0 24.0 25.0 26.0 15.0 16.0 17.0 18.0 19.0 20.0 21.0];
        config(1.0).javaTab = ones(1.0, 26.0);
        config(1.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 6.0 13.0 14.0 7.0 8.0 9.0 10.0 11.0 12.0 22.0 23.0 24.0 25.0 26.0 15.0 16.0 17.0 18.0 19.0 20.0 21.0];
        config(1.0).loadIdx = ones(1.0, 26.0);
        % 386 389
        % 387 389
        config(2.0).maskType = 'Active rectifier';
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = {'Vgains','Vgains','fc','ctrl_sat','ctrl_sat','Tsc','h','choke','choke','cap','Snubber','Snubber','Device','Ron','ForwardVoltages','ForwardVoltages','GTOparameters','GTOparameters','IGBTparameters','IGBTparameters','Vs','SourceFrequency'};
        % 391 397
        % 392 397
        % 393 397
        % 394 397
        % 395 397
        config(2.0).smlnkIdx = [1.0 2.0 1.0 1.0 2.0 1.0 1.0 1.0 2.0 1.0 1.0 2.0 1.0 1.0 1.0 2.0 1.0 2.0 1.0 2.0 1.0 1.0];
        config(2.0).matlabCell = [6.0 6.0 6.0 6.0 6.0 6.0 6.0 3.0 3.0 3.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0];
        config(2.0).matlabIdx = [1.0 2.0 5.0 3.0 4.0 7.0 6.0 2.0 3.0 1.0 9.0 10.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 11.0 12.0];
        config(2.0).javaTab = [3.0 3.0 3.0 3.0 3.0 3.0 3.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0];
        config(2.0).javaIdx = [9.0 10.0 13.0 11.0 12.0 15.0 14.0 14.0 15.0 13.0 9.0 10.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 11.0 12.0];
        config(2.0).loadIdx = [3.0 3.0 3.0 3.0 3.0 3.0 3.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0];
        % 402 405
        % 403 405
        config(3.0).maskType = 'SPSdrives Converter';
        config(3.0).tag = INVERTER;
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = getInverterVarNames(drive);
        config(3.0).smlnkIdx = [1.0 1.0 1.0 2.0 1.0 2.0 1.0 2.0 1.0 1.0 1.0 1.0 2.0 3.0 4.0 1.0];
        config(3.0).matlabCell = [4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 2.0 1.0 1.0 1.0 1.0 1.0];
        config(3.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 12.0 5.0 6.0 13.0 14.0 24.0];
        config(3.0).javaTab = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 1.0 1.0 1.0 1.0 1.0];
        config(3.0).javaIdx = [16.0 17.0 18.0 19.0 20.0 21.0 22.0 23.0 24.0 25.0 12.0 5.0 6.0 13.0 14.0 24.0];
        config(3.0).loadIdx = mtimes(2.0, ones(1.0, 10.0));
        % 414 417
        % 415 417
        config(4.0).maskType = 'Speed controller';
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = {'ramp','ramp','kp','ki','fc','Tsc','ctrl_sat','ctrl_sat','SwK','p','nf','fn'};
        % 419 422
        % 420 422
        config(4.0).smlnkIdx = [2.0 1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0 1.0 1.0];
        config(4.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 7.0 1.0 7.0 1.0];
        config(4.0).matlabIdx = [1.0 2.0 3.0 4.0 7.0 8.0 5.0 6.0 14.0 24.0 12.0 3.0];
        config(4.0).javaTab = [3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 1.0 3.0 1.0];
        config(4.0).javaIdx = [1.0 2.0 3.0 4.0 7.0 8.0 5.0 6.0 29.0 24.0 27.0 3.0];
        config(4.0).loadIdx = mtimes(3.0, ones(1.0, 10.0));
        % 427 430
        % 428 430
        config(5.0).maskType = 'Vector controller';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'h','kpfl','kifl','flc_lpf','flc_sat','flc_sat','mag_v','mag_hvt','fnv','daf','Tvect','Rs','mag_tot','p'};
        % 432 435
        % 433 435
        config(5.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0];
        config(5.0).matlabCell = [7.0 7.0 7.0 7.0 7.0 7.0 7.0 7.0 7.0 7.0 7.0 1.0 7.0 1.0];
        config(5.0).matlabIdx = [9.0 1.0 2.0 5.0 3.0 4.0 6.0 7.0 8.0 10.0 11.0 5.0 13.0 24.0];
        config(5.0).javaTab = [3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 1.0 3.0 1.0];
        config(5.0).javaIdx = [24.0 16.0 17.0 20.0 18.0 19.0 21.0 22.0 23.0 25.0 26.0 5.0 28.0 24.0];
        config(5.0).loadIdx = mtimes(3.0, ones(1.0, 12.0));
    case {'AC6','AC7'}
        % 441 445
        % 442 445
        % 443 445
        if strcmp(drive, 'AC6')
            config(1.0).title = 'PM Synchronous Motor Drive';
        else
            % 447 449
            config(1.0).title = 'Brushless DC Motor Drive';
        end % if
        % 450 453
        % 451 453
        config(1.0).maskType = 'Permanent Magnet Synchronous Machine';
        if strcmp(drive, 'AC6')
            config(1.0).smlnkVarNames = {'Resistance','dqInductances','dqInductances','Flux','Mechanical','Mechanical','Mechanical'};
            % 455 457
            config(1.0).smlnkIdx = [1.0 1.0 2.0 1.0 1.0 2.0 3.0];
        else
            % 458 460
            config(1.0).smlnkVarNames = {'Resistance','Inductance','Flat','Flux','Mechanical','Mechanical','Mechanical'};
            % 460 462
            config(1.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 2.0 3.0];
        end % if
        config(1.0).handle = [];
        config(1.0).matlabCell = ones(1.0, 7.0);
        config(1.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0];
        config(1.0).javaTab = ones(1.0, 7.0);
        config(1.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0];
        config(1.0).loadIdx = ones(1.0, 7.0);
        % 469 472
        % 470 472
        config(2.0).maskType = 'Universal Bridge';
        config(2.0).tag = RECTIFIER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getRectifierVarNames(drive);
        config(2.0).smlnkIdx = [1.0 1.0 1.0 1.0];
        config(2.0).matlabCell = mtimes(2.0, ones(1.0, 4.0));
        config(2.0).matlabIdx = [1.0 2.0 3.0 4.0];
        config(2.0).javaTab = mtimes(2.0, ones(1.0, 4.0));
        config(2.0).javaIdx = [1.0 2.0 3.0 4.0];
        config(2.0).loadIdx = mtimes(2.0, ones(1.0, 4.0));
        % 481 484
        % 482 484
        config(3.0).maskType = 'Braking chopper';
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = {'cap_bus','br','freq_chop','chopa','chopd'};
        config(3.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0];
        config(3.0).matlabCell = mtimes(3.0, ones(1.0, 5.0));
        config(3.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0];
        config(3.0).javaTab = mtimes(2.0, ones(1.0, 5.0));
        config(3.0).javaIdx = [5.0 6.0 7.0 8.0 9.0];
        config(3.0).loadIdx = mtimes(2.0, ones(1.0, 5.0));
        % 492 495
        % 493 495
        config(4.0).maskType = 'SPSdrives Converter';
        config(4.0).tag = INVERTER;
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getInverterVarNames(drive);
        % 498 512
        % 499 512
        % 500 512
        % 501 512
        % 502 512
        % 503 512
        % 504 512
        % 505 512
        % 506 512
        % 507 512
        % 508 512
        % 509 512
        % 510 512
        if strcmp(drive, 'AC6')
            config(4.0).smlnkIdx = [1.0 1.0 1.0 2.0 1.0 2.0 1.0 2.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0 1.0];
            config(4.0).matlabCell = [4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 1.0 1.0 1.0 1.0 1.0];
            config(4.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 2.0 3.0 4.0 1.0 7.0];
            config(4.0).javaTab = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 1.0 1.0 1.0 1.0 1.0];
            config(4.0).javaIdx = [10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0 20.0 2.0 3.0 4.0 1.0 7.0];
            config(4.0).loadIdx = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0];
        else
            % 519 521
            config(4.0).smlnkIdx = [1.0 1.0 1.0 2.0 1.0 2.0 1.0 2.0 1.0 1.0 1.0 1.0 1.0];
            config(4.0).matlabCell = [4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 4.0 1.0 1.0 1.0];
            config(4.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 2.0 4.0 1.0];
            config(4.0).javaTab = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 1.0 1.0 1.0];
            config(4.0).javaIdx = [10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0 2.0 4.0 1.0];
            config(4.0).loadIdx = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0];
            % 526 528
        end % if
        % 528 531
        % 529 531
        config(5.0).maskType = 'Speed controller';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'ramp','ramp','kp','ki','fc','Tsc','ctrl_sat','ctrl_sat','SwK'};
        config(5.0).smlnkIdx = [2.0 1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0];
        config(5.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0];
        config(5.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 12.0];
        config(5.0).javaTab = [3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0 3.0];
        config(5.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 12.0];
        config(5.0).loadIdx = mtimes(3.0, ones(1.0, 9.0));
        % 539 542
        % 540 542
        if strcmp(drive, 'AC6')
            config(6.0).maskType = 'VECT';
        else
            config(6.0).maskType = 'Current Controller';
        end % if
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'h','Ts_vect','freq_max','nb_p','lambda'};
        config(6.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0];
        config(6.0).matlabCell = [5.0 5.0 5.0 1.0 1.0];
        config(6.0).matlabIdx = [10.0 9.0 11.0 7.0 4.0];
        config(6.0).javaTab = [3.0 3.0 3.0 1.0 1.0];
        config(6.0).javaIdx = [10.0 9.0 11.0 7.0 4.0];
        config(6.0).loadIdx = mtimes(3.0, ones(1.0, 3.0));
    case 'DC1'
        % 555 558
        % 556 558
        config(1.0) = getDcMachine;
        % 558 561
        % 559 561
        config(1.0).title = '2-Quadrant Single-Phase Recifier DC Motor Drive';
        % 561 564
        % 562 564
        config(2.0).maskType = 'SPSdrives Converter';
        config(2.0).tag = RECTIFIER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getRectifierVarNames(drive);
        config(2.0).smlnkIdx = ones(1.0, 9.0);
        config(2.0).matlabCell = [2.0 2.0 2.0 2.0 3.0 3.0 3.0 3.0 5.0];
        config(2.0).matlabIdx = [1.0 2.0 3.0 4.0 3.0 4.0 5.0 6.0 1.0];
        config(2.0).javaTab = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 3.0];
        config(2.0).javaIdx = [1.0 2.0 3.0 4.0 7.0 8.0 9.0 10.0 8.0];
        config(2.0).loadIdx = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0];
        % 573 576
        % 574 576
        config(3.0).maskType = 'Parallel RLC Branch';
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = getRLCvarNames(drive);
        config(3.0).smlnkIdx = 1.0;
        config(3.0).matlabCell = 3.0;
        config(3.0).matlabIdx = 1.0;
        config(3.0).javaTab = 2.0;
        config(3.0).javaIdx = 5.0;
        config(3.0).loadIdx = 2.0;
        % 584 587
        % 585 587
        config(4.0).maskType = 'DC Voltage Source';
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getDCsourceVarNames(drive);
        config(4.0).smlnkIdx = 1.0;
        config(4.0).matlabCell = 3.0;
        config(4.0).matlabIdx = 2.0;
        config(4.0).javaTab = 2.0;
        config(4.0).javaIdx = 6.0;
        config(4.0).loadIdx = 2.0;
        % 595 598
        % 596 598
        config(5.0).maskType = 'Regulation switch';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'SwK','P','V','Laf','lim','sampling'};
        config(5.0).smlnkIdx = ones([1.0 2.0 3.0 4.0 5.0 6.0]);
        config(5.0).matlabCell = [6.0 5.0 5.0 1.0 5.0 6.0];
        config(5.0).matlabIdx = [6.0 1.0 2.0 1.0 6.0 5.0];
        config(5.0).javaTab = [3.0 3.0 3.0 1.0 3.0 3.0];
        config(5.0).javaIdx = [19.0 8.0 9.0 1.0 13.0 18.0];
        config(5.0).loadIdx = [3.0 3.0];
        % 606 609
        % 607 609
        config(6.0).maskType = 'Speed controller';
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'wb','Is','fcw','kp','ki','ramp','ramp','lim','sampling'};
        config(6.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0];
        config(6.0).matlabCell = [4.0 4.0 4.0 4.0 4.0 4.0 4.0 5.0 6.0];
        config(6.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 6.0 5.0];
        config(6.0).javaTab = mtimes(3.0, ones(1.0, 9.0));
        config(6.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 13.0 18.0];
        config(6.0).loadIdx = mtimes(3.0, ones(1.0, 8.0));
        % 617 620
        % 618 620
        config(7.0).maskType = 'Current controller';
        config(7.0).handle = [];
        config(7.0).smlnkVarNames = {'Pb','Vb','kp','ki','fci','lim','lim','sampling'};
        config(7.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0];
        config(7.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 6.0 6.0 6.0];
        config(7.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 1.0 2.0 5.0];
        config(7.0).javaTab = mtimes(3.0, ones(1.0, 8.0));
        config(7.0).javaIdx = [8.0 9.0 10.0 11.0 12.0 14.0 15.0 18.0];
        config(7.0).loadIdx = mtimes(3.0, ones(1.0, 7.0));
        % 628 631
        % 629 631
        config(8.0).maskType = 'Bridge firing unit';
        config(8.0).handle = [];
        config(8.0).smlnkVarNames = {'x4','x9'};
        config(8.0).smlnkIdx = [1.0 1.0];
        config(8.0).matlabCell = [6.0 6.0];
        config(8.0).matlabIdx = [3.0 4.0];
        config(8.0).javaTab = [3.0 3.0];
        config(8.0).javaIdx = [16.0 17.0];
        config(8.0).loadIdx = mtimes(3.0, ones(1.0, 2.0));
    case 'DC2'
        % 640 643
        % 641 643
        config(1.0) = getDcMachine;
        % 643 646
        % 644 646
        config(1.0).title = '4-Quadrant Single-Phase Recifier DC Motor Drive';
        % 646 649
        % 647 649
        config(2.0).maskType = 'SPSdrives Converter';
        config(2.0).tag = RECTIFIER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getRectifierVarNames(drive);
        config(2.0).smlnkIdx = ones(1.0, 10.0);
        config(2.0).matlabCell = [2.0 2.0 2.0 2.0 4.0 4.0 4.0 4.0 4.0 6.0];
        config(2.0).matlabIdx = [1.0 2.0 3.0 4.0 4.0 5.0 6.0 7.0 3.0 1.0];
        config(2.0).javaTab = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 3.0];
        config(2.0).javaIdx = [1.0 2.0 3.0 4.0 12.0 13.0 14.0 15.0 11.0 8.0];
        % 657 660
        % 658 660
        config(2.0).loadIdx = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0];
        % 660 663
        % 661 663
        config(3.0).maskType = 'SPSdrives Converter';
        config(3.0).tag = INVERTER;
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = getInverterVarNames(drive);
        config(3.0).smlnkIdx = ones(1.0, 10.0);
        config(3.0).matlabCell = [3.0 3.0 3.0 3.0 4.0 4.0 4.0 4.0 4.0 6.0];
        config(3.0).matlabIdx = [1.0 2.0 3.0 4.0 4.0 5.0 6.0 7.0 3.0 1.0];
        config(3.0).javaTab = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 3.0];
        config(3.0).javaIdx = [5.0 6.0 7.0 8.0 12.0 13.0 14.0 15.0 11.0 8.0];
        config(3.0).loadIdx = [2.0 2.0 2.0 2.0];
        % 672 675
        % 673 675
        config(4.0).maskType = 'Parallel RLC Branch';
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getRLCvarNames(drive);
        config(4.0).smlnkIdx = 1.0;
        config(4.0).matlabCell = 4.0;
        config(4.0).matlabIdx = 1.0;
        config(4.0).javaTab = 2.0;
        config(4.0).javaIdx = 9.0;
        config(4.0).loadIdx = 2.0;
        % 683 686
        % 684 686
        config(5.0).maskType = 'DC Voltage Source';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = getDCsourceVarNames(drive);
        config(5.0).smlnkIdx = 1.0;
        config(5.0).matlabCell = 4.0;
        config(5.0).matlabIdx = 2.0;
        config(5.0).javaTab = 2.0;
        config(5.0).javaIdx = 10.0;
        config(5.0).loadIdx = 2.0;
        % 694 697
        % 695 697
        config(6.0).maskType = 'Circulating current inductors';
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'H'};
        config(6.0).smlnkIdx = 1.0;
        config(6.0).matlabCell = 4.0;
        config(6.0).matlabIdx = 3.0;
        config(6.0).javaTab = 2.0;
        config(6.0).javaIdx = 11.0;
        config(6.0).loadIdx = 2.0;
        % 705 708
        % 706 708
        config(7.0).maskType = 'Regulation switch';
        config(7.0).handle = [];
        config(7.0).smlnkVarNames = {'SwK','P','V','Laf','lim','sampling'};
        config(7.0).smlnkIdx = ones([1.0 2.0 3.0 4.0 5.0 6.0]);
        config(7.0).matlabCell = [7.0 6.0 6.0 1.0 6.0 7.0];
        config(7.0).matlabIdx = [6.0 1.0 2.0 1.0 6.0 5.0];
        config(7.0).javaTab = [3.0 3.0 3.0 1.0 3.0 3.0];
        config(7.0).javaIdx = [19.0 8.0 9.0 1.0 13.0 18.0];
        config(7.0).loadIdx = [3.0 3.0];
        % 716 719
        % 717 719
        config(8.0).maskType = 'Speed controller';
        config(8.0).handle = [];
        config(8.0).smlnkVarNames = {'wb','Is','fcw','kp','ki','ramp','ramp','lim','sampling'};
        config(8.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0];
        config(8.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 5.0 5.0 6.0 7.0];
        config(8.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 6.0 5.0];
        config(8.0).javaTab = mtimes(3.0, ones(1.0, 9.0));
        config(8.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 13.0 18.0];
        config(8.0).loadIdx = mtimes(3.0, ones(1.0, 8.0));
        % 727 730
        % 728 730
        config(9.0).maskType = 'Current controller';
        config(9.0).handle = [];
        config(9.0).smlnkVarNames = {'Pb','Vb','kp','ki','fci','lim','lim','sampling'};
        config(9.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0];
        config(9.0).matlabCell = [6.0 6.0 6.0 6.0 6.0 7.0 7.0 7.0];
        config(9.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 1.0 2.0 5.0];
        config(9.0).javaTab = mtimes(3.0, ones(1.0, 8.0));
        config(9.0).javaIdx = [8.0 9.0 10.0 11.0 12.0 14.0 15.0 18.0];
        config(9.0).loadIdx = mtimes(3.0, ones(1.0, 7.0));
        % 738 741
        % 739 741
        config(10.0).maskType = 'Bridge firing unit';
        config(10.0).handle = [];
        config(10.0).smlnkVarNames = {'x4','x9'};
        config(10.0).smlnkIdx = [1.0 1.0];
        config(10.0).matlabCell = [7.0 7.0];
        config(10.0).matlabIdx = [3.0 4.0];
        config(10.0).javaTab = [3.0 3.0];
        config(10.0).javaIdx = [16.0 17.0];
        config(10.0).loadIdx = mtimes(3.0, ones(1.0, 2.0));
    case 'DC3'
        % 750 753
        % 751 753
        config(1.0) = getDcMachine;
        % 753 756
        % 754 756
        config(1.0).title = '2-Quadrant Three-Phase Recifier DC Motor Drive';
        % 756 760
        % 757 760
        % 758 760
        config(2.0).maskType = 'SPSdrives Converter';
        % 760 762
        config(2.0).tag = RECTIFIER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getRectifierVarNames(drive);
        % 764 775
        % 765 775
        % 766 775
        % 767 775
        % 768 775
        % 769 775
        % 770 775
        % 771 775
        % 772 775
        % 773 775
        config(2.0).smlnkIdx = ones(1.0, 9.0);
        config(2.0).matlabCell = [2.0 2.0 2.0 2.0 3.0 3.0 3.0 3.0 5.0];
        config(2.0).matlabIdx = [1.0 2.0 3.0 4.0 3.0 4.0 5.0 6.0 1.0];
        config(2.0).javaTab = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 3.0];
        config(2.0).javaIdx = [1.0 2.0 3.0 4.0 7.0 8.0 9.0 10.0 8.0];
        config(2.0).loadIdx = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0];
        % 780 783
        % 781 783
        config(3.0).maskType = 'Parallel RLC Branch';
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = getRLCvarNames(drive);
        config(3.0).smlnkIdx = 1.0;
        config(3.0).matlabCell = 3.0;
        config(3.0).matlabIdx = 1.0;
        config(3.0).javaTab = 2.0;
        config(3.0).javaIdx = 5.0;
        config(3.0).loadIdx = 2.0;
        % 791 794
        % 792 794
        config(4.0).maskType = 'DC Voltage Source';
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getDCsourceVarNames(drive);
        config(4.0).smlnkIdx = 1.0;
        config(4.0).matlabCell = 3.0;
        config(4.0).matlabIdx = 2.0;
        config(4.0).javaTab = 2.0;
        config(4.0).javaIdx = 6.0;
        config(4.0).loadIdx = 2.0;
        % 802 805
        % 803 805
        config(5.0).maskType = 'Regulation switch';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'SwK','P','V','Laf','lim','sampling'};
        config(5.0).smlnkIdx = ones([1.0 2.0 3.0 4.0 5.0 6.0]);
        config(5.0).matlabCell = [6.0 5.0 5.0 1.0 5.0 6.0];
        config(5.0).matlabIdx = [6.0 1.0 2.0 1.0 6.0 5.0];
        config(5.0).javaTab = [3.0 3.0 3.0 1.0 3.0 3.0];
        config(5.0).javaIdx = [19.0 8.0 9.0 1.0 13.0 18.0];
        config(5.0).loadIdx = [3.0 3.0];
        % 813 816
        % 814 816
        config(6.0).maskType = 'Speed controller';
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'wb','Is','fcw','kp','ki','ramp','ramp','lim','sampling'};
        config(6.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0];
        config(6.0).matlabCell = [4.0 4.0 4.0 4.0 4.0 4.0 4.0 5.0 6.0];
        config(6.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 6.0 5.0];
        config(6.0).javaTab = mtimes(3.0, ones(1.0, 9.0));
        config(6.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 13.0 18.0];
        config(6.0).loadIdx = mtimes(3.0, ones(1.0, 8.0));
        % 824 827
        % 825 827
        config(7.0).maskType = 'Current controller';
        config(7.0).handle = [];
        config(7.0).smlnkVarNames = {'Pb','Vb','kp','ki','fci','lim','lim','sampling'};
        config(7.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0];
        config(7.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 6.0 6.0 6.0];
        config(7.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 1.0 2.0 5.0];
        config(7.0).javaTab = mtimes(3.0, ones(1.0, 8.0));
        config(7.0).javaIdx = [8.0 9.0 10.0 11.0 12.0 14.0 15.0 18.0];
        config(7.0).loadIdx = mtimes(3.0, ones(1.0, 7.0));
        % 835 838
        % 836 838
        config(8.0).maskType = 'Bridge firing unit';
        config(8.0).handle = [];
        config(8.0).smlnkVarNames = {'x4','x9'};
        config(8.0).smlnkIdx = [1.0 1.0];
        config(8.0).matlabCell = [6.0 6.0];
        config(8.0).matlabIdx = [3.0 4.0];
        config(8.0).javaTab = [3.0 3.0];
        config(8.0).javaIdx = [16.0 17.0];
        config(8.0).loadIdx = mtimes(3.0, ones(1.0, 2.0));
    case 'DC4'
        % 847 850
        % 848 850
        config(1.0) = getDcMachine;
        % 850 853
        % 851 853
        config(1.0).title = '4-Quadrant Three-Phase Recifier DC Motor Drive';
        % 853 856
        % 854 856
        config(2.0).maskType = 'SPSdrives Converter';
        config(2.0).tag = RECTIFIER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getRectifierVarNames(drive);
        config(2.0).smlnkIdx = ones(1.0, 10.0);
        config(2.0).matlabCell = [2.0 2.0 2.0 2.0 4.0 4.0 4.0 4.0 4.0 6.0];
        config(2.0).matlabIdx = [1.0 2.0 3.0 4.0 3.0 4.0 5.0 6.0 2.0 1.0];
        config(2.0).javaTab = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 3.0];
        config(2.0).javaIdx = [1.0 2.0 3.0 4.0 11.0 12.0 13.0 14.0 10.0 8.0];
        % 864 867
        % 865 867
        config(2.0).loadIdx = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0];
        % 867 870
        % 868 870
        config(3.0).maskType = 'SPSdrives Converter';
        config(3.0).tag = INVERTER;
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = getInverterVarNames(drive);
        config(3.0).smlnkIdx = ones(1.0, 10.0);
        config(3.0).matlabCell = [3.0 3.0 3.0 3.0 4.0 4.0 4.0 4.0 4.0 6.0];
        config(3.0).matlabIdx = [1.0 2.0 3.0 4.0 3.0 4.0 5.0 6.0 2.0 1.0];
        config(3.0).javaTab = [2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 3.0];
        config(3.0).javaIdx = [5.0 6.0 7.0 8.0 11.0 12.0 13.0 14.0 10.0 8.0];
        config(3.0).loadIdx = [2.0 2.0 2.0 2.0];
        % 879 882
        % 880 882
        config(4.0).maskType = 'DC Voltage Source';
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getDCsourceVarNames(drive);
        config(4.0).smlnkIdx = 1.0;
        config(4.0).matlabCell = 4.0;
        config(4.0).matlabIdx = 1.0;
        config(4.0).javaTab = 2.0;
        config(4.0).javaIdx = 9.0;
        config(4.0).loadIdx = 2.0;
        % 890 893
        % 891 893
        config(5.0).maskType = 'Circulating current inductors';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'H'};
        config(5.0).smlnkIdx = 1.0;
        config(5.0).matlabCell = 4.0;
        config(5.0).matlabIdx = 2.0;
        config(5.0).javaTab = 2.0;
        config(5.0).javaIdx = 10.0;
        config(5.0).loadIdx = 2.0;
        % 901 904
        % 902 904
        config(6.0).maskType = 'Regulation switch';
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'SwK','P','V','Laf','lim','sampling'};
        config(6.0).smlnkIdx = ones([1.0 2.0 3.0 4.0 5.0 6.0]);
        config(6.0).matlabCell = [7.0 6.0 6.0 1.0 6.0 7.0];
        config(6.0).matlabIdx = [6.0 1.0 2.0 1.0 6.0 5.0];
        config(6.0).javaTab = [3.0 3.0 3.0 1.0 3.0 3.0];
        config(6.0).javaIdx = [19.0 8.0 9.0 1.0 13.0 18.0];
        config(6.0).loadIdx = [3.0 3.0];
        % 912 915
        % 913 915
        config(7.0).maskType = 'Speed controller';
        config(7.0).handle = [];
        config(7.0).smlnkVarNames = {'wb','Is','fcw','kp','ki','ramp','ramp','lim','sampling'};
        config(7.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0];
        config(7.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 5.0 5.0 6.0 7.0];
        config(7.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 6.0 5.0];
        config(7.0).javaTab = mtimes(3.0, ones(1.0, 9.0));
        config(7.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 13.0 18.0];
        config(7.0).loadIdx = mtimes(3.0, ones(1.0, 8.0));
        % 923 926
        % 924 926
        config(8.0).maskType = 'Current controller';
        config(8.0).handle = [];
        config(8.0).smlnkVarNames = {'Pb','Vb','kp','ki','fci','lim','lim','sampling'};
        config(8.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0];
        config(8.0).matlabCell = [6.0 6.0 6.0 6.0 6.0 7.0 7.0 7.0];
        config(8.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 1.0 2.0 5.0];
        config(8.0).javaTab = mtimes(3.0, ones(1.0, 8.0));
        config(8.0).javaIdx = [8.0 9.0 10.0 11.0 12.0 14.0 15.0 18.0];
        config(8.0).loadIdx = mtimes(3.0, ones(1.0, 7.0));
        % 934 937
        % 935 937
        config(9.0).maskType = 'Bridge firing unit';
        config(9.0).handle = [];
        config(9.0).smlnkVarNames = {'x4','x9'};
        config(9.0).smlnkIdx = [1.0 1.0];
        config(9.0).matlabCell = [7.0 7.0];
        config(9.0).matlabIdx = [3.0 4.0];
        config(9.0).javaTab = [3.0 3.0];
        config(9.0).javaIdx = [16.0 17.0];
        config(9.0).loadIdx = mtimes(3.0, ones(1.0, 2.0));
    case 'DC5'
        % 946 949
        % 947 949
        config(1.0) = getDcMachine;
        % 949 952
        % 950 952
        config(1.0).title = '1-Quadrant Chopper DC Motor Drive';
        % 952 955
        % 953 955
        config(2.0).maskType = 'SPSdrives Converter';
        config(2.0).tag = INVERTER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getInverterVarNames(drive);
        config(2.0).smlnkIdx = [1.0 1.0 1.0 1.0 2.0 1.0 2.0];
        config(2.0).matlabCell = mtimes(2.0, ones(1.0, 7.0));
        config(2.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0];
        config(2.0).javaTab = mtimes(2.0, ones(1.0, 7.0));
        config(2.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0];
        config(2.0).loadIdx = mtimes(2.0, ones(1.0, 7.0));
        % 964 967
        % 965 967
        config(3.0).maskType = 'Parallel RLC Branch';
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = getRLCvarNames(drive);
        config(3.0).smlnkIdx = 1.0;
        config(3.0).matlabCell = 3.0;
        config(3.0).matlabIdx = 1.0;
        config(3.0).javaTab = 2.0;
        config(3.0).javaIdx = 8.0;
        config(3.0).loadIdx = 2.0;
        % 975 978
        % 976 978
        config(4.0).maskType = 'DC Voltage Source';
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getDCsourceVarNames(drive);
        config(4.0).smlnkIdx = 1.0;
        config(4.0).matlabCell = 3.0;
        config(4.0).matlabIdx = 2.0;
        config(4.0).javaTab = 2.0;
        config(4.0).javaIdx = 9.0;
        config(4.0).loadIdx = 2.0;
        % 986 989
        % 987 989
        config(5.0).maskType = 'Regulation switch';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'SwK','P','V','Laf','lim','current_sampling'};
        config(5.0).smlnkIdx = ones([1.0 2.0 3.0 4.0 5.0 6.0]);
        config(5.0).matlabCell = [5.0 5.0 5.0 1.0 5.0 5.0];
        config(5.0).matlabIdx = [9.0 1.0 2.0 1.0 6.0 7.0];
        config(5.0).javaTab = [3.0 3.0 3.0 1.0 3.0 3.0];
        config(5.0).javaIdx = [17.0 9.0 10.0 1.0 14.0 15.0];
        config(5.0).loadIdx = 3.0;
        % 997 1000
        % 998 1000
        config(6.0).maskType = 'Speed controller';
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'wb','Is','fcw','kp','ki','ramp','ramp','lim','speed_sampling'};
        config(6.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0];
        config(6.0).matlabCell = [4.0 4.0 4.0 4.0 4.0 4.0 4.0 5.0 4.0];
        config(6.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 6.0 8.0];
        config(6.0).javaTab = mtimes(3.0, ones(1.0, 9.0));
        config(6.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 14.0 8.0];
        config(6.0).loadIdx = mtimes(3.0, ones(1.0, 9.0));
        % 1008 1011
        % 1009 1011
        config(7.0).maskType = 'Current controller';
        config(7.0).handle = [];
        config(7.0).smlnkVarNames = {'Pb','Vb','kp','ki','fci','current_sampling','F'};
        config(7.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 1.0];
        config(7.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 5.0 5.0];
        config(7.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 7.0 8.0];
        config(7.0).javaTab = mtimes(3.0, ones(1.0, 7.0));
        config(7.0).javaIdx = [9.0 10.0 11.0 12.0 13.0 15.0 16.0];
        config(7.0).loadIdx = mtimes(3.0, ones(1.0, 7.0));
    case 'DC6'
        % 1020 1023
        % 1021 1023
        config(1.0) = getDcMachine;
        % 1023 1026
        % 1024 1026
        config(1.0).title = '2-Quadrant Chopper DC Motor Drive';
        % 1026 1029
        % 1027 1029
        config(2.0).maskType = 'SPSdrives Converter';
        config(2.0).tag = INVERTER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getInverterVarNames(drive);
        config(2.0).smlnkIdx = [1.0 1.0 1.0 1.0 2.0 1.0 2.0];
        config(2.0).matlabCell = mtimes(2.0, ones(1.0, 7.0));
        config(2.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0];
        config(2.0).javaTab = mtimes(2.0, ones(1.0, 7.0));
        config(2.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0];
        config(2.0).loadIdx = mtimes(2.0, ones(1.0, 7.0));
        % 1038 1041
        % 1039 1041
        config(3.0).maskType = 'Parallel RLC Branch';
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = getRLCvarNames(drive);
        config(3.0).smlnkIdx = 1.0;
        config(3.0).matlabCell = 3.0;
        config(3.0).matlabIdx = 1.0;
        config(3.0).javaTab = 2.0;
        config(3.0).javaIdx = 8.0;
        config(3.0).loadIdx = 2.0;
        % 1049 1052
        % 1050 1052
        config(4.0).maskType = 'DC Voltage Source';
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getDCsourceVarNames(drive);
        config(4.0).smlnkIdx = 1.0;
        config(4.0).matlabCell = 3.0;
        config(4.0).matlabIdx = 2.0;
        config(4.0).javaTab = 2.0;
        config(4.0).javaIdx = 9.0;
        config(4.0).loadIdx = 2.0;
        % 1060 1063
        % 1061 1063
        config(5.0).maskType = 'Regulation switch';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'SwK','P','V','Laf','lim','current_sampling','Ra','Ron','Von'};
        config(5.0).smlnkIdx = ones([1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0]);
        config(5.0).matlabCell = [5.0 5.0 5.0 1.0 5.0 5.0 1.0 2.0 2.0];
        config(5.0).matlabIdx = [9.0 1.0 2.0 1.0 6.0 7.0 2.0 3.0 4.0];
        config(5.0).javaTab = [3.0 3.0 3.0 1.0 3.0 3.0 1.0 2.0 2.0];
        config(5.0).javaIdx = [17.0 9.0 10.0 1.0 14.0 15.0 2.0 3.0 4.0];
        config(5.0).loadIdx = 3.0;
        % 1071 1074
        % 1072 1074
        config(6.0).maskType = 'Speed controller';
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'wb','Is','fcw','kp','ki','ramp','ramp','lim','speed_sampling'};
        config(6.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0];
        config(6.0).matlabCell = [4.0 4.0 4.0 4.0 4.0 4.0 4.0 5.0 4.0];
        config(6.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 6.0 8.0];
        config(6.0).javaTab = mtimes(3.0, ones(1.0, 9.0));
        config(6.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 14.0 8.0];
        config(6.0).loadIdx = mtimes(3.0, ones(1.0, 9.0));
        % 1082 1085
        % 1083 1085
        config(7.0).maskType = 'Current controller';
        config(7.0).handle = [];
        config(7.0).smlnkVarNames = {'Pb','Vb','kp','ki','fci','current_sampling','F'};
        config(7.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 1.0];
        config(7.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 5.0 5.0];
        config(7.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 7.0 8.0];
        config(7.0).javaTab = mtimes(3.0, ones(1.0, 7.0));
        config(7.0).javaIdx = [9.0 10.0 11.0 12.0 13.0 15.0 16.0];
        config(7.0).loadIdx = mtimes(3.0, ones(1.0, 7.0));
    case 'DC7'
        % 1094 1097
        % 1095 1097
        config(1.0) = getDcMachine;
        % 1097 1100
        % 1098 1100
        config(1.0).title = '4-Quadrant Chopper DC Motor Drive';
        % 1100 1103
        % 1101 1103
        config(2.0).maskType = 'SPSdrives Converter';
        config(2.0).tag = INVERTER;
        config(2.0).handle = [];
        config(2.0).smlnkVarNames = getInverterVarNames(drive);
        config(2.0).smlnkIdx = [1.0 1.0 1.0 1.0 2.0 1.0 2.0];
        config(2.0).matlabCell = mtimes(2.0, ones(1.0, 7.0));
        config(2.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0];
        config(2.0).javaTab = mtimes(2.0, ones(1.0, 7.0));
        config(2.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0];
        config(2.0).loadIdx = mtimes(2.0, ones(1.0, 7.0));
        % 1112 1115
        % 1113 1115
        config(3.0).maskType = 'Parallel RLC Branch';
        config(3.0).handle = [];
        config(3.0).smlnkVarNames = getRLCvarNames(drive);
        config(3.0).smlnkIdx = 1.0;
        config(3.0).matlabCell = 3.0;
        config(3.0).matlabIdx = 1.0;
        config(3.0).javaTab = 2.0;
        config(3.0).javaIdx = 8.0;
        config(3.0).loadIdx = 2.0;
        % 1123 1126
        % 1124 1126
        config(4.0).maskType = 'DC Voltage Source';
        config(4.0).handle = [];
        config(4.0).smlnkVarNames = getDCsourceVarNames(drive);
        config(4.0).smlnkIdx = 1.0;
        config(4.0).matlabCell = 3.0;
        config(4.0).matlabIdx = 2.0;
        config(4.0).javaTab = 2.0;
        config(4.0).javaIdx = 9.0;
        config(4.0).loadIdx = 2.0;
        % 1134 1137
        % 1135 1137
        config(5.0).maskType = 'Regulation switch';
        config(5.0).handle = [];
        config(5.0).smlnkVarNames = {'SwK','P','V','Laf','lim','current_sampling'};
        config(5.0).smlnkIdx = ones([1.0 2.0 3.0 4.0 5.0 6.0]);
        config(5.0).matlabCell = [5.0 5.0 5.0 1.0 5.0 5.0];
        config(5.0).matlabIdx = [9.0 1.0 2.0 1.0 6.0 7.0];
        config(5.0).javaTab = [3.0 3.0 3.0 1.0 3.0 3.0];
        config(5.0).javaIdx = [17.0 9.0 10.0 1.0 14.0 15.0];
        config(5.0).loadIdx = 3.0;
        % 1145 1148
        % 1146 1148
        config(6.0).maskType = 'Speed controller';
        config(6.0).handle = [];
        config(6.0).smlnkVarNames = {'wb','Is','fcw','kp','ki','ramp','ramp','lim','speed_sampling'};
        config(6.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 2.0 1.0 1.0];
        config(6.0).matlabCell = [4.0 4.0 4.0 4.0 4.0 4.0 4.0 5.0 4.0];
        config(6.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 6.0 8.0];
        config(6.0).javaTab = mtimes(3.0, ones(1.0, 9.0));
        config(6.0).javaIdx = [1.0 2.0 3.0 4.0 5.0 7.0 6.0 14.0 8.0];
        config(6.0).loadIdx = mtimes(3.0, ones(1.0, 9.0));
        % 1156 1159
        % 1157 1159
        config(7.0).maskType = 'Current controller';
        config(7.0).handle = [];
        config(7.0).smlnkVarNames = {'Pb','Vb','kp','ki','fci','current_sampling','F'};
        config(7.0).smlnkIdx = [1.0 1.0 1.0 1.0 1.0 1.0 1.0];
        config(7.0).matlabCell = [5.0 5.0 5.0 5.0 5.0 5.0 5.0];
        config(7.0).matlabIdx = [1.0 2.0 3.0 4.0 5.0 7.0 8.0];
        config(7.0).javaTab = mtimes(3.0, ones(1.0, 7.0));
        config(7.0).javaIdx = [9.0 10.0 11.0 12.0 13.0 15.0 16.0];
        config(7.0).loadIdx = mtimes(3.0, ones(1.0, 7.0));
    otherwise
        error(horzcat('Unrecognized drive name ', drive, ' in function ', mfilename, '.'));
    end % switch
function s = getAsyncMachine
    % 1171 1174
    % 1172 1174
    s.maskType = 'Asynchronous Machine';
    s.handle = [];
    s.smlnkIdx = [1.0 1.0 2.0 3.0 1.0 1.0 2.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 1.0 2.0 3.0 1.0 2.0];
    s.matlabCell = ones(1.0, 20.0);
    s.matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0 20.0];
    s.javaTab = ones(1.0, 20.0);
    s.javaIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0 20.0];
    s.loadIdx = ones(1.0, 20.0);
    s.smlnkVarNames = {'ReferenceFrame','NominalParameters','NominalParameters','NominalParameters','Lm','Stator','Stator','Rotor','Rotor','InitialConditions','InitialConditions','InitialConditions','InitialConditions','InitialConditions','InitialConditions','Mechanical','Mechanical','Mechanical','InitialConditions','InitialConditions'};
    % 1182 1188
    % 1183 1188
    % 1184 1188
    % 1185 1188
    % 1186 1188
function s = getDcMachine
    % 1188 1194
    % 1189 1194
    % 1190 1194
    % 1191 1194
    % 1192 1194
    s.maskType = 'Discrete DC machine';
    s.handle = [];
    s.smlnkVarNames = {'Laf','RLa','RLa','RLf','RLf','J','Bm','Tf','w0'};
    s.smlnkIdx = [1.0 1.0 2.0 1.0 2.0 1.0 1.0 1.0 1.0];
    s.matlabCell = ones(1.0, 9.0);
    s.matlabIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0];
    s.javaTab = ones(1.0, 9.0);
    s.javaIdx = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0];
    s.loadIdx = ones(1.0, 9.0);
function v = getRectifierVarNames(drive)
    % 1203 1206
    % 1204 1206
    switch drive
    case {'AC1','AC4'}
        v = {'Ron','ForwardVoltage','SnubberResistance','SnubberCapacitance'};
        % 1209 1211
    case {'AC2','AC3','AC6','AC7'}
        % 1210 1212
        v = {'SnubberResistance','SnubberCapacitance','Ron','ForwardVoltage'};
        % 1213 1215
    case {'DC1','DC3'}
        % 1214 1216
        v = {'SnubberResistance','SnubberCapacitance','Ron','ForwardVoltage','LineVoltage','LineFrequency','SourceInductance','initAngle','NominalPower'};
        % 1217 1219
    case {'DC2','DC4'}
        % 1218 1220
        v = {'SnubberResistance','SnubberCapacitance','Ron','ForwardVoltage','LineVoltage','LineFrequency','SourceInductance','initAngle','CirculationInductance','NominalPower'};
    otherwise
        % 1221 1224
        % 1222 1224
        % 1223 1225
        error(horzcat('Unrecognized drive ''', drive, ''' in function ', mfilename, '.'));
    end % switch
function v = getInverterVarNames(drive)
    % 1227 1230
    % 1228 1230
    switch drive
    case {'AC1','AC2','AC4'}
        v = {'Device','Ron','ForwardVoltages','ForwardVoltages','GTOparameters','GTOparameters','IGBTparameters','IGBTparameters','SnubberResistance','SnubberCapacitance'};
        % 1233 1236
        % 1234 1236
    case {'AC3'}
        % 1235 1237
        v = {'Device','Ron','ForwardVoltages','ForwardVoltages','GTOparameters','GTOparameters','IGBTparameters','IGBTparameters','SnubberResistance','SnubberCapacitance','SourceFrequency','Stator','Stator','Rotor','Rotor','Lm','p'};
        % 1238 1242
        % 1239 1242
        % 1240 1242
    case {'AC5'}
        % 1241 1243
        v = {'Device','Ron','ForwardVoltages','ForwardVoltages','GTOparameters','GTOparameters','IGBTparameters','IGBTparameters','SnubberResistance','SnubberCapacitance','SourceFrequency','Stator','Stator','Stator','Stator','p'};
        % 1244 1248
        % 1245 1248
        % 1246 1248
    case {'AC6'}
        % 1247 1249
        v = {'Device','Ron','ForwardVoltages','ForwardVoltages','GTOparameters','GTOparameters','IGBTparameters','IGBTparameters','SnubberResistance','SnubberCapacitance','SourceFrequency','dqInductances','dqInductances','Flux','Resistance','p'};
        % 1250 1254
        % 1251 1254
        % 1252 1254
    case {'AC7'}
        % 1253 1255
        v = {'Device','Ron','ForwardVoltages','ForwardVoltages','GTOparameters','GTOparameters','IGBTparameters','IGBTparameters','SnubberResistance','SnubberCapacitance','Inductance','Flux','Resistance'};
        % 1256 1260
        % 1257 1260
        % 1258 1260
    case {'DC2','DC4'}
        % 1259 1261
        v = {'SnubberResistance','SnubberCapacitance','Ron','ForwardVoltage','LineVoltage','LineFrequency','SourceInductance','initAngle','CirculationInductance','NominalPower'};
        % 1262 1265
        % 1263 1265
    case {'DC5','DC6','DC7'}
        % 1264 1266
        v = {'SnubberResistance','SnubberCapacitance','Ron','ForwardVoltages','ForwardVoltages','IGBTparameters','IGBTparameters'};
    otherwise
        % 1267 1269
        % 1268 1270
        error(horzcat('Unrecognized drive ''', drive, ''' in function ', mfilename, '.'));
    end % switch
function v = getRLCvarNames(drive)
    % 1272 1275
    % 1273 1275
    v = {'Inductance'};
function v = getDCsourceVarNames(drive)
    % 1276 1279
    % 1277 1279
    v = {'Amplitude'};
