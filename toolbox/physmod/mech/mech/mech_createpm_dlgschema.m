function schema = mech_createpm_dlgschema(hBlk)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    clsName = '';
    blockRecognized = true;
    schema = [];
    % 10 12
    paramInfo = get_param(hBlk, 'ObjectParameters');
    if not(isfield(paramInfo, 'ClassName'))
        clsName = '-';
        blockRecognized = false;
    else
        clsName = get_param(hBlk, 'ClassName');
        % 17 19
        if not(lDoesBlockHaveSchema(hBlk, clsName))
            clsName = '-';
            blockRecognized = false;
        else
            myBlder = PMDialogs.PmDlgBuilder(hBlk);
            blockRecognized = true;
        end
    end
    % 26 28
    switch clsName
    case 'SharedEnvironment'
        % 29 31
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        myBlder.Items = descPnl;
    case 'Ground'
        % 33 37
        % 34 37
        % 35 37
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        % 37 39
        editUnitPnl = PMDialogs.PmEditUnit(hBlk, xlate('Location [x,y,z]:'), 1.0, xlate('Position'), 'CoordPosition', xlate('Location Units'), 'CoordPositionUnits', mech_getDefaultUnit('lin_pos'));
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        chkPnl = PMDialogs.PmCheckBox(hBlk, xlate('Show Machine Environment port'), 'ShowEnvPort', 1.0);
        % 44 47
        % 45 47
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'));
        paramPanel.Items = horzcat(editUnitPnl, chkPnl);
        % 48 50
        myBlder.Items = horzcat(descPnl, paramPanel);
    case {'Joint','PlanarJoint','BearingJoint','InplaneJoint','CylindricalJoint'}
        % 51 55
        % 52 55
        % 53 55
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'NumSAPorts', xlate('Number of sensor / actuator ports:'));
        primPanel = MECH.PmMechJointPrimitivePanel(hBlk);
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'));
        paramPanel.Items = primPanel;
        % 59 61
        myBlder.Items = horzcat(descPnl, connPnl, paramPanel);
    case 'ScrewJoint'
        % 62 65
        % 63 65
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'NumSAPorts', xlate('Number of sensor / actuator ports:'));
        primPanel = MECH.PmMechJointPrimitivePanel(hBlk);
        % 67 69
        pitchUnitPnl = PMDialogs.PmEditUnit(hBlk, xlate('Thread pitch:'), 1.0, xlate('Pitch'), 'Pitch', xlate('displacement per revolution'), 'Units', mech_getDefaultUnit('lin_pos'));
        % 69 74
        % 70 74
        % 71 74
        % 72 74
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'));
        paramPanel.Items = horzcat(primPanel, pitchUnitPnl);
        % 75 77
        myBlder.Items = horzcat(descPnl, connPnl, paramPanel);
    case {'DisassembledCylindrical','DisassembledRevolute','DisassembledPrismatic','DisassembledSpherical'}
        % 78 81
        % 79 81
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'HIDE_SPINNER');
        % 82 84
        if not(strcmpi(clsName, 'DisassembledSpherical'))
            noCutOption = true;
            primPanel = MECH.PmMechJointPrimitivePanel(hBlk, noCutOption);
            paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'));
            paramPanel.Items = primPanel;
            myBlder.Items = horzcat(descPnl, connPnl, paramPanel);
        else
            myBlder.Items = horzcat(descPnl, connPnl);
        end
    case {'MasslessRR','MasslessRS','MasslessSS'}
        % 93 96
        % 94 96
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'HIDE_SPINNER');
        primPanel = MECH.PmMechJointPrimitivePanel(hBlk);
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'));
        paramPanel.Items = primPanel;
        % 100 102
        myBlder.Items = horzcat(descPnl, connPnl, paramPanel);
    case 'Body'
        % 103 106
        % 104 106
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        % 106 108
        massUnitPnl = PMDialogs.PmEditUnit(hBlk, xlate('Mass:'), 1.0, xlate('Mass'), 'Mass', xlate('Mass Units'), 'MassUnits', mech_getDefaultUnit('mass'));
        % 108 113
        % 109 113
        % 110 113
        % 111 113
        inertiaUnitPnl = PMDialogs.PmEditUnit(hBlk, xlate('Inertia:'), 1.0, xlate('Inertia Tensor'), 'Inertia', xlate('Inertia Units'), 'InertiaUnits', mech_getDefaultUnit('inertia'));
        % 113 118
        % 114 118
        % 115 118
        % 116 118
        massPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Mass properties'), 'VerticalAlignment');
        massPanel.Items = horzcat(massUnitPnl, inertiaUnitPnl);
        % 119 121
        framePanel = MECH.PmMechBodyCSPanel(hBlk);
        % 121 123
        myBlder.Items = horzcat(descPnl, massPanel, framePanel);
        % 124 127
        % 125 127
    case 'BodyForceElement'
        % 126 129
        % 127 129
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        % 129 131
        springConstEdt = PMDialogs.PmEditBox(hBlk, xlate('Spring constant (k):        '), 'Spring_k', 1.0);
        % 131 135
        % 132 135
        % 133 135
        dampConstEdt = PMDialogs.PmEditBox(hBlk, xlate('Damper constant (b):      '), 'Damper_b', 1.0);
        % 135 139
        % 136 139
        % 137 139
        springLenEdt = PMDialogs.PmEditBox(hBlk, xlate('Spring natural length (r0):'), 'Offset_x0', 1.0);
        % 139 143
        % 140 143
        % 141 143
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'), 'Box', '3ColLayout');
        paramPanel.Items = horzcat(springConstEdt, dampConstEdt, springLenEdt);
        % 144 146
        posUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Position:           '), 'PositionUnits', 1.0, mech_getDefaultUnit('lin_pos'));
        % 146 149
        % 147 149
        velUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Velocity:           '), 'VelocityUnits', 1.0, mech_getDefaultUnit('lin_vel'));
        % 149 152
        % 150 152
        accelUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Force:              '), 'ForceUnits', 1.0, mech_getDefaultUnit('force'));
        % 152 155
        % 153 155
        unitsPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Units'), 'Box', '3ColLayout');
        unitsPanel.Items = horzcat(posUnit, velUnit, accelUnit);
        % 156 158
        myBlder.Items = horzcat(descPnl, paramPanel, unitsPanel);
    case 'JointSpringDamper'
        % 159 162
        % 160 162
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        statePnl = MECH.PmMechJointSpringPanel(hBlk);
        myBlder.Items = horzcat(descPnl, statePnl);
        % 165 168
        % 166 168
    case 'BodyActuatorForceTorque'
        % 167 170
        % 168 170
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        % 170 172
        refSysCombo = PMDialogs.PmDropDown(hBlk, xlate('With respect to CS:                '), 'ReferenceFrame', cellhorzcat(xlate('Absolute (World)'), xlate('Local (Body CS)')), 1.0);
        % 172 177
        % 173 177
        % 174 177
        % 175 177
        torqueUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Applied torque'), 'Torque', xlate('Units: '), 'TorqueUnits', false, mech_getDefaultUnit('torque'));
        % 177 181
        % 178 181
        % 179 181
        forceUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Applied force'), 'Force', xlate('Units: '), 'ForceUnits', false, mech_getDefaultUnit('force'));
        % 181 186
        % 182 186
        % 183 186
        % 184 186
        signalParamPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Generalized forces'), 'Flat');
        % 186 188
        signalParamPanel.Items = horzcat(torqueUnit, forceUnit);
        % 188 190
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Actuation'));
        paramPanel.Items = horzcat(refSysCombo, signalParamPanel);
        % 191 193
        myBlder.Items = horzcat(descPnl, paramPanel);
    case 'BodySensor'
        % 194 197
        % 195 197
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        % 197 199
        testCombo = PMDialogs.PmDropDown(hBlk, xlate('With respect to CS:            '), 'ReferenceFrame', cellhorzcat(xlate('Absolute (World)'), xlate('Local (Body CS)')), 1.0);
        % 199 203
        % 200 203
        % 201 203
        posUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Position [x;y;z]'), 'CoordPosition', xlate('Units: '), 'CoordPositionUnits', false, mech_getDefaultUnit('lin_pos'));
        % 203 207
        % 204 207
        % 205 207
        velUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Velocity [x'';y'';z'']'), 'Velocity', xlate('Units: '), 'VelocityUnits', false, mech_getDefaultUnit('lin_vel'));
        % 207 211
        % 208 211
        % 209 211
        acelUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Acceleration [x'''';y'''';z'''']'), 'Acceleration', xlate('Units: '), 'AccelerationUnits', false, mech_getDefaultUnit('lin_acc'));
        % 211 216
        % 212 216
        % 213 216
        % 214 216
        arcAng = PMDialogs.PmCheckBox(hBlk, xlate('Rotation matrix [3 x 3]:'), 'Pose', 1.0);
        % 216 219
        % 217 219
        arcVelUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Angular velocity [Rx'';Ry'';Rz'']'), 'ArcVelocity', xlate('Units: '), 'ArcVelocityUnits', false, mech_getDefaultUnit('ang_vel'));
        % 219 224
        % 220 224
        % 221 224
        % 222 224
        arcAcelUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Angular acceleration [Rx'''';Ry'''';Rz'''']'), 'ArcAcceleration', xlate('Units: '), 'ArcAccelerationUnits', false, mech_getDefaultUnit('ang_acc'));
        % 224 229
        % 225 229
        % 226 229
        % 227 229
        midPanel = PMDialogs.PmGroupPanel(hBlk, '', 'Flat');
        midPanel.Items = horzcat(posUnit, velUnit, arcVelUnit, arcAng, acelUnit, arcAcelUnit);
        % 230 232
        widthChk = PMDialogs.PmCheckBox(hBlk, xlate('Output selected parameters as one signal.'), 'Muxed', 1.0);
        % 232 234
        widthPanel = PMDialogs.PmGroupPanel(hBlk, '', 'Flat');
        widthPanel.Items = widthChk;
        % 235 237
        paramPanel = PMDialogs.PmGroupPanel(hBlk, pm_message('mechanical:mech_dialogs:TitleMeasurements'), 'Box', '3ColLayout');
        % 237 240
        % 238 240
        paramPanel.Items = horzcat(testCombo, midPanel, widthPanel);
        % 240 242
        myBlder.Items = horzcat(descPnl, paramPanel);
    case 'JointActuator'
        % 243 246
        % 244 246
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        paramPnl = MECH.PmMechJointActuatePanel(hBlk);
        % 247 249
        myBlder.Items = horzcat(descPnl, paramPnl);
    case 'JointSensor'
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        paramPnl = MECH.PmMechJointSensorPanel(hBlk);
        myBlder.Items = horzcat(descPnl, paramPnl);
    case 'InitialCondition'
        % 254 256
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        jtICPnl = MECH.PmMechJointICPanel(hBlk);
        actuatePanel = PMDialogs.PmGroupPanel(hBlk, pm_message('mechanical:mech_dialogs:TitleActuation'));
        % 258 260
        actuatePanel.Items = jtICPnl;
        myBlder.Items = horzcat(descPnl, actuatePanel);
    case 'ConstraintActuator'
        % 262 264
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        drverPnl = MECH.PmMechDriverActuatorPanel(hBlk);
        myBlder.Items = horzcat(descPnl, drverPnl);
    case 'ConstraintSensor'
        % 267 270
        % 268 270
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        reactForcUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Reaction force'), 'ReactionForce', xlate('Units: '), 'ForceUnits', false, mech_getDefaultUnit('force'));
        % 271 275
        % 272 275
        % 273 275
        reactTorqUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Reaction torque'), 'ReactionMoment', xlate('Units: '), 'MomentUnits', false, mech_getDefaultUnit('torque'));
        % 275 280
        % 276 280
        % 277 280
        % 278 280
        sideCombo = PMDialogs.PmDropDown(hBlk, xlate('Reaction measured on:                          '), 'SensedSide', cellhorzcat(xlate('Base'), xlate('Follower')), 1.0, '', [], {'Base';'Follower'});
        % 280 285
        % 281 285
        % 282 285
        % 283 285
        refSysCombo = PMDialogs.PmDropDown(hBlk, xlate('With respect to CS:        '), 'ReferenceFrame', cellhorzcat(xlate('Absolute (World)'), xlate('Local (Body CS)')), 1.0, '', [], {'Absolute (World)';'Local (Body CS)'});
        % 285 290
        % 286 290
        % 287 290
        % 288 290
        widthChk = PMDialogs.PmCheckBox(hBlk, xlate('Output selected parameters as one signal.'), 'Muxed', 1.0);
        % 290 293
        % 291 293
        spacer = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
        % 293 295
        reactPanel = PMDialogs.PmGroupPanel(hBlk, pm_message('mechanical:mech_dialogs:TitleMeasurements'), 'Box', '3ColLayout');
        % 295 298
        % 296 298
        reactPanel.Items = horzcat(sideCombo, refSysCombo, reactTorqUnit, reactForcUnit, spacer, widthChk);
        % 298 300
        myBlder.Items = horzcat(descPnl, reactPanel);
    case 'BodyActuatorMassInertia'
        % 301 304
        % 302 304
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        % 304 306
        massUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Mass'), 'Mass', xlate('Units: '), 'MassUnits', false, mech_getDefaultUnit('mass'));
        % 306 310
        % 307 310
        % 308 310
        intertiaUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Inertia tensor'), 'Inertia', xlate('Units: '), 'InertiaUnits', false, mech_getDefaultUnit('inertia'));
        % 310 315
        % 311 315
        % 312 315
        % 313 315
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Actuation'), 'Box', '3ColLayout');
        % 315 317
        paramPanel.Items = horzcat(massUnit, intertiaUnit);
        % 317 319
        myBlder.Items = horzcat(descPnl, paramPanel);
    case 'JointStictionActuator'
        % 320 322
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        sticPnl = MECH.PmMechStictionPanel(hBlk);
        myBlder.Items = horzcat(descPnl, sticPnl);
    case 'GearConstraint'
        % 325 328
        % 326 328
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'NumSAPorts', xlate('Number of sensor ports:'));
        % 329 331
        baseUnitPnl = PMDialogs.PmEditUnit(hBlk, xlate('Base pitch circle radius:      '), 1.0, xlate('Base Pitch Circle Radius'), 'BaseRadius', xlate('Base Pitch Circle Radius Units'), 'BaseRadiusUnits', mech_getDefaultUnit('lin_pos'));
        % 331 335
        % 332 335
        % 333 335
        folwrUnitPnl = PMDialogs.PmEditUnit(hBlk, xlate('Follower pitch circle radius: '), 1.0, xlate('Follower Pitch Circle Radius'), 'FollowerRadius', xlate('Follower Pitch Circle Radius Units'), 'FollowerRadiusUnits', mech_getDefaultUnit('lin_pos'));
        % 335 340
        % 336 340
        % 337 340
        % 338 340
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'), 'VerticalAlignment');
        paramPanel.Items = horzcat(baseUnitPnl, folwrUnitPnl);
        % 341 343
        myBlder.Items = horzcat(descPnl, connPnl, paramPanel);
    case 'DistanceDriver'
        % 344 347
        % 345 347
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'NumSAPorts', xlate('Number of sensor / actuator ports:'));
        myBlder.Items = horzcat(descPnl, connPnl);
    case 'LinearDriver'
        % 350 353
        % 351 353
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'NumSAPorts', xlate('Number of sensor / actuator ports:'));
        % 354 356
        coordChoices = {'X','Y','Z'};
        % 356 358
        coordCombo = PMDialogs.PmDropDown(hBlk, xlate('World Axis:'), 'GlobalCoordinate', coordChoices, 1.0);
        % 358 362
        % 359 362
        % 360 362
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'));
        paramPanel.Items = coordCombo;
        % 363 365
        myBlder.Items = horzcat(descPnl, connPnl, paramPanel);
    case 'ParallelConstraint'
        % 366 369
        % 367 369
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'NumSAPorts', xlate('Number of sensor ports:'));
        % 370 372
        vectPnl = MECH.PmMechVectorCoordSys(hBlk, 'f', 4.0, xlate('Parallel Constraint Axis [x y z]'), 'Axis', xlate('Reference CS'), 'Csys', 0.0);
        % 372 377
        % 373 377
        % 374 377
        % 375 377
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'));
        paramPanel.Items = vectPnl;
        % 378 380
        myBlder.Items = horzcat(descPnl, connPnl, paramPanel);
    case 'AngleDriver'
        % 381 384
        % 382 384
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'NumSAPorts', xlate('Number of sensor / actuator ports:'));
        % 385 387
        baseVectPnl = MECH.PmMechVectorCoordSys(hBlk, 'On Base:', 3.0, xlate('Fixed axis [x y z]'), 'LeftAxis', xlate('Reference CS'), 'LeftCsys', 0.0);
        % 387 392
        % 388 392
        % 389 392
        % 390 392
        folwrVectPnl = MECH.PmMechVectorCoordSys(hBlk, 'On Follower:', 1.0, xlate('Axis on Follower'), 'RightAxis', xlate('Reference CS'), 'RightCsys', 0.0);
        % 392 397
        % 393 397
        % 394 397
        % 395 397
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'));
        paramPanel.Items = horzcat(baseVectPnl, folwrVectPnl);
        % 398 400
        myBlder.Items = horzcat(descPnl, connPnl, paramPanel);
    case 'ConstantVelocity'
        % 401 404
        % 402 404
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'NumSAPorts', xlate('Number of sensor / actuator ports:'));
        % 405 407
        angVelUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Angular velocity:'), 'Unit_Omega', 1.0, mech_getDefaultUnit('ang_vel'));
        % 407 410
        % 408 410
        linVelUnit = PMDialogs.PmUnitSelect(hBlk, xlate('  Linear velocity:'), 'Unit_V', 1.0, mech_getDefaultUnit('lin_vel'));
        % 410 413
        % 411 413
        unitsPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Units'), 'Flat');
        % 413 415
        unitsPanel.Items = horzcat(angVelUnit, linVelUnit);
        % 415 417
        axisHdrLabel = '                       [x y z]';
        csHdrLabel = '        Fixed in CS';
        % 418 420
        baseAngVPnl = MECH.PmMechVectorCoordSys(hBlk, xlate('Angular velocity:'), 3.0, xlate(axisHdrLabel), 'Coef_Omega_Base', xlate(csHdrLabel), 'Csys_Omega_Base', 1.0);
        % 420 425
        % 421 425
        % 422 425
        % 423 425
        baseLinVPnl = MECH.PmMechVectorCoordSys(hBlk, xlate('  Linear velocity:'), 1.0, xlate(axisHdrLabel), 'Coef_V_Base', xlate(csHdrLabel), 'Csys_V_Base', 1.0);
        % 425 430
        % 426 430
        % 427 430
        % 428 430
        baseParamPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Base velocity coefficients'), 'Flat');
        % 430 432
        baseParamPanel.Items = horzcat(baseAngVPnl, baseLinVPnl);
        % 432 434
        folwrAngVPnl = MECH.PmMechVectorCoordSys(hBlk, xlate('Angular velocity:'), 3.0, xlate(axisHdrLabel), 'Coef_Omega_Follower', xlate(csHdrLabel), 'Csys_Omega_Follower', 2.0);
        % 434 439
        % 435 439
        % 436 439
        % 437 439
        folwrLinVPnl = MECH.PmMechVectorCoordSys(hBlk, xlate('  Linear velocity:'), 1.0, xlate(axisHdrLabel), 'Coef_V_Follower', xlate(csHdrLabel), 'Csys_V_Follower', 2.0);
        % 439 444
        % 440 444
        % 441 444
        % 442 444
        folwrParamPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Follower velocity coefficients'), 'Flat');
        % 444 446
        folwrParamPanel.Items = horzcat(folwrAngVPnl, folwrLinVPnl);
        % 446 448
        spacer = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
        paramPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Parameters'));
        paramPanel.Items = horzcat(unitsPanel, spacer, baseParamPanel, spacer, folwrParamPanel, spacer);
        % 450 452
        myBlder.Items = horzcat(descPnl, connPnl, paramPanel);
    case 'BranchingBar'
        % 453 456
        % 454 456
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        portPnl = MECH.PmMechBranchBarPanel(hBlk, xlate('Number of branches:'));
        myBlder.Items = horzcat(descPnl, portPnl);
    case 'PointCurve'
        % 459 461
        descPnl = PMDialogs.PmDescriptionPanel(hBlk);
        connPnl = MECH.PmMechConnPanel(hBlk, 'NumSAPorts', xlate('Number of sensor ports:'), xlate('Point location:'), xlate('Curve location:'));
        % 462 466
        % 463 466
        % 464 466
        splinePnl = MECH.PmMechPtCurvePanel(hBlk);
        myBlder.Items = horzcat(descPnl, connPnl, splinePnl);
    otherwise
        % 468 471
        % 469 471
        blockRecognized = false;
    end
    % 472 475
    % 473 475
    schema = [];
    % 475 477
    if blockRecognized
        [status, schema] = myBlder.getPmSchema(schema);
    end
end
function canAccessSchema = lDoesBlockHaveSchema(hBlk, clsName)
    % 481 487
    % 482 487
    % 483 487
    % 484 487
    % 485 487
    canAccessSchema = false;
    % 487 489
    persistent supported_classes;
    % 489 491
    if strcmpi(clsName, 'joint') && strcmpi(get_param(hBlk, 'SubClassName'), 'custom_joint')
        % 491 493
        clsName = 'custom_joint';
    end
    % 494 497
    % 495 497
    if isempty(supported_classes)
        supported_classes = {'Ground','Joint','PlanarJoint','BearingJoint','InplaneJoint','CylindricalJoint','ScrewJoint','DisassembledCylindrical','DisassembledRevolute','DisassembledPrismatic','DisassembledSpherical','MasslessRR','MasslessRS','MasslessSS','GearConstraint','DistanceDriver','LinearDriver','ParallelConstraint','AngleDriver','ConstantVelocity','BranchingBar','ConstraintActuator','ConstraintSensor','BodyActuatorMassInertia','JointStictionActuator','BodyForceElement','JointSpringDamper','BodyActuatorForceTorque','BodySensor','JointActuator','JointSensor','InitialCondition','Body','custom_joint','PointCurve'};
        % 498 509
        % 499 509
        % 500 509
        % 501 509
        % 502 509
        % 503 509
        % 504 509
        % 505 509
        % 506 509
        % 507 509
    end
    % 509 511
    canAccessSchema = any(strcmpi(clsName, supported_classes));
end
